function onCreate()
    makeLuaSprite('ECHO', 'Echo', getProperty('boyfriend.x'), 132)
    setProperty('ECHO.antialiasing', false)
    scaleObject('ECHO', 1, 1)
    addLuaSprite('ECHO',true)
    setProperty('ECHO.alpha',0)
end
bfEcho = false

function onUpdate()
    if bfEcho == true then
        bfEcho = false
        setProperty('ECHO.alpha',1)
        doTweenX('echoslide', 'ECHO', getProperty('boyfriend.x')+30, 0.7,'linear')
        doTweenAlpha('echopacity', 'ECHO', 0, 0.7,'linear')
    end

    if getProperty('ECHO.alpha') == 0 then
        setProperty('ECHO.x',getProperty('boyfriend.x'))
    end
end


function onStepHit()
    if curStep == 238 then
        bfEcho = true
    end

    if curStep == 412 then
        bfEcho = true
    end

    if curStep == 536 then
        bfEcho = true
    end

    if curStep == 608 then
        bfEcho = true
    end
end