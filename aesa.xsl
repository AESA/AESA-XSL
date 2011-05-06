<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" indent="yes"/>
	<!--Inicio de la plantilla-->
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="/AESA/head-only">
				<xsl:call-template name="head"/>
			</xsl:when>
			<xsl:when test="/AESA/body-only">
				<xsl:call-template name="body"/>
			</xsl:when>		
			<xsl:otherwise>			
				<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
					<head>
						<xsl:call-template name="head"/>
					</head>
    			<xsl:element name="body">
    			  <xsl:attribute name="id">body</xsl:attribute>
    				<xsl:if test="/AESA/javascripts/body/@onload">
    					<xsl:attribute name="onload"><xsl:value-of select="/AESA/javascripts/body/@onload"/></xsl:attribute>
    				</xsl:if>
    				<xsl:call-template name="body"/>
    			</xsl:element>					
				</html>	
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--Fin de la plantilla-->
	<!--Plantilla head-->
	<xsl:template name="head">
		<title>Agencia Estatal de Seguridad Aérea</title>
		<link type="text/css" rel="stylesheet" href="http://s72v08-dgacmad.aviacion.fomento.es/web/css/reset.css"/>
		<link type="text/css" rel="stylesheet" href="http://s72v08-dgacmad.aviacion.fomento.es/web/css/text.css"/>
		<link type="text/css" rel="stylesheet" href="http://s72v08-dgacmad.aviacion.fomento.es/web/css/960.css"/>
		<link type="text/css" rel="stylesheet" href="http://s72v08-dgacmad.aviacion.fomento.es/web/css/main.css"/>
		<link type="text/css" rel="stylesheet" href="http://s72v08-dgacmad.aviacion.fomento.es/web/css/estilosAplicacion.css"/>
    <xsl:if test="/AESA/javascripts">
  		<xsl:for-each select="AESA/javascripts/javascript">
  			<xsl:element name="script">
  			  <xsl:attribute name="type">text/javascript</xsl:attribute>
  				<xsl:if test="@src">
  					<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
  				</xsl:if>
  				<xsl:if test="@charset">
  					<xsl:attribute name="charset"><xsl:value-of select="@charset"/></xsl:attribute>
  				</xsl:if>
  				<xsl:if test="text()">
  					<xsl:attribute name="language">javascript</xsl:attribute>
  				</xsl:if>
  				<xsl:copy-of select="text()"/>
  			</xsl:element>
  		</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!--FIN Plantilla head-->	
	<!--Plantilla body-->
	<xsl:template name="body">
    <div class="container_12" id="contenedor_idiomas">
      <xsl:call-template name="contenedor_idiomas"/>
    	<div class="clear"></div>
    </div>   
    
    <div class="container_12" id="contenedor_cabecera">  
      <xsl:call-template name="contenedor_cabecera"/>
      <div class="clear"></div>
    </div>
    
    <div class="container_12" id="contenedor_subcabecera">
      <xsl:call-template name="contenedor_subcabecera"/>
  	  <div class="clear"></div>  	  
    </div>    
    
    <div class="container_12" id="contenedor_principal">
      <xsl:call-template name="contenedor_principal"/>
    	<div class="clear"></div>
    </div>
    
    <div class="container_12" id="contenedor_pie">
      <xsl:call-template name="contenedor_pie"/>
    	<div class="clear"></div>
    </div>
	</xsl:template>
	<!--FIN Plantilla body-->	
	<!--Plantilla contenedor_idiomas-->
	<xsl:template name="contenedor_idiomas">
    <div class="grid_12" id="idiomas">
      <xsl:call-template name="idiomas"/>
    </div>
	</xsl:template>
	<!--FIN Plantilla contenedor_idiomas-->
	<!--Plantilla contenedor_cabecera-->
	<xsl:template name="contenedor_cabecera">
  	<div class="grid_3">
      <xsl:call-template name="logoFomento"/>
  	</div>
  	<div class="grid_3">
      <xsl:call-template name="logoAesa"/>
  	</div>
  	<div class="grid_6" id="pestanyas_contenedor">
      <xsl:call-template name="pestanyas"/>
  	</div>
	</xsl:template>
	<!--FIN Plantilla contenedor_cabecera-->
	<!--Plantilla contenedor_subcabecera-->
	<xsl:template name="contenedor_subcabecera">
    <div id="subcabecera">
    </div>
    <div class="clear"></div>
    <div id="recursivo" class="grid_9">
      <xsl:call-template name="recursivo"/>
    </div>  
    <div id="buscar" class="grid_3">
      <xsl:call-template name="buscar"/>
    </div>
	</xsl:template>
	<!--FIN Plantilla contenedor_subcabecera-->
	<!--Plantilla contenedor_principal-->
	<xsl:template name="contenedor_principal">
  	<div class="grid_4" id="menu_opciones">
      <xsl:call-template name="menu_opciones"/>
  	</div>
  	<div class="grid_8">
      <div id="caminoMigas" class="grid_8 alpha omega">
        <xsl:call-template name="caminoMigas"/>
      </div>  
      <div class="clear"></div>       	 
      <div id="contenido" class="grid_8 alpha omega">
        <xsl:call-template name="contenido"/>  
      </div>
  	</div>
	</xsl:template>
	<!--FIN Plantilla contenedor_principal-->
	<!--Plantilla contenedor_pie-->
	<xsl:template name="contenedor_pie">
    <div id="opciones_pie" class="grid_6"> 
      <xsl:call-template name="opciones_pie"/>  
    </div>
    <div id="certificaciones" class="grid_4 prefix_2">
      <xsl:call-template name="certificaciones"/>  
    </div>
	</xsl:template>
	<!--FIN Plantilla contenedor_pie-->      	
	<!--Plantilla idiomas-->
	<xsl:template name="idiomas">
		<xsl:if test="/AESA/idiomas">
			<ul>
				<xsl:for-each select="AESA/idiomas/idioma">
					<xsl:element name="li">
						<xsl:if test="position()=1">
							<xsl:attribute name="class">primerElemento</xsl:attribute>
						</xsl:if>
						<xsl:element name="a">
							<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
							<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
							<xsl:if test="@class">
								<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
							</xsl:if>
							<xsl:value-of select="text()"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>
	<!--FIN Plantilla idiomas-->
	<!--Plantilla logoFomento-->
	<xsl:template name="logoFomento">
    <a  class="logoFomento" 
        href="" 
        title="Web del Ministerio de Fomento. Se abre en una ventana nueva"
  			target="_blank">
    </a>
	</xsl:template>
	<!--FIN Plantilla logoFomento-->
	<!--Plantilla logoAesa-->
	<xsl:template name="logoAesa">
		<a class="logoAesa" href="" title="Ir a la página de Inicio"></a>
	</xsl:template>
	<!--FIN Plantilla logoAesa-->	
	<!--Plantilla pestanyas-->
	<xsl:template name="pestanyas">
		<xsl:if test="/AESA/pestanyas">
			<div id="pestanyas">
				<xsl:for-each select="AESA/pestanyas/pestanya">
					<div>
						<xsl:element name="a">
							<xsl:attribute name="target">_self</xsl:attribute>	
							<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
							<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
							<xsl:if test="@class">
								<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
							</xsl:if>
							<xsl:value-of select="text()"/>
						</xsl:element>					
					</div>
				</xsl:for-each>
			</div>
		</xsl:if>
	</xsl:template>
	<!--FIN Plantilla pestanyas-->		
	<!--Plantilla recursivo-->
	<xsl:template name="recursivo">
		<xsl:if test="/AESA/recursivo">
			<ul>
				<xsl:for-each select="AESA/recursivo/opcion">
					<xsl:element name="li">
						<xsl:if test="position()=1">
							<xsl:attribute name="class">primerElemento</xsl:attribute>
						</xsl:if>
						<xsl:element name="a">
							<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>								
							<xsl:attribute name="target">_self</xsl:attribute>									
							<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>								
							<xsl:value-of select="text()"/>
						</xsl:element>
					</xsl:element>
				</xsl:for-each>
			</ul>
		</xsl:if>	
	</xsl:template>
	<!--FIN Plantilla recursivo-->
	<!--Plantilla buscar-->
	<xsl:template name="buscar">
		<form name="formulario" method="post" action="" id="formulario">
			<fieldset>
				<legend>Formulario para BUSCAR dentro de la web de AESA</legend>
				<label for="queryString">Buscar: </label>
				<input type="text" name="queryString" id="queryString" tabindex="1" class="txtBuscar" accesskey="B" value="Buscar"/>
				<input type="submit" tabindex="2" class="btBuscar" value="Buscar" id="Submit1" name="Submit1"/>
			</fieldset>
		</form>
	</xsl:template>
	<!--FIN Plantilla buscar-->	
	<!--Plantilla menu_opciones-->
	<xsl:template name="menu_opciones">
		<xsl:if test="/AESA/menu_opciones">
			<ul class="primer_nivel">
				<xsl:for-each select="AESA/menu_opciones/opcion">
					<xsl:element name="li">
						<xsl:element name="a">
							<xsl:if test="@class">
								<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
							</xsl:if>
							<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>								
							<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>	
							<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>																								
							<xsl:value-of select="text()"/>
						</xsl:element>
						<xsl:if test="opcion">
							<ul class="segundo_nivel">
								<xsl:for-each select="opcion">
									<xsl:element name="li">
										<xsl:element name="a">
											<xsl:if test="@class">
												<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
											</xsl:if>
											<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>								
											<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>	
											<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>																								
											<xsl:value-of select="text()"/>
										</xsl:element>

										<xsl:if test="opcion">
											<ul class="tercer_nivel">
												<xsl:for-each select="opcion">
													<xsl:element name="li">
														<xsl:element name="a">
															<xsl:if test="@class">
																<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
															</xsl:if>
															<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>								
															<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>	
															<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>																								
															<xsl:value-of select="text()"/>
														</xsl:element>
													</xsl:element>
												</xsl:for-each>
											</ul>
											<p class="clearBoth" />  	
										</xsl:if>	
                  </xsl:element>									
								</xsl:for-each>
							</ul>
							<p class="clearBoth" />  	
						</xsl:if>						
					</xsl:element>
				</xsl:for-each>
			</ul>
		</xsl:if>	
	</xsl:template>
	<!--FIN Plantilla menu_opciones-->
	<!--Plantilla camino_migas-->
	<xsl:template name="caminoMigas">
		<xsl:if test="/AESA/caminoMigas">
			<span>Está en: </span>
			<ul>
				<xsl:for-each select="AESA/caminoMigas/miga">
					<xsl:element name="li">
						<xsl:if test="position()=1">
							<xsl:attribute name="class">primerElemento</xsl:attribute>
						</xsl:if>
						<xsl:if test="position()!=last()">
							<xsl:element name="a">
								<xsl:attribute name="href"><xsl:value-of select="@href"/></xsl:attribute>
								<xsl:attribute name="target">_self</xsl:attribute>	
								<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
								<xsl:value-of select="text()"/>
							</xsl:element>
						</xsl:if>
						<xsl:if test="position()=last()">
							<xsl:value-of select="text()"/>
						</xsl:if>
					</xsl:element>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>
	<!--FIN Plantilla camino_migas-->
	<!--Plantilla contenido-->
	<xsl:template name="contenido">
		<xsl:copy-of select="AESA/contenido/div"/>
	</xsl:template>
	<!--FIN Plantilla contenido-->
	<!--Plantilla opciones_pie-->
	<xsl:template name="opciones_pie">
    <p>
      <ul>
        <li class="paginaInicio">
          <a href="" onclick="">Establecer AESA como página de inicio</a>
        </li>          
        <li class="correo">
          <a href="" title="Enviar correo a AESA" onclick="" onkeypress="">Contacto</a>
        </li>
      </ul>
    </p>
    <p>
      <ul class="letraMini">
        <li class="primerElemento">
          <a href="" target="_blank" title="Se abre en una ventana nueva">Accesibilidad web</a>
        </li>          
        <li>
          <a href="" target="_blank" title="Se abre en una ventana nueva">Usabilidad</a>
        </li>
        <li>
          <a href="" target="_blank" title="Se abre en una ventana nueva">Aviso Legal</a>
        </li>
      </ul>
    </p>
	</xsl:template>
	<!--FIN Plantilla opciones_pie-->
	<!--Plantilla certificaciones-->
	<xsl:template name="certificaciones">
    <p>
      <a href="http://jigsaw.w3.org/css-validator/" target="_blank" title="¡CSS Válido!Este enlace abre una ventana nueva">
        <img src="images/v3ccss.gif" alt="¡CSS Válido!"/>
      </a>
      <a href="http://validator.w3.org/check?uri=referer" target="_blank" title="¡Valid XHTML 1.0 Transitional!Este enlace abre una ventana nueva">
        <img src="images/w3cxhtml.gif" alt="Valid XHTML 1.0 Transitional"/>
      </a>
      <a href="http://www.w3.org/WAI/WCAG1AA-Conformance" target="_blank" title="WAI-AA">           
        <img src="images/w3c.gif" alt="WAI-AA"/>
      </a>
      <a href="" target="_self" title="RSS">
        <img src="images/ico_rss.gif" alt="RSS"/>
      </a>
    </p>
    <p class="letraMini">Seguridad Aérea</p>
	</xsl:template>
	<!--FIN Plantilla certificaciones-->
</xsl:stylesheet>
