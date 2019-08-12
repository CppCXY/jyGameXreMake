_ENV=namespace "ui"
---暂时不写这里

---@class EquipmentUpdateUI
local EquipmentUpdateUI=class "EquipmentUpdateUI" {
    super(cc.Layer);
    super(LUIObject);


}

function EquipmentUpdateUI:EquipmentUpdateUI(item)
    self.item=item

end