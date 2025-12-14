package CancerImmunotherapyHistory {
	
	private import ScalarValues::String;
	
    part def Person {
        attribute fullName : String;
    } 
    
    part def Organization {
        attribute name : String;
    } 

    action def HistoricalEvent {

        attribute year : String;
        attribute titleEn : String;
        attribute titleZh : String;

        attribute summaryEn : String;
        attribute summaryZh : String;

        ref part mainPersons[0..*] : Person;
        ref part mainOrganizations[0..*] : Organization;
    }
    
    part williamColey : Person {
    	:>> fullName = "William B. Coley";
    }
    
    part paulEhrlich : Person {
    	:>> fullName = "Paul Ehrlich";
    }

    part aliceMoore : Person {
    	:>> fullName = "Alice Moore";
    }
    
    part donaldMorton : Person {
    	:>> fullName = "Donald Morton";
    }    
    
    part stevenARosenberg : Person {
    	:>> fullName = "Steven A. Rosenberg";
    }     
 
    part zeligEshhar : Person {
    	:>> fullName = "Zelig Eshhar";
    }  
    
    part carlJune : Person {
    	:>> fullName = "Carl June";
    }     
    
    part jamesPAllison : Person {
    	:>> fullName = "James P. Allison";
    } 
    
    part parkeDavisCo : Organization {
    	:>> name = "Parke Davis & Co.";
    }   

    part fda : Organization {
    	:>> name = "U.S. FDA";
    }   

    action def CancerImmunotherapyHistoryFlow {
        
        action coleysToxinInjection : HistoricalEvent {
            :>> year            = "1891";
            :>> titleEn         = "Coley's toxin injection therapy";
            :>> titleZh         = "科利毒素注射疗法";
            :>> summaryEn       = "Coley injects bacterial toxins to treat inoperable sarcomas.";
            :>> summaryZh       = "科利用细菌毒素注射治疗无法手术的肉瘤患者。";
            :>> mainPersons = williamColey;
        }
        
        action ehrlichMagicBullet : HistoricalEvent {
            :>> year            = "early 1900s";
            :>> titleEn         = "Ehrlich's 'Magic Bullet' hypothesis";
            :>> titleZh         = "埃利希“魔弹”假说";
            :>> summaryEn       = "Concept that drugs could selectively target disease cells without harming normal tissues, providing a conceptual basis for targeted and immune-based therapies.";
            :>> summaryZh       = "提出药物可以选择性靶向病变细胞而尽量避免损伤正常组织的设想，为后来的靶向治疗和免疫治疗提供了重要的观念基础。";
            :>> mainPersons = paulEhrlich;
        }
        
        action firstViralOncolysis : HistoricalEvent {
            :>> year            = "circa 1949";
            :>> titleEn         = "First viral oncolysis experiment";
            :>> titleZh         = "首例病毒溶瘤疗法实验";
            :>> summaryEn       = "Clinical and preclinical observations that certain viral infections could lead to temporary tumor regression, inspiring oncolytic virus strategies.";
            :>> summaryZh       = "在临床与前临床观察中发现某些病毒感染可导致肿瘤暂时性缩小，由此启发了后续的溶瘤病毒治疗构想。";
            :>> mainPersons = aliceMoore;
        }
        
        action coleyToxinDiscontinued : HistoricalEvent {
            :>> year            = "1950s";
            :>> titleEn         = "Coley's toxin discontinued by Parke Davis";
            :>> titleZh         = "Parke Davis公司停止生产科利毒素";
            :>> summaryEn       = "Industrial production of Coley toxin was discontinued, marking the decline of early empirical cancer immunotherapy approaches.";
            :>> summaryZh       = "制药公司停止生产科利毒素，标志着早期经验性癌症免疫治疗策略的走向式微。";
            :>> mainOrganizations = parkeDavisCo;
        }
        
        action melanomaVaccineTrials : HistoricalEvent {
            :>> year            = "1970s–2000s";
            :>> titleEn         = "Melanoma vaccine clinical trials";
            :>> titleZh         = "黑色素瘤疫苗临床试验";
            :>> summaryEn       = "Multiple melanoma vaccine trials were conducted over several decades, but most showed limited clinical benefit, highlighting the difficulty of inducing effective anti-tumor immunity.";
            :>> summaryZh       = "在数十年的时间里开展了多种黑色素瘤疫苗临床试验，多数疗效有限，凸显出诱导有效抗肿瘤免疫反应的困难。";
            :>> mainPersons = donaldMorton;
        }

        action intratumoralBCG : HistoricalEvent {
            :>> year            = "1970s";
            :>> titleEn         = "Intratumoral BCG immunotherapy";
            :>> titleZh         = "肿瘤内卡介苗免疫治疗";
            :>> summaryEn       = "BCG is injected directly into tumors to stimulate local immune responses.";
            :>> summaryZh       = "将卡介苗直接注入肿瘤以激活局部免疫反应。";
            :>> mainPersons = donaldMorton;
        }

        action lakCellTherapy : HistoricalEvent {
            :>> year            = "1980s";
            :>> titleEn         = "LAK (lymphokine-activated killer) cell therapy";
            :>> titleZh         = "LAK（淋巴因子激活杀伤细胞）疗法";
            :>> summaryEn       = "Ex vivo activation of peripheral lymphocytes with high-dose IL-2 to kill tumors.";
            :>> summaryZh       = "体外用大剂量IL-2激活外周淋巴细胞以增强其杀伤肿瘤的能力。";
            :>> mainPersons = stevenARosenberg;
        }

        action cytokineTherapies : HistoricalEvent {
            :>> year            = "1980s";
            :>> titleEn         = "Cytokine therapies with IL-2 and IFN-alpha";
            :>> titleZh         = "IL-2 与 IFN-α 细胞因子治疗";
            :>> summaryEn       = "High-dose IL-2 and interferon-alpha are used as systemic immunotherapies.";
            :>> summaryZh       = "大剂量IL-2和干扰素-α被用作全身性免疫治疗手段。";
        }

        action tILTherapy : HistoricalEvent {
            :>> year            = "1988";
            :>> titleEn         = "Tumor-infiltrating lymphocyte (TIL) therapy";
            :>> titleZh         = "肿瘤浸润淋巴细胞（TIL）疗法";
            :>> summaryEn       = "Isolation and expansion of TILs from resected tumors followed by reinfusion.";
            :>> summaryZh       = "从切除肿瘤中分离并扩增TIL，然后回输给同一患者。";
            :>> mainPersons = stevenARosenberg;
        }

        action cartConcept : HistoricalEvent {
            :>> year            = "1990s";
            :>> titleEn         = "Chimeric antigen receptor T cell (CAR-T) concept";
            :>> titleZh         = "嵌合抗原受体 T 细胞（CAR-T）构想";
            :>> summaryEn       = "First designs of chimeric antigen receptors combined antibody-derived recognition with T-cell signaling, providing a framework for genetically engineered T-cell therapies.";
            :>> summaryZh       = "最初的嵌合抗原受体设计将抗体来源的识别结构域与T细胞信号转导结构域结合，为后续基因工程T细胞疗法奠定了框架。";
            :>> mainPersons = zeligEshhar;
        }
        
        action cartClinical : HistoricalEvent {
            :>> year            = "2010s";
            :>> titleEn         = "Clinical breakthrough of CAR-T cell therapy";
            :>> titleZh         = "CAR-T 细胞疗法的临床突破";
            :>> summaryEn       = "CD19-targeted CAR-T cell therapies achieved dramatic remissions in refractory leukemia and lymphoma, leading to regulatory approvals and establishing CAR-T as a major modality of cancer immunotherapy.";
            :>> summaryZh       = "以 CD19 为靶点的 CAR-T 细胞疗法在难治性白血病和淋巴瘤中获得了显著缓解，促成相关产品获批，使 CAR-T 成为肿瘤免疫治疗的重要治疗模式。";
            :>> mainPersons = carlJune;
        }
        
        action sipuleucelTApproval : HistoricalEvent {
            :>> year            = "2010";
            :>> titleEn         = "Approval of the first therapeutic cancer vaccine (Sipuleucel-T)";
            :>> titleZh         = "首个治疗性癌症疫苗 Sipuleucel-T 获批";
            :>> summaryEn       = "Regulatory approval of the autologous cellular product Sipuleucel-T for metastatic prostate cancer demonstrated that personalized cancer vaccines could reach the clinic.";
            :>> summaryZh       = "自体细胞制剂Sipuleucel-T获批用于转移性前列腺癌治疗，说明个体化癌症疫苗策略可以进入日常临床实践。";
            :>> mainOrganizations = fda;
        }

        action checkpointInhibitors : HistoricalEvent {
            :>> year            = "2011–2014";
            :>> titleEn         = "Immune checkpoint inhibitor era (CTLA-4, PD-1/PD-L1)";
            :>> titleZh         = "免疫检查点抑制剂时代（CTLA-4与PD-1/PD-L1）";
            :>> summaryEn       = "Approval of CTLA-4 and PD-1/PD-L1 antibodies established immune checkpoint blockade as a transformative cancer treatment, with durable responses across multiple tumor types.";
            :>> summaryZh       = "CTLA-4与PD-1/PD-L1抗体相继获批，使免疫检查点阻断成为改变治疗格局的肿瘤治疗方式，在多种肿瘤类型中带来了可持续的缓解。";
            :>> mainPersons = jamesPAllison;
        }              

        action oncolyticVirusApproval : HistoricalEvent {
            :>> year            = "2015";
            :>> titleEn         = "Approval of the oncolytic virus T-VEC";
            :>> titleZh         = "溶瘤病毒T-VEC 获批";
            :>> summaryEn       = "The approval of the oncolytic herpesvirus Talimogene laherparepvec (T-VEC) for melanoma provided proof of concept for genetically engineered oncolytic viruses as a clinical cancer immunotherapy.";
            :>> summaryZh       = "基因工程溶瘤单纯疱疹病毒Talimogene laherparepvec（T-VEC）在黑色素瘤中的获批，证明了基因改造溶瘤病毒作为临床肿瘤免疫治疗手段的可行性。";
            :>> mainOrganizations = fda;
        }
        
        action tumorAgnosticICIApproval : HistoricalEvent {
            :>> year      = "2017";
            :>> titleEn   = "First tumor-agnostic approval of an immune checkpoint inhibitor";
            :>> titleZh   = "首个与肿瘤原发部位无关的免疫检查点抑制剂适应证获批";
            :>> summaryEn = "The FDA granted approval to pembrolizumab for solid tumors with MSI-H or dMMR, regardless of the tissue of origin, marking the first tumor-agnostic indication for an immune checkpoint inhibitor.";
            :>> summaryZh = "FDA批准帕博利珠单抗用于携带MSI-H或dMMR的实体瘤患者，而不再以肿瘤原发部位划分适应证，成为免疫检查点抑制剂首个真正意义上的“肿瘤类型无关”适应证。";
            :>> mainOrganizations = fda;
        }        

        action firstCartApproval : HistoricalEvent {
            :>> year            = "2017";
            :>> titleEn         = "First CAR-T therapy approval (Tisagenlecleucel)";
            :>> titleZh         = "首个 CAR-T 疗法 (Tisagenlecleucel) 获批";
            :>> summaryEn       = "FDA approved Tisagenlecleucel (Kymriah) for pediatric acute lymphoblastic leukemia, marking the first regulatory approval of a gene therapy in the US.";
            :>> summaryZh       = "FDA 批准 Tisagenlecleucel (Kymriah) 用于治疗儿童急性淋巴细胞白血病，标志着美国首个基因疗法获得监管批准。";
            :>> mainOrganizations = fda;
            :>> mainPersons = carlJune;
        }

        action lag3Approval : HistoricalEvent {
            :>> year            = "2022";
            :>> titleEn         = "Regulatory approval of a LAG-3–targeted immune checkpoint inhibitor";
            :>> titleZh         = "以LAG-3为靶点的免疫检查点抑制剂获批";
            :>> summaryEn       = "The FDA approved the combination of relatlimab (anti-LAG-3) and nivolumab, validating LAG-3 as the third immune checkpoint pathway for clinical use.";
            :>> summaryZh       = "FDA批准了Relatlimab（抗LAG-3）与Nivolumab的联合疗法，证实LAG-3是第三个可用于临床的免疫检查点通路。";
            :>> mainOrganizations = fda;
        }

        action tebentafuspApproval : HistoricalEvent {
            :>> year            = "2022";
            :>> titleEn         = "First TCR-based bispecific therapeutic approved (Tebentafusp)";
            :>> titleZh         = "首个基于 TCR 的双特异性抗癌药物（Tebentafusp）获批";
            :>> summaryEn       = "Tebentafusp, a soluble TCR–CD3 bispecific therapeutic targeting gp100, receives regulatory approval as the first T cell receptor (TCR)-based anticancer drug, but it is not an adoptive TCR-T cell therapy.";
            :>> summaryZh       = "Tebentafusp作为靶向gp100的可溶性TCR–CD3双特异性药物，成为首个获批的基于T细胞受体（TCR）的抗癌药物，但并非回输型TCR-T细胞疗法。";
            :>> mainOrganizations = fda;
        }

        action tilTherapyRealized : HistoricalEvent {
            :>> year            = "2024";
            :>> titleEn         = "First TIL therapy approval (Lifileucel)";
            :>> titleZh         = "首个TIL疗法 (Lifileucel) 正式获批";
            :>> summaryEn       = "The FDA granted accelerated approval to Lifileucel for advanced melanoma, making it the first approved tumor-infiltrating lymphocyte therapy, realizing the long-awaited potential of adoptive cell transfer for solid tumors.";
            :>> summaryZh       = "FDA加速批准Lifileucel用于治疗晚期黑色素瘤，使其成为首个获批的肿瘤浸润淋巴细胞疗法，实现了过继细胞疗法治疗实体瘤的长期愿景。";
            :>> mainOrganizations = fda;
        }
        
        action tarlatamabApproval : HistoricalEvent {
            :>> year            = "2024";
            :>> titleEn         = "First DLL3-targeted bispecific antibody (Tarlatamab)";
            :>> titleZh         = "首个靶向 DLL3 的双特异性抗体 (Tarlatamab)";
            :>> summaryEn       = "FDA granted accelerated approval to tarlatamab for extensive-stage small cell lung cancer (SCLC). It is the first BiTE (bispecific T-cell engager) to successfully target a solid tumor antigen (DLL3) in a major cancer type.";
            :>> summaryZh       = "FDA加速批准 Tarlatamab 用于广泛期小细胞肺癌。这是首个成功靶向实体瘤抗原 (DLL3) 并用于常见主要癌种的双特异性T细胞接合器 (BiTE)。";
            :>> mainOrganizations = fda;
        }

        action afamicelApproval : HistoricalEvent {
            :>> year            = "2024";
            :>> titleEn         = "First TCR-T therapy for solid tumors (Afami-cel)";
            :>> titleZh         = "首个实体瘤TCR-T细胞疗法 (Afami-cel)";
            :>> summaryEn       = "Approval of afamitresgene autoleucel (Afami-cel) for synovial sarcoma. Unlike CAR-T which targets surface antigens, this engineered TCR-T therapy targets the intracellular antigen MAGE-A4, marking a breakthrough for engineered cell therapy in solid tumors.";
            :>> summaryZh       = "Afamitresgene autoleucel (Afami-cel) 获批用于滑膜肉瘤。不同于靶向表面抗原的CAR-T，这种基因工程TCR-T疗法能靶向胞内抗原MAGE-A4，标志着工程化细胞疗法在实体瘤领域的重大突破。";
            :>> mainOrganizations = fda;
        }        
        
        first coleysToxinInjection then ehrlichMagicBullet;
        first ehrlichMagicBullet then firstViralOncolysis;
        first firstViralOncolysis then coleyToxinDiscontinued;
        first coleyToxinDiscontinued then melanomaVaccineTrials;
        first melanomaVaccineTrials then intratumoralBCG;
        first intratumoralBCG then lakCellTherapy;
        first lakCellTherapy then cytokineTherapies;
        first cytokineTherapies then tILTherapy;
        first tILTherapy then cartConcept;
        first cartConcept then cartClinical;
        first cartClinical then sipuleucelTApproval;
        first sipuleucelTApproval then checkpointInhibitors;
        first checkpointInhibitors then oncolyticVirusApproval;
        first oncolyticVirusApproval then tumorAgnosticICIApproval;
        first tumorAgnosticICIApproval then firstCartApproval;        
        first firstCartApproval then lag3Approval;     
        first lag3Approval then tebentafuspApproval;
        first tebentafuspApproval then tilTherapyRealized;         
        first tilTherapyRealized then tarlatamabApproval;
        first tarlatamabApproval then afamicelApproval;                  
    }
}
