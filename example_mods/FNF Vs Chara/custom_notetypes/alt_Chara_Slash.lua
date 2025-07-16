function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'alt_Chara_Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/AltAttackNOTE(C)'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
		end
	end
	--debugPrint('Script started!')

    
    --BF Slashes
    makeLuaSprite('AVertSlashChara', 'Slashes/altYSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('AVertSlashChara.antialiasing', false)
    scaleObject('AVertSlashChara', 3, 3)
    addLuaSprite('AVertSlashChara', true)
    setProperty('AVertSlashChara.visible', false)

    makeLuaSprite('ARightSlashChara', 'Slashes/altRSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('ARightSlashChara.antialiasing', false)
    scaleObject('ARightSlashChara', 3, 3)
    addLuaSprite('ARightSlashChara', true)
    setProperty('ARightSlashChara.visible', false)

    makeLuaSprite('ALeftSlashChara', 'Slashes/altLSlashCHARA', getProperty('dad.x')+30, getProperty('dad.y')+30)
    setProperty('ALeftSlashChara.antialiasing', false)
    scaleObject('ALeftSlashChara', 3, 3)
    addLuaSprite('ALeftSlashChara', true)
    setProperty('ALeftSlashChara.visble', false)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'alt-attackRIGHT', 'alt-attackDOWN', 'alt-attackUP', 'alt-attackLEFT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'alt_Chara_Slash' then

		characterPlayAnim('dad', ''..attackAnimations[noteData+1], true);
		setProperty('dad.specialAnim', true);
        if not isSustainNote then
            if attackAnimations[noteData+1] == 'alt-attackRIGHT' then
                setProperty('ARightSlashChara.visible', true)
                doTweenX('Slashs', 'ARightSlashChara', '1100','0.2', 'linear')
            end
            if attackAnimations[noteData+1] == 'alt-attackDOWN' or attackAnimations[noteData+1] == 'alt-attackUP' then
                setProperty('AVertSlashChara.visible', true)
                doTweenX('Slashs', 'AVertSlashChara', '1100','0.2', 'linear')
            end 
            if attackAnimations[noteData+1] == 'alt-attackLEFT' then
                doTweenX('Slashs', 'ALeftSlashChara', '1100','0.2', 'linear')
                setProperty('ALeftSlashChara.visible', true)
            end
        end


	end
    
        setProperty('AVertSlashChara.x', getProperty('dad.x')+30 )
        setProperty('ARightSlashChara.x', getProperty('dad.x')+30 )
        setProperty('ALeftSlashChara.x', getProperty('dad.x')+30 )
end

function onUpdate()
    if getProperty('AVertSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('AVertSlashChara.visible', false)
    end
    if getProperty('ARightSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('ARightSlashChara.visible', false)
    end
    if getProperty('ALeftSlashChara.x') == getProperty('dad.x')+30 then
        setProperty('ALeftSlashChara.visible', false)
    end

end
