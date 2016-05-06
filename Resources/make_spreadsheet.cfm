<cffunction name="spreadsheetNewFromQuery" output="false">
    <cfargument name="data" type="query" required="true">
    <cfargument name="sheetName" type="string" default="Sheet1">
    <cfargument name="removeHeaderRow" type="boolean" default="false">
    <cfset var tempPath  =   GetTempDirectory() & CreateUuid() & ".xls">
    <cfspreadsheet action="write" filename="#tempPath#" query="data" sheetname="#sheetName#" overwrite="true">
    <cfscript>
        var spreadsheetObject   =   SpreadsheetRead( tempPath );
        FileDelete( tempPath );
        if( removeHeaderRow ){
            SpreadsheetShiftRows( spreadsheetObject,2,data.recordcount+1,-1 );
        }
        return spreadsheetObject;
    </cfscript>
</cffunction>