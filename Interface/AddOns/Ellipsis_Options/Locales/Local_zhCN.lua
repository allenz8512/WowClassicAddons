--[[
	Translations for Ellipsis

	Language: English (Default)
]]

local L = LibStub('AceLocale-3.0'):NewLocale('Ellipsis_Options', 'enUS', true)


-- ------------------------
-- GENERIC STRINGS
-- ------------------------
L.Enabled				= '启用'
L.Appearance			= '样式'
L.Colours				= '颜色'


-- ------------------------
-- PROFILE FEEDBACK
-- ------------------------
L.ProfileChanged	= '配置文件切换到: %s'
L.ProfileCopied		= '复制配置文件: %s'
L.ProfileDeleted	= '删除配置文件: %s'
L.ProfileReset		= '重置配置文件: %s'


-- ------------------------
-- EXAMPLE AURAS & COOLDOWNS
-- ------------------------
L.SampleUnitHarmful = '敌对单位'
L.SampleUnitHelpful	= '友好单位'
L.SampleAuraDebuff	= '示例 DEBUFF %d'
L.SampleAuraBuff	= '示例 Buff %d'
L.SampleAuraMinion	= '示例 宠物'
L.SampleAuraTotem	= '示例 图腾'
L.SampleAuraGTAoE	= '示例 范围伤害'
L.SampleCoolItem	= '示例 物品冷却计时'
L.SampleCoolPet		= '示例 宠物冷却计时'
L.SampleCoolSpell	= '示例 法术冷却计时'

-- ------------------------
-- BASE OPTIONS (Options.lua)
-- ------------------------
L.GeneralHeader			= '一般'
L.GeneralControl1Header	= '效果限制'
L.GeneralControl2Header	= '分组 & 追踪'
L.GeneralControl3Header	= '布局 & 排序'
L.AuraHeader			= '效果监视配置'
L.UnitHeader		 	= '单位配置'
L.CooldownHeader		= '冷却计时配置'
L.NotifyHeader			= '通知配置'
L.AdvancedHeader		= '|cffff8040高级设置'

L.GeneralLocked			= '锁定框体'
L.GeneralLockedDesc		= '解锁或锁定窗体位置、缩放、透明度设置选项。解锁状态下， 将显示每个窗体的参照图层以便于调整窗体位置。'
L.GeneralExample		= '展示示例'
L.GeneralExampleDesc	= '展示一系列单位及效果监视示例. 如果玩家监视开启, 同样会展示玩家监视示例.\n\n所有示例将在配置窗口关闭后消除 |cffffd200<Shift+左键点击>|r 这个按钮.'
L.GeneralHelpHeader 	= '说明'
L.GeneralHelp			= '|cffffd200术语:|r\n|cffffd200效果|r = 你或你的宠物所施放的Buffs & Debuffs \n|cffffd200单位|r = 你自己, 你的宠物, 小队成员 或 友好单位\n\n从核心功能上说, Ellipsis 用于帮助玩家进行多目标效果追踪, 在左边的标题下有许多选项可以自定义显示效果。 大部分设置只是为了美化效果, 但是你要特别注意 |cffffd200分组 & 追踪|r 选项. 你施放的所有效果都讲被锚定到对应单位，并且这些单位将根据设置被放到7个不同的分组中。 最基础的4个分组按单位类型划分, 第5个分组是个特例 (详见下面的“无目标单位”), 最后两个分组是你的当前目标和焦点目标。 每个分组都可以被任意放到7个显示框体之一中, 多个分组可以放到同一个框体中.\n\n|cffffd200示例:|r\n|cff67b1e9将所有敌对单位放到框体[1], 将你的目标单位放到框体[2]来快速查看当前目标的Dots，这样你就可以清晰的监视当前目标Dots。|r\n\n|cffffd200无目标单位|r\n一些无法关联到对应目标的效果如 temporary minion summons, 图腾, and 范围伤害法术. 这类单位都被分组到无目标单位分组, (无目标单位分组同样可以被设置到任意一个显示框体中)。'


