xx = 600
yy = 20
scrspd = 0
ECHO = false
walk = false
function onCreate()

    makeLuaSprite('BG', 'BG', -800, -420)
    setProperty('BG.antialiasing', false)
    scaleObject('BG', 3, 3)
    addLuaSprite('BG', false)

    makeLuaSprite('BG2', 'BG', 0, -420)
    setProperty('BG2.antialiasing', false)
    scaleObject('BG2', 3, 3)
    addLuaSprite('BG2', false)

    makeAnimatedLuaSprite('Collapsing', 'BG Collapse', 295, -420)
    addAnimationByPrefix('Collapsing', 'coll', 'BG idle', 14, true)
    setProperty('Collapsing.antialiasing', false)
    scaleObject('Collapsing', 3, 3)
    addLuaSprite('Collapsing', false)
	setProperty('Collapsing.alpha', 0)
    
    makeLuaSprite('BlkFilter', '', -1000, -200);
	makeGraphic('BlkFilter',1280,720,'000000')
	scaleObject('BlkFilter', 2.5, 2.5)
    addLuaSprite('BlkFilter', false)
	setProperty('BlkFilter.alpha', 0.1)

    makeLuaSprite('red2', '', -1000, -200);
	makeGraphic('red2',1280,720,'FF0000')
	scaleObject('red2', 2.5, 2.5)
    addLuaSprite('red2', false)
	setProperty('red2.alpha', 0)


    makeAnimatedLuaSprite('WalkChara', 'characters/Chara', 0, 0)
    addAnimationByPrefix('WalkChara', 'Walk', 'Chara walk', 8, true)
    addAnimationByPrefix('WalkChara', 'End', 'Chara end', 4, false)
    setProperty('WalkChara.antialiasing', false)
    scaleObject('WalkChara', 3, 3)
    setProperty('WalkChara.flipX',false)
    addLuaSprite('WalkChara',false)
    objectPlayAnimation('WalkChara', 'Walk')
    setProperty('WalkChara.alpha',0)

    makeLuaSprite('Smile', 'SMILE', 350, 0)
    setProperty('Smile.antialiasing', false)
    scaleObject('Smile', 5, 5)
    addLuaSprite('Smile',false)
    setProperty('Smile.alpha',0)

    makeAnimatedLuaSprite('StandingBF', 'characters/BF', 635, -78)
    addAnimationByIndices('StandingBF', 'Fear', 'BF chained',  {0, 1, 2, 3}, 12, true)
    addAnimationByPrefix('StandingBF', 'Stand', 'BF standing', 8, false)
    addAnimationByPrefix('StandingBF', 'Chained', 'BF chained', 12, false)
    addAnimationByIndices('StandingBF', 'Freeze', 'BF end',  {0})
    addAnimationByPrefix('StandingBF', 'End', 'BF end', 12, false)
    setProperty('StandingBF.antialiasing', false)
    scaleObject('StandingBF', 3, 3)
    setProperty('StandingBF.flipX',false)
    addLuaSprite('StandingBF',false)
    setProperty('StandingBF.alpha',0)
end

function onUpdate()
    triggerEvent('Camera Follow Pos', xx, yy)
    setProperty('WalkChara.x', getProperty('dad.x')-90)
    setProperty('WalkChara.y', getProperty('dad.y')-78)
    if scrspd == 0 then
        setProperty('BG.antialiasing', false)
        setProperty('BG2.antialiasing', false)
    else
        setProperty('BG.antialiasing', true)
        setProperty('BG2.antialiasing', true)
    end

    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
        setProperty('boyfriend.angle', 0)
    end
    
    if curStep >= 2288 and curStep < 2343 then
        
        xx = getProperty('dad.x') +100

    end
    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteType ~= 'ReverseDodge' and noteType ~= 'ReverseDodgeJump' then
            if curStep>= 0 and curStep <= 2288 or curStep>= 2544 and curStep <= 2608 then
                setProperty('dad.flipX', false)
            end

            if curStep > 2288 and curStep < 2544 then
                setProperty('dad.flipX', true)
            end
        end
    end

end

