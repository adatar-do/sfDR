# Estado de mantenimiento

sfDR 0.2.2 se conserva como paquete anterior del ecosistema GeoDOM. Su
alcance y sus datos son los que describe esta versión; no representa una
actualización automática de la división territorial vigente.

Para desarrollos nuevos use
[geodomR](https://github.com/GeoDOMProject/geodomR), que descarga las
fuentes públicas, permite elegir capas y ofrece la API `gd_*`. Las
aplicaciones existentes pueden seguir fijando la versión de sfDR. La
transición requiere adaptar explícitamente los nombres de funciones y
validar los códigos territoriales; no se reemplazan silenciosamente las
capas históricas.
