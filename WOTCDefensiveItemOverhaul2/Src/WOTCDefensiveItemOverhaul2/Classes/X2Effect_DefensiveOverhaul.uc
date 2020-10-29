class X2Effect_DefensiveOverhaul extends X2Effect_PersistentStatChange config(DefensiveOverhaul);

var config ECharStatType AblativePlatingStatType;

simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local StatChange NewStateChange;

	NewStateChange.StatType = default.AblativePlatingStatType;
	NewStateChange.StatAmount = class'XComGameState_ArmorOverhaul'.static.GetShieldBonus();
	NewStateChange.ModOp = MODOP_Addition;

	m_aStatChanges.Length = 0;
	m_aStatChanges.AddItem(NewStateChange);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}

defaultproperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "IRI_DefensiveOverhaul_Effect"
}