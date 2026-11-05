<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Opérations crédit</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 30px; }
          h1 { color: #16803c; }
          table { border-collapse: collapse; width: 100%; }
          th, td { border: 1px solid #cbd5e1; padding: 10px; }
          th { background: #16803c; color: white; }
        </style>
      </head>
      <body>
        <h1>Opérations de type CREDIT</h1>
        <p><strong>RIB :</strong> <xsl:value-of select="releve/@RIB"/></p>
        <table>
          <tr><th>Date</th><th>Montant</th><th>Description</th></tr>
          <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
            <tr>
              <td><xsl:value-of select="@date"/></td>
              <td><xsl:value-of select="@montant"/></td>
              <td><xsl:value-of select="@description"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
