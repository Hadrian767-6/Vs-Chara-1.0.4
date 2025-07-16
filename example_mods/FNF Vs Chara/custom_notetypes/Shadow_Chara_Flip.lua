function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_Chara_Flip' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowCHARANOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
    
        makeAnimatedLuaSprite('CHARA3', 'characters/Chara3', getProperty('dad.x')-150, getProperty('dad.y')-78)
    
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackRIGHT', 'attackDOWN', 'attackUP', 'attackLEFT'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Shadow_Chara_Flip' then

            
        --Shadow Chara
        makeAnimatedLuaSprite('CHARA3', 'characters/Chara3', getProperty('boyfriend.x'), getProperty('dad.y')-78)
        addAnimationByPrefix('CHARA3', 'attackLEFT', 'Chara left', 16, false)
        addAnimationByPrefix('CHARA3', 'attackDOWN', 'Chara down', 16, false)
        addAnimationByPrefix('CHARA3', 'attackUP', 'Chara up', 16, false)
        addAnimationByPrefix('CHARA3', 'attackRIGHT', 'Chara right', 16, false)
        setProperty('CHARA3.antialiasing', false)
        scaleObject('CHARA3', 3, 3)
        setProperty('CHARA3.flipX',true)
        addLuaSprite('CHARA3',false)

		objectPlayAnimation('CHARA3', attackAnimations[noteData+1]);
	end
end

