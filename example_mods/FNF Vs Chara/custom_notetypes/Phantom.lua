function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phantom' then
			setPropertyFromGroup('unspawnNotes', i, 'alpha', 0)
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/Phantom'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

SingAnimations = {'singLEFT', 'singDOWN', 'singUP', 'singRIGHT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Phantom' then
		if not isSustainNote then
			makeAnimatedLuaSprite('Phantom', 'characters/Chara', getProperty('dad.x')-86, getProperty('dad.y')-79)
			addAnimationByPrefix('Phantom', 'singLEFT', 'Chara alt left', 24, false)
			addAnimationByPrefix('Phantom', 'singDOWN', 'Chara alt down', 24, false)
			addAnimationByPrefix('Phantom', 'singUP', 'Chara alt up', 24, false)
			addAnimationByPrefix('Phantom', 'singRIGHT', 'Chara alt Right', 24, false)
			setProperty('Phantom.antialiasing', false)
			scaleObject('Phantom', 3, 3)
			setProperty('Phantom.flipX',false)
			addLuaSprite('Phantom',true)
			setObjectOrder('Phantom', getObjectOrder('boyfriendGroup')+0.1)
                setProperty('Phantom.alpha', 0.6)
		end

		objectPlayAnimation('Phantom', SingAnimations[noteData+1]);
	end
end
