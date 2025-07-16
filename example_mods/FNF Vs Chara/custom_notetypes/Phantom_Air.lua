function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phantom_Air' then
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

attackAnimations = {'attackLEFT', 'attackDOWN', 'attackUP', 'attackRIGHT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Phantom_Air' then

        makeAnimatedLuaSprite('Phantom', 'characters/Chara', getProperty('dad.x')-86, getProperty('dad.y')-79)
        addAnimationByPrefix('Phantom', 'attackLEFT', 'Chara alt air l', 20, false)
        addAnimationByPrefix('Phantom', 'attackDOWN', 'Chara alt air d', 20, false)
        addAnimationByPrefix('Phantom', 'attackUP', 'Chara alt air u', 20, false)
        addAnimationByPrefix('Phantom', 'attackRIGHT', 'Chara alt air r', 20, false)
        setProperty('Phantom.antialiasing', false)
        scaleObject('Phantom', 3, 3)
        setProperty('Phantom.flipX',false)
        addLuaSprite('Phantom',true)
		setObjectOrder('Phantom', getObjectOrder('boyfriendGroup')+0.1)
        
		objectPlayAnimation('Phantom', attackAnimations[noteData+1]);
	end
end