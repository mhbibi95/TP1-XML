<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
        <head>
            <meta charset="UTF-8"/>
            <title>Liste des clients</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 28px; color: #222; }
                h1 { color: #183b63; }
                h2 { color: #24527a; margin: 24px 0 5px; }
                .adresse { margin: 4px 0 10px; color: #555; }
                table { border-collapse: collapse; width: 100%; margin: 8px 0 18px; }
                th, td { border: 1px solid #888; padding: 8px; }
                th { background: #e7eef6; text-align: center; }
                td.num { text-align: right; }
                td.impaye { color: #b42318; font-weight: bold; text-align: right; }
                .stats { background: #f4f6f8; padding: 14px 28px; line-height: 1.9; }
            </style>
        </head>
        <body>
            <h1>Liste des clients</h1>
            <xsl:for-each select="clients/client">
                <h2>Client : <xsl:value-of select="@nom"/></h2>
                <p class="adresse"><strong>Adresse :</strong> <xsl:value-of select="adresse"/></p>
                <table>
                    <tr>
                        <th>Référence</th><th>Type d'abonnement</th>
                        <th>Date de souscription</th><th>Total factures (DH)</th>
                        <th>Factures impayées (DH)</th>
                    </tr>
                    <xsl:for-each select="abonnements/abonnement">
                        <tr>
                            <td><xsl:value-of select="@reference"/></td>
                            <td><xsl:value-of select="type"/></td>
                            <td><xsl:value-of select="dateSouscription"/></td>
                            <td class="num"><xsl:value-of select="totalFactures"/></td>
                            <td class="impaye"><xsl:value-of select="facturesImpayees"/></td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <td colspan="4"><strong>Nombre d'abonnements</strong></td>
                        <td class="num"><xsl:value-of select="nombreAbonnements"/></td>
                    </tr>
                </table>
            </xsl:for-each>
            <h2>Statistiques générales</h2>
            <ul class="stats">
                <li>Nombre de clients : <xsl:value-of select="clients/statistiques/nombreClients"/></li>
                <li>Nombre total d'abonnements : <xsl:value-of select="clients/statistiques/nombreAbonnements"/></li>
                <li>Nombre de factures/abonnements avec impayé : <xsl:value-of select="clients/statistiques/nombreFacturesImpayees"/></li>
                <li>Total des factures : <xsl:value-of select="clients/statistiques/totalFactures"/> DH</li>
                <li>Total des factures impayées : <xsl:value-of select="clients/statistiques/totalFacturesImpayees"/> DH</li>
                <li>Moyenne des montants par abonnement : <xsl:value-of select="clients/statistiques/moyenneMontantsAbonnements"/> DH</li>
            </ul>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
