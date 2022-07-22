class UIScreenListener_ArmorOverhaul extends UIScreenListener;

event OnInit (UIScreen Screen)
{
	//`LOG("Screen class:" @ Screen.Class.Name,, 'IRILOG');

	if (UIArmory_Loadout(Screen) != none || UIPersonnel_Armory(Screen) != none)
	{
		if (IsInStrategy())
		{
			class'XComGameState_ArmorOverhaul'.static.Update();
		}
	}

	//UIArmory_MainMenu
	//UIArmory_Loadout
	//UIPersonnel_Armory
}

private function bool IsInStrategy()
{
	return `HQGAME  != none && `HQPC != None && `HQPRES != none;
}