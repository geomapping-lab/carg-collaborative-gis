-- =====================================================================
-- 04_layer_styles.sql — QGIS layer styles (QML) stored in the database
--
-- QGIS loads these styles automatically when the layers are added from
-- PostGIS (useasdefault = true). The WebGIS backend parses the styles of
-- 'vw_affiorante_join' and 'giaciture' to render the same symbology in
-- OpenLayers (endpoints /api/stili/affioranti and /api/stili/giaciture).
-- The same styles are also provided as .qml files in /styles.
--
-- Run as a superuser after 01_schema.sql.
-- =====================================================================

SET client_encoding = 'UTF8';
SET xmloption = content;

DELETE FROM public.layer_styles
 WHERE f_table_schema IN ('rilevamento', 'visualizzazione');

-- rilevamento.affiorante
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'affiorante', 'geom', 'stile_affiorante',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis autoRefreshMode="Disabled" autoRefreshTime="0" hasScaleBasedVisibilityFlag="0" labelsEnabled="1" layerType="Vector" maxScale="0" minScale="100000000" readOnly="0" simplifyAlgorithm="0" simplifyDrawingHints="1" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1" styleCategories="AllStyleCategories" symbologyReferenceScale="-1" version="4.0.0-Norrköping">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal accumulate="0" durationField="fid" durationUnit="min" enabled="0" endExpression="" endField="" fixedDuration="0" limitMode="0" mode="0" startExpression="" startField="">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation binding="Centroid" clamping="Terrain" customToleranceEnabled="0" extrusion="0" extrusionEnabled="0" respectLayerSymbol="1" showMarkerSymbolInSurfacePlots="0" symbology="Line" type="IndividualFeatures" zoffset="0" zscale="1">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="" type="line">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleLine" enabled="1" id="{df2a4c8e-5d38-49fe-aec7-a39d0294a6a8}" locked="0" pass="0">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="190,207,80,255,rgb:0.7450981,0.8117647,0.3137255,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{08f0dec6-2fab-4fa2-8e7d-42938001401c}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="190,207,80,255,rgb:0.7450981,0.8117647,0.3137255,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="136,148,57,255,rgb:0.5322194,0.5798275,0.224094,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="" type="marker">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleMarker" enabled="1" id="{15facb7a-f8da-4342-b391-06bdb302bafe}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="190,207,80,255,rgb:0.7450981,0.8117647,0.3137255,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="136,148,57,255,rgb:0.5322194,0.5798275,0.224094,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 attr="verbania_sigle_codice_carg" enableorderby="0" forceraster="0" referencescale="-1" symbollevels="0" type="categorizedSymbol">
  <categories>
   <category label="" render="true" symbol="0" type="NULL" uuid="{bfff972e-11eb-41ad-9fad-9038c87e03b3}" value="NULL"/>
   <category label="Morfologia" render="true" symbol="1" type="string" uuid="{a5d5c80c-cd79-4d9e-8130-c2ee79634991}" value="012130"/>
   <category label="Frana" render="true" symbol="2" type="string" uuid="{d9dcf073-39c6-4a69-86ae-cd8c03003e43}" value="032140"/>
   <category label="Dubbio-altro" render="true" symbol="3" type="string" uuid="{bf063aba-6a58-4031-9ef3-256b043b7ae8}" value="093537"/>
   <category label="Flysch del Varesotto" render="true" symbol="4" type="string" uuid="{d31354d5-ee13-4b3c-83df-554747fce540}" value="212140"/>
   <category label="Scaglia Rossa" render="true" symbol="5" type="string" uuid="{01919052-6a5f-42d0-ba8d-b84d3570dc62}" value="372120"/>
   <category label="Sass de la Luna" render="true" symbol="6" type="string" uuid="{92a85748-aab1-44fe-8966-b514b53bd10a}" value="382130"/>
   <category label="Maiolica" render="true" symbol="7" type="string" uuid="{0a2c7468-7fbc-4f9c-a0c9-cc4b075fe8d5}" value="392120"/>
   <category label="Radiolariti del Selcifero Lombardo" render="true" symbol="8" type="string" uuid="{bb86a62d-1ab5-4ed4-ab3a-6b01960ebdb0}" value="402130"/>
   <category label="Gruppo del Selcifero Lombardo" render="true" symbol="9" type="string" uuid="{294ed6ff-97bf-41fa-a789-11dcad72ac58}" value="402150"/>
   <category label="Formazione di Val Maggiore" render="true" symbol="10" type="string" uuid="{95e66e21-8f51-4d81-8cc5-752395c37122}" value="442120"/>
   <category label="Calcare di Domaro" render="true" symbol="11" type="string" uuid="{d5246983-d034-40f5-a02f-c29f97d23428}" value="452130"/>
   <category label="Calcare di Moltrasio" render="true" symbol="12" type="string" uuid="{08860038-dfe6-46b9-8312-914368b36333}" value="472150"/>
   <category label="Calcare di Alpe Perino" render="true" symbol="13" type="string" uuid="{331c751e-3e33-4cb5-9156-abca046f9627}" value="482130"/>
   <category label="Formazione dell'Albenza" render="true" symbol="14" type="string" uuid="{737bf848-2505-4d16-b2b2-c94b88835aaf}" value="482140"/>
   <category label="Calcare di Zu" render="true" symbol="15" type="string" uuid="{a84fb791-3899-4282-81ea-fba2accb5a2e}" value="502130"/>
   <category label="Dolomia Principale" render="true" symbol="16" type="string" uuid="{b51a25ab-a008-4d34-b838-03bb21c9899e}" value="502150"/>
   <category label="Marna del Pizzella" render="true" symbol="17" type="string" uuid="{0cd370ed-df41-4fe7-8580-3e0d67616bdd}" value="522150"/>
   <category label="Formazione di Cunardo" render="true" symbol="18" type="string" uuid="{152eb693-fee8-4b55-b812-dac3fca2d9dd}" value="532130"/>
   <category label="Dolomia di San Salvatore" render="true" symbol="19" type="string" uuid="{e78debdd-911d-4b2d-8d68-e3b1c846fe68}" value="532150"/>
   <category label="Formazione di Bellano" render="true" symbol="20" type="string" uuid="{3c6f31d5-a4b7-4269-86e4-29d2f507aefa}" value="542150"/>
   <category label="Livelli-particolari" render="true" symbol="21" type="string" uuid="{a17b39e7-99a7-443d-879d-4e5a5d2eb841}" value="623226"/>
  </categories>
  <symbols>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="0" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{1fc2c1c0-4dee-4a4e-ad53-73a4bb408d0b}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="139,255,0,255,hsv:0.24277777969837189,1,1,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="255,0,242,255,hsv:0.84166663885116577,1,1,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="fillColor" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="legenda_colore_hex"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="1" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{610c8145-1861-487a-aa23-236cb3c08197}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="245,250,250,255,rgb:0.9607843,0.9803922,0.9803922,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="PointPatternFill" enabled="1" id="{720d3a81-a255-4e0e-beb7-9aca5c8c58d8}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="double" value="0"/>
      <Option name="clip_mode" type="QString" value="shape"/>
      <Option name="coordinate_reference" type="QString" value="feature"/>
      <Option name="displacement_x" type="QString" value="0"/>
      <Option name="displacement_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_x_unit" type="QString" value="MM"/>
      <Option name="displacement_y" type="QString" value="0"/>
      <Option name="displacement_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_y_unit" type="QString" value="MM"/>
      <Option name="distance_x" type="QString" value="5.5"/>
      <Option name="distance_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_x_unit" type="QString" value="MM"/>
      <Option name="distance_y" type="QString" value="5"/>
      <Option name="distance_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_y_unit" type="QString" value="MM"/>
      <Option name="offset_x" type="QString" value="0"/>
      <Option name="offset_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_x_unit" type="QString" value="MM"/>
      <Option name="offset_y" type="QString" value="0"/>
      <Option name="offset_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_y_unit" type="QString" value="MM"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="random_deviation_x" type="QString" value="0"/>
      <Option name="random_deviation_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_x_unit" type="QString" value="MM"/>
      <Option name="random_deviation_y" type="QString" value="0"/>
      <Option name="random_deviation_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_y_unit" type="QString" value="MM"/>
      <Option name="seed" type="QString" value="828920298"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="@1@1" type="marker">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer class="EllipseMarker" enabled="1" id="{9d6ad936-691a-4e15-b125-d405e77d0f4c}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="310"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="2.29999999999999982,1.5"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="rectangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" id="{48d1004d-1aeb-42d1-97b4-78fbe4ff226b}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="340"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="1.80000000000000004,1.5"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="rectangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" id="{ca10ac4c-19ea-4d57-bb14-f7601d3ed60b}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="190"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="2,2"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="rectangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" id="{f67188d0-bd39-4d42-885e-962e2ba48b08}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="230"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="2,2"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="rectangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" id="{806f096c-0c0a-4f6e-8dc8-31d362739219}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="35"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="rectangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="10" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="228,243,248,255,rgb:0.8941177,0.9529412,0.972549,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="11" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="183,223,234,255,rgb:0.7176471,0.8745098,0.9176471,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="12" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="0,157,204,255,rgb:0,0.6156863,0.8,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="13" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="138,178,223,255,rgb:0.5411765,0.6980392,0.8745098,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="14" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="74,149,209,255,rgb:0.2901961,0.5843138,0.8196079,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="15" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="235,216,235,255,rgb:0.9215686,0.8470588,0.9215686,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="16" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="218,176,211,255,rgb:0.854902,0.6901961,0.827451,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="17" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="221,92,157,252,rgb:0.8666667,0.3607843,0.6156863,0.9882353"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="18" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="200,156,200,253,rgb:0.7843137,0.6117647,0.7843137,0.9921569"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="19" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="155,51,138,253,rgb:0.6078432,0.2,0.5411765,0.9921569"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="2" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7d08982c-79af-46bb-9e8f-7d4d14396095}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="0,0,255,255,rgb:0,0,1,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="no"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="PointPatternFill" enabled="1" id="{1ff270fb-55c4-4c51-93b8-7e27f7ee4922}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="double" value="0"/>
      <Option name="clip_mode" type="QString" value="shape"/>
      <Option name="coordinate_reference" type="QString" value="feature"/>
      <Option name="displacement_x" type="QString" value="0"/>
      <Option name="displacement_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_x_unit" type="QString" value="MM"/>
      <Option name="displacement_y" type="QString" value="0"/>
      <Option name="displacement_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_y_unit" type="QString" value="MM"/>
      <Option name="distance_x" type="QString" value="3"/>
      <Option name="distance_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_x_unit" type="QString" value="MM"/>
      <Option name="distance_y" type="QString" value="3"/>
      <Option name="distance_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_y_unit" type="QString" value="MM"/>
      <Option name="offset_x" type="QString" value="1.5"/>
      <Option name="offset_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_x_unit" type="QString" value="MM"/>
      <Option name="offset_y" type="QString" value="1.5"/>
      <Option name="offset_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_y_unit" type="QString" value="MM"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="random_deviation_x" type="QString" value="0"/>
      <Option name="random_deviation_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_x_unit" type="QString" value="MM"/>
      <Option name="random_deviation_y" type="QString" value="0"/>
      <Option name="random_deviation_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_y_unit" type="QString" value="MM"/>
      <Option name="seed" type="QString" value="563004444"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="0.7" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="@2@1" type="marker">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer class="SvgMarker" enabled="1" id="{6fc085b3-5cb9-4d3c-a3bb-b32a6e9a5d40}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="fixedAspectRatio" type="QString" value="0"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo="/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="outline_width" type="QString" value="0.1"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="parameters"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.923077"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties" type="Map">
          <Option name="angle" type="Map">
           <Option name="active" type="bool" value="true"/>
           <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-180"/>
           <Option name="type" type="int" value="3"/>
          </Option>
         </Option>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer class="PointPatternFill" enabled="1" id="{79999146-be7b-43e9-acaf-64c28f38413f}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="double" value="0"/>
      <Option name="clip_mode" type="QString" value="shape"/>
      <Option name="coordinate_reference" type="QString" value="feature"/>
      <Option name="displacement_x" type="QString" value="0"/>
      <Option name="displacement_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_x_unit" type="QString" value="MM"/>
      <Option name="displacement_y" type="QString" value="0"/>
      <Option name="displacement_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="displacement_y_unit" type="QString" value="MM"/>
      <Option name="distance_x" type="QString" value="3"/>
      <Option name="distance_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_x_unit" type="QString" value="MM"/>
      <Option name="distance_y" type="QString" value="3"/>
      <Option name="distance_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_y_unit" type="QString" value="MM"/>
      <Option name="offset_x" type="QString" value="0"/>
      <Option name="offset_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_x_unit" type="QString" value="MM"/>
      <Option name="offset_y" type="QString" value="0"/>
      <Option name="offset_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_y_unit" type="QString" value="MM"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="random_deviation_x" type="QString" value="0"/>
      <Option name="random_deviation_x_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_x_unit" type="QString" value="MM"/>
      <Option name="random_deviation_y" type="QString" value="0"/>
      <Option name="random_deviation_y_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="random_deviation_y_unit" type="QString" value="MM"/>
      <Option name="seed" type="QString" value="809623942"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="0.7" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="@2@2" type="marker">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer class="SvgMarker" enabled="1" id="{98aefe80-c2b3-40cd-a993-79e08c430c64}" locked="0" pass="0">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="fixedAspectRatio" type="QString" value="0"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo="/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.509804,0.7921569,1"/>
        <Option name="outline_width" type="QString" value="0.1"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="parameters"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.92308"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties" type="Map">
          <Option name="angle" type="Map">
           <Option name="active" type="bool" value="true"/>
           <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-180"/>
           <Option name="type" type="int" value="3"/>
          </Option>
         </Option>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="20" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="170,152,201,255,rgb:0.6666667,0.5960785,0.7882353,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="21" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{65a662d4-d14c-40f2-9a7e-0cc2bdd64f48}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="229,229,214,255,rgb:0.8980392,0.8980392,0.8392157,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="LinePatternFill" enabled="1" id="{837135dd-a3da-40b4-a594-63efa582e2b3}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="clip_mode" type="QString" value="during_render"/>
      <Option name="color" type="QString" value="229,229,214,255,rgb:0.8980392,0.8980392,0.8392157,1"/>
      <Option name="coordinate_reference" type="QString" value="feature"/>
      <Option name="distance" type="QString" value="1.2"/>
      <Option name="distance_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_unit" type="QString" value="MM"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="@21@1" type="line">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer class="SimpleLine" enabled="1" id="{5012e351-5e53-4d3c-a26e-99df2d3c5f69}" locked="0" pass="0">
       <Option type="Map">
        <Option name="align_dash_pattern" type="QString" value="0"/>
        <Option name="capstyle" type="QString" value="square"/>
        <Option name="customdash" type="QString" value="5;2"/>
        <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="customdash_unit" type="QString" value="MM"/>
        <Option name="dash_pattern_offset" type="QString" value="0"/>
        <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
        <Option name="draw_inside_polygon" type="QString" value="0"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="line_color" type="QString" value="167,89,40,255,rgb:0.654902,0.3490196,0.1568628,1"/>
        <Option name="line_style" type="QString" value="solid"/>
        <Option name="line_width" type="QString" value="0.1"/>
        <Option name="line_width_unit" type="QString" value="MM"/>
        <Option name="offset" type="QString" value="0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="ring_filter" type="QString" value="0"/>
        <Option name="trim_distance_end" type="QString" value="0"/>
        <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="trim_distance_end_unit" type="QString" value="MM"/>
        <Option name="trim_distance_start" type="QString" value="0"/>
        <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="trim_distance_start_unit" type="QString" value="MM"/>
        <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
        <Option name="use_custom_dash" type="QString" value="0"/>
        <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="3" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{2393d5f0-caa7-485c-b61e-43ef8598fc68}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="255,245,227,255,rgb:1,0.9607843,0.8901961,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="LinePatternFill" enabled="1" id="{100bd06c-181f-43fd-8c8c-e248c3bd32e6}" locked="0" pass="0">
     <Option type="Map">
      <Option name="angle" type="QString" value="135"/>
      <Option name="clip_mode" type="QString" value="during_render"/>
      <Option name="color" type="QString" value="255,241,216,255,rgb:1,0.945098,0.8470588,1"/>
      <Option name="coordinate_reference" type="QString" value="feature"/>
      <Option name="distance" type="QString" value="1.2"/>
      <Option name="distance_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="distance_unit" type="QString" value="MM"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="@3@1" type="line">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer class="SimpleLine" enabled="1" id="{fcaa78da-0688-4138-a1d1-9e4123ce2f49}" locked="0" pass="0">
       <Option type="Map">
        <Option name="align_dash_pattern" type="QString" value="0"/>
        <Option name="capstyle" type="QString" value="square"/>
        <Option name="customdash" type="QString" value="5;2"/>
        <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="customdash_unit" type="QString" value="MM"/>
        <Option name="dash_pattern_offset" type="QString" value="0"/>
        <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
        <Option name="draw_inside_polygon" type="QString" value="0"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="line_color" type="QString" value="246,50,62,255,rgb:0.9647059,0.1960784,0.2431373,1"/>
        <Option name="line_style" type="QString" value="solid"/>
        <Option name="line_width" type="QString" value="0.1"/>
        <Option name="line_width_unit" type="QString" value="MM"/>
        <Option name="offset" type="QString" value="0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="ring_filter" type="QString" value="0"/>
        <Option name="trim_distance_end" type="QString" value="0"/>
        <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="trim_distance_end_unit" type="QString" value="MM"/>
        <Option name="trim_distance_start" type="QString" value="0"/>
        <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="trim_distance_start_unit" type="QString" value="MM"/>
        <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
        <Option name="use_custom_dash" type="QString" value="0"/>
        <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="4" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{01b1d498-75c1-4938-9efd-abd288b8273d}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="246,203,94,255,rgb:0.9647059,0.7960784,0.3686275,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="5" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="219,226,188,255,rgb:0.8588235,0.8862745,0.7372549,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="6" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="200,221,154,255,rgb:0.7843137,0.8666667,0.6039216,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="7" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="219,234,209,255,rgb:0.8588235,0.9176471,0.8196079,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="8" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="168,203,148,255,rgb:0.6588235,0.7960784,0.5803922,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="9" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{7ce9b879-baa8-450d-8235-b151e26076fd}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="49,156,49,255,rgb:0.1921569,0.6117647,0.1921569,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <source-symbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="0" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{3a50faf2-f9e9-4722-b962-7ff02cea5f63}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="218,44,50,255,hsv:0.99444442987442017,0.79607844352722168,0.85490196943283081,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="fillColor" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="legenda_colore_hex"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </source-symbol>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="" type="fill">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" id="{f3c88602-ae15-453b-b0c5-48adf435b152}" locked="0" pass="0">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="0,0,255,255,rgb:0,0,1,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.26"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <labeling type="rule-based">
  <rules key="{848dc4fe-daa0-45b3-8fa6-87fd8a88781d}">
   <rule key="{2d1f1918-371c-4c58-a8bf-27d595e09068}">
    <settings calloutType="simple">
     <text-style allowHtml="0" blendMode="0" capitalization="0" fieldName="descrizione" fontFamily="Open Sans" fontItalic="0" fontKerning="1" fontLetterSpacing="0" fontSize="10" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="Point" fontStrikeout="0" fontUnderline="0" fontWeight="400" fontWordSpacing="0" forcedBold="0" forcedItalic="0" isExpression="0" legendString="Aa" multilineHeight="1" multilineHeightUnit="Percentage" namedStyle="Regular" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" stretchFactor="100" tabStopDistance="80" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" tabStopDistanceUnit="Point" textColor="50,50,50,255,rgb:0.1960784,0.1960784,0.1960784,1" textOpacity="1" textOrientation="horizontal" useSubstitutions="1">
      <families/>
      <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.9803922,0.9803922,0.9803922,1" bufferDraw="1" bufferJoinStyle="128" bufferNoFill="1" bufferOpacity="1" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSizeUnits="MM"/>
      <text-mask maskEnabled="0" maskJoinStyle="128" maskOpacity="1" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskType="0" maskedSymbolLayers=""/>
      <background shapeBlendMode="0" shapeBorderColor="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" shapeBorderWidth="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="Point" shapeDraw="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="Point" shapeOffsetX="0" shapeOffsetY="0" shapeOpacity="1" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeRadiiX="0" shapeRadiiY="0" shapeRotation="0" shapeRotationType="0" shapeSVGFile="" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeSizeUnit="Point" shapeSizeX="0" shapeSizeY="0" shapeType="0">
       <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="markerSymbol" type="marker">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" enabled="1" id="" locked="0" pass="0">
         <Option type="Map">
          <Option name="angle" type="QString" value="0"/>
          <Option name="cap_style" type="QString" value="square"/>
          <Option name="color" type="QString" value="225,89,137,255,rgb:0.8823529,0.3490196,0.5372549,1"/>
          <Option name="horizontal_anchor_point" type="QString" value="1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="name" type="QString" value="circle"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
          <Option name="outline_style" type="QString" value="solid"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="outline_width_unit" type="QString" value="MM"/>
          <Option name="scale_method" type="QString" value="diameter"/>
          <Option name="size" type="QString" value="2"/>
          <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="size_unit" type="QString" value="MM"/>
          <Option name="vertical_anchor_point" type="QString" value="1"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
       <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="fillSymbol" type="fill">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleFill" enabled="1" id="" locked="0" pass="0">
         <Option type="Map">
          <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="color" type="QString" value="255,255,255,255,rgb:1,1,1,1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1"/>
          <Option name="outline_style" type="QString" value="no"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_unit" type="QString" value="Point"/>
          <Option name="style" type="QString" value="solid"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
      </background>
      <shadow shadowBlendMode="6" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowScale="100" shadowUnder="0"/>
      <dd_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </dd_properties>
      <substitutions/>
     </text-style>
     <text-format addDirectionSymbol="0" autoWrapLength="30" decimals="3" formatNumbers="0" leftDirectionSymbol="&lt;" multilineAlign="3" placeDirectionSymbol="0" plussign="0" reverseDirectionSymbol="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" wrapChar=""/>
     <placement allowDegraded="0" centroidInside="0" centroidWhole="0" dist="0" distMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" fitInPolygonOnly="0" geometryGenerator="" geometryGeneratorEnabled="0" geometryGeneratorType="PointGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" layerType="PolygonGeometry" lineAnchorClipping="0" lineAnchorPercent="0.5" lineAnchorTextPoint="FollowPlacement" lineAnchorType="0" maxCurvedCharAngleIn="25" maxCurvedCharAngleOut="-25" maximumDistance="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" maximumDistanceUnit="MM" multipartBehavior="LabelLargestPartOnly" offsetType="0" offsetUnits="MM" overlapHandling="PreventOverlap" overrunDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceUnit="MM" placement="0" placementFlags="10" polygonPlacementFlags="2" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" prioritization="PreferCloser" priority="5" quadOffset="4" repeatDistance="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" rotationAngle="0" rotationUnit="AngleDegrees" xOffset="0" yOffset="0"/>
     <rendering drawLabels="1" fontLimitPixelSize="0" fontMaxPixelSize="10000" fontMinPixelSize="3" limitNumLabels="0" maxNumLabels="2000" mergeLines="0" minFeatureSize="0" obstacle="1" obstacleFactor="1" obstacleType="1" scaleMax="5000" scaleMin="0" scaleVisibility="1" unplacedVisibility="0" upsidedownLabels="0" zIndex="0"/>
     <dd_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </dd_properties>
     <callout type="simple">
      <Option type="Map">
       <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
       <Option name="blendMode" type="int" value="0"/>
       <Option name="ddProperties" type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
       <Option name="drawToAllParts" type="bool" value="false"/>
       <Option name="enabled" type="QString" value="0"/>
       <Option name="labelAnchorPoint" type="QString" value="point_on_exterior"/>
       <Option name="lineSymbol" type="QString" value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; type=&quot;line&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; id=&quot;{4d95d5b6-801b-48f6-9646-0196592cbe44}&quot; locked=&quot;0&quot; pass=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;capstyle&quot; type=&quot;QString&quot; value=&quot;square&quot;/>&lt;Option name=&quot;customdash&quot; type=&quot;QString&quot; value=&quot;5;2&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;customdash_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;joinstyle&quot; type=&quot;QString&quot; value=&quot;bevel&quot;/>&lt;Option name=&quot;line_color&quot; type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.2352941,0.2352941,0.2352941,1&quot;/>&lt;Option name=&quot;line_style&quot; type=&quot;QString&quot; value=&quot;solid&quot;/>&lt;Option name=&quot;line_width&quot; type=&quot;QString&quot; value=&quot;0.3&quot;/>&lt;Option name=&quot;line_width_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;ring_filter&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;trim_distance_start&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;use_custom_dash&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
       <Option name="minLength" type="double" value="0"/>
       <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="minLengthUnit" type="QString" value="MM"/>
       <Option name="offsetFromAnchor" type="double" value="0"/>
       <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
       <Option name="offsetFromLabel" type="double" value="0"/>
       <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
      </Option>
     </callout>
    </settings>
   </rule>
   <rule key="{19a9df98-9a39-440f-a621-993947195c41}">
    <settings calloutType="simple">
     <text-style allowHtml="0" blendMode="0" capitalization="0" fieldName="sigla" fontFamily="Helvetica" fontItalic="0" fontKerning="1" fontLetterSpacing="0" fontSize="9" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSizeUnit="RenderMetersInMapUnits" fontStrikeout="0" fontUnderline="0" fontWeight="700" fontWordSpacing="0" forcedBold="0" forcedItalic="0" isExpression="0" legendString="Aa" multilineHeight="1" multilineHeightUnit="Percentage" namedStyle="Bold" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" stretchFactor="100" tabStopDistance="80" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" tabStopDistanceUnit="Point" textColor="50,50,50,255,rgb:0.1960784,0.1960784,0.1960784,1" textOpacity="0.80000000000000004" textOrientation="horizontal" useSubstitutions="0">
      <families/>
      <text-buffer bufferBlendMode="0" bufferColor="250,250,250,255,rgb:0.9803922,0.9803922,0.9803922,1" bufferDraw="0" bufferJoinStyle="128" bufferNoFill="1" bufferOpacity="1" bufferSize="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSizeUnits="MM"/>
      <text-mask maskEnabled="0" maskJoinStyle="128" maskOpacity="1" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskSizeUnits="MM" maskType="0" maskedSymbolLayers=""/>
      <background shapeBlendMode="0" shapeBorderColor="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" shapeBorderWidth="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="Point" shapeDraw="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="Point" shapeOffsetX="0" shapeOffsetY="0" shapeOpacity="1" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="Point" shapeRadiiX="0" shapeRadiiY="0" shapeRotation="0" shapeRotationType="0" shapeSVGFile="" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeSizeUnit="Point" shapeSizeX="0" shapeSizeY="0" shapeType="0">
       <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="markerSymbol" type="marker">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" enabled="1" id="" locked="0" pass="0">
         <Option type="Map">
          <Option name="angle" type="QString" value="0"/>
          <Option name="cap_style" type="QString" value="square"/>
          <Option name="color" type="QString" value="243,166,178,255,rgb:0.9529412,0.6509804,0.6980392,1"/>
          <Option name="horizontal_anchor_point" type="QString" value="1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="name" type="QString" value="circle"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
          <Option name="outline_style" type="QString" value="solid"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="outline_width_unit" type="QString" value="MM"/>
          <Option name="scale_method" type="QString" value="diameter"/>
          <Option name="size" type="QString" value="2"/>
          <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="size_unit" type="QString" value="MM"/>
          <Option name="vertical_anchor_point" type="QString" value="1"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
       <symbol alpha="1" clip_to_extent="1" force_rhr="0" frame_rate="10" is_animated="0" name="fillSymbol" type="fill">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleFill" enabled="1" id="" locked="0" pass="0">
         <Option type="Map">
          <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="color" type="QString" value="255,255,255,255,rgb:1,1,1,1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1"/>
          <Option name="outline_style" type="QString" value="no"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_unit" type="QString" value="Point"/>
          <Option name="style" type="QString" value="solid"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
      </background>
      <shadow shadowBlendMode="6" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowDraw="0" shadowOffsetAngle="135" shadowOffsetDist="1" shadowOffsetGlobal="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOpacity="0.69999999999999996" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowScale="100" shadowUnder="0"/>
      <dd_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </dd_properties>
      <substitutions/>
     </text-style>
     <text-format addDirectionSymbol="0" autoWrapLength="0" decimals="3" formatNumbers="0" leftDirectionSymbol="&lt;" multilineAlign="3" placeDirectionSymbol="0" plussign="0" reverseDirectionSymbol="0" rightDirectionSymbol=">" useMaxLineLengthForAutoWrap="1" wrapChar=""/>
     <placement allowDegraded="0" allowDuplicateRemoval="1" centroidInside="1" centroidWhole="1" dist="0" distMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" fitInPolygonOnly="0" geometryGenerator="" geometryGeneratorEnabled="0" geometryGeneratorType="PointGeometry" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" layerType="PolygonGeometry" lineAnchorClipping="0" lineAnchorPercent="0.5" lineAnchorTextPoint="FollowPlacement" lineAnchorType="0" maxCurvedCharAngleIn="25" maxCurvedCharAngleOut="-25" maximumDistance="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" maximumDistanceUnit="MM" multipartBehavior="LabelLargestPartOnly" offsetType="0" offsetUnits="MM" overlapHandling="PreventOverlap" overrunDistance="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceUnit="MM" placement="0" placementFlags="10" polygonPlacementFlags="2" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1" prioritization="PreferCloser" priority="5" quadOffset="4" repeatDistance="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" rotationAngle="0" rotationUnit="AngleDegrees" xOffset="0" yOffset="0"/>
     <rendering drawLabels="1" fontLimitPixelSize="0" fontMaxPixelSize="10000" fontMinPixelSize="3" limitNumLabels="0" maxNumLabels="2000" mergeLines="0" minFeatureSize="0" obstacle="1" obstacleFactor="1" obstacleType="1" scaleMax="10000" scaleMin="0" scaleVisibility="1" unplacedVisibility="0" upsidedownLabels="0" zIndex="0"/>
     <dd_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </dd_properties>
     <callout type="simple">
      <Option type="Map">
       <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
       <Option name="blendMode" type="int" value="0"/>
       <Option name="ddProperties" type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
       <Option name="drawToAllParts" type="bool" value="false"/>
       <Option name="enabled" type="QString" value="0"/>
       <Option name="labelAnchorPoint" type="QString" value="point_on_exterior"/>
       <Option name="lineSymbol" type="QString" value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; is_animated=&quot;0&quot; name=&quot;symbol&quot; type=&quot;line&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; id=&quot;{c5a59d1d-f640-4fd7-8edb-9c27786dc3e8}&quot; locked=&quot;0&quot; pass=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;capstyle&quot; type=&quot;QString&quot; value=&quot;square&quot;/>&lt;Option name=&quot;customdash&quot; type=&quot;QString&quot; value=&quot;5;2&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;customdash_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;joinstyle&quot; type=&quot;QString&quot; value=&quot;bevel&quot;/>&lt;Option name=&quot;line_color&quot; type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.2352941,0.2352941,0.2352941,1&quot;/>&lt;Option name=&quot;line_style&quot; type=&quot;QString&quot; value=&quot;solid&quot;/>&lt;Option name=&quot;line_width&quot; type=&quot;QString&quot; value=&quot;0.3&quot;/>&lt;Option name=&quot;line_width_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;ring_filter&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;trim_distance_start&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;use_custom_dash&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
       <Option name="minLength" type="double" value="0"/>
       <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="minLengthUnit" type="QString" value="MM"/>
       <Option name="offsetFromAnchor" type="double" value="0"/>
       <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
       <Option name="offsetFromLabel" type="double" value="0"/>
       <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
      </Option>
     </callout>
    </settings>
   </rule>
  </rules>
 </labeling>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="dualview/previewExpressions" type="List">
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
   </Option>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>0.75</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration type="Map">
   <Option name="QgsGeometryGapCheck" type="Map">
    <Option name="allowedGapsBuffer" type="double" value="0"/>
    <Option name="allowedGapsEnabled" type="bool" value="false"/>
    <Option name="allowedGapsLayer" type="QString" value=""/>
   </Option>
  </checkConfiguration>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field configurationFlags="NoFlag" name="id">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="fid">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="sigla">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="Flysch del Varesotto" type="QString" value="FVS"/>
       </Option>
       <Option type="Map">
        <Option name="Scaglia Rossa" type="QString" value="SAA"/>
       </Option>
       <Option type="Map">
        <Option name="Sass de la Luna" type="QString" value="SDL"/>
       </Option>
       <Option type="Map">
        <Option name="Maiolica" type="QString" value="MAI"/>
       </Option>
       <Option type="Map">
        <Option name="Radiolariti del Selcifero Lombardo" type="QString" value="RSL"/>
       </Option>
       <Option type="Map">
        <Option name="Gruppo del Selcifero Lombardo" type="QString" value="SML"/>
       </Option>
       <Option type="Map">
        <Option name="Formazione di Val Maggiore" type="QString" value="VAM"/>
       </Option>
       <Option type="Map">
        <Option name="Calcare di Domaro" type="QString" value="DOM"/>
       </Option>
       <Option type="Map">
        <Option name="Calcare di Moltrasio" type="QString" value="MOT"/>
       </Option>
       <Option type="Map">
        <Option name="Calcare di Alpe Perino" type="QString" value="APX"/>
       </Option>
       <Option type="Map">
        <Option name="Formazione dell'Albenza" type="QString" value="ALZ"/>
       </Option>
       <Option type="Map">
        <Option name="Calcare di Zu" type="QString" value="ZUU"/>
       </Option>
       <Option type="Map">
        <Option name="Dolomia Principale" type="QString" value="DPR"/>
       </Option>
       <Option type="Map">
        <Option name="Marna del Pizzella" type="QString" value="PIZ"/>
       </Option>
       <Option type="Map">
        <Option name="Formazione di Cunardo" type="QString" value="CUN"/>
       </Option>
       <Option type="Map">
        <Option name="Dolomia di San Salvatore" type="QString" value="DSS"/>
       </Option>
       <Option type="Map">
        <Option name="Formazione di Bellano" type="QString" value="BLN"/>
       </Option>
       <Option type="Map">
        <Option name="Livelli-particolari" type="QString" value="WOW"/>
       </Option>
       <Option type="Map">
        <Option name="Dubbio-altro" type="QString" value="XYZ"/>
       </Option>
       <Option type="Map">
        <Option name="Morfologia" type="QString" value="UIN"/>
       </Option>
       <Option type="Map">
        <Option name="Frana" type="QString" value="UID"/>
       </Option>
       <Option type="Map">
        <Option name="&lt;NULL>" type="QString" value="{2839923C-8B7D-419E-B84B-CA2FE9B80EC7}"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="descrizione">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option name="IsMultiline" type="bool" value="false"/>
      <Option name="UseHtml" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="visibilita">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="affiorante" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="subaffiorante" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="a tratti" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="tele" type="QString" value="4"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="part">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="prevalente" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="frequente" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="alternanza" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="variabile tra altra lito" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="subordinata" type="QString" value="5"/>
       </Option>
       <Option type="Map">
        <Option name="intercalazioni" type="QString" value="6"/>
       </Option>
       <Option type="Map">
        <Option name="base" type="QString" value="7"/>
       </Option>
       <Option type="Map">
        <Option name="tetto" type="QString" value="8"/>
       </Option>
       <Option type="Map">
        <Option name="sporadico/scarso" type="QString" value="9"/>
       </Option>
       <Option type="Map">
        <Option name="filone" type="QString" value="10"/>
       </Option>
       <Option type="Map">
        <Option name="olistoliti" type="QString" value="11"/>
       </Option>
       <Option type="Map">
        <Option name="non applicabile" type="QString" value="12"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="stratif">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="strati sottili (3÷10cm)" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="strati sottili - medi" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="strati sottili - medi - spessi e molto spessi" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="strati sottili / indistinti" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="strati sottili - medi - spessi e molto spessi / indistinti" type="QString" value="5"/>
       </Option>
       <Option type="Map">
        <Option name="strati medi (10÷30cm)" type="QString" value="6"/>
       </Option>
       <Option type="Map">
        <Option name="strati medi - spessi e molto spessi" type="QString" value="7"/>
       </Option>
       <Option type="Map">
        <Option name="strati medi / indistinti" type="QString" value="8"/>
       </Option>
       <Option type="Map">
        <Option name="strati medi - spessi e molto spessi / indistinti" type="QString" value="9"/>
       </Option>
       <Option type="Map">
        <Option name="strati spessi (30÷100cm)" type="QString" value="10"/>
       </Option>
       <Option type="Map">
        <Option name="strati da molto spessi a estrem. spessi-banchi (100÷300cm; >300cm)" type="QString" value="11"/>
       </Option>
       <Option type="Map">
        <Option name="strati spessi e molto spessi" type="QString" value="12"/>
       </Option>
       <Option type="Map">
        <Option name="strati spessi e molto spessi / indistinti" type="QString" value="13"/>
       </Option>
       <Option type="Map">
        <Option name="massiva" type="QString" value="14"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="assetto">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="ammasso" type="QString" value="am"/>
       </Option>
       <Option type="Map">
        <Option name="anello" type="QString" value="an"/>
       </Option>
       <Option type="Map">
        <Option name="autobrecciato o autoclastico" type="QString" value="au"/>
       </Option>
       <Option type="Map">
        <Option name="bastione" type="QString" value="ba"/>
       </Option>
       <Option type="Map">
        <Option name="caotico" type="QString" value="ca"/>
       </Option>
       <Option type="Map">
        <Option name="colata" type="QString" value="cl"/>
       </Option>
       <Option type="Map">
        <Option name="cono" type="QString" value="cn"/>
       </Option>
       <Option type="Map">
        <Option name="a cuscino" type="QString" value="cu"/>
       </Option>
       <Option type="Map">
        <Option name="dicco" type="QString" value="di"/>
       </Option>
       <Option type="Map">
        <Option name="domo" type="QString" value="do"/>
       </Option>
       <Option type="Map">
        <Option name="filone" type="QString" value="fi"/>
       </Option>
       <Option type="Map">
        <Option name="laccolite" type="QString" value="la"/>
       </Option>
       <Option type="Map">
        <Option name="lenticolare" type="QString" value="le"/>
       </Option>
       <Option type="Map">
        <Option name="livello" type="QString" value="lv"/>
       </Option>
       <Option type="Map">
        <Option name="neck" type="QString" value="ne"/>
       </Option>
       <Option type="Map">
        <Option name="orizzonte" type="QString" value="or"/>
       </Option>
       <Option type="Map">
        <Option name="tabulare" type="QString" value="ta"/>
       </Option>
       <Option type="Map">
        <Option name="vena" type="QString" value="ve"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="caratter">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="fratturato" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="alterato" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="cataclasato" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="zeolitizzato" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="fratturazione concoide" type="QString" value="5"/>
       </Option>
       <Option type="Map">
        <Option name="fessurazione prismatica" type="QString" value="6"/>
       </Option>
       <Option type="Map">
        <Option name="poco cementato" type="QString" value="7"/>
       </Option>
       <Option type="Map">
        <Option name="moderatamente cementato" type="QString" value="8"/>
       </Option>
       <Option type="Map">
        <Option name="cementato" type="QString" value="9"/>
       </Option>
       <Option type="Map">
        <Option name="variamente cementato" type="QString" value="10"/>
       </Option>
       <Option type="Map">
        <Option name="poco saldato" type="QString" value="11"/>
       </Option>
       <Option type="Map">
        <Option name="moderatamente saldato" type="QString" value="12"/>
       </Option>
       <Option type="Map">
        <Option name="saldato" type="QString" value="13"/>
       </Option>
       <Option type="Map">
        <Option name="variamente saldato" type="QString" value="14"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="note">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option name="IsMultiline" type="bool" value="false"/>
      <Option name="UseHtml" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="data_ora">
   <editWidget type="DateTime">
    <config>
     <Option type="Map">
      <Option name="allow_null" type="bool" value="false"/>
      <Option name="calendar_popup" type="bool" value="false"/>
      <Option name="display_format" type="QString" value="yyyy-MM-dd HH:mm"/>
      <Option name="field_format" type="QString" value="yyyy-MM-dd HH:mm:ss"/>
      <Option name="field_format_overwrite" type="bool" value="false"/>
      <Option name="field_iso_format" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="created_at">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="updated_at">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="created_by">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="updated_by">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field configurationFlags="NoFlag" name="is_deleted">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="invalid"/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="invalid"/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" index="0" name=""/>
  <alias field="fid" index="1" name=""/>
  <alias field="sigla" index="2" name=""/>
  <alias field="descrizione" index="3" name=""/>
  <alias field="visibilita" index="4" name=""/>
  <alias field="part" index="5" name=""/>
  <alias field="stratif" index="6" name=""/>
  <alias field="assetto" index="7" name=""/>
  <alias field="caratter" index="8" name=""/>
  <alias field="note" index="9" name=""/>
  <alias field="data_ora" index="10" name=""/>
  <alias field="created_at" index="11" name=""/>
  <alias field="updated_at" index="12" name=""/>
  <alias field="created_by" index="13" name=""/>
  <alias field="updated_by" index="14" name=""/>
  <alias field="is_deleted" index="15" name="Da scartare"/>
 </aliases>
 <defaults>
  <default applyOnUpdate="0" expression="" field="id"/>
  <default applyOnUpdate="0" expression="" field="fid"/>
  <default applyOnUpdate="0" expression="" field="sigla"/>
  <default applyOnUpdate="0" expression="" field="descrizione"/>
  <default applyOnUpdate="0" expression="1" field="visibilita"/>
  <default applyOnUpdate="0" expression="" field="part"/>
  <default applyOnUpdate="0" expression="" field="stratif"/>
  <default applyOnUpdate="0" expression="" field="assetto"/>
  <default applyOnUpdate="0" expression="" field="caratter"/>
  <default applyOnUpdate="0" expression="" field="note"/>
  <default applyOnUpdate="0" expression="now()" field="data_ora"/>
  <default applyOnUpdate="0" expression="" field="created_at"/>
  <default applyOnUpdate="0" expression="" field="updated_at"/>
  <default applyOnUpdate="0" expression="" field="created_by"/>
  <default applyOnUpdate="0" expression="" field="updated_by"/>
  <default applyOnUpdate="0" expression="" field="is_deleted"/>
 </defaults>
 <constraints>
  <constraint constraints="3" exp_strength="0" field="id" notnull_strength="1" unique_strength="1"/>
  <constraint constraints="7" exp_strength="1" field="fid" notnull_strength="2" unique_strength="2"/>
  <constraint constraints="0" exp_strength="0" field="sigla" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="descrizione" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="visibilita" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="part" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="stratif" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="assetto" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="caratter" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="note" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="0" exp_strength="0" field="data_ora" notnull_strength="0" unique_strength="0"/>
  <constraint constraints="1" exp_strength="0" field="created_at" notnull_strength="1" unique_strength="0"/>
  <constraint constraints="1" exp_strength="0" field="updated_at" notnull_strength="1" unique_strength="0"/>
  <constraint constraints="1" exp_strength="0" field="created_by" notnull_strength="1" unique_strength="0"/>
  <constraint constraints="1" exp_strength="0" field="updated_by" notnull_strength="1" unique_strength="0"/>
  <constraint constraints="1" exp_strength="0" field="is_deleted" notnull_strength="1" unique_strength="0"/>
 </constraints>
 <constraintExpressions>
  <constraint desc="" exp="" field="id"/>
  <constraint desc="" exp="" field="fid"/>
  <constraint desc="" exp="" field="sigla"/>
  <constraint desc="" exp="" field="descrizione"/>
  <constraint desc="" exp="" field="visibilita"/>
  <constraint desc="" exp="" field="part"/>
  <constraint desc="" exp="" field="stratif"/>
  <constraint desc="" exp="" field="assetto"/>
  <constraint desc="" exp="" field="caratter"/>
  <constraint desc="" exp="" field="note"/>
  <constraint desc="" exp="" field="data_ora"/>
  <constraint desc="" exp="" field="created_at"/>
  <constraint desc="" exp="" field="updated_at"/>
  <constraint desc="" exp="" field="created_by"/>
  <constraint desc="" exp="" field="updated_by"/>
  <constraint desc="" exp="" field="is_deleted"/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;data_ora&quot;" sortOrder="1">
  <columns>
   <column hidden="0" name="fid" type="field" width="46"/>
   <column hidden="0" name="sigla" type="field" width="186"/>
   <column hidden="0" name="descrizione" type="field" width="238"/>
   <column hidden="0" name="visibilita" type="field" width="-1"/>
   <column hidden="0" name="part" type="field" width="-1"/>
   <column hidden="0" name="stratif" type="field" width="-1"/>
   <column hidden="0" name="assetto" type="field" width="-1"/>
   <column hidden="0" name="caratter" type="field" width="-1"/>
   <column hidden="0" name="note" type="field" width="74"/>
   <column hidden="0" name="data_ora" type="field" width="219"/>
   <column hidden="0" name="id" type="field" width="-1"/>
   <column hidden="0" name="created_at" type="field" width="-1"/>
   <column hidden="0" name="updated_at" type="field" width="-1"/>
   <column hidden="0" name="created_by" type="field" width="-1"/>
   <column hidden="0" name="updated_by" type="field" width="-1"/>
   <column hidden="0" name="is_deleted" type="field" width="-1"/>
   <column hidden="1" type="actions" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field editable="0" name="Legenda_codice_carg"/>
  <field editable="1" name="assetto"/>
  <field editable="1" name="caratter"/>
  <field editable="1" name="created_at"/>
  <field editable="1" name="created_by"/>
  <field editable="0" name="data_ora"/>
  <field editable="1" name="descrizione"/>
  <field editable="1" name="fid"/>
  <field editable="1" name="id"/>
  <field editable="1" name="is_deleted"/>
  <field editable="0" name="legenda_colore_hex"/>
  <field editable="1" name="note"/>
  <field editable="1" name="part"/>
  <field editable="1" name="sigla"/>
  <field editable="1" name="stratif"/>
  <field editable="1" name="updated_at"/>
  <field editable="1" name="updated_by"/>
  <field editable="0" name="verbania_sigle_codice_carg"/>
  <field editable="0" name="verbania_sigle_id"/>
  <field editable="0" name="verbania_sigle_nome"/>
  <field editable="0" name="verbania_sigle_sigla"/>
  <field editable="1" name="visibilita"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="Legenda_codice_carg"/>
  <field labelOnTop="0" name="assetto"/>
  <field labelOnTop="0" name="caratter"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="data_ora"/>
  <field labelOnTop="0" name="descrizione"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="legenda_colore_hex"/>
  <field labelOnTop="0" name="note"/>
  <field labelOnTop="0" name="part"/>
  <field labelOnTop="0" name="sigla"/>
  <field labelOnTop="0" name="stratif"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
  <field labelOnTop="0" name="verbania_sigle_codice_carg"/>
  <field labelOnTop="0" name="verbania_sigle_id"/>
  <field labelOnTop="0" name="verbania_sigle_nome"/>
  <field labelOnTop="0" name="verbania_sigle_sigla"/>
  <field labelOnTop="0" name="visibilita"/>
 </labelOnTop>
 <reuseLastValuePolicy>
  <field name="Legenda_codice_carg" reuseLastValuePolicy="NotAllowed"/>
  <field name="assetto" reuseLastValuePolicy="NotAllowed"/>
  <field name="caratter" reuseLastValuePolicy="NotAllowed"/>
  <field name="created_at" reuseLastValuePolicy="NotAllowed"/>
  <field name="created_by" reuseLastValuePolicy="NotAllowed"/>
  <field name="data_ora" reuseLastValuePolicy="NotAllowed"/>
  <field name="descrizione" reuseLastValuePolicy="NotAllowed"/>
  <field name="fid" reuseLastValuePolicy="NotAllowed"/>
  <field name="id" reuseLastValuePolicy="NotAllowed"/>
  <field name="is_deleted" reuseLastValuePolicy="NotAllowed"/>
  <field name="legenda_colore_hex" reuseLastValuePolicy="NotAllowed"/>
  <field name="note" reuseLastValuePolicy="NotAllowed"/>
  <field name="part" reuseLastValuePolicy="NotAllowed"/>
  <field name="sigla" reuseLastValuePolicy="AllowedDefaultOn"/>
  <field name="stratif" reuseLastValuePolicy="NotAllowed"/>
  <field name="updated_at" reuseLastValuePolicy="NotAllowed"/>
  <field name="updated_by" reuseLastValuePolicy="NotAllowed"/>
  <field name="verbania_sigle_codice_carg" reuseLastValuePolicy="NotAllowed"/>
  <field name="verbania_sigle_id" reuseLastValuePolicy="NotAllowed"/>
  <field name="verbania_sigle_nome" reuseLastValuePolicy="NotAllowed"/>
  <field name="verbania_sigle_sigla" reuseLastValuePolicy="NotAllowed"/>
  <field name="visibilita" reuseLastValuePolicy="NotAllowed"/>
 </reuseLastValuePolicy>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>COALESCE( "descrizione", '&lt;NULL>' )</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>2</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc" xmlns:se="http://www.opengis.net/se" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd">
 <NamedLayer>
  <se:Name>affiorante</se:Name>
  <UserStyle>
   <se:Name>affiorante</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name></se:Name>
     <se:Description>
      <se:Title>"verbania_sigle_codice_carg" is ''</se:Title>
     </se:Description>
     <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8bff00</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ff00f2</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Morfologia</se:Name>
     <se:Description>
      <se:Title>Morfologia</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>012130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f5fafa</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>310</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>8</se:DisplacementX>
          <se:DisplacementY>5</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>340</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>6</se:DisplacementX>
          <se:DisplacementY>5</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>190</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>7</se:DisplacementX>
          <se:DisplacementY>7</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>230</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>7</se:DisplacementX>
          <se:DisplacementY>7</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>35</ogc:Literal>
         </se:Rotation>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Frana</se:Name>
     <se:Description>
      <se:Title>Frana</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>032140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <!--Parametric SVG-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=?fill=%23f5333f&amp;fill-opacity=1&amp;outline=%230082ca&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Plain SVG fallback, no parameters-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Well known marker fallback-->
         <se:Mark>
          <se:WellKnownName>square</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">5.04 5.04</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <!--Parametric SVG-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=?fill=%23f5333f&amp;fill-opacity=1&amp;outline=%230082ca&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Plain SVG fallback, no parameters-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Well known marker fallback-->
         <se:Mark>
          <se:WellKnownName>square</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">5.04 5.04</se:VendorOption>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dubbio-altro</se:Name>
     <se:Description>
      <se:Title>Dubbio-altro</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>093537</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fff5e3</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>horline</se:WellKnownName>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f6323e</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Rotation>
          <ogc:Literal>135</ogc:Literal>
         </se:Rotation>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Flysch del Varesotto</se:Name>
     <se:Description>
      <se:Title>Flysch del Varesotto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>212140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f6cb5e</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Scaglia Rossa</se:Name>
     <se:Description>
      <se:Title>Scaglia Rossa</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>372120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dbe2bc</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Sass de la Luna</se:Name>
     <se:Description>
      <se:Title>Sass de la Luna</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>382130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c8dd9a</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Maiolica</se:Name>
     <se:Description>
      <se:Title>Maiolica</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>392120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dbead1</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Radiolariti del Selcifero Lombardo</se:Name>
     <se:Description>
      <se:Title>Radiolariti del Selcifero Lombardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>402130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#a8cb94</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gruppo del Selcifero Lombardo</se:Name>
     <se:Description>
      <se:Title>Gruppo del Selcifero Lombardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>402150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#319c31</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Val Maggiore</se:Name>
     <se:Description>
      <se:Title>Formazione di Val Maggiore</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>442120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e4f3f8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Domaro</se:Name>
     <se:Description>
      <se:Title>Calcare di Domaro</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>452130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#b7dfea</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Moltrasio</se:Name>
     <se:Description>
      <se:Title>Calcare di Moltrasio</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>472150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#009dcc</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Alpe Perino</se:Name>
     <se:Description>
      <se:Title>Calcare di Alpe Perino</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>482130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8ab2df</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione dell'Albenza</se:Name>
     <se:Description>
      <se:Title>Formazione dell'Albenza</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>482140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4a95d1</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Zu</se:Name>
     <se:Description>
      <se:Title>Calcare di Zu</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>502130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ebd8eb</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dolomia Principale</se:Name>
     <se:Description>
      <se:Title>Dolomia Principale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>502150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dab0d3</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Marna del Pizzella</se:Name>
     <se:Description>
      <se:Title>Marna del Pizzella</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>522150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dd5c9d</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Cunardo</se:Name>
     <se:Description>
      <se:Title>Formazione di Cunardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>532130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c89cc8</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dolomia di San Salvatore</se:Name>
     <se:Description>
      <se:Title>Dolomia di San Salvatore</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>532150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#9b338a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Bellano</se:Name>
     <se:Description>
      <se:Title>Formazione di Bellano</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>542150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#aa98c9</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Livelli-particolari</se:Name>
     <se:Description>
      <se:Title>Livelli-particolari</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>verbania_sigle_codice_carg</ogc:PropertyName>
       <ogc:Literal>623226</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e5e5d6</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>horline</se:WellKnownName>
          <se:Stroke>
           <se:SvgParameter name="stroke">#a75928</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:MaxScaleDenominator>5000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>descrizione</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">Open Sans</se:SvgParameter>
       <se:SvgParameter name="font-size">13</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Halo>
       <se:Radius>2</se:Radius>
       <se:Fill>
        <se:SvgParameter name="fill">#fafafa</se:SvgParameter>
       </se:Fill>
      </se:Halo>
      <se:Fill>
       <se:SvgParameter name="fill">#323232</se:SvgParameter>
      </se:Fill>
      <se:VendorOption name="maxDisplacement">1</se:VendorOption>
     </se:TextSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:MaxScaleDenominator>10000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>sigla</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">Segoe UI</se:SvgParameter>
       <se:SvgParameter name="font-size">9</se:SvgParameter>
       <se:SvgParameter name="font-weight">bold</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Fill>
       <se:SvgParameter name="fill">#323232</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:VendorOption name="maxDisplacement">1</se:VendorOption>
     </se:TextSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$Thu Jun 18 14:48:29 2026$d$, 'postgres', 'Polygon');

