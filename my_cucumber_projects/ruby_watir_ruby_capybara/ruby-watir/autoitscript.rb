require 'win32ole' 
title = "Choose File to Upload"

      begin
         popupOccurred = false
         autoIt = WIN32OLE.new('AutoItX3.Control')
         timeout = 15
         autoIt.WinWait(title, '', timeout)
         autoIt.ControlClick(title, "", "&Open")
         sleep 1
         autoIt.WinWait(title, '', timeout)
         isClicked = autoIt.ControlClick(title, "", "OK")
         sleep 1
         autoIt.ControlClick(title, "", "Cancel") if (isClicked == 1)
         autoIt.ole_free
      rescue
        puts "Error closing popup, please close Manually"
      end