function onCreate()
    BFposX = getProperty('boyfriend.x')
    CHARAposX = getProperty('dad.x')
    BFposY = getProperty('boyfriend.y')
    CHARAposY = getProperty('dad.y')
	setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
    



    makeLuaSprite('red', '', -1000, -200);
	makeGraphic('red',1280,720,'FF0000')
	scaleObject('red', 2.5, 2.5)
    addLuaSprite('red', true)
	setProperty('red.alpha', 0)


    makeLuaSprite('white', '', -1000, -200);
	makeGraphic('white',1280,720,'FFFFFF')
	scaleObject('white', 2.5, 2.5)
    addLuaSprite('white', true)
	setProperty('white.alpha', 0)

    makeLuaSprite('BigKnife', 'BIG KNIFE', 350, -20)
    setProperty('BigKnife.antialiasing', false)
    scaleObject('BigKnife', 2, 2)
    addLuaSprite('BigKnife',false)
    setProperty('BigKnife.alpha',0)
    setProperty('BigKnife.angle',0)

    makeAnimatedLuaSprite('PlantingChara', 'characters/Chara', getProperty('dad.x')-90, getProperty('dad.y')-80)
    addAnimationByPrefix('PlantingChara', 'UP', 'Chara alt j attack u', 8, false)
    addAnimationByPrefix('PlantingChara', 'DOWN', 'Chara alt j attack d', 12, false)
    setProperty('PlantingChara.antialiasing', false)
    scaleObject('PlantingChara', 3, 3)
    setProperty('PlantingChara.flipX',false)
    addLuaSprite('PlantingChara',false)
    setProperty('PlantingChara.alpha',0)

end

function onCreatePost()

    makeLuaSprite('black', '', -1000, -200);
	makeGraphic('black',1280,720,'000000')
	scaleObject('black', 2.5, 2.5)
    addLuaSprite('black', true)
	setObjectCamera('black','hud')
	setProperty('black.alpha', 0)
    

    makeLuaSprite('redend', '', -1000, -200);
	makeGraphic('redend',1280,720,'FF0000')
	scaleObject('redend', 2.5, 2.5)
    addLuaSprite('redend', true)
	setObjectCamera('redend','hud')
	setProperty('redend.alpha', 0)

    makeAnimatedLuaSprite('Screamer', 'Screamer', 550, 300)
    addAnimationByPrefix('Screamer', 'UP', 'Screamer idle', 12, true)
    setProperty('Screamer.antialiasing', false)
    scaleObject('Screamer', 3, 3)
    setProperty('Screamer.flipX',false)
    addLuaSprite('Screamer',true)
	setObjectCamera('Screamer','hud')
    setProperty('Screamer.alpha',0)
    
    makeAnimatedLuaSprite('slash', 'slice', 500, 0)
    addAnimationByPrefix('slash', 'slice', 'slice', 8, false)
    setProperty('slash.antialiasing', false)
    scaleObject('slash', 7, 7)
	setObjectCamera('slash','hud')
    addLuaSprite('slash',true)
    setProperty('slash.alpha',0)

    makeLuaSprite('99', '99999', 0, 0)
    setProperty('99.antialiasing', false)
    scaleObject('99', 3, 3)
	setObjectCamera('99','hud')
    addLuaSprite('99',true)
    setProperty('99.alpha',0)

