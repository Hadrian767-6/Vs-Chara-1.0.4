function onCreate()
    makeLuaSprite('BFHitBox', '', -1000, -200);
	makeGraphic('BFHitBox',18,30,'00FFFF')
	scaleObject('BFHitBox', 2.5, 2.5)
    addLuaSprite('BFHitBox', true)
	setProperty('BFHitBox.alpha', 0)

    
    makeLuaSprite('BFHurtBox', '', -1000, -200);
	makeGraphic('BFHurtBox',18,30,'0088FF')
	scaleObject('BFHurtBox', 2.5, 2.5)
    addLuaSprite('BFHurtBox', true)
	setProperty('BFHurtBox.alpha', 0)
    
    makeLuaSprite('CharaHitBox', '', -1000, -200);
	makeGraphic('CharaHitBox',18,30,'FF0000')
	scaleObject('CharaHitBox', 2.5, 2.5)
    addLuaSprite('CharaHitBox', true)
	setProperty('CharaHitBox.alpha',0)

    makeAnimatedLuaSprite('VertImpact', 'Impacts/VertImpact', 0, 0)
    addAnimationByPrefix('VertImpact', 'idle', 'VertImpact idle', 12, false)
    setProperty('VertImpact.antialiasing', false)
    scaleObject('VertImpact', 3, 3)
    addLuaSprite('VertImpact',false)
    setProperty('VertImpact.alpha',0)

    makeAnimatedLuaSprite('HoriImpact', 'Impacts/HoriImpact', 0, 0)
    addAnimationByPrefix('HoriImpact', 'idle', 'HoriImpact idle', 24, false)
    setProperty('HoriImpact.antialiasing', false)
    scaleObject('HoriImpact', 3, 3)
    addLuaSprite('HoriImpact',false)
    setProperty('HoriImpact.alpha',0)

    makeAnimatedLuaSprite('InteractionImpact', 'Impacts/InteractionImpact', 0, 0)
    addAnimationByPrefix('InteractionImpact', 'idle', 'InteractionImpact idle', 24, false)
    setProperty('InteractionImpact.antialiasing', false)
    scaleObject('InteractionImpact', 3, 3)
    addLuaSprite('InteractionImpact',false)
    setProperty('InteractionImpact.alpha',0)
    
    makeAnimatedLuaSprite('ImpactBF', 'Impacts/ImpactBF', 0, 0)
    addAnimationByPrefix('ImpactBF', 'idle', 'ImpactBF idle', 16, false)
    setProperty('ImpactBF.antialiasing', false)
    scaleObject('ImpactBF', 3, 3)
    addLuaSprite('ImpactBF',false)
    setProperty('ImpactBF.alpha',0)

    makeAnimatedLuaSprite('ImpactChara', 'Impacts/ImpactChara', 0, 0)
    addAnimationByPrefix('ImpactChara', 'idle', 'ImpactChara idle', 16, false)
    setProperty('ImpactChara.antialiasing', false)
    scaleObject('ImpactChara', 2.5, 2.5)
    addLuaSprite('ImpactChara',false)
    setProperty('ImpactChara.flipX',true)
    setProperty('ImpactChara.alpha',0)
    
end


Hori = false
Vert = false

BFrandY = 0
BFSizeX = 0
BFSizeY = 0
ChararandY = 0
CharaSizeX = 0
CharaSizeY = 0

CAttack = false
BFAttack = false

CClash = false
BFClash = false

CSlash = false
BFSlash = false

CBlock = false
BFBlock = false

CHARAAnim = {'block', '', '', 'CLASH'}
BFAnim = {'CLASH', '', '', 'block'}



dodged = true

