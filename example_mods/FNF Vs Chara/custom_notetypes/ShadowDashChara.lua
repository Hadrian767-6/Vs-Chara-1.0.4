function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ShadowDashChara' then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowCHARANOTE')
			 --Change texture
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
DASH = {'DASH', '', '', 'DASH'}
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'ShadowDashChara' then
		makeAnimatedLuaSprite('CHARA5', 'characters/Chara3', getProperty('boyfriend.x')-150, getProperty('boyfriend.y')-78)
        addAnimationByPrefix('CHARA5', 'DASH', 'Chara dash', 20, false)
        setProperty('CHARA5.antialiasing', false)
        scaleObject('CHARA5', 3, 3)
        setProperty('CHARA5.flipX',false)
        addLuaSprite('CHARA5',false)
		setObjectOrder('CHARA5', getObjectOrder('boyfriendGroup')+0.1)
		objectPlayAnimation('CHARA5', Atacks[noteData+1]);
		
	end
end