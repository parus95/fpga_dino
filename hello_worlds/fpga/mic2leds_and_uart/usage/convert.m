DATA = fread(fopen('data.bin', 'rb'), Inf, 'int8');

audiowrite('data.wav', DATA/max(DATA), 5000)
