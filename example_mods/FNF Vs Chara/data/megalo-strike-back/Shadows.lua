ShadowC1 = nil
ShadowC2 = nil
ShadowC3 = nil
shadowBF1 = nil
shadowBF2 = nil
shadowBF3 = nil


function onCreate()
    
    if shadowC1 == nil then
        setProperty('CHARA1.alpha',0)
    end

    if ShadowC1 == true then
        setProperty('CHARA1.alpha',1)
    end

    
    if shadowC2 == nil then
        setProperty('CHARA2.alpha',0)
    end

    if ShadowC2 == true then
        setProperty('CHARA2.visible',true)
        setProperty('CHARA2.alpha',1)
    end


    if shadowC3 == nil then
        setProperty('CHARA3.alpha',0)
    end

    if ShadowC3 == true then
        setProperty('CHARA3.visible',true)
        setProperty('CHARA3.alpha',1)
    end

    if shadowC4 == nil then
        setProperty('CHARA4.alpha',0)
    end

    if ShadowC4 == true then
        setProperty('CHARA4.alpha',1)
    end

    if shadowC5 == nil then
        setProperty('CHARA5.alpha',0)
    end

    if ShadowC5 == true then
        setProperty('CHARA5.alpha',1)
    end

    if shadowBF1 == nil then
        setProperty('BF1.alpha',0)
    end

    if shadowBF1 == true then
        setProperty('BF1.alpha',1)
    end
    

    if shadowBF2 == nil then
        setProperty('BF2.alpha',0)
    end

    if shadowBF2 == true then
        setProperty('BF2.visible',true)
        setProperty('BF2.alpha',1)
    end
    

    if shadowBF3 == nil then
        setProperty('BF3.alpha',0)
    end

    if shadowBF3 == true then
        setProperty('BF3.visible',true)
        setProperty('BF3.alpha',1)
    end
end

function onTweenCompleted(tag)
    if tag == 'fadeOutShadowC1' then
        ShadowC1 = nil 
    end
    
    if tag == 'fadeOutShadowC2' then
        setProperty('CHARA2.visible',false)
        ShadowC2 = nil 
    end
    
    if tag == 'fadeOutShadowC3' then
        setProperty('CHARA3.visible',false)
        ShadowC3 = nil 
    end

    if tag == 'fadeOutShadowBF1' then
        shadowBF1 = nil 
    end
    
    if tag == 'fadeOutShadowBF2' then
        setProperty('BF2.visible',false)
        shadowBF2 = nil 
    end
    
    if tag == 'fadeOutShadowBF3' then
        setProperty('BF3.visible',false)
        shadowBF3 = nil 
    end
end

function onUpdate()

    setProperty('CHARA4.alpha',getProperty('CHARA1.alpha'))
    setProperty('CHARA5.alpha',getProperty('CHARA1.alpha'))

    function goodNoteHit(id, noteData, noteType, isSustainNote)
        if noteType == 'ShadowBFDash' then
            setProperty('BF4.visible',true)
        end

        if noteType == 'Shadow_BF' then
            setProperty('BF1.visible',true)
        end
    end
    

    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteType == 'Shadow_Chara' then
            setProperty('CHARA1.visible',true)
            setProperty('CHARA4.visible',false)
            setProperty('CHARA5.visible',false)
        end

        if noteType == 'Shadow_Clash' then
            setProperty('CHARA4.visible',true)
            setProperty('CHARA1.visible',false)
            setProperty('CHARA5.visible',false)
        end
        
        if noteType == 'ShadowDashChara' then
            setProperty('CHARA5.visible',true)
            setProperty('CHARA4.visible',false)
            setProperty('CHARA1.visible',false)
        end
    end

    if getProperty('BF1.visible') == true then
        setProperty('BF4.visible',false)
    elseif getProperty('BF4.visible') == true then
        setProperty('BF1.visible',false)
    end
end

