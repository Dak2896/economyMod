-- library for window calculations
local ffi = require("ffi")

ffi.cdef [[
    typedef long LONG;
    typedef void* HANDLE;
    typedef HANDLE HWND;
      typedef struct RECT {
        LONG left;
        LONG top;
        LONG right;
        LONG bottom;
      } RECT;
      typedef int                 BOOL;
      typedef RECT *LPRECT;
       BOOL GetClientRect (HWND  hWnd,LPRECT lpRect);
           HWND GetActiveWindow(void);
    
       typedef const char* LPCSTR;
        typedef unsigned UINT;
       int MessageBoxA(HWND, LPCSTR, LPCSTR, UINT);
    ]]
