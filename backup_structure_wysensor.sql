-- MySQL dump 10.16  Distrib 10.1.47-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wysensor
-- ------------------------------------------------------
-- Server version	10.1.47-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BIN`
--

DROP TABLE IF EXISTS `BIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BIN` (
  `bin_no` int(11) NOT NULL COMMENT '빈번호1~512',
  `device_id` varchar(16) NOT NULL COMMENT 'MAC주소',
  `time` datetime NOT NULL COMMENT '기기에서온 시간, 기기와 비교',
  `frame` int(11) NOT NULL COMMENT 'mmwave프레임번호',
  `real` float NOT NULL COMMENT '실수',
  `imaginary` float NOT NULL COMMENT '허수'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `ECG_HRV_Parameter`
--

DROP TABLE IF EXISTS `ECG_HRV_Parameter`;
/*!50001 DROP VIEW IF EXISTS `ECG_HRV_Parameter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `ECG_HRV_Parameter` (
  `mean_nni_average` tinyint NOT NULL,
  `rmssd_average` tinyint NOT NULL,
  `sd1_average` tinyint NOT NULL,
  `mean_hr_average` tinyint NOT NULL,
  `sd2_average` tinyint NOT NULL,
  `psi_average` tinyint NOT NULL,
  `mean_nni_standard_deviation` tinyint NOT NULL,
  `rmssd_standard_deviation` tinyint NOT NULL,
  `sd1_standard_deviation` tinyint NOT NULL,
  `mean_hr_standard_deviation` tinyint NOT NULL,
  `sd2_standard_deviation` tinyint NOT NULL,
  `psi_standard_deviation` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ECG_Peaks`
--

DROP TABLE IF EXISTS `ECG_Peaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ECG_Peaks` (
  `file` varchar(128) DEFAULT NULL COMMENT 'ECG 파일 이름',
  `peak_list` text NOT NULL COMMENT '피크 리스트 ex) 100,500,600,700',
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `HRV`
--

DROP TABLE IF EXISTS `HRV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HRV` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(256) NOT NULL,
  `preprocessing_no` int(11) NOT NULL COMMENT '파일 번호',
  `window_no` int(11) NOT NULL COMMENT '윈도우 번호',
  `window_size` int(11) NOT NULL COMMENT '초',
  `type` varchar(8) NOT NULL COMMENT 'hr,br',
  `peak_algorithm` varchar(64) NOT NULL COMMENT 'check_all, AR, LR, FFT, PSD',
  `phase_algorithm` varchar(64) NOT NULL COMMENT 'arcTan,DACM',
  `bpf_filter` varchar(64) NOT NULL COMMENT 'IIR, FIR',
  `diff_filter` tinyint(4) NOT NULL,
  `impulse_filter` tinyint(4) NOT NULL,
  `kalman_filter` tinyint(4) NOT NULL,
  `bin_selection` tinyint(4) NOT NULL COMMENT 'TI:0, Method1,Method2,...',
  `mean_nni` float NOT NULL COMMENT 'HRV값',
  `sdnn` float NOT NULL COMMENT 'HRV값',
  `sdsd` float NOT NULL COMMENT 'HRV값',
  `nni_50` float NOT NULL COMMENT 'HRV값',
  `pnni_50` float NOT NULL COMMENT 'HRV값',
  `nni_20` float NOT NULL COMMENT 'HRV값',
  `pnni_20` float NOT NULL COMMENT 'HRV값',
  `rmssd` float NOT NULL COMMENT 'HRV값',
  `median_nni` float NOT NULL COMMENT 'HRV값',
  `range_nni` float NOT NULL COMMENT 'HRV값',
  `cvsd` float NOT NULL COMMENT 'HRV값',
  `cvnni` float NOT NULL COMMENT 'HRV값',
  `mean_hr` float NOT NULL COMMENT 'HRV값',
  `max_hr` float NOT NULL COMMENT 'HRV값',
  `min_hr` float NOT NULL COMMENT 'HRV값',
  `std_hr` float NOT NULL COMMENT 'HRV값',
  `median_hr` float NOT NULL COMMENT 'HRV값',
  `mad` float NOT NULL COMMENT 'HRV값',
  `lf` float NOT NULL COMMENT 'HRV값',
  `hf` float NOT NULL COMMENT 'HRV값',
  `lf_hf_ratio` float NOT NULL COMMENT 'HRV값',
  `lfnu` float NOT NULL COMMENT 'HRV값',
  `hfnu` float NOT NULL COMMENT 'HRV값',
  `total_power` float NOT NULL COMMENT 'HRV값',
  `vlf` float NOT NULL COMMENT 'HRV값',
  `sampen` float NOT NULL COMMENT 'HRV값',
  `csi` float NOT NULL COMMENT 'HRV값',
  `cvi` float NOT NULL COMMENT 'HRV값',
  `Modified_csi` float NOT NULL COMMENT 'HRV값',
  `sd1` float NOT NULL COMMENT 'HRV값',
  `sd2` float NOT NULL COMMENT 'HRV값',
  `ratio_sd2_sd1` float NOT NULL COMMENT 'HRV값',
  `triangular_index` float NOT NULL COMMENT 'HRV값',
  `mape` float NOT NULL COMMENT 'PPI 에러율 절댓값 평균',
  `label` varchar(256) NOT NULL COMMENT '이상한 데이터 에러',
  `fft_p1` float NOT NULL COMMENT 'hr fft 첫번째 피크',
  `fft_p2` float NOT NULL COMMENT 'hr fft 두번째 피크',
  `fft_p3` float NOT NULL COMMENT 'hr fft 세번째 피크',
  `fft_p4` float NOT NULL COMMENT 'hr fft 네번째 피크',
  `psd_half_width` float NOT NULL COMMENT 'hr psd의 half_width',
  `br_psd` float NOT NULL COMMENT 'br psd max 주파수',
  `br_fft` float NOT NULL COMMENT 'br fft max 주파수',
  `amplitude` float NOT NULL COMMENT 'fft signal parameter',
  `peak_to_peak` float NOT NULL COMMENT 'fft signal parameter',
  `RMS` float NOT NULL COMMENT 'fft signal parameter',
  `R` float NOT NULL COMMENT 'R값',
  `variance` float NOT NULL COMMENT 'ppi 분산',
  `clutter_var` float NOT NULL,
  `bin_var` float NOT NULL,
  `motion_mean` float NOT NULL,
  `tbd` int(11) NOT NULL COMMENT 'To be done',
  `remark` text NOT NULL COMMENT 'To be done 사유',
  `SRD` float NOT NULL,
  `PSI` float NOT NULL,
  `MSI` float NOT NULL,
  `SNS` float NOT NULL,
  `PNS` float NOT NULL,
  PRIMARY KEY (`no`),
  KEY `preprocessing_no` (`preprocessing_no`)
) ENGINE=InnoDB AUTO_INCREMENT=271251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Preprocessingdata`
--

DROP TABLE IF EXISTS `Preprocessingdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Preprocessingdata` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `rawdata_no` int(11) NOT NULL COMMENT 'Raw데이터 번호',
  `unwrap_type` varchar(8) NOT NULL COMMENT 'arctan,dacm',
  `filter_impuse_flag` tinyint(4) NOT NULL COMMENT '1(enable),0(disable)',
  `filter_diff_flag` tinyint(4) NOT NULL COMMENT '1(enable),0(disable)',
  `bandpass_type` varchar(8) NOT NULL COMMENT 'iir,fir',
  `file` varchar(128) NOT NULL COMMENT '파일 이름',
  `path` varchar(128) NOT NULL COMMENT '파일 절대 경로',
  PRIMARY KEY (`no`),
  KEY `rawdata_no` (`rawdata_no`),
  CONSTRAINT `Preprocessingdata_ibfk_1` FOREIGN KEY (`rawdata_no`) REFERENCES `Rawdata` (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Rawdata`
--

DROP TABLE IF EXISTS `Rawdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rawdata` (
  `no` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `mmwave_file` varchar(128) NOT NULL COMMENT '레이더 파일 이름',
  `mmwave_path` varchar(128) NOT NULL COMMENT '레이더 파일 절대경로',
  `time` varchar(128) NOT NULL COMMENT '측정 시간',
  `subject` varchar(128) NOT NULL COMMENT '실험자',
  `distance` float NOT NULL COMMENT '레이더와의 거리',
  `posotion` varchar(128) NOT NULL COMMENT '자세',
  `etc` varchar(128) NOT NULL COMMENT '기타사항',
  `ecg_file` varchar(128) NOT NULL COMMENT 'ECG 파일 이름',
  `ecg_path` varchar(128) NOT NULL COMMENT 'ECG 파일 절대경로',
  `ecg_type` varchar(128) NOT NULL COMMENT 'ECG 측정기기',
  `respiration_file` varchar(128) NOT NULL COMMENT '호흡 파일 이름',
  `respiration_path` varchar(128) NOT NULL COMMENT '호흡 파일 절대경로',
  `respiration_type` varchar(128) NOT NULL COMMENT '호흡 측정기기',
  `start` datetime NOT NULL COMMENT '공통된Data시작시간',
  `end` datetime NOT NULL COMMENT '공통된Data끝나는시간',
  PRIMARY KEY (`no`),
  UNIQUE KEY `mmwave_file` (`mmwave_file`)
) ENGINE=InnoDB AUTO_INCREMENT=3187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Resp_Peaks`
--

DROP TABLE IF EXISTS `Resp_Peaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resp_Peaks` (
  `file` varchar(128) DEFAULT NULL COMMENT '호흡 파일 이름',
  `peak_list` text NOT NULL COMMENT '피크 리스트 ex) 100,500,600,700',
  UNIQUE KEY `file` (`file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WySensor_TLV`
--

DROP TABLE IF EXISTS `WySensor_TLV`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WySensor_TLV` (
  `tlv_index` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime(2) NOT NULL,
  `mac` varchar(17) NOT NULL,
  `MagicNumber` varchar(16) NOT NULL,
  `version` varchar(8) NOT NULL,
  `TotalPacketLen` varchar(8) NOT NULL,
  `platform` varchar(8) NOT NULL,
  `fameNumber` varchar(8) NOT NULL,
  `timeCpuCycle` varchar(8) NOT NULL,
  `numDetectedObj` varchar(8) NOT NULL,
  `numTLVs` varchar(8) NOT NULL,
  `subFrameNumber` varchar(8) NOT NULL,
  `TLV1type` varchar(8) NOT NULL,
  `TLV1length` varchar(8) NOT NULL,
  `rangeBinIndexMax` varchar(4) NOT NULL,
  `rangeBinIndexPhase` varchar(4) NOT NULL,
  `maxVal` varchar(8) NOT NULL,
  `processingCyclesOut` varchar(8) NOT NULL,
  `rangeBinStratIndex` varchar(4) NOT NULL,
  `rangeBinEndIndex` varchar(4) NOT NULL,
  `unwrapPhasePeak_mm` varchar(8) NOT NULL,
  `outputFilterBreathOut` varchar(8) NOT NULL,
  `outputFilterHreatOut` varchar(8) NOT NULL,
  `heartRateEst_FFT` varchar(8) NOT NULL,
  `heartRateEst_FFT_4hz` varchar(8) NOT NULL,
  `heartRateEst_xCorr` varchar(8) NOT NULL,
  `heartReatEst_peakCount` varchar(8) NOT NULL,
  `breathingRateEst_FFT` varchar(8) NOT NULL,
  `breathingRateEst_xCorr` varchar(8) NOT NULL,
  `breathingRateEst_peakCount` varchar(8) NOT NULL,
  `confidenceMetricBreathOut` varchar(8) NOT NULL,
  `confidenceMetricBreathOut_xCorr` varchar(8) NOT NULL,
  `confidenceMetricHeartOut` varchar(8) NOT NULL,
  `confidenceMetricHeartOut_4Hz` varchar(8) NOT NULL,
  `confidenceMetricHeartOut_xCorr` varchar(8) NOT NULL,
  `sumEnergyBreathWfm` varchar(8) NOT NULL,
  `sumEnergyHeartWfm` varchar(8) NOT NULL,
  `motionDetectedFlag` varchar(8) NOT NULL,
  `BreathingRate_HarmEnergy` varchar(8) NOT NULL,
  `HeartRate_HarmEnergy` varchar(8) NOT NULL,
  `reserved1` varchar(8) NOT NULL,
  `reserved2` varchar(8) NOT NULL,
  `reserved3` varchar(8) NOT NULL,
  `reserved4` varchar(8) NOT NULL,
  `reserved5` varchar(8) NOT NULL,
  `reserved6` varchar(8) NOT NULL,
  `reserved7` varchar(8) NOT NULL,
  `reserved8` varchar(8) NOT NULL,
  `TLV2type` varchar(8) NOT NULL,
  `TLV2length` varchar(8) NOT NULL,
  `RangeProfile` text NOT NULL,
  PRIMARY KEY (`tlv_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `ECG_HRV_Parameter`
--

/*!50001 DROP TABLE IF EXISTS `ECG_HRV_Parameter`*/;
/*!50001 DROP VIEW IF EXISTS `ECG_HRV_Parameter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ECG_HRV_Parameter` AS select (select avg(`HRV`.`mean_nni`) from `HRV` where `HRV`.`mean_nni` in (select `HRV`.`mean_nni` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `mean_nni_average`,(select avg(`HRV`.`rmssd`) from `HRV` where `HRV`.`rmssd` in (select `HRV`.`rmssd` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `rmssd_average`,(select avg(`HRV`.`sd1`) from `HRV` where `HRV`.`sd1` in (select `HRV`.`sd1` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `sd1_average`,(select avg(`HRV`.`mean_hr`) from `HRV` where `HRV`.`mean_hr` in (select `HRV`.`mean_hr` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `mean_hr_average`,(select avg(`HRV`.`sd2`) from `HRV` where `HRV`.`sd2` in (select `HRV`.`sd2` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `sd2_average`,(select avg(`HRV`.`PSI`) from `HRV` where `HRV`.`PSI` in (select `HRV`.`PSI` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `psi_average`,(select std(`HRV`.`mean_nni`) from `HRV` where `HRV`.`mean_nni` in (select `HRV`.`mean_nni` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `mean_nni_standard_deviation`,(select std(`HRV`.`rmssd`) from `HRV` where `HRV`.`rmssd` in (select `HRV`.`rmssd` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `rmssd_standard_deviation`,(select std(`HRV`.`sd1`) from `HRV` where `HRV`.`sd1` in (select `HRV`.`sd1` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `sd1_standard_deviation`,(select std(`HRV`.`mean_hr`) from `HRV` where `HRV`.`mean_hr` in (select `HRV`.`mean_hr` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `mean_hr_standard_deviation`,(select std(`HRV`.`sd2`) from `HRV` where `HRV`.`sd2` in (select `HRV`.`sd2` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `sd2_standard_deviation`,(select std(`HRV`.`PSI`) from `HRV` where `HRV`.`PSI` in (select `HRV`.`PSI` from `HRV` where (`HRV`.`peak_algorithm` = 'ecg') group by `HRV`.`file`,`HRV`.`window_no`)) AS `psi_standard_deviation` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-19 14:53:30
