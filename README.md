# 🥩 South African Polony Outbreak Genomic Analysis

## 📖 Project Overview
In 2017–2018, South Africa experienced the **world’s largest recorded outbreak of *Listeria monocytogenes***, linked to contaminated polony (processed cold meat).  
This project reproduces a **whole-genome sequencing (WGS) pipeline** to investigate 100+ outbreak isolates.  

Our goals were to:
- ✅ Confirm the pathogen identity  
- ✅ Determine antimicrobial resistance (AMR) profiles  
- ✅ Detect potential virulence (toxin) genes  
- ✅ Suggest possible antibiotic/treatment options  

---

## 🧪 Workflow
The analysis followed a structured bioinformatics pipeline:

1. **Data Preparation**
   - Downloaded outbreak raw reads (FASTQ files).
   - Organized samples into processing folders.

2. **Quality Control**
   - `FastQC` for raw read inspection.  
   - `fastp` for adapter and quality trimming.  
   - `MultiQC` to generate summary reports.

3. **Genome Assembly**
   - `SPAdes` to assemble contigs.  
   - `QUAST` to evaluate assembly quality.  
   - `Bandage` to visualize assembly graphs.

4. **Pathogen Confirmation**
   - Confirmed isolates as *Listeria monocytogenes* via assembly and known genome signatures.

5. **AMR & Virulence Detection**
   - `ABRicate` with **ResFinder** (AMR genes) and **VFDB** (virulence genes).  
   - Parsed results into summary tables for cross-sample comparison.

---

## 📊 Key Findings

- All isolates were confirmed as ***Listeria monocytogenes***.  
- **AMR profile**: Most samples carried *fosX* (fosfomycin resistance), with occasional hits for *bla* genes (beta-lactamase).  
- **Virulence factors**: Core *Listeria* virulence genes were detected, including *hly* (listeriolysin O), *actA* (intracellular spread), and *prfA* (virulence regulator).  
- These genetic features explain the **high case fatality rate (27%)**, particularly in neonates, pregnant women, and immunocompromised individuals.  

---

## 📊 Impact
This project demonstrates how **WGS-based bioinformatics pipelines** can:

- Rapidly confirm pathogen identity  
- Detect resistance & virulence factors  
- Guide clinical treatment and public health response  

👉 If similar pipelines were integrated into real-time surveillance, outbreaks like the South African *Listeria* crisis could be contained earlier and with fewer casualties.

---

## 🚀 Personal Reflection
Working on this project taught me:

- The **power of genomics** in solving real-world public health challenges  
- How to integrate multiple bioinformatics tools into a complete workflow  
- The importance of **data-driven outbreak response**  

This was more than just a lab exercise—it was a glimpse into how bioinformatics can **save lives**.  

---

## 📂 Repository Structure
├── raw/ # raw reads
├── trim/ # trimmed reads
├── assemblies/ # SPAdes assemblies
├── quast_reports/ # QUAST outputs
├── amr/ # Abricate AMR + VFDB results
├── multiqc_report.html # summarized QC report
├── resistance_summary.txt
├── virulence_summary.txt
└── README.md # project documentation


---

## ⚙️ Tools Used
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- [fastp](https://github.com/OpenGene/fastp)
- [SPAdes](https://github.com/ablab/spades)
- [QUAST](http://quast.sourceforge.net/quast)
- [Bandage](https://rrwick.github.io/Bandage/)
- [ABRicate](https://github.com/tseemann/abricate)
- [MultiQC](https://multiqc.info/)

---

## 🙌 Acknowledgements
- HackBio Internship program for project framework  
- Public WGS outbreak data (NCBI/ENA)  
- Bioinformatics open-source community for tools and databases  

---

