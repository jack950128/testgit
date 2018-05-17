--重载函数来接收node生命周期事件 onEnter() onExit() onEnterTransitionFinish() onExitTransitionStart() onCleanup()
local BaseUI = class("BaseUI", cc.Node)
--每个界面layer, 需要配置的参数写在这里，不需要的直接使用默认的
BaseUI.csbFile = nil --场景文件
BaseUI.isModal = false --是否模态, 是否需要添加背景层
BaseUI.csbPosition = cc.p(display.cx,display.cy)
BaseUI.hideTags = {} --需要隐藏的tags, tag或者名字来索引，xxx = 123 或者 xxx="tttbtn",
BaseUI.tags = {} --ui控件的tag表，所有tag写这里, 可以通过tag或者名字来索引，xxx = 123 或者 xxx="tttbtn", 然后直接使用self.ui.xxx来使用对象, 预制tag closeBtn 关闭按钮
BaseUI.rpcList = {}--当前界面与服务器交互的接口注册列表
BaseUI.zorder = 0--将界面add到当前运行scene中的层级 需要主动调用：showToScene,  zorder值必须是MUiEnum中定义的
BaseUI.customEventList = {
	
}

function BaseUI:ctor(...)
	self._eventListeners = {}
	self._timeHandle = {}
	self._cleanupFlag = true
	self:init()

	self:onCreate(...)
	self:initEvents()

	self:bindRpc()
	self:bindCustomEvent()

	return self
end

function BaseUI:init()
	self:enableNodeEvents()

	self.uiLayer = nil--从csb加载的界面
	self.root = nil--加载的界面中的root容器，每个界面都会有一个root容器
	self.modalLayer = nil--背景遮罩层
	self.ui = {}--从tag中查出来的控件

	self:addModalBg()

	if type(self.csbFile) == "string" then
		self.scale = 1
		if self.isModal == true then
			self.scale = 0.8
			self.csbPosition.x = display.width/2
			self.csbPosition.y = display.height/2
		end
		self.uiLayer = cc.CSLoader:createNode(self.csbFile)
			:setScale(self.scale):align(cc.p(0,0),self.csbPosition.x, self.csbPosition.y)
			:addTo(self)

		if self.isModal == true then
			self.uiLayer:align(cc.p(0.5,0.5),self.csbPosition.x, self.csbPosition.y)
		end

		self.root = self.uiLayer:getChildByName("root")

		self:checkDoubleTag()

		self:hideNodes()
		self:prefindTags()
		self:bindCommonHandle()
		self:runScaleAni()
	end

	return self
end

function BaseUI:runScaleAni()
	if self.scale == 0.8 then
		-- local scale1 = cc.ScaleTo:create(1,1)
		-- local scale2 = cc.ScaleTo:create(1,1)
		-- local seq = cc.Sequence:create(scale1,scale2)
		-- self.uiLayer:runAction(cc.EaseElasticOut:create(scale1,0.2))
		self.uiLayer:runAction(cc.EaseElasticOut:create(cc.ScaleTo:create(0.6,1),0.5))
	end
end

function BaseUI:addTimer( timer )
	self._timeHandle[timer] = true
end

--预先找到tags列表中的控件
function BaseUI:prefindTags()

	self.ui = {}
	for tk, tv in pairs(self.tags) do
		if type(tv) == "number" then
			self.ui[tk] = self:getNodeByTag( tv )
		elseif type(tv) == "string" then
			self.ui[tk] = self:getNodeByName( tv )
		end
	end
end

-- 隐藏需要的节点
function BaseUI:hideNodes()
	for tk, tv in pairs(self.hideTags) do
		local item = nil
		if type(tv) == "number" then
			item = self:getNodeByTag( tv )
		elseif type(tv) == "string" then
			item = self:getNodeByName( tv )
		end

		if item ~= nil then
			item:setVisible(false)
		end
	end
end

-- 进入场景后执行,创建后会调用此函数，初始化自身的逻辑代码
function BaseUI:onCreate(...)
end

-- 初始化事件
function BaseUI:initEvents()

