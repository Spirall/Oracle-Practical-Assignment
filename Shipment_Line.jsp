<%@ taglib uri="/WEB-INF/lib/reports_tld.jar" prefix="rw" %>
<%@ page language="java" import="java.io.*" errorPage="/rwerror.jsp" session="false" %>
<!--
<rw:report id="report">
<rw:objects id="objects">
<?xml version="1.0" encoding="WINDOWS-1252" ?>
<report name="Shipment_Line" DTDVersion="9.0.2.0.10">
  <xmlSettings xmlTag="SHIPMENT_LINE" xmlPrologType="text">
  <![CDATA[<?xml version="1.0" encoding="&Encoding"?>]]>
  </xmlSettings>
  <reportHtmlEscapes>
    <beforeReportHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
</head>
<body bgcolor="#ffffff">

]]>
    </beforeReportHtmlEscape>
    <afterPageHtmlEscape>
    <![CDATA[<hr size=5 noshade>
]]>
    </afterPageHtmlEscape>
    <beforeFormHtmlEscape>
    <![CDATA[<html dir=&Direction>
<body bgcolor="#ffffff">
<form method=post action="_action_">
<input name="hidden_run_parameters" type=hidden value="_hidden_">
<font color=red><!--error--></font>
<center>
<p><table border=0 cellspacing=0 cellpadding=0>
<tr>
<td><input type=submit></td>
<td width=15>
<td><input type=reset></td>
</tr>
</table>
<p><hr><p>
]]>
    </beforeFormHtmlEscape>
    <pageNavigationHtmlEscape>
    <![CDATA[<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir=&Direction>
<head>
<meta http-equiv="Content-Type"  content="text/html; charset=&Encoding">
<TITLE>Oracle HTML Navigator</TITLE>
<SCRIPT type="text/javascript" LANGUAGE = "JavaScript">

var jump_index = 1			// Jump to this page
var num_pages = &TotalPages			// Total number of pages
var basefilename = "&file_name"		// Base file name
var fileext = "&file_ext"		//File extension

/* jumps to "new_page" */
function new_page(form, new_page)
{
	form.reqpage.value = new_page;
	parent.frames[0].location = basefilename + "_" + new_page + "."+fileext;
}

/* go back one page */
function back(form)
{
	/* if we are not in first page */
	if (jump_index > 1)
	{
		jump_index--;
		new_page(form, jump_index);
	}
}

/* go forward one page */
function forward(form)
{
	/* if we are not in last page */
	if (jump_index < num_pages)
	{
		jump_index++;
		new_page(form, jump_index);
	}
}

/* go to first page */
function first(form)
{
	if(jump_index != 1)
	{
		jump_index = 1;
		new_page(form, jump_index);
	}
}

/* go to last page */
function last(form)
{
	if(jump_index != num_pages)
	{
		jump_index = num_pages;
		new_page(form, jump_index);
	}
}

/* go to the user specified page number */
function pagenum(form)
{
	/* sanity check */
	if (form.reqpage.value < 1)
	{
		form.reqpage.value = 1;
	}
	if (form.reqpage.value > num_pages)
	{
		form.reqpage.value = num_pages;
	}
	jump_index = form.reqpage.value;
	new_page(form, jump_index);
}
</SCRIPT>
</HEAD>

<BODY>
<FORM NAME="ThisForm" action="" onSubmit="pagenum(this); return false;">
<center><table><tr>
<td> <INPUT TYPE="button"  VALUE="<< " onClick="first(this.form)">
<td> <INPUT TYPE="button"  VALUE=" < " onClick="back(this.form)">
<td> <INPUT TYPE="button"  VALUE="Page:" onClick="pagenum(this.form)">
<td> <INPUT NAME="reqpage" VALUE="1" SIZE=2>
<td> <INPUT TYPE="button"  VALUE=" > " onClick="forward(this.form)">
<td> <INPUT TYPE="button"  VALUE=" >>" onClick="last(this.form)">
</table></center>
</FORM>
</body></html>]]>
    </pageNavigationHtmlEscape>
  </reportHtmlEscapes>
  <data>
    <dataSource name="Q_1">
      <select>
      <![CDATA[SELECT ALL ORDERS.O_ID, ORDERS.O_DATE, ORDER_LINE.OL_QUANTITY, CUSTOMER.C_ID, 
CUSTOMER.C_LAST, CUSTOMER.C_FIRST, CUSTOMER.C_MI, CUSTOMER.C_BIRTHDATE, 
CUSTOMER.C_ADDRESS, ITEM.ITEM_DESC, INVENTORY.INV_PRICE
FROM CUSTOMER, ORDERS, ORDER_LINE, ITEM, INVENTORY
WHERE ((ORDERS.C_ID = CUSTOMER.C_ID)
 AND (ORDER_LINE.O_ID = ORDERS.O_ID)
 AND (ORDER_LINE.INV_ID = INVENTORY.INV_ID)
 AND (INVENTORY.ITEM_ID = ITEM.ITEM_ID)) ]]>
      </select>
      <displayInfo x="1.84790" y="1.19800" width="0.69995" height="0.19995"/>
      <group name="G_C_ID">
        <displayInfo x="1.77844" y="2.06458" width="1.17224" height="1.28516"
        />
        <dataItem name="C_ID" oracleDatatype="number" columnOrder="14"
         width="22" defaultWidth="70000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Customer ID:">
          <dataDescriptor expression="CUSTOMER.C_ID"
           descriptiveExpression="C_ID" order="4" oracleDatatype="number"
           width="22" precision="5"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="C_FIRST" datatype="vchar2" columnOrder="16" width="30"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="C First">
          <dataDescriptor expression="CUSTOMER.C_FIRST"
           descriptiveExpression="C_FIRST" order="6" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="C_LAST" datatype="vchar2" columnOrder="15" width="30"
         defaultWidth="100000" defaultHeight="10000" columnFlags="33"
         defaultLabel="C Last">
          <dataDescriptor expression="CUSTOMER.C_LAST"
           descriptiveExpression="C_LAST" order="5" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="C_MI" datatype="character" oracleDatatype="aFixedChar"
         columnOrder="17" width="1" defaultWidth="10000" defaultHeight="10000"
         columnFlags="33" defaultLabel="C Mi">
          <dataDescriptor expression="CUSTOMER.C_MI"
           descriptiveExpression="C_MI" order="7" oracleDatatype="aFixedChar"
           width="1"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="O_ID" oracleDatatype="number" columnOrder="11"
         width="22" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Order ID:">
          <dataDescriptor expression="ORDERS.O_ID"
           descriptiveExpression="O_ID" order="1" oracleDatatype="number"
           width="22" precision="8"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="O_DATE" datatype="date" oracleDatatype="date"
         columnOrder="12" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Order Date:">
          <dataDescriptor expression="ORDERS.O_DATE"
           descriptiveExpression="O_DATE" order="2" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
      <group name="G_ITEM_DESC">
        <displayInfo x="1.74670" y="3.88306" width="1.46521" height="1.11426"
        />
        <dataItem name="ITEM_DESC" datatype="vchar2" columnOrder="20"
         width="30" defaultWidth="100000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Item Description">
          <dataDescriptor expression="ITEM.ITEM_DESC"
           descriptiveExpression="ITEM_DESC" order="10" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="OL_QUANTITY" oracleDatatype="number" columnOrder="13"
         width="22" defaultWidth="60000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Quantity Ordered">
          <dataDescriptor expression="ORDER_LINE.OL_QUANTITY"
           descriptiveExpression="OL_QUANTITY" order="3"
           oracleDatatype="number" width="22" precision="4"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="INV_PRICE" oracleDatatype="number" columnOrder="21"
         width="22" defaultWidth="80000" defaultHeight="10000"
         columnFlags="33" defaultLabel="Price">
          <dataDescriptor expression="INVENTORY.INV_PRICE"
           descriptiveExpression="INV_PRICE" order="11" width="22" scale="2"
           precision="6"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="C_BIRTHDATE" datatype="date" oracleDatatype="date"
         columnOrder="18" width="9" defaultWidth="90000" defaultHeight="10000"
         columnFlags="1" defaultLabel="C Birthdate">
          <dataDescriptor expression="CUSTOMER.C_BIRTHDATE"
           descriptiveExpression="C_BIRTHDATE" order="8" oracleDatatype="date"
           width="9"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
        <dataItem name="C_ADDRESS" datatype="vchar2" columnOrder="19"
         width="30" defaultWidth="100000" defaultHeight="10000"
         columnFlags="1" defaultLabel="C Address">
          <dataDescriptor expression="CUSTOMER.C_ADDRESS"
           descriptiveExpression="C_ADDRESS" order="9" width="30"/>
          <dataItemPrivate adtName="" schemaName=""/>
        </dataItem>
      </group>
    </dataSource>
  </data>
  <layout>
  <section name="main">
    <body>
      <frame name="M_G_C_ID_GRPFR">
        <geometryInfo x="0.00000" y="0.00000" width="6.31250" height="0.75000"
        />
        <generalLayout verticalElasticity="variable"/>
        <visualSettings fillPattern="transparent"
         fillBackgroundColor="r100g100b100"/>
        <repeatingFrame name="R_G_C_ID" source="G_C_ID" printDirection="down"
         minWidowRecords="1" columnMode="no">
          <geometryInfo x="0.00000" y="0.00000" width="6.31250"
           height="0.75000"/>
          <generalLayout verticalElasticity="variable"/>
          <visualSettings fillPattern="transparent"
           fillBackgroundColor="TableCell"/>
          <field name="F_C_ID" source="C_ID" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="0.87500" y="0.00000" width="1.06250"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <field name="F_O_ID" source="O_ID" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="0.62500" y="0.18750" width="1.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <frame name="M_G_ITEM_DESC_GRPFR">
            <geometryInfo x="0.00000" y="0.37500" width="3.93750"
             height="0.37500"/>
            <generalLayout verticalElasticity="variable"/>
            <visualSettings fillPattern="transparent"
             fillBackgroundColor="r100g100b100"/>
            <repeatingFrame name="R_G_ITEM_DESC" source="G_ITEM_DESC"
             printDirection="down" minWidowRecords="1" columnMode="no">
              <geometryInfo x="0.00000" y="0.56250" width="3.93750"
               height="0.18750"/>
              <generalLayout verticalElasticity="expand"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="TableCell"/>
              <field name="F_ITEM_DESC" source="ITEM_DESC" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="helvetica" size="10"/>
                <geometryInfo x="0.00000" y="0.56250" width="1.50000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_OL_QUANTITY" source="OL_QUANTITY"
               minWidowLines="1" spacing="0" alignment="start">
                <font face="helvetica" size="10"/>
                <geometryInfo x="1.50000" y="0.56250" width="1.25000"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
              <field name="F_INV_PRICE" source="INV_PRICE" minWidowLines="1"
               spacing="0" alignment="start">
                <font face="helvetica" size="10"/>
                <geometryInfo x="2.75000" y="0.56250" width="1.18750"
                 height="0.18750"/>
                <generalLayout verticalElasticity="expand"/>
              </field>
            </repeatingFrame>
            <frame name="M_G_ITEM_DESC_HDR">
              <geometryInfo x="0.00000" y="0.37500" width="3.93750"
               height="0.18750"/>
              <advancedLayout printObjectOnPage="allPage"
               basePrintingOn="enclosingObject"/>
              <visualSettings fillPattern="transparent"
               fillBackgroundColor="TableHeading"/>
              <text name="B_ITEM_DESC" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="0.00000" y="0.37500" width="1.50000"
                 height="0.18750"/>
                <visualSettings fillBackgroundColor="r25g50b75"/>
                <textSegment>
                  <font face="helvetica" size="10" bold="yes"
                   textColor="TextColor"/>
                  <string>
                  <![CDATA[Item Description]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_OL_QUANTITY" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="1.50000" y="0.37500" width="1.25000"
                 height="0.18750"/>
                <visualSettings fillBackgroundColor="TableHeading"/>
                <textSegment>
                  <font face="helvetica" size="10" bold="yes"
                   textColor="TextColor"/>
                  <string>
                  <![CDATA[Quantity Ordered]]>
                  </string>
                </textSegment>
              </text>
              <text name="B_INV_PRICE" minWidowLines="1">
                <textSettings spacing="0"/>
                <geometryInfo x="2.75000" y="0.37500" width="1.18750"
                 height="0.18750"/>
                <visualSettings fillBackgroundColor="TableHeading"/>
                <textSegment>
                  <font face="helvetica" size="10" bold="yes"
                   textColor="TextColor"/>
                  <string>
                  <![CDATA[Price]]>
                  </string>
                </textSegment>
              </text>
            </frame>
          </frame>
          <text name="B_C_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.00000" width="0.87500"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[Customer ID:]]>
              </string>
            </textSegment>
          </text>
          <field name="F_C_FIRST" source="C_FIRST" minWidowLines="1"
           spacing="0" alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="2.37500" y="0.00000" width="1.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <field name="F_O_DATE" source="O_DATE" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="2.93750" y="0.18750" width="1.37500"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_O_DATE" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="2.12500" y="0.18750" width="0.81250"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[Order Date:]]>
              </string>
            </textSegment>
          </text>
          <text name="B_C_FIRST" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="1.93750" y="0.00000" width="0.43750"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[C First]]>
              </string>
            </textSegment>
          </text>
          <field name="F_C_LAST" source="C_LAST" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="4.31250" y="0.00000" width="1.50000"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_C_LAST" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="3.87500" y="0.00000" width="0.43750"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[C Last]]>
              </string>
            </textSegment>
          </text>
          <field name="F_C_MI" source="C_MI" minWidowLines="1" spacing="0"
           alignment="start">
            <font face="helvetica" size="10" bold="yes" textColor="TextColor"
            />
            <geometryInfo x="6.12500" y="0.00000" width="0.18750"
             height="0.18750"/>
            <generalLayout verticalElasticity="expand"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
          </field>
          <text name="B_C_MI" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="5.81250" y="0.00000" width="0.31250"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="r25g50b75"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[C Mi]]>
              </string>
            </textSegment>
          </text>
          <text name="B_O_ID" minWidowLines="1">
            <textSettings spacing="0"/>
            <geometryInfo x="0.00000" y="0.18750" width="0.62500"
             height="0.18750"/>
            <advancedLayout printObjectOnPage="allPage"
             basePrintingOn="enclosingObject"/>
            <visualSettings fillBackgroundColor="TableHeading"/>
            <textSegment>
              <font face="helvetica" size="10" bold="yes"
               textColor="TextColor"/>
              <string>
              <![CDATA[Order ID:]]>
              </string>
            </textSegment>
          </text>
        </repeatingFrame>
      </frame>
    </body>
    <margin>
      <image name="B_1">
        <geometryInfo x="0.56250" y="0.00000" width="1.62500" height="0.93750"
        />
        <advancedLayout printObjectOnPage="allPage"
         basePrintingOn="anchoringObject"/>
        <visualSettings fillPattern="transparent" fillBackgroundColor="black"
         linePattern="transparent" lineBackgroundColor="black"/>
        <points>
          <point x="0.00000" y="0.00000"/>
          <point x="1.62500" y="0.93750"/>
          <point x="0.56250" y="0.00000"/>
          <point x="1.62500" y="0.93750"/>
        </points>
        <binaryData encoding="hexidecimal" dataId="image.B_1">
          
