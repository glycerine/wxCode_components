/////////////////////////////////////////////////////////////////////////////
// Name:        linesp.h
// Purpose:     Lines private header file
// Author:      Julian Smart
// Modified by:
// Created:     12/07/98
// RCS-ID:      $Id: linesp.h,v 1.1 2007/03/28 15:15:47 frm Exp $
// Copyright:   (c) Julian Smart
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#ifndef _OGL_LINESP_H_
#define _OGL_LINESP_H_


class WXDLLIMPEXP_FWD_OGL wxLineShape;
class WXDLLIMPEXP_OGL wxLineControlPoint: public wxControlPoint
{
  DECLARE_DYNAMIC_CLASS(wxLineControlPoint)
  friend class wxLineShape;
 public:

  wxLineControlPoint(wxShapeCanvas *the_canvas = NULL, wxShape *object = NULL, double size = 0.0,
     double x = 0.0, double y = 0.0, int the_type = 0);
  virtual ~wxLineControlPoint();

  virtual void OnDraw(wxDC&);
  virtual void OnDragLeft(bool draw, double x, double y, int keys=0, int attachment = 0);
  virtual void OnBeginDragLeft(double x, double y, int keys=0, int attachment = 0);
  virtual void OnEndDragLeft(double x, double y, int keys=0, int attachment = 0);

  // Obsolete (left-dragging now moves attachment point to new relative position OR new
  // attachment id)
#if 0
  void OnDragRight(bool draw, double x, double y, int keys=0, int attachment = 0);
  void OnBeginDragRight(double x, double y, int keys=0, int attachment = 0);
  void OnEndDragRight(double x, double y, int keys=0, int attachment = 0);
#endif

public:

  int           m_type;
  wxRealPoint*  m_point;  // Line point
  wxRealPoint   m_originalPos;

};

/*
 * Temporary arc label object
 */

class WXDLLIMPEXP_OGL wxLabelShape: public wxRectangleShape
{
  DECLARE_DYNAMIC_CLASS(wxLabelShape)

 public:
  wxLabelShape(wxLineShape *parent = NULL, wxShapeRegion *region = NULL, double w = 0.0, double h = 0.0);
  virtual ~wxLabelShape();

  virtual void OnDraw(wxDC&);
  virtual void OnDrawContents(wxDC&);
  virtual void OnLeftClick(double x, double y, int keys = 0, int attachment = 0);
  virtual void OnRightClick(double x, double y, int keys = 0, int attachment = 0);
  virtual void OnDragLeft(bool draw, double x, double y, int keys=0, int attachment = 0);
  virtual void OnBeginDragLeft(double x, double y, int keys=0, int attachment = 0);
  virtual void OnEndDragLeft(double x, double y, int keys=0, int attachment = 0);
  virtual bool OnMovePre(wxDC&, double x, double y, double old_x, double old_y, bool display = true);

public:
  wxLineShape*      m_lineShape;
  wxShapeRegion*    m_shapeRegion;

};

/*
 * Get the point on the given line (x1, y1) (x2, y2)
 * distance 'length' along from the end,
 * returned values in x and y
 */

void GetPointOnLine(double x1, double y1, double x2, double y2,
                    double length, double *x, double *y);

#endif
    // _OGL_LINESP_H_