function onStepHit()
    if curStep == 128 then
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end

    if curStep == 256 then
        scrspd = 0
    end

    if curStep == 288 then
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end

    if curStep == 320 then
        scrspd = 0
    end
    
    if curStep == 371 then
        xx = 620
    end

    if curStep == 375 then
        xx = 600
    end

    if curStep == 379 then
        xx = 620
    end

    if curStep == 383 then
        xx = 600
    end

    if curStep == 416 then
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end

    if curStep == 432 then
        doTweenZoom('camz','camGame', 3.2, 1.7,'sineInOut')
        yy = 45
    end

    if curStep == 440 then
        triggerEvent('Screen Shake', '0.8, 0.02', '')
    end

    if curStep == 448 then
        yy=20
        scrspd = 0
    end

    if curStep == 596 then
        xx = 610
    end
    
    if curStep == 624 then
        setProperty('defaultCamZoom', 3.6)
        xx = 650
        yy = 70
        doTweenZoom('screenZoom', 'camGame', 3.6, 0.000001, 'quadInOut')
    end

    if curStep == 632 then
        setProperty('defaultCamZoom', 4.8)
        triggerEvent('Screen Shake', '0.8, 0.01', '')
        xx = 690
        yy = 90
        doTweenZoom('screenZoom', 'camGame', 4.8, 0.000001, 'quadInOut')
    end

    if curStep == 640 then
        setProperty('defaultCamZoom', 2.1)
        xx = 600
        yy = 20
    end

    if curStep == 704 or curStep == 720 or curStep == 736 or curStep == 752 or curStep == 768 or curStep == 784 then
        triggerEvent('Screen Shake', '0.1, 0.009 ', '')
    end

    if curStep == 800 or curStep == 816 then
        triggerEvent('Screen Shake', '0.13, 0.02 ', '')
    end

    if curStep == 800 then
        setProperty('defaultCamZoom', 2.9)
        yy = 70
    end

    if curStep == 814 then
        setProperty('defaultCamZoom', 2.1)
    end

    if curStep == 816 then
        setProperty('defaultCamZoom', 2.9)
    end

    if curStep == 824 then
        setProperty('defaultCamZoom', 2.1)
    end

    if curStep == 828 then
        setProperty('defaultCamZoom', 2.9)
        triggerEvent('Screen Shake', '0.05, 0.02 ', '')
    end

    if curStep == 832 then
        setProperty('defaultCamZoom', 2.1)
        yy = 20
    end

    if curStep == 928 then
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end

    if curStep == 1152 then
        scrspd = 0
        setProperty('defaultCamZoom', 2.9)
        yy = 40
    end

    if curStep == 1168 then
        setProperty('defaultCamZoom', 2.1)
        yy = 20
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end
    
    if curStep == 1192 then
        triggerEvent('Screen Shake', '0.6, 0.02 ', '')
        setProperty('defaultCamZoom', 2.9)
        xx = 650
        yy = 40
    end

    if curStep == 1200 then
        setProperty('defaultCamZoom', 2.1)
        xx = 600
        yy = 20
    end

    if curStep == 1296 then
        scrspd = 0
    end

    if curStep == 1536 then
        triggerEvent('Screen Shake', '1.4, 0.02 ', '')
    end

    if curStep == 1552 then
        scrspd = 0.2
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
    end

    if curStep == 1632 then
        triggerEvent('Screen Shake', '1.4, 0.02 ', '')
        setProperty('defaultCamZoom', 2.6)
        xx = 680
        yy = 40
    end

    if curStep == 1648 then
        setProperty('defaultCamZoom', 2.1)
        xx = 600
        yy = 20
    end

    if curStep == 1748 or curStep == 1750 or curStep == 1752 or curStep == 1754 then
        triggerEvent('Screen Shake', '0.1, 0.02 ', '')
    end

    if curStep == 1780 or curStep == 1782 or curStep == 1784 or curStep == 1786 then
        triggerEvent('Screen Shake', '0.1, 0.02 ', '')
    end

    if curStep == 1808 then
        scrspd = 0
    end

    if curStep == 1864 then
        setProperty('defaultCamZoom', 3.8)
        xx = 520
        yy = 0
    end

    if curStep == 1872 then
        triggerEvent('Screen Shake', '0.4, 0.03', '')
        setProperty('defaultCamZoom', 2.1)
        setProperty('Collapsing.alpha', 1)
        setProperty('BlkFilter.alpha', 0.25)
        xx = 600
        yy = 20
    end


    if curStep == 2192 then
        triggerEvent('Change Character', 'Dad', 'Chara2')
        setProperty('BG.alpha', 0)
        setProperty('BG2.alpha', 0)
        doTweenAlpha('BGfadeoutCollapse', 'Collapsing', 0 , 1 , 'linear')
    end

    if curStep == 2288 then
        triggerEvent('Screen Shake', '6.2, 0.01', '')

        setProperty('defaultCamZoom', 3.5)


        objectPlayAnimation('StandingBF', 'Fear')
        setProperty('dad.alpha',0)
        setProperty('Smile.alpha',0.7)
        setProperty('WalkChara.alpha',1)
        setProperty('boyfriend.alpha',0)
        setProperty('StandingBF.alpha',1)
        yy = 70
        walk = true
        doTweenAlpha('redloop','red2', 1, 0.3 ,'quadOut')
    end

    if curStep == 2320 then
        triggerEvent('Change Character', 'BF', 'Soul BF')
        setProperty('boyfriend.alpha',1)
        objectPlayAnimation('StandingBF', 'Chained')
    end

    if curStep == 2344 then
        walk = false
        xx = 600
        yy = 20

        setProperty('red2.alpha', 0)
        cancelTween('redlights2')
        cancelTween('redloop')
        setProperty('BG.alpha', 1)
        setProperty('BG2.alpha', 1)
        setProperty('Smile.alpha',0)

        setProperty('dad.alpha',1)
        setProperty('WalkChara.alpha',0)
        setProperty('defaultCamZoom', 2.1)
        triggerEvent('Change Character', 'Dad', 'CharaFlip')
    end

    if curStep == 2544 then
        triggerEvent('Change Character', 'BF', 'msb bf')
        setProperty('boyfriend.scale.x',3)
        setProperty('boyfriend.scale.y',3)
        setProperty('StandingBF.alpha',0)
        triggerEvent('Change Character', 'Dad', 'Chara')
    end
    
    if curStep == 2604 then
        objectPlayAnimation('StandingBF', 'Freeze')
        setProperty('StandingBF.x', 530)
    end

    if curStep == 2608 then
        setProperty('boyfriend.alpha',0)
        setProperty('StandingBF.alpha',1)
        doTweenX('Pushed', 'StandingBF', 635, 0.2, 'quadOut')
        triggerEvent('Screen Shake', '0.4, 0.02 ', '')
    end

    if curStep == 2624 then
        xx = 650
        objectPlayAnimation('StandingBF', 'End')
    end

    if curStep == 2632 then
        setProperty('dad.alpha',0)
        setProperty('WalkChara.alpha',1)
        objectPlayAnimation('WalkChara', 'End')
    end

end

function onTweenCompleted(tag)

    if tag =='BGscroll' then
        doTweenX('BGscroll', 'BG', -1600, 1*scrspd, 'linear')
        doTweenX('BGscroll2', 'BG2', -800, 1*scrspd, 'linear')
        setProperty('BG.x', -800)
        setProperty('BG2.x', 0)
        setProperty('BG.antialiasing', true)
        setProperty('BG2.antialiasing', true)
    end

    if tag == 'redloop' then
        doTweenAlpha('redlights2','red2' , 0.2 , 1.3 ,'quadIn')
    end

    if tag == 'redlights2' then
        doTweenAlpha('redloop','red2' , 1 , 0.3 ,'quadOut')
    end

end

    
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    setProperty('dad.angle', 0)
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
    setProperty('boyfriend.flipX', false)
    setProperty('boyfriend.angle', 0)
end

function noteMiss(id, noteData, noteType, isSustainNote)
    setProperty('boyfriend.flipX', false)
    setProperty('boyfriend.angle', 0)
end