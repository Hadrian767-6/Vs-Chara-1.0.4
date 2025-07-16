function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Chara_Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/AttackNOTE(C)'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
		end
	end
	--debugPrint('Script started!')

    
    --Chara Slashes
    makeLuaSprite('VertSlashChara', 'Slashes/YSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('VertSlashChara.antialiasing', false)
    scaleObject('VertSlashChara', 3, 3)
    addLuaSprite('VertSlashChara', true)
    setProperty('VertSlashChara.visible', false)

    makeLuaSprite('RightSlashChara', 'Slashes/RSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('RightSlashChara.antialiasing', false)
    scaleObject('RightSlashChara', 3, 3)
    addLuaSprite('RightSlashChara', true)
    setProperty('RightSlashChara.visible', false)

    makeLuaSprite('LeftSlashChara', 'Slashes/LSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('LeftSlashChara.antialiasing', false)
    scaleObject('LeftSlashChara', 3, 3)
    addLuaSprite('LeftSlashChara', true)
    setProperty('LeftSlashChara.visble', false)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackRIGHT', 'attackDOWN', 'attackUP', 'attackLEFT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Chara_Slash' then

		characterPlayAnim('dad', ''..attackAnimations[noteData+1], true);
		setProperty('dad.specialAnim', true);
        if not isSustainNote then
            if attackAnimations[noteData+1] == 'attackRIGHT' then
                setProperty('RightSlashChara.visible', true)
                doTweenX('Slashs', 'RightSlashChara', '1100','0.2', 'linear')
            end
            if attackAnimations[noteData+1] == 'attackDOWN' or attackAnimations[noteData+1] == 'attackUP' then
                setProperty('VertSlashChara.visible', true)
                doTweenX('Slashs', 'VertSlashChara', '1100','0.2', 'linear')
            end 
            if attackAnimations[noteData+1] == 'attackLEFT' then
                doTweenX('Slashs', 'LeftSlashChara', '1100','0.2', 'linear')
                setProperty('LeftSlashChara.visible', true)
            end
        end
    
        setProperty('VertSlashChara.x', getProperty('dad.x')+30 )
        setProperty('RightSlashChara.x', getProperty('dad.x')+30 )
        setProperty('LeftSlashChara.x', getProperty('dad.x')+30 )


	end
end

function onUpdate()
    if getProperty('VertSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('VertSlashChara.visible', false)
    end
    if getProperty('RightSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('RightSlashChara.visible', false)
    end
    if getProperty('LeftSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('LeftSlashChara.visible', false)
    end
end