end

--移除前函数 重载
function BaseUI:onRemove()

end

--关闭按钮关闭前调用
function BaseUI:onClose()

end

--关闭layer调用的函数，子类重载
function BaseUI:remove()
	self:onRemove()
	self:removeSelf()
end

function BaseUI:onEnter()

end

function BaseUI:onExit()
	-- print("这个函数调用几次",self)
end

function BaseUI:onCleanup()
	-- todo 临时方案,这里会调用多次
	if not self._cleanupFlag then
		return
	end
	self._cleanupFlag = true
	self:unbindRpc()
	self:unbindCustomEvent()
	for k,v in pairs(self._timeHandle) do
		MTimer.stopTimeFormatScheduler(k)
	end
	self:beforeCleanup()
	self:bBeforeCleanup()
end
-- 在cleanup之前调用
function BaseUI:beforeCleanup()
end
-- 在cleanup之前调用
function BaseUI:bBeforeCleanup()
end

function BaseUI:addModalBg()
	if self.isModal ~= true then
		return
	end

	if self.modalLayer ~= nil then
		self.modalLayer:removeSelf()
		self.modalLayer = nil
	end
	self.modalLayer = MUIUtil.layerBg( self )
end

-- 获得任意节点
function BaseUI:getNodeByTag( tag )
	return ccui.Helper:seekWidgetByTag(self.root,tag)
end
-- 获得任意节点
function BaseUI:getNodeByName( name )
	return ccui.Helper:seekWidgetByName(self.root,name)
end

-- 绑定以后 以后有可能有帮助按钮
function BaseUI:bindCommonHandle()
	-- 绑定关闭按钮
	if self.ui.btnClose == nil then
		return
	end
	self.ui.btnClose:addClickEventListener(function (  )
		self:onClose()
		self:remove()
	end)
end

--绑定rpc函数
function BaseUI:bindRpc()
	for i, v in ipairs(self.rpcList) do
		MSys.regRpcClassFunc(self, v, self[v])
	end
end

--解绑rpc函数
function BaseUI:unbindRpc()
	--MSys.unRegRpcClassFunc( self.rpcList, self )
end




--绑定 customevent
function BaseUI:bindCustomEvent()
	for i, v in ipairs(self.customEventList) do
		MCustomEvent.bind(self,v.event,self[v.handle],{},v.sppriority)
	end
end

--解绑 customevent
function BaseUI:unbindCustomEvent()
	--MCustomEvent.unbind(self)
end

--将节点显示到当前运行的scene中
function BaseUI:showToScene()
	app.gameScene:showToScene(self)
	return self
end

function BaseUI:showToTop()
	app.gameScene:showToTop(self)
	return self
end

--将层显示到主界面
function BaseUI:showToMainScene()
	
end

--检查界面是否有tag是重复的
function BaseUI:checkDoubleTag()
	if self.uiLayer == nil then
		return
	end
	
-- 检测有bug，不检测这些csb
	local csbNotCheck = {
		["ui/mainscene/MainLayer.csb"] = 1,
	}
	if csbNotCheck[self.csbFile] ~= nil then
		return
	end

	-- print("tag checking---------------------", self.csbFile)
	local tagMap = {}

	local function innloopTag( tobj )
		-- print("my tag:", tobj:getTag() )
		local childs = tobj:getChildren()
		for ti, tv in pairs(childs) do
			local ttag = tv:getTag()
			-- print("tag:", ttag)
			local old = tagMap[ttag]
			if old ~= nil then
				print( "error double tag:"..ttag.." name:"..old:getName() )
				print( "error double tag:"..ttag.." name:"..tv:getName() )
				assert(false)
			end
			

			tagMap[ttag] = tv
			innloopTag( tv )
		end
	end

	innloopTag( self.uiLayer )
end

function BaseUI:dumpChildren()
	print("BaseUI dumpChildren")
	local arr = self.root:getChildren()
	for i,v in ipairs(arr) do
		print(i,v:getTag(),v:getName())
	end
end

return BaseUI