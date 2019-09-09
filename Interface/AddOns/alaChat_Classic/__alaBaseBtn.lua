--[[--
	alex@0
--]]--
local math,table,string,pairs,type,select,tonumber,unpack=math,table,string,pairs,type,select,tonumber,unpack;
local _G=_G;
local GameTooltip=GameTooltip;
----------------------------------------------------------------------------------------------------
if not __alaBase then
	return;
end
local __alaBaseBtn_Version=1.04;
if __alaBaseBtn and __alaBaseBtn.Version>=__alaBaseBtn_Version then
	return;
end
----------------------------------------------------------------------------------------------------
local btnSize=24;
local btnInterval=2;
local backdrop = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = nil;--"Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 2,
	edgeSize = 2,
	insets = { left = 0, right = 0, top = 0, bottom = 0 }
};
local backdropColor = { 0.15, 0.15, 0.15, 0.33 };

if __alaBaseBtn then
	for k,v in pairs(__alaBaseBtn) do
		if k~=0 then
			__alaBaseBtn[k]=nil;
		end
	end
end
local alaBaseBtn=__alaBaseBtn or CreateFrame("frame","__alaBaseBtn",UIParent);
alaBaseBtn:Show();
alaBaseBtn:SetWidth(btnSize);
alaBaseBtn:SetHeight(btnSize);
alaBaseBtn.BtnList=alaBaseBtn.BtnList or {n=0,};
alaBaseBtn.BPList=alaBaseBtn.BPList or {};
alaBaseBtn.SubBPList=alaBaseBtn.SubBPList or {};
alaBaseBtn:SetMovable(true);
alaBaseBtn.HandleEvent=alaBaseBtn.HandleEvent or {"OnClick","OnDragStart","OnDragStop","OnEnter","OnLeave",};
local function onDragStart(self)
	if self:IsMovable() and IsControlKeyDown() then
		self.AnchorParent:StartMoving();
	end
end
local function onDragStop(self)
	if self:IsMovable() then
		self.AnchorParent:StopMovingOrSizing();
		alaBaseBtn:RecordPos();
	end
end
local function onEnter(self)
	GameTooltip:SetOwner(self,"ANCHOR_BOTTOMLEFT");
	for _,v in pairs(self.gtLine) do
		if type(v)=="string" then
			GameTooltip:AddLine(v);
		elseif type(v)=="function" then
			GameTooltip:AddLine(v());
		end
	end
	--GameTooltip:AddLine("\124cffff40ff按住ctrl右击重置位置\124r");
	--GameTooltip:AddLine("\124cffff40ff按住ctrl拖动移动位置\124r");
	GameTooltip:Show();
end
local function onLeave(self)
	if GameTooltip:GetOwner()==self then
    	GameTooltip:Hide();
	end
end
local function onClick(self,button,...)
	if button=="RightButton" and IsControlKeyDown() then
		self.AnchorParent:ResetPoint();
	elseif self.onClickHandler then
		self.onClickHandler(self,button,...);
	end
end

local function onClickP(self,button,...)
	if self.isBtnShown then
		for _,b in pairs(self.list) do
		    b:Hide();
		end
	    self.isBtnShown=false;
	else
	    for _,b in pairs(self.list) do
		    b:Show();
		end
	    self.isBtnShown=true;
		self.elasped=2.5;
	end
end
local function onUpdateP(self,elasped)
    if self.isBtnShown then
		self.elasped=self.elasped-elasped;
		if self.elasped<=0 then
		    --onClickP(self);
		end
	end
end

local function onDragStartPB(self)
	if self:IsMovable() and IsControlKeyDown() then
		self.panel.AnchorParent:StartMoving();
	end
end
local function onDragStopPB(self)
	if self:IsMovable() then
		self.panel.AnchorParent:StopMovingOrSizing();
		alaBaseBtn:RecordPos();
	end
