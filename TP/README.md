![Logo UPC](images/logoUPC.png)

# UNIVERSIDAD PERUANA DE CIENCIAS APLICADAS

***Ingeniería de Software | Ingeniería de Sistemas de información | Ciencias de la computación***

**Curso:** Diseño de Base de Datos  
**NRC:** 388  
**Ciclo:** 4  
**Docente:** Rafael Oswaldo Castro Veramendi

![Logo PetCare](images/logoPetCare.png)  

### **Informe de trabajo: TB1**

***Relación de integrantes:***

| INTEGRANTES | CÓDIGO |
| :---: | :---: |
| Mitma Ayala, Cielo Anahí | U202420007 |
| Quispe Flores, Judith Xiomara | U202424896 |
| Riveros Vera, Jennifer Yamilet | U20241C998 |
| Tintayo Pujaico, Adriano Martín | U20241C201 |
| Vergaray Calderon, Rose Almendra | U20241D159 |

Febrero, 2026

<div style="page-break-after: always"></div>

## REGISTRO DE VERSIONES DEL INFORME

| Versión | Fecha | Autor | Descripción de modificación |
| :---: | :---: | :---: | :---: |
| TB1 | 26/01/26 | - Mitma Ayala, Cielo Anahí<br>- Quispe Flores, Judith Xiomara<br>- Riveros Vera, Jennifer Yamilet<br>- Tintayo Pujaico, Adriano Martín<br>- Vergaray Calderon, Rose Almendra | CAPÍTULO I: Introducción<br>1.1 Startup Profile<br>1.1.1 Descripción del startup<br>1.1.2 Perfiles de integrantes del equipo<br>1.2 Solution Profile<br>1.2.1 Antecedentes y Problemática<br>1.2.2 Propuesta de Valor<br>1.3 Segmento Objetivo<br><br>CAPÍTULO II: Requeriments<br>2.1 Entrevistas<br>2.1.1 Diseño de entrevistas<br>2.1.2 Registro de entrevistas<br>2.1.3 Análisis de entrevistas<br>2.2 Requisitos |
| TP | |  Mitma Ayala, Cielo Anahí<br>- Quispe Flores, Judith Xiomara<br>- Riveros Vera, Jennifer Yamilet<br>- Tintayo Pujaico, Adriano Martín<br>- Vergaray Calderon, Rose Almendra | CAPÍTULO III: Diseño de base de datos<br>3.1 Entidades<br>3.2 Atributos<br>3.3 Enfoque relacional<br>3.3.1 Diagrama entidad-relación lógico<br>CAPÍTULO IV: Implementación de base de datos<br>4.1 Sistema de gestión de base de datos<br>4.1.1 Evaluación y elección del sistema de gestión de base de datos relacional<br>4.2 Diagramas de datos<br>4.2.1 Diagrama entidad-relación físico |
| TB2 | | | |
| TF | | | |

<div style="page-break-after: always"></div>

## TABLA DE CONTENIDOS

