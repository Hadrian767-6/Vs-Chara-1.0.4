function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_Chara_Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowCHARANOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
            setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
    
        makeAnimatedLuaSprite('CHARA2', 'characters/Chara3', 160, getProperty('dad.y')-78)
    
    --Chara Slashes
    makeLuaSprite('ShadowAltVertSlashChara', 'Slashes/altYSlashCHARA', getProperty('CHARA2.x')+80, getProperty('CHARA3.y')+120)
    setProperty('ShadowAltVertSlashChara.antialiasing', false)
    scaleObject('ShadowAltVertSlashChara', 3, 3)
    setProperty('ShadowAltVertSlashChara.visible', false)
    addLuaSprite('ShadowAltVertSlashChara', true)


    makeLuaSprite('ShadowAltLeftSlashChara', 'Slashes/altLSlashCHARA', getProperty('CHARA2.x')+80, getProperty('CHARA3.y')+120)
    setProperty('ShadowAltLeftSlashChara.antialiasing', false)
    scaleObject('ShadowAltLeftSlashChara', 3, 3)
    setProperty('ShadowAltLeftSlashChara.visble', false)
    addLuaSprite('ShadowAltLeftSlashChara', true)

    makeLuaSprite('ShadowAltRightSlashChara', 'Slashes/altRSlashCHARA', getProperty('CHARA2.x')+80, getProperty('CHARA3.y')+120)
    setProperty('ShadowAltRightSlashChara.antialiasing', false)
    scaleObject('ShadowAltRightSlashChara', 3, 3)
    setProperty('ShadowAltRightSlashChara.visble', false)
    addLuaSprite('ShadowAltRightSlashChara', true)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackLEFT', 'attackDOWN', 'attackUP', 'attackRIGHT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Shadow_Chara_Slash' then

            
        --Shadow Chara
        
        makeAnimatedLuaSprite('CHARA2', 'characters/Chara3', 220, getProperty('dad.y')-78)
        addAnimationByPrefix('CHARA2', 'attackLEFT', 'Chara left', 16, false)
        addAnimationByPrefix('CHARA2', 'attackDOWN', 'Chara down', 16, false)
        addAnimationByPrefix('CHARA2', 'attackUP', 'Chara up', 16, false)
        addAnimationByPrefix('CHARA2', 'attackRIGHT', 'Chara right', 16, false)
        setProperty('CHARA2.antialiasing', false)
        scaleObject('CHARA2', 3, 3)
        setProperty('CHARA2.flipX',false)
        addLuaSprite('CHARA2',false)

		objectPlayAnimation('CHARA2', attackAnimations[noteData+1]);
        if not isSustainNote then
            if attackAnimations[noteData+1] == 'attackRIGHT' then
                setProperty('ShadowAltRightSlashChara.visible', true)
                doTweenX('Slashs', 'ShadowAltRightSlashChara', '1100','0.2', 'linear')
                setProperty('CHARA2.x',220)
            end
            if attackAnimations[noteData+1] == 'attackDOWN' or attackAnimations[noteData+1] == 'attackUP' then
                setProperty('ShadowAltVertSlashChara.visible', true)
                doTweenX('Slashs', 'ShadowAltVertSlashChara', '1100','0.2', 'linear')
            end
            if attackAnimations[noteData+1] == 'attackDOWN' then    
                setProperty('CHARA2.x',226)
            end
            if attackAnimations[noteData+1] == 'attackUP' then    
                setProperty('CHARA2.x',220)
            end
            if attackAnimations[noteData+1] == 'attackLEFT' then
                doTweenX('Slashs', 'ShadowAltLeftSlashChara', '1100','0.2', 'linear')
                setProperty('ShadowAltLeftSlashChara.visible', true)
                setProperty('CHARA2.x',220)
            end
        end
        
        setProperty('ShadowAltVertSlashChara.x', getProperty('CHARA2.x')+80 )
        setProperty('ShadowAltRightSlashChara.x', getProperty('CHARA2.x')+80 )
        setProperty('ShadowAltLeftSlashChara.x', getProperty('CHARA2.x')+80 )


	end
end

function onUpdate()
    if getProperty('ShadowAltVertSlashChara.x') == getProperty('CHARA2.x')+80 then
        setProperty('ShadowAltVertSlashChara.visible', false)
    end
    if getProperty('ShadowAltRightSlashChara.x') == getProperty('CHARA2.x')+80 then
        setProperty('ShadowAltRightSlashChara.visible', false)
    end
    if getProperty('ShadowAltLeftSlashChara.x') == getProperty('CHARA2.x')+80 then
        setProperty('ShadowAltLeftSlashChara.visible', false)
    end

end
