<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Gestion de la bibliothèque</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background: #f2f2f2;
                        margin: 30px;
                    }
                    h1 {
                        text-align: center;
                        color: #244a80;
                    }
                    table {
                        width: 100%;
                        margin: 24px auto;
                        border-collapse: collapse;
                        background: white;
                    }
                    th, td {
                        border: 1px solid #777;
                        padding: 10px;
                        text-align: center;
                    }
                    th {
                        background: #4472C4;
                        color: white;
                    }
                    tr:nth-child(even) {
                        background: #eef3fb;
                    }
                </style>
            </head>
            <body>
                <h1>Gestion de la bibliothèque</h1>
                <table>
                    <tr>
                        <th>ID Étudiant</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Âge</th>
                        <th>ID Livre</th>
                        <th>Titre</th>
                        <th>Date d'emprunt</th>
                        <th>Rendu</th>
                    </tr>
                    <xsl:for-each select="biblio/etudiant">
                        <xsl:for-each select="livre">
                            <tr>
                                <td><xsl:value-of select="../@id"/></td>
                                <td><xsl:value-of select="../@nom"/></td>
                                <td><xsl:value-of select="../@prenom"/></td>
                                <td><xsl:value-of select="../@age"/></td>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="@titre"/></td>
                                <td><xsl:value-of select="@dateEmprunt"/></td>
                                <td><xsl:value-of select="@rendu"/></td>
                            </tr>
                        </xsl:for-each>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
