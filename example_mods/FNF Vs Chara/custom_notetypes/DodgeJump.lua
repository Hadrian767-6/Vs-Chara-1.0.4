function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DodgeJump' then
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
dodgeAnimations = {'', 'alt-DodgeDOWN', 'DodgeJUMP', 'singDodgeJUMP'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'DodgeJump' then
		
		--BF dodge
		if dodgeAnimations[noteData+1] == 'singDodgeJUMP' then
			makeAnimatedLuaSprite('DodgeBF', 'characters/BF', getProperty('boyfriend.x'), getProperty('boyfriend.y'))
			addAnimationByPrefix('DodgeBF', 'DodgeJUMP', 'BF dodge jump', 16, false)
			addAnimationByPrefix('DodgeBF', 'singDodgeJUMP', 'BF sing dodge jump', 16, false)
			addAnimationByPrefix('DodgeBF', 'ECHO-DodgeJUMP', 'BF knife dodge jump', 16, false)
			addAnimationByPrefix('DodgeBF', 'ECHO-singDodgeJUMP', 'BF knife sing dodge jump', 16, false)
			setProperty('DodgeBF.antialiasing', false)
			scaleObject('DodgeBF', 3, 3)
			setProperty('DodgeBF.flipX',false)
			addLuaSprite('DodgeBF',false)
			if ECHO == false then
				objectPlayAnimation('DodgeBF', 'singDodgeJUMP')
			else
				objectPlayAnimation('DodgeBF','ECHO-singDodgeJUMP');
			end
		end
		if dodgeAnimations[noteData+1] == 'DodgeJUMP' then
			if ECHO == false then
				characterPlayAnim('boyfriend', ''..dodgeAnimations[noteData+1]);
			else
				characterPlayAnim('boyfriend','Echo-'..dodgeAnimations[noteData+1]);
			end
		end
	end
end

function onUpdate()
    setProperty('DodgeBF.x', getProperty('boyfriend.x')-95)
    setProperty('DodgeBF.y', getProperty('boyfriend.y')-73)

	if getProperty('DodgeBF.animation.curAnim.curFrame') == 3 then 
		setProperty('DodgeBF.angle', -30)
		setProperty('DodgeBF.alpha', 0)
	end
	if getProperty('DodgeBF.animation.curAnim.curFrame') == 0 then 
		setProperty('DodgeBF.angle', -20)
	end
	if getProperty('DodgeBF.animation.curAnim.curFrame') == 1 then 
		setProperty('DodgeBF.angle', -30)
	end
	if getProperty('DodgeBF.animation.curAnim.curFrame') == 2 then 
		setProperty('DodgeBF.angle', -40)
	end

	if getProperty('DodgeBF.alpha') == 0 then
		setProperty('boyfriend.visible', true)
	end

	if getProperty('DodgeBF.alpha') == 1 then
		setProperty('boyfriend.visible', false)
	end
	
	if getProperty('boyfriend.animation.curAnim.name') == 'DodgeJUMP' then
		if getProperty('boyfriend.animation.curAnim.curFrame') == 3 then 
			setProperty('boyfriend.angle', -30)
		end
		if getProperty('boyfriend.animation.curAnim.curFrame') == 0 then 
			setProperty('boyfriend.angle', -20)
		end
		if getProperty('boyfriend.animation.curAnim.curFrame') == 1 then 
			setProperty('boyfriend.angle', -30)
		end
		if getProperty('boyfriend.animation.curAnim.curFrame') == 2 then 
			setProperty('boyfriend.angle', -40)
		end
	end
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
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'DodgeJump' then
		setProperty('dad.flipX', false)
		characterPlayAnim('dad', dodgeAnimations[noteData+1], true);
		setProperty('dad.specialAnim', true);
		
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'DodgeJump' then
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