-- rilevamento.giaciture
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'giaciture', 'geom', 'stile_giaciture',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" autoRefreshTime="0" symbologyReferenceScale="-1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="0" simplifyDrawingTol="1" maxScale="0" autoRefreshMode="Disabled" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.44.8-Solothurn" labelsEnabled="1" minScale="0">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal enabled="0" accumulate="0" durationUnit="min" startField="data_ora" startExpression="" mode="0" endExpression="" limitMode="0" durationField="id" endField="" fixedDuration="0">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation extrusionEnabled="0" binding="Centroid" symbology="Line" extrusion="0" clamping="Terrain" customToleranceEnabled="0" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" zscale="1" respectLayerSymbol="1" zoffset="0">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{32049cc3-be1e-4fae-8322-a34767d2c871}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="133,182,111,255,rgb:0.5215686,0.7137255,0.4352941,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="fill" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{927c8f11-dada-447b-bb73-b7b9a2647633}">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="133,182,111,255,rgb:0.5215686,0.7137255,0.4352941,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="95,130,79,255,rgb:0.372549,0.5098039,0.3109178,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{a2fcf627-59dc-4c8d-8896-61cfc9f9bbb4}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="133,182,111,255,rgb:0.5215686,0.7137255,0.4352941,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="95,130,79,255,rgb:0.372549,0.5098039,0.3109178,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 forceraster="0" enableorderby="0" type="categorizedSymbol" symbollevels="0" attr="TIPO" referencescale="-1">
  <categories>
   <category label="affioramento geologico o elemento geomorfologico di particolare interesse" render="true" type="string" uuid="0" symbol="0" value="1000"/>
   <category label="affioramento di interesse stratigrafico" render="true" type="string" uuid="1" symbol="1" value="1100"/>
   <category label="località fossilifera" render="true" type="string" uuid="2" symbol="2" value="1110"/>
   <category label="affioramento di interesse sedimentologico" render="true" type="string" uuid="3" symbol="3" value="1200"/>
   <category label="slump intraformazionale non cartografabile" render="true" type="string" uuid="4" symbol="4" value="1220"/>
   <category label="affioramento di interesse strutturale" render="true" type="string" uuid="5" symbol="5" value="1300"/>
   <category label="stazione strutturale (numerata)" render="true" type="string" uuid="6" symbol="6" value="1310"/>
   <category label="affioramento/località di interesse mineralogico petrografico" render="true" type="string" uuid="7" symbol="7" value="1400"/>
   <category label="profilo pedogenetico" render="true" type="string" uuid="8" symbol="8" value="1500"/>
   <category label="stratificazione diritta" render="true" type="string" uuid="9" symbol="9" value="3100"/>
   <category label="clinostratificazione" render="true" type="string" uuid="10" symbol="10" value="3101"/>
   <category label="stratificazione orizzontale diritta" render="true" type="string" uuid="11" symbol="11" value="3110"/>
   <category label="stratificazione verticale con indicazione della polarità" render="true" type="string" uuid="12" symbol="12" value="3120"/>
   <category label="stratificazione rovesciata" render="true" type="string" uuid="13" symbol="13" value="3130"/>
   <category label="stratificazione orizzontale rovesciata" render="true" type="string" uuid="14" symbol="14" value="3131"/>
   <category label="stratificazione contorta con valori medi di immersione ed inclinazione" render="true" type="string" uuid="15" symbol="15" value="3140"/>
   <category label="stratificazione a polarità sconosciuta" render="true" type="string" uuid="16" symbol="16" value="3150"/>
   <category label="stratificazione verticale a polarità sconosciuta" render="true" type="string" uuid="17" symbol="17" value="3151"/>
   <category label="stratificazione orizzontale a polarità sconosciuta" render="true" type="string" uuid="18" symbol="18" value="3152"/>
   <category label="direzione di younging" render="true" type="string" uuid="19" symbol="19" value="3160"/>
   <category label="superficie di clivaggio o scistosità inclinata" render="true" type="string" uuid="20" symbol="20" value="3210"/>
   <category label="superficie di clivaggio o scistosità orizzontale" render="true" type="string" uuid="21" symbol="21" value="3220"/>
   <category label="superficie di clivaggio o scistosità verticale" render="true" type="string" uuid="22" symbol="22" value="3230"/>
   <category label="elemento lineare primario (lineazione di origine sedimentaria, direzione di flusso in rocce ignee)" render="true" type="string" uuid="23" symbol="23" value="3310"/>
   <category label="elemento lineare primario verticale" render="true" type="string" uuid="24" symbol="24" value="3312"/>
   <category label="elemento lineare primario orizzontale" render="true" type="string" uuid="25" symbol="25" value="3313"/>
   <category label="lineazione di estensione (orientazione preferenziale di forma)" render="true" type="string" uuid="26" symbol="26" value="3320"/>
   <category label="lineazione minerale" render="true" type="string" uuid="27" symbol="27" value="3321"/>
   <category label="associazione di pieghe minori" render="true" type="string" uuid="28" symbol="28" value="3440"/>
   <category label="asse di piega" render="true" type="string" uuid="29" symbol="29" value="3450"/>
   <category label="asse di piega orizzontale" render="true" type="string" uuid="30" symbol="30" value="3451"/>
   <category label="asse di piega verticale" render="true" type="string" uuid="31" symbol="31" value="3452"/>
   <category label="specchio di faglia inclinato" render="true" type="double" uuid="{0f050273-eab3-4d5c-b449-97d54a5aed8d}" symbol="32" value="3330"/>
   <category label="specchio di faglia verticale" render="true" type="string" uuid="{5a379a57-5740-481e-aab3-0eddb6a0e83b}" symbol="33" value="3331"/>
   <category label="specchio di faglia orizzontale" render="true" type="double" uuid="{669ea02a-99dd-45b2-a492-6b55d6b1d11d}" symbol="34" value="3332"/>
   <category label="" render="true" type="NULL" uuid="{cd2df015-7ab4-4e62-a4fd-dba8dcbe4c95}" symbol="35" value="NULL"/>
  </categories>
  <symbols>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{c0b7fd6a-8099-411e-b26e-4850a8a13d5a}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="141,90,153,255,rgb:0.5529412,0.3529412,0.6,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSA3LjIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSA3LjI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0zLjcsMGMxLjMsMCwyLjQsMC43LDMsMS43bC0xLDAuNWMtMC40LTAuNy0xLjItMS4xLTItMS4xQzIuOCwxLjEsMiwxLjYsMS41LDIuNEMxLjEsMy4xLDEuMSw0LDEuNSw0LjgNCglDMiw1LjUsMi44LDYsMy43LDZjMC42LDAsMS4yLTAuMiwxLjYtMC42QzUuNyw1LDYsNC41LDYsMy45bC0yLDBsMC0wLjhsMy4yLDBsMCwwLjhjMCwwLjktMC40LDEuNy0xLDIuM2MtMC42LDAuNi0xLjUsMS0yLjQsMQ0KCWMtMS4zLDAtMi42LTAuNy0zLjItMS44Yy0wLjctMS4xLTAuNy0yLjQsMC0zLjVDMS4yLDAuNywyLjQsMCwzLjcsMHoiLz4NCjwvc3ZnPg0K"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.40215"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="1" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{587171ed-0934-41be-a30a-2d01504f313f}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="triangle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="10" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{48278d5b-a570-48fe-8ce4-c0d691ec0d1c}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.64000000000000001"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{588a8852-60b3-4400-b75d-bfa04fac6604}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="11" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{f4b67810-e397-40d8-878b-d00b95087c27}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{2811b0aa-f8d9-4967-8062-4c048bd0c5ac}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.88"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.88"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="12" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{08c546e2-c687-441f-9d13-ca2912b670d6}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.80000000000000004"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot; - 90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{fdfbd10f-2eda-4ce2-a7b9-96f5dac8a6d9}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="0.96"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.96"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot; - 90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="13" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{3d7afbed-e3d9-49ea-8570-3b43315277fe}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0.47999999999999998,1.11999999999999988"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;IMMERSIO&quot; - 180"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{15d162ed-64a8-4ecd-9c03-5527b89a8b46}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.47999999999999998"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;IMMERSIO&quot; - 180"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{ed2e1a33-67ce-4935-b5d6-7d4c35141a9f}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="0.96"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.96"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="half_arc"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;IMMERSIO&quot; - 180"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="14" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{a9c8e7e5-be14-4e5e-b2a1-f63820c22a76}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="3.2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="3.2"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{9e2fe3a2-eddd-4a7e-9a9b-e4f15b395b57}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{1008fe6c-1ccf-4a1c-b56f-76bd49e0bbc6}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.56"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.56"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="2.56"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="15" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{0ba10887-7c9f-43e1-8263-044d139fe431}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxpdmVsbG9fMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiDQoJIHdpZHRoPSIyMjMuMjEycHgiIGhlaWdodD0iMjMxLjAzOHB4IiB2aWV3Qm94PSIzMDAuNzQ2IDIzOC42MDEgMjIzLjIxMiAyMzEuMDM4Ig0KCSBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDMwMC43NDYgMjM4LjYwMSAyMjMuMjEyIDIzMS4wMzgiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPHBhdGggZmlsbD0iIzAwMTY4OSIgZD0iTTQwNy44ODUsMzQ1Ljc2OWMyLjkzLTIxLjE1LTEyLjQ3OS0xMC45MjgtMTIuOTQ5LTM1LjA5OGMxLjk5Mi0xOC4wMiwxMC40ODctMTguMTY0LDIxLjI3MS0yNS40Mw0KCWM0LjkyMi01LjAxLDYuMzg4LTExLjEwNCwzLjU3NC0xNy43MjVjLTcuNTYtMTIuNjI3LTEyLjUxMS03LjQ0MS0xMS44OTYtMjguODI4bDguOTA1LTAuMDg4DQoJYy0wLjk2NywxOC43NSw0LjQyNCwxMS41NDMsMTEuMTYyLDI1LjM3YzQuMzA4LDkuOTksMi4wNTIsMjAuMTU2LTUuNTM3LDI3Ljc0NGMtNy41Niw3LjExOS0xNy4xNCw0Ljg2My0xOC41NDUsMTkuMzY1DQoJYy0wLjE3NywxNy4xMDgsMTUuMDYsOC41ODQsMTIuOTIsMzQuNjg4aDEwNy4xNjh2MTcuODcxSDMwMC43NDZ2LTE3Ljg3MUw0MDcuODg1LDM0NS43NjkiLz4NCjxwYXRoIGZpbGw9Im5vbmUiIGQ9Ik00MTYuODE5LDM2Mi40NzFjLTIuOTMsMjEuMTUsMTIuNDc5LDEwLjkyOCwxMi45NDksMzUuMDk4Yy0xLjk5MiwxOC4wMi0xMC40ODcsMTguMTY0LTIxLjI3MSwyNS40Mw0KCWMtNC45MjIsNS4wMS02LjM4OCwxMS4xMDQtMy41NzQsMTcuNzI1YzcuNTYsMTIuNjI3LDEyLjUxMSw3LjQ0MSwxMS44OTYsMjguODI4bC04LjkwNSwwLjA4OA0KCWMwLjk2Ny0xOC43NS00LjQyNC0xMS41NDMtMTEuMTYyLTI1LjM3Yy00LjMwOC05Ljk5LTIuMDUyLTIwLjE1Niw1LjUzNy0yNy43NDRjNy41Ni03LjExOSwxNy4xNC00Ljg2MywxOC41NDUtMTkuMzY1DQoJYzAuMTc3LTE3LjEwOC0xNS4wNi04LjU4NC0xMi45Mi0zNC42ODhIMzAwLjc0NnYtMTcuODcxaDIyMy4yMTJ2MTcuODcxTDQxNi44MTksMzYyLjQ3MSIvPg0KPC9zdmc+DQo="/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="16" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{8add572d-fa9d-4be7-9b73-55023533822b}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.64000000000000001"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{e75c0d21-ebe1-44ee-9048-43c1778ecbbb}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{1e990602-c8e0-4a11-a92d-354c09290510}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,-1.11999999999999988"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.12"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.12"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="17" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{bbf6d52f-8e80-4c4e-8d80-3003d4c96d19}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{cd230ee1-0be3-4a77-a54c-48f02a01fed8}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="0.96"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.96"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="18" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{75e64328-6df8-438c-beae-c4a50d26fb50}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="3.2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="3.2"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{3a76dc44-b876-46ff-b455-6f1a04524b5c}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{4514bed3-c59f-4a3c-bff9-8176d19e2f5c}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="0.96"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.96"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="19" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{49b93903-fa87-48ae-8bb3-ab073cb9b61d}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="4"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.166667"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{7a704d3e-1ebe-4443-8b96-08449f3a4c04}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-1.41666666666666674"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.16667"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.16667"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="1.16667"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{cb107240-f64d-4d1f-9f35-3942374db21e}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,1.41666666666666674"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.16667"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.666667"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="1.16667"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="2" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{df5100e1-7aab-42c3-a990-697a64ca48e2}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="141,90,153,255,rgb:0.5529412,0.3529412,0.6,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMiA4LjQiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMiA4LjQ7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik00LjYsNS41bDAtMC4yYy0wLjIsMC0wLjMsMC0wLjUtMC4xYzAsMC0wLjEsMC0wLjEtMC4xQzQsNS4xLDMuOSw1LDMuOSw0LjljMC0wLjEsMC0wLjIsMC0wLjMNCglDMy45LDQuNSw0LDQuNCw0LDQuM2MwLjEtMC4zLDAuNC0wLjQsMC42LTAuNWMwLjMtMC4xLDAuNi0wLjEsMC44LDBjMC40LDAuMSwwLjcsMC40LDAuOSwwLjdjMC4yLDAuNCwwLjMsMC44LDAuMywxLjMNCgljMCwwLjYtMC4zLDEuMS0wLjgsMS41Yy0wLjYsMC40LTEuMywwLjYtMiwwLjZDMi43LDcuNywxLjcsNywxLjEsNkMwLjgsNS4zLDAuNyw0LjUsMC44LDMuOEMxLDIuOSwxLjUsMi4xLDIuMiwxLjYNCglDMi43LDEuMiwzLjQsMSw0LDFDNC41LDEsNSwxLDUuNCwxLjFsMC4yLTFDNC45LDAsNC4yLDAsMy41LDAuMUMzLDAuMiwyLjYsMC4zLDIuMiwwLjVDMS4zLDEuMSwwLjYsMS45LDAuMywyLjkNCglDMCwzLjcsMCw0LjcsMC4yLDUuNmMwLjEsMC40LDAuMiwwLjcsMC41LDEuMUMxLjEsNy4yLDEuNiw3LjcsMi4zLDhDMyw4LjMsMy44LDguNSw0LjUsOC4zYzAuNS0wLjEsMS0wLjMsMS41LTAuNg0KCWMwLjYtMC4zLDEuMS0xLDEuMS0xLjdDNy4yLDUuMyw3LDQuNiw2LjUsNEM2LjMsMy44LDYsMy42LDUuNywzLjVDNS41LDMuNCw1LjIsMy40LDUsMy40Yy0wLjMsMC0wLjUsMC4xLTAuNywwLjMNCglDNCwzLjksMy44LDQuMSwzLjcsNC4zYzAsMC4xLTAuMSwwLjItMC4xLDAuM2MwLDAuMSwwLDAuMiwwLDAuM2MwLDAuMSwwLDAuMSwwLjEsMC4yYzAsMC4xLDAuMSwwLjEsMC4xLDAuMmMwLDAsMC4xLDAuMSwwLjEsMC4xDQoJYzAuMSwwLDAuMSwwLDAuMiwwLjFDNC4zLDUuNSw0LjQsNS41LDQuNiw1LjV6Ii8+DQo8L3N2Zz4NCg=="/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.97"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="20" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{419c3d68-822b-4f9a-90e5-f56795492d63}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.27999999999999997"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{ce2a2945-318b-4575-a0ab-60dfe2bbd973}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,-0.27999999999999997"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{57bdc672-cfdc-4028-93cd-e5fbd740c8b9}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,-1.11999999999999988"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="21" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{f99123a8-077e-4eb3-8674-edc36024d243}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.27999999999999997"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{fa06d8e0-404b-4b95-8d33-2edcfcf6ad67}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,-0.27999999999999997"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{fca71913-c0fa-497c-a89c-2f0e11459803}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="3.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="3.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="22" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{3fbdd740-8518-4845-964c-aedfff84c336}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.20800000000000002"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{cac5fbd9-f4bb-467a-af50-4b995edf5b48}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,-0.20800000000000002"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.16"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{23f589b4-3de8-4cc6-b462-fe524b3445e5}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="1.28"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="23" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{c8a13250-e1b1-4768-86d9-f06af6b4677d}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="-0.20000000000000001,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{bda59433-9f2b-499a-acbf-1791e1aaeb1b}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-2.5"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.5"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="arrow"/>
      <Option name="symbol_width" type="QString" value="1.5"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{eed5d782-b4d2-4697-b51c-126c206bd8c2}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0.20000000000000001,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="24" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{6a452c12-a3c8-4ad0-bce7-dae081e4aed0}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="-0.20000000000000001,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{b09a71e1-4781-42c6-962d-49f90f7e05d9}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.5"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="1.5"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{1f944f1c-db81-401e-a9e4-2c76fbf70cb2}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0.20000000000000001,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="25" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{bbde9c7c-c96f-4d18-aa82-a8c5ac2f0ecc}">
     <Option type="Map">
      <Option name="angle" type="QString" value="90"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="8"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{8aba918c-4c1b-429e-9af5-fa65d9bc2e12}">
     <Option type="Map">
      <Option name="angle" type="QString" value="90"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-4"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.4"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="2"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{cb61b6a4-b3e3-412b-a0fa-a0d60c64d9a1}">
     <Option type="Map">
      <Option name="angle" type="QString" value="270"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-4"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.4"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="2"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="26" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{3a0e587c-89f0-4354-bc5d-20a9c38b7fbb}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,2.45000000000000018"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.5"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="1.5"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{6af4d625-1587-4794-b725-eec799e45c9b}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="6"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{14bfa064-22fe-48e1-84e9-5f844433e149}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.5"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="1.5"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="27" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{2a4b860b-ab73-42c8-bd52-bfe9f6999334}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,2.45000000000000018"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,0,rgb:0,0.0862745,0.5372549,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.8"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.2"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="1.8"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{a6456f44-c1fa-4a6c-8537-a9b0ef8c7427}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="6"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{b95734a1-0701-4379-980a-4518a99c6855}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,-3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.5"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="triangle"/>
      <Option name="symbol_width" type="QString" value="1.5"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="28" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{b2b0ce5e-fcb5-4ae9-8ae2-b6d7a6c68c7a}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAxLjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAxLjc7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDE2ODk7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik03LjEsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjQsMCw2LjEsMCw1LjksMC4xQzUuNiwwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCUM1LDEuNCw0LjgsMS40LDQuNiwxLjNDNC41LDEuMiw0LjMsMSw0LjMsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjEsMC4xQzIuOSwwLjMsMi43LDAuNSwyLjcsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuNywxLjIsMS42LDEsMS42LDAuOGMwLTAuMy0wLjItMC42LTAuNC0wLjdDMSwwLDAuNywwLDAuNCwwLjFDMC4yLDAuMywwLDAuNSwwLDAuOA0KCWgwLjNjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMGMwLjIsMC4xLDAuMywwLjMsMC4zLDAuNGMwLDAuMywwLjIsMC42LDAuNCwwLjdjMC4zLDAuMiwwLjYsMC4yLDAuOSwwDQoJQzIuOSwxLjQsMywxLjEsMywwLjhjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDAuNSw0LjEsMC42LDQuMSwwLjhjMCwwLjMsMC4yLDAuNiwwLjQsMC43DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjQsMC40LTAuN2MwLTAuMiwwLjEtMC40LDAuMy0wLjRjMC4yLTAuMSwwLjQtMC4xLDAuNSwwYzAuMiwwLjEsMC4zLDAuMywwLjMsMC40SDcuMXoiLz4NCjwvc3ZnPg0K"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="29" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{27c52799-7c7a-40d9-b478-405a7172dbf7}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{df88d133-97d6-45c2-ab8b-ec5b8e1a8b45}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="left_half_triangle"/>
      <Option name="offset" type="QString" value="0,-2"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="3" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{4dfd93b1-432f-47b9-9e6c-36b232c2c613}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="star"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="30" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{870c71aa-ac29-4b1a-8fef-9249f93e161c}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="-0.29999999999999999,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{3a6229f4-830c-408f-92d0-b71c064e9bab}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="right_half_triangle"/>
      <Option name="offset" type="QString" value="-0.29999999999999999,-1.5"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b024fa48-3a97-469b-805a-a895b05b9b9a}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="line"/>
      <Option name="offset" type="QString" value="0.29999999999999999,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{db4f43ec-648b-4b11-be98-415d4487b155}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="left_half_triangle"/>
      <Option name="offset" type="QString" value="0.29999999999999999,-1.5"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="DIREZIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="31" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{8ef26f3a-065c-46a4-89b7-3831d733c8e1}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,0,rgb:1,0,0,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="circle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.3"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{bde4e83d-ff65-48ca-a9fe-ce3d50379a4e}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="cross2"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.34783"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="32" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{07916431-0f9a-407b-a97f-045105a8bfe0}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,2,0,255,hsv:0.00144444444444444,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.64000000000000001"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{42d1884e-d18e-4446-b245-48527dde9dd8}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,2,0,255,hsv:0.00144444444444444,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="33" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{bbf6d52f-8e80-4c4e-8d80-3003d4c96d19}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,40,255,hsv:0.97402777777777783,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{cd230ee1-0be3-4a77-a54c-48f02a01fed8}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,40,255,hsv:0.97402777777777783,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="0.96"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.96"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="circle"/>
      <Option name="symbol_width" type="QString" value="0.96"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="expression" type="QString" value="&quot;DIREZIO&quot;-90"/>
         <Option name="type" type="int" value="3"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="34" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{f4b67810-e397-40d8-878b-d00b95087c27}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,40,255,hsv:0.97402777777777783,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{2811b0aa-f8d9-4967-8062-4c048bd0c5ac}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,40,255,hsv:0.97402777777777783,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="2.88"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="2.88"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="false"/>
         <Option name="type" type="int" value="1"/>
         <Option name="val" type="QString" value=""/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="35" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{19d25353-8608-4530-8e63-ea10eb1448fa}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,40,255,hsv:0.97402777777777783,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="circle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="4" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{ce90aa54-94f1-4072-9d65-6087edbd4832}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAzLjkiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAzLjk7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0wLjMsMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBjMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVjMCwwLjMsMC4yLDAuNiwwLjQsMC44DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjUsMC40LTAuOGMwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzQsMC41LDQuMSwwLjcsNC4xLDAuOA0KCWMwLDAuMywwLjIsMC42LDAuNCwwLjhjMC4zLDAuMiwwLjYsMC4yLDAuOSwwYzAuMy0wLjIsMC40LTAuNSwwLjQtMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDANCgljMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVoMC4zYzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjUsMCw2LjIsMCw1LjksMC4xQzUuNywwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzQuNSwxLjMsNC40LDEuMSw0LjQsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjIsMC4xQzIuOSwwLjMsMi44LDAuNSwyLjgsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuOCwxLjMsMS42LDEuMSwxLjYsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN1MwLjcsMCwwLjQsMC4xQzAuMiwwLjMsMCwwLjUsMCwwLjgNCglIMC4zeiIvPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTAuMywzYzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBDMS4zLDIuNywxLjQsMi44LDEuNCwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUMyLDQsMi40LDQsMi42LDMuOEMyLjksMy43LDMuMSwzLjQsMy4xLDNjMC0wLjIsMC4xLTAuNCwwLjMtMC41YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDIuNyw0LjEsMi44LDQuMSwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUM0LjgsNCw1LjEsNCw1LjQsMy44QzUuNiwzLjcsNS44LDMuNCw1LjgsM2MwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzYuNywyLjcsNi44LDIuOCw2LjgsM2gwLjMNCgljMC0wLjMtMC4yLTAuNi0wLjQtMC43Yy0wLjItMC4yLTAuNi0wLjItMC44LDBDNS43LDIuNSw1LjUsMi43LDUuNSwzYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwDQoJQzQuNSwzLjQsNC40LDMuMiw0LjQsM2MwLTAuMy0wLjItMC42LTAuNC0wLjdjLTAuMi0wLjItMC42LTAuMi0wLjgsMEMyLjksMi41LDIuOCwyLjcsMi44LDNjMCwwLjItMC4xLDAuNC0wLjMsMC41DQoJYy0wLjIsMC4xLTAuNCwwLjEtMC42LDBDMS44LDMuNCwxLjYsMy4yLDEuNiwzYzAtMC4zLTAuMi0wLjYtMC40LTAuN0MxLDIuMSwwLjcsMi4xLDAuNCwyLjNDMC4yLDIuNSwwLDIuNywwLDNIMC4zeiIvPg0KPC9zdmc+DQo="/>
      <Option name="offset" type="QString" value="0,0.80000000000000004"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="5" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{cccf4f88-5dd1-4054-be67-76648b6eda49}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="square"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="1.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="6" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{ec395ebe-d0f2-4671-8d5f-e8e77b8efdb4}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="name" type="QString" value="square"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="1.8"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="7" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{3cd4f2e1-80e8-4875-8796-d373efdfeb34}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjEiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjE7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxnPg0KCTxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik01LjYsMGgwLjdINS42TDUuNiwweiBNNi40LDB2MS42TDUuNiwwSDYuNHoiLz4NCjwvZz4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy44LDQuOSA1LjYsMCA2LjQsMS41IDQuNCw3LjEgIi8+DQo8cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjEuMywxLjUgMy4zLDcuMSAzLjgsNC45IDIuMSwwICIvPg0KPHBvbHlnb24gY2xhc3M9InN0MCIgcG9pbnRzPSIxLjMsMCAxLjMsMS41IDEuMywxLjUgMi4xLDAgIi8+DQo8Zz4NCgk8cGF0aCBjbGFzcz0ic3QwIiBkPSJNMy4zLDcuMWgxSDMuM0wzLjMsNy4xeiBNNC40LDcuMUwzLjgsNC45TDMuMyw3LjFINC40eiIvPg0KPC9nPg0KPHJlY3QgeD0iNi40IiB5PSIwIiBjbGFzcz0ic3QwIiB3aWR0aD0iMS4zIiBoZWlnaHQ9IjcuMSIvPg0KPHJlY3QgeT0iMCIgY2xhc3M9InN0MCIgd2lkdGg9IjEuMyIgaGVpZ2h0PSI3LjEiLz4NCjwvc3ZnPg0K"/>
      <Option name="offset" type="QString" value="0,0.80000118867372239"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="8" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{65d30b03-53b9-4483-9e30-1b9767d25b57}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy42LDMuNiAzLjYsMCA0LjEsMCA0LjEsMy42IDcuNiwyLjUgNy43LDMgNC4zLDQuMSA2LjQsNy4xIDYsNy40IDMuOCw0LjQgMS43LDcuNCAxLjMsNy4xIDMuNCw0LjEgDQoJMCwzIDAuMSwyLjUgIi8+DQo8L3N2Zz4NCg=="/>
      <Option name="offset" type="QString" value="0,0.80000118867372239"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.72772"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="9" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{07916431-0f9a-407b-a97f-045105a8bfe0}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0.64000000000000001"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="0.32"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="4"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{42d1884e-d18e-4446-b245-48527dde9dd8}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="miter"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.1"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="size" type="QString" value="1.28"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="symbol_height" type="QString" value="1.28"/>
      <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_height_unit" type="QString" value="MM"/>
      <Option name="symbol_name" type="QString" value="rectangle"/>
      <Option name="symbol_width" type="QString" value="0.16"/>
      <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="symbol_width_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties" type="Map">
        <Option name="angle" type="Map">
         <Option name="active" type="bool" value="true"/>
         <Option name="field" type="QString" value="IMMERSIO"/>
         <Option name="type" type="int" value="2"/>
        </Option>
       </Option>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <source-symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{d941016a-d75e-4403-9514-f8d66089b3ea}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="color" type="QString" value="141,90,153,255,rgb:0.5529412,0.3529412,0.6,1"/>
      <Option name="fixedAspectRatio" type="QString" value="0"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="name" type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxpdmVsbG9fMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiDQoJIHdpZHRoPSIyMjMuMjEzcHgiIGhlaWdodD0iMTQzLjQzOHB4IiB2aWV3Qm94PSIwIDAgMjIzLjIxMyAxNDMuNDM4IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCAyMjMuMjEzIDE0My40MzgiDQoJIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPHBvbHlnb24gZmlsbD0iI0Y3MzIzRiIgcG9pbnRzPSI0OC43MjIsMCAzMS45MDcsNjMuNzUgMzkuNjQsNjUuNjU0IDU0LjA1NCw3LjkzOSAiLz4NCjxwb2x5Z29uIGZpbGw9IiNGNzMyM0YiIHBvaW50cz0iMTc2LjEzMywyLjk4OSAxNjkuMTYyLDcuOTM5IDE4My42MDUsNjUuNjU0IDE5MS4zMzgsNjMuNzUgIi8+DQo8cG9seWdvbiBmaWxsPSIjRjczMjNGIiBwb2ludHM9IjE3Ny4wMTIsMCA0OC43MjIsMCA0OS42MDEsNy45MzkgMTczLjY0NSw3LjkzOSAiLz4NCjxyZWN0IHg9IjAiIHk9IjYzLjc1IiBmaWxsPSIjRjczMjNGIiB3aWR0aD0iMjIzLjIxMyIgaGVpZ2h0PSIxNS45MzgiLz4NCjwvc3ZnPg0K"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="parameters"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.5"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </source-symbol>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{60dede07-0512-4f80-b28f-0528d03e8f39}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="circle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <labeling type="rule-based">
  <rules key="{115a715d-118f-411a-a816-adcfcc72167f}">
   <rule key="{b2207c94-f505-4a8b-99c9-6c2213d6eedc}" filter="&quot;Tipo&quot;>3000" scalemaxdenom="10000">
    <settings calloutType="simple">
     <text-style fontItalic="0" blendMode="0" tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistanceUnit="Point" useSubstitutions="0" tabStopDistance="80" fieldName="Inclina" fontKerning="1" forcedItalic="0" stretchFactor="100" allowHtml="0" fontWeight="50" fontWordSpacing="0" forcedBold="0" isExpression="0" multilineHeightUnit="Percentage" multilineHeight="1" fontLetterSpacing="0" textOpacity="1" textColor="0,22,137,255,rgb:0,0.0862745,0.5372549,1" fontUnderline="0" fontFamily="Arial" fontSize="8" namedStyle="Normale" textOrientation="horizontal" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" capitalization="0" fontSizeUnit="Point">
      <families/>
      <text-buffer bufferNoFill="1" bufferJoinStyle="128" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255,rgb:1,1,1,1" bufferOpacity="1" bufferBlendMode="0" bufferSize="1" bufferDraw="1" bufferSizeUnits="MM"/>
      <text-mask maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128" maskSize="1.5" maskEnabled="0" maskSize2="1.5" maskType="0" maskedSymbolLayers="" maskSizeUnits="MM" maskOpacity="1"/>
      <background shapeSizeUnit="MM" shapeOffsetUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0" shapeRotationType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiX="0" shapeSizeY="0" shapeBorderColor="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" shapeRotation="0" shapeRadiiY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeSizeType="0" shapeOffsetY="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeJoinStyle="64" shapeSVGFile="" shapeBorderWidthUnit="MM" shapeOpacity="1" shapeRadiiUnit="MM" shapeDraw="0" shapeType="0" shapeBlendMode="0" shapeOffsetX="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0">
       <symbol force_rhr="0" clip_to_extent="1" name="markerSymbol" is_animated="0" type="marker" frame_rate="10" alpha="1">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="">
         <Option type="Map">
          <Option name="angle" type="QString" value="0"/>
          <Option name="cap_style" type="QString" value="square"/>
          <Option name="color" type="QString" value="232,113,141,255,rgb:0.9098039,0.4431373,0.5529412,1"/>
          <Option name="horizontal_anchor_point" type="QString" value="1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="name" type="QString" value="circle"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
          <Option name="outline_style" type="QString" value="solid"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="outline_width_unit" type="QString" value="MM"/>
          <Option name="scale_method" type="QString" value="diameter"/>
          <Option name="size" type="QString" value="2"/>
          <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="size_unit" type="QString" value="MM"/>
          <Option name="vertical_anchor_point" type="QString" value="1"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
       <symbol force_rhr="0" clip_to_extent="1" name="fillSymbol" is_animated="0" type="fill" frame_rate="10" alpha="1">
        <data_defined_properties>
         <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties"/>
          <Option name="type" type="QString" value="collection"/>
         </Option>
        </data_defined_properties>
        <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="">
         <Option type="Map">
          <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="color" type="QString" value="255,255,255,255,rgb:1,1,1,1"/>
          <Option name="joinstyle" type="QString" value="bevel"/>
          <Option name="offset" type="QString" value="0,0"/>
          <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
          <Option name="offset_unit" type="QString" value="MM"/>
          <Option name="outline_color" type="QString" value="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1"/>
          <Option name="outline_style" type="QString" value="no"/>
          <Option name="outline_width" type="QString" value="0"/>
          <Option name="outline_width_unit" type="QString" value="MM"/>
          <Option name="style" type="QString" value="solid"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option name="name" type="QString" value=""/>
           <Option name="properties"/>
           <Option name="type" type="QString" value="collection"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
      </background>
      <shadow shadowUnder="0" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowRadius="1.5" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowScale="100" shadowOffsetDist="1" shadowOpacity="0.69999999999999996" shadowDraw="0" shadowRadiusAlphaOnly="0"/>
      <dd_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </dd_properties>
      <substitutions/>
     </text-style>
     <text-format useMaxLineLengthForAutoWrap="1" reverseDirectionSymbol="0" multilineAlign="3" leftDirectionSymbol="&lt;" rightDirectionSymbol=">" autoWrapLength="0" plussign="0" decimals="3" wrapChar="" placeDirectionSymbol="0" formatNumbers="0" addDirectionSymbol="0"/>
     <placement maxCurvedCharAngleIn="25" lineAnchorTextPoint="CenterOfText" xOffset="0" maximumDistance="0" allowDegraded="0" maxCurvedCharAngleOut="-25" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" geometryGenerator="" maximumDistanceUnit="MM" rotationAngle="0" overrunDistanceUnit="MM" fitInPolygonOnly="0" overlapHandling="PreventOverlap" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" polygonPlacementFlags="2" preserveRotation="1" lineAnchorClipping="0" lineAnchorPercent="0.5" repeatDistance="0" offsetType="1" geometryGeneratorType="PointGeometry" distMapUnitScale="3x:0,0,0,0,0,0" lineAnchorType="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" priority="5" offsetUnits="MM" placement="6" placementFlags="10" repeatDistanceUnits="MM" distUnits="MM" overrunDistance="0" centroidWhole="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" dist="0" centroidInside="0" layerType="PointGeometry" prioritization="PreferCloser" quadOffset="4" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" rotationUnit="AngleDegrees"/>
     <rendering scaleMax="10000" obstacleType="1" zIndex="0" minFeatureSize="0" labelPerPart="0" scaleMin="0" fontMaxPixelSize="10000" unplacedVisibility="0" maxNumLabels="2000" upsidedownLabels="0" fontLimitPixelSize="0" drawLabels="1" obstacleFactor="1" fontMinPixelSize="3" mergeLines="0" limitNumLabels="0" scaleVisibility="1" obstacle="1"/>
     <dd_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </dd_properties>
     <callout type="simple">
      <Option type="Map">
       <Option name="anchorPoint" type="QString" value="pole_of_inaccessibility"/>
       <Option name="blendMode" type="int" value="0"/>
       <Option name="ddProperties" type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
       <Option name="drawToAllParts" type="bool" value="false"/>
       <Option name="enabled" type="QString" value="0"/>
       <Option name="labelAnchorPoint" type="QString" value="point_on_exterior"/>
       <Option name="lineSymbol" type="QString" value="&lt;symbol force_rhr=&quot;0&quot; clip_to_extent=&quot;1&quot; name=&quot;symbol&quot; is_animated=&quot;0&quot; type=&quot;line&quot; frame_rate=&quot;10&quot; alpha=&quot;1&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot; id=&quot;{1504e825-2335-4033-a2c3-40357c86772e}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;capstyle&quot; type=&quot;QString&quot; value=&quot;square&quot;/>&lt;Option name=&quot;customdash&quot; type=&quot;QString&quot; value=&quot;5;2&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;customdash_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;joinstyle&quot; type=&quot;QString&quot; value=&quot;bevel&quot;/>&lt;Option name=&quot;line_color&quot; type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.2352941,0.2352941,0.2352941,1&quot;/>&lt;Option name=&quot;line_style&quot; type=&quot;QString&quot; value=&quot;solid&quot;/>&lt;Option name=&quot;line_width&quot; type=&quot;QString&quot; value=&quot;0.3&quot;/>&lt;Option name=&quot;line_width_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;offset&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;offset_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;ring_filter&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;trim_distance_start&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; type=&quot;QString&quot; value=&quot;MM&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;use_custom_dash&quot; type=&quot;QString&quot; value=&quot;0&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; type=&quot;QString&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; type=&quot;QString&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
       <Option name="minLength" type="double" value="0"/>
       <Option name="minLengthMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="minLengthUnit" type="QString" value="MM"/>
       <Option name="offsetFromAnchor" type="double" value="0"/>
       <Option name="offsetFromAnchorMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromAnchorUnit" type="QString" value="MM"/>
       <Option name="offsetFromLabel" type="double" value="0"/>
       <Option name="offsetFromLabelMapUnitScale" type="QString" value="3x:0,0,0,0,0,0"/>
       <Option name="offsetFromLabelUnit" type="QString" value="MM"/>
      </Option>
     </callout>
    </settings>
   </rule>
  </rules>
 </labeling>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/remoteLayerId" type="QString" value="giaciture_89e921c4_87ea_463f_9d8d_79325885ed44"/>
   <Option name="QFieldSync/sourceDataPrimaryKeys" type="QString" value="fid"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="dualview/previewExpressions" type="List">
    <Option type="QString" value="&quot;fid&quot;"/>
   </Option>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>1</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration/>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipo" configurationFlags="NoFlag">
   <editWidget type="Classification">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipologia" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="dato mancante" type="QString" value="0"/>
       </Option>
       <Option type="Map">
        <Option name="certo" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="dedotto" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="incerto" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="sepolto" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="non classificabile" type="QString" value="9"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Immersio" configurationFlags="NoFlag">
   <editWidget type="Range">
    <config>
     <Option type="Map">
      <Option name="AllowNull" type="bool" value="true"/>
      <Option name="Max" type="int" value="999"/>
      <Option name="Min" type="int" value="0"/>
      <Option name="Precision" type="int" value="0"/>
      <Option name="Step" type="int" value="1"/>
      <Option name="Style" type="QString" value="SpinBox"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Direzio" configurationFlags="NoFlag">
   <editWidget type="Range">
    <config>
     <Option type="Map">
      <Option name="AllowNull" type="bool" value="true"/>
      <Option name="Max" type="int" value="999"/>
      <Option name="Min" type="int" value="0"/>
      <Option name="Precision" type="int" value="0"/>
      <Option name="Step" type="int" value="1"/>
      <Option name="Style" type="QString" value="SpinBox"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Inclina" configurationFlags="NoFlag">
   <editWidget type="Range">
    <config>
     <Option type="Map">
      <Option name="AllowNull" type="bool" value="true"/>
      <Option name="Max" type="int" value="99"/>
      <Option name="Min" type="int" value="0"/>
      <Option name="Precision" type="int" value="0"/>
      <Option name="Step" type="int" value="1"/>
      <Option name="Style" type="QString" value="SpinBox"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Fase" configurationFlags="NoFlag">
   <editWidget type="Range">
    <config>
     <Option type="Map">
      <Option name="AllowNull" type="bool" value="true"/>
      <Option name="Max" type="int" value="9"/>
      <Option name="Min" type="int" value="0"/>
      <Option name="Precision" type="int" value="0"/>
      <Option name="Step" type="int" value="1"/>
      <Option name="Style" type="QString" value="SpinBox"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Verso" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="senza indicazione del verso della direzione" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="con verso concorde con la direzione d’immersione" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="con verso opposto alla direzione d’immersione" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="con verso di scorrimento rivolto verso l’alto (lin verticali)" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="con verso di scorrimento rivolto verso il basso (lin verticali)" type="QString" value="5"/>
       </Option>
       <Option type="Map">
        <Option name="non classificabile" type="QString" value="9"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Asimmetria" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="senza indicazione dell’asimmetria" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="asimmetria destra" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="asimmetria sinistra" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="non classificabile" type="QString" value="9"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="note" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option name="IsMultiline" type="bool" value="false"/>
      <Option name="UseHtml" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="data_ora" configurationFlags="NoFlag">
   <editWidget type="DateTime">
    <config>
     <Option type="Map">
      <Option name="allow_null" type="bool" value="false"/>
      <Option name="calendar_popup" type="bool" value="false"/>
      <Option name="display_format" type="QString" value="dd/MM/yyyy HH:mm"/>
      <Option name="field_format" type="QString" value="yyyy-MM-dd HH:mm:ss"/>
      <Option name="field_format_overwrite" type="bool" value="false"/>
      <Option name="field_iso_format" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="QString" value=""/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="QString" value=""/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="Tipo" name="" index="2"/>
  <alias field="Tipologia" name="" index="3"/>
  <alias field="Immersio" name="" index="4"/>
  <alias field="Direzio" name="" index="5"/>
  <alias field="Inclina" name="" index="6"/>
  <alias field="Fase" name="" index="7"/>
  <alias field="Verso" name="" index="8"/>
  <alias field="Asimmetria" name="" index="9"/>
  <alias field="note" name="" index="10"/>
  <alias field="data_ora" name="" index="11"/>
  <alias field="created_at" name="" index="12"/>
  <alias field="updated_at" name="" index="13"/>
  <alias field="created_by" name="" index="14"/>
  <alias field="updated_by" name="" index="15"/>
  <alias field="is_deleted" name="Da scartare" index="16"/>
 </aliases>
 <splitPolicies>
  <policy field="id" policy="DefaultValue"/>
  <policy field="fid" policy="DefaultValue"/>
  <policy field="Tipo" policy="DefaultValue"/>
  <policy field="Tipologia" policy="DefaultValue"/>
  <policy field="Immersio" policy="DefaultValue"/>
  <policy field="Direzio" policy="DefaultValue"/>
  <policy field="Inclina" policy="DefaultValue"/>
  <policy field="Fase" policy="DefaultValue"/>
  <policy field="Verso" policy="DefaultValue"/>
  <policy field="Asimmetria" policy="DefaultValue"/>
  <policy field="note" policy="DefaultValue"/>
  <policy field="data_ora" policy="DefaultValue"/>
  <policy field="created_at" policy="DefaultValue"/>
  <policy field="updated_at" policy="DefaultValue"/>
  <policy field="created_by" policy="DefaultValue"/>
  <policy field="updated_by" policy="DefaultValue"/>
  <policy field="is_deleted" policy="DefaultValue"/>
 </splitPolicies>
 <defaults>
  <default field="id" expression="" applyOnUpdate="0"/>
  <default field="fid" expression="" applyOnUpdate="0"/>
  <default field="Tipo" expression="" applyOnUpdate="0"/>
  <default field="Tipologia" expression="" applyOnUpdate="0"/>
  <default field="Immersio" expression="" applyOnUpdate="0"/>
  <default field="Direzio" expression="" applyOnUpdate="0"/>
  <default field="Inclina" expression="" applyOnUpdate="0"/>
  <default field="Fase" expression="" applyOnUpdate="0"/>
  <default field="Verso" expression="9" applyOnUpdate="0"/>
  <default field="Asimmetria" expression="9" applyOnUpdate="0"/>
  <default field="note" expression="" applyOnUpdate="0"/>
  <default field="data_ora" expression="now()" applyOnUpdate="0"/>
  <default field="created_at" expression="" applyOnUpdate="0"/>
  <default field="updated_at" expression="" applyOnUpdate="0"/>
  <default field="created_by" expression="" applyOnUpdate="0"/>
  <default field="updated_by" expression="" applyOnUpdate="0"/>
  <default field="is_deleted" expression="" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint constraints="3" field="id" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="3" field="fid" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="0" field="Tipo" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Tipologia" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Immersio" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Direzio" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Inclina" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Fase" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Verso" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Asimmetria" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="note" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="data_ora" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="1" field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="Tipo" desc="" exp=""/>
  <constraint field="Tipologia" desc="" exp=""/>
  <constraint field="Immersio" desc="" exp=""/>
  <constraint field="Direzio" desc="" exp=""/>
  <constraint field="Inclina" desc="" exp=""/>
  <constraint field="Fase" desc="" exp=""/>
  <constraint field="Verso" desc="" exp=""/>
  <constraint field="Asimmetria" desc="" exp=""/>
  <constraint field="note" desc="" exp=""/>
  <constraint field="data_ora" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
  <columns>
   <column name="fid" type="field" hidden="0" width="-1"/>
   <column name="Tipo" type="field" hidden="0" width="-1"/>
   <column name="Tipologia" type="field" hidden="0" width="-1"/>
   <column name="Immersio" type="field" hidden="0" width="-1"/>
   <column name="Direzio" type="field" hidden="0" width="-1"/>
   <column name="Inclina" type="field" hidden="0" width="-1"/>
   <column name="Fase" type="field" hidden="0" width="-1"/>
   <column name="Verso" type="field" hidden="0" width="-1"/>
   <column name="Asimmetria" type="field" hidden="0" width="-1"/>
   <column name="note" type="field" hidden="0" width="-1"/>
   <column name="data_ora" type="field" hidden="0" width="-1"/>
   <column name="id" type="field" hidden="0" width="-1"/>
   <column name="created_at" type="field" hidden="0" width="-1"/>
   <column name="updated_at" type="field" hidden="0" width="-1"/>
   <column name="created_by" type="field" hidden="0" width="-1"/>
   <column name="updated_by" type="field" hidden="0" width="-1"/>
   <column name="is_deleted" type="field" hidden="0" width="-1"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="Asimmetria" editable="1"/>
  <field name="Direzio" editable="1"/>
  <field name="Fase" editable="1"/>
  <field name="Immersio" editable="1"/>
  <field name="Inclina" editable="1"/>
  <field name="Tipo" editable="1"/>
  <field name="Tipologia" editable="1"/>
  <field name="Verso" editable="1"/>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="data_ora" editable="0"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="note" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="Asimmetria"/>
  <field labelOnTop="0" name="Direzio"/>
  <field labelOnTop="0" name="Fase"/>
  <field labelOnTop="0" name="Immersio"/>
  <field labelOnTop="0" name="Inclina"/>
  <field labelOnTop="0" name="Tipo"/>
  <field labelOnTop="0" name="Tipologia"/>
  <field labelOnTop="0" name="Verso"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="data_ora"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="note"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
 </labelOnTop>
 <reuseLastValue>
  <field name="Asimmetria" reuseLastValue="0"/>
  <field name="Direzio" reuseLastValue="1"/>
  <field name="Fase" reuseLastValue="1"/>
  <field name="Immersio" reuseLastValue="0"/>
  <field name="Inclina" reuseLastValue="0"/>
  <field name="Tipo" reuseLastValue="1"/>
  <field name="Tipologia" reuseLastValue="1"/>
  <field name="Verso" reuseLastValue="0"/>
  <field name="created_at" reuseLastValue="0"/>
  <field name="created_by" reuseLastValue="0"/>
  <field name="data_ora" reuseLastValue="0"/>
  <field name="fid" reuseLastValue="0"/>
  <field name="id" reuseLastValue="0"/>
  <field name="is_deleted" reuseLastValue="0"/>
  <field name="note" reuseLastValue="0"/>
  <field name="updated_at" reuseLastValue="0"/>
  <field name="updated_by" reuseLastValue="0"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>"fid"</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>0</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
 <NamedLayer>
  <se:Name>giaciture</se:Name>
  <UserStyle>
   <se:Name>giaciture</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>affioramento geologico o elemento geomorfologico di particolare interesse</se:Name>
     <se:Description>
      <se:Title>affioramento geologico o elemento geomorfologico di particolare interesse</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1000</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSA3LjIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSA3LjI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0zLjcsMGMxLjMsMCwyLjQsMC43LDMsMS43bC0xLDAuNWMtMC40LTAuNy0xLjItMS4xLTItMS4xQzIuOCwxLjEsMiwxLjYsMS41LDIuNEMxLjEsMy4xLDEuMSw0LDEuNSw0LjgNCglDMiw1LjUsMi44LDYsMy43LDZjMC42LDAsMS4yLTAuMiwxLjYtMC42QzUuNyw1LDYsNC41LDYsMy45bC0yLDBsMC0wLjhsMy4yLDBsMCwwLjhjMCwwLjktMC40LDEuNy0xLDIuM2MtMC42LDAuNi0xLjUsMS0yLjQsMQ0KCWMtMS4zLDAtMi42LTAuNy0zLjItMS44Yy0wLjctMS4xLTAuNy0yLjQsMC0zLjVDMS4yLDAuNywyLjQsMCwzLjcsMHoiLz4NCjwvc3ZnPg0K?fill=%238d5a99&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSA3LjIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSA3LjI7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0zLjcsMGMxLjMsMCwyLjQsMC43LDMsMS43bC0xLDAuNWMtMC40LTAuNy0xLjItMS4xLTItMS4xQzIuOCwxLjEsMiwxLjYsMS41LDIuNEMxLjEsMy4xLDEuMSw0LDEuNSw0LjgNCglDMiw1LjUsMi44LDYsMy43LDZjMC42LDAsMS4yLTAuMiwxLjYtMC42QzUuNyw1LDYsNC41LDYsMy45bC0yLDBsMC0wLjhsMy4yLDBsMCwwLjhjMCwwLjktMC40LDEuNy0xLDIuM2MtMC42LDAuNi0xLjUsMS0yLjQsMQ0KCWMtMS4zLDAtMi42LTAuNy0zLjItMS44Yy0wLjctMS4xLTAuNy0yLjQsMC0zLjVDMS4yLDAuNywyLjQsMCwzLjcsMHoiLz4NCjwvc3ZnPg0K"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#8d5a99</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>9</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>affioramento di interesse stratigrafico</se:Name>
     <se:Description>
      <se:Title>affioramento di interesse stratigrafico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1100</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>7</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>località fossilifera</se:Name>
     <se:Description>
      <se:Title>località fossilifera</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1110</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMiA4LjQiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMiA4LjQ7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik00LjYsNS41bDAtMC4yYy0wLjIsMC0wLjMsMC0wLjUtMC4xYzAsMC0wLjEsMC0wLjEtMC4xQzQsNS4xLDMuOSw1LDMuOSw0LjljMC0wLjEsMC0wLjIsMC0wLjMNCglDMy45LDQuNSw0LDQuNCw0LDQuM2MwLjEtMC4zLDAuNC0wLjQsMC42LTAuNWMwLjMtMC4xLDAuNi0wLjEsMC44LDBjMC40LDAuMSwwLjcsMC40LDAuOSwwLjdjMC4yLDAuNCwwLjMsMC44LDAuMywxLjMNCgljMCwwLjYtMC4zLDEuMS0wLjgsMS41Yy0wLjYsMC40LTEuMywwLjYtMiwwLjZDMi43LDcuNywxLjcsNywxLjEsNkMwLjgsNS4zLDAuNyw0LjUsMC44LDMuOEMxLDIuOSwxLjUsMi4xLDIuMiwxLjYNCglDMi43LDEuMiwzLjQsMSw0LDFDNC41LDEsNSwxLDUuNCwxLjFsMC4yLTFDNC45LDAsNC4yLDAsMy41LDAuMUMzLDAuMiwyLjYsMC4zLDIuMiwwLjVDMS4zLDEuMSwwLjYsMS45LDAuMywyLjkNCglDMCwzLjcsMCw0LjcsMC4yLDUuNmMwLjEsMC40LDAuMiwwLjcsMC41LDEuMUMxLjEsNy4yLDEuNiw3LjcsMi4zLDhDMyw4LjMsMy44LDguNSw0LjUsOC4zYzAuNS0wLjEsMS0wLjMsMS41LTAuNg0KCWMwLjYtMC4zLDEuMS0xLDEuMS0xLjdDNy4yLDUuMyw3LDQuNiw2LjUsNEM2LjMsMy44LDYsMy42LDUuNywzLjVDNS41LDMuNCw1LjIsMy40LDUsMy40Yy0wLjMsMC0wLjUsMC4xLTAuNywwLjMNCglDNCwzLjksMy44LDQuMSwzLjcsNC4zYzAsMC4xLTAuMSwwLjItMC4xLDAuM2MwLDAuMSwwLDAuMiwwLDAuM2MwLDAuMSwwLDAuMSwwLjEsMC4yYzAsMC4xLDAuMSwwLjEsMC4xLDAuMmMwLDAsMC4xLDAuMSwwLjEsMC4xDQoJYzAuMSwwLDAuMSwwLDAuMiwwLjFDNC4zLDUuNSw0LjQsNS41LDQuNiw1LjV6Ii8+DQo8L3N2Zz4NCg==?fill=%238d5a99&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMiA4LjQiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMiA4LjQ7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik00LjYsNS41bDAtMC4yYy0wLjIsMC0wLjMsMC0wLjUtMC4xYzAsMC0wLjEsMC0wLjEtMC4xQzQsNS4xLDMuOSw1LDMuOSw0LjljMC0wLjEsMC0wLjIsMC0wLjMNCglDMy45LDQuNSw0LDQuNCw0LDQuM2MwLjEtMC4zLDAuNC0wLjQsMC42LTAuNWMwLjMtMC4xLDAuNi0wLjEsMC44LDBjMC40LDAuMSwwLjcsMC40LDAuOSwwLjdjMC4yLDAuNCwwLjMsMC44LDAuMywxLjMNCgljMCwwLjYtMC4zLDEuMS0wLjgsMS41Yy0wLjYsMC40LTEuMywwLjYtMiwwLjZDMi43LDcuNywxLjcsNywxLjEsNkMwLjgsNS4zLDAuNyw0LjUsMC44LDMuOEMxLDIuOSwxLjUsMi4xLDIuMiwxLjYNCglDMi43LDEuMiwzLjQsMSw0LDFDNC41LDEsNSwxLDUuNCwxLjFsMC4yLTFDNC45LDAsNC4yLDAsMy41LDAuMUMzLDAuMiwyLjYsMC4zLDIuMiwwLjVDMS4zLDEuMSwwLjYsMS45LDAuMywyLjkNCglDMCwzLjcsMCw0LjcsMC4yLDUuNmMwLjEsMC40LDAuMiwwLjcsMC41LDEuMUMxLjEsNy4yLDEuNiw3LjcsMi4zLDhDMyw4LjMsMy44LDguNSw0LjUsOC4zYzAuNS0wLjEsMS0wLjMsMS41LTAuNg0KCWMwLjYtMC4zLDEuMS0xLDEuMS0xLjdDNy4yLDUuMyw3LDQuNiw2LjUsNEM2LjMsMy44LDYsMy42LDUuNywzLjVDNS41LDMuNCw1LjIsMy40LDUsMy40Yy0wLjMsMC0wLjUsMC4xLTAuNywwLjMNCglDNCwzLjksMy44LDQuMSwzLjcsNC4zYzAsMC4xLTAuMSwwLjItMC4xLDAuM2MwLDAuMSwwLDAuMiwwLDAuM2MwLDAuMSwwLDAuMSwwLjEsMC4yYzAsMC4xLDAuMSwwLjEsMC4xLDAuMmMwLDAsMC4xLDAuMSwwLjEsMC4xDQoJYzAuMSwwLDAuMSwwLDAuMiwwLjFDNC4zLDUuNSw0LjQsNS41LDQuNiw1LjV6Ii8+DQo8L3N2Zz4NCg=="/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#8d5a99</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>11</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>affioramento di interesse sedimentologico</se:Name>
     <se:Description>
      <se:Title>affioramento di interesse sedimentologico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1200</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>star</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>9</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>slump intraformazionale non cartografabile</se:Name>
     <se:Description>
      <se:Title>slump intraformazionale non cartografabile</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1220</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAzLjkiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAzLjk7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0wLjMsMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBjMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVjMCwwLjMsMC4yLDAuNiwwLjQsMC44DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjUsMC40LTAuOGMwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzQsMC41LDQuMSwwLjcsNC4xLDAuOA0KCWMwLDAuMywwLjIsMC42LDAuNCwwLjhjMC4zLDAuMiwwLjYsMC4yLDAuOSwwYzAuMy0wLjIsMC40LTAuNSwwLjQtMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDANCgljMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVoMC4zYzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjUsMCw2LjIsMCw1LjksMC4xQzUuNywwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzQuNSwxLjMsNC40LDEuMSw0LjQsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjIsMC4xQzIuOSwwLjMsMi44LDAuNSwyLjgsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuOCwxLjMsMS42LDEuMSwxLjYsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN1MwLjcsMCwwLjQsMC4xQzAuMiwwLjMsMCwwLjUsMCwwLjgNCglIMC4zeiIvPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTAuMywzYzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBDMS4zLDIuNywxLjQsMi44LDEuNCwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUMyLDQsMi40LDQsMi42LDMuOEMyLjksMy43LDMuMSwzLjQsMy4xLDNjMC0wLjIsMC4xLTAuNCwwLjMtMC41YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDIuNyw0LjEsMi44LDQuMSwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUM0LjgsNCw1LjEsNCw1LjQsMy44QzUuNiwzLjcsNS44LDMuNCw1LjgsM2MwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzYuNywyLjcsNi44LDIuOCw2LjgsM2gwLjMNCgljMC0wLjMtMC4yLTAuNi0wLjQtMC43Yy0wLjItMC4yLTAuNi0wLjItMC44LDBDNS43LDIuNSw1LjUsMi43LDUuNSwzYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwDQoJQzQuNSwzLjQsNC40LDMuMiw0LjQsM2MwLTAuMy0wLjItMC42LTAuNC0wLjdjLTAuMi0wLjItMC42LTAuMi0wLjgsMEMyLjksMi41LDIuOCwyLjcsMi44LDNjMCwwLjItMC4xLDAuNC0wLjMsMC41DQoJYy0wLjIsMC4xLTAuNCwwLjEtMC42LDBDMS44LDMuNCwxLjYsMy4yLDEuNiwzYzAtMC4zLTAuMi0wLjYtMC40LTAuN0MxLDIuMSwwLjcsMi4xLDAuNCwyLjNDMC4yLDIuNSwwLDIuNywwLDNIMC4zeiIvPg0KPC9zdmc+DQo=?fill=%23ff0000&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAzLjkiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAzLjk7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik0wLjMsMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBjMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVjMCwwLjMsMC4yLDAuNiwwLjQsMC44DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjUsMC40LTAuOGMwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzQsMC41LDQuMSwwLjcsNC4xLDAuOA0KCWMwLDAuMywwLjIsMC42LDAuNCwwLjhjMC4zLDAuMiwwLjYsMC4yLDAuOSwwYzAuMy0wLjIsMC40LTAuNSwwLjQtMC44YzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDANCgljMC4yLDAuMSwwLjMsMC4zLDAuMywwLjVoMC4zYzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjUsMCw2LjIsMCw1LjksMC4xQzUuNywwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzQuNSwxLjMsNC40LDEuMSw0LjQsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjIsMC4xQzIuOSwwLjMsMi44LDAuNSwyLjgsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuOCwxLjMsMS42LDEuMSwxLjYsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN1MwLjcsMCwwLjQsMC4xQzAuMiwwLjMsMCwwLjUsMCwwLjgNCglIMC4zeiIvPg0KPHBhdGggY2xhc3M9InN0MCIgZD0iTTAuMywzYzAtMC4yLDAuMS0wLjQsMC4zLTAuNWMwLjItMC4xLDAuNC0wLjEsMC41LDBDMS4zLDIuNywxLjQsMi44LDEuNCwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUMyLDQsMi40LDQsMi42LDMuOEMyLjksMy43LDMuMSwzLjQsMy4xLDNjMC0wLjIsMC4xLTAuNCwwLjMtMC41YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDIuNyw0LjEsMi44LDQuMSwzYzAsMC4zLDAuMiwwLjYsMC40LDAuOA0KCUM0LjgsNCw1LjEsNCw1LjQsMy44QzUuNiwzLjcsNS44LDMuNCw1LjgsM2MwLTAuMiwwLjEtMC40LDAuMy0wLjVjMC4yLTAuMSwwLjQtMC4xLDAuNSwwQzYuNywyLjcsNi44LDIuOCw2LjgsM2gwLjMNCgljMC0wLjMtMC4yLTAuNi0wLjQtMC43Yy0wLjItMC4yLTAuNi0wLjItMC44LDBDNS43LDIuNSw1LjUsMi43LDUuNSwzYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwDQoJQzQuNSwzLjQsNC40LDMuMiw0LjQsM2MwLTAuMy0wLjItMC42LTAuNC0wLjdjLTAuMi0wLjItMC42LTAuMi0wLjgsMEMyLjksMi41LDIuOCwyLjcsMi44LDNjMCwwLjItMC4xLDAuNC0wLjMsMC41DQoJYy0wLjIsMC4xLTAuNCwwLjEtMC42LDBDMS44LDMuNCwxLjYsMy4yLDEuNiwzYzAtMC4zLTAuMi0wLjYtMC40LTAuN0MxLDIuMSwwLjcsMi4xLDAuNCwyLjNDMC4yLDIuNSwwLDIuNywwLDNIMC4zeiIvPg0KPC9zdmc+DQo="/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>9</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>3</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>affioramento di interesse strutturale</se:Name>
     <se:Description>
      <se:Title>affioramento di interesse strutturale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1300</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stazione strutturale (numerata)</se:Name>
     <se:Description>
      <se:Title>stazione strutturale (numerata)</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1310</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>6</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>affioramento/località di interesse mineralogico petrografico</se:Name>
     <se:Description>
      <se:Title>affioramento/località di interesse mineralogico petrografico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1400</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjEiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjE7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxnPg0KCTxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik01LjYsMGgwLjdINS42TDUuNiwweiBNNi40LDB2MS42TDUuNiwwSDYuNHoiLz4NCjwvZz4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy44LDQuOSA1LjYsMCA2LjQsMS41IDQuNCw3LjEgIi8+DQo8cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjEuMywxLjUgMy4zLDcuMSAzLjgsNC45IDIuMSwwICIvPg0KPHBvbHlnb24gY2xhc3M9InN0MCIgcG9pbnRzPSIxLjMsMCAxLjMsMS41IDEuMywxLjUgMi4xLDAgIi8+DQo8Zz4NCgk8cGF0aCBjbGFzcz0ic3QwIiBkPSJNMy4zLDcuMWgxSDMuM0wzLjMsNy4xeiBNNC40LDcuMUwzLjgsNC45TDMuMyw3LjFINC40eiIvPg0KPC9nPg0KPHJlY3QgeD0iNi40IiB5PSIwIiBjbGFzcz0ic3QwIiB3aWR0aD0iMS4zIiBoZWlnaHQ9IjcuMSIvPg0KPHJlY3QgeT0iMCIgY2xhc3M9InN0MCIgd2lkdGg9IjEuMyIgaGVpZ2h0PSI3LjEiLz4NCjwvc3ZnPg0K?fill=%23ff0000&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjEiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjE7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxnPg0KCTxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik01LjYsMGgwLjdINS42TDUuNiwweiBNNi40LDB2MS42TDUuNiwwSDYuNHoiLz4NCjwvZz4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy44LDQuOSA1LjYsMCA2LjQsMS41IDQuNCw3LjEgIi8+DQo8cG9seWdvbiBjbGFzcz0ic3QwIiBwb2ludHM9IjEuMywxLjUgMy4zLDcuMSAzLjgsNC45IDIuMSwwICIvPg0KPHBvbHlnb24gY2xhc3M9InN0MCIgcG9pbnRzPSIxLjMsMCAxLjMsMS41IDEuMywxLjUgMi4xLDAgIi8+DQo8Zz4NCgk8cGF0aCBjbGFzcz0ic3QwIiBkPSJNMy4zLDcuMWgxSDMuM0wzLjMsNy4xeiBNNC40LDcuMUwzLjgsNC45TDMuMyw3LjFINC40eiIvPg0KPC9nPg0KPHJlY3QgeD0iNi40IiB5PSIwIiBjbGFzcz0ic3QwIiB3aWR0aD0iMS4zIiBoZWlnaHQ9IjcuMSIvPg0KPHJlY3QgeT0iMCIgY2xhc3M9InN0MCIgd2lkdGg9IjEuMyIgaGVpZ2h0PSI3LjEiLz4NCjwvc3ZnPg0K"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>9</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>3</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>profilo pedogenetico</se:Name>
     <se:Description>
      <se:Title>profilo pedogenetico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1500</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy42LDMuNiAzLjYsMCA0LjEsMCA0LjEsMy42IDcuNiwyLjUgNy43LDMgNC4zLDQuMSA2LjQsNy4xIDYsNy40IDMuOCw0LjQgMS43LDcuNCAxLjMsNy4xIDMuNCw0LjEgDQoJMCwzIDAuMSwyLjUgIi8+DQo8L3N2Zz4NCg==?fill=%230082ca&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuNyA3LjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuNyA3LjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDgyQ0E7fQ0KPC9zdHlsZT4NCjxwb2x5Z29uIGNsYXNzPSJzdDAiIHBvaW50cz0iMy42LDMuNiAzLjYsMCA0LjEsMCA0LjEsMy42IDcuNiwyLjUgNy43LDMgNC4zLDQuMSA2LjQsNy4xIDYsNy40IDMuOCw0LjQgMS43LDcuNCAxLjMsNy4xIDMuNCw0LjEgDQoJMCwzIDAuMSwyLjUgIi8+DQo8L3N2Zz4NCg=="/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>10</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>3</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione diritta</se:Name>
     <se:Description>
      <se:Title>stratificazione diritta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3100</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>2</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>clinostratificazione</se:Name>
     <se:Description>
      <se:Title>clinostratificazione</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3101</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>2</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione orizzontale diritta</se:Name>
     <se:Description>
      <se:Title>stratificazione orizzontale diritta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3110</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:VendorOption name="widthHeightFactor">0.0555556</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione verticale con indicazione della polarità</se:Name>
     <se:Description>
      <se:Title>stratificazione verticale con indicazione della polarità</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>3</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione rovesciata</se:Name>
     <se:Description>
      <se:Title>stratificazione rovesciata</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation/>
       <se:Displacement>
        <se:DisplacementX>2</se:DisplacementX>
        <se:DisplacementY>4</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>2</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>half_arc</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione orizzontale rovesciata</se:Name>
     <se:Description>
      <se:Title>stratificazione orizzontale rovesciata</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3131</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:VendorOption name="widthHeightFactor">0.05</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>9</se:Size>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione contorta con valori medi di immersione ed inclinazione</se:Name>
     <se:Description>
      <se:Title>stratificazione contorta con valori medi di immersione ed inclinazione</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxpdmVsbG9fMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiDQoJIHdpZHRoPSIyMjMuMjEycHgiIGhlaWdodD0iMjMxLjAzOHB4IiB2aWV3Qm94PSIzMDAuNzQ2IDIzOC42MDEgMjIzLjIxMiAyMzEuMDM4Ig0KCSBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDMwMC43NDYgMjM4LjYwMSAyMjMuMjEyIDIzMS4wMzgiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPHBhdGggZmlsbD0iIzAwMTY4OSIgZD0iTTQwNy44ODUsMzQ1Ljc2OWMyLjkzLTIxLjE1LTEyLjQ3OS0xMC45MjgtMTIuOTQ5LTM1LjA5OGMxLjk5Mi0xOC4wMiwxMC40ODctMTguMTY0LDIxLjI3MS0yNS40Mw0KCWM0LjkyMi01LjAxLDYuMzg4LTExLjEwNCwzLjU3NC0xNy43MjVjLTcuNTYtMTIuNjI3LTEyLjUxMS03LjQ0MS0xMS44OTYtMjguODI4bDguOTA1LTAuMDg4DQoJYy0wLjk2NywxOC43NSw0LjQyNCwxMS41NDMsMTEuMTYyLDI1LjM3YzQuMzA4LDkuOTksMi4wNTIsMjAuMTU2LTUuNTM3LDI3Ljc0NGMtNy41Niw3LjExOS0xNy4xNCw0Ljg2My0xOC41NDUsMTkuMzY1DQoJYy0wLjE3NywxNy4xMDgsMTUuMDYsOC41ODQsMTIuOTIsMzQuNjg4aDEwNy4xNjh2MTcuODcxSDMwMC43NDZ2LTE3Ljg3MUw0MDcuODg1LDM0NS43NjkiLz4NCjxwYXRoIGZpbGw9Im5vbmUiIGQ9Ik00MTYuODE5LDM2Mi40NzFjLTIuOTMsMjEuMTUsMTIuNDc5LDEwLjkyOCwxMi45NDksMzUuMDk4Yy0xLjk5MiwxOC4wMi0xMC40ODcsMTguMTY0LTIxLjI3MSwyNS40Mw0KCWMtNC45MjIsNS4wMS02LjM4OCwxMS4xMDQtMy41NzQsMTcuNzI1YzcuNTYsMTIuNjI3LDEyLjUxMSw3LjQ0MSwxMS44OTYsMjguODI4bC04LjkwNSwwLjA4OA0KCWMwLjk2Ny0xOC43NS00LjQyNC0xMS41NDMtMTEuMTYyLTI1LjM3Yy00LjMwOC05Ljk5LTIuMDUyLTIwLjE1Niw1LjUzNy0yNy43NDRjNy41Ni03LjExOSwxNy4xNC00Ljg2MywxOC41NDUtMTkuMzY1DQoJYzAuMTc3LTE3LjEwOC0xNS4wNi04LjU4NC0xMi45Mi0zNC42ODhIMzAwLjc0NnYtMTcuODcxaDIyMy4yMTJ2MTcuODcxTDQxNi44MTksMzYyLjQ3MSIvPg0KPC9zdmc+DQo=?fill=%230082ca&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjAsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxpdmVsbG9fMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiDQoJIHdpZHRoPSIyMjMuMjEycHgiIGhlaWdodD0iMjMxLjAzOHB4IiB2aWV3Qm94PSIzMDAuNzQ2IDIzOC42MDEgMjIzLjIxMiAyMzEuMDM4Ig0KCSBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDMwMC43NDYgMjM4LjYwMSAyMjMuMjEyIDIzMS4wMzgiIHhtbDpzcGFjZT0icHJlc2VydmUiPg0KPHBhdGggZmlsbD0iIzAwMTY4OSIgZD0iTTQwNy44ODUsMzQ1Ljc2OWMyLjkzLTIxLjE1LTEyLjQ3OS0xMC45MjgtMTIuOTQ5LTM1LjA5OGMxLjk5Mi0xOC4wMiwxMC40ODctMTguMTY0LDIxLjI3MS0yNS40Mw0KCWM0LjkyMi01LjAxLDYuMzg4LTExLjEwNCwzLjU3NC0xNy43MjVjLTcuNTYtMTIuNjI3LTEyLjUxMS03LjQ0MS0xMS44OTYtMjguODI4bDguOTA1LTAuMDg4DQoJYy0wLjk2NywxOC43NSw0LjQyNCwxMS41NDMsMTEuMTYyLDI1LjM3YzQuMzA4LDkuOTksMi4wNTIsMjAuMTU2LTUuNTM3LDI3Ljc0NGMtNy41Niw3LjExOS0xNy4xNCw0Ljg2My0xOC41NDUsMTkuMzY1DQoJYy0wLjE3NywxNy4xMDgsMTUuMDYsOC41ODQsMTIuOTIsMzQuNjg4aDEwNy4xNjh2MTcuODcxSDMwMC43NDZ2LTE3Ljg3MUw0MDcuODg1LDM0NS43NjkiLz4NCjxwYXRoIGZpbGw9Im5vbmUiIGQ9Ik00MTYuODE5LDM2Mi40NzFjLTIuOTMsMjEuMTUsMTIuNDc5LDEwLjkyOCwxMi45NDksMzUuMDk4Yy0xLjk5MiwxOC4wMi0xMC40ODcsMTguMTY0LTIxLjI3MSwyNS40Mw0KCWMtNC45MjIsNS4wMS02LjM4OCwxMS4xMDQtMy41NzQsMTcuNzI1YzcuNTYsMTIuNjI3LDEyLjUxMSw3LjQ0MSwxMS44OTYsMjguODI4bC04LjkwNSwwLjA4OA0KCWMwLjk2Ny0xOC43NS00LjQyNC0xMS41NDMtMTEuMTYyLTI1LjM3Yy00LjMwOC05Ljk5LTIuMDUyLTIwLjE1Niw1LjUzNy0yNy43NDRjNy41Ni03LjExOSwxNy4xNC00Ljg2MywxOC41NDUtMTkuMzY1DQoJYzAuMTc3LTE3LjEwOC0xNS4wNi04LjU4NC0xMi45Mi0zNC42ODhIMzAwLjc0NnYtMTcuODcxaDIyMy4yMTJ2MTcuODcxTDQxNi44MTksMzYyLjQ3MSIvPg0KPC9zdmc+DQo="/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione a polarità sconosciuta</se:Name>
     <se:Description>
      <se:Title>stratificazione a polarità sconosciuta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>2</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-4</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.857143</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione verticale a polarità sconosciuta</se:Name>
     <se:Description>
      <se:Title>stratificazione verticale a polarità sconosciuta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3151</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>stratificazione orizzontale a polarità sconosciuta</se:Name>
     <se:Description>
      <se:Title>stratificazione orizzontale a polarità sconosciuta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3152</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:VendorOption name="widthHeightFactor">0.05</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>direzione di younging</se:Name>
     <se:Description>
      <se:Title>direzione di younging</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3160</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">0.0416668</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>4</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-5</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>4</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>5</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">1.75</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>superficie di clivaggio o scistosità inclinata</se:Name>
     <se:Description>
      <se:Title>superficie di clivaggio o scistosità inclinata</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3210</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-4</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>superficie di clivaggio o scistosità orizzontale</se:Name>
     <se:Description>
      <se:Title>superficie di clivaggio o scistosità orizzontale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3220</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:VendorOption name="widthHeightFactor">0.0487805</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>superficie di clivaggio o scistosità verticale</se:Name>
     <se:Description>
      <se:Title>superficie di clivaggio o scistosità verticale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3230</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-1</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">25</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>elemento lineare primario (lineazione di origine sedimentaria, direzione di flusso in rocce ignee)</se:Name>
     <se:Description>
      <se:Title>elemento lineare primario (lineazione di origine sedimentaria, direzione di flusso in rocce ignee)</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3310</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>-1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>arrow</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-9</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>elemento lineare primario verticale</se:Name>
     <se:Description>
      <se:Title>elemento lineare primario verticale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3312</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>-1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>elemento lineare primario orizzontale</se:Name>
     <se:Description>
      <se:Title>elemento lineare primario orizzontale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3313</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>29</se:Size>
       <se:Rotation>
        <ogc:Literal>90</ogc:Literal>
       </se:Rotation>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>7</se:Size>
       <se:Rotation>
        <ogc:Literal>90</ogc:Literal>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-14</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.833333</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>7</se:Size>
       <se:Rotation>
        <ogc:Literal>270</ogc:Literal>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-14</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.833333</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>lineazione di estensione (orientazione preferenziale di forma)</se:Name>
     <se:Description>
      <se:Title>lineazione di estensione (orientazione preferenziale di forma)</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3320</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>9</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>21</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-11</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.6</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>lineazione minerale</se:Name>
     <se:Description>
      <se:Title>lineazione minerale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3321</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>6</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>9</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">9</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>21</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-11</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">0.6</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>associazione di pieghe minori</se:Name>
     <se:Description>
      <se:Title>associazione di pieghe minori</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3440</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <!--Parametric SVG-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAxLjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAxLjc7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDE2ODk7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik03LjEsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjQsMCw2LjEsMCw1LjksMC4xQzUuNiwwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCUM1LDEuNCw0LjgsMS40LDQuNiwxLjNDNC41LDEuMiw0LjMsMSw0LjMsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjEsMC4xQzIuOSwwLjMsMi43LDAuNSwyLjcsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuNywxLjIsMS42LDEsMS42LDAuOGMwLTAuMy0wLjItMC42LTAuNC0wLjdDMSwwLDAuNywwLDAuNCwwLjFDMC4yLDAuMywwLDAuNSwwLDAuOA0KCWgwLjNjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMGMwLjIsMC4xLDAuMywwLjMsMC4zLDAuNGMwLDAuMywwLjIsMC42LDAuNCwwLjdjMC4zLDAuMiwwLjYsMC4yLDAuOSwwDQoJQzIuOSwxLjQsMywxLjEsMywwLjhjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDAuNSw0LjEsMC42LDQuMSwwLjhjMCwwLjMsMC4yLDAuNiwwLjQsMC43DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjQsMC40LTAuN2MwLTAuMiwwLjEtMC40LDAuMy0wLjRjMC4yLTAuMSwwLjQtMC4xLDAuNSwwYzAuMiwwLjEsMC4zLDAuMywwLjMsMC40SDcuMXoiLz4NCjwvc3ZnPg0K?fill=%230082ca&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Plain SVG fallback, no parameters-->
       <se:ExternalGraphic>
        <se:OnlineResource xlink:type="simple" xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4zLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDcuMSAxLjciIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDcuMSAxLjc7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsLXJ1bGU6ZXZlbm9kZDtjbGlwLXJ1bGU6ZXZlbm9kZDtmaWxsOiMwMDE2ODk7fQ0KPC9zdHlsZT4NCjxwYXRoIGNsYXNzPSJzdDAiIGQ9Ik03LjEsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0M2LjQsMCw2LjEsMCw1LjksMC4xQzUuNiwwLjMsNS41LDAuNSw1LjUsMC44YzAsMC4yLTAuMSwwLjQtMC4zLDAuNQ0KCUM1LDEuNCw0LjgsMS40LDQuNiwxLjNDNC41LDEuMiw0LjMsMSw0LjMsMC44YzAtMC4zLTAuMi0wLjYtMC40LTAuN0MzLjcsMCwzLjQsMCwzLjEsMC4xQzIuOSwwLjMsMi43LDAuNSwyLjcsMC44DQoJYzAsMC4yLTAuMSwwLjQtMC4zLDAuNWMtMC4yLDAuMS0wLjQsMC4xLTAuNiwwQzEuNywxLjIsMS42LDEsMS42LDAuOGMwLTAuMy0wLjItMC42LTAuNC0wLjdDMSwwLDAuNywwLDAuNCwwLjFDMC4yLDAuMywwLDAuNSwwLDAuOA0KCWgwLjNjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMGMwLjIsMC4xLDAuMywwLjMsMC4zLDAuNGMwLDAuMywwLjIsMC42LDAuNCwwLjdjMC4zLDAuMiwwLjYsMC4yLDAuOSwwDQoJQzIuOSwxLjQsMywxLjEsMywwLjhjMC0wLjIsMC4xLTAuNCwwLjMtMC40YzAuMi0wLjEsMC40LTAuMSwwLjUsMEM0LDAuNSw0LjEsMC42LDQuMSwwLjhjMCwwLjMsMC4yLDAuNiwwLjQsMC43DQoJYzAuMywwLjIsMC42LDAuMiwwLjksMGMwLjMtMC4yLDAuNC0wLjQsMC40LTAuN2MwLTAuMiwwLjEtMC40LDAuMy0wLjRjMC4yLTAuMSwwLjQtMC4xLDAuNSwwYzAuMiwwLjEsMC4zLDAuMywwLjMsMC40SDcuMXoiLz4NCjwvc3ZnPg0K"/>
        <se:Format>image/svg+xml</se:Format>
       </se:ExternalGraphic>
       <!--Well known marker fallback-->
       <se:Mark>
        <se:WellKnownName>square</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>asse di piega</se:Name>
     <se:Description>
      <se:Title>asse di piega</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3450</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>left_half_triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>-7</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>asse di piega orizzontale</se:Name>
     <se:Description>
      <se:Title>asse di piega orizzontale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3451</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>-1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>right_half_triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>-1</se:DisplacementX>
        <se:DisplacementY>-5</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>line</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>1</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>left_half_triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#001689</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>5</se:Size>
       <se:Rotation>
        <ogc:PropertyName>DIREZIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>1</se:DisplacementX>
        <se:DisplacementY>-5</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>asse di piega verticale</se:Name>
     <se:Description>
      <se:Title>asse di piega verticale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3452</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
         <se:SvgParameter name="fill-opacity">0</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">1</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>11</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>cross2</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#001689</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>8</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>specchio di faglia inclinato</se:Name>
     <se:Description>
      <se:Title>specchio di faglia inclinato</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3330</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0200</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>0</se:DisplacementX>
        <se:DisplacementY>2</se:DisplacementY>
       </se:Displacement>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0200</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:Rotation>
        <ogc:PropertyName>IMMERSIO</ogc:PropertyName>
       </se:Rotation>
       <se:VendorOption name="widthHeightFactor">0.125</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>specchio di faglia verticale</se:Name>
     <se:Description>
      <se:Title>specchio di faglia verticale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3331</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0028</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0028</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>3</se:Size>
       <se:Rotation/>
       <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>specchio di faglia orizzontale</se:Name>
     <se:Description>
      <se:Title>specchio di faglia orizzontale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3332</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0028</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>14</se:Size>
       <se:VendorOption name="widthHeightFactor">12.5</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>rectangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0028</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>1</se:Size>
       <se:VendorOption name="widthHeightFactor">0.0555556</se:VendorOption>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name></se:Name>
     <se:Description>
      <se:Title>"TIPO" is ''</se:Title>
     </se:Description>
     <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>circle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ff0028</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#232323</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>7</se:Size>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
    <se:Rule>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsGreaterThan>
       <ogc:PropertyName>Tipo</ogc:PropertyName>
       <ogc:Literal>3000</ogc:Literal>
      </ogc:PropertyIsGreaterThan>
     </ogc:Filter>
     <se:MaxScaleDenominator>10000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>Inclina</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">Arial</se:SvgParameter>
       <se:SvgParameter name="font-size">10</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Halo>
       <se:Radius>2</se:Radius>
       <se:Fill>
        <se:SvgParameter name="fill">#ffffff</se:SvgParameter>
       </se:Fill>
      </se:Halo>
      <se:Fill>
       <se:SvgParameter name="fill">#001689</se:SvgParameter>
      </se:Fill>
      <se:VendorOption name="maxDisplacement">1</se:VendorOption>
     </se:TextSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio apr 16 14:33:09 2026$d$, 'postgres', 'Point');

