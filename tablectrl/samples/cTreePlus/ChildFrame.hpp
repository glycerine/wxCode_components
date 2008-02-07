////////////////////////////////////////////////////////////////////////////////
// Soli Deo Gloria!                                                           //
//                                                                            //
// Name:        ChildFrame.hpp                                                //
// Purpose:                                                                   //
// Author:      Jan Knepper                                                   //
// Created:     2007                                                          //
// Copyright:   (c) 2007 Jan Knepper                                          //
// Licence:     wxWidgets licence                                             //
////////////////////////////////////////////////////////////////////////////////



#ifndef CHILDFRAME_HPP
#define CHILDFRAME_HPP



#include <wx/TableCtrl.h>

#include <ctdbsdk.hpp>                    // cTreePlus DB SDK.

#include "cTreeTable.h"
#include "MainFrame.h"
#include "ChildFrame.h"



class  ChildFrame : public  wxMDIChildFrame
{
   private   :
      typedef wxMDIChildFrame
                           super;
      
   public    :
      static const long    DEFAULTSTYLE;
                           
   private   :
      DECLARE_EVENT_TABLE  ()
      
   private   :
      CTSession *          session;
      CTTable *            table;
      CTRecord *           record;
      
      cTreeTable *         t;
      
      wxSizer *            sizer;
      
      wxTableCtrl *        tc;
      
   private   :
      void                 OnMenu   ( wxCommandEvent & );
      
   public    :
      ChildFrame  ( MainFrame *, wxWindowID = wxID_ANY, const wxString & = wxEmptyString, const wxPoint & = wxDefaultPosition, const wxSize & = wxDefaultSize, long = DEFAULTSTYLE );
      ~ChildFrame ();
      
      bool                 Open     ( CTSession *, const wxString & );
};



#endif
