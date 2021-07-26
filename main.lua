display.setStatusBar( display.HiddenStatusBar );

_w = display.viewableContentWidth;
_h = display.viewableContentHeight;

display.setDefault( "anchorX", 0 );
display.setDefault( "anchorY", 0 );

local barraSuperior = display.newGroup();
local paper = display.newGroup();
local barraInferior = display.newGroup();

local selected_superior = display.newGroup();
local selected_tamanho = display.newGroup();
local selected_cor = display.newGroup();
local selected_surpresa = display.newGroup();

local line = display.newGroup();
local rectangle = display.newGroup();
local circle = display.newGroup();

local largura_barra_superior = 50;
local barra_superior = display.newRect(barraSuperior, 0, 0, _w + _w, largura_barra_superior);
barra_superior:setFillColor( 207/255, 157/255, 33/255 );

local papel = display.newRect(paper, 0, 50, _w, 380);
papel:setFillColor( 255/255, 255/255, 255/255 );

largura_barra_inferior = 50;
local barra_inferior = display.newRect(barraInferior, 0, 430, _w + _w, largura_barra_inferior);
barra_inferior:setFillColor( 207/255, 157/255, 33/255 );

local onLapis = false;
local onLinha = false;
local onRetangulo = false;
local onCirculo = false;
local onBorracha = false;

local three = false;
local five = false;
local ten = false;

local rosa = false;
local azul = false;
local amarelo = false;



local imagem0 = display.newImageRect(barraSuperior, "imagens/lapis.png", 30, 30);
imagem0.x = 64/4;
imagem0.y = 25/3;

local imagem1 = display.newImageRect(barraSuperior, "imagens/linha.jpg", 30, 30);
imagem1.x = (64*5)/4;
imagem1.y = (25)/3;

local imagem2 = display.newImageRect(barraSuperior, "imagens/retangulo.png", 30, 30);
imagem2.x = (64*9)/4;
imagem2.y = (25)/3;

local imagem3 = display.newImageRect(barraSuperior, "imagens/circulo.png", 30, 30);
imagem3.x = (64*13)/4;
imagem3.y = (25)/3;

local imagem4 = display.newImageRect(barraSuperior, "imagens/borracha.png", 30, 30);
imagem4.x = (64*17)/4;
imagem4.y = (25)/3;


local tamanho1 = display.newCircle(barraInferior, (128/3)*0.45, 452, 3 );
tamanho1:setFillColor( 0/255, 0/255, 0/255 );

local tamanho2 = display.newCircle(barraInferior, (128/3)*1.30, 450, 5 );
tamanho2:setFillColor( 0/255, 0/255, 0/255 );

local tamanho3 = display.newCircle(barraInferior, (128/3)*2.25, 445, 10 );
tamanho3:setFillColor( 0/255, 0/255, 0/255 );

local cor1 = display.newCircle(barraInferior, (128/3)*3.15, 440, 15 );
cor1:setFillColor( 255/255, 0/255, 255/255 );

local cor2 = display.newCircle(barraInferior, (128/3)*4.15, 440, 15 );
cor2:setFillColor( 0/255, 255/255, 255/255 );

local cor3 = display.newCircle(barraInferior, (128/3)*5.15, 440, 15 );
cor3:setFillColor( 255/255, 255/255, 0/255 );


local linha;
local retangulo;
local circulo;

local x_inicial;
local x_atual;
local x_anterior;
local y_inicial;
local y_atual;
local y_anterior;



local function tapMenuSuperior( posicao )
	if ( posicao.y >= 0 and posicao.y <= 50 and posicao.x >= 0 and posicao.x <= 64 ) then
	
		onLapis = true;
		onLinha = false;
		onRetangulo = false;
		onCirculo = false;
		onBorracha = false;
		onSurpresa = false;
		print("Lapis ativado");
	
	elseif ( posicao.y >= 0 and posicao.y <= 50 and posicao.x > 64 and posicao.x <= 128 ) then
	
		onLapis = false;
		onLinha = true;
		onRetangulo = false;
		onCirculo = false;
		onBorracha = false;
		onSurpresa = false;
		print("Linha ativada");
	
	elseif ( posicao.y >= 0 and posicao.y <= 50 and posicao.x > 128 and posicao.x <= 192 ) then
		
		onLapis = false;
		onLinha = false;
		onRetangulo = true;
		onCirculo = false;
		onBorracha = false;
		onSurpresa = false;
		print("Retangulo ativado");
	
	elseif ( posicao.y >= 0 and posicao.y <= 50 and posicao.x > 192 and posicao.x <= 256 ) then		local onLapis = false;

		onLapis = false;
		onLinha = false;
		onRetangulo = false;
		onCirculo = true;
		onBorracha = false;
		onSurpresa = false;
		print("Circulo ativado");
	
	elseif ( posicao.y >= 0 and posicao.y <= 50 and posicao.x > 256 and posicao.x <= 320 ) then
	
		onLapis = false;
		onLinha = false;
		onRetangulo = false;
		onCirculo = false;
		onBorracha = true;
		onSurpresa = false;
		print("Borracha ativada");
		paper:removeSelf();
		paper = display.newGroup();
		papel = display.newRect(paper, 0, 50, _w, 380);
		return true;

	end