[REGISTRO DE VERSIONES DEL INFORME](#registro-de-versiones-del-informe)

[STUDENT OUTCOME](#student-outcome)

[CAPÍTULO I: INTRODUCCIÓN](#capítulo-i-introducción)

- [1.1 Startup Profile](#11-startup-profile)

  - [1.1.1 Descripción del Startup](#111-descripción-del-startup)

  - [1.1.2 Perfiles de integrantes del equipo](#112-perfiles-de-integrantes-del-equipo)

- [1.2 Solution Profile](#12-solution-profile)

  - [1.2.1  Antecedentes y problemática](#121-antecedentes-y-problemática)

  - [1.2.2 Propuesta de valor](#122-propuesta-de-valor)

- [1.3 Segmentos objetivo](#13-segmentos-objetivo)

[CAPÍTULO II: INTRODUCCIÓN](#capítulo-ii-recopilación-y-análisis-de-requisitos)

- [2.1 Entrevistas](#21-entrevistas)

  - [2.1.1 Diseño de entrevistas](#211-diseño-de-entrevistas)

  - [2.1.2 Registro de entrevistas](#212-registro-de-entrevistas)

  - [2.1.3 Análisis de entrevistas](#213-análisis-de-entrevistas)

- [2.2 Requisitos](#22-requisitos)

[CAPÍTULO III: DISEÑO DE BASE DE DATOS](#capítulo-iii-diseño-de-base-de-datos)

- [3.1 Entidades](#31-entidades)

- [3.2 Atributos](#32-atributos)

- [3.3 Enfoque relacional](#33-enfoque-relacional)

  - [3.3.1 Diagrama entidad-relación lógico](#331-diagrama-entidad-relación-lógico)

[CAPÍTULO IV: IMPLEMENTACIÓN DE LA BASE DE DATOS](#capítulo-iv-implementación-de-la-base-de-datos)

- [4.1 Sistema de gestión de base de datos](#41-sistema-de-gestión-de-base-de-datos)

  - [4.1.1 Evaluación y elección del sistema de gestión de base de datos relacional](#411-evaluación-y-elección-del-sistema-de-gestión-de-base-de-datos-relacional)

- [4.2 Diagrama de datos](#42-diagrama-de-datos)

  - [4.2.1 Diagrama entidad-relación físico](#421-diagrama-entidad-relación-físico)

[BIBLIOGRAFÍA](#bibliografía)

[ANEXOS](#anexos)

<div style="page-break-after: always"></div>

## STUDENT OUTCOME

| Criterio específico | Acciones realizadas | Conclusiones |
| :--- | :--- | :--- |
| Actualiza conceptos y conocimientos necesarios para su desarrollo profesional y en especial para su proyecto en soluciones de ingeniería de software. | *Mitma Ayala, Cielo Anahí*<br> TB1:<br>Redaccion del Startup.<br>Realización de una entrevista.<br>Elaboración de 3 User Stories.<br> TP:<br> TB2:<br> TF:<br> <br>*Quispe Flores, Judith Xiomara*<br> TB1:<br>Desarrollo de la herramienta de gestión 5W y 2H.<br>Realización de una entrevista.<br>Elaboración de 3 User Stories.<br> TP:<br> TB2:<br> TF:<br> <br>*Riveros Vera, Jennifer Yamilet*<br> TB1:<br>Desarrollo de Lean UX Canvas para evidenciar la propuesta de valor.<br>Realización de una entrevista.<br>Elaboración de 3 User Stories<br> TP:<br> TB2:<br> TF:<br> <br>*Tintayo Pujaico, Adriano Martín*<br> TB1:<br>Descripción de los segmentos objetivos.<br>Realización de una entrevista.<br>Elaboración de 3 User Stories.<br>TP:<br> TB2:<br> TF:<br> <br>*Vergaray Calderon, Rose Almendra*<br> TB1:<br>Elaboración del diseño de entrevistas.<br>Redacción del análisis de entrevistas.<br> TP:<br> TB2:<br> TF:<br> | TB1:<br> - Se identificó el problema mediante entrevistas sobre la desactualización de inventario por ventas y la necesidad de seguimiento preventivo.<br> - Se evidenciaron problemas sobre el manejo de la información en algunas veterinarias, como la gestión eficiente de múltiples mascotas.<br> - Se reconocieron problemas acerca de la eficiencia y precisión en los registros historiales, lo cual perjudica la atención de la clínica. |
| Reconoce la necesidad del aprendizaje permanente para el desempeño profesional y el desarrollo de proyectos en soluciones de soluciones de ingeniería de software. | *Mitma Ayala, Cielo Anahí*<br> TB1:<br>Apliqué lo aprendido en otro curso para el desarrollo de los user stories y en que se basa la descripción de la startup<br> TP:<br> TB2:<br> TF:<br> <br>*Quispe Flores, Judith Xiomara*<br> TB1:<br>Conocimiento adquirido de otros cursos, como el uso de User Stories y la herramienta 5W y 2H.<br> TP:<br> TB2:<br> TF:<br> <br>*Riveros Vera, Jennifer Yamilet*<br> TB1:<br>Se hizo revision a la redaccion de las User Stories y saber sus necesidades mediante entrevista.<br>Aplicar feedback y ciclo de mejora mediante los requisitos.<br> TP:<br> TB2:<br> TF:<br> <br>*Tintayo Pujaico, Adriano Martín*<br> TB1:<br>Definición de los tipos de segmentos objetivos para la realización del proyecto.<br>TP:<br> TB2:<br> TF:<br> <br>*Vergaray Calderon, Rose Almendra*<br> TB1:<br>Integración de los hallazgos de entrevistas en análisis.<br> TP:<br> TB2:<br> TF:<br> | TB1:<br>  |

<div style="page-break-after: always"></div>

# CAPÍTULO I: INTRODUCCIÓN

## 1.1 Startup Profile

### 1.1.1 Descripción del Startup

Somos DataSystem, un equipo conformado por estudiantes de la Universidad Peruana de Ciencias Aplicadas (UPC) de la rama de Informática, apasionados por la tecnología y comprometidos con el dominio y la gestión eficiente de grandes volúmenes de datos, con el objetivo de resolver problemas computacionales reales mediante soluciones bien estructuradas. Nuestra misión es desarrollar bases de datos relacionales y no relacionales sólidas, coherentes y confiables, que permitan a las empresas organizar su información de manera clara y segura, mientras que nuestra visión es consolidarnos como una empresa líder en la creación de bases de datos escalables para compañías de gran tamaño y alta demanda en el mercado. Nuestro proyecto principal está enfocado en la veterinaria Pet Care, una empresa de preferencia del público por su organización y calidad de atención, para la cual diseñamos una base de datos que gestiona de forma eficiente el historial clínico de las mascotas, la cartera de clientes, la frecuencia de visitas y consultas, permitiendo identificar clientes frecuentes y aplicar descuentos por fidelización. Gracias a esta solución, veterinarios y asistentes pueden acceder a la información médica de los pacientes de manera ordenada y confiable, evitando datos duplicados, inconsistencias o información sin contexto, lo que reduce el estrés operativo y mejora significativamente la atención médica.

### 1.1.2 Perfiles de integrantes del equipo

| Integrantes | Descripción |
| :--- | :--- |
| ![Cielo](images/fotos/mitma.png) | Mi nombre es Cielo Anahí Mitma Ayala (u202420007), estudiante de Ciencias de la Computación en la UPC. Cuento con certificaciones en Python y ordenamiento de datos, Scrum, además de conocimientos en HTML, CSS y JavaScript básicos, manejo de ordenamiento avanzado de datos, programación en C++ en consola y un nivel de inglés intermedio. Poseo una base sólida en lógica y matemáticas, lo que me permite destacar en la resolución de problemas informáticos. Me caracterizo por mi creatividad en la creación de proyectos tecnológicos y de negocio, cualidades que me permitirán un gran desarrollo frente a los desafíos que se presenten. |
| ![Judith](images/fotos/quispe.png) | Mi nombre es Judith Xiomara Quispe Flores (U202424896), estudiante de Ingeniería de Sistemas de Información en la UPC. Como futura profesional, cuento con una base sólida en pensamiento lógico, análisis matemático y fundamentos de programación, complementada con habilidades de comunicación y trabajo en equipo. Mi formación abarca también el manejo de datos y la gestión de proyectos tecnológicos, siempre orientados a optimizar procesos y apoyar la toma de decisiones. Me caracterizo por mi capacidad de adaptación, creatividad para resolver problemas y un compromiso ético en la búsqueda de soluciones innovadoras. |
| ![Jennifer](images/fotos/riveros.png) | Mi nombre es Jennifer Yamilet Riveros Vera (u20241c998). Estoy cursando la carrera de Ingeniería de Software en la UPC con interés en ser una futura desarrolladora backend. Estoy certificada en la Universidad de California San Diego, desarrollando fundamentos en Java, y también tengo conocimientos en inglés intermedio y en Excel, lo que me permite tener una perspectiva integral y preparada para los próximos proyectos que vengan. |
| ![Adriano](images/fotos/tintayo.png) | Mi nombre es Adriano Martín Isaías Tintayo Pujaico (u20241c201). Soy estudiante de la carrera de Ingeniería de Sistemas de Información en la Universidad Peruana de Ciencias Aplicadas (UPC). Cuento con conocimientos básicos en C++ y Python. Como estudiante universitario poseo la capacidad de resolución de problemas, pensamiento crítico y orientación a resultados, además de una rápida adaptación a nuevas tecnologías. |
| ![Rose](images/fotos/vergaray.png) | Mi nombre es Rose Almendra Vergaray Calderon (u20241d159). Soy estudiante de la carrera de Ingeniería de Software en la Universidad Peruana de Ciencias Aplicadas (UPC). Cuento con conocimientos básicos en Python, HTML, Java, y programación en C++ nivel intermedio, lo que me ha ayudado a desarrollar un enfoque orientado a la innovación y a la optimización de procesos mediante el uso de nuevas tecnologías. Me motiva estar en constante aprendizaje, explorar nuevas herramientas y enfrentar proyectos que pongan a prueba mis habilidades. |

## 1.2 Solution Profile

### 1.2.1 Antecedentes y problemática

- ***¿Cuál es el problema? / ¿Qué?***  
La gestión de información en la veterinaria Pet Care es desorganizada y dispersa, lo que provoca repetición de datos, falta de coherencia en los registros médicos de los animales y complicaciones para acceder a la información relevante de forma inmediata. Esto afecta tanto a la atención como a la administración de clientes y promociones. Además, no hay sistema que facilite la identificación y recompensa a los clientes más frecuentes, lo que limita la posibilidad de fomentar la lealtad y personalizar el servicio.

- ***¿Cuándo y cuánto?***  
Este es un inconveniente habitual que se evidencia diariamente durante la atención de mascotas, sobre todo en horas de mayor actividad. La falta de un sistema centralizado ocasiona un desperdicio de tiempo en búsqueda y validación de datos, así como el riesgo de tomar decisiones clínicas basadas en datos que no están completos o desactualizados. Desde un punto de vista operativo, se estima que el personal invierte hasta un tercio de su tiempo en tareas administrativas repetitivas en vez de centrarse en la atención médica.

- ***¿Dónde?***  
La problemática se presenta especialmente en la veterinaria Pet Care, tanto en su sede física como en los registros digitales que emplean actualmente, como hojas de cálculo, documentos no relacionados y documentación impresa.

- ***¿Quiénes?***
Afecta de manera directa al personal de la veterinaria: veterinarios, asistentes y personal administrativo, quienes deben lidiar con la desorganización de la información. También impacta en los clientes, quienes pueden sufrir retrasos en su atención, falta de seguimiento en el historial de sus mascotas y pérdida de oportunidades de descuentos o beneficios por lealtad.

- ***¿Por qué y cómo?***  
Esto se debe a la falta de un sistema integrado de base de datos que unifique y conecte los datos de mascotas, dueños, citas, tratamientos y promociones. Actualmente, la información se gestiona en formatos aislados y no estructurados, lo que dificulta su consulta, modificación y análisis. Como resultado, se producen fallos en las operaciones, se limita la capacidad de tomar decisiones basadas en datos y se reduce la calidad del servicio al cliente y la mascota.

### 1.2.2 Propuesta de valor

A continuación, presentaremos un Lean UX Canvas para la realización de esta sección.

![Lean UX Canvas](images/LeanUXCanvas.png)

El Lean UX Canvas de DataSystem para Pet Care resume que el problema principal es la falta de centralización y consistencia en el historial clínico de las mascotas y los datos de sus dueños, lo que genera registros duplicados o incompletos y dificulta que el veterinario acceda rápido a información con contexto durante una consulta. Como usuarios se consideran únicamente el veterinario (quien registra y consulta la información médica) y el dueño de la mascota (beneficiario de una atención más ágil y confiable). Los resultados esperados del negocio son mejorar la continuidad y calidad de la atención, reducir errores de registro y habilitar fidelización mediante la identificación de dueños frecuentes y descuentos. La solución propuesta consiste en diseñar una base de datos híbrida (relacional para datos estructurados como dueños, mascotas, consultas y vacunas; y NoSQL para notas clínicas flexibles).

## 1.3 Segmentos objetivo

PetCare se orienta a dos segmentos relacionados con dominio del problema: Dueños de Clínica Veterinaria y Dueños de Mascotas. Ambos segmentos consumen grandes cantidades de información clínica y administrativa, lo que evidencia la necesidad de una base de datos estructurada.

***Dueño de Clínica Veterinaria:***  

Este segmento está conformado por dueños y administradores de clínicas veterinarias localizadas en Lima Metropolitana, mayoritariamente ubicado en distritos con alta densidad poblacional y alta demanda de servicios veterinarios.

Según un artículo especializado, aproximadamente el 60% de MyPEs peruanas aún depende de procesos manuales y poco eficientes, lo cual limita su crecimiento y competitividad en un entorno cada vez más digitalizado (Gadgerss, 2025). Esta situación muestra las brechas tecnológicas que existen entre las clínicas veterinarias que aún no se han adaptado a sistemas integrados de información, lo cual requiere la implementación de una base de datos estructurada.

***Dueños de Mascotas:***

Este segmento está conformado por personas residentes en Lima Metropolitana que poseen mascotas, mayormente perros y gatos, y que asisten a clínicas veterinarias para controles o tratamientos médicos.

Según un estudio de Kantar, casi el 50% de hogares peruanos cuenta con al menos una mascota, siendo Lima Metropolitana una de las zonas con mayor concentración de animales de compañía (Kantar, 2019). Este nivel de tenencia de mascotas genera una demanda continua de servicios veterinarios y, por tanto, la necesidad de gestionar grandes volúmenes de información clínica de manera estructurada.

<div style="page-break-after: always"></div>

# CAPÍTULO II: RECOPILACIÓN Y ANÁLISIS DE REQUISITOS

## 2.1 Entrevistas

### 2.1.1 Diseño de entrevistas

***Para los arquetipos:***

1. ¿Cuál es tu nombre completo?  
2. ¿Cuál es tu edad?  
3. ¿Cuál es tu ocupación?  
4. ¿Distrito en donde reside?  
5. ¿Cuál es tu nivel socioeconómico (Alto, medio-alto, bajo)?  

***Para los arquetipos (Dueños de veterinarias):***

1. ¿Cuántos años lleva operando su veterinaria?  
2. ¿Podría describir cómo registran actualmente la información de las mascotas y de sus dueños en su veterinaria?  
3. ¿Cada mascota tiene su propio historial clínico? ¿Cómo se identifica o diferencia cada historial?  
4. ¿Qué tipo de información considera indispensable tener disponible y organizada durante una consulta veterinaria?  
5. ¿Ha tenido problemas relacionados con registros duplicados, incompletos o desactualizados? ¿Podría contar algún caso?  
6. Desde su experiencia, ¿qué tipo de errores considera más frecuentes en el registro de información clínica de las mascotas?  
7. Si existiera una herramienta tecnológica que centralice y estructure esta información, ¿cree que mejoraría la continuidad y calidad de la atención? ¿por qué?  

***Para los arquetipos (Dueños de mascotas):***

1. ¿Con qué frecuencia lleva a su mascota a la veterinaria y por qué motivos principalmente?  
2. ¿Generalmente acude a la misma veterinaria para la atención de su mascota o ha tenido que acudir a otra en alguna ocasión? ¿Cuáles fueron los motivos del cambio?  
3. ¿Alguna vez le han pedido repetir información sobre su mascota en una consulta? ¿En qué situación ocurrió?  
4. ¿Qué tan importante es para usted que el veterinario tenga acceso rápido al historial clínico de su mascota durante la consulta?  
5. ¿Ha tenido más de una mascota atendida en la misma veterinaria? Si así fue, ¿cómo fue esa experiencia respecto a la organización de la información de sus mascotas?  
6. ¿Qué tipo de información le gustaría consultar directamente desde una plataforma o aplicación sobre la atención de su mascota?  
7. ¿Cree que una mejor organización de la información clínica mejora la atención que recibe su mascota? ¿Por qué?  

### 2.1.2 Registro de entrevistas

| Segmento #1 | Entrevista #1 |
| --- | --- |
| Nombre completo | Marisol Sequeiros |
| Edad | 47 |
| Distrito | Villa El Salvador |
| Ocupación | Médico Veterinario |
| Inicio y duración | 00:00 - 10:05 |
| Enlace | [Entrevista#1](https://upcedupe-my.sharepoint.com/:v:/g/personal/u20241c201_upc_edu_pe/IQC6IzB_vTO6SrUgnXXmLQ4HAeTPB1Yi0RFPsskqM_6gEDM?e=EAjD1d) |
| Resumen | Dra. Marisol nos comenta que principalmente utiliza registros físicos y algunos archivos Excel, los seguimientos de los historiales se hacen manualmente lo cual no es preciso ni eficiente, además contando con problemas tales como: duplicidad de registros de una misma mascota, datos incompletos e información desactualizada. |
| Foto | ![Entrevista1](images/entrevista1.png) |

| Segmento #1 | Entrevista #2 |
| --- | --- |
| Nombre completo | Irwin Flores |
| Edad | 35 |
| Distrito | Cedros de Villa |
| Ocupación | Médico Veterinario |
| Inicio y duración | 00:00 - 2:00 |
| Enlace | [Entrevista#2](https://upcedupe-my.sharepoint.com/:v:/g/personal/u20241c998_upc_edu_pe/IQBSltkhD0s3QKuu9i94arxaAdYkz2QASR5Beub957yt0Ck?e=Q8B2fl) |
| Resumen | Dr. Irwin utiliza un sistema Vetpraxis, menciona que tiene un problema de inventario por que a veces llevar la cuenta exacta porque a veces se desactualiza en el sistema, porque a veces lo venden por varias cantidades de pastillas. |
| Foto | ![Entrevista2](images/entrevista2.png)  |

| Segmento #2 | Entrevista #3 |
| --- | --- |
| Nombre completo | Diego Alhuay Espino |
| Edad | 19 |
| Distrito | Surco |
| Ocupación | Estudiante universitario de la carrera de Ingeniería de Sistemas |
| Inicio y duración | 00:00 - 10:02 |
| Enlace | [Entrevista#3](https://youtu.be/IFqXw6di1-M?si=rLDN6Omv5FypVZ13) |
| Resumen | Diego es estudiante universitario y dueño de un perro de 3 años. Lleva a su mascota al veterinario cada dos meses para baños y control de vacunas y salud. No ha cambiado de veterinaria con su mascota actual, aunque sí lo hizo antes por motivos de distancia. Señala que, en general, el historial clínico de su mascota está registrado, pero en una ocasión le repitieron una pregunta sobre una vacuna ya aplicada, lo que le generó incomodidad y fastidio. Considera muy importante contar con un registro ordenado y completo del historial clínico. Le gustaría poder consultar los chequeos y vacunas pendientes mediante una página web o recibir recordatorios por parte de la veterinaria. |
| Foto | ![Entrevista3](images/entrevista3.png)  |

| Segmento #2 | Entrevista #4 |
| --- | --- |
| Nombre completo | Katia Quispe |
| Edad | 22 |
| Distrito | Villa María del Triunfo |
| Ocupación | Estudiante de Psicología |
| Inicio y duración | 00:00 - 4:12 |
| Enlace | [Entrevista#4](https://upcedupe-my.sharepoint.com/:v:/g/personal/u20211d455_upc_edu_pe/IQBifPq69VPpQbeH7F0fSJB2AWNYwCTIaq5_O-xnoljN57Y?e=NEAsGa&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D) |
| Resumen | Katia nos comenta que lleva a su mascota a la veterinaria entre 2 a 4 veces al año para controles, vacunas y emergencias. Cambio de clínica por horarios, urgencias o porque la habitual estaba cerrada, y en esos casos siempre tenía que repetir la información de su mascota, algo que se complica cuando lleva a más de una y puede generar confusión o errores. Por eso, considera fundamental tener la historia clínica bien organizada y accesible, ya que ahorra tiempo, da tranquilidad y mejora la atención. Le gustaría poder consultar en línea diagnósticos, vacunas y tratamientos, y recibir recordatorios de próximas citas. |
| Foto | ![Entrevista4](images/entrevista4.png)  |

### 2.1.3 Análisis de entrevistas

#### Segmento #1 (Dueño de clínica veterinaria)

***Características objetivas del segmento***

El 100% de los entrevistados indicó que cada mascota cuenta con un historial clínico propio, asociado tanto a los datos del propietario como a los datos de la mascota.

Respecto a la forma de registro de información:  

- El 50% utiliza principalmente registros físicos y Excel, con manejo manual de la información.  
- El 50% utiliza un sistema digital (Vetpraxis) para organizar datos.

En relación con la información indispensable durante una consulta, el 100% de los entrevistados mencionó la necesidad de contar con: datos del dueño, datos generales de la mascota, historial de vacunas, tratamientos o servicios previos. Además, el 50% resaltó explícitamente la importancia de contar con fechas de desparasitaciones, vacunas y servicios periódicos para realizar recordatorios a los dueños.

Respecto a problemas en la gestión de información, el 100% de los entrevistados reportó problemas en la gestión de datos:  

- Entrevista 1 (50%) — Gestión manual:
  - Duplicidad de información, nombres de mascotas repetidos o parecidos que generan confusión  
  - Datos incompletos  
  - Información desactualizada  
  - Cruce de información entre turnos de médicos  
  - Retrasos de la atención

- Entrevista 2 (50%) — Sistema digital:
  - Desactualización del sistema
  - Problemas de control de inventario (cantidades variables de medicamentos)

***Características subjetivas del segmento***

Desde la experiencia del usuario:

- 50% describe el proceso actual como tedioso y lento.
- 100% considera que una herramienta que centralice la información mejoraría la calidad y continuidad de la atención.

Se evidencia la necesidad de:

- Acceso rápido a historiales clínicos.
- Mejor control de tratamientos.
- Mejor organización entre turnos de trabajo.

#### Segmento #2 (Dueño de mascota)

***Características objetivas del segmento***

El 100% de los entrevistados indicó que lleva a su mascota a controles veterinarios de manera periódica, ya sea por vacunas, chequeos, enfermedades o emergencias.

- El 50% lleva a su mascota aproximadamente cada 2 meses.
- El 50% asiste entre 2 y 4 veces al año.

El 100% indicó que normalmente acude a la misma veterinaria, sin embargo, también mencionaron que han tenido que asistir a otras veterinarias en algún momento por urgencias, distancia o disponibilidad de atención.

Respecto al manejo de la información clínica de su mascota, el 100% indicó que ha tenido que volver a proporcionar datos de su mascota en distintas consultas:

- El 50% reportó pérdida de información por depender de carnets físicos.
- El 50% señaló confusión o mezcla de información cuando se trata de la atención de más de una mascota en la misma veterinaria.

El 100% manifestó interés en poder acceder digitalmente a:

- Datos generales de la mascota
- Historial de vacunas
- Enfermedades previas
- Tratamientos realizados
- Resultados de exámenes
- Fechas de atención
- Próximas citas
- Recordatorios de vacunas o controles

Respecto a problemas relacionados con la gestión de la información, el 100% de los entrevistados ha experimentado:

- Entrevista 1 (50%):
  - Repetición constante de datos
  - Dependencia de registros físicos
  - Riesgo de pérdida del historial
  - Falta de recordatorios

- Entrevista 2 (50%)
  - Información no disponible en otras veterinarias
  - Confusión cuando existen varias mascotas
  - Falta de acceso directo al historial

***Características subjetivas del segmento***

Desde la experiencia del usuario:

- El 100% considera muy importante que el veterinario tenga acceso inmediato al historial clínico.
- El 100% opinan que una plataforma digital facilitaría tener un control sobre la salud de sus mascotas.

## 2.2 Requisitos

A base de las entrevistas a dueños de mascotas y dueños de clínicas veterinarias, se redactó las user stories principales.

| User Story ID | Título | Descripción | Criterios de aceptación |
| --- | --- | --- | --- |
| US01 | | Como dueño de mascota, quiero poder compartir temporalmente el historial clínico de mi mascota con otra persona de confianza, para que pueda atenderla en caso de emergencia cuando yo no esté disponible. |
| US02 | | Como dueño de mascotas, quiero poder descargar o visualizar un resumen digital del estado de salud de mi mascota en la veterinaria atendida, para un control adecuado de información. | |
| US03 | | Como dueño de mascota, quiero poder recibir recomendaciones preventivas personalizadas según la edad y el historial de mi mascota, para anticiparse a posibles problemas de salud. | |
| US04 | | Como dueño de mascota, quiero poder registrar y acceder al historial clínico completo de mis mascotas, para evitar tener que repetir la información en cada consulta y asegurar que el veterinario tenga todos los antecedentes. | |
| US05 | | Como dueño de mascota, quiero recibir notificaciones automáticas como recordatorios para próximas citas, vacunas o controles, para no olvidar los cuidados preventivos y mantener la salud de mi mascota al día. | |
| US06 | | Como dueño de mascota, quiero poder gestionar y visualizar los perfiles e historiales médicos de cada uno de mis mascotas de manera clara y separada en un mismo sistema, para evitar confusiones y garantizar que cada una reciba el tratamiento y seguimiento correcto durante las visitas al veterinario. | |
| US07 | | Como dueño de veterinaria, quiero registrar ventas y consumos de medicamentos por unidades y no solo cajas, para mantener un inventario exacto y evitar desactualizaciones. | |
| US08 | | Como dueño de veterinaria, quiero ver el historial de movimientos de inventario (entradas, salidas, ajustes), para auditar el stock y corregir discrepancias. | |
| US09 | | Como dueño de veterinaria, quiero consultar el historial preventivo de una mascota incluyendo las ultimas y próximas fechas recomendadas, para dar seguimiento sanitario. | |
| US10 | | Como dueño de veterinaria, quiero contar con alertas o recordatorios automáticos sobre las consultas pendientes, para tener un seguimiento efectivo y evitar que la información se pierda. | |
| US11 | | Como dueño de veterinaria, quiero llevar un seguimiento de los tratamientos, controles y vacunas de una manera ordenada, para evitar depender de las revisiones manuales. | |
| US12 | | Como dueño de veterinaria quiero tener organizada la información de los clientes y la frecuencia de las visitas a la clínica, para mejorar la organización de los servicios veterinarios. | |

<div style="page-break-after: always"></div>

# CAPÍTULO III: DISEÑO DE BASE DE DATOS

## 3.1 Entidades

- **Mascota:**

- 

## 3.2 Atributos

## 3.3 Enfoque relacional

### 3.3.1 Diagrama entidad-relación lógico

<div style="page-break-after: always"></div>

# CAPÍTULO IV: IMPLEMENTACIÓN DE LA BASE DE DATOS

## 4.1 Sistema de gestión de base de datos

### 4.1.1 Evaluación y elección del sistema de gestión de base de datos relacional

## 4.2 Diagrama de datos

### 4.2.1 Diagrama entidad-relación físico

<div style="page-break-after: always"></div>

# BIBLIOGRAFÍA

Gadgerss. (2025). Las tres principales brechas tecnológicas que frenan a las MyPEs peruanas. *Gadgerss.* [https://gadgerss.com/2025/05/15/las-tres-principales-brechas-tecnologicas-que-frenan-a-las-mypes-peruanas/](https://gadgerss.com/2025/05/15/las-tres-principales-brechas-tecnologicas-que-frenan-a-las-mypes-peruanas/)

Ballarin, C. (2019). Casi la mitad de hogares peruanos tienen una mascota. *Kantar.* [https://www.kantar.com/latin-america/inspiracion/consumo-masivo/hogares-con-mascotas](https://www.kantar.com/latin-america/inspiracion/consumo-masivo/hogares-con-mascotas)

# ANEXOS


Enlace del repositorio en GitHub: [https://github.com/DataSystem-organization/PetCare-proyecto/tree/main](https://github.com/DataSystem-organization/PetCare-proyecto/tree/main)
