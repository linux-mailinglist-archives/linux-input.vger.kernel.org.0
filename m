Return-Path: <linux-input+bounces-10943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5E1A6821A
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 01:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A554A426EC4
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 00:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461A81DED4A;
	Wed, 19 Mar 2025 00:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U7Y+SsET"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADE91C9EAA;
	Wed, 19 Mar 2025 00:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742345540; cv=none; b=gbB8eNnJqsLihXfFmMf/ZZ24YyabPntUUaT7G2xQwsb8+ZpnE1Jx6cTEL9dECv1si/eFjk0dqB5qJGAlBGIPlTBtfFpxsfc/JbD/Nhb00sxJvOo/WKLSOmnwz9RUQqEfYXcldRvnX/1tEpuxKPevglwHjUfT+HZV09UMSL7lV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742345540; c=relaxed/simple;
	bh=6soBlSTrs4o2NPOy96vetYueQ33h0vwSEoQPO032eBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbJXKpHcmU4ajSJ6v5cSu/jh91jLJaunuI6C9tbJmduGdR69eU39X2y8dSsf6JxMNU0A83H3CAn1mQJxjMOt9UgyVR0LeMtIZjKmvJOoO31ikYcxOuLiJKGLzvzg42w62Na4t5MeWYfFzWgJaCB+Wtpv4/IzOsj1dXubQ2j2G6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U7Y+SsET; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IIJqvG024976;
	Wed, 19 Mar 2025 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BYGrn1lAShfIJH7sSBgrl86DgdMjcaIN8YuyM99vjSg=; b=U7Y+SsET0WmfYRcT
	rGlA1OmoRX54rGCt1APUS+6I6oGBohmXCy+3a4jsHeWBPMoV3kkEl0k6qtVTaGO7
	qRUSuT3KisHrYYVTsZ8pGz3Ih5kd2rpRfUnxhh8IvYL+v1N23QsLbbWFK3JbhCuu
	ZZx6OXkhmV/gnr3uyQ9GY/DAyyz3DykAVOrqySA9ts4qIE07/nsdrjhvixYYnfE5
	UZZgK7pBP1dRXDQLBUW8qdOQufqlUdmWTJRBpYEcXp52jSQ4JxHd6fc44gT9dHIv
	q0VsMMm4TH/VapSOssi08e4vc9AymfUj7PpFRXw7ofPxHzV/If/CiYoQR2ZD+DeV
	G4M/+w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu1w4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52J0prxw025710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Mar 2025 00:51:53 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 17:51:53 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v36 07/31] ALSA: Add USB audio device jack type
Date: Tue, 18 Mar 2025 17:51:17 -0700
Message-ID: <20250319005141.312805-8-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319005141.312805-1-quic_wcheng@quicinc.com>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67da152a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=Vs1iUdzkB0EA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=KDH7PK-IGdRBExAxqvoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: W5AXELJJejOi_KVQYFXJoIszOanZ3scJ
X-Proofpoint-ORIG-GUID: W5AXELJJejOi_KVQYFXJoIszOanZ3scJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190003

Add an USB jack type, in order to support notifying of a valid USB audio
device.  Since USB audio devices can have a slew of different
configurations that reach beyond the basic headset and headphone use cases,
classify these devices differently.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/sound/jack.h                   | 4 +++-
 include/uapi/linux/input-event-codes.h | 3 ++-
 sound/core/jack.c                      | 6 ++++--
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index d67614f7b7f1..b3d7fc59c550 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -340,7 +340,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x11
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/sound/jack.h b/include/sound/jack.h
index 1ed90e2109e9..bd3f62281c97 100644
--- a/include/sound/jack.h
+++ b/include/sound/jack.h
@@ -22,6 +22,7 @@ struct input_dev;
  * @SND_JACK_VIDEOOUT: Video out
  * @SND_JACK_AVOUT: AV (Audio Video) out
  * @SND_JACK_LINEIN:  Line in
+ * @SND_JACK_USB: USB audio device
  * @SND_JACK_BTN_0: Button 0
  * @SND_JACK_BTN_1: Button 1
  * @SND_JACK_BTN_2: Button 2
@@ -43,6 +44,7 @@ enum snd_jack_types {
 	SND_JACK_VIDEOOUT	= 0x0010,
 	SND_JACK_AVOUT		= SND_JACK_LINEOUT | SND_JACK_VIDEOOUT,
 	SND_JACK_LINEIN		= 0x0020,
+	SND_JACK_USB		= 0x0040,
 
 	/* Kept separate from switches to facilitate implementation */
 	SND_JACK_BTN_0		= 0x4000,
@@ -54,7 +56,7 @@ enum snd_jack_types {
 };
 
 /* Keep in sync with definitions above */
-#define SND_JACK_SWITCH_TYPES 6
+#define SND_JACK_SWITCH_TYPES 7
 
 struct snd_jack {
 	struct list_head kctl_list;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 5a199f3d4a26..3b2524e4b667 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -925,7 +925,8 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_USB_INSERT		0x11  /* set = USB audio device connected */
+#define SW_MAX			0x11
 #define SW_CNT			(SW_MAX+1)
 
 /*
diff --git a/sound/core/jack.c b/sound/core/jack.c
index e4bcecdf89b7..de7c603e92b7 100644
--- a/sound/core/jack.c
+++ b/sound/core/jack.c
@@ -34,6 +34,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPES] = {
 	SW_JACK_PHYSICAL_INSERT,
 	SW_VIDEOOUT_INSERT,
 	SW_LINEIN_INSERT,
+	SW_USB_INSERT,
 };
 #endif /* CONFIG_SND_JACK_INPUT_DEV */
 
@@ -241,8 +242,9 @@ static ssize_t jack_kctl_id_read(struct file *file,
 static const char * const jack_events_name[] = {
 	"HEADPHONE(0x0001)", "MICROPHONE(0x0002)", "LINEOUT(0x0004)",
 	"MECHANICAL(0x0008)", "VIDEOOUT(0x0010)", "LINEIN(0x0020)",
-	"", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)", "BTN_3(0x0800)",
-	"BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)", "",
+	"USB(0x0040)", "", "", "BTN_5(0x0200)", "BTN_4(0x0400)",
+	"BTN_3(0x0800)", "BTN_2(0x1000)", "BTN_1(0x2000)", "BTN_0(0x4000)",
+	"",
 };
 
 /* the recommended buffer size is 256 */