-- ------------------------
-- CONTROL OPTIONS (ControlOptions.lua)
-- ------------------------
L.Control1TimeHeader			= '效果持续时间的限制'
L.Control1TimeMinLimit			= '限制最小值'
L.Control1TimeMinValue			= '最小持续时间'
L.Control1TimeMinValueDesc		= '设置效果显示的最小持续时间 (单位为秒)，效果当前持续时间若小于或等于最小持续时间将消失。'
L.Control1TimeMaxLimit			= '限制最大值'
L.Control1TimeMaxValue			= '最大持续时间'
L.Control1TimeMaxValueDesc		= '设置效果显示的最大持续时间 (单位为秒)，效果当前持续时间若大于或等于最大持续时间将消失。'
L.Control1TimeHelp				= '所有Ellipsis监视效果持续时间都受“最小值”和最大值的限制. 被动效果不受以上持续时间限制,此类效果可以通过以下选项限制.'
L.Control1ShowPassiveAuras		= '显示被动(无限时间)效果'

L.Control1FilterHeader			= '通过过滤器限制效果'
L.Control1FilterUsing			= '   使用A来限制效果显示:'
L.Control1FilterBlacklist		= '黑名单'
L.Control1FilterBlacklistDesc	= '所有黑名单之外的效果都将显示'
L.Control1FilterWhitelist		= '白名单'
L.Control1FilterWhitelistDesc	= '只显示白名单中的效果'

L.Control1FilterAddBlack		= '黑名单效果 (通过法术ID)'
L.Control1FilterAddWhite		= '白名单效果 (通过法术ID)'
L.Control1FilterAddDesc			= '效果必须通过法术ID进行过滤，不能使用法术名称. 为了帮助你更好的查询法术ID, 你可以使用以下数据网站:\n |cffffd100http://www.wowhead.com|r\n |cffffd100http://www.wowdb.com|r\n\nAlternatively, 如果效果被设置成可交互的 (在 |cffffd100效果监视设置中|r) ，可以在效果施放后<Shift+右键> 来禁止显示。'
L.Control1FilterAddBtn			= '添加到过滤名单'

L.Control1FilterListBlack		= '黑名单效果'
L.Control1FilterListWhite		= '白名单效果'
L.Control1FilterListDesc		= '这是当前所有被过滤效果的法术ID, 按法术ID排序.\n\n可以通过下面的按钮将指定效果从列表中移除。'
L.Control1FilterListRemoveBtn	= '从过滤名单移除指定效果'

L.Control2Drop_0 = '隐藏'
L.Control2Drop_1 = '[  |cffffd1001|r  ]'
L.Control2Drop_2 = '[  |cffffd1002|r  ]'
L.Control2Drop_3 = '[  |cffffd1003|r  ]'
L.Control2Drop_4 = '[  |cffffd1004|r  ]'
L.Control2Drop_5 = '[  |cffffd1005|r  ]'
L.Control2Drop_6 = '[  |cffffd1006|r  ]'
L.Control2Drop_7 = '[  |cffffd1007|r  ]'