function onUpdate()

    if getProperty('boyfriend.animation.curAnim.name') == 'block' and getProperty('boyfriend.animation.curAnim.curFrame') == 3 then 
		setProperty('VertImpact.alpha', 0)
		setProperty('HoriImpact.alpha', 0)
		setProperty('InteractionImpact.alpha', 0)
	end

    if curStep >= 1312 and curStep >= 1360 then
		setProperty('InteractionImpact.alpha', 0)
    end

    setObjectOrder('ImpactBF', getObjectOrder('boyfriendGroup')+0.1)
    setObjectOrder('ImpactChara', getObjectOrder('dadGroup')+0.1)

    setProperty('ImpactBF.x', getProperty('CharaHitBox.x')-70)
    setProperty('ImpactBF.y', getProperty('CharaHitBox.y')-130)
    setProperty('ImpactChara.x', getProperty('BFHitBox.x')-100)
    setProperty('ImpactChara.y', getProperty('BFHitBox.y')-100)

    
    setProperty('VertImpact.x', getProperty('CharaHitBox.x')-100)
    setProperty('VertImpact.y', getProperty('CharaHitBox.y')-130)
    setProperty('HoriImpact.x', getProperty('CharaHitBox.x')-90)
    setProperty('HoriImpact.y', getProperty('CharaHitBox.y')-130)
    setProperty('InteractionImpact.x', getProperty('CharaHitBox.x')-70)
    setProperty('InteractionImpact.y', getProperty('CharaHitBox.y')-130)

    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteType == 'Chara_Attack' or noteType == 'alt_Chara_Attack' or noteType == 'Chara_Air' or noteType == 'alt_Chara_Air' or noteType == 'Phantom_Attack' or noteType == 'Phantom_Air' then
            if noteData+1 == 1 or noteData+1 == 2 then
                Vert = true
            else
                Vert = false
            end

            if noteData+1 == 0 or noteData+1 == 3 then
                Hori = true
            else
                Hori = false
            end
        end

        if noteType == 'InteractionChara' and CHARAAnim[noteData+1] == 'block' then
            CBlock = true
        else
            CBlock = false
        end

        if noteType == 'Chara_Slash' or noteType == 'Chara_Air_Slash' or noteType == 'alt_Chara_Slash' or noteType == 'alt_Chara_Air_Slash' then
            CSlash = true
        else
            CSlash = false
        end

        if noteType == 'alt_CLASH' or noteType == 'Shadow_Clash' or noteType == 'InteractionChara' and CHARAAnim[noteData+1] == 'CLASH' then
            CClash = true
        else
            CClash = false
        end


        if noteType == 'Chara_Attack' or noteType == 'alt_Chara_Attack' or noteType == 'Chara_Air' or noteType == 'alt_Chara_Air' or noteType == 'Phantom_Attack' or noteType == 'Phantom_Air' then
            CAttack = true
        else
            CAttack = false
        end
    end

    function goodNoteHit(id, noteData, noteType, isSustainNote)
        
        if noteType == 'InteractionBF' and BFAnim[noteData+1] == 'block' then
            BFBlock = true
        else
            BFBlock = false
        end

        if noteType == 'BF_Attack' then
            if noteData+1 == 1 or noteData+1 == 2 then
                Vert = true
            else
                Vert = false
            end
            
            if noteData+1 == 0 or noteData+1 == 3 then
                Hori = true
            else
                Hori = false
            end
        end
        
        if noteType == 'BF_Slash' then
            BFSlash = true
        else
            BFSlash = false
        end

        if noteType == 'BF_Attack' then
            BFAttack = true
        else
            BFAttack = false
        end

        if noteType == 'InteractionBF' and BFAnim[noteData+1] == 'CLASH' then
            BFClash = true
        else
            BFClash = false
        end
    end

    function noteMiss(id, noteData, noteType, isSustainNote)
        if noteType == 'BF_Attack' then
            BFAttack = None
        end

        if noteType == 'BF_Slash' then
            BFSlash = false
        end

        if noteType == 'Dodge Note' or noteType == 'ReverseDodge' or noteType == 'ReverseSingDodge' or noteType == 'SingDodge Note' then
            dodged = false
        else
            dodged = true
        end
    end

    if BFAttack == true and CSlash == true then
        BFdefense = true
    else
        BFdefense = false
    end

    if CAttack == true and BFSlash == true then
        CharaDefense = true
    else
        CharaDefense = false
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('AVertSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('ARightSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('ALeftSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('VertSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('RightSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end

    if BFdefense and getProperty('BFHitBox.x')+160 <= getProperty('LeftSlashChara.x')+250 then
        BFrandY = getRandomInt(120,130)
        BFSizeX = getRandomInt(2.5,3)
        BFSizeY = getRandomInt(2.5,3)
        setProperty('ImpactChara.y', getProperty('BFHitBox.y')-BFrandY)
        scaleObject('ImpactChara', BFSizeX, BFSizeY)
        setProperty('ImpactChara.alpha',1)
        objectPlayAnimation('ImpactChara', 'idle')
    end



    if CharaDefense and getProperty('CharaHitBox.x') >= getProperty('VertSlashBF.x') then
        ChararandY = getRandomInt(120,125)
        CharaSizeX = getRandomInt(2.8,3)
        CharaSizeY = getRandomInt(2.8,3)
        setProperty('ImpactBF.y', getProperty('BFHitBox.y')-ChararandY)
        scaleObject('ImpactBF', CharaSizeX, CharaSizeY)
        setProperty('ImpactBF.alpha',1)
        objectPlayAnimation('ImpactBF', 'idle')
    end

    if CharaDefense and getProperty('CharaHitBox.x') >= getProperty('RightSlashBF.x') then
        ChararandY = getRandomInt(120,125)
        CharaSizeX = getRandomInt(2.8,3)
        CharaSizeY = getRandomInt(2.8,3)
        setProperty('ImpactBF.y', getProperty('BFHitBox.y')-ChararandY)
        scaleObject('ImpactBF', CharaSizeX, CharaSizeY)
        setProperty('ImpactBF.alpha',1)
        objectPlayAnimation('ImpactBF', 'idle')
    end

    if CharaDefense and getProperty('CharaHitBox.x') >= getProperty('LeftSlashBF.x') then
        ChararandY = getRandomInt(120,125)
        CharaSizeX = getRandomInt(2.8,3)
        CharaSizeY = getRandomInt(2.8,3)
        setProperty('ImpactBF.y', getProperty('BFHitBox.y')-ChararandY)
        scaleObject('ImpactBF', CharaSizeX, CharaSizeY)
        setProperty('ImpactBF.alpha',1)
        objectPlayAnimation('ImpactBF', 'idle')
    end

	if getProperty('ImpactChara.animation.curAnim.curFrame') == 0 then 
		setProperty('ImpactChara.alpha', 0.8)
	end
	if getProperty('ImpactChara.animation.curAnim.curFrame') == 1 then 
		setProperty('ImpactChara.alpha', 0.6)
	end
	if getProperty('ImpactChara.animation.curAnim.curFrame') == 2 then
		setProperty('ImpactChara.alpha', 0.4)
	end
    if getProperty('ImpactChara.animation.curAnim.curFrame') == 3 then 
		setProperty('ImpactChara.alpha', 0.2)
	end
    if getProperty('ImpactChara.animation.curAnim.curFrame') == 4 then
		setProperty('ImpactChara.alpha', 0)
	end



    if getProperty('ImpactBF.animation.curAnim.curFrame') == 0 then 
		setProperty('ImpactBF.alpha', 0.8)
	end
	if getProperty('ImpactBF.animation.curAnim.curFrame') == 1 then 
		setProperty('ImpactBF.alpha', 0.6)
	end
	if getProperty('ImpactBF.animation.curAnim.curFrame') == 2 then
		setProperty('ImpactBF.alpha', 0.4)
	end
    if getProperty('ImpactBF.animation.curAnim.curFrame') == 3 then 
		setProperty('ImpactBF.alpha', 0.2)
	end
    if getProperty('ImpactBF.animation.curAnim.curFrame') == 4 then
		setProperty('ImpactBF.alpha', 0)
	end

    if getProperty('VertImpact.animation.curAnim.curFrame') == 3 then
		setProperty('VertImpact.alpha', 0)
	end

    if getProperty('InteractionImpact.animation.curAnim.curFrame') == 3 then
		setProperty('InteractionImpact.alpha', 0)
	end
    
	setProperty('BFHitBox.x', getProperty('boyfriend.x')-50)
	setProperty('BFHitBox.y', getProperty('boyfriend.y')+50)
	setProperty('BFHurtBox.x', getProperty('boyfriend.x')+20)
	setProperty('BFHurtBox.y', getProperty('boyfriend.y')+50)
	setProperty('CharaHitBox.x', getProperty('dad.x')+80)
	setProperty('CharaHitBox.y', getProperty('dad.y')+50)

    if BFClash == true and CClash == true then
        objectPlayAnimation('InteractionImpact', 'idle')
        setProperty('InteractionImpact.alpha', 1)
        setProperty('InteractionImpact.x', getProperty('CharaHitBox.x')-90)
    end

    if Hori == true and BFAttack == true and CAttack == true then
        objectPlayAnimation('HoriImpact', 'idle')
        setProperty('HoriImpact.alpha', 1)
    end

    if Vert == true and BFAttack == true and CAttack == true then
        objectPlayAnimation('VertImpact', 'idle')
        setProperty('VertImpact.alpha', 1)
    end

    if CAttack == true and BFBlock == true then
        objectPlayAnimation('InteractionImpact', 'idle')
        setProperty('InteractionImpact.alpha', 1)
        setProperty('InteractionImpact.x', getProperty('BFHitBox.x')-70)
		setObjectOrder('InteractionImpact', getObjectOrder('boyfriendGroup')+0.1)
    end

    if BFAttack == true and CBlock == true then
        objectPlayAnimation('InteractionImpact', 'idle')
        setProperty('InteractionImpact.alpha', 1)
        setProperty('InteractionImpact.x', getProperty('CharaHitBox.x')-100)
		setObjectOrder('InteractionImpact', getObjectOrder('dadGroup')+0.1)
    end

    if CClash == true and BFBlock == true then
        objectPlayAnimation('InteractionImpact', 'idle')
        setProperty('InteractionImpact.alpha', 1)
        setProperty('InteractionImpact.x', getProperty('BFHitBox.x'))
		setObjectOrder('InteractionImpact', getObjectOrder('boyfriendGroup')+0.1)
    end

    if BFClash == true and CBlock == true then
        objectPlayAnimation('InteractionImpact', 'idle')
        setProperty('InteractionImpact.alpha', 1)
        setProperty('InteractionImpact.x', getProperty('CharaHitBox.x')-100)
		setObjectOrder('InteractionImpact', getObjectOrder('dadGroup')+0.1)
    end


    --alt Chara slashs
    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('AVertSlashChara.x') then
        setProperty('AVertSlashChara.x', -200)
    end

    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('ARightSlashChara.x') then
        setProperty('ARightSlashChara.x', -200)
    end

    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('ALeftSlashChara.x') then
        setProperty('ALeftSlashChara.x', -200)
    end


    --Chara slashs
    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('VertSlashChara.x')+250 then
        setProperty('VertSlashChara.x', -200)
    end

    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('RightSlashChara.x')+250 then
        setProperty('RightSlashChara.x', -200)
    end

    if BFAttack == true and CSlash == true and getProperty('BFHitBox.x')+160 <= getProperty('LeftSlashChara.x')+250 then
        setProperty('LeftSlashChara.x', -200)
    end


    --BF slashs
    if CAttack == true and BFSlash == true and getProperty('CharaHitBox.x') >= getProperty('VertSlashBF.x') then
        setProperty('VertSlashBF.x', 0)
    end

    if CAttack == true and BFSlash == true and getProperty('CharaHitBox.x') >= getProperty('RightSlashBF.x') then
        setProperty('RightSlashBF.x', 0)
    end

    if CAttack == true and BFSlash == true and getProperty('CharaHitBox.x') >= getProperty('LeftSlashBF.x') then
        setProperty('LeftSlashBF.x', 0)
    end

    --Dodge thing
    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('VertSlashChara.x') then
        setProperty('VertSlashChara.x', -200)
    end

    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('RightSlashChara.x') then
        setProperty('RightSlashChara.x', -200)
    end

    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('LeftSlashChara.x') then
        setProperty('LeftSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('VertSlashChara.x') then
        setProperty('VertSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('RightSlashChara.x') then
        setProperty('RightSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('LeftSlashChara.x') then
        setProperty('LeftSlashChara.x', -200)
    end

    --Dodge thing (if alt Chara anim)
    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('AVertSlashChara.x') then
        setProperty('AVertSlashChara.x', -200)
    end

    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('ARightSlashChara.x') then
        setProperty('ARightSlashChara.x', -200)
    end

    if dodged == false and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('ALeftSlashChara.x') then
        setProperty('ALeftSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('AVertSlashChara.x') then
        setProperty('AVertSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('ARightSlashChara.x') then
        setProperty('ARightSlashChara.x', -200)
    end

    if BFAttack == None and CSlash == true and getProperty('BFHurtBox.x')-80 <= getProperty('ALeftSlashChara.x') then
        setProperty('ALeftSlashChara.x', -200)
    end


    if getProperty('BF2.alpha') == 0 then
        setProperty('ShadowVertSlashBF.visible', false)
        setProperty('ShadowRightSlashBF.visible', false)
        setProperty('ShadowLeftSlashBF.visible', false)
    end

    if getProperty('CHARA2.alpha') == 0 then
        setProperty('ShadowAltVertSlashChara.visible', false)
        setProperty('ShadowAltRightSlashChara.visible', false)
        setProperty('ShadowAltLeftSlashChara.visible', false)
    end

    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        BFBlock = false
	end
end