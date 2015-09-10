# Copyright 2012 Structure Computation  www.structure-computation.com
# Copyright 2014 jeremie Bellec
#
# This file is part of Soda.
#
# Soda is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Soda is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with Soda. If not, see <http://www.gnu.org/licenses/>.



#
class HelloWorldView extends View
    constructor: ( @el, @model ) ->
        super @model
        
        @txt = new_dom_element
            parentNode : @el
            nodeName  : "div"
            txt       : @model.txt.get()
            style      :
                textAlign  : "center"
                width : "200px"
                  
    onchange: ->
        if @model.has_been_modified
            @txt.innerHTML = @model.txt.get()
        
              
        
        
        

                
    
    
    