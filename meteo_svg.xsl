<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg"
         width="720" height="{count(meteo/mesure) * 320 + 20}">

      <xsl:for-each select="meteo/mesure">
        <g transform="translate(40, {(position() - 1) * 320 + 50})">

          <text x="0" y="-25" font-size="18" font-weight="bold">
            Températures du <xsl:value-of select="@date"/>
          </text>

          <line x1="0" y1="0" x2="0" y2="240" stroke="black"/>
          <line x1="0" y1="240" x2="650" y2="240" stroke="black"/>

          <xsl:for-each select="ville">
            <rect x="{(position() - 1) * 80 + 10}" y="240" width="50" height="0">
              <xsl:attribute name="fill">
                <xsl:choose>
                  <xsl:when test="@temperature &gt;= 25">tomato</xsl:when>
                  <xsl:otherwise>steelblue</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <animate attributeName="height" from="0" to="{@temperature * 8}"
                       dur="1.5s" fill="freeze"/>
              <animate attributeName="y" from="240" to="{240 - @temperature * 8}"
                       dur="1.5s" fill="freeze"/>
            </rect>

            <text x="{(position() - 1) * 80 + 35}" y="{240 - @temperature * 8 - 6}"
                  text-anchor="middle" font-size="13" opacity="0">
              <xsl:value-of select="@temperature"/>
              <animate attributeName="opacity" from="0" to="1"
                       begin="1.5s" dur="0.5s" fill="freeze"/>
            </text>

            <text x="{(position() - 1) * 80 + 35}" y="258"
                  text-anchor="middle" font-size="12">
              <xsl:value-of select="@nom"/>
            </text>
          </xsl:for-each>

        </g>
      </xsl:for-each>
    </svg>
  </xsl:template>
</xsl:stylesheet>