L.Control2HelpBase			= '需要显示效果的单位在创建后将被划分到以下基础分组框体之一中(包括特殊的无目标分组)。'
L.Control2HelpOverride		= '在合适的情况下，基础单位分组将被划分到对应分组框体中，以便清晰的辨识重要信息。如果启用|cffffd100优先级|r 配置, 这两个分组框体将有一个固定的不能修改的优先级。'
L.Control2Display			= '显示框体'
L.Control2DisplayDesc		= '选择一个显示框体来放置该单位分组。多个分组可以放到同一个框体中。'
L.Control2DisplayCanHide	= '如果需要可以完全隐藏该单位分组。'
L.Control2DisplayPlayer		= '|cff67b1e9这个单位分组显示你或者你的宠物所施放的Buffs'
L.Control2DisplayPet		= '|cff67b1e9这个单位分组显示你或者你的宠物所施放的Buffs.\n\n这个设置只对你当前的宠物有效, and not lesser minions such as Wild Imps or Feral Spirits.'
L.Control2DisplayHarmful	= '|cff67b1e9这个单位分组显示你或者你的宠物在敌对目标上施放的Debuffs。'
L.Control2DisplayHelpful	= '|cff67b1e9这个单位分组显示你或者你的宠物在友好目标上施放的Buffs。'
L.Control2DisplayNoTarget	= '|cff67b1e9这个特殊单位分组显示无指定目标的特殊效果如 地面范围伤害效果, 图腾和小鬼等.'
L.Control2DisplayTarget		= '|cff67b1e9这个单位分组包含你的当前目标（若有）\n\n当你的当前目标和焦点目标为同一个单位时, 目标单位分组拥有更高的优先级。'
L.Control2DisplayFocus		= '|cff67b1e9这个单位分组包含你的焦点目标（若有）\n\n当你的当前目标和焦点目标为同一个单位时, 目标单位分组拥有更高的优先级。'
L.Control2Priority			= '优先级'
L.Control2PriorityDesc		= '选择当多个单位分组共用一个显示框体时的排序优先级。\n\n当多个单位被排序的时候, 每个单位所属的分组先按优先级排序后，各单位再在分组内进行排序\n\n刷新的分组有固定的优先级，并且不能通知。'
L.Control2PriorityDisabled	= '选择当多个单位分组共用一个显示框体时的排序优先级。\n\n|cffffd100优先级|r 单位分组必须选择|cffffd100布局 & 排序|r来调整优先级, 否则优先级设置将无效。'

L.Control3DropSort_CREATE_ASC	= '按创建顺序(升序)'
L.Control3DropSort_CREATE_DESC	= '按创建顺序(降序)'
L.Control3DropSort_EXPIRY_ASC	= '剩余时间(升序)'
L.Control3DropSort_EXPIRY_DESC	= '剩余时间(降序)'
L.Control3DropSort_NAME_ASC		= '按字母顺序 (升序)'
L.Control3DropSort_NAME_DESC	= '按字母顺序 (降序)'
L.Control3DropGrow_DOWN			= '上'
L.Control3DropGrow_UP			= '下'
L.Control3DropGrow_LEFT			= '左'
L.Control3DropGrow_RIGHT		= '右'
L.Control3DropGrow_CENTER		= '中'

L.Control3AuraHeader			= '效果的布局 & 排序'
L.Control3AuraGrowth			= '效果增加'
L.Control3AuraGrowthDesc		= '设定效果从父单位的前端增加的方向。\n\n当为效果启用图标样式时, 图标将按设置的方向增加, 并且可以超出框体的宽度, 除非 |cffffd100Wrap|r 被启用，图标将在超出框体的宽度后自动换行'
L.Control3AuraWrapAuras			= 'Wrap'
L.Control3AuraWrapAurasDesc		= '设置效果图标在超出框体后是否自动换行\n\n当关闭,效果将沿着|cffffd100效果增加方向|r排序。'
L.Control3AuraSorting			= '效果排序'
L.Control3AuraSortingDesc		= '设置每个单位的效果如何派系。\n\n当按照剩余时间排序时，不限时效果将被排序到最前。'
L.Control3AuraPaddingX			= '效果水平间隔'
L.Control3AuraPaddingXDesc		= '设置当使用图标样式时，效果的水平间隔'
L.Control3AuraPaddingY			= '效果垂直间隔'
L.Control3AuraPaddingYDesc		= '设置当使用图标样式时，效果的垂直间隔,这个设置同时用来确定图标与剩余时间之间的垂直间隔。'
L.Control3UnitHeader			= '单位 布局 & 排序'
L.Control3UnitGrowth			= '单位增加'
L.Control3UnitGrowthDesc		= '设定单位从父单位的前端增加的方向。\n\n可以通过在|cffffd100一般|r配置窗口中解锁窗口来移动框体位置。'
L.Control3UnitSorting			= '单位排序'
L.Control3UnitSortingDesc		= '设置单位在对应的框体中如何排序.\n\n如果 |cffffd100优先级|r被开启, 部分单位的排序将不按照该排序方式排列，因为每个单位所属的分组需要先按优先级排序。'
L.Control3UnitPrioritize		= '优先级'
L.Control3UnitPrioritizeDesc	= '设置单位是否要被所属的单位分组按优先级进行排序。这个设置只有在多个单位分组共用一个显示框体时才有用。\n\n排序优先级可以按一下5种设定 |cffffd100分组 & 追踪|r, 当前目标和焦点目标优先级始终最高。'
L.Control3UnitPaddingX			= '单位水平间隔'
L.Control3UnitPaddingXDesc		= '设置单位水平间隔。'
L.Control3UnitPaddingY			= '单位垂直间隔'
L.Control3UnitPaddingYDesc		= '设置单位垂直间隔。'


