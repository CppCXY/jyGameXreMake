
_ENV=namespace ()
using_namespace "luaClass"


class("Path"){
    CLASS_DEBUG(false);
    NO_AUTO_INHERIT();

}


function Path:Path()
    self.ui={
        openImage=randTable{
            "open/openImage1.jpg",
            "open/openImage2.jpg",
            "open/openImage3.jpg",
            "open/openImage4.jpg",
            "open/openImage5.jpg",
            "open/openImage6.jpg",
        },
        openMusic=randTable{
            "open/openMusic1.mp3",
            "open/openMusic2.mp3",
            "open/openMusic3.mp3",
            "open/openMusic4.mp3",
            "open/openMusic5.mp3",
        },
        edit="UI/green_edit.png",
        redSlider="UI/redLoader.png",
        blueSlider="UI/blueLoader.png",
        defaultMan="UI/defaultMan.png",
        defaultWoman="UI/defaultWoman.png",
    }
    self.root={
        map="Maps/",
        icon="Icons/",
        item="Items/",
        save="./res/save/",
        animation="Animation/",
        battleBg="BattleBg/",
        skillAnimation="skillAnimation/"
    }
    local writablePath=cc.FileUtils:getInstance():getWritablePath()
    local targetPlatform=cc.Application:getInstance():getTargetPlatform()
    if cc.PLATFORM_OS_ANDROID == targetPlatform then
        self.root.save=writablePath
    end
    self.font={
        default="Fonts/myfont.ttf",
    }
end
function Path:getInstance()
    if self.s_instance==nil then
        self.s_instance=Path()
    end
    return self.s_instance
end
