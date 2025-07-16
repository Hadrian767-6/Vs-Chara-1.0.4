function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Chara_Attack' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/AttackNOTE(C)'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
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
	if noteType == 'Chara_Attack' then
		characterPlayAnim('dad', ''..attackAnimations[noteData+1], true);
		setProperty('dad.specialAnim', true);
	end
end
