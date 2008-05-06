/////////////////////////////////////////////////////////////////////////////
// Name:        DatabaseConnectionDlg.cpp
// Purpose:     
// Author:      Matías Szeftel
// Modified by: 
// Created:     Fri 09 Feb 2007 00:58:02 ART
// RCS-ID:      
// Copyright:   (c) 2006 Matías Szeftel <mszeftel@yahoo.com.ar>
// Licence:     GPL (GNU Public License)
/////////////////////////////////////////////////////////////////////////////

// Generated by DialogBlocks (unregistered), Fri 09 Feb 2007 00:58:02 ART

#if defined(__GNUG__) && !defined(NO_GCC_PRAGMA)
#pragma implementation "DatabaseConnectionDlg.h"
#endif

// For compilers that support precompilation, includes "wx/wx.h".
#include "wx/wxprec.h"

#ifdef __BORLANDC__
#pragma hdrstop
#endif

#ifndef WX_PRECOMP
#include "wx/wx.h"
#endif

////@begin includes
////@end includes

#include "../include/DatabaseConnectionDlg.h"

////@begin XPM images
////@end XPM images

/*!
 * DatabaseConnectionDlg type definition
 */

IMPLEMENT_DYNAMIC_CLASS( DatabaseConnectionDlg, wxDialog )

/*!
 * DatabaseConnectionDlg event table definition
 */

BEGIN_EVENT_TABLE( DatabaseConnectionDlg, wxDialog )

////@begin DatabaseConnectionDlg event table entries
    EVT_UPDATE_UI( ID_TCSERVER, DatabaseConnectionDlg::OnTcserverUpdate )

    EVT_UPDATE_UI( ID_TCDATABASE, DatabaseConnectionDlg::OnTcdatabaseUpdate )

    EVT_BUTTON( ID_BTNFILE, DatabaseConnectionDlg::OnBtnfileClick )
    EVT_UPDATE_UI( ID_BTNFILE, DatabaseConnectionDlg::OnBtnfileUpdate )

    EVT_UPDATE_UI( ID_TCUSER, DatabaseConnectionDlg::OnTcuserUpdate )

    EVT_UPDATE_UI( ID_TCPASSWORD, DatabaseConnectionDlg::OnTcpasswordUpdate )

    EVT_BUTTON( ID_CONNECT, DatabaseConnectionDlg::OnConnectClick )
    EVT_UPDATE_UI( ID_CONNECT, DatabaseConnectionDlg::OnConnectUpdate )

////@end DatabaseConnectionDlg event table entries

END_EVENT_TABLE()

/*!
 * DatabaseConnectionDlg constructors
 */

DatabaseConnectionDlg::DatabaseConnectionDlg( )
{
    Init();
}

DatabaseConnectionDlg::DatabaseConnectionDlg( wxWindow* parent, wxWindowID id, const wxString& caption, const wxPoint& pos, const wxSize& size, long style )
{
    Init();
    Create(parent, id, caption, pos, size, style);
}

/*!
 * DatabaseConnectionDlg creator
 */

bool DatabaseConnectionDlg::Create( wxWindow* parent, wxWindowID id, const wxString& caption, const wxPoint& pos, const wxSize& size, long style )
{
////@begin DatabaseConnectionDlg creation
    SetExtraStyle(wxWS_EX_BLOCK_EVENTS);
    wxDialog::Create( parent, id, caption, pos, size, style );

    CreateControls();
    if (GetSizer())
    {
        GetSizer()->SetSizeHints(this);
    }
    Centre();
////@end DatabaseConnectionDlg creation
    return true;
}

/*!
 * Member initialisation 
 */

void DatabaseConnectionDlg::Init()
{
////@begin DatabaseConnectionDlg member initialisation
    activeRecordGen = NULL;
    cmb_type = NULL;
    tc_server = NULL;
    tc_database = NULL;
    btn_file = NULL;
    tc_user = NULL;
    tc_password = NULL;
    btn_connect = NULL;
    btn_cancel = NULL;
////@end DatabaseConnectionDlg member initialisation
}
/*!
 * Control creation for DatabaseConnectionDlg
 */