end
local function onEnterPB(self)
	GameTooltip:SetOwner(self,"ANCHOR_BOTTOMLEFT");
	for _,v in pairs(self.gtLine) do
		if type(v)=="string" then
			GameTooltip:AddLine(v);
		elseif type(v)=="function" then
			GameTooltip:AddLine(v());
		end
	end
	GameTooltip:Show();
end
local function onLeavePB(self)
	if GameTooltip:GetOwner()==self then
    	GameTooltip:Hide();
	end
end
local function onClickPB(self,button,...)
	if button=="RightButton" and IsControlKeyDown() then
		self.panel.AnchorParent:ResetPoint();
	elseif self.onClickHandler then
		self.onClickHandler(self,button,...);
		onClickP(self.panel);
	end
end
--posIndexMajor,posIndexMinor,btn,customScript,resize,show
--posIndexMajor,btn,customScript,resize,show
--btn,customScript,resize,show
function alaBaseBtn:AddBtn(posIndexMajor,posIndexMinor,btn,customScript,resize,show)
	local list=self.BtnList;
	if posIndexMajor and type(posIndexMajor)=="table" then
		btn,customScript,resize,show=posIndexMajor,posIndexMinor,btn,customScript;
		posIndexMajor=1;
		posIndexMinor=-1;
	elseif posIndexMinor and type(posIndexMinor)=="table" then
		btn,customScript,resize,show=posIndexMinor,btn,customScript,resize;
		posIndexMajor=tonumber(posIndexMajor);
		if not posIndexMajor or posIndexMajor<=0 then
			posIndexMajor=1;
		end
		posIndexMinor=-1;
	elseif btn and type(btn)=="table" then
		posIndexMajor=tonumber(posIndexMajor);
		if not posIndexMajor or posIndexMajor<=0 then
			posIndexMajor=1;
		end
		posIndexMinor=tonumber(posIndexMinor);
		if not posIndexMinor or posIndexMinor<=0 then
			posIndexMinor=-1;
		end
	end
	for i=list.n+1,posIndexMajor do
		list[i]=list[i] or {n=0};
	end
	list.n=max(list.n,posIndexMajor);
	list[posIndexMajor].n=list[posIndexMajor].n+1;
	if posIndexMinor>list[posIndexMajor].n then
		list[posIndexMajor].n=posIndexMinor;
	elseif posIndexMinor<0 then
		posIndexMinor=list[posIndexMajor].n;
	end
	table.insert(list[posIndexMajor],posIndexMinor,btn);
	local pos=0;
	for i=1,posIndexMajor-1 do
		pos=pos+list[i].n;
	end
	for i=posIndexMajor,list.n do
		local l=list[i];
		for j=1,l.n do
			pos=pos+1;
			local b=l[j];
			if b then
				b:ClearAllPoints();
				b:SetPoint("TOP",self,"TOP",(btnSize+btnInterval)*(pos-1),0);
			end
		end
	end
	btn.AnchorParent=self;
	if not customScript then
		btn:SetScript("OnClick",onClick);
		btn:SetScript("OnEnter",onEnter);
		btn:SetScript("OnLeave",onLeave);
		btn:SetScript("OnDragStart",onDragStart);
		btn:SetScript("OnDragStop",onDragStop);
	end
	btn:SetParent(alaBaseBtn);
	if resize then
		btn:SetWidth(btnSize);
		btn:SetHeight(btnSize);
	end
	if show then
		btn:Show();
	end