end

local function tapMenuInferior( posicao )
	if ( posicao.y >= 450 and posicao.y <= 480 and posicao.x >= 0 and posicao.x <= 42.7 ) then
		
		three = true;
		five = false;
		ten = false;
		print("Espessura nivel 1 ativada");
	
	elseif ( posicao.y >= 430 and posicao.y <= 480 and posicao.x > 42.7 and posicao.x <= 85.4 ) then
		
		three = false;
		five = true;
		ten = false;
		print("Espessura nivel 2 ativada");
	
	elseif ( posicao.y >= 430 and posicao.y <= 480 and posicao.x > 85.4 and posicao.x <= 128.1 ) then
		
		three = false;
		five = false;
		ten = true;
		print("Espessura nivel 3 ativada");
	
	elseif ( posicao.y >= 430 and posicao.y <= 480 and posicao.x > 128.1 and posicao.x <= 170.8 ) then
		
		rosa = true;
		azul = false;
		amarelo = false;
		print("Cor rosa ativada");

	elseif ( posicao.y >= 430 and posicao.y <= 480 and posicao.x > 170.8 and posicao.x <= 213.5 ) then
		
		rosa = false;
		azul = true;
		amarelo = false;
		print("Cor azul ativada");

	elseif ( posicao.y >= 430 and posicao.y <= 480 and posicao.x > 213.5 and posicao.x <= 256.2 ) then
		
		rosa = false;
		azul = false;
		amarelo = true;
		print("Cor amarelo ");


	end
end