FF8DFF0E 0001A464 94640010 101010C2 10C20000 FFBD0048 0001B0C0 E0C0A001
E0D0E021 11013181 82A18161 61811332 52D182A3 33D3C393 33837304 84C5E404
44755473 8305D615 75F52676 8676E3D4 17970746 87C55676 36101121 21815181
F2A1A1F2 36248324 36363636 36363636 36363636 36363636 36363636 36363636
36363636 36363636 36363636 36363636 36363636 36363636 3636FF4C 102A0000
10501010 10101010 00000000 00000000 10203040 50607080 90A0B001 00201030
30204030 50504040 000010D7 10203000 40115021 12131460 31151670 22174123
18191A80 32241B1C 51251D0F 42332627 2890A061 718191A1 52627282 92A24353
63738393 A3344454 64748494 A4354555 65758595 A5364656 66768696 A6374757
67778797 A7384858 68788898 A8293949 59697989 99A92A3A 4A5A6A7A 8A9AAA2B
3B4B5B6B 7B8B9BAB 2C3C4C5C 6C7C8C9C AC2D3D4D 5D6D7D8D 9DAD1E2E 3E4E5E6E
7E8E9EAE 1F2F3F4F 5F6F7F8F 9FAF1000 30101010 10101010 10100000 00000000
10203040 50607080 90A0B011 00201020 40403040 70504040 00102077 00102030
11405012 13602114 15701617 31222318 80412419 1A1B1C90 3233250F 5126271D
A0614243 1E521F71 8191A162 728292A2 53637383 93A33444 54647484 94A43545
55657585 95A53646 56667686 96A63747 57677787 97A72838 48586878 8898A829
39495969 798999A9 2A3A4A5A 6A7A8A9A AA2B3B4B 5B6B7B8B 9BAB2C3C 4C5C6C7C
8C9CAC2D 3D4D5D6D 7D8D9DAD 2E3E4E5E 6E7E8E9E AE2F3F4F 5F6F7F8F 9FAFFF0C
00118010 F010FC30 00110010 11102011 10FFAD00 C0300000 10112011 00F300AD
3DF27515 4B2162FD 47F11C64 0CB5FCC6 0D8592F3 3504C523 17EF41C5 401A3106
EF47C057 02847345 A2563F85 10DCE305 243E3251 A2D52C3C 6735C607 0D63A070
CC74F8A7 0D417CF2 00250B37 C5D77621 A790A84B 9C6B28A8 75A10DF6 DDE6A22E
4B12E87F 6F8A4D4D F45E6556 164527D3 92375916 FDE2DC89 817CA4B8 69921231
F13C04CA 73D8FB58 B25906DF 82512809 4C60E93C D04BC509 CDD3970A 67C01D16
68968506 F0DA20E0 920AB1BB 411C2262 39F10CA6 2EF266D3 5225E30F 9A0BDA26
E4D0B241 63DA1116 5D89CEC1 354DC263 4B4F2324 0DA801E2 866E1B61 71815ACC
55787D93 8AAD6D42 80A26B72 17179E35 27CA7351 1719C32A E849D0E0 CACA8549
0D48BDF9 A75A1227 0881AF5D 37904477 511926FF 00A48614 AD096CC6 D5B9177C
A5D74427 A151AD96 77A629E6 35274E94 9B673ED1 F3FCE1DF 1BBAD8CC 2E57B92B
F977C6B9 41192559 D8368A3A C8667903 27E0DC12 8DD686C8 74103547 5548F679
9E4405A0 3AA8D68D 1524E883 CA7FD2B2 E09AC2F8 E3592BE8 68C32C37 FD5A2309
405A2748 C1351212 BD78A4EC 7D436B38 7BE0C925 5E720A50 AA8BCA72 41EA7582
36519458 58DE158A 90A9BBB0 0A5B0253 07835C96 AC24F195 A911FEF5 DAB261E2
3745B2D0 AF5541C3 760F8A01 B9F3DB84 26580C4E 3D8B484A 13DD8601 4508BB37
04D02F7C 7AA436D0 49EEB268 CD556220 18A40E81 9A6E1063 A0771020 A73DFB06
F1A8C54C 85B31507 31E94BBC A02944BA 9863004B 9F38692C 4DC8074E 45000676
2D4B4213 95495230 F05A1390 65D42C4A 168F1D06 A04A84D9 9A5F51CC 9F43BE35
48BF4264 33BD86B1 83BFFDAC 4B42FBC0 389C8DDE F19C2FCF 3A00B736 2FCA9D4A
547FDEB4 4977616A DCF08933 748248AE A23E1160 92C5670B 0D4D27A9 B2E0F167
09487E5A A5D8C8E6 B06D9932 0C3EA8EC 6D4D1D60 921278E4 961A59F6 EA321B4B
296EF78B EB9D430D EA376B7D E9226D78 99764EAD 149D8CBE 753723F4 6B877884
BCDD4277 6DAEE3D6 8B9A437F D8B2DC27 B2B081EA E2D6E641 947CDDC1 05781BE7
AC55AB4B A80E9215 224E60BE A819CDBA BAA60D9E 01BADCC1 C8DA7C8C 704102DB
C8F98FD4 47FC9F5E 57FF00C7 F81FBA72 D9A1AB64 7AE1DAE6 3F445851 F506DD4F
417821EB 1AFABD9E 7B2A6D87 66CD0714 81BDC475 1BEA7451 523AE9F7 8185B5B3
3452DB0D 463EEEF8 1F3A49E8 16261FE9 99320844 1DF825FB 0E865E21 19A67FF5
6B1B9932 29919D56 5E42D5BB B51FDCB3 F0891BBA B6039690 91D946D6 DF63263B
A45E7316 FBBD67FD 8DFBADBB 422FF7C0 DFDE4B9F 50D7E294 5AAEB89A 0C56A890
3AF80A23 10DCC13A E85AD534 4C63ADD7 8E5BA991 7BC10164 635D85C5 6D43EA7A
616D25FC 7BE345B7 6BAF2E4A 3A30EF31 D6B3EF87 CDFF00FD B2EF53A6 42376943
FC013C8A CD43650F AC8512F7 B9E13A18 A45C37CD FAFF0090 6CB9ADB0 F9BF5EA6
D799C35E B8F251A5 F5ED3CB6 C023289D 5E1B5CB3 859619D4 3EB28246 874E7BAB
CD4AC816 F76CE814 3702B86C A7B68B40 C4384DF8 0F3A49A6 84EDE8D4 8EA00974
26A3A138 140EAF45 5858DE65 3073350D 67E1DBA2 84614A60 617C30A9 0D96E051
00E25412 C6621EA5 2F8DB8E8 D1A20482 8160BDBD F3D84547 10A681D2 40CF9E08
4900D974 6D9A97B8 25F3BB9E A58019B6 E3255845 5287514A C4E8353C AFB8906D
DCF990EF 7D4FBA11 3D2CBD09 E113BDF6 5A3642C5 64DF4AE6 472F4EB3 839F0777
C1760FCF 17945449 11943163 5D564267 AAA72046 5D898CEF 6FB24584 2699A3E8
AD009A81 28E8056E D10D45CD 5A11CB35 2FA19802 C73657A4 B2494958 2ECA8C08
1E545636 44E8B66C 1C4A1DEB F5BBC108 FF0013DF B685485D 193A1E98 3679045B
2FF75867 11FE1512 741EE2C5 4B01AD9C 526CFD32 F1734161 068FDD18 1D128275
169917E8 FF00D2A5 2264ECF8 FF0002B4 F1AF0EF9 8C653698 D83EF99F 303CBBEF
A7F84EB6 84A854B6 B6FD2174 5A4C121B 389C2F64 7DD117BE 7FFB5A61 52C59EB8
3420B433 00AAE397 834FFF00 5F254DBD 36FCE2EE 024D32DB CBE9D579 F402137C
387FF7EC F3A23B89 CEC313AA D874D4E1 66C40DF0 F9FD0D4D 3386C637 6B27F554
2ED7049E 1B74C2BD FD684FDD 45767D24 B4BAD875 D59BD522 87DEDE4E 34FBF969
08CD4D1F 6459FF00 415EFB59 BF6C2B05 73F73BFD AF455CD8 DAC04CFF 00A83A75
7BE894F0 79D08AED D7BF3E1F 7A0BEB22 98AB69D2 22D631FE B46FD9CB 37198EF3
1145F232 6B0B68D3 B274E873 2CCA11E7 3FF1B9F7 A53957EE 3A38AB8B 68DFF2F2
7279D63D 8B136AB3 F7C9E755 74936D8F 3715D5F4 B42F5A9F 4EC8D639 F34CB292
86F6D0C4 FCE1F7BC F8CFB0FF 00567AC4 A97AB55B 27B1868C 3E53D94F 5383F1C0
BCAA346F F8CEBB86 6EBFBB7F 6F4FFEB5 C91FA3DD 82EDF4B1 D9E4013B 42FB027C
0BCA4AD6 31794BB7 8ECBB48A F776242B BC9B6CB1 3D578636 8EE36ED7 F4D59BA1
441FB51C A2C93F2F 0D597877 321B4B7B BFD34A63 9FDD5E64 312FCA77 734459E9
5CE0D1B2 14D0CACA 130C6D28 315373D1 489A10B7 5580B335 148B499F 7CAC93F5
4131ACF2 9925B3A0 E1DA3116 BF69B850 48CDA29B 04775B04 28D96812 7CA71762
3CA27816 77D69ED4 5136EC51 CF9B8DE8 7C2DABE0 34F5E46D 4A286048 29FB72AC
7CC9E1FD 14A42CE2 B58F28ED 22EF665F 14AC58C1 070A06F0 CC1D0652 4B6DD2CF
89AC5AFB F377EF95 A207837E 0DF75F8A 9106BEE1 C4239F1F F68D0763 17BBD167
3F5F9A0B D569DEF2 DAFE814A 23E25FDE 8B767B7A 6D891DC6 039A534E 36BB2584
B8D8A5C6 84179EA8 AC62B980 0106365B 13CD6693 DAC25223 469F7551 09904DD6
DE45A891 4E6CBC5B 0CA2642D 804A15FC 73483668 F473E4FB E9CCC97E CF1F7493
7902BA1E F803EE4D FE7ADBBD 1DB583F1 DA859FB3 6957D5B0 BF24ECB2 865E0122
C14FFC5F 0A9AB7BD 417D3CA1 A8624D7D EE41F01E 00C8F73E 5D73335E 90C333C3
6FD0B6E3 3AF9FD9F EB16D54C CF8B5F3A 89C708EB 71DB540C 7DEA00D1 28E9F97F
5DC10C2A 7CD8201E 4F9DC66A 4D8B29D5 5ECFDB5C 6860B3BF 15172F2B 5FEBD856
D04B179C D6D63358 6EF432FE 453FD004 FC0B0F4F 69A379BD 32ABF86E EC051418
F8ECE807 051B63B9 1A94569A 9CD76F59 39ECDD9B C7CA574F 6ED9EE53 B121AEAB
134D726B E991CB98 06EFD299 AF25E43C 49B4FEB0 D4260DC4 1D6956AD 8425712F
DC05ACA1 E0B8DFC8 29EFBFDC F2F81E7C 5F6AC422 A83F8EE1 67CB53F2 C3D70EED
E5FDF6DA B2F839B5 695FB790 53B2F53B DA7C29F9 5C2F663B E43C5B4F B0D5E1EC
B245E8B5 B696D574 2397F3A7 F9838241 47DF20B4 D0B4DE96 47F97345 0117F8E4
CB15ECA4 589857DC 71BF162A FF008411 C2F74FFC FF00FAA4 230BCD93 D8F6ED97
F397C7DD FBDD3EF3 A4D8D8A7 C1DDFB58 725BFC19 BACBE7BB 31F1BF53 A6AA6206
9A61CE4F B7BBB78E 623945B7 5AF893E8 C4AFD7A6 4FA2438D AB66C86D A94A7BFD
B6753F77 E6F5B2D1 D7938AAB 86E7FC59 39A6AF74 6F486F3F 5C837B69 F02E9DC9
AF05DB4D E0C16CC9 B55D7089 ACDCAEBA 1835B751 165FC10C 91BA8E20 666A5EB2
9065A150 C108F2A6 41011250 5508C54D 27880533 7482600C A3558D75 9128A2C6
055B0970 A6065175 0693E4AD DB940B6F E7831A12 85073051 228BD68C D18A2411
6DAA3274 99FB217B 6DABE025 C5C73AD1 AE4864BE 9D741EC4 44810A16 8490168B
696064A8 D4BBE3FE 5B61A163 DECF142B 53F6D2F7 57180BF7 BC147BF1 0FE159C1
6AA866AE AE0B8850 7CB92F3B 0621FBF2 F50FF31A 9A437FB4 602F83DA A53E291B
5F7C7B41 50CA3462 DB169055 237EDD13 C8051999 F0CF426B F3C60144 7CB6176E
E961F866 54DCB0B5 8BE21AA8 B467EC5F 8C347F1B 3D5A1021 0ECA95AA A59019D4
A6D140D1 837A0A44 E6CCAF4D 32054F7C 7A518400 F35E049B C6B3776A A2C66181
97AA8D86 D6460559 C53AC1A2 3A11C641 8023920A B1A92A38 57B33936 3365F935
E8856099 017902FE DD8F05C4 EAC8975F DD27EDAE B396DAD2 6596E3AE AFEF4B85
FCD979D2 FE53FD5B 546FBD54 E8F02E2F 68F778AE A697D471 F325F58F 9443F79F
AFFF008C D6EF4127 51DE2698 DA5BDCA3 9ECF8AEE 75F7C628 F3D9568C 5CDE2286
C974E1F7 ABB3A015 5449CE5F B4B32F54 BA9963F8 EE53C169 62336E52 CB9B282D
FDDC8BD6 1BE88391 EF452723 9B9BC41E 2ED332EF E7FB2FB1 F758B641 0DDBAAF2
95D5BDED 9AB79534 3EFADA16 8251CCCA 65E3222D 36B3E17E 96D1CB6A FF00A05D
14993712 361FE189 2F6419E4 95C94800 12AAA886 932A7CFC 2ED023AD 35403D41
470EF8D2 FB2CCAC5 1D98A187 F8942741 D5F8F48B 54769C46 F386D831 C29470C9
461571D5 BFEBF5EC 0A3D2448 E3122D6A 07B8670A BFEA5075 32B511DE 116A5A95
301A40E1 48778A4D 0B1A0036 0FDA4072 69A23E22 9B78E0B3 4D6B84D9 7C5A2504
F34308F0 A4089105 13A75580 A24B1064 70FF00AA 881B2170 307DBEE4 4C8DE7E3
EB4998A2 AE33D729 533F7203 38CFB6FF 007DDA41 94C3BDEF B58CA2CC 74B2DEB1
B75518F3 F112D1D3 9688C61B 46179EC4 54A66051 04D28498 36E9853D 269458EF
FEE6890A 8687ABB9 66FD6F63 179EDFF7 A1C27132 673FD1B9 86F5563E 5124B1AD
0961D2E6 6A4BD71D F3F4BCD3 9A180D9E EF52D831 46EF3661 39DF66A3 72EAB2E1
3485CCED 7831D01D 2644F14C DBF03E35 36E7B739 B2115CD4 282CE6DD BE250AB3
F0B4F6CD 466B7EE3 5D66C7AD 19F2DD9E 25DC54FF 00C36571 10A2E613 9D9F177C
51464AC1 36511536 21B90652 4613921A 78A48620 09509601 93D4F7EF 64DF33EF
9DF78E57 2A935E1F D1F5E659 B973C37F 1479AC31 F74C7ABF 747A0F7E 768EB635
69A33183 E3025931 E43D366B 2FEF9FE5 49F02EA3 F621A6F3 9DAF15AD F7D772AC
F94D6D96 B1F43489 1B9947D3 26DD4C9C 42F6A19F 8BD6BDD7 B6B4C57E E4BDD173
986FF9C0 EC8CE735 3B707D6E 51116369 4CE1A10B 4BB9147B 69B685D5 9F9F9923
A71D6282 32B3E408 96EF73BF D2FA11E9 13DE3B57 B14C594A A815B45E 87E8CFFF
0076F786 C7EEC3CB B75FBA32 36B78401 FDD472B9 3A7C260D CE569F03 F77A5A56
D2D00A36 AED43B6C 25F92BDF FA7AEEFB DB2F65B8 36723A21 2FDEF237 7A3C0A5A
DB3DAFE0 749E04D5 A55CD9B4 74FBF4F0 854C9ABB AC72CCD8 E7CB456C 75F2592F
11EB1A51 5B8AB5FB C050C5D6 EDFDF2BE 7B43B5CC B99FD170 78D849A9 77CFB459
69027CFE D7AE69D6 B0854DB0 A9DC5107 5A7D05A0 00A4A0A0 BA889262 3018DA05
487C0A6A 43632B5E 812DBE81 9CEF118D 7651CA15 C2FCD6B7 D494C0E7 F7E41EE0
D0F26674 A31357D3 D7CB8DEF 7C62D1E3 7FC1763F 225B48C4 C9A80DB6 AFC815F8
4F68B3B7 F9B9F3D9 7592A9B1 D7DAEDF5 F7DA39A6 E11A83FC 9F3E2F6A 5948468C
17B33E6D 0A2A87C7 7B20C316 FC34C4A6 3C175E7B 69DFBA44 1403B392 88181BE9
821049C0 A5405104 D200D220 D10B4F7C 41C06317 4F0A70C6 3E5B05B8 65713B96
7FE14683 FC7AFA5E AD2A5CA1 6FEB82F9 FCF18605 36EE1B17 F8EFFBA4 E8149A61
161FD17B 9D108396 FF009B2D 3A9DB9B7 146FEF72 9DB04E03 2FFF005D E8E0FF00
14DEF49D 3BE24696 FF00969E FAE36157 F2BB81A5 B827A92C D5B0D11F F9A6FC49
6D3E976F 5C76BC26 286A3C61 A99812AD 8A70500E 55217241 6C6213E4 6F8189CA
E6139610 18AA867D 7BA5CC71 1D97B102 BD08EC27 178F651D 1D91F388 DD02DE9F
04DDE810 2E59EE86 CCF4C08E 77A3B4C4 E2C0C429 364936BD 0F7FDAB1 13582EE3
3E649BB8 D5B4DFB3 9C15F8ED 602673AF 4D3FE04C 77A9526F 7AAA5C53 2EBDDF59
872F447A CFF3ECA2 D72A245B 7FB18A8F 250DAD26 6C40E8F5 FE336B50 829C5FF1
F216FD9D A13A87D6 4B9CA18D 7BBC1B7F E9D9D7A2 973ECC61 0D28BD84 1FD15A2B
3C505FAA 64A3F02F B2652E98 A454FCF0 8F174BBE 39977782 A90E388F B76E9B7E
55531AA4 6392F0F0 BE05A637 EDB5C5A5 4C3D21E7 1FC3E755 FBC3C6D4 A94D0B69
E342213C 7EE52C1F 901007E9 99FF0067 7AA9304D 071DF2F7 1E82EF4D DF7C59F9
9BFB6BDD EB49936C 6DB0E326 FC884365 4D69715B 8D7915F9 5F997C51 C9A2BD27
A9AED26E 99B78AA5 4C2BC5B8 933A93CC 72327A0E 54F5C315 B3992D96 E7428BF5
227E0538 9CF6DBF8 F4ACAA23 7814AD64 EB396A62 796602C8 F96572DB D2959442
B8DF9237 6782D602 319E8450 0A26175C C11B0126 8A26E882 8434BAB4 18B99AC5
B466414C 112B7AB2 FDA88B98 8C5EEA5F B0B8FF00 5FFD07D7 5D30EE6D 6993C8DF
CB17C424 88876A61 C11B2EE3 49104089 438046F9 BEF9DFAE 4C06CB82 6A50F913
5214BBFE E04FC565 22647C1E A51A218A 7525E4A2 4C4435D6 84D00A16 04214297
AF551803 A4367186 D1F7A224 4137C826 89A064FD DA02322F 8EA1B12B 09984036
0F6A1220 CBD7936F 6A206832 FEF06908 63DA5FBC 68CD3BC4 DC6E06EE F891F17E
2D0B47BC C8CAD69E 7D1FCD56 A5543EEE 63AF7C9A 7B93E7D3 29242B62 E163C111
74829F48 5C76AC96 17AC1355 512604DB 74C22680 E6924152 7216A850 E11A1724
BF251162 ADB96F42 670C70A4 EC2DB5E0 3EB6B688 A5185000 5230100C 9A0B5C4A
13B6038B 2510866E 10134589 CA81AA7E B0609237 020B26E8 666BB090 C8553F37
C8F0222A A310E1AC ED0EB3AC 5F0C5105 20F32CA9 B60B28D8 ACF1892D D3EE0741
651B6464 D76C5AC0 C1F2EC75 8F17C8F8 DAB34146 BC2E9069 C4C6B8AC 3EBEF80C
5D8A913F 51EA5F10 5700257A 0FE6DD8B F30FE17E 5A90A06E E6CC3E51 1A20034F
C1A70512 17FC5A00 6529D5B8 5E7C2D08 91D03BD4 AD6A3E84 68F65FFE 5F8A01FD
A406824A 50BA1558 092BCF89 7C430DD0 2CF7BC71 F3D8A506 02D3D8A6 041E6186
D1789781 2E289828 D6157B5B 204211C1 35917219 C8A72D00 2F89D7FD 1E3EA800
FABD7EDE 45128CFB F2A504C4 19DA3024 8039F382 6A843DE1 879E0488 6F3D4285
FB670EFF 00FD34BF ED4DCAB3 79649DD1 97F3D827 5BACD836 E65A58AB 8B619E6F
76BFDB70 D59B4F9A 189B9AE0 BA42B6EF 9901AD31 7B62AA4C 92A1908A A573B16B
0B3E96D1 DFB2B1F4 1AC53C1C 75FF0065 9D6F8A1B AA09DB80 C5A8B985 9020B765
7320042A 3A89B9B0 7BA85D85 24473EA9 EBB680C4 4DC89200 15175840 98045C4A
1045028A 9B1404A0 A2B1815B 093C5367 014BCA20 05035C55 8D282B81 5B6511B1
C654CDA4 6CED6A5B 6828023F 362CCE06 3CEEE8B6 577A1499 FBAD5E1F 6F86E3E5
E3DF473D 6A56CC55 B7BA78D4 DA62E3E9 5967625E F0F20B53 245464B8 C83D0148
302F4F30 DA00E2F3 A2461917 F0A56720 C939174B 254074D8 3AA91929 B99A879E
253CC968 F78F8FF7 7F8A1151 12E8E14D 4CF499E7 CC60E3A4 00FA04B0 04217493
F8CDA735 2520F64B FA7FA2EE 401FCC59 0AB89402 C1DEB3A6 64981D1E F397FB30
84B0115C 8B07E7A5 00D02B84 B9840C0A 2A7A9D91 E3FEECA2 EA94803E 5A1321A2
DE6A02EF E0F3A226 02EF5944 C0B0E8B7 352085C9 E981C9A7 75C30A96 215DBBF2
2910FCF3 F29FCFBE 723185CE F4CF446C CA1AF358 F43F3E5A C66B44F0 E8869F1E
3E3FF0A0 FF00FA9F 5FAA20CE 11ADAAEE 631F84B6 B3418973 AF669D36 C2D8DF5E
F416CD2F F3F0F5DA 76BC219F 4B02606E AD021DDC 42899EBB FA5E459E 4CC54C6B
A75A7EA9 E966C3EA 717A352F 6DF16598 DADCF6E3 F5BB2F76 E8F3FC5B 343CBD26
9378DF2B E1776E02 FB4C7451 498AEC52 6293EA22 D830D11C F4BFF17E 6D491605
1AE35D60 5C073C96 D1EBE9F9 58F27603 13EEC764 362C7CF6 5FDDB574 A01321EF
3773BC67 2A22FBE2 5E6CE0ED 337CFF00 A54B6FB2 49B998E0 0B1F5C7F 953E44E5
7776AFB7 DA745DAC 6350CDB2 1224CD20 AAFBF21E A87E6FA5 80597298 BD268BFD
C8DEEEF3 A0FC69B6 17294DAE 204D0849 0025813C A2B2C6C2 706D4BA8 202AA667
5E1964EF 17BD5AB6 CE4A9850 5DD6BD81 F3E538F1 3E8F15CE 460829B2 BF95B980
CD3E77B2 2DF92B09 6CFF0096 A5CF8B59 974FDEEF 51A419A3 59767D16 581760B1
B27F8883 FF00BE6D 4F9E0125 F9458B29 DC26385E BD3CEBEE F48F65AC 29423AC3
6E045259 07DECF27 558A4223 2CC8B70E E7556523 B29960FE DA9484F8 A7DE30DB
1259E5A4 4609EE15 DC0538DC 3E3918C4 B9495E79 D3828BB0 F681BFFC 0DA09CBB
A16C32A3 3D64D619 664A90FA 3A2FFA81 76F8DB14 54A72441 17C49036 D909365B
02220A20 08A00641 0807430D 610AEBA9 F1BBF489 93B4B48A CAFBBE36 E4D9A649
9806E1C1 E7EED568 D9AC4436 15ABF838 62654850 8B5BD78B FD71A6BA 2009F437
41AA839F DB9A0A9B 71AD20E8 78A82B54 BF45F3DF A6241B71 F971A677 622C70B8
7AA6BA88 A79F42D7 AEE2B221 0C71F1E2 A2C2B60D 5BBB2600 9B30D1AB 251B34C8
3ADF96C5 778CBE0D E0491066 231AE7D7 C9E9E7E6 4B00D058 391A9E7F 977C5F0A
34FCFE16 C5F3FE13 2FA16094 B692787F B6FDFE3E 5BD409E0 3F08C54E 47DCD348
F2A92B6C 89FF0037 86D1D3E7 E9F9D8D4 68A3B279 9478B20B F7F90F4A 2E11567A
69831EBF 74398B3E 7EAD939E 95A95936 19E256FC 4973566D 72FF0006 36FF005D
F416495E 3BF382DD 1B05F69F 6C17EFF1 A42D6E54 8BD20E38 D42F7BDE 8C21F6BF
DA1526EA 15C994D1 F8E5362C 0FA750DE FCE55B65 015E4D76 D719EE0C 56B109F0
4D17EF37 35AC55BC 6931B988 5AE2FDDB 7BEFFE37 7BC15F6E 7A9D2A49 98EE5BF6
A2135E18 FBC14EC7 9A2D1B6F 5019E29B 7250CABD E6FD8958 9E155F44 4027A623
F57A2919 7C5B7DFB F30FA12D E9F149E9 2633ABC6 97BE9B34 FE6FD2FE D5A019D8
3CCEAE0C D69D61FC ABFDDDCF A25C61A5 3FEFF7D2 329F7465 C5452700 FA72C472
EEBD6830 8B5CE215 CD4874E6 C5B8F2C2 E6F11CAE FBE8F3DF 45AF6175 A957BF82
AD2997CF F1F99E9F AFE7D392 4A589A50 4B0B7AAF 0BDCA15F FE7BCF6E 4B02E650
FC11A3F8 1EC16F9A B22694DD 3EF8BC55 916F8E50 15625766 23CB3BCE 2E8951CF
EC83CFA6 9C8B5A6C 1DA89012 BD9BD750 54BCA8E1 19A25F9F DB612B6E 2B43C8B3
F8C9EA1D A1450C99 E358A70D 9C016E0A 3B849F27 C5DEF97A 8A8ABD06 B2D33A46
9F349244 46083881 AEA20CA4 06410807 0A304100 49000520 0D200D03 0A500A50
9E2DA909 98368BB2 4D65A816 262C8C6A 5B44E89D F15A13A7 C09D8D05 6122BDAE
CBB70520 0E365B00 84F9024F AA022993 0BE7C70E 0523F44B 0E16D38B 22092174
A247E58B 4A717231 C1CFFBE2 6003E349 85BA09D7 EBD64C17 8C6C009A 4354BA94
0FF977F3 5CEF7EBE 5F0A5469 B30B19D9 3EF8BC41 18F0B826 3C59BD8C CDB75500
FECB9DC4 177CA590 51C088B5 AC62F364 BFDDAAC6 2510BF89 EC2D44A6 337F9B3E
F178A665 0B413E9D D2ED0C8D 29C56371 DFEA9DFF 00D39A71 26CF2581 6B5F56B0
7FAC3D1B 509403BD 63E28DFC B13EB137 8FD7F49E 040189B5 DE347FD8 FCCD16AF
0523F53B FC6FF462 42FD3D32 C9A7FF00 C4E7E14F 208136A9 83C74CD9 3B7B7B1E
DF50309B 26ED36B2 827247F9 7EE8F7FC 20D998D1 071B7440 D85EC0E9 27F3FC7D
CFA80474 9643356A 9D6206BE 7B5E819F FBDB8467 0BCF8931 21C0C93E 5EE5A29C
E1135E7A 59395F7E BE04E0FE DE45121B AADE6FF3 8FFE2D4A 46D2213F 2989C746
D6CF8A81 6C2CF2EE 39B1715E F73FAD08 0B8CDA52 557EE1BD B7458DA0 7D3D97B5
CB3D3DEE 1F84C06B CB420713 5408FA65 8405128C D3B6B3A9 54213018 69CAEAF5
2C436350 949911AA 0432476A 94D122D8 9032E396 9AB021CE 56F5792F CAEE89D0
FDF95F9C BB0F2ADD 285E97DE 7CF070DF 3F75D160 756FBA01 05200D00 9608AD04
D2002008 D1841604 F0414CB3 D602008B AF354F20 0C906C72 AF3D5591 6554FC0B
DC5E6088 4A9AEFDC A66A388D EB5836AB F2592E32 6B80BA22 4CC27532 6E5144B8
B1460E57 4F7A1785 7779F907 922962CD 3501D9E3 EE378446 B79DF788 1D0652B4
7CA504E4 7B9A1CB2 8CCF861B 75C2649A 7B1347E3 5963A22E DFC93EE6 E44DDE25
4585D437 4EF459FC 2EF3F20F 9A432BD2 1CB781E4 CBE75B64 67F16E90 7F74BB70
810ECFDA 4FCF9E58 986151FE E113CDF7 5F8A20CA FBD2ACE6 8E45F1DD 7B23A7B7
454198E7 DCA36C24 94DE3FF7 F9DA9542 F176F743 EBDD1B48 DD5EDEBF 3ACF1FA9
28CEB52B B3707931 90167C17 AFB7EF45 8C62BB20 85A3D13E BD38EF41 4057A2B5
6CB831FE F38B0E36 C367FF00 F34E0503 2F6ADD7F 7C420EB7 177D0F0A 446BAA06
0C373FF7 3B8F5500 7B10E163 DDE8F3AB A30580F5 5FB2382F DE3EBEFF 007D0A14
78F23FCF 48F80EDE 048C4A86 DE4ED885 CFAA3381 BDC93670 1FFE9F4D E8A25E66
BBFF0074 5F16BEEF D7D005CE 75B47C8D BC9B0C7C BCDC94A4 8929AEF7 8EBF1604
7AEE7E77 BE6566CC FAE79221 73A846A8 A8FC2F2A 2D91D64B 6E6BBD6F F9BF4E57
CAC5B884 B6D4214C 637C788A DBAC9B75 93BEB426 54BFFDA4 263243C0 A4062309
A1FCEF0B 4D034121 B202B5A0 174D37AE A20960D3 275B0254 D2AA0BEC 64A63D20
F9293C5B 9607B1C8 F7D00310 0490A800 82000A50 0A26A800 0925015F 9E04580A
14A8A0F1 C02B74EF DA885A16 9A853DD4 44BC7049 DCBDC14D 37B137C5 4AD60A30
CF826E32 267B9D77 F0DD5D3F 80F4EDFA EDFD18A5 A24A2721 4A1ABA87 CCE814E7
E5D3B624 4046AC0D 40E3F5E6 4F686399 4219A41F 066A0ED3 8A9167B2 5BF7CB63
2D82C786 3B723618 9CB295A9 4436441C 07CB36CF F3FC7E54 78EC9CD6 CC5E21E3
7516EF7F 9FDCB251 47C2793D 284AF113 F39D2E28 84FF004B 177CECB9 AB2E1967
53311598 26E0568E 3A5A15D9 C89FE614 86A8FBCC D91F7B2F 4FFF00BE 458EB626
F673CEFF 004CEC38 4E93F1F2 A4462FE8 683FF039 7FE813E9 59245EB0 C791F859
B216B776 FEA00962 3F1E7BC2 939CBF3A 9E45D4A8 262F76C5 F78E729F 0575AB74
526D0DF7 87D390F1 A7997334 619EEB9E 795E309F 2DE016FC E77090AF 57C136CF
2E089B40 7DF8F39F 4E35B009 F66FBEDC 026E91DE BD5A1311 2F922173 43C05BD1
AAAAF6C9 3EDFA9E5 4ACD6B79 F176B87F 8632CA52 351B4A32 36E3B438 72DA2434
22457FAA 01DE8B41 48621704 C06A1349 10F20907 731FF9A5 7582EBFF 00BEA00D
9CB1BB51 22B5E09A 91A316EB 658A0056 B27D3F1A 8041A040 E200BFBC A9A032BF
C2236217 9F677ACC 23CB6D22 83C488DD B3A11789 4158E602 4A139600 4B0C1404
F0A44084 D3928015 2D08A000 27CF4B68 43695F0A 10D13A6C D003C23C 67BC3CD8
BC952F51 61136D93 93889774 4F6A4BE1 4EC2E1F1 6954DA36 1227F8F8 6DAB0626
B32D8968 CE41C014 9F0D10A9 0027CC1F 76BC27EB 8B5A16A8 29ABAFA9 2642E87E
81400568 C4390FD3 D7500331 A6513CE0 70DA84EE F27970C4 376C9627 D813381D
0721F51E 5F5FE1DD 50E2143F D856B059 1E877AAC 258A44B5 BC32F153 B2F0AD80
72AD83BF 8D6AF44B 11EA4239 FAF3EC8A 28A2201E E84D90D0 6E18B83D EA821074
DC5C2031 AD0801E6 F34745C8 49B533F2 6218E0D0 C1C5222D 275E214D 35884DC3
78D2DFAD 5ED68C1D B251D9CC FBA49685 26D66A84 476E0990 F969896C 3D04823E
D1DC654C EEC51826 7B9FD944 29365EE5 2C0BE76F 6C1B4B84 6E67C246 39FE5311
0247DABF 7FDA404C 407E4398 42FCBC2F EF41CA13 9EF879A9 19792A06 CD57CACE
13FF0076 FF00E9F7 59B20028 62DDD84B CA40D401 32671724 2631E70C AA75A8C7
0A99C16D 15C49B14 5EFB9EE4 2382DC29 AD8579C2 C9A7A8AD DF084855 80A560A3
18A08210 74DD0A50 E58210BF DB9200B9 6BEF4100 49004B00 DB82103C AD099877
EE81F69B 35261D61 A0FF00AA CFBA85E4 2C1BF1EC 8353E74D C528FE6C 23A355A2
8AC53A7B 12305BD5 1D63B1BD 38194520 DFB30502 E5384F0A 30FAA400 F72F6A12
13BD5A30 F0BBFC02 DF9600E2 0EFBB7BE 0460FF00 2F821013 3DAD0831 5B3001F2
4180C5E7 4900A160 62130448 9E044C8C 41C0E9B2 26FDBEF7 A265622E 187BEEC8
105526E2 E2D5FF00 6780405F 6FCAA6B4 39262E58 193E6B9F 223CC157 EA54FEB1
51933669 BEA5C684 3A003EDA 20B1DC00 74043C1F 6A20FA2A C8A906E5 28FDAC6C
F76DF7A2 5C1BCEB3 B0814F4A 22BAC1A9 1D2194F3 CFC7D385 13C9E755 22D10421
4F1CDE84 B080DDFB A4E91569 1A7996F1 53C11A27 CE56C1C7 DB9E8D36 E5BDD383
CA9F04FA 4EC69F85 45278898 3AA287BF FBAC8A60 978B9F74 DD9A1B44 21A53C73
F6D2DBAA 3D0B51B9 F4999755 EDD3BAE4 16596B51 EF21F3A0 0A2189E0 4180A500
9200AD36 0105301C 4A124D00 AE0033A8 00300530 7B17DC02 B159FEC9 159A84F7
09F92FAC E4D39ED5 C87896C1 4EE7604B C41924EB 835C754B 718270BD 7F3BA564
462FB009 B76D4885 D58D0A26 9FB80460 540062D7 8A10D000 938610B5 E8CFAF05
30710DE7 49001A42 8E8A8681 EBC5F977 860A70DF 29C667F5 6C09C586 08E0BF9A
8DB9E885 758F65AA 4C3F313E 26183B39 143042FF 0074B872 914FCABD 1B15D8AC
95CFB289 8EE04D00 57414823 894CDC00 B08EFB53 03C27466 7C692E3A 89B0174C
19F01907 5DD86C83 FF00BABE D49059C5 6ECA29C3 55106657 DF1EBA41 A88F0A24
E892001F 847076ED 1831462E 18297CB3 62D38230 64935969 B8509C38 74DEC436
A5C1DFAD AC8486AA 0FF1EE4F FE952288 44C3C7CB 0D30EB87 5C0262B4 698E67F9
27A2C6A5 599815D2 66FF0079 873B3D51 A1EA6A19 1771BFF2 F4E66BEA FBEE5BF2
A67D25DA 20BB8E01 8B202D3E 7FE92965 B801F246 C8B9D9A3 6E3DDF46 C5F0E459
3DA1A864 C569925D 292089F0 4A100458 0A603D81 994A20A8 06E30958 7CA600A4
00142F4F 0A56F913 668892BF 4D4974CC C578F4BF 04AD36CF 5867446E 6ECE33BF
D26463A9 BB123770 6F4634FE 135C123F 13FB16E4 88D0B312 C5D84F5F 55BFFD58
E244E367 746FE4F3 6D158CE3 06BFE23D DFAF6771 1342678C 13C91506 6E41A24F
C1350B98 6D30CD25 E0161A4D 47E818D0 1CCE92A8 1EC1D0DF 0D8201FB 778F1BA8
34220C7C A704A82F CFDDBA39 375AA542 4368484F 7A16D09E 84674160 E6B80461
122B72DF 16AD2A3B 7ED1B88A 9A21E7DE B202722F 27BA4F6A 791651F9 F1599542
426FCEA2 08762D89 112D204D FBBEA1AA 5E8466AD 4A66744B A82450EF 4700AE04
B3A92651 F4C32D34 5294F7A2 86441BDC 188E5400 E57BCB65 BE041D76 ECD868B3
A1C2558C 464BB27F 976FCAD7 8937114A 381AAEB2 B16178E7 7EF11E95 C8967BCD
9BA5BA28 B1AB85EF 1EFC5BB3 F0162C7F 8FD1F44D 45BF2349 BC19C574 5EC72B17
8EB6E235 5623732D CEE29F92 38AE495D 957426DA 91917BE5 B11960BE 643F710D
5FEA882E 7535F226 AF9123B5 DC71AF8C 99B65AC4 AC4C5324 C1D000F2 600990C4
00054028 0978BF37 04480E0D 03EF4900 EC5B84D0 DFE21E29 FCD137D5 948637D6
0BDC3FF8 3C2DCAB8 291C4218 33641827 47D25D11 3725B3D8 49973C6E E5B7A901
41CF08B3 E7554488 C28B2EB8 C8E34CD3 A705401B 95A2D7AE 7581FD2B 36C9CFE9
49284C2E 4056915C B2E82C3C 214F04F4 1E8496E0 299D3E88 C9E72019 C55A14F6
C9C74AEF 41EEE265 857B0B19 3BBFDA0A C04E4D93 51819160 91A79757 6CA9731B
E793C7BA 57D86DE2 D3BAB0A1 92514A95 621E3654 F1A41DA5 428DC667 017C7FEF
379E744B D770AC98 CBFB5915 755120D1 4EF767A9 51B8B0F6 C1A4C0D9 54869892
C5E53788 7C51E728 827E5A20 21D908E5 CD051213 84462FF1 4F686A05 2A28C6B3
C1174584 DDCBA826 3166EDD9 8201FADF 9200EDF7 A1190881 0A349BAA 20856398
70990C6A 48B5ACEA 20D9ED5D 9601852B C98CBD73 D7A2C683 2BB4BAE7 F051C849
159A35E0 B2D0B0C2 620EE3A7 04306D3B 81DD3AC8 6FAA1024 7FDC0214 4E06E6CD
5413295C 8AE40897 A8425C76 CE3A0D5D 4530BA6C 3546697E 41A223EE 756BA1C6
4FBE4CC0 1DD6FC47 7AA709A1 4E7924CB E971CCB7 DA72FC3B 55CAF407 6F66C6AB
E13A71CF BB69AF75 24DAE06E E79C59E7 9C07F9E7 91F3FEA9 EB46F482 FD527C60
63CF9ACD C2225D01 F25B02C1 71F86908 8D06C41F C44354DB 33F6B94B 7C8B3E2F
DA9285EC 66AB74EF 9CCF5057 C1CDCA39 8C36FF00 C2FD2F9A 9BC53AEB 7C727FF0
5EA45E27 21524BAA F35DA9E9 47E36520 B0D8FBAE B1F1A475 148C33CE 7340F7AA
32BD41DF 2AF066BC 01967354 F78B9237 12BF63C3 867F04D6 ACA8E947 F53B62D5
518BDD03 9A6F386F 24FF0026 1AE5E5F8 86F366B4 615940D7 E73635EC E32517F6
21C8505A 17E82F3D 2D080122 F25441C0 7AAAF77C 395006DA 9EBE15D2 007E67FC
F2A0EBA5 AF7D6388 2B84DA51 93E6F49A 8A7E9244 89645052 8A600CB2 B40102D4
FF004717 F44934A9 85DA3EBA 0BC898EA 95D82542 CAA24C63 08F05A00 848AB5E8
ED498046 48E08281 BFF88F9F 17D4495C E5284A44 0A3F0478 A81A0051 44F0B06C
D3B30D12 A00D3070 E4879A0B 7C06A040 8304B335 20CC522A 0E50322D 99409838
6305F7DB 45227CB9 5EE9337B DB140BBB 3A7CDD5C 74925488 3E94319F 65C75801
49D1BEC9 1AC31A05 B3E0B516 EFDE1016 2E616CF0 A4EDA121 1DF29D74 0FE813A5
BF83D398 02B6F46F D0F346C1 6DB2D7B8 F9795EAF 65C7DAC0 B8BCE9E3 110F820B
E54C14EE 19879B09 A0E5ECD3 78ECB4D0 6F1A71DD 79DCFF00 87256F15 A1AAA4F6
FE63CF0D 7C8C4F9A 6F52BF66 46533BFF 00A0DE51 4D56177A E48BEF5E 85373174
16E2CD40 DDAD2843 B2B9972A B3C73AA9 4A7164EA E93B95AD 668035CC F72EF6A4
9D549937 A919A67D 1F74FF00 E109732D 3A495A15 71DACB94 36E221C4 BDFBFBA4
EC6CAE86 6DDE193D D19A8526 65621845 A198AD4B 33211898 042889D0 0A600510
0401BC17 C1327FD8 A8E84668 1979639A 12B116D5 EB6E9BD9 B679AC25 3277AF6D
426D32D0 BCADB8B0 8915FCA4 5D04B8B8 AFA91D64 2C203AFB F4A40BB2 DCC719C7
3AA94056 845CFD6E 6A22F25A 15328610 67A906C3 D05932A1 3F6F6A40 B4FE0421
CDF77CBC 3D8226F9 A544391A 9A9103F6 A600F7A6 86B9216F 208A190A C74B9C20
9B6A9491 2582103E 77F15361 20548E10 0AB01764 317ABE04 2265E1E9 49CA9541
D5E3A704 B8904B36 AF456998 D1386D56 C09F175C 56520A3D 51D5A767 8AB5E05E
5A59676F DA2A4CC4 2992DA01 78E64FBA AB01F958 13118C01 C8C35744 997761ED
6413AC05 14A19736 B1179E24 4279A777 DE044C3F 3D2AD0FD A4F2ACB3 3163DDFB
BE15F3A1 2621B3DA A33DFEDD BAFF00AB 926C6182 F1A53DD5 F76DE726 6B4427CD
DAE2DA86 129F3332 676A7412 E4B4BDB9 589DD838 DFA92A49 84E77C17 7B07F52C
2B49D43A 310A0F4B A748C7BC 8BB5510E A13EC999 5B83D981 8A844DA5 DD22208A
194B48E1 4900AD60 5203B2F4 57D07BE0 FF000F11 055EAC60 D56C7A32 C70BD898
AF6DE01A 67827EE8 9B53EC30 C3FDA7EB 259788AD A6EB24E6 E2FF0054 DA41204E
B989FF00 71512A44 78994BA7 3D20493D 3BC7B86C 820B518B FCDA8044 443501D6
B3D7D812 E880618A 500E470A 9651993B 2FA80901 A00A214A 90E6FB3E AEA42A88
AE944235 E8D392C0 69E3A30D 40BE7F64 A20419E7 494CC326 C9940BCF 554429E3
F3A03A13 705EC454 492FFF00 A234523F 705B224C 600A3649 D84B4C98 60501298
E892C0A3 C0479AF1 14D9B260 CAA58D07 53B214B8 CBDAA501 975D2B1B 209FEB5F
CBC47890 B9F6ED43 00FC7B82 B1E5540A A03BDDAD 594F4F5C 128D1A6F 38CF022D
9244A993 E6A02B60 134CFD87 10A525F8 825CB580 BDB12965 CFB6D548 963C1A95
43064932 9E15CCB6 8CC4ABD3 6BDE2AF2 79ED7903 9F50F874 387A2903 828B27E0
D5839F3A 26502079 8382611A 4BEF719E C5EED6B1 8AA10954 5E4432D1 BA4199B5
213EA89D 44AC2E67 BA0B58BA 42F65A02 2108C0E7 4910F877 9743F9BB 48C6F54D
7D43AAF7 929691CB DEECAC1C E06F829C 27F51087 D1BA5631 B2D8123B 6BEA4C98
5E53E305 9BC215DE 6EEA2CF1 CFE35D65 01DD8DE1 49852ABB 29DDD054 AC44F5F2
2DDA218C EBE9494C 43D1AA13 DC02F033 410C36E9 D38A20F1 5E04E06C E34B4CF1
A4541249 0931C5F7 FAA65613 894F4A84 DB8A10DD 9210C3F6 9F252056 5732FA1E
A40C8367 4A404980 C86E4B44 116F7CBE C4CC27F3 F4A46095 FD486F4A 209F8883
F1581426 1C82D196 1A3197AC 8281FB96 3018A40C 63B4580C 0C43CEB2 19970CA0
FC09BB19 D73A1D96 85E2534A 877D9734 7BEDFA9D 9041EB8D FF005896 CEBC0BFB
AD21DEBD BEF409C2 746F98A4 3E624B4E 228C54E8 743EA9A6 9975E25C 5A073375
9C40B23B E4D233E6 33AD0927 A9172C98 385E1725 C555B8ED A5814950 51991A22
B50D13ED 25071735 1B841907 D3BAE3B6 50780E45 37124A34 C9C175F2 53D8947D
5A47357F C8895B0D C838ED8A 096A4023 EC6B8E91 FBA40191 3DFD9B1E 605D7A36
E327D9CC 2F9C608C 8D3D4994 55C09552 69FD8126 6A9B9FC2 D57CD965 1E2E2F56
30E14DCE B3C89417 EC1CE95D 17647501 DCC460D7 7A900C4A 13F9A6D3 8A82F45B
F3C4E745 006826BC 4DC0A735 20F18957 F3D94300 37A800E6 87DC0002 7F9E0490
CF4300D6 3EA94002 C10513D0 121A4968 72A404B4 57FF00F1 62CA6A44 B3254227
3F6D08E1 A3A024D1 84707A7A 5A13F065 2CBF2DD1 9C3E5365 620E7C2A E9D39E2F
39CC443C C9A71506 506F0A65 52ED9100 725A12A8 5B32E083 414C737B FBDA0043
63609229 F2898FBF 4D6B1008 EE6CA735 88BC09D1 58F7573F 65AC6234 5F22BAA6
25F4390D 77BAC1C0 54C8A9A4 7255BC01 B5463765 94A7B124 84501354 6C2A8654
26329E05 7592276D E317F8EF DB340B1D CA699D30 6BB36556 E82F64AD 0158C800
BB870A86 39919E84 1A179F65 27A131F6 7EC56DC2 4055E38C 70CE5CF5 029B587C
51CB0654 5CDAC84C 0A240523 E82A2845 308F78A6 22C42A56 3C0B6AAD 4B37A864
A24876A6 6B5E2CAC F93C5C76 222A4660 CAD83077 5184B9D0 9CE6CF25 A22C0502
C136A954 204F6A12 EF5934D1 8F3D4276 F4C60513 C9670A60 7E6A8200 30A800E4
0C0512A3 17044CBE 2505EDD9 D39200AD 06E3CE38 E3451FA8 5611E60A 65C18201
0F870A34 BF053078 9E0478F8 790F0A44 0C7E411D 22EE9E65 C88CB96E D52C6A54
44384207 B233B7B0 FB6D8985 39CCF3A4 448D23FD D9200BEB 06D1D403 4DF6C9E9
8B6AC12A 97BC84EA 151DC438 8ACFA20A B498B3A6 50596550 8DD7B636 F3762683
DED1FC89 7E1FBA53 84AB69B9 75EE7E2D 1965E295 BD381CDE 2525C24A F563135C
D40C7BC0 74E8A345 C80D8424 3E5E624A 2A8C9E04 0C058454 E1EC8681 0E834A12
4D85E2E2 B2B06152 C10A515A 98A00B21 28304F6A 200523E8 3A10A9F2 29F482AF
0D08CCD5 B2B0E9F7 0E517571 3B44222D 152F3CE2 F38D69B8 B89D1191 CCC5D5B5
49AF259B F952A87D A1C6B377 BD5FC32D 0BC5DC69 CD2CBF84 5CD47817 8B7A1690
A826C036 2D08B1FD C32D810E 17CF430C F69F2E18 58007484 506A1293 0A26A900
F85B844C EF4500FD 6D08C005 13C93D82 A404A308 F1C4194D 00AE4094 919EDE14
42F93CA9 26D1AD18 60836F51 44D82F75 F6C1A0E9 25EA339C BD84BA98 3BA8348B
0A25002F 772F83AA 044A240F 43C7E1E7 490EB86E A14165CD 4A69126B FCA52D4C
A963A926 F6E15D62 98A1F576 F157A664 72595EF9 5E042142 F763242D 204ED313
ED0A5658 8828133D 0D45C8DB E1A4B705 23540486 01CF0584 2608E0FD A434A026
A0290945 8D166584 05309688 E54900AD 60736BD0 02B29783 BFCBA156 C0F76F0D
D78691E4 AE60BDBF FAD97455 431285CC 2FADBD89 74BCDDD7 82235EB1 321467FB
926A561B 6485671E 80CF96C0 B89C3EA8 46119F87 3E4108D5 49413370 D182813D
6C5030B1 9EE84968 73A800E4 4D0C335C 20B18F2D 10EB4DC0 D39208AD 29281829
DE3E5BD4 8C2292DE 55270D08 35006E08 00874A13 2C99325C 422255A6 4AD478AF
D60A3449 BF0D2244 6C936A84 EFDB9A00 BB75EE67 6A20CEF1 77D1820B 3881434C
14C21639 51525C59 059CC627 BE59BA25 634302AB 5BEF6EB2 276773D2 6D73B0EC
D780CA6B 43F252FB E15B1965 A106810C C53DB000 A8183188 A7169641 F4A158DE
0461D3D3 AB052214 14220D10 0490042C 08F0A654 504605E9 5D5A98A0 90218A14
0D052005 13A32510 4B4C1379 A8A09B60 CCD7AD54 22594DC0 FDC3F5B7 DB4332D9
FB580E9F 3AB8419F 97C8CE15 E87ED385 4D85B861 2956163F 35623C6B D84BEEC1
3A13F9BB A9340DE4 745B030D 78CF3F14 7301EA63 0DD46CC7 8BAA109B 3EE84908
56225C7C 41686213 841A8281 AD300DA7 7C453816 8FCA8831 41C01304 D0D392C8
56054C6A 139D0A34 58024270 2DD98C0B 4FE628A9 623C5D49 5300D4CF C34F0A90
2EAF0561 F06948D4 7806A177 5188A367 5C020B1B 8AB2BD30 5BB44398 C2ADC7E3
14876CB1 51867762 0F5FEC32 2FBB6D2B E272B4F1 1485A921 08D38A81 B9707B41
000EDD83 2E087107 7C43E03C 3E4EA000 1B9E1489 05100490 042C08A0 04410025
82A49021 8A1404D0 DE045012 D86A020A 36822061 F5A434A2 DBF9A9CD 0EC83641
7C9BFC87 79D4686D 817698C3 6B729641 7F024A0D DFF9BC7E 5B56B601 0265DE2D
F9924018 4657BE5B 5495A3F0 8415033D F12C1886 547E5687 B186E025 D07AC3E9
8682E670 1E0485C4 05034236 A8A01BE1 A6A0B104 90C49061 F3A54AE4 BD213513
42BD0993 4AF61BE0 B21370A6 243141C0 E6ACBAC8 C4268960 8281D782 10F7A000
554A12DD 9ACD341D 6FC7FB5A 25261BA6 925549F0 BB1452C9 60BFDB82 82F6CDC3
1F052362 6E0985C7 30C9B705 2C62086E 107B2D4B 4491136C 6FAD297C 01DA2625
A38F00A0 60A76564 9C6141D0 4B41F3F6 5B0083A7 360F0A86 19262009 C549C035
336108A0 00821092 C0A406D2 00D1EB49 4841C0A4 00A426A0 00A40452 30218968
0D134B00 AD046292 18ACB62B F786A698 80FF0035 70A6C0BD 22991E32 E2E78E6C
92338309 D77A8251 758641EA 5321F033 D1335F5A 178DD4DD 5C0585E4 B73D016D
0A400A60 4F6F0A1A 49685202 F12B9A91 3FE03051 14CCD223 73A01064 4EBC7F54
144B8D06 251B2297 2628442F 9E8546B7 1725134B C0E68281 0A350126 8960FD2D
19243581 05103904 CAB4C16C F38B17C4 C54ABE77 7CCC92CD E915BD3E 5F4A12AC
F4C0B315 D6205E88 FE46B8FE 069ADFA2 350DBB71 49955437 6FF883A4 BD835196
F8166D73 FBDBBE5C 053AB2A9 9EC276F1 DBCFA2D4 9019791B 2E28B811 7C2D1831
10AD18B0 0490042C 09B004D0 AF05206E 89808210 96000520 B7052035 01053096
00470A26 F7A42621 18C8D182 11A52E2F ED5D73B4 025C1037 B0151FE0 8FC46506
0AC3F64A D4CC5139 06F373E5 5B4285F4 A64000C9 D60A1AF3 79A600A7 AF2EDA21
72DB20B1 04903804 9B586A12 1304B0C4 E2414C41 48412141 D8291B26 4A090A16
0428084F A000D49B 810AB711 9FE55963 91616C41 685132A0 0AA000C4 05554CDE
4510E882 81474108 558E8220 577981AA 32494984 801C0A44 AE60831A E07D42DD
A8773249 C409CD1F 14849B36 C70607F4 DD0A4A57 652DCA19 C0C10D86 F4045000
5230A000 9200B978 5B13C0ED B8CFB484 26971DFF 00FC540A 7028F3DB 04D03F22
6C77C015 06B16F89 005E4D35 518CDCDF A9E8E632 0AC58CAA ADEEC9F9 2F6D086E
B273984F 4C8E85DF 503012F7 7196AEF3 77C02DE7 4910C58F ACF10E1B 391FA600
B8EF219F F768DC70 CFA018C5 FCB9B54D EA60DD1E 745B22E6 05F62334 BF9C9043
08F4B26D B8318ADE 89412C8E A6EEDED4 80070A24 7E4100AD 50475144 AE419012
74BE0448 0ABA5802 A026A024 A00092C8 E449DC0A BC559909 3D5C43B6 4041589C
1786E005 41ACA044 5040986B 08D0B89E 1424C6A5 0006A859 08C3CB15 0671067A
16E09D04 608201D6 3E5A50D8 22282E4B 324EA019 3154175B 17A806D0 57DE1465
B16F3824 5198214E 8B5C4322 DEDA4E6B FF0017E8 FDA4466A C5FF0048 E8AF135B
32E83B9B DA4CFF00 48F90539 EEAAA077 B0D8E152 4DFB983D 2F4AC14C F90F49A4
A8E3A41B 6263F631 E435905C 12CDBCA3 D91CE656 434833DE E2CDEEAA 8429F35B
8C7A6843 5078F786 D5DE0CC9 0E055588 C79ECD5E 5E393F0A 50E089B1 3BDC408D
7709CA82 5284A6BD A867B289 40245998 8BDEC9D7 820BC567 DC4B9C00 82009D6B
084D762D 899F85AD 1406AA01 4980C505 43AB9014 B7B71C84 F92B414C 28095015
908582E1 AD501250 03A000A2 44F3ACD6 B91B6CDD 4DAC0B1B 2C3D76F6 1504F8FF
9D248334
        </binaryData>
      </image>
      <text name="B_OR$BODY_SECTION" minWidowLines="1">
        <textSettings spacing="0"/>
        <geometryInfo x="2.79126" y="0.12500" width="3.14624" height="0.31250"
        />
        <textSegment>
          <font face="Courier New" size="20" bold="yes"/>
          <string>
          <![CDATA[Clearwater Traders]]>
          </string>
        </textSegment>
      </text>
    </margin>
  </section>
  </layout>
  <colorPalette>
    <color index="190" displayName="TextColor" value="#336699"/>
    <color index="191" displayName="TableHeading" value="#cccc99"/>
    <color index="192" displayName="TableCell" value="#f7f7e7"/>
    <color index="193" displayName="Totals" value="#ffffcc"/>
  </colorPalette>
  <reportPrivate defaultReportType="masterDetail" versionFlags2="0"
   templateName="rwbeige"/>
  <reportWebSettings>
  <![CDATA[]]>
  </reportWebSettings>
