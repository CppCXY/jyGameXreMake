include "app.ui.init"
_ENV=namespace "uis"
using_namespace "ui"


UIScript "MainSceneScript" {
    id="main";
    size=cc.Director:getInstance():getVisibleSize();
    anchor=cc.p(0,0);
    pos=cc.p(0,0);
    Sprite:script{
        id="backGround";
        size=cc.Director:getInstance():getVisibleSize();
        anchor=display.CENTER;
        pos=display.center;
        tag=-10
    };
    
    Menu:script{
        id="menu";
        tag=20;
        pos= display.center;
        anchor=display.CENTER;
    };

    Label:script{
        id="title";
        tag=20;
        pos=cc.p(display.cx,display.cy*1.5);
        anchor=display.CENTER;
    };

    Label:script{
        id="desc";
        tag=20;
        pos=cc.p(display.cx,display.cy*1.3);
        anchor=cc.p(0,0);
    };

    Label:script{
        id="version";
        tag=20;
        pos=cc.p(display.cx*2-20,0);
        anchor=cc.p(1,0);
        params={mod.Limit.gameName..mod.Limit.gameVersion,18}
    }
    

}

