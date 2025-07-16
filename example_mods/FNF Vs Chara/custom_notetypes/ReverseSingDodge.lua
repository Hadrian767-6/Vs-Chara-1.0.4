function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ReverseSingDodge' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/DodgeNOTE'); --Change texture
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

ECHO = false
dodgeAnimations = {'singDodgeLEFT', 'singDodgeDOWN', 'singDodgeUP', 'singDodgeRIGHT', 'singDodgeJUMP'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'ReverseSingDodge' then
		setProperty('boyfriend.flipX', true)
		if ECHO == false then
			characterPlayAnim('boyfriend', ''..dodgeAnimations[noteData+1], true);
			setProperty('boyfriend.specialAnim', true);
		else
			characterPlayAnim('boyfriend','Echo-'..dodgeAnimations[noteData+1], true);
			setProperty('boyfriend.specialAnim', true);
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'ReverseSingDodge' then
		setProperty('dad.flipX', false)
		characterPlayAnim('dad', dodgeAnimations[noteData+1], true);
		setProperty('dad.specialAnim', true);
		
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'ReverseSingDodge' then
		addMisses(1); --im nice so missing a bullet note won't count as a miss
		-- bf anim
		if ECHO == false then
			characterPlayAnim('boyfriend', 'HURT', true);
			setProperty('boyfriend.specialAnim', true);
		else
			characterPlayAnim('boyfriend', 'Echo-HURT', true);
			setProperty('boyfriend.specialAnim', true);
		end

		
	end
end



function onUpdate()
	ECHO = false
    if curStep >= 288 and curStep <= 384 then
        ECHO = true 
    end

    if curStep >= 578 and curStep <= 832 then
        ECHO = true 
    end

    if curStep >= 880 and curStep <= 1312 then
        ECHO = true 
        
    end

    if curStep >= 1552 and curStep <= 1808 then
        ECHO = true 
    end
end
