class artix_guiini (
    $gui_interface                       = "keyboard",
    $showCursor                          = false,
    $pricePrecisionToShow                = "2",
    $priceThousandSeparate               = false,
    $showBonusBalance                    = true,
    $showGroupInPositionInfo             = false,
    $changeBackgroudColorOnBack          = false,
    $notableAgeVerify                    = false,
    $marketingActionPixmap               = "/linuxcash/cash/ui/images/marketingAction.png",
    $ui_DocumentOpenForm_GoodsItems      = "posnum;№;50;true;132, code;Код;50;false;132, bcode;Штрих-код;180;false;132, name;Наименование;-1;true;129, dept;Отдел;50;false;132, bquant;;-2;true;129, unit;;-2;false;129, price;Цена;100;false;130, sumb;Сумма;-2;true;130, discount;;-2;true;132, tags;;-2;true;132",
    $ui_DocumentPaymentForm_GoodsItems   = "posnum;№;50;true;132, code;Код;50;false;132, bcode;Штрих-код;180;false;132, name;Наименование;-1;true;129, dept;Отдел;50;false;132, bquant;;-2;true;129, unit;;-2;false;129, price;Цена;100;false;130, sumb;Сумма;-2;true;130, discount;;-2;true;132, tags;;-2;true;132",
    $ui_DocumentCloseForm_GoodsItems     = "posnum;№;50;true;132, code;Код;50;false;132, bcode;Штрих-код;180;false;132, name;Наименование;-1;true;129, dept;Отдел;50;false;132, bquant;;-2;true;129, unit;;-2;false;129, price;Цена;100;false;130, sumb;Сумма;-2;true;130, discount;;-2;true;132, tags;;-2;true;132",
    $gui_pixmap                          = "/linuxcash/cash/ui/images/logo.png",
    $ui_AuthenticationForm_Users_visible = true
)
{
    File {
        owner => root,
        group => root,
        mode  => '0644',
    }
    file { 'gui.ini' :
        name    => '/linuxcash/cash/conf/ncash.ini.d/gui.ini',
        content => template('artix_guiini/gui.erb'),
    }
}