-- ------------------------
-- AURA CONFIGURATION (AuraConfiguration.lua)
-- ------------------------
L.AuraDropTooltip_FULL		= '全部'
L.AuraDropTooltip_HELPER	= '帮助'
L.AuraDropTooltip_OFF		= '关闭'
L.AuraDropStyle_BAR			= '计时条'
L.AuraDropStyle_ICON		= '图标'
L.AuraDropTextFormat_AURA	= '效果'
L.AuraDropTextFormat_UNIT	= '单位'
L.AuraDropTextFormat_BOTH	= '两者皆有'
L.AuraDropTimeFormat_ABRV	= '缩写'
L.AuraDropTimeFormat_TRUN	= '截短'
L.AuraDropTimeFormat_FULL	= '全部显示'

L.AuraColoursTextHeader			= '字体颜色'
L.AuraColoursText				= '名字 & 时间'
L.AuraColoursStacks				= '堆叠'
L.AuraColoursWidgetHeader		= '框体颜色 (图标边框 & 状态条)'
L.AuraColoursWidgetGhosting		= '渐隐'
L.AuraColoursWidgetGhostingDesc	= '设置图标和状态条渐隐时的边框颜色'
L.AuraColoursWidgetHigh			= '剩余时间较长'
L.AuraColoursWidgetHighDesc		= '设置剩余时间大于10秒时图标和状态条的边框颜色。'
L.AuraColoursWidgetMed			= '剩余时间中等'
L.AuraColoursWidgetMedDesc		= '设置剩余时间大于5秒小于10秒时图标和状态条的边框颜色，颜色将根据时间进行渐变。'
L.AuraColoursWidgetLow			= '剩余时间较低'
L.AuraColoursWidgetLowDesc		= '设置剩余时间小于5秒时图标和状态条的边框颜色，颜色将根据时间进行渐变。'
L.AuraColoursWidgetBarBG		= '计时条背景色'
L.AuraColoursWidgetBarBGDesc	= '设置计时条背景色。'

