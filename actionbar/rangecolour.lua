
    local orig = {}

    orig.ActionButton_UpdateUsable = ActionButton_UpdateUsable
    orig.ActionButton_OnUpdate     = ActionButton_OnUpdate

    function ActionButton_UpdateUsable()
        local id = ActionButton_GetPagedID(this)
        if IsUsableAction(id) and IsActionInRange(id) == 0 then
            local name = this:GetName()
            _G[name..'Icon']:SetVertexColor(1, .1, .1)
            _G[name..'NormalTexture']:SetVertexColor(1, .1, .1)
        else
            orig.ActionButton_UpdateUsable()
        end
    end

    function ActionButton_OnUpdate(elapsed)
        orig.ActionButton_OnUpdate(elapsed)
        ActionButton_UpdateUsable()
    end

    --
