const { app, BrowserWindow } = require('electron');
const path = require('path');
const url = require('url');

let mainWindow;

function createWindow()
{
  mainWindow = new BrowserWindow({
    width: 1000,
    height: 500,
    resizable: false,
    titleBarStyle: 'hidden'
  });

  mainWindow.loadURL(url.format({
    pathname: path.join(__dirname, "index.html"),
    protocol: 'file:',
    slashes: true
  }));

  mainWindow.on('closed', () => {
    mainWindow = null;
  });
  
  mainWindow.on('ready-to-show', () => {
	  mainWindow.show();
  });
}

app.on('ready', createWindow);
app.on('window-all-closed', () => {
  app.quit();
});
app.on('activate', () => {
  if (mainWindow === null) {
    createWindow();
  }
});

process.on('unhandledRejection', (promiseRejection) => {
  console.error(`[Unhandled Promise Error] ${promiseRejection.stack}`);
});