L.AuraStyle				= '显示样式'
L.AuraStyleDesc			= '设置效果显示样式.\n\n计时条样式显示一个带有法术图标、名称、剩余时间的计时条。 计时条宽度与单位宽度相同, 并且始终在单位上、下垂直分布.\n\n图标样式只显示图标和持续时间,并且有多种排序方式.\n\n效果显示&排序可以在...\n|cffffd100一般 > 布局 & 排序|r中找到.'
L.AuraInteractive		= '交互'
L.AuraInteractiveDesc	= 'Allow individual auras to be announced, cancelled or blacklisted by mouse interaction.\n\nSome Non-Targeted auras cannot be blocked this way and need to be blocked via the Blacklist directly.\n\nDisabling this options allows you to click-through aura timers and select the world behind them.'
L.AuraTooltips			= '显示提示信息'
L.AuraTooltipsDesc		= '设置鼠标滑过效果时的交互信息\n\n全部:\n显示法术信息及帮助信息\n\n帮助:\n仅显示帮助信息\n\n关闭:\n不显示提示信息'
L.AuraBarSize			= '计时条高度'
L.AuraBarSizeDesc		= '设置效果显示时的计时条高度，宽度由单位宽度决定。'
L.AuraIconSize			= '图标尺寸'
L.AuraIconSizeDesc		= '设置效果显示时候图标的宽度和高度。'
L.AuraTimeFormat		= '时间格式'
L.AuraTimeFormatDesc	= '设置每个效果时间的显示格式.\n\缩写:\n9.4s  |  9s  |  9m  |  9hr\n\n截短:\n9.4  |  9  |  9:09  |  9hr\n\n完整显示:\n9.4  |  9  |  9:09  |  9:09:09'
L.AuraBarTexture		= '计时条材质'
L.AuraBarTextureDesc	= '设置计时条材质。'
L.AuraTextFormat		= '名称格式'
L.AuraTextFormatDesc	= '设置在计时条样式下名称文字的格式\n\n效果:\n只显示效果名称。\n\n单位:\n显示父单位名称\n\n两者皆有:\n显示父单位名称，后面跟着效果名称。'
L.AuraFlipIcon			= 'Flip Icon'
L.AuraFlipIconDesc		= 'Set whether to flip the icon to the right side of the statusbar in Bar style.'
L.AuraGhostingHeader	= '效果渐隐'
L.AuraGhostingDesc		= '当启用后，效果将在到期后渐隐. 如果关闭效果将在持续时间完成后马上消失。'
L.AuraGhostDuration		= '渐隐持续时间'
L.AuraGhostDurationDesc	= '设置效果到期后渐隐时间。'
L.AuraTextFont			= '名字 & 时间字体'
L.AuraTextFontSize		= '名字 & 时间字体大小'
L.AuraTextDesc			= '设置字体样式及字体大小,用于法术名称、单位名称、持续时间文字。'
L.AuraStacksFont		= '堆叠字体'
L.AuraStacksFontSize	= '堆叠字体大小'
L.AuraStacksDesc		= '设置效果堆叠字体及字体大小. 不论是图标或计时条样式，堆叠文字始终在法术图标右下角显示，并且只在堆叠数量大于等于2的时候显示。'


-- ------------------------
-- UNIT CONFIGURATION (UnitConfiguration.lua)
-- ------------------------
L.UnitDropFontStyle_OUTLINE			= '轮廓'
L.UnitDropFontStyle_THICKOUTLINE	= '粗轮廓'
L.UnitDropFontStyle_NONE			= '无轮廓'
L.UnitDropColourBy_CLASS			= '单位种族'
L.UnitDropColourBy_REACTION			= '单位响应'
L.UnitDropColourBy_NONE				= '无 (使用基础颜色)'

L.UnitColoursBaseHeader			= '基础颜色'
L.UnitColoursColourHeader		= '标题文字颜色'
L.UnitColoursColourHeaderDesc	= '当单位未按照种族或响应类型着色时的标题文字颜色。\n\n同样运用于未知单位或无目标单位。\n\n无目标单位效果包括地面范围伤害，短时间召唤宠物，图腾等。'
L.UnitColoursReactionHeader		= '响应颜色'
L.UnitColoursColourFriendly		= '友好单位'
L.UnitColoursColourHostile		= '敌对单位'

