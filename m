Return-Path: <linux-input+bounces-6468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DC977211
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 21:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253AF1F22175
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 19:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CA91CB502;
	Thu, 12 Sep 2024 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N/ho4TFH"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6611C2325;
	Thu, 12 Sep 2024 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170026; cv=none; b=N/N+IYJD7qOTcCu3pRFTF1YTONIq5uRpE+GJYM3TFxHV+EByIRoqQ8jDMi/XU+p3eZQ9+Yu8QbfOyK0OEgOKGZN/ghv8QVqtmYqlpRt4dz7fUPJBx8YGftvlGao+sAny9r769i+C8hyqoSR3W5K34MgBLCIWaAReqVvSdXK3wSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170026; c=relaxed/simple;
	bh=H2VvMAmjHHXuPhfwtxy05hMZvGM02stpNq1uNd09GGg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q0yKlhNZVy+iYAC0A2rj8Sh4jtLYhrhHUmotI2s9vtDjLfPsKpQXO2WVSpm/4RvEnrtgqzErxT6cNXstT9nmTHxieroOxNtIkinWbzgNQhrlG1L+588L9GeJk+dNyDvlVPJQS3psYfrhJPJ3UA+M+fdPxfFmjiReg7rC5EVZgD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N/ho4TFH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CHshwC024949;
	Thu, 12 Sep 2024 19:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Duu2pk9fYk9yJEWt+Uf2phJwawOP/BI2KR50wacEDKE=; b=N/ho4TFHaKDVLqLZ
	Zuquh+sc8G9xMWBiYGgcPdNg3maiSYiCwic+WEDJsmmQHd2h374wCX64+oKl9C8G
	xfiuKmwVGTRjYdZmeXRE6xJ95fA2X6oT1SKvzc2axeH8bsIMgLQq0JfOBXfmgmQ9
	erHzzFXW/umvrnuUVKvclXQKmSTYVp+IoMhjt/W6uw3i6nea7EArkyTPDPYCwwnS
	/tI5uytkaCDMEdMZKWr6mvsiQxjtW5JNa0pDx80t1hpkkfU+kcjHhAW5Qn3fV6sL
	1pRgHczcn3KvlAEIFsZv62aHSUcWRdOTYPXReLUSfMZcqjYsq1U9Icge0xiDk1k3
	wYLTGA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpxd1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48CJdn6e003541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:49 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 12:39:49 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v27 09/32] ALSA: Add USB audio device jack type
Date: Thu, 12 Sep 2024 12:39:12 -0700
Message-ID: <20240912193935.1916426-10-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
References: <20240912193935.1916426-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: hqWzGgLkRPAwbfCBqGYINQyR9CKd_9Y2
X-Proofpoint-GUID: hqWzGgLkRPAwbfCBqGYINQyR9CKd_9Y2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120144

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

