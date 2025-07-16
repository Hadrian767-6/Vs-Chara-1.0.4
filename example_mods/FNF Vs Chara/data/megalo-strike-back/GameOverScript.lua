-- this gets updated with saves anyway it's just so the game doesn't throw a fucking fit
local deathcount = 0
local win = false

function onCreate()
	initSaveData('file0')
    --death
    deathcount = getDataFromSave('file0', 'deathcount') --THIS IS TO UPDATE THE VARIABLE ON FIRST LOAD!!! OTHERWISE THE GAME WON'T CHECK IF IT'S A NULL VALUE OR NOT PROPERLY!!!

    --now its the actual code
    if deathcount == null then
        setDataFromSave('file0', 'deathcount', 0)      
    end
    deathcount = getDataFromSave('file0', 'deathcount') 

    -- if you won before, overrides the textbox
    -- exactly the same code here just gets written differently in the stage lua
    win = getDataFromSave('file0', 'win') 
    if win == null then
        setDataFromSave('file0', 'win', false)      
    end
    win = getDataFromSave('file0', 'win') 
    flushSaveData('file0')
end

function onCreatePost()
    --resets the textboxes if you won like sans' fight in undertale
    if win == true then
        initSaveData('file0')
        setDataFromSave('file0', 'deathcount', 0)
        flushSaveData('file0')
        deathcount = getDataFromSave('file0', 'deathcount') 
    end
end