-- rilevamento.gps
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'gps', 'geom', 'stile_gps',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" autoRefreshTime="0" symbologyReferenceScale="-1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="1" simplifyDrawingTol="1" maxScale="0" autoRefreshMode="Disabled" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.44.8-Solothurn" labelsEnabled="0" minScale="100000000">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal enabled="0" accumulate="0" durationUnit="min" startField="data_ora" startExpression="" mode="0" endExpression="" limitMode="0" durationField="id" endField="" fixedDuration="0">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation extrusionEnabled="0" binding="Centroid" symbology="Line" extrusion="0" clamping="Terrain" customToleranceEnabled="0" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" zscale="1" respectLayerSymbol="1" zoffset="0">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b34b2a1c-8b58-404b-ae5e-61b5e96f143d}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="183,72,75,255,rgb:0.7176471,0.2823529,0.2941176,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="fill" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{4beafbd6-14f2-488e-b462-a18e1ae23a36}">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="183,72,75,255,rgb:0.7176471,0.2823529,0.2941176,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="131,51,54,255,rgb:0.5125963,0.2016785,0.210071,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{91283923-6da7-4925-b741-5e200573862f}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="183,72,75,255,rgb:0.7176471,0.2823529,0.2941176,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="131,51,54,255,rgb:0.5125963,0.2016785,0.210071,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 forceraster="0" enableorderby="0" type="singleSymbol" symbollevels="0" referencescale="-1">
  <symbols>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{4ccda640-0b91-4eb9-9d13-3c1d792117e9}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="10;10"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="RenderMetersInMapUnits"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="255,195,0,255,hsv:0.12716666666666668,1,1,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{20d4ae82-1147-4e78-ae31-14605ff0a6a2}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="63,63,194,255,hsv:0.66666666666666663,0.67365529869535368,0.76249332417792015,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{ca32def2-5b20-42dd-b2ed-574854043fc1}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/remoteLayerId" type="QString" value="gps_e4aabc12_b135_4b40_9805_392d7d80ac2f"/>
   <Option name="QFieldSync/sourceDataPrimaryKeys" type="QString" value="fid"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>1</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration/>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="data_ora" configurationFlags="NoFlag">
   <editWidget type="DateTime">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="QString" value=""/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="QString" value=""/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="data_ora" name="" index="2"/>
  <alias field="created_at" name="" index="3"/>
  <alias field="updated_at" name="" index="4"/>
  <alias field="created_by" name="" index="5"/>
  <alias field="updated_by" name="" index="6"/>
  <alias field="is_deleted" name="Da scartare" index="7"/>
 </aliases>
 <defaults>
  <default field="id" expression="" applyOnUpdate="0"/>
  <default field="fid" expression="" applyOnUpdate="0"/>
  <default field="data_ora" expression="" applyOnUpdate="0"/>
  <default field="created_at" expression="" applyOnUpdate="0"/>
  <default field="updated_at" expression="" applyOnUpdate="0"/>
  <default field="created_by" expression="" applyOnUpdate="0"/>
  <default field="updated_by" expression="" applyOnUpdate="0"/>
  <default field="is_deleted" expression="" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint constraints="3" field="id" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="3" field="fid" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="0" field="data_ora" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="1" field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="data_ora" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
  <columns>
   <column name="fid" type="field" hidden="0" width="-1"/>
   <column name="id" type="field" hidden="0" width="-1"/>
   <column name="data_ora" type="field" hidden="0" width="-1"/>
   <column name="created_at" type="field" hidden="0" width="-1"/>
   <column name="updated_at" type="field" hidden="0" width="-1"/>
   <column name="created_by" type="field" hidden="0" width="-1"/>
   <column name="updated_by" type="field" hidden="0" width="-1"/>
   <column name="is_deleted" type="field" hidden="0" width="-1"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="data_ora" editable="1"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="data_ora"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
 </labelOnTop>
 <reuseLastValue>
  <field name="created_at" reuseLastValue="0"/>
  <field name="created_by" reuseLastValue="0"/>
  <field name="data_ora" reuseLastValue="0"/>
  <field name="fid" reuseLastValue="0"/>
  <field name="id" reuseLastValue="0"/>
  <field name="is_deleted" reuseLastValue="0"/>
  <field name="updated_at" reuseLastValue="0"/>
  <field name="updated_by" reuseLastValue="0"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>"fid"</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>1</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
 <NamedLayer>
  <se:Name>gps</se:Name>
  <UserStyle>
   <se:Name>gps</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Single symbol</se:Name>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ffc300</se:SvgParameter>
       <se:SvgParameter name="stroke-width">2</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">10 10</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#3f3fc2</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio apr 16 14:33:29 2026$d$, 'postgres', 'Line');

