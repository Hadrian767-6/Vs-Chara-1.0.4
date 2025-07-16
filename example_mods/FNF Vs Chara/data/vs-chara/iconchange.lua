function onCreate()
    luaDebugMode = false
    if buildTarget == 'windows' then
           local appIcon = 'soul'
           addHaxeLibrary('Application', 'lime.app')
           addHaxeLibrary('Image', 'lime.graphics')
           runHaxeCode("Application.current.window.setIcon(Image.fromFile(Paths.modFolders('images/"..appIcon..".png')));")
       end
end

function onDestroy()
    luaDebugMode = false
    if buildTarget == 'windows' then
        local appIcon = 'defaultIcon'
        addHaxeLibrary('Application', 'lime.app')
        addHaxeLibrary('Image', 'lime.graphics')
        runHaxeCode("Application.current.window.setIcon(Image.fromFile(Paths.modFolders('images/"..appIcon..".png')));")
    end
end