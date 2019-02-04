## Copyright (C) 2018 Pantxo Diribarne
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

## Load an Octave 4.0.3 figure file
%!test
%! hgload (fullfile ("figure_files", "ofig403.ofig"));

## Load an Octave 4.2.1 figure file
%!test
%! hgload (fullfile ("figure_files", "ofig421.ofig"));

## Load an Octave 5.1 figure file
%!test
%! hgload (fullfile ("figure_files", "ofig51.ofig"));