end
local swap = false
function onUpdate()
    
    setProperty('Smile.x',getProperty('boyfriend.x')-20)
    setProperty('Smile.y',getProperty('boyfriend.y'))

    if swap == true then
		setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)
		setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4)
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3)
		setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4)
	else
		setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
		setPropertyFromGroup('playerStrums', 4, 'x', defaultPlayerStrumX4)
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3)
		setPropertyFromGroup('opponentStrums', 4, 'x', defaultOpponentStrumX4)
	end

	setProperty('CHARA1.x', getProperty('boyfriend.x')-150)
    setProperty('BF1.x', getProperty('dad.x')-10)

    BFRight = false
    BFLeft = false
    CHARARight = false
    CHARALeft = false
    offs = 0
    limL = 360
    limR = 770
    Hit = false
    ECHO = false
    function goodNoteHit(id, noteData, noteType, isSustainNote)
        if not isSustainNote then
            if BFRight == true and getProperty('boyfriend.x') < limR then
                setProperty('boyfriend.x',getProperty('boyfriend.x') + offs )
                BFLeft = false
                Hit = false
            end

            if BFLeft == true and getProperty('boyfriend.x') > limL  then
                BFRight = false
                setProperty('boyfriend.x',getProperty('boyfriend.x') - offs )
                Hit = false
            end
        end
    end

    function noteMiss(id, noteData, noteType, isSustainNote)

        if CHARARight and BFRight then
            setProperty('boyfriend.x',getProperty('boyfriend.x') )
            setProperty('dad.x',getProperty('dad.x') )
        end

        if CHARALeft and BFLeft then
            setProperty('boyfriend.x',getProperty('boyfriend.x') )
            setProperty('dad.x',getProperty('dad.x') )
        end

        if noteType == 'BF_Attack' then
            Hit = true
            characterPlayAnim('boyfriend', 'HURT', true);
            setProperty('boyfriend.specialAnim', true);
        end

        if not isSustainNote then
            if BFRight == true and getProperty('boyfriend.x') < limR then
                setProperty('boyfriend.x',getProperty('boyfriend.x') + offs )
                BFLeft = false
                Hit = false
            end

            if BFLeft == true and getProperty('boyfriend.x') > limL  then
                BFRight = false
                setProperty('boyfriend.x',getProperty('boyfriend.x') - offs )
                Hit = false
            end
        end

    end
    
    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if not isSustainNote then
            if CHARARight == true and getProperty('dad.x') < limR then
                setProperty('dad.x',getProperty('dad.x') + offs )
            end

            if CHARALeft == true and getProperty('dad.x') > limL then
                setProperty('dad.x',getProperty('dad.x') - offs )
            end
        end
    end

    
    if BFRight == true then
        BFLeft = false
    end
    
    if BFLeft == true then
        BFRight = false
    end

    if CHARARight == true then
        CHARALeft = false
    end

    if CHARALeft == true then
        CHARARight = false
    end

    if curStep == 128 then
        doTweenX('attacking', 'dad', getProperty('boyfriend.x')-70, 0.05, 'QuadOut')
        doTweenX('scrolleffect', 'boyfriend', getProperty('boyfriend.x') -10, 0.03, 'linear')
    end

    if curStep == 136 then
        doTweenX('attacking', 'dad', CHARAposX, 0.6, 'linear')
    end

    if curStep == 144 then
        playAnim('dad', 'DodgeJUMP', true, false, 2)
        doTweenY('jump', 'dad', CHARAposY - 100, 0.01, 'quadIn')
    end

    if curStep == 152 then
        doTweenX('attacking', 'dad', getProperty('boyfriend.x')-70, 0.1, 'QuadOut')
        doTweenY('scrolleffect', 'dad', CHARAposY, 0.05, 'quadOut')
    end

    if curStep == 165 then
        doTweenX('stepbackx', 'dad', CHARAposX, 0.06, 'quadOut')
    end

    if curStep >= 170 and curStep < 173  then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
    end

    if curStep == 172 then
        doTweenX('attacking', 'dad', getProperty('dad.x') +20, 0.05, 'quadOut')
    end

    if curStep == 174 then
        doTweenAlpha('bigknifespawn', 'BigKnife', 1, 2, 'linear')
    end

    if curStep == 189 then
        doTweenAngle('takebigknife', 'BigKnife', 20, 0.2, 'quadIn')
    end

    if curStep == 190 then
        doTweenX('throwXbigknife', 'BigKnife', 900, 0.3, 'quadIn')
    end

    if curStep == 191 then
        doTweenY('throwYbigknife', 'BigKnife', 100, 0.2, 'quadIn')
    end

    if curStep > 172 and curStep < 184  then
        offs = 15
        BFRight = true
        CHARARight = true
    end

    if curStep == 184 then
        doTweenX('stepbackx', 'dad', CHARAposX, 0.2, 'quadOut')
        triggerEvent('Play Animation' ,'THROW', 'dad')
    end

    if curStep == 192 then
        doTweenAlpha('bigknifespawn', 'BigKnife', 0, 1, 'linear')
        setProperty('boyfriend.x', BFposX)
    end

    if curStep == 240 then
        doTweenX('attacking', 'boyfriend', getProperty('dad.x')+100, 0.05, 'QuadOut')
        doTweenX('scrolleffect', 'dad', getProperty('dad.x') +30, 0.03, 'linear')
    end

    if curStep >= 253 and curStep < 256 then
        offs = 70
        BFRight = true
    end

    if curStep == 256 then
        setProperty('boyfriend.x', BFposX)
        setProperty('dad.x', CHARAposX)
    end

    if curStep >= 296 and curStep < 320 then
        offs = 10
        BFLeft = true
    end

    if curStep == 320 then
        doTweenX('clashBF', 'boyfriend', BFposX-95, 0.05, 'linear')
        doTweenX('clashCHARA', 'dad', getProperty('dad.x') +25, 0.03, 'linear')
    end

    if curStep == 350 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
        setProperty('boyfriend.x', getProperty('boyfriend.x') - 1)
    end

    if curStep >= 368 and curStep < 372 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        offs = 20
        CHARARight = true
        BFRight = true
    end

    if curStep >= 372 and curStep < 376 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        offs = 20
        CHARALeft = true
        BFLeft = true
    end

    if curStep >= 376 and curStep < 380 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        offs = 20
        CHARARight = true
        BFRight = true
    end

    if curStep >= 380 and curStep < 380 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        offs = 20
        CHARALeft = true
        BFLeft = true
    end

    if curStep == 384 then
        setProperty('boyfriend.x', BFposX)
        setProperty('dad.x', CHARAposX)
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
    end

    if curStep == 416 then
        setProperty('boyfriend.x', BFposX-115)
        setProperty('dad.x', CHARAposX +120) 
        offs = 5
    end

    if curStep >=416 and curStep <428 then
        BFRight = true
        CHARARight = true
    end

    if curStep == 428 then
        BFRight = false
        CHARARight = false
        setProperty('boyfriend.x', BFposX-100)
        setProperty('dad.x', CHARAposX +100) 
    end

    if curStep == 448 then
        doTweenX('gobackx', 'boyfriend', BFposX, 0.06, 'linear')
        doTweenX('stepbackx', 'dad', CHARAposX, 0.06, 'linear')
    end

    if curStep == 590 then
        triggerEvent('Play Animation' ,'ECHO', 'BF')
        ECHO = true
    end


    if curStep == 596 then
        doTweenX('attacking', 'dad', getProperty('boyfriend.x') -80, 0.05, 'quadOut')
    end

    if curStep == 608 then
        doTweenX('push', 'dad', CHARAposX, 0.05, 'quadOut')
    end

    if curStep > 612 and curStep < 640 then
        offs = 100
        CHARARight = true
    end
    
    if curStep == 640 then
        doTweenX('push', 'dad', CHARAposX, 0.05, 'quadOut')
        offs = 0
        CHARARight = false
    end

    if curStep == 656 then
        setProperty('boyfriend.x', BFposX)
        setProperty('dad.x', CHARAposX)
    end

    if curStep == 800 then
        doTweenX('gobackx', 'boyfriend', BFposX-95, 0.001, 'quadIn')
        doTweenX('stepbackx', 'dad', CHARAposX+115, 0.001, 'quadIn')
    end

    if curStep == 824 then
        doTweenX('gobackx', 'boyfriend', BFposX-85, 0.02, 'quadOut')
        doTweenX('stepbackx', 'dad', CHARAposX+105, 0.02, 'quadOut')
    end

    if curStep == 827 then
        doTweenX('gobackx', 'boyfriend', BFposX-95, 0.02, 'quadIn')
        doTweenX('stepbackx', 'dad', CHARAposX+115, 0.02, 'quadIn')
    end

    if curStep == 832 then
        doTweenX('gobackx', 'boyfriend', BFposX, 0.06, 'linear')
        doTweenX('stepbackx', 'dad', CHARAposX, 0.06, 'linear')
    end

    if curStep == 928 then
        setProperty('boyfriend.x', BFposX-95)
        setProperty('dad.x', CHARAposX +125)
        setProperty('boyfriend.x', getProperty('dad.x')+80)
    end

    if curStep >= 935 and curStep < 950 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 10
        BFLeft = true
    end

    if curStep >= 950 and curStep < 953 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARARight = true
        offs = 40
        BFRight = true
    end

    if curStep >= 953 and curStep < 960 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 10
        BFLeft = true
    end

    if curStep == 960 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
    end

    if curStep == 968 then
        doTweenX('gobackx', 'boyfriend', BFposX, 0.1, 'quadOut')
    end

    if curStep == 976 then
        doTweenX('gobackx', 'boyfriend', getProperty('dad.x')+80, 0.02, 'linear')
    end

    if curStep >= 976 and curStep < 984 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        CHARARight = true
        offs = 30
        BFRight = true
    end

    if curStep == 984 then
        doTweenX('gobackx', 'boyfriend', BFposX, 0.1, 'quadOut')
    end

    if curStep == 992 then
        doTweenX('gobackx', 'boyfriend', getProperty('dad.x')+80, 0.02, 'linear')
    end

    if curStep >= 993 and curStep < 1010 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 10
        BFLeft = true
    end

    if curStep == 1011 then
        playAnim('dad', 'DodgeJUMP', true, false, 2)
        doTweenY('jump', 'dad', CHARAposY - 100, 0.08, 'quadOut')
        doTweenX('stepbackx', 'dad', BFposX, 0.09, 'quadOut')
    end

    if curStep == 1012 then
        doTweenY('jumpBF', 'boyfriend', BFposY - 100, 0.03, 'quadOut')
        doTweenX('gobackx', 'boyfriend', BFposX, 0.03, 'quadOut')
    end

    if curStep == 1013 then
        doTweenY('fall', 'dad', CHARAposY, 0.05, 'quadOut')
    end

    if curStep == 1015 then
        doTweenY('jumpend', 'boyfriend', BFposY, 0.03, 'quadOut')
    end

    if curStep >= 1013 and curStep < 1021 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 40
        BFLeft = true
    end

    if curStep >= 1022 and curStep <= 1024 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        CHARARight = true
        offs = 40
        BFRight = true
    end

    if curStep == 1024 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
    end

    if curStep >= 1040 and curStep <= 1047 then
        CHARALeft = true
        offs = 20
    end

    if curStep == 1048 then
        doTweenX('stepbackx', 'dad', getProperty('boyfriend.x')-70, 0.02, 'linear')
    end

    if curStep > 1048 and curStep < 1054 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 10
        BFLeft = true
    end

    if curStep >= 1054 and curStep < 1056 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        CHARARight = true
        offs = 5
        BFRight = true
    end

    if curStep >= 1056 and curStep < 1058 or curStep == 1059 and curStep < 1061 or curStep == 1062 and curStep < 1064 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARALeft = true
        offs = 60
        BFLeft = true
    end

    if curStep == 1066 or curStep == 1068 or curStep == 1070 then
        setProperty('dad.x', getProperty('dad.x')+0.7)
        setProperty('dad.y', getProperty('dad.y')-1.4)
    end

    if curStep == 1072 or curStep == 1075 then
        setProperty('red.alpha', 1)
        doTweenAlpha('redflash', 'red', 0, 0.2, 'quadIn')
    end

    if curStep == 1078 then
        setProperty('dad.y', CHARAposY)
    end

    if curStep >= 1080 and curStep < 1088 then
        setProperty('boyfriend.x', getProperty('dad.x')+100)
        CHARARight = true
        offs = 40
        BFRight = true
    end

    if curStep >= 1088 and curStep < 1104 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARALeft = true
        offs = 20
        BFLeft = true
    end
    
    if curStep >= 1104 and curStep < 1112 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARARight = true
        offs = 30
        BFRight = true
    end

    if curStep >= 1112 and curStep < 1124 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARALeft = true
        offs = 60
        BFLeft = true
    end

    if curStep >= 1126 and curStep <= 1136 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARARight = true
        offs = 40
        BFRight = true
    end

    if curStep >= 1136 and curStep <= 1142 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARALeft = true
        offs = 30
        BFLeft = true
    end

    if curStep >= 1146 and curStep < 1152 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARARight = true
        offs = 40
        BFRight = true
    end

    if curStep == 1152 then
        setProperty('boyfriend.x', BFposX-95)
        setProperty('dad.x', CHARAposX +105)
    end

    if curStep == 1167 then
        setProperty('dad.x', CHARAposX)
        setProperty('boyfriend.x', getProperty('dad.x')+100)
    end

    if curStep >= 1168 and curStep < 1200 then
        setProperty('boyfriend.x', getProperty('dad.x')+90)
        CHARARight = true
        offs = 10
        BFRight = true
    end

    if curStep >= 1200 and curStep < 1221 then
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARALeft = true
        offs = 16
        BFLeft = true
    end

    if curStep >= 1222 and curStep < 1224 then
        CHARALeft = false
        offs = 80
        BFRight = true
    end

    if curStep == 1224 then
        setProperty('dad.x', CHARAposX)
        setProperty('boyfriend.x', BFposX)
    end

    if curStep >= 1232 and curStep < 1240 then
        offs = 20
        BFRight = true
    end


    if curStep == 1281 then
        doTweenX('gofoward', 'boyfriend', getProperty('boyfriend.x')-160, 0.3, 'linear')
    end

    if curStep == 1312 then
        setProperty('boyfriend.x', BFposX)
    end

    if curStep == 1552 then
        setProperty('boyfriend.x', BFposX-145)
        setProperty('dad.x', CHARAposX +135) 
    end

    if curStep >= 1552 and curStep < 1568 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        offs = 10
        BFLeft = true
        CHARALeft = true
    end

    if curStep == 1568 then
        setProperty('dad.y', CHARAposY - 20)
    end

    if curStep == 1581 then
        setProperty('dad.y', CHARAposY)
    end

    if curStep >= 1568 and curStep < 1582 then
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        CHARARight = true
        offs = 20
        BFRight = true
    end

    if curStep >= 1584 and curStep < 1616 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        CHARALeft = true
        offs = 10
        BFLeft = true
    end

    if curStep >= 1616 and curStep < 1648 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        offs = 10
        BFRight = true
        CHARARight = true
    end

    if curStep >= 1648 and curStep < 1680 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
        setProperty('dad.x', getProperty('boyfriend.x')-70)
        offs = 10
        BFLeft = true
        CHARALeft = true
    end

    if curStep >= 1680 and curStep < 1712 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
        setProperty('boyfriend.x', getProperty('dad.x')+80)
        offs = 10
        BFRight = true
        CHARARight = true
    end

    if curStep >= 1712 and curStep < 1744 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
        setProperty('dad.x', getProperty('boyfriend.x')-60)
        offs = 10
        BFLeft = true
        CHARALeft = true
    end

    if curStep >= 1744 and curStep < 1746 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
        offs = 120
        BFRight = true
        CHARALeft = false
    end

    if curStep >= 1746 and curStep < 1748 then
        offs = 0
        BFRight = false
    end

    if curStep == 1748 then
        setProperty('boyfriend.x', BFposX)
        setProperty('dad.x', CHARAposX)
    end

    if curStep == 1864 then
        setProperty('dad.alpha',0)
        setProperty('PlantingChara.alpha',1)
        objectPlayAnimation('PlantingChara', 'UP')
        doTweenY('jump', 'PlantingChara', CHARAposY-200, 0.3, 'quadOut')
    end

    if curStep == 1871 then
        objectPlayAnimation('PlantingChara', 'DOWN')
        doTweenY('jump', 'PlantingChara', CHARAposY-80, 0.02, 'quadIn')
    end

    if curStep == 1872 then
        setProperty('dad.alpha',1)
        setProperty('PlantingChara.alpha',0)
        setProperty('red.alpha', 1)
        doTweenAlpha('redflash', 'red', 0, 0.5, 'quadIn')
    end

    if curStep == 2000 then
        doTweenX('centerChara', 'dad', CHARAposX+105, 0.002, 'quadIn')
        doTweenX('centerBf', 'boyfriend', BFposX-115, 0.002, 'quadIn')
    end

    if curStep == 2064 then
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')+0.1)
    end

    if curStep == 2096 then
        setProperty('dad.x', CHARAposX +125) 
        setProperty('boyfriend.x', BFposX-115)
        setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup')-0.1)
    end

    if curStep == 2128 then
        setProperty('boyfriend.x', BFposX-115)
        setProperty('dad.x', CHARAposX +105) 
    end

    if curStep == 2192 then
        doTweenX('gobackx', 'boyfriend', BFposX, 0.06, 'linear')
        doTweenX('stepbackx', 'dad', CHARAposX, 0.06, 'linear')
    end
    
    if curStep == 2288 then
        doTweenX('takesoul', 'dad', BFposX, 6.2, 'linear')
    end

    if curStep == 2320 then
        swap = true
        setProperty('dad.x', getProperty('dad.x')+10)
        setProperty('StandingBF.x', getProperty('dad.x')-20)
        setProperty('boyfriend.x', getProperty('dad.x')-30)
        doTweenX('soulless', 'StandingBF', BFposX-70, 2.5, 'linear')
        doTweenX('gobackx', 'boyfriend', CHARAposX, 2.9, 'linear')
        setProperty('white.alpha', 1)
        doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadIn')
    end

    if curStep == 2344 then
        setProperty('boyfriend.x', CHARAposX)
        setProperty('dad.x', BFposX-70)
        setProperty('StandingBF.x', BFposX)
    end

    if curStep == 2480 then
        doTweenX('attacking', 'dad', getProperty('boyfriend.x')+70, 0.05, 'QuadOut')
        setProperty('CHARA3.y', getProperty('CHARA2.y'))
    end

    if curStep == 2544 then
        offs = 0
        BFLeft = false
        swap = false
        setProperty('white.alpha', 1)
        doTweenAlpha('whiteflash', 'white', 0, 0.4, 'quadIn')
        setProperty('boyfriend.x', BFposX-115)
        setProperty('dad.x', CHARAposX+105)
    end

    if curStep == 2651 then
        doTweenX('Byebye', 'dad', BFposX, 0.02, 'linear')
    end

    --Loop part


    if curStep == 1232 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1240 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1248 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1256 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1264 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1272 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1280 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1288 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        setProperty('boyfriend.x', BFposX-40)
    end

    if curStep == 1296 then
        doTweenZoom('camz','camGame', 2.2, 0.01,'quadOut')
        doTweenX('stepbackx', 'boyfriend', BFposX, 0.02, 'linear')
    end

    
