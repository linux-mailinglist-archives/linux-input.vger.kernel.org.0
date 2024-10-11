Return-Path: <linux-input+bounces-7333-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E199972E
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 02:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7CD28651A
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 00:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2949C1EABCF;
	Fri, 11 Oct 2024 00:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gQoz9Jiq"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A7917D2;
	Fri, 11 Oct 2024 00:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728605267; cv=none; b=Hu9aY/Z1jzNBR6RqulmlJMY+psenYnr0915uYG9dzLaYOl+mmAV4TA8ua7eZNLx2dEye155UGb8pLjn6UWRGNz6tkF23Zxfva+AdaR+fwXh0vmy+QsWNgwYydR+4BAyxAtGjLcsqcxZiyqkfOpQmqUw+UI6keA90tN9it/v9Lpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728605267; c=relaxed/simple;
	bh=6AqDjoRyqy6LqZrw6Wfm9KSKYephW441qNNZBK1XyFY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKz5QnADCrbLuMr0z32D/oHIX9xcE/0/sPHolWB1SkkRI+A7sD56Xa1Qs9NTauXhpM8ME6NYF7YWFaEKqNV0aQlYvReM3yXQ8lBnPBxLNyMev8IgFjiimLF+GDRxozwtcXrob0qdxOSiBuePOEWurC2i3FdmEs5R3j0+0bZSAfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gQoz9Jiq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJjWT4000930;
	Fri, 11 Oct 2024 00:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uab/+NaMfWEzUKyixsCiUSLJhDlynbFL9O2pQiQ0Y+Q=; b=gQoz9JiqiqL6ZKeE
	hTBKvCQTBy9OL+Mk6a0eCVfc9CH7TLkr7ychL597/kCLYsbV/r2m60jqvgJywjT+
	NW61CzdYCFAGieZQ0BMkyQT2VWYPbw02CdHByGcCp2HbZbhVZ3JyMTTnhUakJ7GZ
	EouZwMIsJpV5pGUZRYg72/rVkfMd58rExQoTEDXcMrEDe0Sar7bbk+Gs1dr/BwpQ
	0YpEI46jx9HTskArlZgD7lhboFxq+UhcgfQtNcl3RbQpt3zWl8f0SrPrRLaEsU82
	gjZ2LbTI2iF44tnQui4UvU0LaOXCwo9BV2ye7Hb2t+IU8GvrTX4wTfoUUB37irLg
	rEIz/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426nc2gepe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49B07HSh003451
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 00:07:17 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 17:07:16 -0700
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
Subject: [PATCH v28 26/32] ALSA: usb-audio: Introduce USB SND platform op callbacks
Date: Thu, 10 Oct 2024 17:06:36 -0700
Message-ID: <20241011000650.2585600-52-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
References: <20241011000650.2585600-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 0Qwu5yOj_2vVxexgh2Yerb2Ih7Yw52XA
X-Proofpoint-GUID: 0Qwu5yOj_2vVxexgh2Yerb2Ih7Yw52XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100159

Allow for different platforms to be notified on USB SND connect/disconnect
sequences.  This allows for platform USB SND modules to properly initialize
and populate internal structures with references to the USB SND chip
device.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/card.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 sound/usb/card.h | 10 ++++++++++
 2 files changed, 59 insertions(+)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 1f9dfcd8f336..326292f37841 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descriptor validation (default: no)
 static DEFINE_MUTEX(register_mutex);
 static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
 static struct usb_driver usb_audio_driver;
+static struct snd_usb_platform_ops *platform_ops;
+
+/*
+ * Register platform specific operations that will be notified on events
+ * which occur in USB SND.  The platform driver can utilize this path to
+ * enable features, such as USB audio offloading, which allows for audio data
+ * to be queued by an audio DSP.
+ *
+ * Only one set of platform operations can be registered to USB SND.  The
+ * platform register operation is protected by the register_mutex.
+ */
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
+{
+	guard(mutex)(&register_mutex);
+	if (platform_ops)
+		return -EEXIST;
+
+	platform_ops = ops;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
+
+/*
+ * Unregisters the current set of platform operations.  This allows for
+ * a new set to be registered if required.
+ *
+ * The platform unregister operation is protected by the register_mutex.
+ */
+int snd_usb_unregister_platform_ops(void)
+{
+	guard(mutex)(&register_mutex);
+	platform_ops = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
 
 /*
  * Checks to see if requested audio profile, i.e sample rate, # of
@@ -946,7 +982,11 @@ static int usb_audio_probe(struct usb_interface *intf,
 	chip->num_interfaces++;
 	usb_set_intfdata(intf, chip);
 	atomic_dec(&chip->active);
+
+	if (platform_ops && platform_ops->connect_cb)
+		platform_ops->connect_cb(chip);
 	mutex_unlock(&register_mutex);
+
 	return 0;
 
  __error:
@@ -983,6 +1023,9 @@ static void usb_audio_disconnect(struct usb_interface *intf)
 	card = chip->card;
 
 	mutex_lock(&register_mutex);
+	if (platform_ops && platform_ops->disconnect_cb)
+		platform_ops->disconnect_cb(chip);
+
 	if (atomic_inc_return(&chip->shutdown) == 1) {
 		struct snd_usb_stream *as;
 		struct snd_usb_endpoint *ep;
@@ -1130,6 +1173,9 @@ static int usb_audio_suspend(struct usb_interface *intf, pm_message_t message)
 		chip->system_suspend = chip->num_suspended_intf;
 	}
 
+	if (platform_ops && platform_ops->suspend_cb)
+		platform_ops->suspend_cb(intf, message);
+
 	return 0;
 }
 
@@ -1170,6 +1216,9 @@ static int usb_audio_resume(struct usb_interface *intf)
 
 	snd_usb_midi_v2_resume_all(chip);
 
+	if (platform_ops && platform_ops->resume_cb)
+		platform_ops->resume_cb(intf);
+
  out:
 	if (chip->num_suspended_intf == chip->system_suspend) {
 		snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
diff --git a/sound/usb/card.h b/sound/usb/card.h
index cdafc9e9cecd..d8b8522e1613 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -209,7 +209,17 @@ struct snd_usb_stream {
 	struct list_head list;
 };
 
+struct snd_usb_platform_ops {
+	void (*connect_cb)(struct snd_usb_audio *chip);
+	void (*disconnect_cb)(struct snd_usb_audio *chip);
+	void (*suspend_cb)(struct usb_interface *intf, pm_message_t message);
+	void (*resume_cb)(struct usb_interface *intf);
+};
+
 struct snd_usb_stream *
 snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params *params,
 				  int direction);
+
+int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
+int snd_usb_unregister_platform_ops(void);
 #endif /* __USBAUDIO_CARD_H */

