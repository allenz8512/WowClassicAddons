U1RegisterAddon("alaChat_Classic", {
    title = "聊天增强",
    tags = { TAG_CHAT, },
    desc = "提供聊天复制、职业着色、频道切换条、TAB切换频道、聊天表情等功能",
    load = "NORMAL",
    defaultEnable = 1,
    nopic = 1,
    minimap = 'LibDBIcon10_alaChat_Classic', 
    icon = [[Interface\Addons\alaChat_Classic\icon\emote_nor]],

    {
        text = "配置选项",
        callback = function(cfg, v, loading)
                InterfaceOptionsFrame_Show();
                InterfaceOptionsFrame_OpenToCategory("alaChat_Classic");
        end
    }
});