end
--posIndexMajor,posIndexMinor,hide
--btn,hide
function alaBaseBtn:RemoveBtn(posIndexMajor,posIndexMinor,hide)
	if posIndexMajor then
		local list=self.BtnList;
		if type(posIndexMajor)=="table" then
			local btn=posIndexMajor;
			hide=posIndexMinor;
			for i=1,list.n do
				local l=list[i];
				for j=1,l.n do
					if l[j]==btn then
						table.remove(l,j);
						l.n=l.n-1;
					end
				end
			end
			btn:ClearAllPoints();
			if hide then
				btn:Hide();
			end
		else
			posIndexMajor=tonumber(posIndexMajor);
			if posIndexMajor>0 then
				if type(posIndexMinor)=="table" then
					local btn=posIndexMinor;
					local l=list[posIndexMajor];
					for j=1,l.n do
						if l[j]==btn then
							table.remove(l,j);
							l.n=l.n-1;
						end
					end
				else
					posIndexMinor=tonumber(posIndexMinor);
					if posIndexMinor>0 then
						local l=list[posIndexMajor];
						if l and l[posIndexMinor] then
							l[posIndexMinor]:ClearAllPoints();
							if hide then
								l[posIndexMinor]:Hide();
							end
							table.remove(l,posIndexMinor);
							l.n=l.n-1;
						end
					end
				end
			end
		end
		local pos=0;
		for i=1,list.n do
			local l=list[i];
			for j=1,l.n do
				pos=pos+1;
				local b=l[j];
				if b then
					b:ClearAllPoints();
					b:SetPoint("TOP",self,"TOP",(btnSize+btnInterval)*(pos-1),0);
				end
			end
		end
	end
end
function alaBaseBtn:AddPanelBtn(panel,Btn)
    --Btn:SetMovable(false);
	if type(panel)=="number" or type(panel)=="string" then
	    panel=self.BPList[panel];
	end
	if not panel or not panel.list then
		return;
	end
	panel.num=panel.num+1;
	panel.list[panel.num]=Btn;
	if panel.num==1 then
	    Btn:ClearAllPoints();
		Btn:SetPoint("BOTTOM",panel,"TOP",0,2);
	else
	    Btn:ClearAllPoints();
		Btn:SetPoint("BOTTOM",panel.list[panel.num-1],"TOP",0,2);
	end
	if panel.isBtnShown then
	    Btn:Show();
	else
	    Btn:Hide();
	end
	Btn:SetScript("OnClick",onClickPB);
	Btn:SetScript("OnEnter",onEnterPB);
	Btn:SetScript("OnLeave",onLeavePB);
	Btn:SetScript("OnDragStart",onDragStartPB);
	Btn:SetScript("OnDragStop",onDragStopPB);
	Btn.panel=panel;
