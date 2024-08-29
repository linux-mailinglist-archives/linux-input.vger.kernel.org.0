Return-Path: <linux-input+bounces-5972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CE964F94
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8BC1F240B6
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9CD1BF7E9;
	Thu, 29 Aug 2024 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klWT8Ngb"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D195D1BDAAD;
	Thu, 29 Aug 2024 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960513; cv=none; b=VmFC0CJxbG8g6/TfEmSKUdbPIIjGYmh4+qhakQ1oYwbHdUrQYtEb5yVTuj+1Nzy5Eze2IkuulqoslKWp9otJ7oV12n870EtGTwTMQSVpxV2OSF4l9MQFPKlrBqpQPnkyYLs+qagC1txQbvF/AnTVF0emg2NhncfijnwB3E1HjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960513; c=relaxed/simple;
	bh=pbNNeehek8IKSmBANU86t3k5XQqNurV5mn5lbqcNHsE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gFmIWwNMHFlxsjwkV52gn/bkXbOnLXaKZUPV3NAQwUtDFa/xbRti0zujyNp3MlblC1GaKeHy5eq/Yb+lCE9uAp+m9pkX8dGHQSH7KfK/w7Q9ijVkN6r0Bx58R1PCyPZmzq1KJvy/GstytRMbF58XH+jrCC25EHSkZwtQsCLfhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klWT8Ngb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGYXH2020024;
	Thu, 29 Aug 2024 19:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BrEMX7ACiXPHxqAObMIUn7s/ZBU0iyetW+drQxQADrQ=; b=klWT8Ngb8QZoIsSH
	FJWhBBVEnuBzDjKXjA28C1k6mL29D1nkcOMX27tSlrawpJAUeDEQPiGTq5kyeZAz
	uc28/JY2QOpq1mHJs133XNSxao4zYps5jqbtOkU7nTU2MSv4jC/DPQuaQ/3jCAYy
	6yKWKnyTbbCkzm3tyl2t+LslMjWNV88AgjUsDQmiJOhHJQqmjeQqSw4+lAUmS94O
	yqPqysuIxX5quFYKegijjDr7vjxfjgXAXySOVBitkTZi0L/mX2wXpnKvjiIZoenw
	GW1d0sEWftqesNt49fTSNK+PHN9o+epauJbDImFW5mFKDIUp5h098lxoiDAZoudO
	E2klaw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putph4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TJfRia018134
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 19:41:27 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 12:41:26 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v26 09/33] ALSA: Add USB audio device jack type
Date: Thu, 29 Aug 2024 12:40:41 -0700
Message-ID: <20240829194105.1504814-10-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BfPZGjarFFZBKgwyyKugpUmiWOCpjXlQ
X-Proofpoint-ORIG-GUID: BfPZGjarFFZBKgwyyKugpUmiWOCpjXlQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290138

Add an USB jack type, in order to support notifying of a valid USB audio
device.  Since USB audio devices can have a slew of different
configurations that reach beyond the basic headset and headphone use cases,
classify these devices differently.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/sound/jack.h                   | 4 +++-
 include/uapi/linux/input-event-codes.h | 3 ++-
 sound/core/jack.c                      | 6 ++++--
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4338b1b4ac44..82826f5a3741 100644
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
index 03edf2ccdf6c..607a0c0fc20a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -922,7 +922,8 @@
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