</report>
</rw:objects>
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>

<HEAD>
  <TITLE> Your Title </TITLE>
  <rw:style id="rwbeige55">
<link rel="StyleSheet" type="text/css" href="css/rwbeige.css">
</rw:style>

  <META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</HEAD>

<BODY bgColor="#ffffff" link="#000000" vLink="#000000">

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ffffff" rowSpan=2 vAlign=middle width=188><IMG alt="" src="images/rwbeige_logo.gif" width="135" height="36"></TD>
    <TD bgColor="#ffffff" height=40 vAlign=top><IMG alt="" height=1 src="images/stretch.gif" width=5></TD>
    <TD align=right bgColor="#ffffff" vAlign=bottom>&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE bgColor="#ff0000" border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" class="OraColumnHeader">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#ff0000" vAlign=top class="OraColumnHeader"><IMG alt="" border=0 height=17 src="images/topcurl.gif" width=30></TD>
    <TD vAlign=top width="100%">
      <TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
        <TBODY>
        <TR>
          <TD bgColor="#000000" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#9a9c9a" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        <TR>
          <TD bgColor="#b3b4b3" height=1><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  </TBODY>
</TABLE>

<TABLE width="100%" border="0" cellspacing="0" cellpadding="0">
  <TR>
    <TD width="29%" valign="top">
      <TABLE width="77%" border="0" cellspacing="0" cellpadding="0">
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_d_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation goes here </TD>
        </TR>
        <TR>
          <TD width="10%" class="OraCellText"><IMG alt="" src="images/blue_r_arrow.gif" width="10" height="10"></TD>
          <TD width="90%" class="OraCellText">Navigation Item</TD>
        </TR>
      </TABLE>
    </TD>
    <TD width="71%">
      <DIV align="center">
      <!-- Data Area Generated by Reports Developer -->
