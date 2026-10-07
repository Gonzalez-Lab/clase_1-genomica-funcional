# Clase 1 — De los datos crudos al dato analizable

## Descifrando el código epigenético: Genómica funcional y análisis bioinformático de datos ómicos

**Curso de Posgrado — ITBA, 2026**  
**Docente:** Dra. Betina González

---

## Objetivo de la clase

En esta primera clase vamos a introducir los conceptos fundamentales necesarios para trabajar con datos ómicos y comenzar el análisis bioinformático de datos de secuenciación masiva.

El objetivo no es solamente aprender a ejecutar herramientas, sino comprender:

- qué representa cada tipo de dato,
- qué hace cada algoritmo,
- qué parámetros estamos utilizando,
- cómo evaluar la calidad de los resultados,
- y cómo construir un análisis reproducible.

A lo largo del curso vamos a trabajar principalmente en dos entornos complementarios:

**Galaxy** → procesamiento bioinformático de datos de secuenciación.  
**R / Bioconductor** → análisis estadístico, integración, visualización e interpretación biológica.

---

## Contenidos

### 1. Introducción a los datos ómicos

- Datos ómicos y alta dimensionalidad
- Estrategias dirigidas vs. abordajes ómicos
- Microarrays vs. Next-Generation Sequencing (NGS)
- Principios de secuenciación Illumina
- Single-end y paired-end
- Profundidad y cobertura

### 2. Datos crudos de secuenciación

- Formato FASTQ
- Estructura de un read
- Phred scores
- FASTQ vs. IDAT

### 3. Control de calidad

- FastQC
- MultiQC
- Calidad por base
- Contenido de GC
- Duplicación
- Adaptadores
- Secuencias sobrerrepresentadas

Un punto central de la clase será aprender que un **WARN o FAIL no implica automáticamente que una muestra sea de mala calidad**. Los resultados de QC deben interpretarse en el contexto del experimento.

### 4. Trimming

Analizaremos cuándo es necesario realizar trimming y cuándo no.

La estrategia será:

**QC → evaluar → decidir → procesar si es necesario → volver a evaluar**

El trimming no se aplicará automáticamente como parte del pipeline.

### 5. Alineamiento al genoma

Introducción a:

- genoma de referencia,
- anotación genómica,
- índices,
- alineamiento de reads,
- reads uniquely mapped,
- multimapping,
- reads unmapped,
- alineamiento splice-aware para RNA-seq.

También trabajaremos con los formatos:

**SAM / BAM / BED**

y con herramientas de visualización genómica como UCSC Genome Browser e IGV.

---

# Herramientas de trabajo

## Galaxy

Galaxy es una plataforma web que permite ejecutar herramientas bioinformáticas mediante una interfaz gráfica y conservar los datos, parámetros y resultados de cada análisis.

Durante la clase utilizaremos Galaxy para construir un pipeline de procesamiento de datos de RNA-seq.

Flujo general:

FASTQ  
↓  
FastQC  
↓  
MultiQC  
↓  
STAR  
↓  
BAM  
↓  
featureCounts  
↓  
Matriz de counts

Galaxy: https://usegalaxy.org/

---

## R / Bioconductor

R será utilizado para el análisis, visualización e interpretación de los datos.

Bioconductor es un ecosistema de paquetes de R desarrollado específicamente para el análisis de datos biológicos y ómicos.

Sitios oficiales:

- RStudio / Posit: https://posit.co/download/rstudio-desktop/
- Bioconductor: https://bioconductor.org/

---

# Antes de comenzar

Para realizar la parte práctica de la clase es necesario:

1. Tener instalados **R y RStudio**.
2. Tener una cuenta en **Galaxy**.
3. Descargar o clonar este repositorio.
4. Ejecutar previamente el script:

`intalacion librerias.R`

Este script instala los paquetes de R/Bioconductor necesarios para las actividades prácticas.

> La instalación de paquetes se realiza una vez.  
> Durante los análisis los paquetes se cargan utilizando `library()`.

---

# Material disponible en este repositorio

### `intalacion librerias.R`

Instalación de los paquetes de R, Bioconductor y otras dependencias utilizadas durante el curso.

### `operaciones basicas.R`

Introducción breve a algunas operaciones básicas de R que utilizaremos durante las actividades prácticas.

### `tabla.csv`

Archivo simple para practicar importación y manipulación de datos en R.

### `PD transcriptomics.pdf`

paper de los datos transcriptomicos Tranchevent LC, Halder R, Glaab E. Systems level analysis of sex-dependent gene expression changes in Parkinson's disease. NPJ Parkinsons Dis. 2023 Jan 21;9(1):8. doi: 10.1038/s41531-023-00446-8.
---

# Caso de estudio

Durante la clase trabajaremos con datos públicos de **RNA-seq de tejido cerebral humano en enfermedad de Parkinson**.

El objetivo será recorrer el procesamiento desde los datos de secuenciación hasta obtener una matriz de expresión génica que pueda utilizarse posteriormente para análisis estadístico.

Esta matriz será el punto de partida para la siguiente etapa del curso.

---

# Filosofía de trabajo

Durante el curso no vamos a considerar un pipeline como una secuencia automática de programas.

En cada etapa nos preguntaremos:

**¿Qué dato tengo?**  
↓  
**¿Qué quiero obtener?**  
↓  
**¿Qué algoritmo estoy utilizando?**  
↓  
**¿Qué parámetros elegí?**  
↓  
**¿El resultado es técnicamente razonable?**  
↓  
**¿Puedo continuar con el siguiente paso?**

> Ejecutar una herramienta no significa que el análisis haya funcionado.

Los outputs, métricas de QC y logs forman parte del resultado y deben ser evaluados antes de continuar.

---

# Reproducibilidad

Durante las actividades prácticas vamos a registrar:

- datos de entrada,
- herramientas utilizadas,
- versiones,
- parámetros,
- archivos de salida,
- métricas de control de calidad,
- scripts de análisis.

En Galaxy utilizaremos el **History** como registro computacional del análisis y aprenderemos a distinguir entre un **History** y un **Workflow**.

En R trabajaremos con scripts para que los análisis puedan ser ejecutados nuevamente y modificados de manera reproducible.

---

## Curso

**Descifrando el código epigenético: Genómica funcional y análisis bioinformático de datos ómicos**

Instituto Tecnológico de Buenos Aires — ITBA  
2026

**Dra. Betina González**
