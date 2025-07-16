function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BF_Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/AttackNOTE(BF)'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
		end
	end
	--debugPrint('Script started!')

    
    --BF Slashes
    makeLuaSprite('VertSlashBF', 'Slashes/YSlashBF', getProperty('boyfriend.x')-100, getProperty('boyfriend.y')+30)
    setProperty('VertSlashBF.antialiasing', false)
    scaleObject('VertSlashBF', 3, 3)
    addLuaSprite('VertSlashBF', true)
    setProperty('VertSlashBF.flipX', true)
    setProperty('VertSlashBF.visible', false)

    makeLuaSprite('RightSlashBF', 'Slashes/RSlashBF', getProperty('boyfriend.x')-100, getProperty('boyfriend.y')+30)
    setProperty('RightSlashBF.antialiasing', false)
    scaleObject('RightSlashBF', 3, 3)
    addLuaSprite('RightSlashBF', true)
    setProperty('RightSlashBF.flipX', true)
    setProperty('RightSlashBF.visible', false)

    makeLuaSprite('LeftSlashBF', 'Slashes/LSlashBF', getProperty('boyfriend.x')-100, getProperty('boyfriend.y')+30)
    setProperty('LeftSlashBF.antialiasing', false)
    scaleObject('LeftSlashBF', 3, 3)
    addLuaSprite('LeftSlashBF', true)
    setProperty('LeftSlashBF.flipX', true)
    setProperty('LeftSlashBF.visble', false)

end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackRIGHT', 'attackDOWN', 'attackUP', 'attackLEFT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'BF_Slash' then

		characterPlayAnim('boyfriend', ''..attackAnimations[noteData+1], true);
		setProperty('boyfriend.specialAnim', true);
        if not isSustainNote then
            if attackAnimations[noteData+1] == 'attackRIGHT' then
                setProperty('RightSlashBF.visible', true)
                doTweenX('Slashs', 'RightSlashBF', '-300','0.2', 'linear')
            end
            if attackAnimations[noteData+1] == 'attackDOWN' or attackAnimations[noteData+1] == 'attackUP' then
                setProperty('VertSlashBF.visible', true)
                doTweenX('Slashs', 'VertSlashBF', '-300','0.2', 'linear')
            end 
            if attackAnimations[noteData+1] == 'attackLEFT' then
                doTweenX('Slashs', 'LeftSlashBF', '-300','0.2', 'linear')
                setProperty('LeftSlashBF.visible', true)
            end
        end
        setProperty('VertSlashBF.x', getProperty('boyfriend.x')-100 )
        setProperty('RightSlashBF.x', getProperty('boyfriend.x')-100 )
        setProperty('LeftSlashBF.x', getProperty('boyfriend.x')-100 )


	end

    
	if noteType == 'BF_Slash' then
    else
        setProperty('VertSlashBF.visible', false)
        setProperty('RightSlashBF.visible', false)
        setProperty('LeftSlashBF.visible', false)
    end
end

function onUpdate()
    if getProperty('VertSlashBF.x') == getProperty('boyfriend.x')-100 then
        setProperty('VertSlashBF.visible', false)
    end
    if getProperty('RightSlashBF.x') == getProperty('boyfriend.x')-100 then
        setProperty('RightSlashBF.visible', false)
    end
    if getProperty('LeftSlashBF.x') == getProperty('boyfriend.x')-100 then
        setProperty('LeftSlashBF.visible', false)
    end

end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'BF_Slash' then
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

		-- health loss | || || |_
		setProperty('health', getProperty('health') - 0.06 );
	end
end
