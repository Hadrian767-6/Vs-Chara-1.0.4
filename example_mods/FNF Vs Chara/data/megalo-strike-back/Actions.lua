function onStepHit()
    if curStep == 32 then
        if not downscroll then
            makeLuaSprite('FIGHT', 'ACTIONS/FIGHT', 190, 450)
        else
            makeLuaSprite('FIGHT', 'ACTIONS/FIGHT', 190, 30)
        end
            setObjectCamera('FIGHT', 'other')
            scaleObject('FIGHT', 3, 3)
            setProperty('FIGHT.antialiasing', false)
            addLuaSprite('FIGHT', true)
    end

    if curStep == 34 then
        removeLuaSprite('FIGHT')
    end

    if curStep == 478 then
        if not downscroll then
            makeLuaSprite('Heal', 'ACTIONS/ITEMS', 190, 450)
        else
            makeLuaSprite('Heal', 'ACTIONS/ITEMS', 190, 30)
        end
            setObjectCamera('Heal', 'other')
            scaleObject('Heal', 3, 3)
            setProperty('Heal.antialiasing', false)
            addLuaSprite('Heal', true)
    end

    if curStep == 479 then
        if not downscroll then
            makeAnimatedLuaSprite('Heal', 'ACTIONS/I.noodles', 190, 450)
        else
            makeAnimatedLuaSprite('Heal', 'ACTIONS/I.noodles', 190, 30)
        end
            addAnimationByPrefix('Heal', 'dialogue1', 'text idle', 24, false)
            setObjectCamera('Heal', 'other')
            scaleObject('Heal', 3, 3)
            setProperty('Heal.antialiasing', false)
            addLuaSprite('Heal', true)
    end

    if curStep == 480 then
        removeLuaSprite('Heal')
    end

    if curStep == 1410 then
        if not downscroll then
            makeLuaSprite('Heal2', 'ACTIONS/ITEMS2 P1', 190, 450)
        else
            makeLuaSprite('Heal2', 'ACTIONS/ITEMS2 P1', 190, 30)
        end
            setObjectCamera('Heal2', 'other')
            scaleObject('Heal2', 3, 3)
            setProperty('Heal2.antialiasing', false)
            addLuaSprite('Heal2', true)
    end

    if curStep == 1412 then
        if not downscroll then
            makeLuaSprite('Heal2', 'ACTIONS/ITEMS2 P2', 190, 450)
        else
            makeLuaSprite('Heal2', 'ACTIONS/ITEMS2 P2', 190, 30)
        end
            setObjectCamera('Heal2', 'other')
            scaleObject('Heal2', 3, 3)
            setProperty('Heal2.antialiasing', false)
            addLuaSprite('Heal2', true)
    end

    if curStep == 1414 then
        if not downscroll then
            makeAnimatedLuaSprite('Heal2', 'ACTIONS/C.Bun', 190, 450)
        else
            makeAnimatedLuaSprite('Heal2', 'ACTIONS/C.Bun', 190, 30)
        end
            addAnimationByPrefix('Heal2', 'dialogue1', 'text idle', 24, false)
            setObjectCamera('Heal2', 'other')
            scaleObject('Heal2', 3, 3)
            setProperty('Heal2.antialiasing', false)
            addLuaSprite('Heal2', true)
    end

    if curStep == 1416 then
        removeLuaSprite('Heal2')
    end

    if curStep == 2256 then
        if not downscroll then
            makeLuaSprite('SPARE', 'ACTIONS/Spare', 190, 450)
        else
            makeLuaSprite('SPARE', 'ACTIONS/Spare', 190, 30)
        end
            setObjectCamera('SPARE', 'other')
            scaleObject('SPARE', 3, 3)
            setProperty('SPARE.antialiasing', false)
            addLuaSprite('SPARE', true)
    end
    
    if curStep == 2288 then
        removeLuaSprite('SPARE')
    end

    if curStep == 2512 then
        if not downscroll then
            makeLuaSprite('Check', 'ACTIONS/ACTIONS', 190, 450)
        else
            makeLuaSprite('Check', 'ACTIONS/ACTIONS', 190, 30)
        end
            setObjectCamera('Check', 'other')
            scaleObject('Check', 3, 3)
            setProperty('Check.antialiasing', false)
            addLuaSprite('Check', true)
    end

    if curStep == 2514 then
        if not downscroll then
            makeLuaSprite('Taunt', 'ACTIONS/ACTIONS2', 190, 450)
        else
            makeLuaSprite('Taunt', 'ACTIONS/ACTIONS2', 190, 30)
        end
            setObjectCamera('Taunt', 'other')
            scaleObject('Taunt', 3, 3)
            setProperty('Taunt.antialiasing', false)
            addLuaSprite('Taunt', true)
    end

    if curStep == 2544 then 
        removeLuaSprite('Taunt')
        removeLuaSprite('Check')
    end
end