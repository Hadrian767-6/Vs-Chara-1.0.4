function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a ... Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_BF' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowBFNOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
    
        makeAnimatedLuaSprite('BF1', 'characters/BF2', 0, getProperty('boyfriend.y')-78)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackLEFT', 'attackDOWN', 'attackUP', 'attackRIGHT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Shadow_BF' then

        --Shadow BF
        
        makeAnimatedLuaSprite('BF1', 'characters/BF2', 0, getProperty('boyfriend.y')-78)
    
		setProperty('BF1.x', getProperty('dad.x'))
        addAnimationByPrefix('BF1', 'attackLEFT', 'BF left', 20, false)
        addAnimationByPrefix('BF1', 'attackDOWN', 'BF down', 20, false)
        addAnimationByPrefix('BF1', 'attackUP', 'BF up', 20, false)
        addAnimationByPrefix('BF1', 'attackRIGHT', 'BF right', 20, false)
        setProperty('BF1.antialiasing', false)
        scaleObject('BF1', 3, 3)
        setProperty('BF1.flipX',false)
        addLuaSprite('BF1',false)
		setObjectOrder('BF1', getObjectOrder('CHARA1')-0.1)
		
		objectPlayAnimation('BF1', attackAnimations[noteData+1]);

	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Shadow_BF' then
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