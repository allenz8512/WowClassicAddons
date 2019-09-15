--    NoGoldSeller
--    World of Warcraft/TW-Hellscream/Horde/Sonicelement
DEFAULT_CHAT_FRAME:AddMessage("|cff00ff00NoGoldSeller:出售金幣廣告信息屏蔽插件已經載入.輸入/NGS可禁用或啟用.|r\n（作者:|cff3399FFSonicelement|r@地獄吼（zhTW））" )
local NGSenable=1
local NGSkilled=0
local NGSreport=0
local NGSid2=0
local NGSmatchs=2 --在這裡修改關鍵字配對個數.找到n個關鍵字則屏蔽,就改此處為n/在这里修改关键词配对个数.找到n个关键词则屏蔽,就改此处为n
local NGSSymbols={"`","~","@","#","^","*","=","|"," ","，","。","、","？","！","：","；","’","‘","“","”","【","】","『","』","《","》","<",">","（","）"} 
--在這裡修改要清除的干擾字符/在这里修改要清除的干扰字符
if (GetLocale() == "zhTW") then
  NGSwords = {"淘寶","淘宝","旺旺","純手工","纯手工","牛肉","萬斤","手工金","手工G","平臺","黑一賠","皇冠店","代練","代打","沖鑽","衝鑽","非球不愛","積分","總元帥","高階督軍","高督","1-85","消保","好評率"} 
  --(正體中文)在這裡修改關鍵字,以" "包括,以,分隔.
  NGSrep="|cff3399FFNGS:|r本次登錄到現在已經截獲|cff00ff00%d|r條廣告訊息."
  NGSturnoff="|cff00ff00NoGoldSeller:出售金幣廣告信息屏蔽插件已經停用.輸入/NGS啟用.|r"
  NGSturnon="|cff00ff00NoGoldSeller:出售金幣廣告信息屏蔽插件已經啟用.輸入/NGS停用.|r"
  NGSrepFreq=20; --(正體中文)在這裡截獲報告頻率.幾條消息報告一次,就改此處為n.
else if (GetLocale() == "zhCN") then
    NGSwords = {"乱打","手工","淘宝","币","包团","代打","代练","评级","代刷","带刷","=","好评","工作室","公会","收人","招人","休闲","修仙","欢迎","活动","工会","老板","擔保","承接","手打","dai","评级","打金","卖金","售金","出金","萬金","万金","w金","打g","卖g","售g","萬g","万","wg","详情","详谈","详询","信誉","信赖","刷屏","扰屏","上马","公道","货到","勿扰","低价","5173","支付宝","支付寶","淘寶","qq","加q","企业q","咨询","联系","电话","旺旺","口口","扣扣","叩叩","歪歪","歪丫","丫丫","出手","招收","taobao","０","○","①","②","③","④","⑤","⑥","⑦","⑧","⑨","1111","2222","0000","3333","4444","5555","6666","7777","8888","9999","MMMM","mmmm","无限收","散卖","打包","YS","ys","1OO","1oo","0块","萬G","/","要的M","征.服","挑.战","打手","g团","G团","金团","通报","要的m","评.级","打工","Y.Y","出售","诚信","交易","征服","挑战","nnn","ooo","要的M","PひP","便宜","毕业","内销","消费","竞争","随便","冲分","需求","躺尸","装备","无竞争","ys","收G","朋友","必出","拉人","私密","价格","门票","上帝","押金","小时","钟头","要得","不收押","强制","来的M","有需求M","黑CD","-","--","- -","加入","出G","代工","人在","无限","入会","兄弟","大量收","纳新","如归","代价m","带价m","血色","AA","aa","支持","邮寄","无线收"} 
	--(简体中文)在这里修改关键字,以" "包括,以,分隔.
    NGSrep="|cff3399FFNGS:|r本次登录到现在已经截获|cff00ff00%d|r条广告信息。"
    NGSturnoff="|cff00ff00NoGoldSeller:出售金币广告信息屏蔽插件已经停用。输入/NGS启用。|r"
    NGSturnon="|cff00ff00NoGoldSeller:出售金币广告信息屏蔽插件已经启用。输入/NGS停用。|r"
    NGSrepFreq=100; --(简体中文)在这里修改报告频率。n条消息报告一次，就该此处为n。
  else
    DEFAULT_CHAT_FRAME:AddMessage("請注意!\nNoGoldSeller只能在zhTW,zhCN下運行,不支持您現在的遊戲語言版本!已經自行禁用.")
	DEFAULT_CHAT_FRAME:AddMessage("WARNING!\nNoGoldSeller: This addon ONLY fits for Traditional Chinese (zhTW) & Simplified Chinese (zhCN) realms. Unsupport your game client. It has automatically disabled now.")
	NGSenable=2;
  end
