########################################################################
##
## Copyright (C) 2020 The Octave Project Developers
##
## See the file COPYRIGHT.md in the top-level directory of this
## distribution or <https://octave.org/copyright/>.
##
## This file is part of Octave.
##
## Octave is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <https://www.gnu.org/licenses/>.
##
########################################################################

## -*- texinfo -*-
## @deftypefn  {} {} __debug_octave__ ()
## @deftypefnx {} {} __debug_octave__ (@var{command_string})
## Try to open a terminal window with gdb connected to the current
## Octave process.
##
## If @var{command_string} is not supplied, it should have a single
## @qcode{%d} format option that will be replaced by the process ID
## for the current Octave process, as returned by @code{getpid}.  For
## example, on Windows systems the following two commands are
## equivalent:
##
## @example
## __debug_octave__ ()
## __debug_octave__ ("start gdb -p %d")
## @end example
## @end deftypefn

function __debug_octave__ (command_string)

  if (nargin > 1)
    print_usage ();
  endif

  if (nargin == 0)
    [status, ~] = system ("gdb --version");
    if (status != 0)
      error ("unable to execute gdb");
    endif
    if (isunix ())
      ## FIXME: is there a portable way to run a command in a new window?
      ## Obviously, gnome-terminal is not always available.
      command_string = "gnome-terminal -- gdb -p %d";
    elseif (ispc ())
      command_string = "start gdb -p %d";
    elseif (ismac ())
      command_string = "osascript -e 'tell application \"Terminal\" to do script \"lldb -p %d\"'";
    else
      error ("unknown system -- unable to determine how to start debugger");
    endif
  endif

  system (sprintf (command_string, getpid ()));

endfunction
