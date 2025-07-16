function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_Chara' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowCHARANOTE'); --Change texture
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
	if noteType == 'Shadow_Chara' then

            
        --Shadow Chara
        
        makeAnimatedLuaSprite('CHARA1', 'characters/Chara3', getProperty('boyfriend.x')-150, getProperty('boyfriend.y')-78)
        addAnimationByPrefix('CHARA1', 'attackLEFT', 'Chara left', 20, false)
        addAnimationByPrefix('CHARA1', 'attackDOWN', 'Chara down', 20, false)
        addAnimationByPrefix('CHARA1', 'attackUP', 'Chara up', 20, false)
        addAnimationByPrefix('CHARA1', 'attackRIGHT', 'Chara right', 20, false)
        setProperty('CHARA1.antialiasing', false)
        scaleObject('CHARA1', 3, 3)
        setProperty('CHARA1.flipX',false)
        addLuaSprite('CHARA1',false)
		setObjectOrder('CHARA1', getObjectOrder('boyfriendGroup')+0.1)

		objectPlayAnimation('CHARA1', attackAnimations[noteData+1]);


	end
end