function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BF_Attack' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/AttackNOTE(BF)'); --Change texture
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

local ECHO = false
attackAnimations = {'attackRIGHT', 'attackDOWN', 'attackUP', 'attackLEFT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BF_Attack' then
		characterPlayAnim('boyfriend', ''..attackAnimations[noteData+1], true);
		setProperty('boyfriend.specialAnim', true);
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'BF_Attack' then
		addMisses(-1); --im nice so missing a bullet note won't count as a miss
		-- bf anim
		characterPlayAnim('boyfriend', 'HURT', true);
		setProperty('boyfriend.specialAnim', true);

		

		-- health loss | || || |_
		setProperty('health', getProperty('health') - 0.06 );
	end
end
