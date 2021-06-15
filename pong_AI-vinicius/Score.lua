Score = Class{}

function Score:init()
    self.player1 = 0
    self.player2 = 0
end

function Score:update(player)
    if(player == 1) then
        self.player1 = self.player1 + 1
    else
        self.player2 = self.player2 + 1
    end
end

function Score:reset()
    self.player1 = 0
    self.player2 = 0
end

function Score:render()
        love.graphics.setFont(scoreFont)
        love.graphics.print(tostring(self.player1), VIRTUAL_WIDTH / 2 - 50,
            VIRTUAL_HEIGHT / 3)
        love.graphics.print(tostring(self.player2), VIRTUAL_WIDTH / 2 + 30,
            VIRTUAL_HEIGHT / 3)
    end
