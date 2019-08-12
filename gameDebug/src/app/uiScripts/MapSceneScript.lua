include "app.ui.init"
_ENV=namespace "uis"
using_namespace "ui"

local size=cc.Director:getInstance():getVisibleSize()

UIScript "MapSceneScript" {
    id="map";
    size=size;
    anchor=cc.p(0,0);
    pos=cc.p(0,0);

    Sprite:script{
        id="backGround";
        size=size;
        anchor=display.CENTER;
        pos=display.center;
        tag=-10
    };
    
    DropList:script{
        id="menu";
        tag=20;
        pos=cc.p(size.width,size.height) ;
        anchor=cc.p(1,1);
    };

    Label:script{
        id="mapName";
        tag=20;
        pos=cc.p(0,size.height);
        anchor=cc.p(0,1);
    };

    
}

