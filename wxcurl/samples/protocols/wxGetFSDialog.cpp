/*
 *	wxGetFSDialog.cpp
 *	wxCURL
 *
 *	Created by Casey O'Donnell on Fri Jun 18 2004.
 *	Copyright (c) 2004 Casey O'Donnell. All rights reserved.
 *
 */

// wxGetFSDialog.cpp: implementation of the wxGetFSDialog class.
//
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Headers
//////////////////////////////////////////////////////////////////////
#include "wx/wxprec.h"

#ifndef WX_PRECOMP
	#include "wx/wx.h"
#endif
#include <wx/xrc/xmlres.h>

#include <wx/curl/davtool.h>

#include "wxGetFSDialog.h"

//////////////////////////////////////////////////////////////////////
// Resources
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Constants
//////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////
// Event Tables and Other Macros for wxWindows
//////////////////////////////////////////////////////////////////////

// the event tables connect the wxWindows events with the functions (event
// handlers) which process them. It can be also done at run-time, but for the
// simple menu events like this the static method is much simpler.
IMPLEMENT_CLASS(wxGetFSDialog, wxDialog)
BEGIN_EVENT_TABLE(wxGetFSDialog, wxDialog)
	EVT_BUTTON(XRCID("file_menu_getfs"), wxGetFSDialog::OnGetFS)
END_EVENT_TABLE()

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

wxGetFSDialog::wxGetFSDialog(wxWindow* pParent)
{
	wxXmlResource::Get()->LoadDialog(this, pParent, wxT("getfs_dialog"));

	SetSize(400,400);

	m_pTextCtrl = XRCCTRL(*this, "text_ctrl", wxTextCtrl);
	m_pHostCtrl = XRCCTRL(*this, "host_text_ctrl", wxTextCtrl);

	m_pUserCtrl = XRCCTRL(*this, "user_text_ctrl", wxTextCtrl);
	m_pPassCtrl = XRCCTRL(*this, "pass_text_ctrl", wxTextCtrl);

	if(m_pUserCtrl && m_pPassCtrl)
	{
		m_szDefaultUser = m_pUserCtrl->GetValue();
		m_szDefaultPass = m_pPassCtrl->GetValue();
	}
}

wxGetFSDialog::~wxGetFSDialog()
{

}

//////////////////////////////////////////////////////////////////////
// Event Handlers
//////////////////////////////////////////////////////////////////////

void wxGetFSDialog::OnGetFS(wxCommandEvent& WXUNUSED(event))
{
	wxString szHost, szUser, szPass;

	if(m_pHostCtrl && m_pUserCtrl && m_pPassCtrl)
	{
		szHost = m_pHostCtrl->GetValue();
		szUser = m_pUserCtrl->GetValue();
		szPass = m_pPassCtrl->GetValue();

		wxCurlDAVTool dav(szHost);

		if(szUser != m_szDefaultUser)
			dav.SetUsername(szUser);

		if(szPass != m_szDefaultPass)
			dav.SetPassword(szPass);

		wxString szResponse;

		wxArrayDAVFs fsResponse;

		if(dav.GetDAVFs(fsResponse))
		{
			szResponse = wxT("SUCCESS!\n\n");
			szResponse += wxString::Format(wxT("\nResponse Code: %d\n\n"), dav.GetResponseCode());

			for(unsigned int i = 0; i < fsResponse.Count(); i++)
			{
				const wxCurlDAVFs& fsItem = fsResponse[i];

				szResponse += fsItem.GetHREF();
				szResponse += wxT("\n");
				szResponse += fsItem.GetStatus();
				szResponse += wxT("\n");
				szResponse += fsItem.GetContentType();
				szResponse += wxT("\n\n");
			}

			if(m_pTextCtrl)
				m_pTextCtrl->SetValue(szResponse);
		}
		else
		{
			szResponse = wxT("FAILURE!\n\n");
			szResponse += wxString::Format(wxT("\nResponse Code: %d\n\n"), dav.GetResponseCode());
			szResponse += dav.GetResponseHeader();
			szResponse += wxT("\n\n");
			szResponse += dav.GetResponseBody();
			szResponse += wxT("\n\n");
			szResponse += dav.GetErrorString();

			if(m_pTextCtrl)
				m_pTextCtrl->SetValue(szResponse);
		}
	}
}

