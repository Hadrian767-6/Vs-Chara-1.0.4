function onCreate()

	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is a Bullet Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Shadow_BF_Slash' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/ShadowBFNOTE'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.1); --Change amount of health to take when you miss like a fucking moron
			setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false);
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
		end
	end
	--debugPrint('Script started!')
    
        makeAnimatedLuaSprite('BF2', 'characters/BF2', 650, getProperty('boyfriend.y')-78)
    
    --BF Slashes
    makeLuaSprite('ShadowVertSlashBF', 'Slashes/YSlashBF', getProperty('BF2.x')-30, getProperty('BF3.y')+120)
    setProperty('ShadowVertSlashBF.antialiasing', false)
    scaleObject('ShadowVertSlashBF', 3, 3)
    addLuaSprite('ShadowVertSlashBF', true)
    setProperty('ShadowVertSlashBF.flipX', true)
    setProperty('ShadowVertSlashBF.visible', false)

    makeLuaSprite('ShadowRightSlashBF', 'Slashes/RSlashBF', getProperty('BF2.x')-30, getProperty('BF3.y')+120)
    setProperty('ShadowRightSlashBF.antialiasing', false)
    scaleObject('ShadowRightSlashBF', 3, 3)
    addLuaSprite('ShadowRightSlashBF', true)
    setProperty('ShadowRightSlashBF.flipX', true)
    setProperty('ShadowRightSlashBF.visible', false)

    makeLuaSprite('ShadowLeftSlashBF', 'Slashes/LSlashBF', getProperty('BF2.x')-30, getProperty('BF3.y')+120)
    setProperty('ShadowLeftSlashBF.antialiasing', false)
    scaleObject('ShadowLeftSlashBF', 3, 3)
    addLuaSprite('ShadowLeftSlashBF', true)
    setProperty('ShadowLeftSlashBF.flipX', true)
    setProperty('ShadowLeftSlashBF.visble', false)
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

attackAnimations = {'attackLEFT', 'attackDOWN', 'attackUP', 'attackRIGHT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Shadow_BF_Slash' then

            
        --Shadow Chara
        
        makeAnimatedLuaSprite('BF2', 'characters/BF2', 700, getProperty('boyfriend.y')-78)
        addAnimationByPrefix('BF2', 'attackLEFT', 'BF left', 16, false)
        addAnimationByPrefix('BF2', 'attackDOWN', 'BF down', 16, false)
        addAnimationByPrefix('BF2', 'attackUP', 'BF up', 16, false)
        addAnimationByPrefix('BF2', 'attackRIGHT', 'BF right', 16, false)
        setProperty('BF2.antialiasing', false)
        scaleObject('BF2', 3, 3)
        setProperty('BF2.flipX',false)
        addLuaSprite('BF2',false)

		objectPlayAnimation('BF2', attackAnimations[noteData+1]);
        if not isSustainNote then
            if attackAnimations[noteData+1] == 'attackRIGHT' then
                setProperty('ShadowRightSlashBF.visible', true)
                doTweenX('Slashs', 'ShadowRightSlashBF', '-300','0.2', 'linear')
            end
            if attackAnimations[noteData+1] == 'attackDOWN' or attackAnimations[noteData+1] == 'attackUP' then
                setProperty('ShadowVertSlashBF.visible', true)
                doTweenX('Slashs', 'ShadowVertSlashBF', '-300','0.2', 'linear')
            end 
            if attackAnimations[noteData+1] == 'attackLEFT' then
                doTweenX('Slashs', 'ShadowLeftSlashBF', '-300','0.2', 'linear')
                setProperty('ShadowLeftSlashBF.visible', true)
            end
        end
        
        setProperty('ShadowVertSlashBF.x', getProperty('BF2.x')-30 )
        setProperty('ShadowRightSlashBF.x', getProperty('BF2.x')-30 )
        setProperty('ShadowLeftSlashBF.x', getProperty('BF2.x')-30 )


	end
end

function onUpdate()
    if getProperty('ShadowVertSlashBF.x') == getProperty('BF2.x')-30 then
        setProperty('ShadowVertSlashBF.visible', false)
    end
    if getProperty('ShadowRightSlashBF.x') == getProperty('BF2.x')-30 then
        setProperty('ShadowRightSlashBF.visible', false)
    end
    if getProperty('ShadowLeftSlashBF.x') == getProperty('BF2.x')-30 then
        setProperty('ShadowLeftSlashBF.visible', false)
    end

end

function noteMiss(id, noteData, noteType, isSustainNote)
    if noteType == 'Shadow_BF_Slash' then
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