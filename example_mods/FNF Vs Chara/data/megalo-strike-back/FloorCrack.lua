floorcrack = false
frame = 0
function onUpdate()
    setProperty('Crack.x', getProperty('dad.x')+97)
    setProperty('Crack.y', getProperty('dad.y')-17)

    if floorcrack == true then
        if getProperty('dad.animation.curAnim.name') == 'jumpAttackDOWN' then
            if getProperty('dad.animation.curAnim.curFrame') == 1 then
                makeAnimatedLuaSprite('Crack', 'Crack', getProperty('dad.x')+97, getProperty('dad.y')-17)
                addAnimationByPrefix('Crack', 'Crack', 'Crack idle', 24, false)
                setProperty('Crack.antialiasing', false)
                scaleObject('Crack', 3, 3)
                setProperty('Crack.flipX',false)
                addLuaSprite('Crack',false)
                setProperty('Crack.alpha',1)
            end 
            
        end

        if getProperty('PlantingChara.animation.curAnim.name') == 'DOWN' then
            if getProperty('PlantingChara.animation.curAnim.curFrame') == frame then
                makeAnimatedLuaSprite('Crack', 'Crack', 0, 0)
                addAnimationByPrefix('Crack', 'Crack', 'Crack idle', 24, false)
                setProperty('Crack.antialiasing', false)
                scaleObject('Crack', 3, 3)
                setProperty('Crack.flipX',false)
                addLuaSprite('Crack',false)
                setProperty('Crack.alpha',1)
                setProperty('Crack.color',getColorFromHex("EE0000"))
            end 
            
        end

    end

    if getProperty('Crack.animation.curAnim.curFrame') == 4 then
        doTweenAlpha('cracking', 'Crack', 0, 0.4, 'quadOut')
    end



    if curStep >= 704 and curStep < 796 then
        frame = 1
        floorcrack = true
    elseif curStep > 1864 and curStep< 1874 then 
        frame = 3
        floorcrack = true
    else 
        floorcrack = false
    end
end