end
local NGSdebug=0;

function IsGoldSeller(NGSself, NGSevent, NGSmsg, NGSauthor, _, _, _, NGSflag, _, _, _, _, NGSid)
  if(NGSenable==0 or NGSenable==2) then
    return false;
  end
  if (NGSdebug==0) then
	if ((NGSevent == "CHAT_MSG_WHISPER" and NGSflag == "GM") or UnitIsInMyGuild(NGSauthor) or UnitIsUnit(NGSauthor,"player") or UnitInRaid(NGSauthor) or UnitInParty(NGSauthor)) then 
		return false; 
	end
  end
  for _, NGSsymbol in ipairs(NGSSymbols) do
    NGSmsg, a = gsub(NGSmsg, NGSsymbol, "")
  end
  local NGSmatch = 0;
  local NGSnewString=""
  for _, NGSword in ipairs(NGSwords) do
    local NGSnewString, NGSresult= gsub(NGSmsg, NGSword, "");
	if (NGSresult > 0) then
	  NGSmatch = NGSmatch +1;
	end
  end
  if (NGSmatch >= NGSmatchs) then 
	if (not(NGSid == NGSid2)) then
		NGSkilled = NGSkilled + 1
		NGSreport = NGSreport + 1
		NGSid2 = NGSid
		
		if (NGSdebug == 1) then --debug
			DEFAULT_CHAT_FRAME:AddMessage(NGSauthor)
			DEFAULT_CHAT_FRAME:AddMessage(NGSevent)
			DEFAULT_CHAT_FRAME:AddMessage(NGSmsg)
			DEFAULT_CHAT_FRAME:AddMessage(NGSkilled)
		end
		
		if (NGSreport == NGSrepFreq) then
		--DEFAULT_CHAT_FRAME:AddMessage(string.format(NGSrep, NGSkilled))
		NGSreport=0
		end
	end
	return true;
  else
    return false;
  end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",IsGoldSeller)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", IsGoldSeller) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", IsGoldSeller) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", IsGoldSeller) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_ADDON", IsGoldSeller) 
ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE", IsGoldSeller) 

SLASH_NGS1 = "/nogoldseller";
SLASH_NGS2 = "/NGS";
SlashCmdList["NGS"] = function(cmd)
  if (NGSenable==2) then
	DEFAULT_CHAT_FRAME:AddMessage("請注意!\nNoGoldSeller只能在zhTW,zhCN下運行,不支持您現在的遊戲語言版本!已經自行禁用.")
	DEFAULT_CHAT_FRAME:AddMessage("WARNING!\nNoGoldSeller: This addon ONLY fits for Traditional Chinese (zhTW) & Simplified Chinese (zhCN) realms. Unsupport your game client. It has automatically disabled now.")
  end
  if (NGSenable==1) then
	DEFAULT_CHAT_FRAME:AddMessage(NGSturnoff)
	NGSenable=0;
  else
    DEFAULT_CHAT_FRAME:AddMessage(NGSturnon)
    NGSenable=1;
  end
end
  
