# HelloID-Conn-Prov-Source-SAP

## Table of contents

 - [Introduction](#Introduction)
 - [Work In Progress](#Work-In-Progress)
 - [Prerequisites](#Prerequisites)
 - [BAPI Function Calls](#BAPI-function-calls)
 - [Setup the connector](#Setup-the-connector)

## Introduction

The *HelloID-Conn-Prov-Source-SAP connector* requires the **SAP Connector for Microsoft .NET**. This also implies that the connector needs to be **executed on-premises**. Make sure you have **Windows PowerShell 5.1** installed on the server where the **HelloID agent and provisioning** agent are running, and that the *Execute on-premises* switch is toggled on the connector system tab within HelloID.

## Work in progress

Out of the box, The *HelloID-Conn-Prov-Source-SAP connector* is not ready for implementation. The provided *persons.ps1* is merely an example on how to extract data from SAP and import that data into HelloID. Therefore, changes will have to be made to the source code according to your implementation of SAP. 

## Prerequisites

- [ ] SAP Connector for Microsoft .NET

  The SAP Connector files can be downloaded from: https://support.sap.com/en/product/connectors/msnet.html

- [ ] Windows PowerShell 5.1

  Windows PowerShell 5.1 must be installed on the server where the 'HelloID agent and provisioning agent' are running.

  > The connector is not tested on older versions of Windows PowerShell.

- [ ] BAPI Function calls

  Function calls must be created within SAP in order to retrieve data.

## BAPI function calls

Data from SAP can be retrieved using the BAPI interface. (Business Application Programming Interface). 

At minimum, the following data is required:

| Person                                                       |
| ------------------------------------------------------------ |
| Initials<br/>Nickname<br/>Given_name<br/>Family_name_prefix<br/>Family_name<br/>Family_name_partner_prefix<br/>Family_name_partner<br/>Family_name_formatted<br/>Name_separator<br/>Convention<br/>Birthdate<br/>Phone |

| Contract                                                     |
| ------------------------------------------------------------ |
| Type<br/>Sequence<br/>Fraction<br/>Fte<br/>Hours_per_week2<br/>Business<br/>Organizational_unit<br/>Manager<br/>Profession<br/>Start<br/>End |

> The name of the function call and table are both needed within the connector.

For more information on the BAPI interface: https://help.sap.com/viewer/df959412681b4619a38f03ff90207e6b/4.2.12/en-US/577b7d566d6d1014b3fc9283b0e91070.html

## Setup the connector

1. Download the SAP Connector for Microsoft .NET from: https://support.sap.com/en/product/connectors/msnet.html Make sure to donwload the connector that is compiled with .NET Framework 4.0.

2. Extract the contents of zip file and copy them to a sensible location. The HelloID connector requires the following *.dll files: 

   - sapnco_utils.dll

   - sapnco.dll

3. Create the required BAPI function calls within SAP.

4. Download all the files in the *HelloID-Conn-Prov-Source-SAP* connector repository on Github.

5. Make changes to the *.PS1 file(s) according to your SAP implementation. You can use the *persons.ps1* as an example. Another example on how to retrieve the tablesNames from SAP can found within the *<./resources/Get-SAPTables.ps1>* file.

6. Add a new 'Source System' to HelloID and make sure to import all the necessary files.
 
