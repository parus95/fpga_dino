const serialport = require('serialport')

let nonlinearFilterValue = 0;

serialport.list((err, list)=>{
    const portInfo = list.find(x=>x.pnpId && x.pnpId.startsWith("usb-Silicon_Labs_CP2104_USB_to_UART_Bridge_Controller"));
    if (!portInfo){
        console.log("Port not found");
        return;
    }
    const port = new serialport(portInfo.comName, {baudRate: 115200});
    let prev = 0;
    port.on('data', d=>{
        const abs = new Int8Array(d)
            .map(x=>Math.abs(x));

        abs.forEach(v => {
            const k = v > nonlinearFilterValue ? 0.6 : 0.999;
            nonlinearFilterValue = k * nonlinearFilterValue + (1 - k) * v;

            if (prev > v + 5){
                endJump(v / 128 * 200);
            } else if (v > 30){
                superJump();
            }
        });
        
        abs.filter(x=>x>50)
            .forEach(superJump);
    });
    
});

setInterval(() => {
    document.getElementById('ampl')
        .setAttribute("value", nonlinearFilterValue);
}, 10);
