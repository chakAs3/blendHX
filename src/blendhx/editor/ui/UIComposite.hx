package blendhx.editor.ui;

class UIComposite extends UIComponent
{	
	public var uiComponents:Array<UIComponent> = [];
	
	public function addUIComponent( uiComponent:UIComponent )
	{
		addChild(uiComponent);
		uiComponents.push(uiComponent);
		uiComponent.container = this;
	}
	
	public function removeUIComponent(uiComponent:UIComponent)
	{
		removeChild(uiComponent);
		uiComponents.remove(uiComponent);
		uiComponent.dispose();
	}
	
	public function removeUIComponents()
	{
		for(uiComponent in uiComponents)
		{
			removeChild(uiComponent);
			uiComponent.dispose();
		}
			
		uiComponents = [];
	}
	
	override public function resize()
	{
		for(uiComponent in uiComponents)
			uiComponent.resize();
	}
	
	override public function dispose()
	{
		removeUIComponents();
		
		uiComponents = [];
		
		super.dispose();
	}
}