function onStepHit()

    if curStep == 136 then
        ShadowC1 = true
    end

    if curStep == 144 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 170 then
        ShadowC3 = true
    end

    if curStep == 176 then
        doTweenAlpha('fadeOutShadowC3', 'CHARA3', 0, 0.5, 'quadOut')
    end

    if curStep == 184 then
        ShadowC1 = true
    end

    if curStep == 190 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end
    
    if curStep == 254 then
        ShadowC1 = true
    end

    if curStep == 262 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 412 then
        ShadowBF3 = true
        playSound('hurt', 1)
        triggerEvent('Play Animation', 'hurtUP', 'dad')
    end

    if curStep == 416 then
        doTweenAlpha('fadeOutShadowBF1', 'BF3', 0, 0.001, 'quadOut')
    end

    if curStep == 824 then
        ShadowC1 = true
        ShadowBF1 = true
    end

    if curStep == 828 then
        doTweenAlpha('fadeOutShadowBF1', 'BF1', 0, 0.5, 'quadOut')
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 912 then
        ShadowC3 = true
    end

    if curStep == 920 then
        doTweenAlpha('fadeOutShadowC3', 'CHARA3', 0, 0.5, 'quadOut')
    end

    if curStep == 968 then
        ShadowBF1 = true
    end

    if curStep == 976 then
        doTweenAlpha('fadeOutShadowBF1', 'BF1', 0, 0.5, 'quadOut')
    end

    if curStep == 984 then
        ShadowBF3 = true
    end

    if curStep == 992 then
        doTweenAlpha('fadeOutShadowBF3', 'BF3', 0, 0.5, 'quadOut')
    end

    if curStep == 1046 then
        ShadowC1 = true
    end

    if curStep == 1048 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 1568 then
        ShadowC1 = true
    end

    if curStep == 1582 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 1600 then
        ShadowB1 = true
    end

    if curStep == 1614 then
        doTweenAlpha('fadeOutShadowBF1', 'BF1', 0, 0.5, 'quadOut')
    end

    if curStep == 1664 then
        ShadowB1 = true
    end

    if curStep == 1680 then
        doTweenAlpha('fadeOutShadowBF1', 'BF1', 0, 0.5, 'quadOut')
    end

    if curStep == 1696 then
        ShadowC2 = true
    end

    if curStep == 1712 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end

    if curStep == 1728 then
        shadowBF2 = true
    end

    if curStep == 1744 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.5, 'quadOut')
        ShadowC1 = true
    end

    if curStep == 1748 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
        ShadowC2 = true
    end

    if curStep == 1755 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end

    if curStep == 1780 then
        shadowBF2 = true
    end

    if curStep == 1788 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.5, 'quadOut')
    end

    if curStep == 1952 then
        ShadowC2 = true
    end

    if curStep == 1968 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end
    
    if curStep == 2016 then
        ShadowC2 = true
    end

    if curStep == 2020 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end

    if curStep == 2048 then
        ShadowBF2 = true
    end

    if curStep == 2052 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.5, 'quadOut')
    end

    if curStep == 2144 then
        ShadowBF2 = true
        ShadowC2 = true
    end

    if curStep == 2148 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.5, 'quadOut')
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end

    if curStep == 2176 then
        ShadowBF2 = true
        ShadowC2 = true
    end

    if curStep == 2179 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.5, 'quadOut')
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.5, 'quadOut')
    end

    if curStep == 2488 then
        ShadowC1 = true
    end

    if curStep == 2496 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end

    if curStep == 2576 then
        ShadowBF1 = true
        ShadowC1 = true
    end

    if curStep == 2580 then
        doTweenAlpha('fadeOutShadowBF1', 'BF1', 0, 0.5, 'quadOut')
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.5, 'quadOut')
    end


    -- Loop
    if curStep == 1224 then
        ShadowC2 = true
    end

    if curStep == 1231 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.005, 'quadOut')
    end
    
    if curStep == 1232 then
        ShadowC1 = true
    end

    if curStep == 1240 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.001, 'quadOut')
        ShadowC2 = true
    end

    if curStep == 1248 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.005, 'quadOut')
        ShadowC1 = true
    end

    if curStep == 1250 then
        ShadowC3 = true
    end

    if curStep == 1256 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.001, 'quadOut')
        doTweenAlpha('fadeOutShadowC3', 'CHARA3', 0, 0.001, 'quadOut')
        ShadowC2 = true
    end

    if curStep == 1257 then
        ShadowC1 = true
    end

    if curStep == 1263 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.001, 'quadOut')
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.001, 'quadOut')
    end

    if curStep == 1264 then
        ShadowC1 = true
    end

    if curStep == 1272 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.001, 'quadOut')
        ShadowB2 = true
    end

    if curStep == 1280 then
        doTweenAlpha('fadeOutShadowBF2', 'BF2', 0, 0.001, 'quadOut')
        ShadowC1 = true
    end

    if curStep == 1288 then
        doTweenAlpha('fadeOutShadowC1', 'CHARA1', 0, 0.001, 'quadOut')
        ShadowC2 = true
    end

    if curStep == 1296 then
        doTweenAlpha('fadeOutShadowC2', 'CHARA2', 0, 0.005, 'quadOut')
        ShadowC1 = true
    end
    
    if curStep == 1308 then
        doTweenAlpha('fadeOutShadowC4', 'CHARA1', 0, 1, 'quadOut')
    end
end