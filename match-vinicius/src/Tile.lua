--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.r = math.random(255)/255
    self.g = math.random(255)/255
    self.b = math.random(255)/255

    Timer.every(0.2, function()
        self.r = math.random(255)/255
        self.g = math.random(255)/255
        self.b = math.random(255)/255
    end)
    
    self.shiny = math.random(20) == 5 and true or false
end

function Tile:render(x, y)
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)

    if self.shiny then
        love.graphics.setColor(self.r, self.g, self.b, 150/255)
        
        love.graphics.rectangle('line', (self.gridX - 1) * 32 + (VIRTUAL_WIDTH - 272) + 2, 
            (self.gridY - 1) * 32 + 18, 30, 30, 4)
    end
end