function onGameOverStart()

    --remove the fucking hud man go away!!!!!
    removeLuaSprite('hud')
    removeLuaSprite('hudEasy')
    removeLuaSprite('FILE3LOAD')
    removeLuaSprite('99999')
    removeLuaSprite('fc')
    removeLuaText('healthTxt')

    randomX = getRandomInt(-1500,700)
    randomY = getRandomInt(-300,0)
    randomX2 = getRandomInt(-1500,700)
    randomY2 = getRandomInt(-300,0)
    randomX3 = getRandomInt(-1500,700)
    randomY3 = getRandomInt(-300,0)
    randomX4 = getRandomInt(-1500,700)
    randomY4 = getRandomInt(-300,0)
    randomX5 = getRandomInt(-1500,700)
    randomY5 = getRandomInt(-300,0)

    randomTimeX = getRandomFloat(3,6)
    randomTimeX2 = getRandomFloat(3,6)
    randomTimeX3 = getRandomFloat(3,6)
    randomTimeX4 = getRandomFloat(3,6)
    randomTimeX5 = getRandomFloat(3,6)

    randomTimeY = getRandomFloat(0.6, 1.2)
    randomTimeY2 = getRandomFloat(0.6, 1.2)
    randomTimeY3 = getRandomFloat(0.6, 1.2)
    randomTimeY4 = getRandomFloat(0.6, 1.2)
    randomTimeY5 = getRandomFloat(0.6, 1.2)

    randomText = getRandomInt(0,5)


    playSound('hurt', 1)
    runTimer('break', 1)
    playMusic('gameOver', 0)

    makeLuaSprite('BLACKBG', 'BlackBG', 0, 0);
	scaleObject('BLACKBG', 3, 3);
	setObjectCamera('BLACKBG', 'other')
	setProperty('BLACKBG.alpha', 1)
	addLuaSprite('BLACKBG', false);

	makeAnimatedLuaSprite('soul', 'gameOverAssets', getProperty('boyfriend.x')+220, 540)
	addAnimationByPrefix('soul', 'SOUL', 'SAUL', 1, false)
	addAnimationByPrefix('soul', 'SOULBREAK', 'SOULBREAK', 1, false)
    objectPlayAnimation('soul', 'SOUL')
	setObjectCamera('soul', 'other')
    setProperty('soul.antialiasing', false)
    scaleObject('soul', 1.5, 1.5)
	addLuaSprite('soul', false)

    makeLuaSprite('BLACKGAMEOVER', 'BlackBG', 0, 0);
	scaleObject('BLACKGAMEOVER', 3, 3);
	setObjectCamera('BLACKGAMEOVER', 'other')
	setProperty('BLACKGAMEOVER.alpha', 0)
	addLuaSprite('BLACKGAMEOVER', true);
    
    

    function onUpdate(elapsed)
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
            soundFadeOut('manimdead', 2, 0)
            doTweenAlpha('BLACKNESS', 'BLACKGAMEOVER', 1, 2)
        end
    end

    function onTimerCompleted(tag)
        if tag == 'break' then
            playSound('soulSplit', 1)
            runTimer('shatter', 1.4)
            objectPlayAnimation('soul', 'SOULBREAK')
        end
    
        if tag == 'shatter' then
            playSound('soulshatter', 1)
            setProperty('soul.visible', false)
            runTimer('gameOver', 1.7)
    
            makeAnimatedLuaSprite('pellet1', 'gameOverAssets', getProperty('soul.x'), getProperty('soul.y'))
            addAnimationByPrefix('pellet1', 'petal', 'petals', 8, true)
            setProperty('pellet1.antialiasing', false)
            objectPlayAnimation('pellet1', 'petal')
            setObjectCamera('pellet1', 'other')
            scaleObject('pellet1', 1.5, 1.5)
            addLuaSprite('pellet1', false)
            doTweenX('pellet1XG', 'pellet1', getProperty('soul.x')+randomX, randomTimeX)
            doTweenY('pellet1YG', 'pellet1', getProperty('soul.y')+randomY, randomTimeY, 'quadOut')
    
            makeAnimatedLuaSprite('pellet2', 'gameOverAssets', getProperty('soul.x'), getProperty('soul.y'))
            addAnimationByPrefix('pellet2', 'petal', 'petals', 8, true)
            setProperty('pellet2.antialiasing', false)
            setObjectCamera('pellet2', 'other')
            objectPlayAnimation('pellet2', 'petal')
            scaleObject('pellet2', 1.5, 1.5)
            addLuaSprite('pellet2', false)
            doTweenX('pellet2XG', 'pellet2', getProperty('soul.x')+randomX2, randomTimeX2)
            doTweenY('pellet2YG', 'pellet2', getProperty('soul.y')+randomY2, randomTimeY2, 'quadOut')
    
            makeAnimatedLuaSprite('pellet3', 'gameOverAssets', getProperty('soul.x'), getProperty('soul.y'))
            addAnimationByPrefix('pellet3', 'petal', 'petals', 8, true)
            setObjectCamera('pellet3', 'other')
            setProperty('pellet3.antialiasing', false)
            objectPlayAnimation('pellet3', 'petal')
            scaleObject('pellet3', 1.5, 1.5)
            addLuaSprite('pellet3', false)
            doTweenX('pellet3XG', 'pellet3', getProperty('soul.x')+randomX3, randomTimeX3)
            doTweenY('pellet3YG', 'pellet3', getProperty('soul.y')+randomY3, randomTimeY3, 'quadOut')
    
            makeAnimatedLuaSprite('pellet4', 'gameOverAssets', getProperty('soul.x'), getProperty('soul.y'))
            addAnimationByPrefix('pellet4', 'petal', 'petals', 8, true)
            setProperty('pellet4.antialiasing', false)
            setObjectCamera('pellet4', 'other')
            objectPlayAnimation('pellet4', 'petal')
            scaleObject('pellet4', 1.5, 1.5)
            addLuaSprite('pellet4', false)
            doTweenX('pellet4XG', 'pellet4', getProperty('soul.x')+randomX4, randomTimeX4)
            doTweenY('pellet4YG', 'pellet4', getProperty('soul.y')+randomY4, randomTimeY4, 'quadOut')
    
            makeAnimatedLuaSprite('pellet5', 'gameOverAssets', getProperty('soul.x'), getProperty('soul.y'))
            addAnimationByPrefix('pellet5', 'petal', 'petals', 8, true)
            setProperty('pellet5.antialiasing', false)
            setObjectCamera('pellet5', 'other')
            objectPlayAnimation('pellet5', 'petal')
            scaleObject('pellet5', 1.5, 1.5)
            addLuaSprite('pellet5', false)
            doTweenX('pellet5XG', 'pellet5', getProperty('soul.x')+randomX5, randomTimeX5)
            doTweenY('pellet5YG', 'pellet5', getProperty('soul.y')+randomY5, randomTimeY5, 'quadOut')
        end
    
        if tag == 'gameOver' then
            playSound('gameOver', 1, 'manimdead')
            runTimer('goText', 1.5)
    
            makeAnimatedLuaSprite('gameover', 'gameOverAssets', 170, 0)
            addAnimationByPrefix('gameover', 'GAMEOVER', 'GAMEOVER', 1, false)
            setProperty('gameover.antialiasing', false)
            setObjectCamera('gameover', 'other')
            addLuaSprite('gameover', false)
            setProperty('gameover.alpha', 0)
            doTweenAlpha('gameoverA', 'gameover', 1, 2)
        end

    
        if tag == 'goText' then
            makeAnimatedLuaSprite('goText', 'gameover/goText'..randomText, 300, 450)
            addAnimationByPrefix('goText', 'line1', 'goText'..randomText..' idle', 12, false)
            setProperty('goText.antialiasing', false)
            scaleObject('goText', 3, 3)
            setObjectCamera('goText', 'other')
            addLuaSprite('goText', false)
        end
    end
    
    function onTweenCompleted(tag)
        if tag == 'pellet1YG' then
            doTweenY('pellet1Y2', 'pellet1', 1250, 2, 'quadIn')
        end
        if tag == 'pellet2YG' then
            doTweenY('pellet2Y2', 'pellet2', 1250, 2, 'quadIn')
        end
        if tag == 'pellet3YG' then
            doTweenY('pellet3Y2', 'pellet3', 1250, 2, 'quadIn')
        end
        if tag == 'pellet4YG' then
            doTweenY('pellet4Y2', 'pellet4', 1250, 2, 'quadIn')
        end
        if tag == 'pellet5YG' then
            doTweenY('pellet5Y2', 'pellet5', 1250, 2, 'quadIn')
        end
    end
