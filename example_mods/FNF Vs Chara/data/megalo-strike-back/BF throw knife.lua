function onCreatePost()
    makeLuaSprite('BFKnife', 'KnifeThrow', getProperty('boyfriend.x')-30, 0)
    setProperty('BFKnife.antialiasing', false)
    scaleObject('BFKnife', 3, 3)
    addLuaSprite('BFKnife',true)
    setProperty('BFKnife.alpha',0)

end

function onUpdate()
    setProperty('BFKnife.y', getProperty('boyfriend.y')+80)

    if getProperty('boyfriend.animation.curAnim.name') == 'THROW' then

		if getProperty('boyfriend.animation.curAnim.curFrame') == 0 then 
			setProperty('BFKnife.alpha', 0)
            setProperty('BFKnife.x', getProperty('boyfriend.x')-30)
		end

		if getProperty('boyfriend.animation.curAnim.curFrame') == 4 then 
            setProperty('BFKnife.alpha', 1)
			doTweenX('THROWKNIFE', 'BFKnife', -1000, 0.5, 'linear')
		end
        
	end
end