###############################################################################
# INSTALACION DE PAQUETES
# CURSO: DESCIFRANDO EL CODIGO EPIGENETICO
# Genomica funcional y analisis bioinformatico de datos omicos
# ITBA
#
# Ejecutar este script UNA SOLA VEZ antes de comenzar el curso.
#
# IMPORTANTE:
# La instalacion puede tardar varios minutos.
# No cerrar RStudio hasta que finalice.
###############################################################################


# =============================================================================
# 1. PAQUETES DE CRAN
# =============================================================================

# Paquetes generales para:
# - manipulacion de datos
# - visualizacion
# - importacion/exportacion
# - heatmaps
# - PCA
# - single-cell
# - manejo de archivos

cran_packages <- c(
  
  # Instalacion y manejo de paquetes
  "remotes",
  "BiocManager", 
  
  # Manipulacion de datos
  "tidyverse",
  "dplyr",
  "tidyr",
  "tibble",
  "readr",
  "stringr",
  "purrr",
  "forcats",
  
  # Visualizacion
  "ggplot2",
  "ggrepel",
  "pheatmap",
  "RColorBrewer",
  "patchwork",
  "cowplot",
  
  # Importacion / exportacion
  "readxl",
  "openxlsx",
  "data.table",
  
  # Estadistica y utilidades
  "matrixStats",
  "scales",
  
  # Single-cell / single-nucleus RNA-seq
  "Seurat"
)


# Instalar solamente los paquetes que no esten instalados

for (pkg in cran_packages) {
  
  if (!requireNamespace(pkg, quietly = TRUE)) {
    
    message("Instalando paquete CRAN: ", pkg)
    
    install.packages(
      pkg,
      dependencies = TRUE
    )
  }
}


# =============================================================================
# 2. PAQUETE preseqR DESDE GITHUB
# =============================================================================

# preseqR se utiliza como dependencia de algunos analisis de ATAC-seq.

if (!requireNamespace("preseqR", quietly = TRUE)) {
  
  message("Instalando preseqR desde GitHub...")
  
  remotes::install_github(
    "smithlabcode/preseqR"
  )
}


# =============================================================================
# 3. PAQUETES DE BIOCONDUCTOR
# =============================================================================

bioc_packages <- c(
  
  # ---------------------------------------------------------------------------
  # Infraestructura basica de Bioconductor
  # ---------------------------------------------------------------------------
  
  "Biobase",
  "S4Vectors",
  "IRanges",
  "GenomeInfoDb",
  "GenomicRanges",
  "GenomicAlignments",
  "SummarizedExperiment",
  
  # ---------------------------------------------------------------------------
  # Importacion y manejo de datos genomicos
  # ---------------------------------------------------------------------------
  
  "GEOquery",
  "Rsamtools",
  "rtracklayer",
  "Rsubread",
  
  # ---------------------------------------------------------------------------
  # Anotacion genomica
  # ---------------------------------------------------------------------------
  
  "AnnotationDbi",
  "org.Hs.eg.db",
  "TxDb.Hsapiens.UCSC.hg38.knownGene",
  
  # ---------------------------------------------------------------------------
  # RNA-seq y expresion diferencial
  # ---------------------------------------------------------------------------
  
  "DESeq2",
  "edgeR",
  "limma",
  "EnhancedVolcano",
  
  # ---------------------------------------------------------------------------
  # Enriquecimiento funcional
  # ---------------------------------------------------------------------------
  
  "clusterProfiler",
  "enrichplot",
  
  # ---------------------------------------------------------------------------
  # ATAC-seq
  # ---------------------------------------------------------------------------
  
  "ATACseqQC",
  
  # ---------------------------------------------------------------------------
  # ChIP-seq / anotacion de peaks
  # ---------------------------------------------------------------------------
  
  "ChIPseeker",
  
  # ---------------------------------------------------------------------------
  # Heatmaps y visualizacion genomica
  # ---------------------------------------------------------------------------
  
  "pheatmap",
  
  # ---------------------------------------------------------------------------
  # Metilacion - Illumina EPIC / 450K
  # ---------------------------------------------------------------------------
  
  "minfi",
  "IlluminaHumanMethylationEPICanno.ilm10b4.hg19",
  "IlluminaHumanMethylationEPICmanifest",
  
  # ---------------------------------------------------------------------------
  # Hi-C / interacciones genomicas
  # ---------------------------------------------------------------------------
  
  #"InteractionSet",
  
  # ---------------------------------------------------------------------------
  # Single-cell / single-nucleus
  # ---------------------------------------------------------------------------
  
  "SingleCellExperiment",
  "scater",
  "scran"
)


# Instalar solamente los paquetes que no esten instalados

for (pkg in bioc_packages) {
  
  if (!requireNamespace(pkg, quietly = TRUE)) {
    
    message("Instalando paquete Bioconductor: ", pkg)
    
    BiocManager::install(
      pkg,
      ask = FALSE,
      update = FALSE
    )
  }
}


# =============================================================================
# 4. COMPROBAR LA INSTALACION
# =============================================================================

all_packages <- c(
  cran_packages,
  "preseqR",
  bioc_packages
)


installation_check <- sapply(
  all_packages,
  requireNamespace,
  quietly = TRUE
)


# Mostrar resultado

installation_check



# =============================================================================
# 5. RESUMEN
# =============================================================================

installed_packages <- names(
  installation_check[installation_check]
)

failed_packages <- names(
  installation_check[!installation_check]
)


cat(
  "\n============================================================\n"
)

cat(
  "RESUMEN DE INSTALACION\n"
)

cat(
  "============================================================\n\n"
)

cat(
  "Paquetes instalados correctamente:",
  length(installed_packages),
  "\n"
)

cat(
  "Paquetes con problemas:",
  length(failed_packages),
  "\n\n"
)


# =============================================================================
# 6. MENSAJE FINAL
# =============================================================================

if (all(installation_check)) {
  
  message(
    "\nINSTALACION COMPLETA\n",
    "Todos los paquetes necesarios para el curso estan disponibles."
  )
  
} else {
  
  message(
    "\nATENCION\n",
    "Los siguientes paquetes no pudieron instalarse:\n\n",
    paste(
      failed_packages,
      collapse = "\n"
    ),
    "\n\nNo se preocupe. Guarde este mensaje y lo revisaremos antes de comenzar."
  )
}


# =============================================================================
# 7. INFORMACION DE LA SESION
# =============================================================================

# Esta informacion es util para diagnosticar problemas de instalacion.

sessionInfo()
