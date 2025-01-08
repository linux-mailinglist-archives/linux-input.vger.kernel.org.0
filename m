Return-Path: <linux-input+bounces-9047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDFBA04F47
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 02:26:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58992188437F
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 01:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C2D1AA786;
	Wed,  8 Jan 2025 01:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Rb7Cczmx"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B6E19C552;
	Wed,  8 Jan 2025 01:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299371; cv=none; b=KNWs7fVlXc6yAkeSYsFtUDd5T34kUc+DKt8OR1uIQ7Bnsxu189/A3zbqXiG58jAQf/e5p7yjNbfvN4AqTqer3bN00DS7d1EyK7241vIEyCKBjrSpdm/oUwBi6uWnBkdX4hwmEo+BDQU+r4NPqtUrCobOPKqGTjYjcHi/WTroPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299371; c=relaxed/simple;
	bh=26Ipc2GMsElFQ6L9cJfS/MwtX90YR+oxohPba+OT+pg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ofmpw0noN80clPgLrCPGb4wrZL8dRFj+6r9YhRYPof4BZFMAYDfK+6S2dgLnpHPS+Qr4wjMvwflVO8RPIwvLQcTmx9O9uRyVHojHicNsfYW1OknAUfk0+2HS8EFwdhAghMoQiY055wEO4aIEuEKVvDWpCTqFKwJn9QgFKOdCDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Rb7Cczmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K5c6q019348;
	Wed, 8 Jan 2025 01:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WK2roP/U0scbargwbJ7Zel8u21pIpnKFvh/gW0HOWV0=; b=Rb7Cczmx9/xdbOMZ
	v+fZo77c3d2kaNmJLMiSfp8keKC4sXTCvfx5HzhTamZ2lZZ9R07vUCqlYS9I7M5O
	2JmcePT1yzG85z3rGXavDc+IIXLZu3j5XRs9Mw8rcm6J6jO6g3RiNbwQ1dfdHFFa
	ewh0rOv7DZss39pN3NQNm9e1J+bJxxS4fvKUf1EGul6E/+2a2Z0TcenzQ9CzRT67
	WLgYKa8zLXD8dPLE9IAE+vksxmEf1SMWCsQ7/HzhcxHfIiQHaBrTRaW3n5zrAEz/
	t3HdsoN6d86g61M31TSxHRf4zwxm8EyW7FohhjAO1huIszN8QS6l8n85cR7jhYOJ
	pog4iQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441b0k0hgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 01:22:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5081MQar027988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 01:22:26 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 17:22:26 -0800
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
Subject: [PATCH v32 09/32] ALSA: usb-audio: Export USB SND APIs for modules
Date: Tue, 7 Jan 2025 17:21:50 -0800
Message-ID: <20250108012213.1659364-10-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
References: <20250108012213.1659364-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: VxyGJWVPwCXCw09jjJ2NNRdYOMzNagHK
X-Proofpoint-GUID: VxyGJWVPwCXCw09jjJ2NNRdYOMzNagHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080007

Some vendor modules will utilize useful parsing and endpoint management
APIs to start audio playback/capture.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c     |  4 +++
 sound/usb/endpoint.c |  1 +
 sound/usb/helper.c   |  1 +
 sound/usb/pcm.c      | 75 +++++++++++++++++++++++++++++++-------------
 sound/usb/pcm.h      | 11 +++++++
 5 files changed, 71 insertions(+), 21 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 9c411b82a218..a0087bde684c 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -1030,6 +1030,7 @@ int snd_usb_lock_shutdown(struct snd_usb_audio *chip)
 		wake_up(&chip->shutdown_wait);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_lock_shutdown);
 
 /* autosuspend and unlock the shutdown */
 void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
@@ -1038,6 +1039,7 @@ void snd_usb_unlock_shutdown(struct snd_usb_audio *chip)
 	if (atomic_dec_and_test(&chip->usage_count))
 		wake_up(&chip->shutdown_wait);
 }
+EXPORT_SYMBOL_GPL(snd_usb_unlock_shutdown);
 
 int snd_usb_autoresume(struct snd_usb_audio *chip)
 {
@@ -1060,6 +1062,7 @@ int snd_usb_autoresume(struct snd_usb_audio *chip)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_autoresume);
 
 void snd_usb_autosuspend(struct snd_usb_audio *chip)
 {
@@ -1073,6 +1076,7 @@ void snd_usb_autosuspend(struct snd_usb_audio *chip)
 	for (i = 0; i < chip->num_interfaces; i++)
 		usb_autopm_put_interface(chip->intf[i]);
 }
+EXPORT_SYMBOL_GPL(snd_usb_autosuspend);
 
 static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 {
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a29f28eb7d0c..1fed039b10ed 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1524,6 +1524,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	mutex_unlock(&chip->mutex);
 	return err;
 }
+EXPORT_SYMBOL_GPL(snd_usb_endpoint_prepare);
 
 /* get the current rate set to the given clock by any endpoint */
 int snd_usb_endpoint_get_clock_rate(struct snd_usb_audio *chip, int clock)
diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index 72b671fb2c84..497d2b27fb59 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -62,6 +62,7 @@ void *snd_usb_find_csint_desc(void *buffer, int buflen, void *after, u8 dsubtype
 	}
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(snd_usb_find_csint_desc);
 
 /*
  * Wrapper for usb_control_msg().
diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 08bf535ed163..18467da6fd9e 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -148,6 +148,16 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
 	return found;
 }
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+		    unsigned int rate, unsigned int channels, bool strict_match,
+		    struct snd_usb_substream *subs)
+{
+	return find_format(fmt_list_head, format, rate, channels, strict_match,
+			subs);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_format);
+
 static const struct audioformat *
 find_substream_format(struct snd_usb_substream *subs,
 		      const struct snd_pcm_hw_params *params)
@@ -157,6 +167,14 @@ find_substream_format(struct snd_usb_substream *subs,
 			   true, subs);
 }
 
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+			      const struct snd_pcm_hw_params *params)
+{
+	return find_substream_format(subs, params);
+}
+EXPORT_SYMBOL_GPL(snd_usb_find_substream_format);
+
 bool snd_usb_pcm_has_fixed_rate(struct snd_usb_substream *subs)
 {
 	const struct audioformat *fp;
@@ -461,20 +479,9 @@ static void close_endpoints(struct snd_usb_audio *chip,
 	}
 }
 
-/*
- * hw_params callback
- *
- * allocate a buffer and set the given audio format.
- *
- * so far we use a physically linear buffer although packetize transfer
- * doesn't need a continuous area.
- * if sg buffer is supported on the later version of alsa, we'll follow
- * that.
- */
-static int snd_usb_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+		      struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_audio *chip = subs->stream->chip;
 	const struct audioformat *fmt;
 	const struct audioformat *sync_fmt;
@@ -499,7 +506,7 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 	if (fmt->implicit_fb) {
 		sync_fmt = snd_usb_find_implicit_fb_sync_format(chip, fmt,
 								hw_params,
-								!substream->stream,
+								!subs->direction,
 								&sync_fixed_rate);
 		if (!sync_fmt) {
 			usb_audio_dbg(chip,
@@ -579,15 +586,28 @@ static int snd_usb_hw_params(struct snd_pcm_substream *substream,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_params);
 
 /*
- * hw_free callback
+ * hw_params callback
  *
- * reset the audio format and release the buffer
+ * allocate a buffer and set the given audio format.
+ *
+ * so far we use a physically linear buffer although packetize transfer
+ * doesn't need a continuous area.
+ * if sg buffer is supported on the later version of alsa, we'll follow
+ * that.
  */
-static int snd_usb_hw_free(struct snd_pcm_substream *substream)
+static int snd_usb_pcm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_params(subs, hw_params);
+}
+
+int snd_usb_hw_free(struct snd_usb_substream *subs)
+{
 	struct snd_usb_audio *chip = subs->stream->chip;
 
 	snd_media_stop_pipeline(subs);
@@ -603,6 +623,19 @@ static int snd_usb_hw_free(struct snd_pcm_substream *substream)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(snd_usb_hw_free);
+
+/*
+ * hw_free callback
+ *
+ * reset the audio format and release the buffer
+ */
+static int snd_usb_pcm_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_usb_substream *subs = substream->runtime->private_data;
+
+	return snd_usb_hw_free(subs);
+}
 
 /* free-wheeling mode? (e.g. dmix) */
 static int in_free_wheeling_mode(struct snd_pcm_runtime *runtime)
@@ -1746,8 +1779,8 @@ static int snd_usb_substream_capture_trigger(struct snd_pcm_substream *substream
 static const struct snd_pcm_ops snd_usb_playback_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_playback_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
@@ -1758,8 +1791,8 @@ static const struct snd_pcm_ops snd_usb_playback_ops = {
 static const struct snd_pcm_ops snd_usb_capture_ops = {
 	.open =		snd_usb_pcm_open,
 	.close =	snd_usb_pcm_close,
-	.hw_params =	snd_usb_hw_params,
-	.hw_free =	snd_usb_hw_free,
+	.hw_params =	snd_usb_pcm_hw_params,
+	.hw_free =	snd_usb_pcm_hw_free,
 	.prepare =	snd_usb_pcm_prepare,
 	.trigger =	snd_usb_substream_capture_trigger,
 	.sync_stop =	snd_usb_pcm_sync_stop,
diff --git a/sound/usb/pcm.h b/sound/usb/pcm.h
index 388fe2ba346d..c096021adb2b 100644
--- a/sound/usb/pcm.h
+++ b/sound/usb/pcm.h
@@ -15,4 +15,15 @@ void snd_usb_preallocate_buffer(struct snd_usb_substream *subs);
 int snd_usb_audioformat_set_sync_ep(struct snd_usb_audio *chip,
 				    struct audioformat *fmt);
 
+const struct audioformat *
+snd_usb_find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
+		    unsigned int rate, unsigned int channels, bool strict_match,
+		    struct snd_usb_substream *subs);
+const struct audioformat *
+snd_usb_find_substream_format(struct snd_usb_substream *subs,
+			      const struct snd_pcm_hw_params *params);
+
+int snd_usb_hw_params(struct snd_usb_substream *subs,
+		      struct snd_pcm_hw_params *hw_params);
+int snd_usb_hw_free(struct snd_usb_substream *subs);
 #endif /* __USBAUDIO_PCM_H */

