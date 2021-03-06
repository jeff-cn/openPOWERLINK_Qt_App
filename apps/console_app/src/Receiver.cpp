/**
********************************************************************************
\file   Receiver.cpp

\brief  Signal receiver implementation

\author Ramakrishnan Periyakaruppan

\copyright (c) 2014, Kalycito Infotech Private Limited
					 All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
	* Redistributions of source code must retain the above copyright
	  notice, this list of conditions and the following disclaimer.
	* Redistributions in binary form must reproduce the above copyright
	  notice, this list of conditions and the following disclaimer in the
	  documentation and/or other materials provided with the distribution.
	* Neither the name of the copyright holders nor the
	  names of its contributors may be used to endorse or promote products
	  derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

/*******************************************************************************
* INCLUDES
*******************************************************************************/
#include <oplk/debugstr.h>
#include "../include/Receiver.h"

void Receiver::HandleNodeStateChanged(const int nodeId, tNmtState nmtState)
{
	qDebug("Node %d changed state to %s.", nodeId, debugstr_getNmtStateStr(nmtState));
}

void Receiver::HandleLocalNodeStateChanged(tNmtState nmtState)
{
	qDebug("Local Node changed state to %s.", debugstr_getNmtStateStr(nmtState));
}

void Receiver::HandleLogEvent(const QString& logStr)
{
	qDebug("%s", logStr.toStdString().c_str());
}

void Receiver::HandleSdoTransferFinished(const SdoTransferResult result)
{
	qDebug("SdoTransferFinished Abort: %x, NodeId: %x, Index: %x, SubIndex:%x state:%x",
		   result.GetAbortCode(), result.GetNodeId(),
		   result.GetIndex(), result.GetSubIndex(), result.GetSdoComConState());
	if (result.GetAbortCode() != 0)
	{

	}
}

void Receiver::HandleNodeFound(const int nodeId)
{
	qDebug("Node %d found.", nodeId);
}
