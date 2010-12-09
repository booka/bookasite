
user = User.create!(:name => 'Dani', :roles => 'admin')
user.authorizations.create(:provider => 'google', :user_id => user.id,
  :uid => 'https://www.google.com/accounts/o8/id?id=AItOawlrwMxteT9a8OBeUd-LZU7axsnoszCc6ig')

ccc = Project.create!(:title => 'Camiones, contenedores, colectivos')
call_body = <<-eos
<h2>Título: Camiones, Contenedores, Colectivos.</h2> 
<p><b>ISBN: 978-84-613-6026-0</b></p> 
<p>“Camiones, Contenedores, Colectivos” es el primer libro editado por Vib[ ]k. Está dedicado a una iniciativa de Recetas Urbanas que implica a más de una docena de colectivos en la creación de una red de espacios auto-gestionados por toda la geografía española. Ya no se trata de la experimentación que Santiago Cirugeda comenzó hace catorce años en multitud de situaciones puntuales y aisladas, sino de una acción conjunta y auto-organizada de pequeños grupos de ciudadanos. Personas que unen sus fuerzas y entretejen sus proyectos vitales para configurar lugares e incidir sobre su contexto.</p> 
<p>Abrimos este libro en B()()ka para continuar explorando esta aventura y las preguntas que nos despierta: ¿Es posible producir, usando la arquitectura, dentro del sistema y haciendo uso de él, contextos sociales y económicos que lo confronten? ¿Podría esta confrontación favorecer cambios en las políticas urbanas normalizadas que se están revelando insuficientes u obsoletas? ¿Qué formas tomaría esta empresa si la “lucha”, en el sentido más tradicional, sólo puede ya darse fuera de las esferas de confort y mimo de la sociedad del bienestar? ¿Cómo podrían las prácticas arquitectónicas conectarse a los modos de vida para favorecer formas de subjetividad más poderosas?</p> 

  <h2>COLABORACIONES</h2> 
<p>Las colaboraciones se enmarcarán dentro de una de estas tres categorías:</p> 
<p><b>Categoría 1: Equipo editorial</b><br/> 
Buscamos personas interesadas en formar parte del equipo editor que “reescribirá” este libro. Su reedición contempla un debate abierto sobre la primera edición y sus contenidos, la ampliación y búsqueda de nuevos materiales y su reestructuración en un nuevo libro.</p> 
<p><b>Categoría 2: Colaboradores</b><br/> 
La labor de los colaboradores será la de participar en el debate abierto sobre la primera edición y/o ampliar alguno de estos tres bloques de contenido: 1/Proyectos, 2/Glosario, 3/Cartografías.</p> 
<p><b>Categoría 3: Contribuciones</b><br/> 
Se solicitan artículos relacionados directamente con el proyecto Camiones, Contenedores, Colectivos, o bien con algunas de las cuestiones exploradas o planteadas por este libro. Los manuscritos tendrán un mínimo de 1.500 palabras y un máximo de 5000 (incluyendo notas), y los gráficos o media que apoyen el texto. Junto al texto se remitirá un cv del autor.</p> 
 
  <h2>CALENDARIO:</h2> 
<p>Recepción de solicitudes 1ª Convocatoria:</p> 
<ul> 
<li>Categorías 1: Hasta el 15 de Octubre de 2010</li> 
<li>Formación del equipo editorial: 30 de Octubre de 2010</li> 
<li>Categorías 2 y 3: Hasta el 15 de Diciembre de 2010</li> 
</ul> 
  
  <h2>PERMISOS Y RECONOCIMIENTO</h2> 
<p>Para incorporar trabajos en b()()ka  los autores rellenan un formulario que incluye un acuerdo de publicación bajo licencia Creative Commons Atribución-No Comercial-No Derivado 3.0. Al enviar su trabajo, los autores aceptan esta licencia y dan fe de que dicho trabajo no vulnera, en todo o en parte, la propiedad o derechos de autor de cualquier obra protegida existente, según la definición de Entendimiento Derechos de Autor. Vib[ ]k contactará a los autores de materiales seleccionados para publicaciones impresas para firmar un acuerdo de publicación. Asimismo acreditará mediante certificado las colaboraciones y contribuciones publicadas previa solicitud de los autores.</p> 
<p>B()()ka es una plataforma desarrollada por Vib[]k en colaboración con c a l c.</p> 
<p>Para más detalles e información visita  Vib[ ]k: <a href="http://www.edicionesvibok.net/dialog" rel="nofollow" target="_blank">http://www.edicionesvibok.net/dialog</a></p> 
eos
ccc.calls.create!(:title => 'Camiones, contenedores, colectivos', :user => user, :project => ccc,
  :description => 'Libro abierto 001',
  :body => call_body, :content_type => 'text/html')


home = <<-eos
<p>VIB[]K / B()()KA explora un modelo de edición en relación con la transformación que ha sufrido la industria editorial en las dos últimas décadas. </p>
<p>Nuestro punto de partida es que el libro sea no sólo un soporte para transmitir conocimiento, sino una herramienta para producir conocimiento y generar riqueza colectiva.</p>
<p>¿Cómo podría un libro convertirse en una plataforma de investigación, conexión y cooperación? ¿Cómo podría la edición de libros orientar un proceso de construcción colectiva del conocimiento? Desde este enfoque, pensamos que se hace necesario repensar además de los formatos de distribución (licencias creative commomns, otras formas de gestión de los derechos de autor), los formatos de creación y presentación de sus contenidos</p>
<br/>
<h2>Ayudas y patrocinadores</h2>
<img alt="ministerio" src="/images/ministerio_color.gif" />
<img alt="Unia" src="/images/unia.jpg" /> 
eos
Page.create(:title => 'Bienvenido a plataformabooka.net', :slug => '/', :body => home)