-- rilevamento.campioni
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'campioni', 'geom', 'stile_campioni',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" autoRefreshTime="0" symbologyReferenceScale="-1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="0" simplifyDrawingTol="1" maxScale="0" autoRefreshMode="Disabled" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.44.8-Solothurn" labelsEnabled="0" minScale="100000000">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal enabled="0" accumulate="0" durationUnit="min" startField="data_ora" startExpression="" mode="0" endExpression="" limitMode="0" durationField="id" endField="" fixedDuration="0">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation extrusionEnabled="0" binding="Centroid" symbology="Line" extrusion="0" clamping="Terrain" customToleranceEnabled="0" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" zscale="1" respectLayerSymbol="1" zoffset="0">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{a1352ad7-997a-41c3-875c-ce7d09086db1}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="fill" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{9a49417e-f096-436d-80d3-9a8cf6df9fdd}">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="136,148,57,255,rgb:0.5322194,0.5798276,0.224094,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{38602d4e-1634-4c41-bb47-9e9a9a039550}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="136,148,57,255,rgb:0.5322194,0.5798276,0.224094,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 forceraster="0" enableorderby="0" type="singleSymbol" symbollevels="0" referencescale="-1">
  <symbols>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{35d7fd9d-cefe-421b-8d54-010cbc27c4de}">
     <Option type="Map">
      <Option name="angle" type="QString" value="180"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,195,0,255,hsv:0.12716666666666668,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="triangle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,0,rgb:0.1372549,0.1372549,0.1372549,0"/>
      <Option name="outline_style" type="QString" value="no"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{a8144a40-1db4-4576-9825-05bd8d2dc14a}">
     <Option type="Map">
      <Option name="angle" type="QString" value="270"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,195,0,255,hsv:0.12716666666666668,1,1,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="filled_arrowhead"/>
      <Option name="offset" type="QString" value="2.79999999999999982,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="255,195,0,0,hsv:0.12716666666666668,1,1,0"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2.4"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{53d93f93-8eee-463b-82f0-ce593a45ef48}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="circle"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="2"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/remoteLayerId" type="QString" value="campioni_66d3987a_c1ec_42b7_aa83_b786422cddb8"/>
   <Option name="QFieldSync/sourceDataPrimaryKeys" type="QString" value="fid"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>1</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration/>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Sigla" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option name="IsMultiline" type="bool" value="false"/>
      <Option name="UseHtml" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Note" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option name="IsMultiline" type="bool" value="false"/>
      <Option name="UseHtml" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="data_ora" configurationFlags="NoFlag">
   <editWidget type="DateTime">
    <config>
     <Option type="Map">
      <Option name="allow_null" type="bool" value="false"/>
      <Option name="calendar_popup" type="bool" value="false"/>
      <Option name="display_format" type="QString" value="dd/MM/yyyy HH:mm"/>
      <Option name="field_format" type="QString" value="yyyy-MM-dd HH:mm:ss"/>
      <Option name="field_format_overwrite" type="bool" value="false"/>
      <Option name="field_iso_format" type="bool" value="false"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="QString" value=""/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="QString" value=""/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="Sigla" name="" index="2"/>
  <alias field="Note" name="" index="3"/>
  <alias field="data_ora" name="" index="4"/>
  <alias field="created_at" name="" index="5"/>
  <alias field="updated_at" name="" index="6"/>
  <alias field="created_by" name="" index="7"/>
  <alias field="updated_by" name="" index="8"/>
  <alias field="is_deleted" name="Da scartare" index="9"/>
 </aliases>
 <splitPolicies>
  <policy field="id" policy="DefaultValue"/>
  <policy field="fid" policy="DefaultValue"/>
  <policy field="Sigla" policy="DefaultValue"/>
  <policy field="Note" policy="DefaultValue"/>
  <policy field="data_ora" policy="DefaultValue"/>
  <policy field="created_at" policy="DefaultValue"/>
  <policy field="updated_at" policy="DefaultValue"/>
  <policy field="created_by" policy="DefaultValue"/>
  <policy field="updated_by" policy="DefaultValue"/>
  <policy field="is_deleted" policy="DefaultValue"/>
 </splitPolicies>
 <defaults>
  <default field="id" expression="" applyOnUpdate="0"/>
  <default field="fid" expression="" applyOnUpdate="0"/>
  <default field="Sigla" expression="" applyOnUpdate="0"/>
  <default field="Note" expression="" applyOnUpdate="0"/>
  <default field="data_ora" expression="now()" applyOnUpdate="0"/>
  <default field="created_at" expression="" applyOnUpdate="0"/>
  <default field="updated_at" expression="" applyOnUpdate="0"/>
  <default field="created_by" expression="" applyOnUpdate="0"/>
  <default field="updated_by" expression="" applyOnUpdate="0"/>
  <default field="is_deleted" expression="" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint constraints="3" field="id" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="3" field="fid" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="0" field="Sigla" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Note" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="data_ora" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="1" field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="Sigla" desc="" exp=""/>
  <constraint field="Note" desc="" exp=""/>
  <constraint field="data_ora" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
  <columns>
   <column name="fid" type="field" hidden="0" width="-1"/>
   <column name="Sigla" type="field" hidden="0" width="-1"/>
   <column name="Note" type="field" hidden="0" width="-1"/>
   <column name="data_ora" type="field" hidden="0" width="-1"/>
   <column name="id" type="field" hidden="0" width="-1"/>
   <column name="created_at" type="field" hidden="0" width="-1"/>
   <column name="updated_at" type="field" hidden="0" width="-1"/>
   <column name="created_by" type="field" hidden="0" width="-1"/>
   <column name="updated_by" type="field" hidden="0" width="-1"/>
   <column name="is_deleted" type="field" hidden="0" width="-1"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="Note" editable="1"/>
  <field name="Sigla" editable="1"/>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="data_ora" editable="0"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="Note"/>
  <field labelOnTop="0" name="Sigla"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="data_ora"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
 </labelOnTop>
 <reuseLastValue>
  <field name="Note" reuseLastValue="0"/>
  <field name="Sigla" reuseLastValue="0"/>
  <field name="created_at" reuseLastValue="0"/>
  <field name="created_by" reuseLastValue="0"/>
  <field name="data_ora" reuseLastValue="0"/>
  <field name="fid" reuseLastValue="0"/>
  <field name="id" reuseLastValue="0"/>
  <field name="is_deleted" reuseLastValue="0"/>
  <field name="updated_at" reuseLastValue="0"/>
  <field name="updated_by" reuseLastValue="0"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>"Sigla"</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>0</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
 <NamedLayer>
  <se:Name>campioni</se:Name>
  <UserStyle>
   <se:Name>campioni</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>Single symbol</se:Name>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>triangle</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ffc300</se:SvgParameter>
        </se:Fill>
        <se:Stroke/>
       </se:Mark>
       <se:Size>9</se:Size>
       <se:Rotation>
        <ogc:Literal>180</ogc:Literal>
       </se:Rotation>
      </se:Graphic>
     </se:PointSymbolizer>
     <se:PointSymbolizer>
      <se:Graphic>
       <se:Mark>
        <se:WellKnownName>filled_arrowhead</se:WellKnownName>
        <se:Fill>
         <se:SvgParameter name="fill">#ffc300</se:SvgParameter>
        </se:Fill>
        <se:Stroke>
         <se:SvgParameter name="stroke">#ffc300</se:SvgParameter>
         <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
         <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
        </se:Stroke>
       </se:Mark>
       <se:Size>9</se:Size>
       <se:Rotation>
        <ogc:Literal>270</ogc:Literal>
       </se:Rotation>
       <se:Displacement>
        <se:DisplacementX>10</se:DisplacementX>
        <se:DisplacementY>0</se:DisplacementY>
       </se:Displacement>
      </se:Graphic>
     </se:PointSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio apr 16 14:32:52 2026$d$, 'postgres', 'Point');

