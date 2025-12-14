package CancerImmunotherapy {

  package BasicSciences {    

    package Types {                                                 
      private import ScalarValues::*;                               

      enum def ImmuneLandscapeKind {                          // 免疫景观种类
        enum immuneActive;                                    // 免疫活跃
        enum immuneDeserted;                                  // 免疫荒漠
        enum immuneExcluded;                                  // 免疫排斥
      }

      enum def StressKind {                                    // 应激种类
        enum genomic;                                          // 基因组
        enum ER;                                               // 内质网
        enum nutrient;                                         // 营养
        enum hypoxia;                                          // 缺氧
        enum infectionStress;                                  // 感染相关
      } 

      enum def CellDeathKind {                                 // 细胞死亡种类
        enum apoptosis;                                        // 凋亡
        enum necroptosis;                                      // 程序性坏死
        enum ferroptosis;                                      // 铁死亡
      } 

      enum def TumorRejectionDeterminantKind {                 // 肿瘤排斥决定项种类
        enum hostGeneticsAndPostGenetics;                      // 宿主遗传与后遗传/后基因组适应
        enum tumorSomaticEvolution;                            // 肿瘤体细胞组成与进化
        enum environment;                                      // 环境
        enum adaptome;                                         // 适应组/免疫受体库多样性（TCR/BCR）
      } 
    } 
    
    package Molecular {                                        // 分子相关

      item def DAMP {                                          // 损伤相关分子模式
        doc /* Damage-associated molecular pattern molecules. */     
      }                                                             

      item def HMGB1 :> DAMP {                                 // 高迁移率族蛋白B1
        doc /* A highlighted DAMP released under stress; promotes chemokines and recruitment. */ 
      }

      item def Histone :> DAMP{                                // 组蛋白（应激/损伤时可释放）
        doc /* Stress-released intracellular proteins mentioned alongside HMGB1. */
      }                                                             

      item def Chemokine {                                     // 趋化因子（影响免疫细胞迁移）
        doc /* Supports trafficking and recruitment via gradients. */ // 用于建立“进入/招募”逻辑
      } 

      item def IFN_gamma {                                      // IFN-γ（ICR相关程序的重要因子）
        doc /* IFN-gamma is part of the conserved immune-rejection program (ICR). */
      } 

      item def ICR_Signature {                                  // ICR签名（免疫排斥/排斥反应转录程序）
        doc /* Immunologic Constant of Rejection (ICR): conserved transcriptional immune-rejection signature. */
      } 

      item def AntigenicMoiety {                                // 抗原性成分（病毒表位/新抗原等）
        doc /* Antigenic sources include viral epitopes and neoepitopes from mutations. */ 
      }
    } 

    package Structure { 
      private import ScalarValues::*;  

      part def Microbiome {                                    // 微生物群系（微生物组）
        doc /* Environmental influence category (microbiome, etc.). */ 
      }  

      part def Organism {                                            // 生命体
        attribute geneticBackground : String;                        // 遗传背景
        attribute postGeneticAdaptations : String;                   // 后遗传/后基因组适应
        part microbiome : Microbiome;                                // 微生物群系
        part immuneSystem : ImmuneSystem;                            // 免疫系统（先天+适应性）
      } 

      part def ImmuneSystem {                                        // 免疫系统
        part innate : InnateImmuneSystem;                            // 先天
        part adaptive : AdaptiveImmuneSystem;                        // 适应性
      } 

      part def InnateImmuneSystem {                                  // 先天免疫系统
        part macrophages[*] : Macrophage;                            // 巨噬细胞
        part nkCells[*]     : NK_Cell;                               // NK细胞
        part dendritic[*]   : Dendritic_Cell;                        // 树突细胞
      } 

      part def AdaptiveImmuneSystem {                                // 适应性免疫系统
        part tCells[*] : T_Cell;                                     // T细胞
        part bCells[*] : B_Cell;                                     // B细胞
      }

      part def TumorMicroenvironment {                               //肿瘤微环境（TME）
        attribute hypoxia : Boolean;                                 // 是否缺氧
        attribute nutrientStress : Boolean;                          // 是否营养应激
        attribute extracellularKHigh : Boolean;                      // 是否高外源K+
        attribute DAMPsPresent : Boolean;                            // 是否存在DAMPs
        attribute chemokineGradientsPresent : Boolean;               // 是否存在趋化梯度（影响浸润/进入）
      } 

      part def Tumor {                                               // 肿瘤
        attribute genomicInstability : Boolean;                      // 基因组不稳定
        attribute expressesICR : Boolean;                            // 是否呈现ICR程序
        attribute immuneLandscape : Types::ImmuneLandscapeKind;      // 免疫景观

        attribute antigenExpressionLost : Boolean;                   // 是否发生抗原表达丢失

        attribute Wnt_BetaCatenin_Active : Boolean;                  // Wnt/β-catenin通路是否活跃
        attribute PTEN_Loss : Boolean;                               // PTEN是否缺失

        attribute autophagyHigh : Boolean;                           // 自噬水平是否升高

        part tme : TumorMicroenvironment;                            // 肿瘤包含微环境
      } 

      part def Macrophage;                                           // 巨噬细胞
      part def NK_Cell;                                              // NK细胞
      part def Dendritic_Cell;                                       // 树突细胞
      part def T_Cell;                                               // T细胞
      part def B_Cell;                                               // B细胞

      part def CancerImmuneContext {                                 // 癌症-免疫上下文
        part host : Organism;                                        // 宿主
        part tumor : Tumor;                                          // 肿瘤
      }
    }

    package Behavior {

      private import ScalarValues::*;      	

      action def Stress_and_Autophagy {                              // 应激与自噬
        doc /* Stress response includes enhanced autophagy; stressed cells release HMGB1/histones; autophagy may limit immunity. */ 
      } 

      action def DAMP_Release_and_Signal0 {                          // DAMP释放与“Signal 0”启动
        doc /* HMGB1 and other DAMPs stimulate chemokines → recruit innate cells → initiate Signal 0. */
      }

      action def Innate_Activation {                                 // 先天免疫启动
        doc /* Innate initiation and recruitment; IFN-γ release; upregulate class I/II for T cell interrogation. */ 
      } 

      action def Adaptive_TCell_Response {                           // 适应性T细胞反应
        doc /* Effective adaptive response is central; T cells recognize viral epitopes and neoepitopes (passenger/driver). */ 
      }  

      action def Tumor_Escape_Mechanisms {                           // 免疫逃逸机制
        doc /* Escape: failure of T cell entry (Wnt/β-catenin, PTEN loss), adverse TME (hypoxia/nutrients/K+/DAMPs), antigen loss. */
      }   

      action def Tumor_Rejection {                                   // 肿瘤清除/排斥
        doc /* Tumor rejection is the extreme manifestation of immune surveillance; associated with ICR program. */ 
      } 
      
      action def Ch2_Core_Narrative {                                

        attribute tCellEntrySuccessful : Boolean;                               // T细胞是否成功进入肿瘤
        attribute tmePermissiveForTCells : Boolean;                             // 微环境是否允许T细胞功能
        attribute antigenExpressionRetained : Boolean;                          // 抗原表达是否保留   

        action a1 : Stress_and_Autophagy;                            
        action a2 : DAMP_Release_and_Signal0;                        
        action a3 : Innate_Activation;                              
        action a4 : Adaptive_TCell_Response;                        
                      

        first start then a1;                                         
        first a1 then a2;                                            
        first a2 then a3;                                            
        first a3 then a4; 
        
        then decide;                                                         
        if tCellEntrySuccessful and tmePermissiveForTCells and antigenExpressionRetained then a5;                                                                 
          else a6; 

        action a5 : Tumor_Rejection;      
        then merge outcomeMerge;                      
        action a6 : Tumor_Escape_Mechanisms;          
        then outcomeMerge;  
         
        first outcomeMerge then done;                                                  
      }                                                             
    }                                                              
  }
}