function funcao_desenho_3_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( rosa == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 3;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 3;
				    end  
				end
			end
		end
	end
end

function funcao_desenho_3_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( azul == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 3;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 3;
				    end  
				end
			end
		end
	end
end

function funcao_desenho_3_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( amarelo == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 3;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 3;
				    end
				end
			end
		end
	end
end

function funcao_desenho_5_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( rosa == true ) then
				if ( five == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 5;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 5;		    	
				    end
				end
			end
		end
	end
end

function funcao_desenho_5_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( azul == true ) then
				if ( five == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 5;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 5;
				    end 
				end
			end
		end
	end
end

function funcao_desenho_5_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( amarelo == true ) then
				if ( five == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 5;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 5;
				    end
				end
			end
		end
	end
end


function funcao_desenho_10_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( rosa == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 10;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 10;
				    end
				end
			end
		end
	end
end

function funcao_desenho_10_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( azul == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 10;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 10;
				    end 
				end
			end
		end
	end
end

function funcao_desenho_10_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLapis == true ) then
			if ( amarelo == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
				        x_inicial = event.x;
				        y_inicial = event.y;
				        x_atual = x_inicial;
				        y_atual = y_inicial;
				    elseif event.phase == "moved" then
				        x_anterior = x_atual;
				        y_anterior = y_atual;

				        x_atual = event.x;
				        y_atual = event.y;

				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 10;
				    	
				    elseif event.phase == "ended" then
				        linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual);
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 10;
				    end
				end
			end
		end
	end
end

function funcao_linha_3_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( rosa == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 3;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 3;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 3;
				    end
				end
			end
		end
	end
end

function funcao_linha_3_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( azul == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 3;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 3;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 3;
				    end  
				end
			end
		end
	end
end

function funcao_linha_3_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( amarelo == true ) then
				if ( three == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0 );
				    	linha.strokeWidth = 3;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 3;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 255/255, 0/255 );
				    	linha.strokeWidth = 3;
				    end     
				end
			end
		end
	end
end

function funcao_linha_5_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( rosa == true ) then
				if ( five == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 5;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 5;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 5;
				    end
				end
			end
		end
	end
end

function funcao_linha_5_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( azul == true ) then
				if ( five == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 5;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 5;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 5;
				    end 
				end
			end
		end
	end
end

function funcao_linha_5_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( amarelo == true ) then
				if ( five == true ) then
					if event.phase == "began" then
					   	x_anterior = event.x;
					   	y_anterior = event.y;
					   	x_atual = x_anterior;
	    		        y_atual = y_anterior;
					   	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
					   	linha:setStrokeColor( 255/255, 255/255, 0/255 );
					   	linha.strokeWidth = 5;
					elseif event.phase == "moved" then    
					   	x_atual = event.x;
					    y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 5;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 255/255, 0/255 );
				    	linha.strokeWidth = 5;
				    end
				end
			end
		end
	end
end


function funcao_linha_10_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( rosa == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 10;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 0/255, 255/255 );
				        linha.strokeWidth = 10;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 0/255, 255/255 );
				    	linha.strokeWidth = 10;
				    end
				end
			end
		end
	end
end

function funcao_linha_10_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( azul == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
				    	x_anterior = event.x;
				    	y_anterior = event.y;
				    	x_atual = x_anterior;
				        y_atual = y_anterior;
				    	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 10;
				    elseif event.phase == "moved" then    
				    	x_atual = event.x;
				        y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 0/255, 255/255, 255/255 );
				        linha.strokeWidth = 10;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 0/255, 255/255, 255/255 );
				    	linha.strokeWidth = 10;
				    end 
				end
			end
		end
	end
end

function funcao_linha_10_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onLinha == true ) then
			if ( amarelo == true ) then
				if ( ten == true ) then
					if event.phase == "began" then
					   	x_anterior = event.x;
					   	y_anterior = event.y;
					   	x_atual = x_anterior;
	    		        y_atual = y_anterior;
					   	linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
					   	linha:setStrokeColor( 255/255, 255/255, 0/255 );
					   	linha.strokeWidth = 10;
					elseif event.phase == "moved" then    
					   	x_atual = event.x;
					    y_atual = event.y;

				        display.remove(linha);

				        linha = display.newLine( line, x_anterior, y_anterior, x_atual, y_atual );
				        linha:setStrokeColor( 255/255, 255/255, 0/255 );
				        linha.strokeWidth = 10;
				    elseif event.phase == "ended" then
				    	linha = display.newLine( paper, x_anterior, y_anterior, x_atual, y_atual );
				    	linha:setStrokeColor( 255/255, 255/255, 0/255 );
				    	linha.strokeWidth = 10;
				    end
				end
			end
		end
	end
end

function funcao_retangulo_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onRetangulo == true ) then
			if ( rosa == true ) then
				if event.phase == "began" then
				   	x_inicial = event.x;
				   	y_inicial = event.y;

				   	x_atual = x_inicial;
				   	y_atual = x_inicial;

				   	retangulo = display.newRect( paper, x_inicial, y_inicial, x_atual - x_inicial, y_atual - y_inicial );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 0/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );
				elseif event.phase == "moved" then    
				    x_atual = event.x;
				    y_atual = event.y;

				    display.remove( retangulo );

				    retangulo.anchorX = 0;
					retangulo.anchorY = 0;
				    retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 0/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );

				elseif event.phase == "ended" then
				   	display.remove( retangulo );
					retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 0/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );    	
			    end
			end
		end
	end
end


function funcao_retangulo_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onRetangulo == true ) then
			if ( azul == true ) then
				if event.phase == "began" then
			    	x_inicial = event.x;
			    	y_inicial = event.y;

			    	x_atual = x_inicial;
			    	y_atual = x_inicial;

			    	retangulo = display.newRect( paper, x_inicial, y_inicial, x_atual - x_inicial, y_atual - y_inicial );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 0/255, 255/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );
			    elseif event.phase == "moved" then    
			    	x_atual = event.x;
			    	y_atual = event.y;
	
			    	display.remove( retangulo );

			    	retangulo.anchorX = 0;
					retangulo.anchorY = 0;
			    	retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 0/255, 255/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "ended" then
				   	display.remove( retangulo );
					retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 0/255, 255/255, 255/255 );
					retangulo:setStrokeColor( 1, 0, 0 );    	
			    end
			end
		end
	end
end

function funcao_retangulo_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onRetangulo == true ) then
			if ( amarelo == true ) then
				if event.phase == "began" then
			    	x_inicial = event.x;
			    	y_inicial = event.y;

			    	x_atual = x_inicial;
			    	y_atual = x_inicial;

			    	retangulo = display.newRect( paper, x_inicial, y_inicial, x_atual - x_inicial, y_atual - y_inicial );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 255/255, 0/255 );
					retangulo:setStrokeColor( 1, 0, 0 );
			    elseif event.phase == "moved" then    
			    	x_atual = event.x;
			    	y_atual = event.y;
	
			    	display.remove( retangulo );

			    	retangulo.anchorX = 0;
					retangulo.anchorY = 0;
			    	retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 255/255, 0/255 );
					retangulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "ended" then
				   	display.remove( retangulo );
					retangulo = display.newRect( paper, x_inicial, y_inicial, (x_atual - x_inicial), (y_atual - y_inicial) );
					retangulo.strokeWidth = 0;
					retangulo:setFillColor( 255/255, 255/255, 0/255 );
					retangulo:setStrokeColor( 1, 0, 0 );    	
			    end
			end
		end
	end
