function startRobot(X,Y,RGB,comPort)% (X,Y) �ekilin bulundu�u konum(mm) ,RGB hangi reng oldugnu yansitir
    % fonksiyonu Merkez_reng(150,300,'R','COM4');
    % X=150(mm) Y=300(mm) 'R' 'COM4' �eklinde kullanabilirsiniz     
    SendData=serial(comPort,'BaudRate',112500); % seri haberle�me atkif hale getirildi.
    %serial(ba�l� oldugu usb com'u ,BaudRate,112500 (protokol i�in haberle�me h�z�)

    switch RGB
        case 1
            rgb="A1";% arduino daki k�rm�z reng ledini kodu
        case 2
            rgb="B1";% arduino daki yesil reng ledini kodu
        case 3
            rgb="C1";% arduino daki mavi reng ledini kodu
        otherwise  
    end

    pause(0.1)
    disp('baglant� kuruldu')
    fopen(SendData);
    pause(2)
    fprintf(SendData,'%c',rgb);
    pause(0.1)
    disp('renk degi�imi yap�ld�')
    
    fprintf(SendData,'G91');
    pause(0.1)

    fprintf(SendData,'G01 F5000000');% X,Y i�in �ali�ma tipini G01 sagl�yor F500000 ise �ali�ma h�z� 
    pause(0.1)
    data= sprintf('X%.2f Y%.2f ',Y ,X); 
    fprintf("Koordinatlar \n\tX = %.2f\n\tY = %.2f",X,Y)
    fprintf(SendData,data); 
    pause(0.1)
    fclose(SendData);%seriali kapat�yor
    delete(SendData);% seriali siliyor 
    disp('baglant� kesildi')
  
end