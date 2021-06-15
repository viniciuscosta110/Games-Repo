--[[
    Countdown State
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Counts down visually on the screen (3,2,1) so that the player knows the
    game is about to begin. Transitions to the PlayState as soon as the
    countdown is complete.
]]

PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.score = params.score
    self.pipePairs = params.pipePairs
    self.bird = params.bird
end

--[[
    Keeps track of how much time has passed and decreases count if the
    timer has exceeded our countdown time. If we have gone down to 0,
    we should transition to our PlayState.
]]
function PauseState:update(dt)
    if love.keyboard.wasPressed('p') then
    
        sounds['music']:play()

        gStateMachine:change('play',{
            score = self.score,
            pipePairs = self.pipePairs,
            bird = self.bird
        })
    end
end

function PauseState:render()
    -- render count big in the middle of the screen
    self.bird:render()
    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Paused', 0, 120, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press "p" to resume', 0, 160, VIRTUAL_WIDTH, 'center')
end