end

function funcao_circulo_rosa( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onCirculo == true ) then
			if ( rosa == true ) then
				if event.phase == "began" then
				   	x_inicial = event.x;
				   	y_inicial = event.y;

			    	x_atual = x_inicial;
			    	y_atual = x_inicial;

			    	--raio = x_inicial - ( x_atual / 2 );
			        raio = ( (x_atual - x_inicial) );

			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 0/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "moved" then    
			    	x_atual = event.x;
			    	y_atual = event.y;

			        raio = ( (x_atual - x_inicial) );
			    	
			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 0/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "ended" then
					circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 0/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );    	
			    end 
			end
		end
	end
end		


function funcao_circulo_azul( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onCirculo == true ) then
			if ( azul == true ) then
				if event.phase == "began" then
				   	x_inicial = event.x;
				   	y_inicial = event.y;

			    	x_atual = x_inicial;
			    	y_atual = x_inicial;

			        raio = ( (x_atual - x_inicial) );

			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 0/255, 255/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "moved" then    
			    	x_atual = event.x;
			    	y_atual = event.y;

			        raio = ( (x_atual - x_inicial) );
			    	
			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 0/255, 255/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "ended" then
					circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 0/255, 255/255, 255/255 );
			        circulo:setStrokeColor( 1, 0, 0 );     	
			    end 
			end
		end
	end
end	


function funcao_circulo_amarelo( event )
	if ( event.x >= 10 and event.x <= 310 and event.y >= 60 and event.y <= 410) then
		if ( onCirculo == true ) then
			if ( amarelo == true ) then
				if event.phase == "began" then
				   	x_inicial = event.x;
				   	y_inicial = event.y;

			    	x_atual = x_inicial;
			    	y_atual = x_inicial;

			  
			        raio = ( (x_atual - x_inicial) );

			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 255/255, 0/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "moved" then    
			    	x_atual = event.x;
			    	y_atual = event.y;

			        raio = ( (x_atual - x_inicial) );
			    	
			        display.remove( circulo );

			        circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 255/255, 0/255 );
			        circulo:setStrokeColor( 1, 0, 0 );

			    elseif event.phase == "ended" then
					circulo = display.newCircle( x_inicial, y_inicial, raio );
			        circulo.strokeWidth = 0;
			        circulo:setFillColor( 255/255, 255/255, 0/255 );
			        circulo:setStrokeColor( 1, 0, 0 );     	
			    end 
			end
		end
	end
end

local function onEnterFrame( ev )
	Runtime:addEventListener("touch", funcao_circulo_amarelo);
	Runtime:addEventListener("touch", funcao_circulo_azul);
	Runtime:addEventListener("touch", funcao_circulo_rosa);
	Runtime:addEventListener("touch", funcao_retangulo_amarelo);
	Runtime:addEventListener("touch", funcao_retangulo_azul);
	Runtime:addEventListener("touch", funcao_retangulo_rosa);
	Runtime:addEventListener("touch", funcao_linha_10_amarelo);
	Runtime:addEventListener("touch", funcao_linha_10_azul);
	Runtime:addEventListener("touch", funcao_linha_10_rosa);
	Runtime:addEventListener("touch", funcao_linha_5_amarelo);
	Runtime:addEventListener("touch", funcao_linha_5_azul);
	Runtime:addEventListener("touch", funcao_linha_5_rosa);
	Runtime:addEventListener("touch", funcao_linha_3_amarelo);
	Runtime:addEventListener("touch", funcao_linha_3_azul);
	Runtime:addEventListener("touch", funcao_linha_3_rosa);
	Runtime:addEventListener("touch", funcao_desenho_10_amarelo);
	Runtime:addEventListener("touch", funcao_desenho_10_azul);
	Runtime:addEventListener("touch", funcao_desenho_10_rosa);
	Runtime:addEventListener("touch", funcao_desenho_5_amarelo);
	Runtime:addEventListener("touch", funcao_desenho_5_azul);
	Runtime:addEventListener("touch", funcao_desenho_5_rosa);
	Runtime:addEventListener("touch", funcao_desenho_3_amarelo);
	Runtime:addEventListener("touch", funcao_desenho_3_azul);
	Runtime:addEventListener("touch", funcao_desenho_3_rosa);
	Runtime:addEventListener("tap", tapMenuInferior);
	Runtime:addEventListener("tap", tapMenuSuperior);

end

Runtime:addEventListener("enterFrame", onEnterFrame);
