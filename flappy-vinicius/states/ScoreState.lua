--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local bronzeMedal = love.graphics.newImage('assets/images/bronze_medal.png')
local silverMedal = love.graphics.newImage('assets/images/silver_medal.png')
local goldenMedal = love.graphics.newImage('assets/images/golden_medal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Over!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if(self.score < 5) then
        love.graphics.setColor(0.8, 0.8, 0.3, 1)
        love.graphics.printf('Bronze Medal!', 0, 130, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(bronzeMedal, VIRTUAL_WIDTH/2 + 50, 120, 0, 0.1, 0.1)

    elseif self.score < 10 then
        love.graphics.setColor(0.3, 0.3, 0.3, 1)
        love.graphics.printf('Silver Medal!', 0, 120, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(silverMedal, VIRTUAL_WIDTH/2 + 50, 120, 0, 0.1, 0.1)


    else
        love.graphics.setColor(1, 1, 0, 1)
        love.graphics.printf('Golden Medal!', 0, 130, VIRTUAL_WIDTH, 'center')

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(goldenMedal, VIRTUAL_WIDTH/2 + 50, 120, 0, 0.1, 0.1)

    end
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end
