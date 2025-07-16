function onCreatePost()
    makeLuaSprite('BFAttacks', 'BFKnife', getProperty('CharaCenter.x'), 100)
    setProperty('BFAttacks.antialiasing', false)
    scaleObject('BFAttacks', 3, 3)
    addLuaSprite('BFAttacks',false)
    setProperty('BFAttacks.alpha',0)
    setProperty('BFAttacks.angle',-90)

    makeLuaSprite('BFLaser', 'BFKnifeAttack', 760, -120)
    setProperty('BFLaser.antialiasing', false)
    scaleObject('BFLaser', 3, 3)
    addLuaSprite('BFLaser',true)
    setProperty('BFLaser.alpha',0)

    makeLuaSprite('CharaCenter', '', getProperty('dad.x')+30, getProperty('dad.y')+70);
	makeGraphic('CharaCenter',18,18,'FFFFFF')
	scaleObject('CharaCenter', 2.5, 2.5)
    addLuaSprite('CharaCenter', true)
	setProperty('CharaCenter.alpha',0)

    makeLuaSprite('BFCenter', '', 0, 0);
	makeGraphic('BFCenter',18,18,'FFFF00')
	scaleObject('BFCenter', 2.5, 2.5)
    addLuaSprite('BFCenter', true)
	setProperty('BFCenter.alpha',0)


    makeLuaSprite('CharaAttacks', 'CharaKnife', getProperty('CharaCenter.x'), 100)
    setProperty('CharaAttacks.antialiasing', false)
    scaleObject('CharaAttacks', 3, 3)
    addLuaSprite('CharaAttacks',false)
    setProperty('CharaAttacks.alpha',0)
    setProperty('CharaAttacks.angle',-180)

    makeLuaSprite('CharaLaser', 'CharaKnifeAttack', 760, -120)
    setProperty('CharaLaser.antialiasing', false)
    scaleObject('CharaLaser', 3, 3)
    addLuaSprite('CharaLaser',true)
    setProperty('CharaLaser.alpha',0)
end

appeartime = 0
disappeartime = 0

