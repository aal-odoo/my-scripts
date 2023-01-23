#!/bin/bash


# $1 directory
# $2 model name
# file name 
filename=$(sed 's/\./_/g' <<< $2)
modelname=$(sed 's/\.//g' <<< $2)
cd $1

cd models
if [ ! -e "$filename.py" ]
then
    touch "$filename.py"


    if [ -e __init__.py ]
    then
        echo "from . import $filename" >> __init__.py
    else
        touch __init__.py
        echo "from . import $filename" > __init__.py
    fi


    echo "
from odoo import api, fields, models


class ${modelname^}(models.Model)
    _inherit = '$2'" >> "$filename.py"
fi

# create the basic views
view="${filename}_inherit"
viewname=$(sed 's/_/\./g' <<< $view)

cd ../views
if [ ! -e "$view.xml" ]
then
    echo "<odoo>
    <data>
        <record id=\"$view\" model=\"ir.ui.view\" >
            <field name=\"name\">$viewname</field>
            <field name=\"model\">$2</field>
            <field name=\"inherit_id\" ref= />
            <field name=\"arch\" type=\"xml\">
            </field>
        </record>
    </data>
</odoo>

    " >> "$view.xml"
fi

echo $1
