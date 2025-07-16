function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a ... Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_BF_Flip' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowBFNOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
    
        makeAnimatedLuaSprite('BF3', 'characters/BF2', getProperty('dad.x')+50, getProperty('boyfriend.y')-78)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackRIGHT', 'attackDOWN', 'attackUP', 'attackLEFT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Shadow_BF_Flip' then
        --Shadow BF
        
        makeAnimatedLuaSprite('BF3', 'characters/BF2', getProperty('dad.x')-160, getProperty('boyfriend.y')-78)


        addAnimationByPrefix('BF3', 'attackLEFT', 'BF left', 16, false)
        addAnimationByPrefix('BF3', 'attackDOWN', 'BF down', 16, false)
        addAnimationByPrefix('BF3', 'attackUP', 'BF up', 16, false)
        addAnimationByPrefix('BF3', 'attackRIGHT', 'BF right', 16, false)
        setProperty('BF3.antialiasing', false)
        scaleObject('BF3', 3, 3)
        setProperty('BF3.flipX',true)
        addLuaSprite('BF3',false)

		objectPlayAnimation('BF3', attackAnimations[noteData+1]);

	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Shadow_BF_Flip' then
        addMisses(1); --im nice so missing a bullet note won't count as a miss
		-- bf anim
		characterPlayAnim('boyfriend', 'HURT', true);
		setProperty('boyfriend.specialAnim', true);
		makeAnimatedLuaSprite('CHARA8', 'characters/Chara3', getProperty('boyfriend.x'), getProperty('dad.y')-78)
        addAnimationByPrefix('CHARA8', 'attackDOWN', 'Chara down', 16, false)
        setProperty('CHARA8.antialiasing', false)
        scaleObject('CHARA8', 3, 3)
        setProperty('CHARA8.flipX',true)
        addLuaSprite('CHARA8',false)

		objectPlayAnimation('CHARA8', 'attackDOWN')
        doTweenAlpha('Hit', 'CHARA8', 0, 0.5, 'quadOut')
    end
end