function onUpdate()
    
    setProperty('CharaCenter.x', getProperty('dad.x')+30)
    setProperty('CharaCenter.y', getProperty('dad.y')+80)
    setProperty('BFCenter.x', getProperty('boyfriend.x')+20)
    setProperty('BFCenter.y', getProperty('boyfriend.y')+80)
    setProperty('BFAttacks.x', getProperty('CharaCenter.x')-440)
    setProperty('BFAttacks.y', getProperty('CharaCenter.y'))
    setProperty('CharaAttacks.x', getProperty('BFCenter.x')-440)
    setProperty('CharaAttacks.y', getProperty('BFCenter.y'))

    setProperty('BFLaser.angle', getProperty('BFAttacks.angle'))
    setProperty('CharaLaser.angle', getProperty('CharaAttacks.angle'))

    setProperty('BFLaser.x', getProperty('BFAttacks.x'))
    setProperty('BFLaser.y', getProperty('BFAttacks.y'))
    setProperty('CharaLaser.x', getProperty('CharaAttacks.x'))
    setProperty('CharaLaser.y', getProperty('CharaAttacks.y'))

    if getProperty('CharaLaser.alpha') ~= 0 then
        setProperty('CharaAttacks.alpha', 0)
    end

    if getProperty('BFLaser.alpha') ~= 0 then
        setProperty('BFAttacks.alpha', 0)
    end
    
    function onTimerCompleted(tag)

        if tag == 'Cknfdissapear' then
            doTweenAlpha('Clsr', 'CharaLaser', 0, 0.2, 'quadIn')
        end

        if tag == 'BFknfdissapear' then
            doTweenAlpha('Blsr', 'BFLaser', 0, 0.2, 'quadIn')
        end
    end

    
    function onStepHit()
        
        if curStep == 488 then
            disappeartime = 0.5
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -120, 0.6, 'quadOut')
        end

        if curStep == 496 then
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 536 then
            appeartime = 0.2
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -40, appeartime, 'quadOut')
        end

        if curStep == 544 then
            disappeartime = 0.05
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end
        
        if curStep == 546 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -120, appeartime, 'quadOut')
        end

        if curStep == 548 then
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 550 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -75, appeartime, 'quadOut')
        end

        if curStep == 552 then
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end
        
        if curStep == 554 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -50, appeartime, 'quadOut')
        end

        if curStep == 556 then
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 558 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -35, appeartime, 'quadOut')
        end

        if curStep == 560 then
            disappeartime = 0.2
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 564 then
            appeartime = 0.05
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', 10, appeartime, 'quadOut')
        end

        if curStep == 568 then
            disappeartime = 0.2
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', 0.7)
        end

        if curStep == 832 then
            setProperty('CharaAttacks.color', getColorFromHex("EE0000"))
            setProperty('CharaLaser.color', getColorFromHex("EE0000"))
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -100, 0.2, 'quadOut')
        end

        if curStep == 840 then
            disappeartime = 0.5
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 848 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -150, 0.2, 'quadOut')
        end

        if curStep == 856 then
            disappeartime = 0.5
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 864 then
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -70, 0.2, 'quadOut')
        end

        if curStep == 872 then
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 880 then
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -92, 0.2, 'quadOut')
        end

        if curStep == 888 then
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end
        
        if curStep == 1360 then
            setProperty('CharaAttacks.color', getColorFromHex("FFFFFF"))
            setProperty('CharaLaser.color', getColorFromHex("FFFFFF"))
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -185, appeartime, 'quadOut')
        end

        if curStep == 1364 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1368 then
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -105, appeartime, 'quadOut')
        end

        if curStep == 1372 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1376 then
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -80, appeartime, 'quadOut')
        end

        if curStep == 1380 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1384 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', 0, appeartime, 'quadOut')
        end

        if curStep == 1386 then
            disappeartime = 0.02
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1387 then
            appeartime = 0.01
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', 20, appeartime, 'quadOut')
        end

        if curStep == 1388 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1392 then
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1396 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1400 then
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -110, appeartime, 'quadOut')
        end

        if curStep == 1404 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1408 then
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -45, appeartime, 'quadOut')
        end

        if curStep == 1412 then
            disappeartime = 0.1
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1416 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1418 then
            disappeartime = 0.02
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1419 then
            appeartime = 0.01
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1420 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 1424 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -76, appeartime, 'quadOut')
        end

        if curStep == 1428 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1432 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -80, appeartime, 'quadOut')
        end

        if curStep == 1436 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1440 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -35, appeartime, 'quadOut')
        end

        if curStep == 1444 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1448 then
            appeartime = 0.05
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -95, appeartime, 'quadOut')
        end

        if curStep == 1450 then
            disappeartime = 0.02
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1451 then
            appeartime = 0.01
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -165, appeartime, 'quadOut')
        end

        if curStep == 1452 then
            disappeartime = 0.05
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1456 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -200, appeartime, 'quadOut')
        end

        if curStep == 1460 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1464 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', 0, appeartime, 'quadOut')
        end

        if curStep == 1468 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1472 then
            appeartime = 0.1
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -35, appeartime, 'quadOut')
        end

        if curStep == 1476 then
            disappeartime = 0.1
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1480 then
            appeartime = 0.05
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', 10, appeartime, 'quadOut')
            
            appeartime = 0.1
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1482 then
            disappeartime = 0.02
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 1483 then
            appeartime = 0.01
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -55, appeartime, 'quadOut')
        end

        if curStep == 1484 then
            disappeartime = 0.05
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end


        if curStep == 1488 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1490 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1492 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1494 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1496 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1498 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1500 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1502 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1504 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1506 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1508 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1510 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1512 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 1514 then
            appeartime = 0.05
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -90, appeartime, 'quadOut')
        end

        if curStep == 1516 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end
        
        if curStep == 2000 then
            setProperty('CharaAttacks.color', getColorFromHex("EE0000"))
            setProperty('CharaLaser.color', getColorFromHex("EE0000"))
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -135, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -45, 0.2, 'quadOut')
        end

        if curStep == 2008 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2016 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -115, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -65, 0.2, 'quadOut')
        end

        if curStep == 2024 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end
        
        if curStep == 2032 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -135, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -45, 0.2, 'quadOut')
        end

        if curStep == 2040 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2048 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -125, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -55, 0.2, 'quadOut')
        end

        if curStep == 2056 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2064 then
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -60, 0.2, 'quadOut')
        end

        if curStep == 2072 then
            disappeartime = 0.05
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2080 then
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', 15, 0.2, 'quadOut')
        end

        if curStep == 2088 then
            disappeartime = 0.05
            setProperty('BFLaser.alpha', 1)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2096 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -165, 0.2, 'quadOut')
        end

        if curStep == 2104 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
        end

        if curStep == 2128 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -45, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -135, 0.2, 'quadOut')
        end

        if curStep == 2136 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2144 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -65, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -115, 0.2, 'quadOut')
        end

        if curStep == 2152 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end
        
        if curStep == 2160 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -45, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -135, 0.2, 'quadOut')
        end

        if curStep == 2168 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end

        if curStep == 2176 then
            setProperty('CharaAttacks.alpha', 1)
            doTweenAngle('Cknf', 'CharaAttacks', -55, 0.2, 'quadOut')
            setProperty('BFAttacks.alpha', 1)
            doTweenAngle('BFknf', 'BFAttacks', -125, 0.2, 'quadOut')
        end

        if curStep == 2184 then
            disappeartime = 0.05
            setProperty('CharaLaser.alpha', 1)
            setProperty('BFLaser.alpha', 1)
            runTimer('Cknfdissapear', disappeartime)
            runTimer('BFknfdissapear', disappeartime)
        end
    end
end


