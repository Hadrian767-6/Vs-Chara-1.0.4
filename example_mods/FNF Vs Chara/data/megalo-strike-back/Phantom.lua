notSus = false
att = false
singP = false
function onUpdate()
    setProperty('Phantom.x', getProperty('dad.x')-80)
    setProperty('Phantom.y', getProperty('dad.y')-79)

    function opponentNoteHit(id, noteData, noteType, isSustainNote)
        if noteType == 'Phantom_Attack' or noteType == 'Phantom_Air' then
            att = true
            if not isSustainNote then
                notSus = true
            end
        else
            att = false
        end

        if noteType == 'Phantom' then
            singP = true
        else
            singP = false
        end
    end

    if notSus == true and att == true then
        if getProperty('Phantom.animation.curAnim.curFrame') == 0 then
            setProperty('Phantom.alpha', 0.6)
        else
            setProperty('Phantom.alpha', 0)
        end
    end


    if singP == true then
        if getProperty('Phantom.animation.curAnim.curFrame') == 3 then
            runTimer('bye', 0.1)
        end
    end

    if curStep >= 2192 then
        setProperty('Phantom.alpha', 0)
    end
end

function onTimerCompleted(tag)
    if tag == 'bye' then
        doTweenAlpha('byePhantom', 'Phantom', 0, 0.01, 'linear')
    end
end