end
function alaBaseBtn:CreateBtn(posIndexMajor,posIndexMinor,name,nTex,pTex,hTex,onClickHandler,line,panel,alpha)
	if type(posIndexMajor)=="string" then
		name,nTex,pTex,hTex,onClickHandler,line,panel,alpha=posIndexMajor,posIndexMinor,name,nTex,pTex,hTex,onClickHandler,line;
		posIndexMajor=1;
		posIndexMinor=-1
	else
		if type(posIndexMinor)=="string" then
			name,nTex,pTex,hTex,onClickHandler,line,panel,alpha=posIndexMinor,name,nTex,pTex,hTex,onClickHandler,line,panel;
			posIndexMajor=tonumber(posIndexMajor);
			if not posIndexMajor or posIndexMajor<=0 then
				posIndexMajor=1;
			end
			posIndexMinor=-1
		else
			posIndexMajor=tonumber(posIndexMajor);
			if not posIndexMajor or posIndexMajor<=0 then
				posIndexMajor=1;
			end
			posIndexMinor=tonumber(posIndexMinor);
			if not posIndexMinor or posIndexMinor<=0 then
				posIndexMinor=-1;
			end
		end
	end
    name=name or "alaBaseBtnChildren";
	local btn=CreateFrame("Button",name,alaBaseBtn);
	btn:SetWidth(btnSize);
	btn:SetHeight(btnSize);
	if nTex then
	    if string.lower(nTex)=="class" then
		    local btnTexture=btn:CreateTexture(name.."Texture","BACKGROUND");
		    btnTexture:SetAllPoints(btn);
		    btnTexture:SetTexture("Interface\\TARGETINGFRAME\\UI-CLASSES-CIRCLES");
			if pTex and CLASS_ICON_TCOORDS[string.upper(pTex)] then
				btnTexture:SetTexCoord(unpack(CLASS_ICON_TCOORDS[pTex]));
			else
				btnTexture:SetTexCoord(unpack(CLASS_ICON_TCOORDS[select(2,UnitClass("player")) or "WARRIOR"]));
			end
		elseif string.lower(nTex)=="char" then
			--local btnTexture=btn:CreateTexture(name.."Texture","BACKGROUND");
			--btnTexture:SetAllPoints(btn);
			--btnTexture:SetTexture("Interface\\AddOns\\_x\\icon\\text_push_frame");
			--btnTexture:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress");
		    --btn:SetNormalTexture("Interface\\Buttons\\UI-Quickslot-Depress");
			local btnFontString=btn:CreateFontString(name.."FontString","ARTWORK");
			local font,size,outline=PlayerFrame.healthbar.TextString:GetFont();
			btnFontString:SetFont(font,btnSize*0.75,"OUTLINE");
			--btnFontString:SetFont("Fonts\\ARKai_C.ttf",btnSize/2,"OUTLINE");
			btnFontString:SetAllPoints();
			btnFontString:SetPoint("CENTER",btn);
			btnFontString:SetText(pTex);
			--btnFontString:Show();
		elseif pTex then
		    btn:SetNormalTexture(nTex);
		    btn:SetPushedTexture(pTex);
		else
		    local btnTexture=btn:CreateTexture(name.."Texture","BACKGROUND");
		    btnTexture:SetAllPoints(btn);
		    btnTexture:SetTexture(nTex);
		end
	end
	if hTex then
		btn:SetHighlightTexture(hTex);
	else
		btn:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight");
	end
	btn:GetHighlightTexture():SetBlendMode("ADD");
	--
	btn:SetAlpha(alpha or 1);
	btn:SetFrameLevel(32);
	btn:SetMovable(true);
	btn:EnableMouse(true);
	btn:RegisterForClicks("LeftButtonUp","RightButtonUp");
	btn:ClearAllPoints();
	btn.gtLine=line or {};
	btn.onClickHandler=onClickHandler;
	btn:Show();
	if panel then
	    self:AddPanelBtn(panel,btn);
	else
		btn:RegisterForDrag("LeftButton","RightButton");
	    self:AddBtn(posIndexMajor,posIndexMinor,btn);
	end
	return btn;
end
function alaBaseBtn:CreateBtnPanel(name,nTex,pTex,line)
    if not name then
	    name=1;
		while self.BPList[name] do
		    name=name+1;
		end
	end
	local btn=self:CreateBtn(name.."BTN",nTex,pTex,onClickBP,line);
	btn.onClickHandler=onClickP;
	btn.list={};
	btn.num=0;
	self.BPList[name]=btn;
	btn.isBtnShown=false;
	btn:SetScript("OnUpdate",onUpdateP);
	return name;
end
----------
__alaBaseBtn=alaBaseBtn;
__alaBaseBtn.Version=__alaBaseBtn_Version;
----------
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
function alaBaseBtn:RecordPos()
	alaBaseData=alaBaseData or {};
	alaBaseData.xBtn=alaBaseData.xBtn or {};
	alaBaseData.xBtn.posEx=alaBaseData.xBtn.posEx or "BELOW_EDITBOX";
	alaBaseData.xBtn.scale=alaBaseData.xBtn.scale or 1.0;
	alaBaseData.xBtn.pos={self:GetPoint()};
	if alaBaseData.xBtn.pos[1] and type(alaBaseData.xBtn.pos[1])=="table" then
		alaBaseData.xBtn.pos[1]=alaBaseData.xBtn.pos[1]:GetName()
	end
	if alaBaseData.xBtn.pos[2] and type(alaBaseData.xBtn.pos[2])=="table" then
		alaBaseData.xBtn.pos[2]=alaBaseData.xBtn.pos[2]:GetName()
	end