end

function onSoundFinished(tag)
    if tag == 'manimdead' then
        playSound('gameOver', 1, 'manimdead')
    end
end


function onStepHit()
    --messy code to activate the textboxes depending on your save :)
    if curStep == 8 then
        if win == false then
                if not downscroll then
                    makeAnimatedLuaSprite('dialogue1', 'textbox/dialogue1', 190, 450)
                else
                    makeAnimatedLuaSprite('dialogue1', 'textbox/dialogue1', 190, 30)
                end
                setObjectCamera('dialogue1', 'other')
                addAnimationByPrefix('dialogue1', 'dialogue1', 'text idle', 24, false)
                scaleObject('dialogue1', 3, 3)
                setProperty('dialogue1.antialiasing', false)
                addLuaSprite('dialogue1', true)
        end
    end

    if curStep == 28 then -- removes the textbox and begins the game as normal
--        debugPrint("* I sure hope this is timed right! Go away Textboxes!")
        removeLuaSprite('dialogue1')
    end

    if curStep == 71 then
        if win == false then
            if not downscroll then
                makeAnimatedLuaSprite('dialogue2', 'textbox/dialogue2', 190, 450)
            else
                makeAnimatedLuaSprite('dialogue2', 'textbox/dialogue2', 190, 30)
            end
                setObjectCamera('dialogue2', 'other')
                addAnimationByPrefix('dialogue2', 'dialogue2', 'text idle', 24, false)
                scaleObject('dialogue2', 3, 3)
                setProperty('dialogue2.antialiasing', false)
                addLuaSprite('dialogue2', true)
        end
    end

    if curStep == 96 then 
        removeLuaSprite('dialogue2')
    end

    if curStep == 216 then
        if not downscroll then
            makeAnimatedLuaSprite('dialogue21', 'textbox/dialogue2.5', 190, 450)
        else
            makeAnimatedLuaSprite('dialogue21', 'textbox/dialogue2.5', 190, 30)
        end
            setObjectCamera('dialogue21', 'other')
            addAnimationByPrefix('dialogue21', 'dialogue2', 'text idle', 24, false)
            scaleObject('dialogue21', 3, 3)
            setProperty('dialogue21.antialiasing', false)
            addLuaSprite('dialogue21', true)
        
    end

    if curStep == 239 then 
        removeLuaSprite('dialogue21')
    end

    if curStep == 400 then
        if not downscroll then
            makeAnimatedLuaSprite('dialogue3', 'textbox/dialogue3', 190, 450)
        else
            makeAnimatedLuaSprite('dialogue3', 'textbox/dialogue3', 190, 30)
        end
            setObjectCamera('dialogue3', 'other')
            addAnimationByPrefix('dialogue3', 'dialogue3', 'text idle', 24, false)
            scaleObject('dialogue3', 3, 3)
            setProperty('dialogue3.antialiasing', false)
            addLuaSprite('dialogue3', true)
        
    end

    if curStep == 407 then
        if not downscroll then
            makeAnimatedLuaSprite('dialogue3', 'textbox/dialogue3', 190, 450)
        else
            makeAnimatedLuaSprite('dialogue3', 'textbox/dialogue3', 190, 30)
        end
            setObjectCamera('dialogue3', 'other')
            addAnimationByPrefix('dialogue3', 'dialogue3', 'text dropped', 24, false)
            scaleObject('dialogue3', 3, 3)
            setProperty('dialogue3.antialiasing', false)
            addLuaSprite('dialogue3', true)
        
    end

    if curStep == 416 then 
        removeLuaSprite('dialogue3')
    end

    if curStep == 1312 then
        if win == false then

                if not downscroll then
                    makeAnimatedLuaSprite('dialogue4', 'textbox/4+/dialogue41', 190, 450)
                else
                    makeAnimatedLuaSprite('dialogue4', 'textbox/4+/dialogue41', 190, 30)
                end
                setObjectCamera('dialogue4', 'other')
                addAnimationByPrefix('dialogue4', 'dialogue4', 'text idle', 24, false)
                scaleObject('dialogue4', 3, 3)
                setProperty('dialogue4.antialiasing', false)
                addLuaSprite('dialogue4', true)
        end

    end

    if curStep == 1338 then
        if win == false then
                if not downscroll then
                    makeAnimatedLuaSprite('dialogue4', 'textbox/4+/dialogue42', 190, 450)
                else
                    makeAnimatedLuaSprite('dialogue4', 'textbox/4+/dialogue42', 190, 30)
                end
                setObjectCamera('dialogue4', 'other')
                addAnimationByPrefix('dialogue4', 'dialogue4', 'text idle', 32, false)
                scaleObject('dialogue4', 3, 3)
                setProperty('dialogue4.antialiasing', false)
                addLuaSprite('dialogue4', true)
        end
    end

    if curStep == 1364 then 
        removeLuaSprite('dialogue4')
    end

    if curStep == 2208 then
        if not downscroll then
            makeAnimatedLuaSprite('dialogue5', 'textbox/dialogue5', 190, 450)
        else
            makeAnimatedLuaSprite('dialogue5', 'textbox/dialogue5', 190, 30)
        end
            setObjectCamera('dialogue5', 'other')
            addAnimationByPrefix('dialogue5', 'dialogue5', 'text idle', 24, false)
            scaleObject('dialogue5', 3, 3)
            setProperty('dialogue5.antialiasing', false)
            addLuaSprite('dialogue5', true)
        
    end

    if curStep == 2256 then 
        removeLuaSprite('dialogue5')
    end
    

    if curStep == 2516 then
        if not downscroll then
            makeAnimatedLuaSprite('dialogue6', 'textbox/dialogue6', 190, 450)
        else
            makeAnimatedLuaSprite('dialogue6', 'textbox/dialogue6', 190, 30)
        end
            setObjectCamera('dialogue6', 'other')
            addAnimationByPrefix('dialogue6', 'dialogue6', 'text idle', 24, false)
            scaleObject('dialogue6', 3, 3)
            setProperty('dialogue6.antialiasing', false)
            addLuaSprite('dialogue6', true)
        
    end

    if curStep == 2544 then 
        removeLuaSprite('dialogue6')
    end
end