local truehp = 0.002
local name = 'Boyfriend'
local lvNumber = 20
local textY = 650
local length = 220
savehealth = 1
Save = ''
SaveBarX = 0
SaveBarSizeX = 0

function onCreate()
	
	setPropertyFromGroup('unspawnNotes', i, 'noteSplash.alpha', 0)

    makeLuaSprite('UThealthR', 'Red', 550, textY-7.5)
    setProperty('UThealthR.antialiasing', false)
    scaleObject('UThealthR', 220, 1.2)
    addLuaSprite('UThealthR', true)
	setObjectCamera('UThealthR','hud')

	makeLuaSprite('UThealthY', 'Yellow', 550, textY-7.5)
    setProperty('UThealthY.antialiasing', false)
    scaleObject('UThealthY', 220, 1.2)
    addLuaSprite('UThealthY', true)
	setObjectCamera('UThealthY','hud')




    healthCounter = 99
    setProperty('health', truehp)

    makeLuaText('name', name, 425, 0, textY)
	setTextFont('name', 'cryptoftomorrow.ttf')
	setObjectCamera('name', 'hud')
	setTextSize('name', '35')
	addLuaText('name')

	makeLuaText('lv', 'LV '..lvNumber, 425, 170, textY)
	setTextFont('lv', 'cryptoftomorrow.ttf')
	setObjectCamera('lv', 'hud')
	setTextSize('lv', '35')
	addLuaText('lv')

	makeLuaText('hp', 'hp', 425, 290, textY)
	setTextFont('hp', 'cryptoftomorrow.ttf')
	setObjectCamera('hp', 'hud')
	setTextSize('hp', '35')
	addLuaText('hp')

	makeLuaText('SaveState', ''..Save, 425, 80, 590)
	setTextFont('SaveState', 'pixel.otf')
	setObjectCamera('SaveState', 'hud')
	setTextSize('SaveState', '40')
	addLuaText('SaveState')
	setProperty('SaveState.alpha', 0)
end

function onCreatePost()

	makeLuaText('healthCounter', 'ph', 425, 650, textY)
	setTextFont('healthCounter', 'cryptoftomorrow.ttf')
	setObjectCamera('healthCounter', 'hud')
	setTextSize('healthCounter', '35')
	addLuaText('healthCounter')

	if downscroll then
		setProperty('chara.y', 32)
		setProperty('lv.y', 32)
		setProperty('hp.y', 32)
		setProperty('healthmax.y', 32)
		setProperty('healthCounter.y', 32)
		setProperty('name.y', 32)
		setProperty('outof.y', 32)
		setProperty('hpnb.y', 32)
		setProperty('UThealthR.y', 32)
		setProperty('UThealthY.y', 32)
		setProperty('SaveState.y', 660)
	end
    
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('winningIcon.alpha', 0)
    setProperty('winningIconDad.alpha', 0)
    setProperty('scoreTxt.alpha', 0)
    setProperty('missesTxt.alpha', 0)
    setProperty('ratingTxt.alpha', 0)
    setProperty('healthBarBG.alpha', 1)
    setProperty('healthBar.alpha', 0)
    setProperty('timeTxt.alpha', 0)
    setTextString("botplayTxt", "1 Left =)")
    setTextColor("botplayTxt", "FF0000")
    setProperty('timeBar.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
end

function onUpdate()


	setTextString('healthCounter', '' .. healthCounter .. ' / ' .. 99 .. '')


	setTextString('SaveState', 'File 1 '..Save)
	

	
	function noteMiss(id, noteData, noteType, isSustainNote)
		setProperty('health', getProperty('health') - -0.002)
		missfactor = 1

		if noteType == 'alt_BF_Attack' or noteType == 'ThrowNote' then
			missfactor = 20
		end

		if noteType == 'BF_Attack' or noteType == 'OtherAttackBF' then
			missfactor = 15
		end

		if noteType == 'BF_Slash' then
			missfactor = 15
		end

		if noteType == 'DodgeJump' or noteType == 'Dodge Note' or noteType == 'SingDodge Note' or noteType == 'ReverseDodge' or noteType == 'ReverseDodgeJump' or noteType == 'ReverseSingDodge' then
			missfactor = 35
		end

		if noteType == 'InteractionBF' then
			missfactor = 15
		end

		if noteType == 'Shadow_BF' or noteType == 'ShadowBFDash' or noteType == 'Shadow_BF_Flip' or noteType == 'Shadow_BF_Slash' then
			missfactor = 10
		end

		if curStep >= 1872 and curStep < 2192 then
			missfactor = 75
		end


		if not isSustainNote then
			playSound('Hurt', 1)
			if healthCounter >= 0 then
				addMisses(1)
				healthCounter = healthCounter - missfactor
    			setProperty('UThealthY.scale.x', getProperty('UThealthY.scale.x') - 2.2* missfactor)
				setProperty('UThealthY.x',getProperty('UThealthY.x')-1.1 * missfactor)
			end
		end
	end

	if getProperty('health') <= 0 then
		setProperty('health', 0.002)
	end

	function goodNoteHit(id, noteData, noteType, isSustainNote)
		missfactor = 1
		
		if not isSustainNote then
			if healthCounter < 99 then
				healthCounter = healthCounter + 1
    			setProperty('UThealthY.scale.x', getProperty('UThealthY.scale.x') + 2.2* missfactor)
				setProperty('UThealthY.x',getProperty('UThealthY.x')+1.1 * missfactor)
			end
		end
	end


	if healthCounter <= 0 then
		setProperty('health', 0)
	end

	
	function opponentNoteHit(id, noteData, noteType, isSustainNote)
		if curStep >= 2479 and curStep < 2512 then
		missfactor = 5
			if healthCounter >= 1 then
				if not isSustainNote then
					playSound('hurt', 0.8)
					healthCounter = healthCounter - missfactor
					setProperty('UThealthY.scale.x', getProperty('UThealthY.scale.x') - 2.2* missfactor)
					setProperty('UThealthY.x',getProperty('UThealthY.x')-1.1 * missfactor)
				end
			end
		end
	end





	if curStep == 2608 then
		healthCounter = 1
		setProperty('UThealthY.scale.x',1)
		setProperty('UThealthY.x',440)
	end





	
end

function onStepHit()
	if curStep == 1224 then
		Save = 'Saved'
		savehealth = healthCounter
		SaveBarX = getProperty('UThealthY.x')
		SaveBarSizeX = getProperty('UThealthY.scale.x')
		setTextColor('SaveState', 'FFFF00')

		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)

		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1232 then
		Save = 'loaded'
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)

		setTextColor('SaveState', 'FFFFFF')
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1240 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)

		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1248 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1256 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end
	
	if curStep == 1264 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1272 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1280 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end

	if curStep == 1288 then
		healthCounter = savehealth
		setProperty('UThealthY.scale.x', SaveBarSizeX)
		setProperty('UThealthY.x',SaveBarX)
		
		setProperty('SaveState.alpha',1)
		doTweenAlpha('loaded', 'SaveState', 0, 0.5, 'quadOut')
	end
end