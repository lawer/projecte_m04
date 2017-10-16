<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
  <xsl:output method="html" indent="yes" name="html" doctype-system="about:legacy-compat"/>

  <xsl:template match="/">
    <html>
      <head>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
              integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
              crossorigin="anonymous"/>

        <link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700" rel="stylesheet"/>

        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
          <a class="navbar-brand" href="houses.html">GoT</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                  aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"/>
          </button>

          <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active">
                <a class="nav-link" href="houses.html">Houses</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">Characters</a>
              </li>
            </ul>
          </div>
        </nav>

        <div class="container">
          <h1>GOT Houses</h1>
          <table class="table table-bordered table-condensed table-striped">
            <thead>
              <tr>
                <th>
                  Sigil
                </th>
                <th>
                  Name
                </th>
                <th>
                  Quote
                </th>
              </tr>
            </thead>
            <xsl:for-each select="//house">
              <tr>
                <td>
                  <a href="{@id}.html">
                    <img class="card-img-top" src="{sigil/@src}" alt="{name} sigil"/>
                  </a>
                </td>
                <td class="centrat">
                  <a href="{@id}.html">
                    <xsl:value-of select="name"/>
                  </a>
                </td>
                <td>
                  <xsl:value-of select="quote" disable-output-escaping="yes"/>
                </td>
              </tr>
            </xsl:for-each>
          </table>

        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"/>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"/>
      </body>
    </html>

    <xsl:for-each select="//house">
      <xsl:result-document href="{@id}.html" format="html">
        <html>
          <head>
            <!-- Required meta tags -->
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

            <!-- Bootstrap CSS -->
            <link rel="stylesheet"
                  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
                  integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
                  crossorigin="anonymous"/>

            <link href="https://fonts.googleapis.com/css?family=Cinzel+Decorative:400,700" rel="stylesheet"/>

            <link rel="stylesheet" href="styles.css"/>
          </head>

          <body style="padding-top:5rem;">
            <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
              <a class="navbar-brand" href="houses.html">GoT</a>
              <button class="navbar-toggler" type="button" data-toggle="collapse"
                      data-target="#navbarsExampleDefault"
                      aria-controls="navbarsExampleDefault" aria-expanded="false"
                      aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"/>
              </button>

              <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="houses.html">Houses</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">Characters</a>
                  </li>
                </ul>
              </div>
            </nav>

            <div class="container">
              <h1>
                <xsl:value-of select="name"/>
              </h1>
              <div class="row">
                <div class="col-12 col-md-3">
                  <img class="card-img-top" src="{sigil/@src}" alt="{name} sigil"/>
                </div>

                <div class="col-12 col-md-9">
                  <form>
                    <div class="form-group row">
                      <label for="input-name" class="col-md-3 col-form-label">
                        Name
                      </label>
                      <input type="text" readonly="yes" class="form-control col-md-9"
                             id="input-name" value="{name}"/>
                    </div>

                    <div class="form-group row">
                      <label for="input-word" class="col-sm-3 col-form-label">Word</label>
                      <textarea type="text" readonly="yes" class="form-control col-md-9"
                                id="input-word" rows="2">
                        <xsl:value-of select="word" disable-output-escaping="yes"/>
                      </textarea>
                    </div>

                    <xsl:for-each select="regions/region">
                      <div class="form-group row">
                        <label for="region-{position()}" class="col-sm-3 col-form-label">
                          Region
                          <xsl:value-of select="position()"/>
                        </label>
                        <input type="text" readonly="yes" class="form-control col-md-9"
                               id="region-{position()}" value="{text()}"/>
                      </div>
                    </xsl:for-each>

                    <div class="form-group row">
                      <label for="input-allegiances" class="col-sm-3 col-form-label">Allegiances</label>
                      <textarea type="text" readonly="yes" class="form-control col-md-9"
                                id="input-allegiances" rows="5">
                        <xsl:value-of select="allegiances" disable-output-escaping="yes"/>
                      </textarea>
                    </div>

                    <div class="form-group row">
                      <label for="input-quote" class="col-sm-3 col-form-label">Quote</label>
                      <textarea type="text" readonly="yes" class="form-control col-md-9"
                                id="input-quote" rows="8">
                        <xsl:value-of select="quote" disable-output-escaping="yes"/>
                      </textarea>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </body>
        </html>

      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