L.UnitWidth					= '单位宽度'
L.UnitWidthDesc				= '设置单位显示的宽度。\n\n当效果使用计时条样式的时候，这个宽度同时决定了它的宽度。\n\n当效果使用图标样式，同时启用自动换行时，这个宽度决定换行宽度。\n\n有关效果显示样式&排序方式的设置可以在...\n|cffffd100一般 > 布局 & 排序|r找到.'
L.UnitHeaderHeight			= '标题高度'
L.UnitHeaderHeightDesc		= '设置每个单位标题面板的高度。 这是每个单位描述性文字显示的地方。\n\n这个标题面板始终在单位上方，除非计时条样式的效果设置为向上增加。'
L.UnitOpacityFaded			= '变淡透明度'
L.UnitOpacityFadedDesc		= '设置单位非当前目标时的透明度。这并不包括无目标单位。\n\n当设置为1时，非当前目标的单位将完全不透明。'
L.UnitOpacityNoTarget		= '无目标单位透明度'
L.UnitOpacityNoTargetDesc	= '设置无目标单位透明度。 当设置为1时，这类特殊单位将完全不透明。'
L.UnitHeaderTextHeader		= '标题文本'
L.UnitHeaderTextFont		= '标题文本字体'
L.UnitHeaderTextFontSize	= '标题文本字体大小'
L.UnitHeaderTextFontStyle	= '标题文本样式'
L.UnitHeaderTextDesc		= '设置字体、字体大小、字体轮廓样式,用于显示单位名称和等级（若有）。'
L.UnitHeaderColourBy		= '颜色'
L.UnitHeaderColourByDesc	= '设置每个单位标题文本的颜色如何显示。若按照单位种族进行着色, 如果单位无种族或种族未知, 将使用基础标题颜色替代。\n\n基础标题颜色可以在 \n|cffffd100单位 配置 > 颜色|r中设置。'
L.UnitHeaderShowLevel		= '显示等级'
L.UnitHeaderShowLevelDesc	= '在标题面板上显示单位已知的等级\n\nBosses将被显示为[B].'
L.UnitStripServer			= '去除服务器名称'
L.UnitStripServerDesc		= '设置是否在标题文字上面去除其他服务器玩家的服务器名称。'
L.UnitCollapseAllUnits		= '全部单位'
L.UnitCollapseAllUnitsDesc	= '设置是否要关闭所有单位的标题文本显示功能。\n\n如果标题文本被关闭，建议在效果上显示对应单位的名字。这个选项可以通过...\n|cffffd100效果配置 > 名字格式|r设置。'
L.UnitCollapseHeader		= '折叠标题'
L.UnitCollapsePlayer		= format('Player (%s)', UnitName('player')) -- show player name to make obvious what we are referring to
L.UnitCollapsePlayerDesc	= '设置是否折叠玩家的标题文字面板'
L.UnitCollapseNoTarget		= '无目标效果'
L.UnitCollapseNoTargetDesc	= '设置是否折叠无目标单位的标题文字面板。\n\n无目标单位效果包含地面范围伤害, 短时间召唤宠物, 图腾等。'


-- ------------------------
-- COOLDOWN OPTIONS (CooldownOptions.lua)
-- ------------------------
L.CoolItem	= '物品'
L.CoolSpell	= '法术'

L.CoolOnlyWhenTracking		= '仅在追踪时'
L.CoolOnlyWhenTrackingDesc	= '当前有法术冷却在追踪时，才显示冷却计时条。\n\n如果此选项关闭，则无论是否有法术冷却，该计时条始终显示。'
L.CoolInteractive			= '交互'
L.CoolInteractiveDesc		= '允许通过鼠标交互将各个法术冷却计时被通知、取消、加入黑名单。\n\n关闭这个选项，则当鼠标点击计时图标时，将直接点击穿透。冷却计时条本身始终点击穿透。'
L.CoolTooltips				= '显示提示信息'
L.CoolTooltipsDesc			= '设置当鼠标与效果交互时提示信息如何显示\n\n全部:\n显示效果信息及帮助注释\n\n帮助:\n仅显示帮助注释\n\n关闭:\n不显示提示信息'

L.CoolControlHeader			= '冷却追踪 & 控制'
L.CoolTrackingHeader		= '追踪:'
L.CoolTrackItem				= '物品'
L.CoolTrackItemDesc			= '开启物品冷却追踪。\n\n包括已装备物品及背包中的药水。不包含玩具。'
L.CoolTrackPet				= '宠物'
L.CoolTrackPetDesc			= '开启宠物技能冷却计时追踪。\n\n这只包含你实际存在的宠物，不包含技能召唤宠物。'
L.CoolTrackSpell			= '法术'
L.CoolTrackSpellDesc		= '开启你的技能和法术冷却计时。\n\n这包含一般型技能如复活宠物（除非已加入黑名单）。'

