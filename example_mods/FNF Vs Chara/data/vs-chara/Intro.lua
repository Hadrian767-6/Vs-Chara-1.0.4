-- DO NOT DELETE THIS FILE.
-- ... i mean you can if you want but then it'll just break.
-- trust me.
-- im not hiding anything.
local blockVersionPrefixes = {'0.3', '0.4', '0.5', '0.6'} --because people are too fucking stubborn to update and it breaks the mod ffs >:(
local stopload = false


function onStartCountdown()
	-- countdown started, duh
	if not allowCountdown then
		return Function_Stop
	end
	return Function_Continue;
end

function onCreate()

	for k, v in pairs(blockVersionPrefixes) do
		if version:find('^'..v:gsub("^%s*(.-)%s*$", "%1")) ~= nil then
			stopload = true
		end
	end
	
	setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
	setPropertyFromClass('openfl.Lib', 'application.window.borderless', true)
	setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
	addHaxeLibrary("Lib", "openfl");
	setProperty('cameraSpeed', 99)
	
	setPropertyFromClass('openfl.Lib', 'application.window.title', "VS CHARA")

	setProperty('scoreTxt.alpha', 0)
	setProperty('botplayTxt.visible', false)
	setProperty('healthBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)

	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('boyfriend.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('gf.alpha', 0)

	makeLuaSprite('BG', 'BlackBG', 0, 0)
	setProperty('BG.antialiasing', false)
	scaleObject('BG', 3, 3)
	setObjectCamera('BG', 'other')
	addLuaSprite('BG',false)
	setProperty('BG.alpha', 1)

    makeLuaSprite('Chara', 'Intro/Intro Chara', 600, 300)
	setProperty('Chara.antialiasing', false)
	scaleObject('Chara', 3, 3)
	setObjectCamera('Chara', 'other')
	addLuaSprite('Chara',true)
	setProperty('Chara.alpha', 1)

	playSound('mus_zzz', 1, 'intro')


	makeAnimatedLuaSprite('slash', 'slice', 500, 0)
    addAnimationByPrefix('slash', 'slice', 'slice', 8, false)
    setProperty('slash.antialiasing', false)
    scaleObject('slash', 7, 7)
	setObjectCamera('slash','other')
    addLuaSprite('slash',true)
    setProperty('slash.alpha',0)

    makeLuaSprite('99', '99999', 0, 0)
    setProperty('99.antialiasing', false)
    scaleObject('99', 3, 3)
	setObjectCamera('99','other')
    addLuaSprite('99',true)
    setProperty('99.alpha',0)


end

function onSoundFinished(tag)
	if tag == 'intro' then
		playSound('mus_zzz', 1, 'intro')
	end
end

function onCreatePost()
	runTimer('startTalking', 3)
end

curtxt = 0
lastframe = 0

function onUpdate()

	debugPrint(getProperty('Texts'..curtxt..'.animation.curAnim.curFrame'))

	if curtxt == 1 then
		lastframe = 3
	elseif curtxt == 2 then
		lastframe = 15
	elseif curtxt == 3 then
		lastframe = 44
	elseif curtxt == 4 then
		lastframe = 68
	elseif curtxt == 5 then
		lastframe = 27
	elseif curtxt == 6 then
		lastframe = 3
	elseif curtxt == 7 then
		lastframe = 70
	elseif curtxt == 8 then
		lastframe = 41
	elseif curtxt == 9 then
		lastframe = 30
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') and getProperty('Texts.animation.curAnim.curFrame') == lastframe or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and getProperty('Texts.animation.curAnim.curFrame') == lastframe then
		curtxt = curtxt +1
		makeAnimatedLuaSprite('Texts', 'Intro/text'..curtxt, 190, 450)
		addAnimationByPrefix('Texts', 'idle', 'text idle', 16, false)
		setProperty('Texts.antialiasing', false)
		scaleObject('Texts', 3, 3)
		addLuaSprite('Texts', true)
		setObjectCamera('Texts', 'other')
		setProperty('Texts.alpha', 1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') and curtxt == 8 and getProperty('Texts.animation.curAnim.curFrame') == 0 or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and curtxt == 8 and getProperty('Texts.animation.curAnim.curFrame') == 0 then
		makeLuaSprite('BG', 'BlackBG', 0, 0)
		setProperty('BG.antialiasing', false)
		scaleObject('BG', 3, 3)
		setObjectCamera('BG', 'other')
		addLuaSprite('BG',false)
		setProperty('BG.alpha', 1)
		setProperty('Chara.alpha', 0)
		playSound('Heal',1)
	end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.Z') and curtxt == 10 or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and curtxt == 10 then
		makeLuaSprite('BG', 'BlackBG', 0, 0)
		setProperty('BG.antialiasing', false)
		scaleObject('BG', 3, 3)
		setObjectCamera('BG', 'other')
		addLuaSprite('BG',true)
		setProperty('BG.alpha', 1)
		loadSong('megalo-strike-back');
	end
end

function onTimerCompleted(tag)
	if tag == 'startTalking' then
		curtxt = 1
		makeAnimatedLuaSprite('Texts', 'Intro/text'..curtxt, 190, 450)
		addAnimationByPrefix('Texts', 'idle', 'text idle', 16, false)
		setProperty('Texts.antialiasing', false)
		scaleObject('Texts', 3, 3)
		addLuaSprite('Texts', true)
		setObjectCamera('Texts', 'other')
		setProperty('Texts.alpha', 1)
	end
end

function onDestroy()
	
runHaxeCode([[
    var stage = Lib.current.stage;
    var resolutionX = 0;
    var resolutionY = 0;

    if (stage.window != null)
    {
        var display = stage.window.display;

        if (display != null)
        {
            resolutionX = Math.ceil(display.currentMode.width * stage.window.scale);
            resolutionY = Math.ceil(display.currentMode.height * stage.window.scale);
        }
    }

    if(resolutionX <= 0){
        resolutionX = stage.stageWidth;
        resolutionY = stage.stageHeight;
    }

  Lib.application.window.x = (resolutionX - Lib.application.window.width)/2;
  Lib.application.window.y = (resolutionY - Lib.application.window.height)/2;
]]);

end
-- delete it if you dare.