-- rilevamento.linee_substrato
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'linee_substrato', 'geom', 'stile_linee_substrato',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" autoRefreshTime="0" symbologyReferenceScale="-1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="1" simplifyDrawingTol="1" maxScale="0" autoRefreshMode="Disabled" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.44.8-Solothurn" labelsEnabled="0" minScale="0">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal enabled="0" accumulate="0" durationUnit="min" startField="created_at" startExpression="" mode="0" endExpression="" limitMode="0" durationField="id" endField="" fixedDuration="0">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation extrusionEnabled="0" binding="Centroid" symbology="Line" extrusion="0" clamping="Terrain" customToleranceEnabled="0" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" zscale="1" respectLayerSymbol="1" zoffset="0">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b4ffd8a6-e528-4dd8-b9cb-d4d0c2c1d07b}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="145,82,45,255,rgb:0.5686275,0.3215686,0.1764706,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="fill" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{088ec76b-dc2b-4ae8-a460-b3a05e96e6be}">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="145,82,45,255,rgb:0.5686275,0.3215686,0.1764706,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="104,59,32,255,rgb:0.4061494,0.2296788,0.1260395,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{5ad853cd-12b5-4089-becb-73c09e08afa7}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="145,82,45,255,rgb:0.5686275,0.3215686,0.1764706,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="104,59,32,255,rgb:0.4061494,0.2296788,0.1260395,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 forceraster="0" enableorderby="0" type="categorizedSymbol" symbollevels="0" attr="TIPO" referencescale="-1">
  <categories>
   <category label="contatto stratigrafico o litologico" render="true" type="string" uuid="0" symbol="0" value="1000"/>
   <category label="contatto stratigrafico inconforme" render="true" type="string" uuid="2" symbol="1" value="1100"/>
   <category label="contatto stratigrafico o litologico incerto" render="true" type="string" uuid="4" symbol="2" value="1500"/>
   <category label="contatto stratigrafico inconforme incerto" render="true" type="string" uuid="5" symbol="3" value="1600"/>
   <category label="contatto tettonico" render="true" type="string" uuid="7" symbol="4" value="2000"/>
   <category label="faglia" render="true" type="string" uuid="9" symbol="5" value="2100"/>
   <category label="sovrascorrimento principale" render="true" type="string" uuid="22" symbol="6" value="2200"/>
   <category label="sovrascorrimento di importanza minore" render="true" type="string" uuid="23" symbol="7" value="2210"/>
   <category label="contatto tettonico incerto o sepolto" render="true" type="string" uuid="51" symbol="8" value="2500"/>
   <category label="faglia incerta o sepolta" render="true" type="string" uuid="53" symbol="9" value="2600"/>
   <category label="sovrascorrimento principale incerto o sepolto" render="true" type="string" uuid="66" symbol="10" value="2700"/>
   <category label="sovrascorrimento di importanza minore incerto o sepolto" render="true" type="string" uuid="67" symbol="11" value="2710"/>
   <category label="contatto con area non rilevabile (mare, lago, ghiacciaio, strutture antropiche, ecc.)" render="true" type="string" uuid="97" symbol="12" value="3200"/>
   <category label="" render="true" type="NULL" uuid="{5e037886-77c4-4968-9eaa-684a03fd1bb5}" symbol="13" value="NULL"/>
  </categories>
  <symbols>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{abbc595a-c0a7-40a5-a5d4-f3f5a81dc872}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="1" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{20982855-c858-4308-9993-3cef4d220a00}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{2d4a0049-9b75-4c5f-bef0-19c88a2c7583}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="0.6"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.4"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@1@1" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b13e5cf5-5dd6-4c96-8c37-8262592dae9a}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="name" type="QString" value="circle"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.2"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="10" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{b6fd1533-2520-4314-ab2e-f85c8cfa17bc}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="3.7"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.5"/>
      <Option name="offset_along_line" type="QString" value="1.5"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@10@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{b49ae7e7-c374-409b-a683-7d53ebc7e44b}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{47afe659-791f-4e47-bc3c-337bb449acef}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3;0.7"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="11" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{e9ba23fb-d59b-467c-80f2-85bd28a88156}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="7.4"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.5"/>
      <Option name="offset_along_line" type="QString" value="1.5"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@11@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{92337844-23e9-4c22-9d5d-e53c2b3ca469}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.4"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.8"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1.4"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{6ef451c1-06b9-4a7d-ab41-56c4dee6a01d}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3;0.7"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="12" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{747562ca-7353-4535-8f4d-89cf77f521c1}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="4;1.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,0,0,255,rgb:0,0,0,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="13" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{13727ab2-40f2-4a5d-a5d0-8df552e8f8da}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="29,239,15,255,hsv:0.32327777777777778,0.93696498054474708,0.93785000381475547,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="2" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{0d62b43e-02b8-4df4-a5b2-75c3366d8d03}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="1.5;0.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="3" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{67786191-a4e8-4f50-b1d9-d18b9402a38c}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="1.5;0.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{4b248d1b-a10e-45ca-877b-1beb3b86f7cf}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="0.6"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.4"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@3@1" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{fa0306d2-b9f1-472b-a5c4-b69ef39822da}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="name" type="QString" value="circle"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.2"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="4" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b93ac4e5-9494-4b64-a40d-45984844b943}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="1.5;0.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,0,0,255,rgb:0,0,0,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="5" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{81a29fe4-57d9-4366-81ff-dbc7d5018d31}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3;0.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="6" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{9435ca78-e8bf-4a5b-947a-82c20146bebd}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="3.5"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.5"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@6@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{4ba3b287-8e2b-4dd4-9451-ae434418c073}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="0,-0.14999999999999999"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.53"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1.53"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{9618bfe8-d270-4dad-bc8a-01ad09ef8ab4}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="7" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{5ba82b13-cb5b-42a4-9c59-e15ad559d6e7}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="8"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.5"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@7@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{6e8ecee8-f3ab-4b88-b295-6f605ed9068e}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="0,-0.14999999999999999"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.4"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.8"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1.4"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{f392d142-4522-4a7a-b234-41888611e2cc}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="8" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b4c496d8-c8e7-47aa-89c2-4c0f065176d8}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="2.5;0.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,0,0,255,rgb:0,0,0,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="9" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{f5cc5602-cdca-4b54-9ca7-f641b84c8106}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3;1"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,22,137,255,rgb:0,0.0862745,0.5372549,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <source-symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{1add1fc9-b9d0-4ae5-87d1-729a9120e3e5}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="166,90,42,255,rgb:0.6509804,0.3529412,0.1647059,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{10895d09-8a6a-4490-89db-420f58c2a36a}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="166,90,42,255,rgb:0.6509804,0.3529412,0.1647059,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.1"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="-0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </source-symbol>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{29e06f1d-c580-4a54-a7ea-745394492902}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/remoteLayerId" type="QString" value="linee_substrato_6e9baa4b_845a_4589_bde0_681136331d1a"/>
   <Option name="QFieldSync/sourceDataPrimaryKeys" type="QString" value="fid"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>1</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration/>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipo" configurationFlags="NoFlag">
   <editWidget type="Classification">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipologia" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="dato mancante" type="QString" value="0"/>
       </Option>
       <Option type="Map">
        <Option name="certo" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="dedotto" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="incerto" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="sepolto" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="non classificabile" type="QString" value="9"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="QString" value=""/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="QString" value=""/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="Tipo" name="" index="2"/>
  <alias field="Tipologia" name="" index="3"/>
  <alias field="created_at" name="" index="4"/>
  <alias field="updated_at" name="" index="5"/>
  <alias field="created_by" name="" index="6"/>
  <alias field="updated_by" name="" index="7"/>
  <alias field="is_deleted" name="Da scartare" index="8"/>
 </aliases>
 <defaults>
  <default field="id" expression="" applyOnUpdate="0"/>
  <default field="fid" expression="" applyOnUpdate="0"/>
  <default field="Tipo" expression="" applyOnUpdate="0"/>
  <default field="Tipologia" expression="" applyOnUpdate="0"/>
  <default field="created_at" expression="" applyOnUpdate="0"/>
  <default field="updated_at" expression="" applyOnUpdate="0"/>
  <default field="created_by" expression="" applyOnUpdate="0"/>
  <default field="updated_by" expression="" applyOnUpdate="0"/>
  <default field="is_deleted" expression="" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint constraints="3" field="id" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="3" field="fid" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="0" field="Tipo" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Tipologia" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="1" field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="Tipo" desc="" exp=""/>
  <constraint field="Tipologia" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
  <columns>
   <column name="fid" type="field" hidden="0" width="-1"/>
   <column name="Tipo" type="field" hidden="0" width="-1"/>
   <column name="Tipologia" type="field" hidden="0" width="-1"/>
   <column name="id" type="field" hidden="0" width="-1"/>
   <column name="created_at" type="field" hidden="0" width="-1"/>
   <column name="updated_at" type="field" hidden="0" width="-1"/>
   <column name="created_by" type="field" hidden="0" width="-1"/>
   <column name="updated_by" type="field" hidden="0" width="-1"/>
   <column name="is_deleted" type="field" hidden="0" width="-1"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="Affiora" editable="1"/>
  <field name="Contorno" editable="1"/>
  <field name="Direzio" editable="1"/>
  <field name="FoglioGeologico" editable="1"/>
  <field name="Id_Elest" editable="1"/>
  <field name="Id_Limite" editable="1"/>
  <field name="LPoly_" editable="1"/>
  <field name="Lin_Uc" editable="1"/>
  <field name="OBJECTID" editable="1"/>
  <field name="RPoly_" editable="1"/>
  <field name="Shape_Length" editable="1"/>
  <field name="Tipo" editable="1"/>
  <field name="Tipologia" editable="1"/>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="Affiora"/>
  <field labelOnTop="0" name="Contorno"/>
  <field labelOnTop="0" name="Direzio"/>
  <field labelOnTop="0" name="FoglioGeologico"/>
  <field labelOnTop="0" name="Id_Elest"/>
  <field labelOnTop="0" name="Id_Limite"/>
  <field labelOnTop="0" name="LPoly_"/>
  <field labelOnTop="0" name="Lin_Uc"/>
  <field labelOnTop="0" name="OBJECTID"/>
  <field labelOnTop="0" name="RPoly_"/>
  <field labelOnTop="0" name="Shape_Length"/>
  <field labelOnTop="0" name="Tipo"/>
  <field labelOnTop="0" name="Tipologia"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
 </labelOnTop>
 <reuseLastValue>
  <field name="Affiora" reuseLastValue="0"/>
  <field name="Contorno" reuseLastValue="0"/>
  <field name="Direzio" reuseLastValue="0"/>
  <field name="FoglioGeologico" reuseLastValue="0"/>
  <field name="Id_Elest" reuseLastValue="0"/>
  <field name="Id_Limite" reuseLastValue="0"/>
  <field name="LPoly_" reuseLastValue="0"/>
  <field name="Lin_Uc" reuseLastValue="0"/>
  <field name="OBJECTID" reuseLastValue="0"/>
  <field name="RPoly_" reuseLastValue="0"/>
  <field name="Shape_Length" reuseLastValue="0"/>
  <field name="Tipo" reuseLastValue="0"/>
  <field name="Tipologia" reuseLastValue="1"/>
  <field name="created_at" reuseLastValue="0"/>
  <field name="created_by" reuseLastValue="0"/>
  <field name="fid" reuseLastValue="0"/>
  <field name="id" reuseLastValue="0"/>
  <field name="is_deleted" reuseLastValue="0"/>
  <field name="updated_at" reuseLastValue="0"/>
  <field name="updated_by" reuseLastValue="0"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>"FoglioGeologico"</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>1</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
 <NamedLayer>
  <se:Name>linee_substrato</se:Name>
  <UserStyle>
   <se:Name>linee_substrato</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>contatto stratigrafico o litologico</se:Name>
     <se:Description>
      <se:Title>contatto stratigrafico o litologico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1000</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto stratigrafico inconforme</se:Name>
     <se:Description>
      <se:Title>contatto stratigrafico inconforme</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1100</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>circle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#001689</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>1</se:Size>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>2</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>1</se:PerpendicularOffset>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto stratigrafico o litologico incerto</se:Name>
     <se:Description>
      <se:Title>contatto stratigrafico o litologico incerto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1500</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">5 2</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto stratigrafico inconforme incerto</se:Name>
     <se:Description>
      <se:Title>contatto stratigrafico inconforme incerto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1600</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">5 2</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>circle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#001689</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>1</se:Size>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>2</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>1</se:PerpendicularOffset>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto tettonico</se:Name>
     <se:Description>
      <se:Title>contatto tettonico</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2000</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>faglia</se:Name>
     <se:Description>
      <se:Title>faglia</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2100</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>sovrascorrimento principale</se:Name>
     <se:Description>
      <se:Title>sovrascorrimento principale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2200</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>0</se:DisplacementX>
          <se:DisplacementY>-1</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">1.53</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>13</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>2</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>sovrascorrimento di importanza minore</se:Name>
     <se:Description>
      <se:Title>sovrascorrimento di importanza minore</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2210</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>0</se:DisplacementX>
          <se:DisplacementY>-1</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">1.75</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>29</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>2</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto tettonico incerto o sepolto</se:Name>
     <se:Description>
      <se:Title>contatto tettonico incerto o sepolto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2500</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">9 2</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>faglia incerta o sepolta</se:Name>
     <se:Description>
      <se:Title>faglia incerta o sepolta</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2600</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">11 4</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>sovrascorrimento principale incerto o sepolto</se:Name>
     <se:Description>
      <se:Title>sovrascorrimento principale incerto o sepolto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2700</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:VendorOption name="widthHeightFactor">1.5</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>13</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>2</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">11 2</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>sovrascorrimento di importanza minore incerto o sepolto</se:Name>
     <se:Description>
      <se:Title>sovrascorrimento di importanza minore incerto o sepolto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2710</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#001689</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:VendorOption name="widthHeightFactor">1.75</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>26</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
      <se:PerpendicularOffset>2</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#001689</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">11 2</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>contatto con area non rilevabile (mare, lago, ghiacciaio, strutture antropiche, ecc.)</se:Name>
     <se:Description>
      <se:Title>contatto con area non rilevabile (mare, lago, ghiacciaio, strutture antropiche, ecc.)</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>3200</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#000000</se:SvgParameter>
       <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name></se:Name>
     <se:Description>
      <se:Title>"TIPO" is ''</se:Title>
     </se:Description>
     <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#1def0f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio apr 16 14:34:20 2026$d$, 'postgres', 'Line');