void DatabaseConnectionDlg::CreateControls()
{    
////@begin DatabaseConnectionDlg content construction
    // Generated by DialogBlocks, Fri 09 Feb 2007 02:00:39 ART (unregistered)

    DatabaseConnectionDlg* itemDialog1 = this;

    wxBoxSizer* itemBoxSizer2 = new wxBoxSizer(wxVERTICAL);
    itemDialog1->SetSizer(itemBoxSizer2);

    wxBoxSizer* itemBoxSizer3 = new wxBoxSizer(wxHORIZONTAL);
    itemBoxSizer2->Add(itemBoxSizer3, 0, wxGROW|wxALL, 5);

    wxStaticText* itemStaticText4 = new wxStaticText( itemDialog1, wxID_STATIC, _("Database Type:"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer3->Add(itemStaticText4, 0, wxALIGN_CENTER_VERTICAL|wxALL|wxADJUST_MINSIZE, 5);

    wxString* cmb_typeStrings = NULL;
    cmb_type = new wxComboBox( itemDialog1, ID_CMBTYPE, _T(""), wxDefaultPosition, wxDefaultSize, 0, cmb_typeStrings, wxCB_READONLY );
    itemBoxSizer3->Add(cmb_type, 1, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    wxStaticText* itemStaticText6 = new wxStaticText( itemDialog1, wxID_STATIC, _("Server IP:"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer3->Add(itemStaticText6, 0, wxALIGN_CENTER_VERTICAL|wxALL|wxADJUST_MINSIZE, 5);

    tc_server = new wxTextCtrl( itemDialog1, ID_TCSERVER, _("localhost"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer3->Add(tc_server, 1, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    wxBoxSizer* itemBoxSizer8 = new wxBoxSizer(wxHORIZONTAL);
    itemBoxSizer2->Add(itemBoxSizer8, 0, wxGROW|wxALL, 5);

    wxStaticText* itemStaticText9 = new wxStaticText( itemDialog1, wxID_STATIC, _("Database Name or File:"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer8->Add(itemStaticText9, 0, wxALIGN_CENTER_VERTICAL|wxALL|wxADJUST_MINSIZE, 5);

    tc_database = new wxTextCtrl( itemDialog1, ID_TCDATABASE, _T(""), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer8->Add(tc_database, 1, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    btn_file = new wxButton( itemDialog1, ID_BTNFILE, _("..."), wxDefaultPosition, wxSize(20, -1), 0 );
    btn_file->Enable(false);
    itemBoxSizer8->Add(btn_file, 0, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    wxBoxSizer* itemBoxSizer12 = new wxBoxSizer(wxHORIZONTAL);
    itemBoxSizer2->Add(itemBoxSizer12, 0, wxGROW|wxALL, 5);

    wxStaticText* itemStaticText13 = new wxStaticText( itemDialog1, wxID_STATIC, _("User:"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer12->Add(itemStaticText13, 0, wxALIGN_CENTER_VERTICAL|wxALL|wxADJUST_MINSIZE, 5);

    tc_user = new wxTextCtrl( itemDialog1, ID_TCUSER, _T(""), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer12->Add(tc_user, 1, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    wxStaticText* itemStaticText15 = new wxStaticText( itemDialog1, wxID_STATIC, _("Password:"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer12->Add(itemStaticText15, 0, wxALIGN_CENTER_VERTICAL|wxALL|wxADJUST_MINSIZE, 5);

    tc_password = new wxTextCtrl( itemDialog1, ID_TCPASSWORD, _T(""), wxDefaultPosition, wxDefaultSize, wxTE_PASSWORD );
    itemBoxSizer12->Add(tc_password, 1, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    wxBoxSizer* itemBoxSizer17 = new wxBoxSizer(wxHORIZONTAL);
    itemBoxSizer2->Add(itemBoxSizer17, 0, wxALIGN_CENTER_HORIZONTAL|wxALL, 5);

    btn_connect = new wxButton( itemDialog1, ID_CONNECT, _("Connect"), wxDefaultPosition, wxDefaultSize, 0 );
    btn_connect->SetDefault();
    btn_connect->Enable(false);
    itemBoxSizer17->Add(btn_connect, 0, wxALIGN_CENTER_VERTICAL|wxALL, 5);

    btn_cancel = new wxButton( itemDialog1, wxID_CANCEL, _("&Cancel"), wxDefaultPosition, wxDefaultSize, 0 );
    itemBoxSizer17->Add(btn_cancel, 0, wxALIGN_CENTER_VERTICAL|wxALL, 5);

////@end DatabaseConnectionDlg content construction
	//enum{AR_SQLITE=0,AR_POSTGRESQL,AR_MYSQL,AR_FIREBIRD,AR_FIREBIRD_EMBEDDED};
	cmb_type->Append(wxT("SQLite3 Database"));
	cmb_type->Append(wxT("PostgreSQL Database"));
	cmb_type->Append(wxT("MySql Database"));
	cmb_type->Append(wxT("Firebird Database"));
	cmb_type->Append(wxT("Firebird Database - Embedded"));
	
}

/*!
 * wxEVT_UPDATE_UI event handler for ID_TCSERVER
 */

void DatabaseConnectionDlg::OnTcserverUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	if(cmb_type->GetSelection()>=AR_POSTGRESQL&&cmb_type->GetSelection()!=AR_FIREBIRD_EMBEDDED)
		enable=true;
	else
		enable=false;

	tc_server->Enable(enable);
}

/*!
 * wxEVT_UPDATE_UI event handler for ID_TCDATABASE
 */

void DatabaseConnectionDlg::OnTcdatabaseUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	else
		enable=true;

	tc_database->Enable(enable);
}

/*!
 * wxEVT_COMMAND_BUTTON_CLICKED event handler for ID_BTNFILE
 */

void DatabaseConnectionDlg::OnBtnfileClick( wxCommandEvent& event )
{
	wxFileDialog fileDlg(this,wxT("Open the database file"));
	if (fileDlg.ShowModal() == wxID_OK)
	{
		tc_database->SetValue(fileDlg.GetPath());

	}
}

/*!
 * wxEVT_UPDATE_UI event handler for ID_BTNFILE
 */

void DatabaseConnectionDlg::OnBtnfileUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	if(cmb_type->GetSelection()==AR_SQLITE||cmb_type->GetSelection()==AR_FIREBIRD_EMBEDDED)
		enable=true;
	else
		enable=false;

	btn_file->Enable(enable);
}

/*!
 * wxEVT_UPDATE_UI event handler for ID_TCUSER
 */

void DatabaseConnectionDlg::OnTcuserUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	if(cmb_type->GetSelection()>=AR_POSTGRESQL)
		enable=true;
	else
		enable=false;

	tc_user->Enable(enable);

}

/*!
 * wxEVT_UPDATE_UI event handler for ID_TCPASSWORD
 */

void DatabaseConnectionDlg::OnTcpasswordUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	if(cmb_type->GetSelection()>=AR_POSTGRESQL)
		enable=true;
	else
		enable=false;

	tc_password->Enable(enable);
}

/*!
 * wxEVT_COMMAND_BUTTON_CLICKED event handler for ID_CONNECT
 */

void DatabaseConnectionDlg::OnConnectClick( wxCommandEvent& event )
{
	bool success=true;
	if(!wxActiveRecordGenerator::IsSupported(cmb_type->GetSelection())){
		wxString supportMsg(wxT("The program was not build with "));
		supportMsg+=cmb_type->GetValue();
		supportMsg+=wxT(" support.");

		wxMessageBox(supportMsg,wxT("Sorry"));
		return;
	}
		
	try{
		activeRecordGen=new wxActiveRecordGenerator(cmb_type->GetSelection(),tc_database->GetValue(),tc_server->GetValue(),tc_user->GetValue(),tc_password->GetValue());
	}
	catch(DatabaseLayerException& e){
		wxString strErr=e.GetErrorMessage();
		wxMessageBox(wxString::Format(wxT("Couldn\'t connect to database.\nError: %d - %s"),e.GetErrorCode(),e.GetErrorMessage().c_str()),wxT("Error"));
		success=false;
	}
	if(success)
		EndModal(wxID_OK);
}

/*!
 * wxEVT_UPDATE_UI event handler for ID_CONNECT
 */

void DatabaseConnectionDlg::OnConnectUpdate( wxUpdateUIEvent& event )
{
	bool enable;
	if(cmb_type->GetSelection()==wxNOT_FOUND)
		enable=false;
	if(cmb_type->GetSelection()>=AR_POSTGRESQL&&cmb_type->GetSelection()!=AR_FIREBIRD_EMBEDDED){
		if(tc_server->GetValue().IsEmpty()||tc_database->GetValue().IsEmpty())
			enable=false;
		else
			enable=true;
	}
	else{
		if(tc_database->GetValue().IsEmpty())
			enable=false;
		else
			enable=true;
	}

	btn_connect->Enable(enable);
}

/*!
 * Should we show tooltips?
 */

bool DatabaseConnectionDlg::ShowToolTips()
{
    return true;
}

/*!
 * Get bitmap resources
 */

wxBitmap DatabaseConnectionDlg::GetBitmapResource( const wxString& name )
{
    // Bitmap retrieval
////@begin DatabaseConnectionDlg bitmap retrieval
    wxUnusedVar(name);
    return wxNullBitmap;
////@end DatabaseConnectionDlg bitmap retrieval
}

/*!
 * Get icon resources
 */

wxIcon DatabaseConnectionDlg::GetIconResource( const wxString& name )
{
    // Icon retrieval
////@begin DatabaseConnectionDlg icon retrieval
    wxUnusedVar(name);
    return wxNullIcon;
////@end DatabaseConnectionDlg icon retrieval
}
