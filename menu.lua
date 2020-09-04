local composer = require("composer")
local scene = composer.newScene()
local widget = require("widget")

local physics = require("physics")
physics.start()
physics.setGravity( 0, 0 )

display.setStatusBar( display.HiddenStatusBar )

W = display.contentWidth   -- Largura da tela
H = display.contentHeight  -- Altura da tela

local backGroup = display.newGroup()
local mainGroup = display.newGroup()
local uiGroup = display.newGroup()

function scene:create( event )
     
    local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen
        
        local background = display.newImageRect( backGroup, 'img/background/back.png', 1250, 700)
        background.x = display.contentCenterX
		background.y = display.contentCenterY
		
		gameLoopTimer = timer.performWithDelay( 500, gameLoop, 0 )

		local logo = display.newImageRect( mainGroup, 'img/logo.png', 250, 90)
        logo.x = display.contentCenterX 
        logo.y = display.contentCenterY - 60

		local personagem = display.newImageRect( backGroup, 'img/background/anny.png', 110, 75)
		personagem.x = display.contentCenterX - 190
		personagem.y = display.contentCenterY + 80

		local function movePersonagemMenu()
			local limitePersonagem = math.random(personagem.y - 5, personagem.y + 5)

			if(limitePersonagem > H) then
			 limitePersonagem = H - 5

			elseif(limitePersonagem < 0) then
			 limitePersonagem = 5
			end 

			transition.moveTo( personagem, { x=personagem.x, y=limitePersonagem, time=300 } )
		end

		local movePersonagemTimer = timer.performWithDelay(500, movePersonagemMenu, 2000)

		local function onPress( event )
			print("B5 pressed")
			timer.performWithDelay(3000, function() event.target:removeSelf(); end)
		end

        local button_play = widget.newButton
        {
            left = 160,
            top = 180,
            width = 150,
            height = 40,
            defaultFile = 'img/botoes/play.png',
			overFile = 'img/botoes/play.png',
			onPress = onPress
        }


		local button_ap = widget.newButton
        {
            left = 160,
            top = 235,
            width = 150,
            height = 40,
            defaultFile = 'img/botoes/ap.png',
			overFile = 'img/botoes/ap.png',
			onPress = onPress
        }

end

-- Estudar eventos abaixo    
     
-- show()
function scene:show( event )
     
    local sceneGroup = self.view
    local phase = event.phase
     
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
     
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
     
    end
end
     
     
-- hide()
function scene:hide( event )
     
    local sceneGroup = self.view
    local phase = event.phase
     
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
     
    elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen
	
     
	end
end
     
     
-- destroy()
function scene:destroy( event )
     
    local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

     
end
     
     
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
--scene:addEventListener( "show", scene )
--scene:addEventListener( "hide", scene )
--scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
     
return scene