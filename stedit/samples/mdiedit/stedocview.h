///////////////////////////////////////////////////////////////////////////////
// Name:        stedocview.h
// Purpose:     MDI wxSTEditor app
// Author:      Troels K
// Modified by:
// Created:     2012-01-19
// Copyright:   (c) Troels K
// Licence:     wxWidgets licence
///////////////////////////////////////////////////////////////////////////////

#ifndef __STEDOCVIEW_H__
#define __STEDOCVIEW_H__

#ifdef _STEDIT_H_

// ----------------------------------------------------------------------------
// wxSTEditorDocBase: wxDocument and wxTextCtrl married
// ----------------------------------------------------------------------------

class wxSTEditorDocBase : public wxDocument
{
public:
    wxSTEditorDocBase() : wxDocument() { }

    virtual bool OnCreate(const wxString& path, long flags);

    virtual wxTextCtrl* GetTextCtrl() const = 0;

    virtual bool IsModified() const;
    virtual void Modify(bool mod);

protected:
    virtual bool DoSaveDocument(const wxString& filename);
    virtual bool DoOpenDocument(const wxString& filename);

    void OnTextChange(wxCommandEvent& event);

    DECLARE_CLASS(wxSTEditorDocBase)
};

// ----------------------------------------------------------------------------
// A very simple text document class
// ----------------------------------------------------------------------------

class wxSTEditorDoc : public wxSTEditorDocBase, public wxSTEditorRefData
{
public:
    wxSTEditorDoc() : wxSTEditorDocBase() { }
    virtual wxTextCtrl* GetTextCtrl() const;

    DECLARE_DYNAMIC_CLASS(wxSTEditorDoc)
};
#endif // _STEDIT_H_

// ----------------------------------------------------------------------------
// Text view classes
// ----------------------------------------------------------------------------

// The view using a standard wxTextCtrl to show its contents
class wxSTEditorView : public wxView
{
public:
    wxSTEditorView() : wxView(), m_text(NULL) {}

    virtual bool OnCreate(wxDocument*, long flags);
    virtual void OnDraw(wxDC*);
    virtual bool OnClose(bool deleteWindow = true);

    wxTextCtrl* GetText() const { return m_text; }

private:
    void OnCopy(wxCommandEvent& WXUNUSED(event)) { m_text->Copy(); }
    void OnPaste(wxCommandEvent& WXUNUSED(event)) { m_text->Paste(); }
    void OnSelectAll(wxCommandEvent& WXUNUSED(event)) { m_text->SelectAll(); }

    wxTextCtrl* m_text;

    DECLARE_EVENT_TABLE()
    DECLARE_DYNAMIC_CLASS(wxSTEditorView)
};

class wxSTEditorChildFrame : public wxDocMDIChildFrame
{
public:
    bool Create(wxView* view, wxMDIParentFrame*);

    DECLARE_DYNAMIC_CLASS(wxSTEditorChildFrame)
};

class wxSTEditorDocTemplate : public wxDocTemplate
{
    static wxDocTemplate* ms_instance;
protected:
    wxClassInfo* m_frameClassInfo;

    wxSTEditorDocTemplate(wxDocManager*, wxClassInfo* frameClassInfo);

    virtual wxFrame* CreateViewFrame(wxView*);
public:
    static wxDocTemplate* Create(wxDocManager*);
    static wxDocTemplate* GetInstance() { return ms_instance; }

    friend class wxSTEditorView;
};

#endif // __STEDOCVIEW_H__