-- rilevamento.linee_geomorfologia
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'rilevamento', 'linee_geomorfologia', 'geom', 'stile_linee_geomorfologia',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" autoRefreshTime="0" symbologyReferenceScale="-1" simplifyMaxScale="1" hasScaleBasedVisibilityFlag="0" readOnly="0" simplifyDrawingHints="1" simplifyDrawingTol="1" maxScale="0" autoRefreshMode="Disabled" styleCategories="AllStyleCategories" simplifyAlgorithm="0" version="3.44.8-Solothurn" labelsEnabled="0" minScale="0">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal enabled="0" accumulate="0" durationUnit="min" startField="created_at" startExpression="" mode="0" endExpression="" limitMode="0" durationField="id" endField="" fixedDuration="0">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation extrusionEnabled="0" binding="Centroid" symbology="Line" extrusion="0" clamping="Terrain" customToleranceEnabled="0" type="IndividualFeatures" showMarkerSymbolInSurfacePlots="0" zscale="1" respectLayerSymbol="1" zoffset="0">
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{28e07cd5-54c5-4585-bfd8-3cbcfeafa7a1}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="232,113,141,255,rgb:0.9098039,0.4431373,0.5529412,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.6"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="fill" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleFill" id="{8565c6e3-d3ca-417e-9366-16ecf084b479}">
     <Option type="Map">
      <Option name="border_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="color" type="QString" value="232,113,141,255,rgb:0.9098039,0.4431373,0.5529412,1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="166,81,101,255,rgb:0.6498512,0.3165179,0.3949645,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="style" type="QString" value="solid"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="marker" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{df151bee-dc9f-406e-a8d2-f6eb74603e90}">
     <Option type="Map">
      <Option name="angle" type="QString" value="0"/>
      <Option name="cap_style" type="QString" value="square"/>
      <Option name="color" type="QString" value="232,113,141,255,rgb:0.9098039,0.4431373,0.5529412,1"/>
      <Option name="horizontal_anchor_point" type="QString" value="1"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="name" type="QString" value="diamond"/>
      <Option name="offset" type="QString" value="0,0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="outline_color" type="QString" value="166,81,101,255,rgb:0.6498512,0.3165179,0.3949645,1"/>
      <Option name="outline_style" type="QString" value="solid"/>
      <Option name="outline_width" type="QString" value="0.2"/>
      <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="outline_width_unit" type="QString" value="MM"/>
      <Option name="scale_method" type="QString" value="diameter"/>
      <Option name="size" type="QString" value="3"/>
      <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="size_unit" type="QString" value="MM"/>
      <Option name="vertical_anchor_point" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 forceraster="0" enableorderby="0" type="categorizedSymbol" symbollevels="0" attr="TIPO" referencescale="-1">
  <categories>
   <category label="orlo di scarpata di frana" render="true" type="string" uuid="0" symbol="0" value="1030"/>
   <category label="trincea di deformazione gravitativa profonda di versante" render="true" type="string" uuid="1" symbol="1" value="1040"/>
   <category label="traccia di superficie di distacco gravitativo" render="true" type="string" uuid="2" symbol="2" value="1070"/>
   <category label="gradino di scivolamento" render="true" type="string" uuid="3" symbol="3" value="1080"/>
   <category label="orlo di terrazzo fluviale" render="true" type="string" uuid="4" symbol="4" value="2050"/>
   <category label="traccia di alveo fluviale abbandonato" render="true" type="string" uuid="5" symbol="5" value="2060"/>
   <category label="bordo di alveo fluviale abbandonato" render="true" type="string" uuid="8" symbol="6" value="2063"/>
   <category label="cordone morenico terminale o laterale" render="true" type="string" uuid="12" symbol="7" value="4020"/>
   <category label="argine detritico di nevaio" render="true" type="string" uuid="13" symbol="8" value="4021"/>
   <category label="circo glaciale" render="true" type="string" uuid="14" symbol="9" value="4050"/>
   <category label="allineamento di dune" render="true" type="string" uuid="32" symbol="10" value="7010"/>
   <category label="orlo di scarpata di cava" render="true" type="string" uuid="33" symbol="11" value="8010"/>
   <category label="orlo di scarpata antropica" render="true" type="string" uuid="34" symbol="12" value="8011"/>
   <category label="" render="true" type="NULL" uuid="{1960a778-2221-4e9e-80b4-909e27baa09c}" symbol="13" value="NULL"/>
  </categories>
  <symbols>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{815e4c2d-4307-4302-ab39-a21a12c90d06}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="1"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="Pixel"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@0@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{e6f14f90-bf98-43af-9ec7-7a078b71244e}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0.5,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{aac7134f-4049-4ec9-9668-61ad378b70d4}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="1" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{3c97b114-54a0-4ecd-b185-b32cfd254847}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="1.7"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="Pixel"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@1@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{0e6d0c64-2e7b-4bbd-bdc2-af2ecffdef3e}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1.7"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{45859e98-2ba6-4287-a06e-7dfdec9be3fd}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="10" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{e829f4b3-468d-4809-80e0-ed43ce1b22ef}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3.8;0.4"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="155,95,23,255,rgb:0.6078431,0.372549,0.0901961,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="-0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{3713f4c4-a31c-41d6-af7b-ed1ba65c3312}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3.8;0.4"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="155,95,23,255,rgb:0.6078431,0.372549,0.0901961,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="11" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{ff4c0ea4-4b2f-46e2-923d-4c5f2c461600}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="2.2"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="Pixel"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@11@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b66588e8-6a04-45f7-ada1-f073a07fbe83}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0.5,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.75"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{97c618b7-09b4-497d-aa79-804bee617150}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="12" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{ae5fee79-6e4a-4a28-9e69-ed77251c9471}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="2.2"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="Pixel"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@12@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{dba0c892-2070-410e-8646-c67c2323b6ef}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0.5,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="99,101,105,255,rgb:0.3882353,0.3960784,0.4117647,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.75"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b884bf7a-d0d4-4874-9ff9-8ab431eef9e1}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="99,101,105,255,rgb:0.3882353,0.3960784,0.4117647,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="13" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{13727ab2-40f2-4a5d-a5d0-8df552e8f8da}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="29,239,15,255,hsv:0.32327777777777778,0.93696498054474708,0.93785000381475547,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="2" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{e2943205-fad3-43cb-a551-b0cca4144edc}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="5.2"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@2@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{1d74f0fc-8035-410c-bd8b-cc1df4874486}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="4.09999999999999964,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,0,rgb:0.1372549,0.1372549,0.1372549,0"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1.2"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{6ee9b536-d3c8-45f3-a17c-2dc9a1705ca8}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="3;2.2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
      <Option name="line_style" type="QString" value="dash"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="3" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{e763f488-93e4-4140-b29e-152a7c872f41}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="1.75"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@3@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{67067fff-5e64-4fea-a787-335c6570fb63}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="equilateral_triangle"/>
        <Option name="offset" type="QString" value="0,-0.69999999999999996"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.8"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="2"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{af65386b-5ef4-497d-8a6a-a49649aead01}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="1.75"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@3@1" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{1febb0be-2611-4abe-a551-ca44b4eec259}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.7"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="2"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{6ba92bb2-1c6b-419d-a763-f1267d28c513}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="4" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{2517ec5c-9581-4ae2-8f78-6bef3fa42d57}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="1"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="Pixel"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@4@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{32f59364-2ee4-4204-94df-5bf24b379f9f}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0.5,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.2"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{9da51d4f-fae0-41bd-996f-1396ee285959}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="5" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{06ca0ab9-4ff4-4bb9-9bb1-8cdb8e1e524e}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="4;0.7"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="-0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{5dc1e44e-fe5a-43fe-a175-7b36c808d495}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="4;0.7"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.2"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0.3"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="1"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="6" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{3b528865-c740-437b-b8e7-e26b7c7eb410}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="8.3"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="5.1"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@6@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{3a85dba9-b2de-4e8e-8d55-0b501faae347}">
       <Option type="Map">
        <Option name="angle" type="QString" value="90"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="offset" type="QString" value="2.14999999999999991,-0.34999999999999998"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,0,rgb:0.1372549,0.1372549,0.1372549,0"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="1"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="2"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{30735542-6e74-4107-8cbf-82e91536171a}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="8.3"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@6@1" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{8bf49aae-17df-4cdd-bfac-fb870adec313}">
       <Option type="Map">
        <Option name="angle" type="QString" value="90"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="2.14999999999999991,3"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.15"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{2a71eecd-c22a-4593-bf2f-838c871f6e3e}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="4.15"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@6@2" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{298e496d-bb74-41da-8d44-c78d6fab38e5}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="255,0,0,255,rgb:1,0,0,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="line"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
        <Option name="outline_style" type="QString" value="solid"/>
        <Option name="outline_width" type="QString" value="0.15"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="2"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="0"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{38950b14-7968-4eba-b7ec-b6edc3a6e00e}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;1.5"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="2.5"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="7" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{b423ae05-8892-43e6-ab3e-ce02d17b97f2}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.5"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="8" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{b55430b1-3e9a-443d-8717-219cb1763d7f}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="13.45"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@8@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{b5323618-6c40-4db5-bdc3-3961032bbe2a}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="11.34999999999999964,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.808"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{2a7fdf51-fec3-499d-9c63-3c068d129486}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="8.90000000000000036,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1.212"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{7be12fea-8237-40f9-a0e6-9f778239cfbe}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="6.29999999999999982,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1.3856"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{721a0c35-9795-4fcc-b4ae-a67c4ee16aed}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="3.85000000000000009,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="1.212"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{291719b1-10c1-4ff4-a148-d89627821c0b}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="1.75,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.808"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer enabled="1" pass="0" locked="0" class="SimpleMarker" id="{50152336-9ba2-4842-8c2f-a0acc464941e}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="cap_style" type="QString" value="square"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="miter"/>
        <Option name="name" type="QString" value="hexagon"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="0.4"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="9" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{f0b73285-3ca8-40d7-82c8-6d40f25f720d}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.3"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{ff955120-3aab-4cac-a2fa-02f4bdc23b83}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="3"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@9@1" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="EllipseMarker" id="{70a183f6-f087-48aa-921e-4058f62336e0}">
       <Option type="Map">
        <Option name="angle" type="QString" value="180"/>
        <Option name="cap_style" type="QString" value="flat"/>
        <Option name="color" type="QString" value="177,28,171,255,rgb:0.6941176,0.1098039,0.6705882,1"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="joinstyle" type="QString" value="bevel"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
        <Option name="outline_style" type="QString" value="no"/>
        <Option name="outline_width" type="QString" value="0"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="size" type="QString" value="1.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="symbol_height" type="QString" value="0.75"/>
        <Option name="symbol_height_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_height_unit" type="QString" value="MM"/>
        <Option name="symbol_name" type="QString" value="triangle"/>
        <Option name="symbol_width" type="QString" value="1.5"/>
        <Option name="symbol_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="symbol_width_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="2"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
  </symbols>
  <source-symbol>
   <symbol force_rhr="0" clip_to_extent="1" name="0" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="MarkerLine" id="{613491d8-f9f7-4044-9a87-dbc2ff98a68c}">
     <Option type="Map">
      <Option name="average_angle_length" type="QString" value="4"/>
      <Option name="average_angle_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="average_angle_unit" type="QString" value="MM"/>
      <Option name="interval" type="QString" value="8"/>
      <Option name="interval_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="interval_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_along_line" type="QString" value="0"/>
      <Option name="offset_along_line_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_along_line_unit" type="QString" value="MM"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="place_on_every_part" type="bool" value="true"/>
      <Option name="placements" type="QString" value="Interval"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="rotate" type="QString" value="1"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
     <symbol force_rhr="0" clip_to_extent="1" name="@0@0" is_animated="0" type="marker" frame_rate="10" alpha="1">
      <data_defined_properties>
       <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
       </Option>
      </data_defined_properties>
      <layer enabled="1" pass="0" locked="0" class="SvgMarker" id="{520b0278-be5e-4084-a3e3-c615ac789721}">
       <Option type="Map">
        <Option name="angle" type="QString" value="0"/>
        <Option name="color" type="QString" value="0,130,202,0,rgb:0,0.5098039,0.7921569,0"/>
        <Option name="fixedAspectRatio" type="QString" value="0"/>
        <Option name="horizontal_anchor_point" type="QString" value="1"/>
        <Option name="name" type="QString" value="ST12-9011.svg"/>
        <Option name="offset" type="QString" value="0,0"/>
        <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="offset_unit" type="QString" value="MM"/>
        <Option name="outline_color" type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1"/>
        <Option name="outline_width" type="QString" value="0.15"/>
        <Option name="outline_width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="outline_width_unit" type="QString" value="MM"/>
        <Option name="parameters"/>
        <Option name="scale_method" type="QString" value="diameter"/>
        <Option name="size" type="QString" value="6.5"/>
        <Option name="size_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
        <Option name="size_unit" type="QString" value="MM"/>
        <Option name="vertical_anchor_point" type="QString" value="1"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option name="name" type="QString" value=""/>
         <Option name="properties"/>
         <Option name="type" type="QString" value="collection"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
  </source-symbol>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option name="name" type="QString" value=""/>
    <Option name="properties"/>
    <Option name="type" type="QString" value="collection"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol force_rhr="0" clip_to_extent="1" name="" is_animated="0" type="line" frame_rate="10" alpha="1">
    <data_defined_properties>
     <Option type="Map">
      <Option name="name" type="QString" value=""/>
      <Option name="properties"/>
      <Option name="type" type="QString" value="collection"/>
     </Option>
    </data_defined_properties>
    <layer enabled="1" pass="0" locked="0" class="SimpleLine" id="{c50fbbc1-bd13-4c73-99c1-40ae8dabb8ea}">
     <Option type="Map">
      <Option name="align_dash_pattern" type="QString" value="0"/>
      <Option name="capstyle" type="QString" value="square"/>
      <Option name="customdash" type="QString" value="5;2"/>
      <Option name="customdash_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="customdash_unit" type="QString" value="MM"/>
      <Option name="dash_pattern_offset" type="QString" value="0"/>
      <Option name="dash_pattern_offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="dash_pattern_offset_unit" type="QString" value="MM"/>
      <Option name="draw_inside_polygon" type="QString" value="0"/>
      <Option name="joinstyle" type="QString" value="bevel"/>
      <Option name="line_color" type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1"/>
      <Option name="line_style" type="QString" value="solid"/>
      <Option name="line_width" type="QString" value="0.26"/>
      <Option name="line_width_unit" type="QString" value="MM"/>
      <Option name="offset" type="QString" value="0"/>
      <Option name="offset_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="offset_unit" type="QString" value="MM"/>
      <Option name="ring_filter" type="QString" value="0"/>
      <Option name="trim_distance_end" type="QString" value="0"/>
      <Option name="trim_distance_end_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_end_unit" type="QString" value="MM"/>
      <Option name="trim_distance_start" type="QString" value="0"/>
      <Option name="trim_distance_start_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
      <Option name="trim_distance_start_unit" type="QString" value="MM"/>
      <Option name="tweak_dash_pattern_on_corners" type="QString" value="0"/>
      <Option name="use_custom_dash" type="QString" value="0"/>
      <Option name="width_map_unit_scale" type="QString" value="3x:0,0,0,0,0,0"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option name="name" type="QString" value=""/>
       <Option name="properties"/>
       <Option name="type" type="QString" value="collection"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <customproperties>
  <Option type="Map">
   <Option name="QFieldSync/action" type="QString" value="no_action"/>
   <Option name="QFieldSync/attachment_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/attribute_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/cloud_action" type="QString" value="offline"/>
   <Option name="QFieldSync/feature_addition_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/feature_deletion_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/geometry_editing_locked_expression" type="QString" value=""/>
   <Option name="QFieldSync/photo_naming" type="QString" value="{}"/>
   <Option name="QFieldSync/relationship_maximum_visible" type="QString" value="{}"/>
   <Option name="QFieldSync/remoteLayerId" type="QString" value="linee_geomorfologia_5d453b7f_1d60_4be5_bc0d_6284a0ef29df"/>
   <Option name="QFieldSync/sourceDataPrimaryKeys" type="QString" value="fid"/>
   <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" type="int" value="30"/>
   <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" type="int" value="1"/>
   <Option name="QFieldSync/tracking_measurement_type" type="int" value="0"/>
   <Option name="QFieldSync/tracking_time_requirement_interval_seconds" type="int" value="30"/>
   <Option name="QFieldSync/value_map_button_interface_threshold" type="int" value="0"/>
   <Option name="embeddedWidgets/count" type="int" value="0"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>1</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration/>
 </geometryOptions>
 <legend showLabelLegend="0" type="default-vector"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipo" configurationFlags="NoFlag">
   <editWidget type="Classification">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="Tipologia" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option name="map" type="List">
       <Option type="Map">
        <Option name="dato mancante" type="QString" value="0"/>
       </Option>
       <Option type="Map">
        <Option name="certo" type="QString" value="1"/>
       </Option>
       <Option type="Map">
        <Option name="dedotto" type="QString" value="2"/>
       </Option>
       <Option type="Map">
        <Option name="incerto" type="QString" value="3"/>
       </Option>
       <Option type="Map">
        <Option name="sepolto" type="QString" value="4"/>
       </Option>
       <Option type="Map">
        <Option name="non classificabile" type="QString" value="9"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="Stato" configurationFlags="NoFlag">
   <editWidget type="Range">
    <config>
     <Option type="Map">
      <Option name="AllowNull" type="bool" value="true"/>
      <Option name="Max" type="int" value="2147483647"/>
      <Option name="Min" type="int" value="-2147483648"/>
      <Option name="Precision" type="int" value="0"/>
      <Option name="Step" type="int" value="1"/>
      <Option name="Style" type="QString" value="SpinBox"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option name="AllowNullState" type="bool" value="false"/>
      <Option name="CheckedState" type="QString" value=""/>
      <Option name="TextDisplayMethod" type="int" value="0"/>
      <Option name="UncheckedState" type="QString" value=""/>
     </Option>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="Tipo" name="" index="2"/>
  <alias field="Tipologia" name="" index="3"/>
  <alias field="Stato" name="" index="4"/>
  <alias field="created_at" name="" index="5"/>
  <alias field="updated_at" name="" index="6"/>
  <alias field="created_by" name="" index="7"/>
  <alias field="updated_by" name="" index="8"/>
  <alias field="is_deleted" name="Da scartare" index="9"/>
 </aliases>
 <defaults>
  <default field="id" expression="" applyOnUpdate="0"/>
  <default field="fid" expression="" applyOnUpdate="0"/>
  <default field="Tipo" expression="" applyOnUpdate="0"/>
  <default field="Tipologia" expression="" applyOnUpdate="0"/>
  <default field="Stato" expression="" applyOnUpdate="0"/>
  <default field="created_at" expression="" applyOnUpdate="0"/>
  <default field="updated_at" expression="" applyOnUpdate="0"/>
  <default field="created_by" expression="" applyOnUpdate="0"/>
  <default field="updated_by" expression="" applyOnUpdate="0"/>
  <default field="is_deleted" expression="" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint constraints="3" field="id" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="3" field="fid" exp_strength="0" unique_strength="1" notnull_strength="1"/>
  <constraint constraints="0" field="Tipo" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Tipologia" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="Stato" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="created_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="0" field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="0"/>
  <constraint constraints="1" field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="Tipo" desc="" exp=""/>
  <constraint field="Tipologia" desc="" exp=""/>
  <constraint field="Stato" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
 </attributeactions>
 <attributetableconfig sortExpression="" sortOrder="0" actionWidgetStyle="dropDown">
  <columns>
   <column name="fid" type="field" hidden="0" width="-1"/>
   <column name="Tipo" type="field" hidden="0" width="-1"/>
   <column name="Tipologia" type="field" hidden="0" width="-1"/>
   <column name="Stato" type="field" hidden="0" width="-1"/>
   <column name="id" type="field" hidden="0" width="-1"/>
   <column name="created_at" type="field" hidden="0" width="-1"/>
   <column name="updated_at" type="field" hidden="0" width="-1"/>
   <column name="created_by" type="field" hidden="0" width="-1"/>
   <column name="updated_by" type="field" hidden="0" width="-1"/>
   <column name="is_deleted" type="field" hidden="0" width="-1"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="FoglioGeologico" editable="1"/>
  <field name="Label" editable="1"/>
  <field name="Lin_Gmo" editable="1"/>
  <field name="OBJECTID" editable="1"/>
  <field name="Shape_Length" editable="1"/>
  <field name="Stato" editable="1"/>
  <field name="Tipo" editable="1"/>
  <field name="Tipologia" editable="1"/>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="FoglioGeologico"/>
  <field labelOnTop="0" name="Label"/>
  <field labelOnTop="0" name="Lin_Gmo"/>
  <field labelOnTop="0" name="OBJECTID"/>
  <field labelOnTop="0" name="Shape_Length"/>
  <field labelOnTop="0" name="Stato"/>
  <field labelOnTop="0" name="Tipo"/>
  <field labelOnTop="0" name="Tipologia"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
 </labelOnTop>
 <reuseLastValue>
  <field name="FoglioGeologico" reuseLastValue="0"/>
  <field name="Label" reuseLastValue="0"/>
  <field name="Lin_Gmo" reuseLastValue="0"/>
  <field name="OBJECTID" reuseLastValue="0"/>
  <field name="Shape_Length" reuseLastValue="0"/>
  <field name="Stato" reuseLastValue="0"/>
  <field name="Tipo" reuseLastValue="0"/>
  <field name="Tipologia" reuseLastValue="0"/>
  <field name="created_at" reuseLastValue="0"/>
  <field name="created_by" reuseLastValue="0"/>
  <field name="fid" reuseLastValue="0"/>
  <field name="id" reuseLastValue="0"/>
  <field name="is_deleted" reuseLastValue="0"/>
  <field name="updated_at" reuseLastValue="0"/>
  <field name="updated_by" reuseLastValue="0"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>"Label"</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>1</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" version="1.1.0" xmlns:ogc="http://www.opengis.net/ogc">
 <NamedLayer>
  <se:Name>linee_geomorfologia</se:Name>
  <UserStyle>
   <se:Name>linee_geomorfologia</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name>orlo di scarpata di frana</se:Name>
     <se:Description>
      <se:Title>orlo di scarpata di frana</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1030</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Displacement>
          <se:DisplacementX>2</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>4</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>trincea di deformazione gravitativa profonda di versante</se:Name>
     <se:Description>
      <se:Title>trincea di deformazione gravitativa profonda di versante</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1040</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>6</se:Size>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>6</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>traccia di superficie di distacco gravitativo</se:Name>
     <se:Description>
      <se:Title>traccia di superficie di distacco gravitativo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1070</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#232323</se:SvgParameter>
           <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Displacement>
          <se:DisplacementX>15</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>19</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">11 8</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>gradino di scivolamento</se:Name>
     <se:Description>
      <se:Title>gradino di scivolamento</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>1080</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>equilateral_triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>0</se:DisplacementX>
          <se:DisplacementY>-2</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>6</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>2</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>6</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>orlo di terrazzo fluviale</se:Name>
     <se:Description>
      <se:Title>orlo di terrazzo fluviale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2050</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>2</se:Size>
         <se:Displacement>
          <se:DisplacementX>2</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>4</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>traccia di alveo fluviale abbandonato</se:Name>
     <se:Description>
      <se:Title>traccia di alveo fluviale abbandonato</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2060</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">14 2</se:SvgParameter>
      </se:Stroke>
      <se:PerpendicularOffset>-1</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
       <se:SvgParameter name="stroke-dasharray">14 2</se:SvgParameter>
      </se:Stroke>
      <se:PerpendicularOffset>1</se:PerpendicularOffset>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>bordo di alveo fluviale abbandonato</se:Name>
     <se:Description>
      <se:Title>bordo di alveo fluviale abbandonato</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>2063</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#232323</se:SvgParameter>
           <se:SvgParameter name="stroke-opacity">0</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Rotation>
          <ogc:Literal>90</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>8</se:DisplacementX>
          <se:DisplacementY>-1</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">1</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>30</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Rotation>
          <ogc:Literal>90</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>8</se:DisplacementX>
          <se:DisplacementY>11</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>30</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>7</se:Size>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>15</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>cordone morenico terminale o laterale</se:Name>
     <se:Description>
      <se:Title>cordone morenico terminale o laterale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>4020</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#b11cab</se:SvgParameter>
       <se:SvgParameter name="stroke-width">2</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>argine detritico di nevaio</se:Name>
     <se:Description>
      <se:Title>argine detritico di nevaio</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>4021</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>3</se:Size>
         <se:Displacement>
          <se:DisplacementX>41</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Displacement>
          <se:DisplacementX>32</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Displacement>
          <se:DisplacementX>22</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Displacement>
          <se:DisplacementX>14</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>3</se:Size>
         <se:Displacement>
          <se:DisplacementX>6</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>hexagon</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>1</se:Size>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>48</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>circo glaciale</se:Name>
     <se:Description>
      <se:Title>circo glaciale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>4050</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#b11cab</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>triangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#b11cab</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>180</ogc:Literal>
         </se:Rotation>
         <se:VendorOption name="widthHeightFactor">2</se:VendorOption>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>11</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>allineamento di dune</se:Name>
     <se:Description>
      <se:Title>allineamento di dune</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>7010</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#9b5f17</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
      <se:PerpendicularOffset>-1</se:PerpendicularOffset>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#9b5f17</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
      <se:PerpendicularOffset>1</se:PerpendicularOffset>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>orlo di scarpata di cava</se:Name>
     <se:Description>
      <se:Title>orlo di scarpata di cava</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>8010</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
         <se:Displacement>
          <se:DisplacementX>2</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>8</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#f5333f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>orlo di scarpata antropica</se:Name>
     <se:Description>
      <se:Title>orlo di scarpata antropica</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>TIPO</ogc:PropertyName>
       <ogc:Literal>8011</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:GraphicStroke>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>line</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#ff0000</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#636569</se:SvgParameter>
           <se:SvgParameter name="stroke-width">1</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
         <se:Displacement>
          <se:DisplacementX>2</se:DisplacementX>
          <se:DisplacementY>0</se:DisplacementY>
         </se:Displacement>
        </se:Graphic>
        <se:Gap>
         <ogc:Literal>8</ogc:Literal>
        </se:Gap>
       </se:GraphicStroke>
      </se:Stroke>
     </se:LineSymbolizer>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#636569</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name></se:Name>
     <se:Description>
      <se:Title>"TIPO" is ''</se:Title>
     </se:Description>
     <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
     <se:LineSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#1def0f</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
       <se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
      </se:Stroke>
     </se:LineSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio apr 16 14:34:00 2026$d$, 'postgres', 'Line');

-- visualizzazione.vw_affiorante_join
INSERT INTO public.layer_styles
    (f_table_catalog, f_table_schema, f_table_name, f_geometry_column,
     stylename, styleqml, stylesld, useasdefault, description, owner, type)
