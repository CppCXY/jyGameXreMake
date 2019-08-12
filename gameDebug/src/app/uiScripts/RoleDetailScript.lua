
include "app.ui.init"
_ENV=namespace "uis"
using_namespace "ui"

local size=cc.Director:getInstance():getVisibleSize()

UIScript "RoleDetailScript" {
    id="layer";
    size=size;
    anchor=cc.p(0,0);
    pos=cc.p(0,0);

    Rectangle:script{
        id="rectBlock";
        params={cc.size(display.cx*1.8,display.cy*1.5)};
        anchor=display.CENTER;
        pos=display.center;
        tag=-10;

        Sprite:script{
            id="head";
            anchor=cc.p(0,1);
            pos=cc.p(0,display.cy*1.45);
            size=cc.size(display.cy/4,display.cy/4);
        };

        Label:script{
            id="desc";
            anchor=cc.p(0,1);
            pos=cc.p(0,display.cy*1.2);

        };

        Label:script{
            id="back";
            anchor=cc.p(0,0);
            params={"返回",20};
            pos=cc.p(0,0);
        };

        CardUI:script{
            id="property";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx/2,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label1";
                anchor=cc.p(0,0);
                params={"属性",18}
            }
        };

        CardUI:script{
            id="equipment";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*0.7,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label2";
                anchor=cc.p(0,0);
                params={"装备",18}
            }
        };

        CardUI:script{
            id="skill";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*0.9,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label3";
                anchor=cc.p(0,0);
                params={"技能",18}
            }
        };

        CardUI:script{
            id="talent";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*1.1,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label4";
                anchor=cc.p(0,0);
                params={"天赋",18}
            };
        };

        CardUI:script{
            id="story";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*1.3,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label5";
                anchor=cc.p(0,0);
                params={"列传",18}
            };
        };
        
        CardUI:script{
            id="propertyPoint";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*1.5,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label6";
                anchor=cc.p(0,0);
                params={"加点",18}
            };
        };
        CardUI:script{
            id="update";
            params={cc.size(display.cx/6,display.cy/8)};
            pos=cc.p(display.cx*0.3,display.cy*1.4);
            anchor=cc.p(0,1);
            onTouch=true;
            Label:script{
                id="label7";
                anchor=cc.p(0,0);
                params={"刷新",18}
            };
        };

    };
    


    
}