L.CoolTimeMinLimit			= '限制最小值'
L.CoolTimeMinValue			= '最小持续时间'
L.CoolTimeMinValueDesc		= '显示单个冷却计时从冷却计时条上移除的最小持续时间（单位为秒）。 所有剩余时间小于等于此限制值的冷却计时都将被移除。\n\n最小持续时间无法关闭，同时始终有一个2s的最低限制，以避免每个技能的GCD都被重复显示。'
L.CoolTimeMaxLimit			= '限制最大值'
L.CoolTimeMaxValue			= '最大持续时间'
L.CoolTimeMaxValueDesc		= '显示单个冷却计时从冷却计时条上移除的最大持续时间（单位为秒）。 所有剩余时间大于等于此限制值的冷却计时都将被移除。'

L.CoolBlacklistAdd			= '冷却计时黑名单'
L.CoolBlacklistAddDesc		= '冷却计时黑名单必须使用法术ID或者物品ID，而不是他们的名称。你可以通过以下数据网站快速查询法术或物品的ID:\n |cffffd100http://www.wowhead.com|r\n |cffffd100http://www.wowdb.com|r\n\n或者, 如果冷却计时条被设置为可交互, 你可以通过鼠标 <Shift+右键>对应的冷却计时来将它加入黑名单。'
L.CoolBlacklistAddItem		= '属于物品ID'
L.CoolBlacklistAddItemDesc	= '设置被加入黑名单的是物品ID还是法术ID。'
L.CoolBlacklistAddButton	= '黑名单'
L.CoolBlacklistList			= '黑名单中的冷却计时'
L.CoolBlacklistListDesc		= '这是当前被加入黑名单的物品ID和法术ID,首先按照物品/法术进行排序,然后按照物品ID或法术ID排序。\n\n可以通过选择ID及以下按钮来将ID从黑名单中移除。'
L.CoolBlacklistRemoveButton	= '从黑名单移除'

L.CoolHorizontal			= '水平计时条'
L.CoolHorizontalDesc		= '设置冷却计时条方向。\n\n设置水平方向，则冷却计时向左边收缩，设置垂直方向，则向下收缩。'
L.CoolTexture				= '计时条材质'
L.CoolTextureDesc			= '设置冷却计时条使用的材质。 这个材质的轮廓将被|cffffd100颜色|r设置下的背景色着色。'
L.CoolLength				= '计时条长度'
L.CoolLengthDesc			= '设置计时条的最大尺寸。当计时条为水平方向时,这个设置是它的宽度,反之为高度。'
L.CoolThickness				= '计时条厚度'
L.CoolThicknessDesc			= '设置计时条的最小尺寸。当计时条为水平方向时,这个设置是它的高度,反之为宽度。\n\n这个同时用来设置计时条图标尺寸。'

L.CoolTimeHeader			= '时间刻度 & 时间标签'
L.CoolTimeDisplayMax		= '时间刻度'
L.CoolTimeDisplayMaxDesc	= '设置冷却计时条显示的时间。\n\n冷却时间大于该值的冷却计时先被锚定到冷却计时条的结尾，直到冷却剩余时间低于该值时才开始计时，。'
L.CoolTimeDetailed			= '详细时间刻度'
L.CoolTimeDetailedDesc		= '设置是否将额外的时间标签添加到时间刻度显示中。\n\n这个为时间刻度上的冷却计时显示额外信息, 但是当冷却计时条太矮或者太短的时候或显得过于拥挤。'
L.CoolTimeFont				= '时间标签字体'
L.CoolTimeFontSize			= '时间标签字体大小'
L.CoolTimeFontDesc			= '设置冷却计时条上时间标签的字体及字体大小。'

