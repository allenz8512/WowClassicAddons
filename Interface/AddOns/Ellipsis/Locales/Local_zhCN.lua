--[[
	Translations for Ellipsis

	Language: 中文
]]

local L = LibStub('AceLocale-3.0'):NewLocale('Ellipsis', 'enUS', true)


L.OverlayCooldown = '冷却条'

L.VersionUpdated	= '版本已更新到 v%s'
L.VersionUpdatedNew	= '版本已更新到 v%s - 新设置已经生效!'
L.ChatUsage			= '命令行 - /ellipsis [lock|unlock]\n   无参数情况下打开配置界面, 或者加入lock/unlock参数来锁定/解锁窗口位置.'
L.CannotLoadOptions	= '加载 Ellipsis_配置界面失败, 无法进行设置. 返回错误: |cffff2020%s|r'

-- aura & unit strings
L.Aura_Passive		= ''
L.Aura_Unknown		= '未知效果'
L.UnitLevel_Boss	= 'B'
L.UnitName_NoTarget	= '无目标'

-- aura tooltips
L.AuraTooltip			= '|cff67b1e9<左键> 通知持续时间\n<右键> 取消效果计时器\n<Shift+右键> 禁用该效果计时器|r'
L.AuraTooltipNoBlock	= '|cff67b1e9<左键> 通知持续时间\n<右键> 取消效果计时器|r\n|cffd0d0d0在配置界面手动设置禁用的效果|r'

-- cooldown icon tooltips
L.CooldownTimerTooltip			= '|cff67b1e9<左键> 通知持续时间\n<右键> 取消冷却计时器\n<Shift+右键> 禁用该冷却计时|r'
L.CooldownTimerTooltipNoBlock	= '|cff67b1e9<左键> 通知持续时间\n<右键> 取消冷却计时器|r\n|cffd0d0d0在配置界面手动设置禁用的冷却计时|r'

-- filter lists
L.FilterBlackAdd			= '效果已添加到黑名单: %s [|cffffd100%d|r]'
L.FilterBlackRemove			= '效果已从黑名单移除: %s [|cffffd100%d|r]'
L.FilterWhiteAdd			= '效果已添加到白名单: %s [|cffffd100%d|r]'
L.FilterWhiteRemove			= '效果已从白名单移除: %s [|cffffd100%d|r]'
L.BlacklistCooldownAdd		= '冷却计时已添加到黑名单: %s [|cffffd100%d|r]'
L.BlacklistCooldownRemove	= '冷却计时已从黑名单移除: %s [|cffffd100%d|r]'


-- announcements
L.Announce_ActiveAura			= '我的 [%s] 将从 [%s] 消失，剩余时间：%s.'
L.Announce_ActiveAura_NoTarget	= '我的 [%s] 将在 %s 秒内消失.'
L.Announce_ExpiredAura			= '我的 [%s] 已经从 [%s] 消失!'
L.Announce_ExpiredAura_NoTarget	= '我的 [%s] 已经消失!'
L.Announce_PassiveAura			= '我的 [%s] 在 [%s] 上生效.'
L.Announce_PassiveAura_NoTarget	= '我的 [%s] 已经生效.'
L.Announce_ActiveCooldown		= '我的 [%s] 正在冷却中 %s.'

-- alerts
L.Alert_ExpiredAura		= '%s 已经从 %s 消失!'
L.Alert_BrokenAura		= '%s 已经从 %s 中止!'
L.Alert_PrematureCool	= '%s 冷却计时提前结束!'
L.Alert_CompleteCool	= '%s 冷却结束!'

-- overlay strings
L.OverlayHelperText		= '窗体移动、缩放、更改透明度功能已经解锁. 点击下面的选项进入完整设置界面或者点击退出重新锁定窗体.'
L.OverlayTooltipHeader	= '效果窗体 [|cffffd200%d|r]'
L.OverlayTooltipHelp	= '<左键> 移动窗口\n<鼠标滚轮> 设置透明度 (|cffffffff%d|r)\n<Shift+鼠标滚轮> 设置缩放值 (|cffffffff%.2f|r)'
L.OverlayTooltipAuras	= '单位群组: %s'

-- unit groups
L.UnitGroup_target		= '目标'
L.UnitGroup_focus		= '焦点'
L.UnitGroup_notarget	= '无目标（范围法术）'
L.UnitGroup_player		= '玩家'
L.UnitGroup_pet			= '宠物'
L.UnitGroup_harmful		= '敌对的'
L.UnitGroup_helpful		= '友好的'
L.UnitGroup_none		= '无'
