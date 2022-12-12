function startRobot(X,Y,RGB,comPort)% (X,Y) þekilin bulunduðu konum(mm) ,RGB hangi reng oldugnu yansitir
    % fonksiyonu Merkez_reng(150,300,'R','COM4');
    % X=150(mm) Y=300(mm) 'R' 'COM4' þeklinde kullanabilirsiniz     
    SendData=serial(comPort,'BaudRate',112500); % seri haberleþme atkif hale getirildi.
    %serial(baðlý oldugu usb com'u ,BaudRate,112500 (protokol için haberleþme hýzý)

    switch RGB
        case 1
            rgb="A1";% arduino daki kýrmýz reng ledini kodu
        case 2
            rgb="B1";% arduino daki yesil reng ledini kodu
        case 3
            rgb="C1";% arduino daki mavi reng ledini kodu
        otherwise  
    end

    pause(0.1)
    disp('baglantý kuruldu')
    fopen(SendData);
    pause(2)
    fprintf(SendData,'%c',rgb);
    pause(0.1)
    disp('renk degiþimi yapýldý')
    
    fprintf(SendData,'G91');
    pause(0.1)

    fprintf(SendData,'G01 F5000000');% X,Y için çaliþma tipini G01 saglýyor F500000 ise çaliþma hýzý 
    pause(0.1)
    data= sprintf('X%.2f Y%.2f ',Y ,X); 
    fprintf("Koordinatlar \n\tX = %.2f\n\tY = %.2f",X,Y)
    fprintf(SendData,data); 
    pause(0.1)
    fclose(SendData);%seriali kapatýyor
    delete(SendData);% seriali siliyor 
    disp('baglantý kesildi')
  
end