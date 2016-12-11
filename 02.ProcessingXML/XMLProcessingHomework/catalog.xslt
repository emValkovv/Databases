<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:template match="/">
    <html>
      <link rel="stylesheet" type="text/css" href="style.css"/>
      <body>
        <h1>Albums</h1>
        <table>
          <tr>
            <th>Nameame</th>
            <th>Artist</th>
            <th>Yearear</th>
            <th>Producer</th>
            <th>Price</th>
            <th>Songs</th>
          </tr>
          <xsl:for-each select="listofalbums/album">
            <tr>
              <td>
                <xsl:value-of select="name" />
              </td>
              <td>
                <xsl:value-of select="artist" />
              </td>
              <td>
                <xsl:value-of select="year" />
              </td>
              <td>
                <xsl:value-of select="producer" />
              </td>
              <td>
                <xsl:value-of select="price" />
              </td>
              <td>
                <xsl:for-each select="listofsongs/song">
                  <div>
                    <strong></strong><xsl:value-of select="title"/>,
                    <strong>-></strong><xsl:value-of select="duration"/>
                  </div>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>