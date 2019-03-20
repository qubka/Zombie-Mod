/**
 * =============================================================================
 * SourceMod Zombie Escape Extension
 * Copyright (C) 2015-2018 Nikita Ushakov.  All rights reserved.
 * =============================================================================
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, version 3.0, as published by the
 * Free Software Foundation.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * As a special exception, AlliedModders LLC gives you permission to link the
 * code of this program (as well as its derivative works) to "Half-Life 2," the
 * "Source Engine," the "SourcePawn JIT," and any Game MODs that run on software
 * by the Valve Corporation.  You must obey the GNU General Public License in
 * all respects for all other code used.  Additionally, AlliedModders LLC grants
 * this exception to all derivative works.  AlliedModders LLC defines further
 * exceptions, found in LICENSE.txt (as of this writing, version JULY-31-2007),
 * or <http://www.sourcemod.net/license.php>.
 */
 
#ifndef _INCLUDE_SOURCEMOD_EXTENSION_CVARS_H_
#define _INCLUDE_SOURCEMOD_EXTENSION_CVARS_H_
 
/**
 * @file cvars.h
 * @brief Cvars module code header.
 */


/**
 * @brief Any executable that wants to use ConVars need to implement.
 */
class LinkConVars : public IConCommandBaseAccessor
{
public:
	/**
	 * @brief Flags is a combination of FCVAR flags in cvar.h.
	 */
	bool RegisterConCommandBase(ConCommandBase *pBase)
	{
		return META_REGCVAR(pBase);
	}
} s_LinkConVars;

/**
 * @brief Initialize cvars.
 */
void CvarLoad();

/**
 * @brief Load cvars config.
 */
void CvarActivated();
 
#endif // _INCLUDE_SOURCEMOD_EXTENSION_CVARS_H_