L.CoolOffsetHeader			= '偏移锚点'
L.CoolOffsetTags			= '打开偏移计时器'
L.CoolOffsetTagsDesc		= '设置是否允许计时器偏移出计时条原本的位置，同时通过“Spoke”链接回它在计时条上的位置。'
L.CoolOffsetItem			= '偏移: 物品'
L.CoolOffsetPet				= '偏移: 宠物'
L.CoolOffsetSpell			= '偏移: 法术'
L.CoolOffsetDesc			= '设置这个冷却组的偏移距离. 设置0来关闭这个冷却组的偏移。'

L.CoolColoursBase			= '基础冷却颜色'
L.CoolColoursBar			= '冷却计时条'
L.CoolColoursBackdrop		= '计时条背景'
L.CoolColoursBackdropDesc	= '设置冷却计时条背景色。 当且仅当冷却计时条本身的颜色为透明时才显示。'
L.CoolColoursBorder			= '计时条边框'
L.CoolColoursBorderDesc		= '设置冷却计时条边框颜色。这个是冷却计时条自身的轮廓。'
L.CoolColoursText			= '时间刻度文字'

L.CoolColoursGroups			= '冷却计时条组颜色'
L.CoolColoursGroupsDesc		= '设置属于这个分组的冷却计时的颜色。这个设置计时器图标边框的颜色，同时也用于偏移“Spoke”的边框颜色。'


-- ------------------------
-- NOTIFICATIONS
-- ------------------------
L.NotifyDropAnnounce_AUTO	= '自动'
L.NotifyDropAnnounce_GROUPS	= '仅限群聊'
L.NotifyDropAnnounce_RAID	= '仅限团队聊天'
L.NotifyDropAnnounce_PARTY	= '仅限小队聊天'
L.NotifyDropAnnounce_SAY	= '仅限说/say'

L.NotifyAnnounceHeader		= '|cffffd100通知:|r'
L.NotifyOutputAnnounce		= '发送通知到'
L.NotifyOutputAnnounceDesc	= '设置点击效果时通知到哪里.\n\n在团队中自动发送到团队，小队中则发送到小队，未组多的发送到说/say.\n\n群聊只有在团队或者小队中才发送到对应频道。\n\n这个设置需要将效果设置成 |cffffd100互动|r，在|cffffd100效果配置|r中开启。'
L.NotifyAlertHeader			= '警报配置'
L.NotifyAlertAudio			= '声音'
L.NotifyAlertAudioDesc		= '出现此警报时播放声音.\n\n设置为无的时候关闭警报提示音。'
L.NotifyAlertText			= '消息'
L.NotifyAlertTextDesc		= '出现此警报时发送消息。在下面的选项中，选择消息输出方式,.\n\n所有警报消息都在同一个输出频道中发送。'
L.NotifyBrokenAuras			= '效果提前消失'
L.NotifyBrokenAurasDesc		= '当效果相对应有持续时间更早消失的时候生效。\n\n当效果所属目标死亡时不发送该通知。'
L.NotifyExpiredAuras		= '效果消失'
L.NotifyExpiredAurasDesc	= '当效果自然消失的时候生效。\n\n当效果所属目标死亡时不发送该通知。'
L.NotifyPrematureCool		= '提前冷却结束'
L.NotifyPrematureCoolDesc	= '当法术冷却提前结束时生效。\n\n这个通常在冷却被重置的时候触发。'
L.NotifyCompleteCool		= '冷却结束'
L.NotifyCompleteCoolDesc	= '当冷却自然结束的时候生效。'

L.NotifyAlertOutput			= '输出警报到'
L.NotifyAlertOutputHeader	= '所有警报消息将被输出到同一个输出频道中，可选的输出频道如下。 有效的输出频道包括暴雪自带频道，也包括流行的插件如SCT和MikSBT\n'
L.NotifyAlertSinkHeader		= '|cffffd100输出警报消息到...|r'


-- ------------------------
-- ADVANCED
-- ------------------------
L.AdvancedTickRate = '更新间隔'
L.AdvancedTickRateDesc = '设置效果更新频率。 较低的值可以让时间更新更精确，但是耗费更多资源。\n\n较高的值耗费很少的资源，但是让效果、冷却计时更新滞后。'