VALUES
    (current_database(), 'visualizzazione', 'vw_affiorante_join', 'geom', 'stile_vw_affiorante_join',
     $qml$<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.44.8-Solothurn" simplifyLocal="1" styleCategories="AllStyleCategories" minScale="100000000" simplifyDrawingHints="1" readOnly="0" symbologyReferenceScale="-1" autoRefreshMode="Disabled" labelsEnabled="1" autoRefreshTime="0" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyMaxScale="1" maxScale="0">
 <flags>
  <Identifiable>1</Identifiable>
  <Removable>1</Removable>
  <Searchable>1</Searchable>
  <Private>0</Private>
 </flags>
 <temporal accumulate="0" startField="data_ora" mode="0" startExpression="" enabled="0" durationField="id" limitMode="0" fixedDuration="0" endExpression="" durationUnit="min" endField="">
  <fixedRange>
   <start></start>
   <end></end>
  </fixedRange>
 </temporal>
 <elevation zscale="1" respectLayerSymbol="1" type="IndividualFeatures" customToleranceEnabled="0" clamping="Terrain" showMarkerSymbolInSurfacePlots="0" extrusionEnabled="0" binding="Centroid" extrusion="0" zoffset="0" symbology="Line">
  <data-defined-properties>
   <Option type="Map">
    <Option type="QString" value="" name="name"/>
    <Option name="properties"/>
    <Option type="QString" value="collection" name="type"/>
   </Option>
  </data-defined-properties>
  <profileLineSymbol>
   <symbol alpha="1" type="line" clip_to_extent="1" force_rhr="0" frame_rate="10" name="" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleLine" enabled="1" pass="0" locked="0" id="{df2a4c8e-5d38-49fe-aec7-a39d0294a6a8}">
     <Option type="Map">
      <Option type="QString" value="0" name="align_dash_pattern"/>
      <Option type="QString" value="square" name="capstyle"/>
      <Option type="QString" value="5;2" name="customdash"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
      <Option type="QString" value="MM" name="customdash_unit"/>
      <Option type="QString" value="0" name="dash_pattern_offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
      <Option type="QString" value="0" name="draw_inside_polygon"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1" name="line_color"/>
      <Option type="QString" value="solid" name="line_style"/>
      <Option type="QString" value="0.6" name="line_width"/>
      <Option type="QString" value="MM" name="line_width_unit"/>
      <Option type="QString" value="0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="0" name="ring_filter"/>
      <Option type="QString" value="0" name="trim_distance_end"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
      <Option type="QString" value="MM" name="trim_distance_end_unit"/>
      <Option type="QString" value="0" name="trim_distance_start"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
      <Option type="QString" value="MM" name="trim_distance_start_unit"/>
      <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
      <Option type="QString" value="0" name="use_custom_dash"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileLineSymbol>
  <profileFillSymbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{08f0dec6-2fab-4fa2-8e7d-42938001401c}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="136,148,57,255,rgb:0.5322194,0.5798276,0.224094,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.2" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileFillSymbol>
  <profileMarkerSymbol>
   <symbol alpha="1" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleMarker" enabled="1" pass="0" locked="0" id="{15facb7a-f8da-4342-b391-06bdb302bafe}">
     <Option type="Map">
      <Option type="QString" value="0" name="angle"/>
      <Option type="QString" value="square" name="cap_style"/>
      <Option type="QString" value="190,207,80,255,rgb:0.745098,0.8117647,0.3137255,1" name="color"/>
      <Option type="QString" value="1" name="horizontal_anchor_point"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="diamond" name="name"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="136,148,57,255,rgb:0.5322194,0.5798276,0.224094,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.2" name="outline_width"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="diameter" name="scale_method"/>
      <Option type="QString" value="3" name="size"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
      <Option type="QString" value="MM" name="size_unit"/>
      <Option type="QString" value="1" name="vertical_anchor_point"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </profileMarkerSymbol>
 </elevation>
 <renderer-v2 attr="codice_carg" type="categorizedSymbol" symbollevels="0" enableorderby="0" referencescale="-1" forceraster="0">
  <categories>
   <category type="NULL" uuid="{bfff972e-11eb-41ad-9fad-9038c87e03b3}" value="NULL" label="" render="true" symbol="0"/>
   <category type="string" uuid="{a5d5c80c-cd79-4d9e-8130-c2ee79634991}" value="012130" label="Morfologia" render="true" symbol="1"/>
   <category type="string" uuid="{d9dcf073-39c6-4a69-86ae-cd8c03003e43}" value="032140" label="Frana" render="true" symbol="2"/>
   <category type="string" uuid="{bf063aba-6a58-4031-9ef3-256b043b7ae8}" value="093537" label="Dubbio-altro" render="true" symbol="3"/>
   <category type="string" uuid="{d31354d5-ee13-4b3c-83df-554747fce540}" value="212140" label="Flysch del Varesotto" render="true" symbol="4"/>
   <category type="string" uuid="{01919052-6a5f-42d0-ba8d-b84d3570dc62}" value="372120" label="Scaglia Rossa" render="true" symbol="5"/>
   <category type="string" uuid="{92a85748-aab1-44fe-8966-b514b53bd10a}" value="382130" label="Sass de la Luna" render="true" symbol="6"/>
   <category type="string" uuid="{0a2c7468-7fbc-4f9c-a0c9-cc4b075fe8d5}" value="392120" label="Maiolica" render="true" symbol="7"/>
   <category type="string" uuid="{bb86a62d-1ab5-4ed4-ab3a-6b01960ebdb0}" value="402130" label="Radiolariti del Selcifero Lombardo" render="true" symbol="8"/>
   <category type="string" uuid="{294ed6ff-97bf-41fa-a789-11dcad72ac58}" value="402150" label="Gruppo del Selcifero Lombardo" render="true" symbol="9"/>
   <category type="string" uuid="{95e66e21-8f51-4d81-8cc5-752395c37122}" value="442120" label="Formazione di Val Maggiore" render="true" symbol="10"/>
   <category type="string" uuid="{d5246983-d034-40f5-a02f-c29f97d23428}" value="452130" label="Calcare di Domaro" render="true" symbol="11"/>
   <category type="string" uuid="{08860038-dfe6-46b9-8312-914368b36333}" value="472150" label="Calcare di Moltrasio" render="true" symbol="12"/>
   <category type="string" uuid="{331c751e-3e33-4cb5-9156-abca046f9627}" value="482130" label="Calcare di Alpe Perino" render="true" symbol="13"/>
   <category type="string" uuid="{737bf848-2505-4d16-b2b2-c94b88835aaf}" value="482140" label="Formazione dell'Albenza" render="true" symbol="14"/>
   <category type="string" uuid="{a84fb791-3899-4282-81ea-fba2accb5a2e}" value="502130" label="Calcare di Zu" render="true" symbol="15"/>
   <category type="string" uuid="{b51a25ab-a008-4d34-b838-03bb21c9899e}" value="502150" label="Dolomia Principale" render="true" symbol="16"/>
   <category type="string" uuid="{0cd370ed-df41-4fe7-8580-3e0d67616bdd}" value="522150" label="Marna del Pizzella" render="true" symbol="17"/>
   <category type="string" uuid="{152eb693-fee8-4b55-b812-dac3fca2d9dd}" value="532130" label="Formazione di Cunardo" render="true" symbol="18"/>
   <category type="string" uuid="{e78debdd-911d-4b2d-8d68-e3b1c846fe68}" value="532150" label="Dolomia di San Salvatore" render="true" symbol="19"/>
   <category type="string" uuid="{3c6f31d5-a4b7-4269-86e4-29d2f507aefa}" value="542150" label="Formazione di Bellano" render="true" symbol="20"/>
   <category type="string" uuid="{a17b39e7-99a7-443d-879d-4e5a5d2eb841}" value="623226" label="Livelli-particolari" render="true" symbol="21"/>
  </categories>
  <symbols>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="0" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{1fc2c1c0-4dee-4a4e-ad53-73a4bb408d0b}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="139,255,0,255,hsv:0.24277777777777779,1,1,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="255,0,242,255,hsv:0.84166666666666667,1,1,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option type="Map" name="properties">
        <Option type="Map" name="fillColor">
         <Option type="bool" value="true" name="active"/>
         <Option type="QString" value="legenda_colore_hex" name="field"/>
         <Option type="int" value="2" name="type"/>
        </Option>
       </Option>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="1" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{610c8145-1861-487a-aa23-236cb3c08197}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="245,250,250,255,rgb:0.9607843,0.9803922,0.9803922,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="PointPatternFill" enabled="1" pass="0" locked="0" id="{720d3a81-a255-4e0e-beb7-9aca5c8c58d8}">
     <Option type="Map">
      <Option type="double" value="0" name="angle"/>
      <Option type="QString" value="shape" name="clip_mode"/>
      <Option type="QString" value="feature" name="coordinate_reference"/>
      <Option type="QString" value="0" name="displacement_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_x_unit"/>
      <Option type="QString" value="0" name="displacement_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_y_unit"/>
      <Option type="QString" value="5.5" name="distance_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_x_unit"/>
      <Option type="QString" value="5" name="distance_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_y_unit"/>
      <Option type="QString" value="0" name="offset_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_x_unit"/>
      <Option type="QString" value="0" name="offset_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_y_unit"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="0" name="random_deviation_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_x_unit"/>
      <Option type="QString" value="0" name="random_deviation_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_y_unit"/>
      <Option type="QString" value="828920298" name="seed"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="@1@1" is_animated="0">
      <data_defined_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </data_defined_properties>
      <layer class="EllipseMarker" enabled="1" pass="0" locked="0" id="{9d6ad936-691a-4e15-b125-d405e77d0f4c}">
       <Option type="Map">
        <Option type="QString" value="310" name="angle"/>
        <Option type="QString" value="square" name="cap_style"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="color"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="2.29999999999999982,1.5" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
        <Option type="QString" value="no" name="outline_style"/>
        <Option type="QString" value="0" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option type="QString" value="1.5" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0.1" name="symbol_height"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_height_unit"/>
        <Option type="QString" value="rectangle" name="symbol_name"/>
        <Option type="QString" value="1.5" name="symbol_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_width_unit"/>
        <Option type="QString" value="1" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" pass="0" locked="0" id="{48d1004d-1aeb-42d1-97b4-78fbe4ff226b}">
       <Option type="Map">
        <Option type="QString" value="340" name="angle"/>
        <Option type="QString" value="square" name="cap_style"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="color"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="1.80000000000000004,1.5" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
        <Option type="QString" value="no" name="outline_style"/>
        <Option type="QString" value="0" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option type="QString" value="1.5" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0.1" name="symbol_height"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_height_unit"/>
        <Option type="QString" value="rectangle" name="symbol_name"/>
        <Option type="QString" value="1.5" name="symbol_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_width_unit"/>
        <Option type="QString" value="1" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" pass="0" locked="0" id="{ca10ac4c-19ea-4d57-bb14-f7601d3ed60b}">
       <Option type="Map">
        <Option type="QString" value="190" name="angle"/>
        <Option type="QString" value="square" name="cap_style"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="color"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="2,2" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
        <Option type="QString" value="no" name="outline_style"/>
        <Option type="QString" value="0" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option type="QString" value="1.5" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0.1" name="symbol_height"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_height_unit"/>
        <Option type="QString" value="rectangle" name="symbol_name"/>
        <Option type="QString" value="1.5" name="symbol_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_width_unit"/>
        <Option type="QString" value="1" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" pass="0" locked="0" id="{f67188d0-bd39-4d42-885e-962e2ba48b08}">
       <Option type="Map">
        <Option type="QString" value="230" name="angle"/>
        <Option type="QString" value="square" name="cap_style"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="color"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="2,2" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
        <Option type="QString" value="no" name="outline_style"/>
        <Option type="QString" value="0" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option type="QString" value="1.5" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0.1" name="symbol_height"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_height_unit"/>
        <Option type="QString" value="rectangle" name="symbol_name"/>
        <Option type="QString" value="1.5" name="symbol_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_width_unit"/>
        <Option type="QString" value="1" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
      <layer class="EllipseMarker" enabled="1" pass="0" locked="0" id="{806f096c-0c0a-4f6e-8dc8-31d362739219}">
       <Option type="Map">
        <Option type="QString" value="35" name="angle"/>
        <Option type="QString" value="square" name="cap_style"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="color"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="0,0" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
        <Option type="QString" value="no" name="outline_style"/>
        <Option type="QString" value="0" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option type="QString" value="1.5" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0.1" name="symbol_height"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_height_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_height_unit"/>
        <Option type="QString" value="rectangle" name="symbol_name"/>
        <Option type="QString" value="1.5" name="symbol_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="symbol_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="symbol_width_unit"/>
        <Option type="QString" value="1" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="10" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="228,243,248,255,rgb:0.8941176,0.9529412,0.972549,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="11" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="183,223,234,255,rgb:0.7176471,0.8745098,0.9176471,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="12" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="0,157,204,255,rgb:0,0.6156863,0.8,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="13" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="138,178,223,255,rgb:0.5411765,0.6980392,0.8745098,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="14" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="74,149,209,255,rgb:0.2901961,0.5843137,0.8196078,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="15" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="235,216,235,255,rgb:0.9215686,0.8470588,0.9215686,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="16" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="218,176,211,255,rgb:0.854902,0.6901961,0.827451,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="17" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="221,92,157,252,rgb:0.8666667,0.3607843,0.6156863,0.9882353" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="18" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="200,156,200,253,rgb:0.7843137,0.6117647,0.7843137,0.9921569" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="19" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="155,51,138,253,rgb:0.6078431,0.2,0.5411765,0.9921569" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="2" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7d08982c-79af-46bb-9e8f-7d4d14396095}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="0,0,255,255,rgb:0,0,1,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="no" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="PointPatternFill" enabled="1" pass="0" locked="0" id="{1ff270fb-55c4-4c51-93b8-7e27f7ee4922}">
     <Option type="Map">
      <Option type="double" value="0" name="angle"/>
      <Option type="QString" value="shape" name="clip_mode"/>
      <Option type="QString" value="feature" name="coordinate_reference"/>
      <Option type="QString" value="0" name="displacement_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_x_unit"/>
      <Option type="QString" value="0" name="displacement_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_y_unit"/>
      <Option type="QString" value="3" name="distance_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_x_unit"/>
      <Option type="QString" value="3" name="distance_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_y_unit"/>
      <Option type="QString" value="1.5" name="offset_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_x_unit"/>
      <Option type="QString" value="1.5" name="offset_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_y_unit"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="0" name="random_deviation_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_x_unit"/>
      <Option type="QString" value="0" name="random_deviation_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_y_unit"/>
      <Option type="QString" value="563004444" name="seed"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="0.7" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="@2@1" is_animated="0">
      <data_defined_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </data_defined_properties>
      <layer class="SvgMarker" enabled="1" pass="0" locked="0" id="{6fc085b3-5cb9-4d3c-a3bb-b32a6e9a5d40}">
       <Option type="Map">
        <Option type="QString" value="0" name="angle"/>
        <Option type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1" name="color"/>
        <Option type="QString" value="0" name="fixedAspectRatio"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" name="name"/>
        <Option type="QString" value="0,0" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="outline_color"/>
        <Option type="QString" value="0.1" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option name="parameters"/>
        <Option type="QString" value="diameter" name="scale_method"/>
        <Option type="QString" value="0.923077" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option type="Map" name="properties">
          <Option type="Map" name="angle">
           <Option type="bool" value="true" name="active"/>
           <Option type="QString" value="&quot;DIREZIO&quot;-180" name="expression"/>
           <Option type="int" value="3" name="type"/>
          </Option>
         </Option>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
    <layer class="PointPatternFill" enabled="1" pass="0" locked="0" id="{79999146-be7b-43e9-acaf-64c28f38413f}">
     <Option type="Map">
      <Option type="double" value="0" name="angle"/>
      <Option type="QString" value="shape" name="clip_mode"/>
      <Option type="QString" value="feature" name="coordinate_reference"/>
      <Option type="QString" value="0" name="displacement_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_x_unit"/>
      <Option type="QString" value="0" name="displacement_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="displacement_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="displacement_y_unit"/>
      <Option type="QString" value="3" name="distance_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_x_unit"/>
      <Option type="QString" value="3" name="distance_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_y_unit"/>
      <Option type="QString" value="0" name="offset_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_x_unit"/>
      <Option type="QString" value="0" name="offset_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_y_unit"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="0" name="random_deviation_x"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_x_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_x_unit"/>
      <Option type="QString" value="0" name="random_deviation_y"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="random_deviation_y_map_unit_scale"/>
      <Option type="QString" value="MM" name="random_deviation_y_unit"/>
      <Option type="QString" value="809623942" name="seed"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="0.7" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="@2@2" is_animated="0">
      <data_defined_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </data_defined_properties>
      <layer class="SvgMarker" enabled="1" pass="0" locked="0" id="{98aefe80-c2b3-40cd-a993-79e08c430c64}">
       <Option type="Map">
        <Option type="QString" value="0" name="angle"/>
        <Option type="QString" value="245,51,63,255,rgb:0.9607843,0.2,0.2470588,1" name="color"/>
        <Option type="QString" value="0" name="fixedAspectRatio"/>
        <Option type="QString" value="1" name="horizontal_anchor_point"/>
        <Option type="QString" value="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" name="name"/>
        <Option type="QString" value="0,0" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="0,130,202,255,rgb:0,0.5098039,0.7921569,1" name="outline_color"/>
        <Option type="QString" value="0.1" name="outline_width"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
        <Option type="QString" value="MM" name="outline_width_unit"/>
        <Option name="parameters"/>
        <Option type="QString" value="diameter" name="scale_method"/>
        <Option type="QString" value="0.92308" name="size"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
        <Option type="QString" value="MM" name="size_unit"/>
        <Option type="QString" value="0" name="vertical_anchor_point"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option type="Map" name="properties">
          <Option type="Map" name="angle">
           <Option type="bool" value="true" name="active"/>
           <Option type="QString" value="&quot;DIREZIO&quot;-180" name="expression"/>
           <Option type="int" value="3" name="type"/>
          </Option>
         </Option>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="20" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="170,152,201,255,rgb:0.6666667,0.5960784,0.7882353,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="21" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{65a662d4-d14c-40f2-9a7e-0cc2bdd64f48}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="229,229,214,255,rgb:0.8980392,0.8980392,0.8392157,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="LinePatternFill" enabled="1" pass="0" locked="0" id="{837135dd-a3da-40b4-a594-63efa582e2b3}">
     <Option type="Map">
      <Option type="QString" value="0" name="angle"/>
      <Option type="QString" value="during_render" name="clip_mode"/>
      <Option type="QString" value="229,229,214,255,rgb:0.8980392,0.8980392,0.8392157,1" name="color"/>
      <Option type="QString" value="feature" name="coordinate_reference"/>
      <Option type="QString" value="1.2" name="distance"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_unit"/>
      <Option type="QString" value="0.26" name="line_width"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="line_width_unit"/>
      <Option type="QString" value="0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" type="line" clip_to_extent="1" force_rhr="0" frame_rate="10" name="@21@1" is_animated="0">
      <data_defined_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </data_defined_properties>
      <layer class="SimpleLine" enabled="1" pass="0" locked="0" id="{5012e351-5e53-4d3c-a26e-99df2d3c5f69}">
       <Option type="Map">
        <Option type="QString" value="0" name="align_dash_pattern"/>
        <Option type="QString" value="square" name="capstyle"/>
        <Option type="QString" value="5;2" name="customdash"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
        <Option type="QString" value="MM" name="customdash_unit"/>
        <Option type="QString" value="0" name="dash_pattern_offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
        <Option type="QString" value="0" name="draw_inside_polygon"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="167,89,40,255,rgb:0.654902,0.3490196,0.1568627,1" name="line_color"/>
        <Option type="QString" value="solid" name="line_style"/>
        <Option type="QString" value="0.1" name="line_width"/>
        <Option type="QString" value="MM" name="line_width_unit"/>
        <Option type="QString" value="0" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="0" name="ring_filter"/>
        <Option type="QString" value="0" name="trim_distance_end"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
        <Option type="QString" value="MM" name="trim_distance_end_unit"/>
        <Option type="QString" value="0" name="trim_distance_start"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
        <Option type="QString" value="MM" name="trim_distance_start_unit"/>
        <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
        <Option type="QString" value="0" name="use_custom_dash"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="3" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{2393d5f0-caa7-485c-b61e-43ef8598fc68}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="255,245,227,255,rgb:1,0.9607843,0.8901961,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
    <layer class="LinePatternFill" enabled="1" pass="0" locked="0" id="{100bd06c-181f-43fd-8c8c-e248c3bd32e6}">
     <Option type="Map">
      <Option type="QString" value="135" name="angle"/>
      <Option type="QString" value="during_render" name="clip_mode"/>
      <Option type="QString" value="255,241,216,255,rgb:1,0.945098,0.8470588,1" name="color"/>
      <Option type="QString" value="feature" name="coordinate_reference"/>
      <Option type="QString" value="1.2" name="distance"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="distance_map_unit_scale"/>
      <Option type="QString" value="MM" name="distance_unit"/>
      <Option type="QString" value="0.26" name="line_width"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="line_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="line_width_unit"/>
      <Option type="QString" value="0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
     <symbol alpha="1" type="line" clip_to_extent="1" force_rhr="0" frame_rate="10" name="@3@1" is_animated="0">
      <data_defined_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </data_defined_properties>
      <layer class="SimpleLine" enabled="1" pass="0" locked="0" id="{fcaa78da-0688-4138-a1d1-9e4123ce2f49}">
       <Option type="Map">
        <Option type="QString" value="0" name="align_dash_pattern"/>
        <Option type="QString" value="square" name="capstyle"/>
        <Option type="QString" value="5;2" name="customdash"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="customdash_map_unit_scale"/>
        <Option type="QString" value="MM" name="customdash_unit"/>
        <Option type="QString" value="0" name="dash_pattern_offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="dash_pattern_offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="dash_pattern_offset_unit"/>
        <Option type="QString" value="0" name="draw_inside_polygon"/>
        <Option type="QString" value="bevel" name="joinstyle"/>
        <Option type="QString" value="246,50,62,255,rgb:0.9647059,0.1960784,0.2431373,1" name="line_color"/>
        <Option type="QString" value="solid" name="line_style"/>
        <Option type="QString" value="0.1" name="line_width"/>
        <Option type="QString" value="MM" name="line_width_unit"/>
        <Option type="QString" value="0" name="offset"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
        <Option type="QString" value="MM" name="offset_unit"/>
        <Option type="QString" value="0" name="ring_filter"/>
        <Option type="QString" value="0" name="trim_distance_end"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_end_map_unit_scale"/>
        <Option type="QString" value="MM" name="trim_distance_end_unit"/>
        <Option type="QString" value="0" name="trim_distance_start"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="trim_distance_start_map_unit_scale"/>
        <Option type="QString" value="MM" name="trim_distance_start_unit"/>
        <Option type="QString" value="0" name="tweak_dash_pattern_on_corners"/>
        <Option type="QString" value="0" name="use_custom_dash"/>
        <Option type="QString" value="3x:0,0,0,0,0,0" name="width_map_unit_scale"/>
       </Option>
       <data_defined_properties>
        <Option type="Map">
         <Option type="QString" value="" name="name"/>
         <Option name="properties"/>
         <Option type="QString" value="collection" name="type"/>
        </Option>
       </data_defined_properties>
      </layer>
     </symbol>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="4" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{01b1d498-75c1-4938-9efd-abd288b8273d}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="246,203,94,255,rgb:0.9647059,0.7960784,0.3686275,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="5" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="219,226,188,255,rgb:0.8588235,0.8862745,0.7372549,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="6" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="200,221,154,255,rgb:0.7843137,0.8666667,0.6039216,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="7" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="219,234,209,255,rgb:0.8588235,0.9176471,0.8196078,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="8" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="168,203,148,255,rgb:0.6588235,0.7960784,0.5803922,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="9" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{7ce9b879-baa8-450d-8235-b151e26076fd}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="49,156,49,255,rgb:0.1921569,0.6117647,0.1921569,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </symbols>
  <source-symbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="0" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{3a50faf2-f9e9-4722-b962-7ff02cea5f63}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="218,44,50,255,hsv:0.99444444444444446,0.79607843137254897,0.85490196078431369,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option type="Map" name="properties">
        <Option type="Map" name="fillColor">
         <Option type="bool" value="true" name="active"/>
         <Option type="QString" value="legenda_colore_hex" name="field"/>
         <Option type="int" value="2" name="type"/>
        </Option>
       </Option>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </source-symbol>
  <rotation/>
  <sizescale/>
  <data-defined-properties>
   <Option type="Map">
    <Option type="QString" value="" name="name"/>
    <Option name="properties"/>
    <Option type="QString" value="collection" name="type"/>
   </Option>
  </data-defined-properties>
 </renderer-v2>
 <selection mode="Default">
  <selectionColor invalid="1"/>
  <selectionSymbol>
   <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="" is_animated="0">
    <data_defined_properties>
     <Option type="Map">
      <Option type="QString" value="" name="name"/>
      <Option name="properties"/>
      <Option type="QString" value="collection" name="type"/>
     </Option>
    </data_defined_properties>
    <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="{f3c88602-ae15-453b-b0c5-48adf435b152}">
     <Option type="Map">
      <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
      <Option type="QString" value="0,0,255,255,rgb:0,0,1,1" name="color"/>
      <Option type="QString" value="bevel" name="joinstyle"/>
      <Option type="QString" value="0,0" name="offset"/>
      <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
      <Option type="QString" value="MM" name="offset_unit"/>
      <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
      <Option type="QString" value="solid" name="outline_style"/>
      <Option type="QString" value="0.26" name="outline_width"/>
      <Option type="QString" value="MM" name="outline_width_unit"/>
      <Option type="QString" value="solid" name="style"/>
     </Option>
     <data_defined_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </data_defined_properties>
    </layer>
   </symbol>
  </selectionSymbol>
 </selection>
 <labeling type="rule-based">
  <rules key="{848dc4fe-daa0-45b3-8fa6-87fd8a88781d}">
   <rule key="{2d1f1918-371c-4c58-a8bf-27d595e09068}">
    <settings calloutType="simple">
     <text-style tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" fontWordSpacing="0" namedStyle="Regular" fontLetterSpacing="0" capitalization="0" useSubstitutions="1" forcedItalic="0" fontWeight="50" stretchFactor="100" isExpression="0" tabStopDistanceUnit="Point" fontStrikeout="0" fontKerning="1" blendMode="0" textOrientation="horizontal" multilineHeightUnit="Percentage" fontSizeUnit="Point" textColor="50,50,50,255,rgb:0.1960784,0.1960784,0.1960784,1" textOpacity="1" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" multilineHeight="1" fontSize="10" fontSizeMapUnitScale="3x:0,0,0,0,0,0" allowHtml="0" fontItalic="0" forcedBold="0" fontFamily="Open Sans" fontUnderline="0" fieldName="descrizione">
      <families/>
      <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferSize="1" bufferBlendMode="0" bufferDraw="1" bufferSizeUnits="MM" bufferColor="250,250,250,255,rgb:0.9803922,0.9803922,0.9803922,1" bufferOpacity="1" bufferJoinStyle="128"/>
      <text-mask maskType="0" maskSizeUnits="MM" maskEnabled="0" maskedSymbolLayers="" maskOpacity="1" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128"/>
      <background shapeSizeUnit="Point" shapeOpacity="1" shapeOffsetX="0" shapeSizeY="0" shapeRadiiY="0" shapeType="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="Point" shapeRadiiUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeBorderWidthUnit="Point" shapeJoinStyle="64" shapeDraw="0" shapeRadiiX="0" shapeBlendMode="0" shapeRotation="0" shapeSizeX="0" shapeBorderColor="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" shapeOffsetY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="">
       <symbol alpha="1" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="markerSymbol" is_animated="0">
        <data_defined_properties>
         <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option name="properties"/>
          <Option type="QString" value="collection" name="type"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0" id="">
         <Option type="Map">
          <Option type="QString" value="0" name="angle"/>
          <Option type="QString" value="square" name="cap_style"/>
          <Option type="QString" value="225,89,137,255,rgb:0.8823529,0.3490196,0.5372549,1" name="color"/>
          <Option type="QString" value="1" name="horizontal_anchor_point"/>
          <Option type="QString" value="bevel" name="joinstyle"/>
          <Option type="QString" value="circle" name="name"/>
          <Option type="QString" value="0,0" name="offset"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
          <Option type="QString" value="MM" name="offset_unit"/>
          <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
          <Option type="QString" value="solid" name="outline_style"/>
          <Option type="QString" value="0" name="outline_width"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
          <Option type="QString" value="MM" name="outline_width_unit"/>
          <Option type="QString" value="diameter" name="scale_method"/>
          <Option type="QString" value="2" name="size"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
          <Option type="QString" value="MM" name="size_unit"/>
          <Option type="QString" value="1" name="vertical_anchor_point"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option type="QString" value="" name="name"/>
           <Option name="properties"/>
           <Option type="QString" value="collection" name="type"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
       <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="fillSymbol" is_animated="0">
        <data_defined_properties>
         <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option name="properties"/>
          <Option type="QString" value="collection" name="type"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="">
         <Option type="Map">
          <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
          <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
          <Option type="QString" value="bevel" name="joinstyle"/>
          <Option type="QString" value="0,0" name="offset"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
          <Option type="QString" value="MM" name="offset_unit"/>
          <Option type="QString" value="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" name="outline_color"/>
          <Option type="QString" value="no" name="outline_style"/>
          <Option type="QString" value="0" name="outline_width"/>
          <Option type="QString" value="Point" name="outline_width_unit"/>
          <Option type="QString" value="solid" name="style"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option type="QString" value="" name="name"/>
           <Option name="properties"/>
           <Option type="QString" value="collection" name="type"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
      </background>
      <shadow shadowRadius="1.5" shadowOffsetGlobal="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowDraw="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.69999999999999996" shadowUnder="0" shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowBlendMode="6"/>
      <dd_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </dd_properties>
      <substitutions/>
     </text-style>
     <text-format leftDirectionSymbol="&lt;" autoWrapLength="30" rightDirectionSymbol=">" placeDirectionSymbol="0" plussign="0" useMaxLineLengthForAutoWrap="1" multilineAlign="3" wrapChar="" reverseDirectionSymbol="0" addDirectionSymbol="0" formatNumbers="0" decimals="3"/>
     <placement xOffset="0" lineAnchorClipping="0" maxCurvedCharAngleIn="25" maximumDistanceUnit="MM" prioritization="PreferCloser" placement="0" geometryGenerator="" lineAnchorType="0" centroidWhole="0" repeatDistanceUnits="MM" polygonPlacementFlags="2" offsetType="0" geometryGeneratorEnabled="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" layerType="PolygonGeometry" allowDegraded="0" placementFlags="10" geometryGeneratorType="PointGeometry" preserveRotation="1" offsetUnits="MM" dist="0" lineAnchorTextPoint="FollowPlacement" lineAnchorPercent="0.5" rotationAngle="0" overrunDistanceUnit="MM" distUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" priority="5" fitInPolygonOnly="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" maximumDistance="0" overlapHandling="PreventOverlap" overrunDistance="0" repeatDistance="0"/>
     <rendering limitNumLabels="0" obstacle="1" unplacedVisibility="0" fontLimitPixelSize="0" scaleMin="0" fontMinPixelSize="3" zIndex="0" fontMaxPixelSize="10000" maxNumLabels="2000" labelPerPart="0" upsidedownLabels="0" scaleMax="5000" obstacleFactor="1" scaleVisibility="1" minFeatureSize="0" drawLabels="1" mergeLines="0" obstacleType="1"/>
     <dd_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </dd_properties>
     <callout type="simple">
      <Option type="Map">
       <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
       <Option type="int" value="0" name="blendMode"/>
       <Option type="Map" name="ddProperties">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
       <Option type="bool" value="false" name="drawToAllParts"/>
       <Option type="QString" value="0" name="enabled"/>
       <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
       <Option type="QString" value="&lt;symbol alpha=&quot;1&quot; type=&quot;line&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; name=&quot;symbol&quot; is_animated=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot; id=&quot;{4d95d5b6-801b-48f6-9646-0196592cbe44}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.2352941,0.2352941,0.2352941,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
       <Option type="double" value="0" name="minLength"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
       <Option type="QString" value="MM" name="minLengthUnit"/>
       <Option type="double" value="0" name="offsetFromAnchor"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
       <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
       <Option type="double" value="0" name="offsetFromLabel"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
       <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
      </Option>
     </callout>
    </settings>
   </rule>
   <rule key="{19a9df98-9a39-440f-a621-993947195c41}">
    <settings calloutType="simple">
     <text-style tabStopDistanceMapUnitScale="3x:0,0,0,0,0,0" legendString="Aa" tabStopDistance="80" fontWordSpacing="0" namedStyle="Bold" fontLetterSpacing="0" capitalization="0" useSubstitutions="0" forcedItalic="0" fontWeight="75" stretchFactor="100" isExpression="0" tabStopDistanceUnit="Point" fontStrikeout="0" fontKerning="1" blendMode="0" textOrientation="horizontal" multilineHeightUnit="Percentage" fontSizeUnit="RenderMetersInMapUnits" textColor="50,50,50,255,rgb:0.1960784,0.1960784,0.1960784,1" textOpacity="0.80000000000000004" previewBkgrdColor="255,255,255,255,rgb:1,1,1,1" multilineHeight="1" fontSize="9" fontSizeMapUnitScale="3x:0,0,0,0,0,0" allowHtml="0" fontItalic="0" forcedBold="0" fontFamily="Helvetica" fontUnderline="0" fieldName="sigla">
      <families/>
      <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferNoFill="1" bufferSize="1" bufferBlendMode="0" bufferDraw="0" bufferSizeUnits="MM" bufferColor="250,250,250,255,rgb:0.9803922,0.9803922,0.9803922,1" bufferOpacity="1" bufferJoinStyle="128"/>
      <text-mask maskType="0" maskSizeUnits="MM" maskEnabled="0" maskedSymbolLayers="" maskOpacity="1" maskSize="1.5" maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskJoinStyle="128"/>
      <background shapeSizeUnit="Point" shapeOpacity="1" shapeOffsetX="0" shapeSizeY="0" shapeRadiiY="0" shapeType="0" shapeFillColor="255,255,255,255,rgb:1,1,1,1" shapeSizeType="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetUnit="Point" shapeRadiiUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRotationType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidth="0" shapeBorderWidthUnit="Point" shapeJoinStyle="64" shapeDraw="0" shapeRadiiX="0" shapeBlendMode="0" shapeRotation="0" shapeSizeX="0" shapeBorderColor="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" shapeOffsetY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSVGFile="">
       <symbol alpha="1" type="marker" clip_to_extent="1" force_rhr="0" frame_rate="10" name="markerSymbol" is_animated="0">
        <data_defined_properties>
         <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option name="properties"/>
          <Option type="QString" value="collection" name="type"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0" id="">
         <Option type="Map">
          <Option type="QString" value="0" name="angle"/>
          <Option type="QString" value="square" name="cap_style"/>
          <Option type="QString" value="243,166,178,255,rgb:0.9529412,0.6509804,0.6980392,1" name="color"/>
          <Option type="QString" value="1" name="horizontal_anchor_point"/>
          <Option type="QString" value="bevel" name="joinstyle"/>
          <Option type="QString" value="circle" name="name"/>
          <Option type="QString" value="0,0" name="offset"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
          <Option type="QString" value="MM" name="offset_unit"/>
          <Option type="QString" value="35,35,35,255,rgb:0.1372549,0.1372549,0.1372549,1" name="outline_color"/>
          <Option type="QString" value="solid" name="outline_style"/>
          <Option type="QString" value="0" name="outline_width"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
          <Option type="QString" value="MM" name="outline_width_unit"/>
          <Option type="QString" value="diameter" name="scale_method"/>
          <Option type="QString" value="2" name="size"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
          <Option type="QString" value="MM" name="size_unit"/>
          <Option type="QString" value="1" name="vertical_anchor_point"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option type="QString" value="" name="name"/>
           <Option name="properties"/>
           <Option type="QString" value="collection" name="type"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
       <symbol alpha="1" type="fill" clip_to_extent="1" force_rhr="0" frame_rate="10" name="fillSymbol" is_animated="0">
        <data_defined_properties>
         <Option type="Map">
          <Option type="QString" value="" name="name"/>
          <Option name="properties"/>
          <Option type="QString" value="collection" name="type"/>
         </Option>
        </data_defined_properties>
        <layer class="SimpleFill" enabled="1" pass="0" locked="0" id="">
         <Option type="Map">
          <Option type="QString" value="3x:0,0,0,0,0,0" name="border_width_map_unit_scale"/>
          <Option type="QString" value="255,255,255,255,rgb:1,1,1,1" name="color"/>
          <Option type="QString" value="bevel" name="joinstyle"/>
          <Option type="QString" value="0,0" name="offset"/>
          <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
          <Option type="QString" value="MM" name="offset_unit"/>
          <Option type="QString" value="128,128,128,255,rgb:0.5019608,0.5019608,0.5019608,1" name="outline_color"/>
          <Option type="QString" value="no" name="outline_style"/>
          <Option type="QString" value="0" name="outline_width"/>
          <Option type="QString" value="Point" name="outline_width_unit"/>
          <Option type="QString" value="solid" name="style"/>
         </Option>
         <data_defined_properties>
          <Option type="Map">
           <Option type="QString" value="" name="name"/>
           <Option name="properties"/>
           <Option type="QString" value="collection" name="type"/>
          </Option>
         </data_defined_properties>
        </layer>
       </symbol>
      </background>
      <shadow shadowRadius="1.5" shadowOffsetGlobal="1" shadowColor="0,0,0,255,rgb:0,0,0,1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowDraw="0" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetAngle="135" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.69999999999999996" shadowUnder="0" shadowRadiusUnit="MM" shadowRadiusAlphaOnly="0" shadowBlendMode="6"/>
      <dd_properties>
       <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
      </dd_properties>
      <substitutions/>
     </text-style>
     <text-format leftDirectionSymbol="&lt;" autoWrapLength="0" rightDirectionSymbol=">" placeDirectionSymbol="0" plussign="0" useMaxLineLengthForAutoWrap="1" multilineAlign="3" wrapChar="" reverseDirectionSymbol="0" addDirectionSymbol="0" formatNumbers="0" decimals="3"/>
     <placement xOffset="0" lineAnchorClipping="0" maxCurvedCharAngleIn="25" maximumDistanceUnit="MM" prioritization="PreferCloser" placement="0" geometryGenerator="" lineAnchorType="0" centroidWhole="1" repeatDistanceUnits="MM" polygonPlacementFlags="2" offsetType="0" geometryGeneratorEnabled="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidInside="1" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" layerType="PolygonGeometry" allowDegraded="0" placementFlags="10" geometryGeneratorType="PointGeometry" preserveRotation="1" offsetUnits="MM" dist="0" lineAnchorTextPoint="FollowPlacement" lineAnchorPercent="0.5" rotationAngle="0" allowDuplicateRemoval="1" overrunDistanceUnit="MM" distUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" quadOffset="4" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" priority="5" fitInPolygonOnly="0" maximumDistanceMapUnitScale="3x:0,0,0,0,0,0" rotationUnit="AngleDegrees" maximumDistance="0" overlapHandling="PreventOverlap" overrunDistance="0" repeatDistance="0"/>
     <rendering limitNumLabels="0" obstacle="1" unplacedVisibility="0" fontLimitPixelSize="0" scaleMin="0" fontMinPixelSize="3" zIndex="0" fontMaxPixelSize="10000" maxNumLabels="2000" labelPerPart="0" upsidedownLabels="0" scaleMax="10000" obstacleFactor="1" scaleVisibility="1" minFeatureSize="0" drawLabels="1" mergeLines="0" obstacleType="1"/>
     <dd_properties>
      <Option type="Map">
       <Option type="QString" value="" name="name"/>
       <Option name="properties"/>
       <Option type="QString" value="collection" name="type"/>
      </Option>
     </dd_properties>
     <callout type="simple">
      <Option type="Map">
       <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
       <Option type="int" value="0" name="blendMode"/>
       <Option type="Map" name="ddProperties">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
       </Option>
       <Option type="bool" value="false" name="drawToAllParts"/>
       <Option type="QString" value="0" name="enabled"/>
       <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
       <Option type="QString" value="&lt;symbol alpha=&quot;1&quot; type=&quot;line&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; name=&quot;symbol&quot; is_animated=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot; id=&quot;{c5a59d1d-f640-4fd7-8edb-9c27786dc3e8}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255,rgb:0.2352941,0.2352941,0.2352941,1&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
       <Option type="double" value="0" name="minLength"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
       <Option type="QString" value="MM" name="minLengthUnit"/>
       <Option type="double" value="0" name="offsetFromAnchor"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromAnchorMapUnitScale"/>
       <Option type="QString" value="MM" name="offsetFromAnchorUnit"/>
       <Option type="double" value="0" name="offsetFromLabel"/>
       <Option type="QString" value="3x:0,0,0,0,0,0" name="offsetFromLabelMapUnitScale"/>
       <Option type="QString" value="MM" name="offsetFromLabelUnit"/>
      </Option>
     </callout>
    </settings>
   </rule>
  </rules>
 </labeling>
 <customproperties>
  <Option type="Map">
   <Option type="QString" value="no_action" name="QFieldSync/action"/>
   <Option type="QString" value="{}" name="QFieldSync/attachment_naming"/>
   <Option type="QString" value="" name="QFieldSync/attribute_editing_locked_expression"/>
   <Option type="QString" value="offline" name="QFieldSync/cloud_action"/>
   <Option type="QString" value="" name="QFieldSync/feature_addition_locked_expression"/>
   <Option type="QString" value="" name="QFieldSync/feature_deletion_locked_expression"/>
   <Option type="QString" value="" name="QFieldSync/geometry_editing_locked_expression"/>
   <Option type="QString" value="{}" name="QFieldSync/photo_naming"/>
   <Option type="QString" value="{}" name="QFieldSync/relationship_maximum_visible"/>
   <Option type="int" value="30" name="QFieldSync/tracking_distance_requirement_minimum_meters"/>
   <Option type="int" value="1" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"/>
   <Option type="int" value="0" name="QFieldSync/tracking_measurement_type"/>
   <Option type="int" value="30" name="QFieldSync/tracking_time_requirement_interval_seconds"/>
   <Option type="int" value="0" name="QFieldSync/value_map_button_interface_threshold"/>
   <Option type="List" name="dualview/previewExpressions">
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
    <Option type="QString" value="COALESCE( &quot;descrizione&quot;, '&lt;NULL>' )"/>
    <Option type="invalid"/>
   </Option>
   <Option type="int" value="0" name="embeddedWidgets/count"/>
   <Option name="variableNames"/>
   <Option name="variableValues"/>
  </Option>
 </customproperties>
 <blendMode>0</blendMode>
 <featureBlendMode>0</featureBlendMode>
 <layerOpacity>0.75</layerOpacity>
 <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
  <activeChecks/>
  <checkConfiguration type="Map">
   <Option type="Map" name="QgsGeometryGapCheck">
    <Option type="double" value="0" name="allowedGapsBuffer"/>
    <Option type="bool" value="false" name="allowedGapsEnabled"/>
    <Option type="QString" value="" name="allowedGapsLayer"/>
   </Option>
  </checkConfiguration>
 </geometryOptions>
 <legend type="default-vector" showLabelLegend="0"/>
 <referencedLayers/>
 <referencingLayers/>
 <fieldConfiguration>
  <field name="id" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="fid" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="sigla" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="FVS" name="Flysch del Varesotto"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="SAA" name="Scaglia Rossa"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="SDL" name="Sass de la Luna"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="MAI" name="Maiolica"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="RSL" name="Radiolariti del Selcifero Lombardo"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="SML" name="Gruppo del Selcifero Lombardo"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="VAM" name="Formazione di Val Maggiore"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="DOM" name="Calcare di Domaro"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="MOT" name="Calcare di Moltrasio"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="APX" name="Calcare di Alpe Perino"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ALZ" name="Formazione dell'Albenza"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ZUU" name="Calcare di Zu"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="DPR" name="Dolomia Principale"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="PIZ" name="Marna del Pizzella"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="CUN" name="Formazione di Cunardo"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="DSS" name="Dolomia di San Salvatore"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="BLN" name="Formazione di Bellano"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="WOW" name="Livelli-particolari"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="XYZ" name="Dubbio-altro"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="UIN" name="Morfologia"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="UID" name="Frana"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="{2839923C-8B7D-419E-B84B-CA2FE9B80EC7}" name="&lt;NULL>"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="descrizione" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option type="bool" value="false" name="IsMultiline"/>
      <Option type="bool" value="false" name="UseHtml"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="visibilita" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="1" name="affiorante"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="2" name="subaffiorante"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="3" name="a tratti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="4" name="tele"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="part" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="1" name="prevalente"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="2" name="frequente"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="3" name="alternanza"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="4" name="variabile tra altra lito"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="5" name="subordinata"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="6" name="intercalazioni"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="7" name="base"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="8" name="tetto"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="9" name="sporadico/scarso"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="10" name="filone"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="11" name="olistoliti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="12" name="non applicabile"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="stratif" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="1" name="strati sottili (3÷10cm)"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="2" name="strati sottili - medi"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="3" name="strati sottili - medi - spessi e molto spessi"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="4" name="strati sottili / indistinti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="5" name="strati sottili - medi - spessi e molto spessi / indistinti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="6" name="strati medi (10÷30cm)"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="7" name="strati medi - spessi e molto spessi"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="8" name="strati medi / indistinti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="9" name="strati medi - spessi e molto spessi / indistinti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="10" name="strati spessi (30÷100cm)"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="11" name="strati da molto spessi a estrem. spessi-banchi (100÷300cm; >300cm)"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="12" name="strati spessi e molto spessi"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="13" name="strati spessi e molto spessi / indistinti"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="14" name="massiva"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="assetto" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="am" name="ammasso"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="an" name="anello"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="au" name="autobrecciato o autoclastico"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ba" name="bastione"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ca" name="caotico"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="cl" name="colata"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="cn" name="cono"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="cu" name="a cuscino"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="di" name="dicco"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="do" name="domo"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="fi" name="filone"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="la" name="laccolite"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="le" name="lenticolare"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="lv" name="livello"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ne" name="neck"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="or" name="orizzonte"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ta" name="tabulare"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="ve" name="vena"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="caratter" configurationFlags="NoFlag">
   <editWidget type="ValueMap">
    <config>
     <Option type="Map">
      <Option type="List" name="map">
       <Option type="Map">
        <Option type="QString" value="1" name="fratturato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="2" name="alterato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="3" name="cataclasato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="4" name="zeolitizzato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="5" name="fratturazione concoide"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="6" name="fessurazione prismatica"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="7" name="poco cementato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="8" name="moderatamente cementato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="9" name="cementato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="10" name="variamente cementato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="11" name="poco saldato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="12" name="moderatamente saldato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="13" name="saldato"/>
       </Option>
       <Option type="Map">
        <Option type="QString" value="14" name="variamente saldato"/>
       </Option>
      </Option>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="note" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option type="Map">
      <Option type="bool" value="false" name="IsMultiline"/>
      <Option type="bool" value="false" name="UseHtml"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="data_ora" configurationFlags="NoFlag">
   <editWidget type="DateTime">
    <config>
     <Option type="Map">
      <Option type="bool" value="false" name="allow_null"/>
      <Option type="bool" value="false" name="calendar_popup"/>
      <Option type="QString" value="yyyy-MM-dd HH:mm" name="display_format"/>
      <Option type="QString" value="yyyy-MM-dd HH:mm:ss" name="field_format"/>
      <Option type="bool" value="false" name="field_format_overwrite"/>
      <Option type="bool" value="false" name="field_iso_format"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="created_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_at" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="created_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="updated_by" configurationFlags="NoFlag">
   <editWidget type="Hidden">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="is_deleted" configurationFlags="NoFlag">
   <editWidget type="CheckBox">
    <config>
     <Option type="Map">
      <Option type="bool" value="false" name="AllowNullState"/>
      <Option type="invalid" name="CheckedState"/>
      <Option type="int" value="0" name="TextDisplayMethod"/>
      <Option type="invalid" name="UncheckedState"/>
     </Option>
    </config>
   </editWidget>
  </field>
  <field name="nome_unita" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="eta" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
  <field name="codice_carg" configurationFlags="NoFlag">
   <editWidget type="TextEdit">
    <config>
     <Option/>
    </config>
   </editWidget>
  </field>
 </fieldConfiguration>
 <aliases>
  <alias field="id" name="" index="0"/>
  <alias field="fid" name="" index="1"/>
  <alias field="sigla" name="" index="2"/>
  <alias field="descrizione" name="" index="3"/>
  <alias field="visibilita" name="" index="4"/>
  <alias field="part" name="" index="5"/>
  <alias field="stratif" name="" index="6"/>
  <alias field="assetto" name="" index="7"/>
  <alias field="caratter" name="" index="8"/>
  <alias field="note" name="" index="9"/>
  <alias field="data_ora" name="" index="10"/>
  <alias field="created_at" name="" index="11"/>
  <alias field="updated_at" name="" index="12"/>
  <alias field="created_by" name="" index="13"/>
  <alias field="updated_by" name="" index="14"/>
  <alias field="is_deleted" name="Da scartare" index="15"/>
  <alias field="nome_unita" name="" index="16"/>
  <alias field="eta" name="" index="17"/>
  <alias field="codice_carg" name="" index="18"/>
 </aliases>
 <defaults>
  <default expression="" field="id" applyOnUpdate="0"/>
  <default expression="" field="fid" applyOnUpdate="0"/>
  <default expression="" field="sigla" applyOnUpdate="0"/>
  <default expression="" field="descrizione" applyOnUpdate="0"/>
  <default expression="1" field="visibilita" applyOnUpdate="0"/>
  <default expression="" field="part" applyOnUpdate="0"/>
  <default expression="" field="stratif" applyOnUpdate="0"/>
  <default expression="" field="assetto" applyOnUpdate="0"/>
  <default expression="" field="caratter" applyOnUpdate="0"/>
  <default expression="" field="note" applyOnUpdate="0"/>
  <default expression="now()" field="data_ora" applyOnUpdate="0"/>
  <default expression="" field="created_at" applyOnUpdate="0"/>
  <default expression="" field="updated_at" applyOnUpdate="0"/>
  <default expression="" field="created_by" applyOnUpdate="0"/>
  <default expression="" field="updated_by" applyOnUpdate="0"/>
  <default expression="" field="is_deleted" applyOnUpdate="0"/>
  <default expression="" field="nome_unita" applyOnUpdate="0"/>
  <default expression="" field="eta" applyOnUpdate="0"/>
  <default expression="" field="codice_carg" applyOnUpdate="0"/>
 </defaults>
 <constraints>
  <constraint field="id" exp_strength="0" unique_strength="1" notnull_strength="1" constraints="3"/>
  <constraint field="fid" exp_strength="1" unique_strength="2" notnull_strength="2" constraints="7"/>
  <constraint field="sigla" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="descrizione" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="visibilita" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="part" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="stratif" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="assetto" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="caratter" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="note" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="data_ora" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="created_at" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
  <constraint field="updated_at" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
  <constraint field="created_by" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
  <constraint field="updated_by" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
  <constraint field="is_deleted" exp_strength="0" unique_strength="0" notnull_strength="1" constraints="1"/>
  <constraint field="nome_unita" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="eta" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
  <constraint field="codice_carg" exp_strength="0" unique_strength="0" notnull_strength="0" constraints="0"/>
 </constraints>
 <constraintExpressions>
  <constraint field="id" desc="" exp=""/>
  <constraint field="fid" desc="" exp=""/>
  <constraint field="sigla" desc="" exp=""/>
  <constraint field="descrizione" desc="" exp=""/>
  <constraint field="visibilita" desc="" exp=""/>
  <constraint field="part" desc="" exp=""/>
  <constraint field="stratif" desc="" exp=""/>
  <constraint field="assetto" desc="" exp=""/>
  <constraint field="caratter" desc="" exp=""/>
  <constraint field="note" desc="" exp=""/>
  <constraint field="data_ora" desc="" exp=""/>
  <constraint field="created_at" desc="" exp=""/>
  <constraint field="updated_at" desc="" exp=""/>
  <constraint field="created_by" desc="" exp=""/>
  <constraint field="updated_by" desc="" exp=""/>
  <constraint field="is_deleted" desc="" exp=""/>
  <constraint field="nome_unita" desc="" exp=""/>
  <constraint field="eta" desc="" exp=""/>
  <constraint field="codice_carg" desc="" exp=""/>
 </constraintExpressions>
 <expressionfields/>
 <attributeactions>
  <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
 </attributeactions>
 <attributetableconfig actionWidgetStyle="dropDown" sortOrder="1" sortExpression="&quot;data_ora&quot;">
  <columns>
   <column type="field" hidden="0" width="46" name="fid"/>
   <column type="field" hidden="0" width="186" name="sigla"/>
   <column type="field" hidden="0" width="238" name="descrizione"/>
   <column type="field" hidden="0" width="-1" name="visibilita"/>
   <column type="field" hidden="0" width="-1" name="part"/>
   <column type="field" hidden="0" width="-1" name="stratif"/>
   <column type="field" hidden="0" width="-1" name="assetto"/>
   <column type="field" hidden="0" width="-1" name="caratter"/>
   <column type="field" hidden="0" width="74" name="note"/>
   <column type="field" hidden="0" width="219" name="data_ora"/>
   <column type="field" hidden="0" width="-1" name="id"/>
   <column type="field" hidden="0" width="-1" name="created_at"/>
   <column type="field" hidden="0" width="-1" name="updated_at"/>
   <column type="field" hidden="0" width="-1" name="created_by"/>
   <column type="field" hidden="0" width="-1" name="updated_by"/>
   <column type="field" hidden="0" width="-1" name="is_deleted"/>
   <column type="field" hidden="0" width="-1" name="nome_unita"/>
   <column type="field" hidden="0" width="-1" name="eta"/>
   <column type="field" hidden="0" width="-1" name="codice_carg"/>
   <column type="actions" hidden="1" width="-1"/>
  </columns>
 </attributetableconfig>
 <conditionalstyles>
  <rowstyles/>
  <fieldstyles/>
 </conditionalstyles>
 <storedexpressions/>
 <editform tolerant="1"></editform>
 <editforminit/>
 <editforminitcodesource>0</editforminitcodesource>
 <editforminitfilepath></editforminitfilepath>
 <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
I moduli di QGIS possono avere una funzione Python che può essere chiamata quando un modulo viene aperto.

Usa questa funzione per aggiungere logica extra ai tuoi moduli.

Inserisci il nome della funzione nel campo "Funzione Python di avvio".

Segue un esempio:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
geom = feature.geometry()
control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
 <featformsuppress>0</featformsuppress>
 <editorlayout>generatedlayout</editorlayout>
 <editable>
  <field name="Legenda_codice_carg" editable="0"/>
  <field name="assetto" editable="1"/>
  <field name="caratter" editable="1"/>
  <field name="codice_carg" editable="1"/>
  <field name="created_at" editable="1"/>
  <field name="created_by" editable="1"/>
  <field name="data_ora" editable="0"/>
  <field name="descrizione" editable="1"/>
  <field name="eta" editable="1"/>
  <field name="fid" editable="1"/>
  <field name="id" editable="1"/>
  <field name="is_deleted" editable="1"/>
  <field name="legenda_colore_hex" editable="0"/>
  <field name="nome_unita" editable="1"/>
  <field name="note" editable="1"/>
  <field name="part" editable="1"/>
  <field name="sigla" editable="1"/>
  <field name="stratif" editable="1"/>
  <field name="updated_at" editable="1"/>
  <field name="updated_by" editable="1"/>
  <field name="verbania_sigle_codice_carg" editable="0"/>
  <field name="verbania_sigle_id" editable="0"/>
  <field name="verbania_sigle_nome" editable="0"/>
  <field name="verbania_sigle_sigla" editable="0"/>
  <field name="visibilita" editable="1"/>
 </editable>
 <labelOnTop>
  <field labelOnTop="0" name="Legenda_codice_carg"/>
  <field labelOnTop="0" name="assetto"/>
  <field labelOnTop="0" name="caratter"/>
  <field labelOnTop="0" name="codice_carg"/>
  <field labelOnTop="0" name="created_at"/>
  <field labelOnTop="0" name="created_by"/>
  <field labelOnTop="0" name="data_ora"/>
  <field labelOnTop="0" name="descrizione"/>
  <field labelOnTop="0" name="eta"/>
  <field labelOnTop="0" name="fid"/>
  <field labelOnTop="0" name="id"/>
  <field labelOnTop="0" name="is_deleted"/>
  <field labelOnTop="0" name="legenda_colore_hex"/>
  <field labelOnTop="0" name="nome_unita"/>
  <field labelOnTop="0" name="note"/>
  <field labelOnTop="0" name="part"/>
  <field labelOnTop="0" name="sigla"/>
  <field labelOnTop="0" name="stratif"/>
  <field labelOnTop="0" name="updated_at"/>
  <field labelOnTop="0" name="updated_by"/>
  <field labelOnTop="0" name="verbania_sigle_codice_carg"/>
  <field labelOnTop="0" name="verbania_sigle_id"/>
  <field labelOnTop="0" name="verbania_sigle_nome"/>
  <field labelOnTop="0" name="verbania_sigle_sigla"/>
  <field labelOnTop="0" name="visibilita"/>
 </labelOnTop>
 <reuseLastValue>
  <field reuseLastValue="0" name="assetto"/>
  <field reuseLastValue="0" name="caratter"/>
  <field reuseLastValue="0" name="codice_carg"/>
  <field reuseLastValue="0" name="created_at"/>
  <field reuseLastValue="0" name="created_by"/>
  <field reuseLastValue="0" name="data_ora"/>
  <field reuseLastValue="0" name="descrizione"/>
  <field reuseLastValue="0" name="eta"/>
  <field reuseLastValue="0" name="fid"/>
  <field reuseLastValue="0" name="id"/>
  <field reuseLastValue="0" name="is_deleted"/>
  <field reuseLastValue="0" name="nome_unita"/>
  <field reuseLastValue="0" name="note"/>
  <field reuseLastValue="0" name="part"/>
  <field reuseLastValue="0" name="sigla"/>
  <field reuseLastValue="0" name="stratif"/>
  <field reuseLastValue="0" name="updated_at"/>
  <field reuseLastValue="0" name="updated_by"/>
  <field reuseLastValue="0" name="verbania_sigle_codice_carg"/>
  <field reuseLastValue="0" name="verbania_sigle_sigla"/>
  <field reuseLastValue="0" name="visibilita"/>
 </reuseLastValue>
 <dataDefinedFieldProperties/>
 <widgets/>
 <previewExpression>COALESCE( "descrizione", '&lt;NULL>' )</previewExpression>
 <mapTip enabled="1"></mapTip>
 <layerGeometryType>2</layerGeometryType>
</qgis>
$qml$::xml,
     $sld$<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" version="1.1.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:se="http://www.opengis.net/se" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
 <NamedLayer>
  <se:Name>vw_affiorante_join</se:Name>
  <UserStyle>
   <se:Name>vw_affiorante_join</se:Name>
   <se:FeatureTypeStyle>
    <se:Rule>
     <se:Name></se:Name>
     <se:Description>
      <se:Title>"codice_carg" is ''</se:Title>
     </se:Description>
     <se:ElseFilter xmlns:se="http://www.opengis.net/se"/>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8bff00</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#ff00f2</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Morfologia</se:Name>
     <se:Description>
      <se:Title>Morfologia</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>012130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f5fafa</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>310</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>8</se:DisplacementX>
          <se:DisplacementY>5</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>340</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>6</se:DisplacementX>
          <se:DisplacementY>5</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>190</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>7</se:DisplacementX>
          <se:DisplacementY>7</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>230</ogc:Literal>
         </se:Rotation>
         <se:Displacement>
          <se:DisplacementX>7</se:DisplacementX>
          <se:DisplacementY>7</se:DisplacementY>
         </se:Displacement>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>rectangle</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#0082ca</se:SvgParameter>
          </se:Fill>
          <se:Stroke/>
         </se:Mark>
         <se:Size>5</se:Size>
         <se:Rotation>
          <ogc:Literal>35</ogc:Literal>
         </se:Rotation>
         <se:VendorOption name="widthHeightFactor">15</se:VendorOption>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">8.25 9.25</se:VendorOption>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Frana</se:Name>
     <se:Description>
      <se:Title>Frana</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>032140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <!--Parametric SVG-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=?fill=%23f5333f&amp;fill-opacity=1&amp;outline=%230082ca&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Plain SVG fallback, no parameters-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Well known marker fallback-->
         <se:Mark>
          <se:WellKnownName>square</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">5.04 5.04</se:VendorOption>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <!--Parametric SVG-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=?fill=%23f5333f&amp;fill-opacity=1&amp;outline=%230082ca&amp;outline-opacity=1&amp;outline-width=0" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Plain SVG fallback, no parameters-->
         <se:ExternalGraphic>
          <se:OnlineResource xlink:href="base64:PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAyNi4wLjEsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGl2ZWxsb18xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCINCgkgdmlld0JveD0iMCAwIDIuNiAyLjMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDIuNiAyLjM7IiB4bWw6c3BhY2U9InByZXNlcnZlIj4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+DQoJLnN0MHtmaWxsOiNGNTMzM0Y7fQ0KPC9zdHlsZT4NCjxwb2x5bGluZSBjbGFzcz0ic3QwIiBwb2ludHM9IjAuMywwLjEgMS4zLDEuOCAyLjMsMC4xIDIuNiwwLjEgMS4zLDIuMyAwLDAuMSAwLjMsMC4xICIvPg0KPC9zdmc+DQo=" xlink:type="simple"/>
          <se:Format>image/svg+xml</se:Format>
         </se:ExternalGraphic>
         <!--Well known marker fallback-->
         <se:Mark>
          <se:WellKnownName>square</se:WellKnownName>
          <se:Fill>
           <se:SvgParameter name="fill">#f5333f</se:SvgParameter>
          </se:Fill>
          <se:Stroke>
           <se:SvgParameter name="stroke">#0082ca</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>3</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
      <se:VendorOption name="graphic-margin">5.04 5.04</se:VendorOption>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dubbio-altro</se:Name>
     <se:Description>
      <se:Title>Dubbio-altro</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>093537</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#fff5e3</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>horline</se:WellKnownName>
          <se:Stroke>
           <se:SvgParameter name="stroke">#f6323e</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
         <se:Rotation>
          <ogc:Literal>135</ogc:Literal>
         </se:Rotation>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Flysch del Varesotto</se:Name>
     <se:Description>
      <se:Title>Flysch del Varesotto</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>212140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#f6cb5e</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Scaglia Rossa</se:Name>
     <se:Description>
      <se:Title>Scaglia Rossa</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>372120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dbe2bc</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Sass de la Luna</se:Name>
     <se:Description>
      <se:Title>Sass de la Luna</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>382130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c8dd9a</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Maiolica</se:Name>
     <se:Description>
      <se:Title>Maiolica</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>392120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dbead1</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Radiolariti del Selcifero Lombardo</se:Name>
     <se:Description>
      <se:Title>Radiolariti del Selcifero Lombardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>402130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#a8cb94</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Gruppo del Selcifero Lombardo</se:Name>
     <se:Description>
      <se:Title>Gruppo del Selcifero Lombardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>402150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#319c31</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Val Maggiore</se:Name>
     <se:Description>
      <se:Title>Formazione di Val Maggiore</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>442120</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e4f3f8</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Domaro</se:Name>
     <se:Description>
      <se:Title>Calcare di Domaro</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>452130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#b7dfea</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Moltrasio</se:Name>
     <se:Description>
      <se:Title>Calcare di Moltrasio</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>472150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#009dcc</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Alpe Perino</se:Name>
     <se:Description>
      <se:Title>Calcare di Alpe Perino</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>482130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#8ab2df</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione dell'Albenza</se:Name>
     <se:Description>
      <se:Title>Formazione dell'Albenza</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>482140</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#4a95d1</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Calcare di Zu</se:Name>
     <se:Description>
      <se:Title>Calcare di Zu</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>502130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#ebd8eb</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dolomia Principale</se:Name>
     <se:Description>
      <se:Title>Dolomia Principale</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>502150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dab0d3</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Marna del Pizzella</se:Name>
     <se:Description>
      <se:Title>Marna del Pizzella</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>522150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#dd5c9d</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Cunardo</se:Name>
     <se:Description>
      <se:Title>Formazione di Cunardo</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>532130</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#c89cc8</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Dolomia di San Salvatore</se:Name>
     <se:Description>
      <se:Title>Dolomia di San Salvatore</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>532150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#9b338a</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.99</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Formazione di Bellano</se:Name>
     <se:Description>
      <se:Title>Formazione di Bellano</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>542150</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#aa98c9</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:Name>Livelli-particolari</se:Name>
     <se:Description>
      <se:Title>Livelli-particolari</se:Title>
     </se:Description>
     <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
      <ogc:PropertyIsEqualTo>
       <ogc:PropertyName>codice_carg</ogc:PropertyName>
       <ogc:Literal>623226</ogc:Literal>
      </ogc:PropertyIsEqualTo>
     </ogc:Filter>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:SvgParameter name="fill">#e5e5d6</se:SvgParameter>
      </se:Fill>
      <se:Stroke>
       <se:SvgParameter name="stroke">#232323</se:SvgParameter>
       <se:SvgParameter name="stroke-width">1</se:SvgParameter>
       <se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
      </se:Stroke>
     </se:PolygonSymbolizer>
     <se:PolygonSymbolizer>
      <se:Fill>
       <se:GraphicFill>
        <se:Graphic>
         <se:Mark>
          <se:WellKnownName>horline</se:WellKnownName>
          <se:Stroke>
           <se:SvgParameter name="stroke">#a75928</se:SvgParameter>
           <se:SvgParameter name="stroke-width">0.5</se:SvgParameter>
          </se:Stroke>
         </se:Mark>
         <se:Size>4</se:Size>
        </se:Graphic>
       </se:GraphicFill>
      </se:Fill>
     </se:PolygonSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:MaxScaleDenominator>5000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>descrizione</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">Open Sans</se:SvgParameter>
       <se:SvgParameter name="font-size">13</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Halo>
       <se:Radius>2</se:Radius>
       <se:Fill>
        <se:SvgParameter name="fill">#fafafa</se:SvgParameter>
       </se:Fill>
      </se:Halo>
      <se:Fill>
       <se:SvgParameter name="fill">#323232</se:SvgParameter>
      </se:Fill>
      <se:VendorOption name="maxDisplacement">1</se:VendorOption>
     </se:TextSymbolizer>
    </se:Rule>
    <se:Rule>
     <se:MaxScaleDenominator>10000</se:MaxScaleDenominator>
     <se:TextSymbolizer>
      <se:Label>
       <ogc:PropertyName>sigla</ogc:PropertyName>
      </se:Label>
      <se:Font>
       <se:SvgParameter name="font-family">MS Shell Dlg 2</se:SvgParameter>
       <se:SvgParameter name="font-size">9</se:SvgParameter>
       <se:SvgParameter name="font-weight">bold</se:SvgParameter>
      </se:Font>
      <se:LabelPlacement>
       <se:PointPlacement>
        <se:AnchorPoint>
         <se:AnchorPointX>0</se:AnchorPointX>
         <se:AnchorPointY>0.5</se:AnchorPointY>
        </se:AnchorPoint>
       </se:PointPlacement>
      </se:LabelPlacement>
      <se:Fill>
       <se:SvgParameter name="fill">#323232</se:SvgParameter>
       <se:SvgParameter name="fill-opacity">0.8</se:SvgParameter>
      </se:Fill>
      <se:VendorOption name="maxDisplacement">1</se:VendorOption>
     </se:TextSymbolizer>
    </se:Rule>
   </se:FeatureTypeStyle>
  </UserStyle>
 </NamedLayer>
</StyledLayerDescriptor>
$sld$::xml,
     true, $d$gio giu 18 16:06:44 2026$d$, 'postgres', 'Polygon');