end
function alaBaseBtn:ResetEditBox()
	if alaBaseData.xBtn.posEx=="ABOVE_EDITOBX" then
		for i=1,NUM_CHAT_WINDOWS do
			local editbox=_G["ChatFrame"..i.."EditBox"];
			local chatframe=_G["ChatFrame"..i];
			editbox:ClearAllPoints();
			editbox:SetPoint("TOPLEFT",chatframe,"BOTTOMLEFT",-5,-5-btnSize*alaBaseData.xBtn.scale);
			editbox:SetPoint("TOPRIGHT",chatframe,"BOTTOMRIGHT",-5,-5-btnSize*alaBaseData.xBtn.scale);
		end
	else
		for i=1,NUM_CHAT_WINDOWS do
			local editbox=_G["ChatFrame"..i.."EditBox"];
			local chatframe=_G["ChatFrame"..i];
			editbox:ClearAllPoints();
			editbox:SetPoint("TOPLEFT",chatframe,"BOTTOMLEFT",-5,-2);
			editbox:SetPoint("TOPRIGHT",chatframe,"BOTTOMRIGHT",-5,-2);
		end
	end
end
function alaBaseBtn:ResetPoint()
	alaBaseData=alaBaseData or {};
	alaBaseData.xBtn=alaBaseData.xBtn or {};
	alaBaseData.xBtn.posEx=alaBaseData.xBtn.posEx or "BELOW_EDITBOX";
	alaBaseData.xBtn.scale=alaBaseData.xBtn.scale or 1.0;
	self:ClearAllPoints();
	if alaBaseData.xBtn.posEx=="ABOVE_EDITOBX" then
		self:SetPoint("TOPLEFT",ChatFrame1,"BOTTOMLEFT",0,-6);
	elseif alaBaseData.xBtn.posEx=="BELOW_EDITBOX" then
		self:SetPoint("TOPLEFT",ChatFrame1EditBox,"BOTTOMLEFT",0,-1);
	elseif alaBaseData.xBtn.posEx=="ABOVE_CHATFRAME" then
		self:SetPoint("BOTTOMLEFT",ChatFrame1Tab,"TOPLEFT",0,1);
	end
	self:ResetEditBox();
	alaBaseBtn:RecordPos();
end

function alaBaseBtn:Scale(s)
	alaBaseData.xBtn.scale=s;
	self:SetScale(s);
	if(alaBaseData.xBtn.posEx=="ABOVE_EDITOBX") then
		self:ResetEditBox();
	end
end
function alaBaseBtn:Pos(p)
	if p~=alaBaseData.xBtn.posEx and (p=="ABOVE_EDITOBX" or p=="BELOW_EDITBOX" or p=="ABOVE_CHATFRAME") then
		alaBaseData.xBtn.posEx=p;--ABOVE_EDITOBX,BELOW_EDITBOX,ABOVE_CHATFRAME
		self:ResetPoint();
	end
end

eventCall("PLAYER_ENTERING_WORLD",function()
										alaBaseData=alaBaseData or {};
										if alaBaseData.xBtn then
											if not alaBaseData.xBtn._version or alaBaseData.xBtn._version<__alaBaseBtn_Version then
												alaBaseData.xBtn._version=__alaBaseBtn_Version;
												alaBaseData=alaBaseData or {};
												alaBaseData.xBtn=alaBaseData.xBtn or {};
												alaBaseData.xBtn.posEx=alaBaseData.xBtn.posEx or "BELOW_EDITBOX";
												alaBaseData.xBtn.scale=alaBaseData.xBtn.scale or 1.0;
											end
											if alaBaseData.xBtn.pos then
												alaBaseBtn:ClearAllPoints();
												alaBaseBtn:SetPoint(unpack(alaBaseData.xBtn.pos));
												alaBaseBtn:SetScale(alaBaseData.xBtn.scale);
												alaBaseBtn:ResetEditBox();
											else
												alaBaseBtn:ResetPoint();
											end
										else
											alaBaseBtn:ResetPoint();
										end
									end
								,false);
