<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Relevé bancaire</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 30px; color: #243247; }
          h1 { color: #174a7e; }
          table { border-collapse: collapse; width: 100%; margin-top: 18px; }
          th, td { border: 1px solid #cbd5e1; padding: 10px; text-align: left; }
          th { background: #174a7e; color: white; }
          .credit { color: #16803c; }
          .debit { color: #c0392b; }
          .totaux { margin-top: 20px; padding: 14px; background: #eef4fa; }
        </style>
      </head>
      <body>
        <h1>Relevé bancaire</h1>
        <p><strong>RIB :</strong> <xsl:value-of select="releve/@RIB"/></p>
        <p><strong>Date du relevé :</strong> <xsl:value-of select="releve/dateReleve"/></p>
        <p><strong>Solde :</strong> <xsl:value-of select="releve/solde"/></p>
        <p><strong>Période :</strong>
          <xsl:value-of select="releve/operations/@dateDebut"/> au
          <xsl:value-of select="releve/operations/@dateFin"/>
        </p>

        <h2>Liste des opérations</h2>
        <table>
          <tr>
            <th>Type</th><th>Date</th><th>Montant</th><th>Description</th>
          </tr>
          <xsl:for-each select="releve/operations/operation">
            <tr>
              <td><xsl:value-of select="@type"/></td>
              <td><xsl:value-of select="@date"/></td>
              <td><xsl:value-of select="@montant"/></td>
              <td><xsl:value-of select="@description"/></td>
            </tr>
          </xsl:for-each>
        </table>

        <div class="totaux">
          <p class="credit"><strong>Total des crédits :</strong>
            <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/>
          </p>
          <p class="debit"><strong>Total des débits :</strong>
            <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/>
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