<rw:dataArea id="MGCIDGRPFR86">
<rw:foreach id="RGCID861" src="G_C_ID">
<!-- Start GetGroupHeader/n --> <table class="OraTable">
 <caption class="OraHeader">  <br>Customer ID: <rw:field id="F_C_ID" src="C_ID" breakLevel="RGCID861" breakValue="&nbsp;"> F_C_ID </rw:field><br>
C First <rw:field id="F_C_FIRST" src="C_FIRST" breakLevel="RGCID861" breakValue="&nbsp;"> F_C_FIRST </rw:field><br>
C Last <rw:field id="F_C_LAST" src="C_LAST" breakLevel="RGCID861" breakValue="&nbsp;"> F_C_LAST </rw:field><br>
C Mi <rw:field id="F_C_MI" src="C_MI" breakLevel="RGCID861" breakValue="&nbsp;"> F_C_MI </rw:field><br>
Order ID: <rw:field id="F_O_ID" src="O_ID" breakLevel="RGCID861" breakValue="&nbsp;"> F_O_ID </rw:field><br>
Order Date: <rw:field id="F_O_DATE" src="O_DATE" breakLevel="RGCID861" breakValue="&nbsp;"> F_O_DATE </rw:field><br>
 </caption>
<!-- End GetGroupHeader/n -->   <tr>
    <td valign="top">
    <table class="OraTable" summary="">
     <!-- Header -->
     <thead>
      <tr>
       <th <rw:id id="HBITEMDESC86" asArray="no"/> class="OraColumnHeader"> Item Description </th>
       <th <rw:id id="HBOLQUANTITY86" asArray="no"/> class="OraColumnHeader"> Quantity Ordered </th>
       <th <rw:id id="HBINVPRICE86" asArray="no"/> class="OraColumnHeader"> Price </th>
      </tr>
     </thead>
     <!-- Body -->
     <tbody>
      <rw:foreach id="RGITEMDESC861" src="G_ITEM_DESC">
       <tr>
        <td <rw:headers id="HFITEMDESC86" src="HBITEMDESC86"/> class="OraCellText"><rw:field id="FITEMDESC86" src="ITEM_DESC" nullValue="&nbsp;"> F_ITEM_DESC </rw:field></td>
        <td <rw:headers id="HFOLQUANTITY86" src="HBOLQUANTITY86"/> class="OraCellNumber"><rw:field id="FOLQUANTITY86" src="OL_QUANTITY" nullValue="&nbsp;"> F_OL_QUANTITY </rw:field></td>
        <td <rw:headers id="HFINVPRICE86" src="HBINVPRICE86"/> class="OraCellNumber"><rw:field id="FINVPRICE86" src="INV_PRICE" nullValue="&nbsp;"> F_INV_PRICE </rw:field></td>
       </tr>
      </rw:foreach>
     </tbody>
     <tr>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</rw:foreach>
<table class="OraTable" summary="">
</table>
</rw:dataArea> <!-- id="MGCIDGRPFR86" -->
<!-- End of Data Area Generated by Reports Developer -->

      </DIV>
    </TD>
  </TR>
</TABLE>

<P>
  <BR>
</P>

<TABLE border=0 cellPadding=0 cellSpacing=0 width="100%">
  <TBODY>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ff0000" colSpan=2 class="OraColumnHeader"><IMG alt="" border=0 height=4 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#000000" colSpan=2><IMG alt="" border=0 height=1 src="images/stretch.gif" width=1></TD>
  </TR>
  <TR>
    <TD bgColor="#ffffff">&nbsp;</TD>
    <TD align=right bgColor="#ffffff">&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>

</BODY>

</HTML>

<!--
</rw:report>
-->