end

function onTweenCompleted(tag)

    if tag == 'redendloop' then
        doTweenAlpha('redendlights','redend' , 0.1 , 0.2 ,'quadIn')
    end

    if tag == 'redendlights' then
        doTweenAlpha('redendloop','redend' , 4, 0.2 ,'quadOut')
    end

end

function onStepHit()
    if curStep == 480 then
        playSound('Heal', 1)
    end

    if curStep == 1416 then
        playSound('Heal', 1)
    end

    if curStep == 2652 then
        setProperty('Screamer.alpha',1)
        doTweenX('sizeX','Screamer.scale' , 40 , 1.2 ,'linear')
        doTweenY('sizeY','Screamer.scale' , 40 , 1.2 ,'linear')
        doTweenAlpha('redendlights','redend' , 0.3 , 0.2 ,'quadIn')
        setProperty('black.alpha', 1)
    end

    if curStep == 2664 then
        cancelTween('redendlights')
        cancelTween('redendloop')
        setProperty('redend.alpha', 0)


        setProperty('Screamer.alpha',0)
        setProperty('slash.alpha',1)
        objectPlayAnimation('slash', 'slice')
        playSound('Slice', 1)
    end

    if curStep == 2672 then
        setProperty('slash.alpha',0)
    end

    if curStep == 2676 then
        setProperty('BG.alpha', 0)
        setProperty('BG2.alpha', 0)
        triggerEvent('Screen Shake', '', '3, 0.02')
        setProperty('99.alpha', 1)
        playSound('SliceHit', 1)
        runTimer('exitapp', 1.2)
    end
end

function onTimerCompleted(tag)
    if tag == 'exitapp' then
        os.exit()
    end
end
