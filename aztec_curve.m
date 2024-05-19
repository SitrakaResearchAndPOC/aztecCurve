% [x,y] = aztec_curve(2, [],[])
% plot(x,y)


% [x,y] = aztec_curve(3, [],[])
% plot(x,y)


function [xres,yres] = aztec_curve(k, x,y)
    [xres, yres] = A(k, x, y);    
end

function [xres, yres] = A(k, x, y)
    % [x, y] = A(1, [],[], 0, 0)
    if k == 1
        xcalc = [0 0 0 0 1 2 3 3 3 2 2 1 1 1 2 3];
        ycalc = [0 1 2 3 3 3 3 2 1 1 2 2 1 0 0 0];
        xres = [x xcalc];
        yres = [y ycalc];
    else
        [xA, yA] = A(k-1, x, y);
        decX = 0;
        decY = 0;
        if (length(x) == 0) || (length(y) == 0)
           decX= 0;
           decY = 0;
        else
            decX = x(length(x));
            decY = y(length(y));
        end
        
        xres = x;
        yres = y;
        %calculate b
        [xB, yB] = toB(xA,yA);
    
        %calculate c
        [xC, yC] = toC(xA, yA);

        %calculate d
        [xD, yD] = toD(xA, yA);

        % Calculate result
        % begin by concatenate
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
                
        % SHIFT UP
        decY = decY+1;
        
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
    
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT UP
        decY = decY+1;

        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT UP
        decY = decY+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT RIGHT
        decX = decX+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
        
        % SHIFT RIGHT
        decX = decX+1;
   
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
                
        % SHIFT RIGHT
        decX = decX+1;
   
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
   
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));
   
        % SHIFT DOWN
        decY = decY-1;
   
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];

        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        
        % DO D
        xres = [xres, xD+decX];
        yres = [yres, yD+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT LEFT
        decX = decX-1;
        
        % DO D
        xres = [xres, xD+decX];
        yres = [yres, yD+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT UP
        decY = decY+1;
        

        
        % DO B
        xres = [xres, xB+decX];
        yres = [yres, yB+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT LEFT
        decX = decX-1;
        

        
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        

        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT DOWN
        decY = decY-1;
        
        
        % DO C
        xres = [xres, xC+decX];
        yres = [yres, yC+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT RIGHT
        decX = decX+1;
        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        % calculat dec
        decX = xres(length(xres));
        decY = yres(length(yres));

        % SHIFT RIGHT
        decX = decX+1;

        
        % DO A
        xres = [xres, xA+decX];
        yres = [yres, yA+decY];
        
        
    end

end

function [xres, yres] = toB(x,y)
    x = x-x(length(x));
   % disp(x);
    x = flip(x);
    y = flip(y);
    xres = y;
    yres = -x;

end

function [xres, yres] = toC(x,y)
   [xcalc, ycalc] = toB(x,y);
   xres = -xcalc;
   yres = -ycalc;
end

function [xres, yres] = toD(x,y)
   %[xcalc, ycalc] = toB(x,y);
   xres = -x;
   yres = -y;

end

