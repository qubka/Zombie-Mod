/**
 * ============================================================================
 *
 *  Zombie Mod #4 Generation
 *
 *
 *  Copyright (C) 2017-2018 Nikita Ushakov (Ireland, Dublin)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * ============================================================================
 **/

#include <sourcemod>
#include <sdktools>
#include <zombiemod>

/**
 * Record plugin info.
 **/
public Plugin HumanClassClassic =
{
	name        	= "[ZM] Human Class: Classic",
	author      	= "qubka (Nikita Ushakov)",
	description 	= "Addon of human classes",
	version     	= "1.0",
	url         	= "https://forums.alliedmods.net/showthread.php?t=290657"
}

/**
 * List of cvars.
 **/
enum ConVarList
{
	ConVar:CVAR_HUMAN_CLASS_NAME,
	ConVar:CVAR_HUMAN_CLASS_MODEL,
	ConVar:CVAR_HUMAN_CLASS_ARM,
	ConVar:CVAR_HUMAN_CLASS_HEALTH,
	ConVar:CVAR_HUMAN_CLASS_SPEED,
	ConVar:CVAR_HUMAN_CLASS_GRAVITY,
	ConVar:CVAR_HUMAN_CLASS_ARMOR,
	ConVar:CVAR_HUMANE_CLASS_FEMALE
};

// Array to store cvar data in
ConVar gCvarList[ConVarList];

// Initialize human class index
int gHumanClassic;
#pragma unused gHumanClassic

/**
 * Plugin is loading.
 **/
public void OnPluginStart(/*void*/)
{
	// Load cvars
	gCvarList[CVAR_HUMAN_CLASS_NAME] 		= CreateConVar("zm_classic_name", 		"Classic");
	gCvarList[CVAR_HUMAN_CLASS_MODEL] 		= CreateConVar("zm_classic_model",	 	"models/player/ctm_swat.mdl");
	gCvarList[CVAR_HUMAN_CLASS_ARM] 		= CreateConVar("zm_classic_arm", 		"models/weapons/ct_arms_swat.mdl");
	gCvarList[CVAR_HUMAN_CLASS_HEALTH] 		= CreateConVar("zm_classic_health", 	"100");
	gCvarList[CVAR_HUMAN_CLASS_SPEED]		= CreateConVar("zm_classic_speed", 		"1.0");
	gCvarList[CVAR_HUMAN_CLASS_GRAVITY] 	= CreateConVar("zm_classic_gravity", 	"1.0");
	gCvarList[CVAR_HUMAN_CLASS_ARMOR] 		= CreateConVar("zm_classic_armor", 		"0");
	gCvarList[CVAR_HUMANE_CLASS_FEMALE] 	= CreateConVar("zm_classic_female", 	"0");

	// Create config
	AutoExecConfig(true, "zm_human_classic");
}

/**
 * The map is starting.
 **/
public void OnMapStart(/*void*/)
{
	// Get human class name
	char sHumanName[32];
	GetConVarString(gCvarList[CVAR_HUMAN_CLASS_NAME], sHumanName, sizeof(sHumanName)); 
	
	// Get human class models
	char sHumanModel[2][512];
	GetConVarString(gCvarList[CVAR_HUMAN_CLASS_MODEL], sHumanModel[0], sizeof(sHumanModel[])); 
	GetConVarString(gCvarList[CVAR_HUMAN_CLASS_ARM],  sHumanModel[1], sizeof(sHumanModel[])); 
	
	// Initilizate human class
	gHumanClassic = ZM_RegisterHumanClass(sHumanName, 
	sHumanModel[0], 
	sHumanModel[1], 
	GetConVarInt(gCvarList[CVAR_HUMAN_CLASS_HEALTH]), 
	GetConVarFloat(gCvarList[CVAR_HUMAN_CLASS_SPEED]), 
	GetConVarFloat(gCvarList[CVAR_HUMAN_CLASS_GRAVITY]), 
	GetConVarInt(gCvarList[CVAR_HUMAN_CLASS_ARMOR]), 
	GetConVarInt(gCvarList[CVAR_HUMANE_CLASS_FEMALE]));
}