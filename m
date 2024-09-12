Return-Path: <linux-input+bounces-6452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 468709771C1
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 21:42:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB98C1F250F0
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 19:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29191C3308;
	Thu, 12 Sep 2024 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AdWemD4H"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0C1BFDF6;
	Thu, 12 Sep 2024 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726170020; cv=none; b=IaQJ1eOcPnFgLhWj+DTF91FPCnFkvoSyrIsoP9clEVL8x2Al6piT6rF3x6l8KlVI3XzdM+W1oyFCTlPBy5vULF9jZE7UKeyRr82hL83gW7hl0DeRgOF6XL0qIu5AuuHQYrlDTl/8fHb6fuQbY3d8D4VCzvSr2Pxgzqgm7hY0hyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726170020; c=relaxed/simple;
	bh=kuXvZj2O2+6sLb6+HCTWSvVJ9L05ubY9bD4DgQROLzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nm5087ancI0w2QHa6XVgEsg4mn+YDFpfVlo3bYHjmO4rAQYF5sjQ7QfzQCgrC4RN/rHsclB3XENLEt3MwI2bRPU5YpVIjz6Z1E9nIU9cjuzbR/Wfxr+9GVQmDs3W1ZRUP3aDihPgkwOTnd6AuqUMEgCkW8FCl98rEKLEn/5Qnks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AdWemD4H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CHsbXh000342;
	Thu, 12 Sep 2024 19:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5qz9jWyU4v1+Ht9Jgi80H4Z4CwhOfh2aqovq123O+U=; b=AdWemD4Hj+V9CPTx
	rDz5uJHNLvOqZrm3szs1PuEgO6GqpxIXkbSelFJpt9XoZfPlIW15llV/869h7GIy
	YPpT1TK9Nk8HBaXoKP9X2T2/5zCktCJWCVX5wient15zclsIer+Bigg2RdUfpwII
	J1lVZ8qPvnWKKmO0amntbKlxEdzkQgAdsFxWGsbc1Kz8Dy2FX00cdGcsB8rWePeV
	gRrfa98rElBtRnnPbsHYeLbPA9s6fgWvLoGmayCNi6YAL61JiEP5DWhGr7g3ihHu
	KjKvzLh2QgRlLy8iNc+8AwknX4/rYNf6DHHMXEcke4qPmnGjX9nYg5kw2hpd07r1
	FQ11cQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5e5rra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48CJdonI003545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 19:39:51 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 12:39:50 -0700
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
Subject: [PATCH v27 14/32] ASoC: Add SOC USB APIs for adding an USB backend
Date: Thu, 12 Sep 2024 12:39:17 -0700
Message-ID: <20240912193935.1916426-15-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 20SUXjYpHVFxdhxoLQtWN9FwjaYmXYb4
X-Proofpoint-GUID: 20SUXjYpHVFxdhxoLQtWN9FwjaYmXYb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120144

Some platforms may have support for offloading USB audio devices to a
dedicated audio DSP.  Introduce a set of APIs that allow for management of
USB sound card and PCM devices enumerated by the USB SND class driver.
This allows for the ASoC components to be aware of what USB devices are
available for offloading.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  97 ++++++++++++++++++
 sound/soc/Kconfig       |  10 ++
 sound/soc/Makefile      |   2 +
 sound/soc/soc-usb.c     | 218 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 327 insertions(+)
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/soc-usb.c

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
new file mode 100644
index 000000000000..34240321bbca
--- /dev/null
+++ b/include/sound/soc-usb.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __LINUX_SND_SOC_USB_H
+#define __LINUX_SND_SOC_USB_H
+
+#include <sound/soc.h>
+
+/**
+ * struct snd_soc_usb_device
+ * @card_idx - sound card index associated with USB device
+ * @chip_idx - USB sound chip array index
+ * @cpcm_idx - capture PCM index array associated with USB device
+ * @ppcm_idx - playback PCM index array associated with USB device
+ * @num_capture - number of capture streams
+ * @num_playback - number of playback streams
+ * @list - list head for SoC USB devices
+ **/
+struct snd_soc_usb_device {
+	int card_idx;
+	int chip_idx;
+
+	/* PCM index arrays */
+	unsigned int *cpcm_idx; /* TODO: capture path is not tested yet */
+	unsigned int *ppcm_idx;
+	int num_capture; /* TODO: capture path is not tested yet */
+	int num_playback;
+
+	struct list_head list;
+};
+
+/**
+ * struct snd_soc_usb
+ * @list - list head for SND SOC struct list
+ * @component - reference to ASoC component
+ * @connection_status_cb - callback to notify connection events
+ * @priv_data - driver data
+ **/
+struct snd_soc_usb {
+	struct list_head list;
+	struct snd_soc_component *component;
+	int (*connection_status_cb)(struct snd_soc_usb *usb,
+				    struct snd_soc_usb_device *sdev,
+				    bool connected);
+	void *priv_data;
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_USB)
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
+void *snd_soc_usb_find_priv_data(struct device *usbdev);
+
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      void *data);
+void snd_soc_usb_free_port(struct snd_soc_usb *usb);
+void snd_soc_usb_add_port(struct snd_soc_usb *usb);
+void snd_soc_usb_remove_port(struct snd_soc_usb *usb);
+#else
+static inline int snd_soc_usb_connect(struct device *usbdev,
+				      struct snd_soc_usb_device *sdev)
+{
+	return -ENODEV;
+}
+
+static inline int snd_soc_usb_disconnect(struct device *usbdev,
+					 struct snd_soc_usb_device *sdev)
+{
+	return -EINVAL;
+}
+
+static inline void *snd_soc_usb_find_priv_data(struct device *usbdev)
+{
+	return NULL;
+}
+
+static inline struct snd_soc_usb *
+snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
+{
+	return ERR_PTR(-ENOMEM);
+}
+
+static inline void snd_soc_usb_free_port(struct snd_soc_usb *usb)
+{ }
+
+static inline void snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	return -EINVAL;
+}
+
+static inline void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{
+	return -ENODEV;
+}
+#endif /* IS_ENABLED(CONFIG_SND_SOC_USB) */
+#endif /*__LINUX_SND_SOC_USB_H */
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index a52afb423b46..c993705c8ac2 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -84,6 +84,16 @@ config SND_SOC_UTILS_KUNIT_TEST
 config SND_SOC_ACPI
 	tristate
 
+config SND_SOC_USB
+	tristate "SoC based USB audio offloading"
+	depends on SND_USB_AUDIO
+	help
+	  Enable this option if an ASoC platform card has support to handle
+	  USB audio offloading.  This enables the SoC USB layer, which will
+	  notifies the ASoC USB DPCM backend DAI link about available USB audio
+	  devices.  Based on the notifications, sequences to enable the audio
+	  stream can be taken based on the design.
+
 # All the supported SoCs
 source "sound/soc/adi/Kconfig"
 source "sound/soc/amd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index fd61847dd1eb..adf9d9203778 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -35,6 +35,8 @@ endif
 
 obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
 
+obj-$(CONFIG_SND_SOC_USB) += soc-usb.o
+
 obj-$(CONFIG_SND_SOC)	+= snd-soc-core.o
 obj-$(CONFIG_SND_SOC)	+= codecs/
 obj-$(CONFIG_SND_SOC)	+= generic/
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
new file mode 100644
index 000000000000..bd2d68164206
--- /dev/null
+++ b/sound/soc/soc-usb.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/of.h>
+#include <linux/usb.h>
+#include <sound/soc-usb.h>
+#include "../usb/card.h"
+
+static DEFINE_MUTEX(ctx_mutex);
+static LIST_HEAD(usb_ctx_list);
+
+static struct device_node *snd_soc_find_phandle(struct device *dev)
+{
+	struct device_node *node;
+
+	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);
+	if (!node)
+		return ERR_PTR(-ENODEV);
+
+	return node;
+}
+
+static struct snd_soc_usb *snd_soc_usb_ctx_lookup(struct device_node *node)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!node)
+		return NULL;
+
+	mutex_lock(&ctx_mutex);
+	list_for_each_entry(ctx, &usb_ctx_list, list) {
+		if (ctx->component->dev->of_node == node) {
+			mutex_unlock(&ctx_mutex);
+			return ctx;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+
+	return NULL;
+}
+
+static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
+{
+	struct snd_soc_usb *ctx;
+	struct device_node *node;
+
+	node = snd_soc_find_phandle(dev);
+	if (!IS_ERR(node)) {
+		ctx = snd_soc_usb_ctx_lookup(node);
+		of_node_put(node);
+	} else {
+		ctx = snd_soc_usb_ctx_lookup(dev->of_node);
+	}
+
+	return ctx ? ctx : NULL;
+}
+
+/**
+ * snd_soc_usb_find_priv_data() - Retrieve private data stored
+ * @usbdev: device reference
+ *
+ * Fetch the private data stored in the USB SND SOC structure.
+ *
+ */
+void *snd_soc_usb_find_priv_data(struct device *usbdev)
+{
+	struct snd_soc_usb *ctx;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+
+	return ctx ? ctx->priv_data : NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
+
+/**
+ * snd_soc_usb_allocate_port() - allocate a SOC USB port for offloading support
+ * @component: USB DPCM backend DAI component
+ * @num_streams: number of offloading sessions supported
+ * @data: private data
+ *
+ * Allocate and initialize a SOC USB port.  The SOC USB port is used to communicate
+ * different USB audio devices attached, in order to start audio offloading handled
+ * by an ASoC entity.  USB device plug in/out events are signaled with a
+ * notification, but don't directly impact the memory allocated for the SOC USB
+ * port.
+ *
+ */
+struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
+					      void *data)
+{
+	struct snd_soc_usb *usb;
+
+	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
+	if (!usb)
+		return ERR_PTR(-ENOMEM);
+
+	usb->component = component;
+	usb->priv_data = data;
+
+	return usb;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
+
+/**
+ * snd_soc_usb_free_port() - free a SOC USB port used for offloading support
+ * @usb: allocated SOC USB port
+
+ * Free and remove the SOC USB port from the available list of ports.  This will
+ * ensure that the communication between USB SND and ASoC is halted.
+ *
+ */
+void snd_soc_usb_free_port(struct snd_soc_usb *usb)
+{
+	snd_soc_usb_remove_port(usb);
+	kfree(usb);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
+
+/**
+ * snd_soc_usb_add_port() - Add a USB backend port
+ * @usb: soc usb port to add
+ *
+ * Register a USB backend DAI link to the USB SOC framework.  Memory is allocated
+ * as part of the USB backend DAI link.
+ *
+ */
+void snd_soc_usb_add_port(struct snd_soc_usb *usb)
+{
+	mutex_lock(&ctx_mutex);
+	list_add_tail(&usb->list, &usb_ctx_list);
+	mutex_unlock(&ctx_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
+
+/**
+ * snd_soc_usb_remove_port() - Remove a USB backend port
+ * @usb: soc usb port to remove
+ *
+ * Remove a USB backend DAI link from USB SOC.  Memory is freed when USB backend
+ * DAI is removed, or when snd_soc_usb_free_port() is called.
+ *
+ */
+void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{
+	struct snd_soc_usb *ctx, *tmp;
+
+	mutex_lock(&ctx_mutex);
+	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
+		if (ctx == usb) {
+			list_del(&ctx->list);
+			break;
+		}
+	}
+	mutex_unlock(&ctx_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
+
+/**
+ * snd_soc_usb_connect() - Notification of USB device connection
+ * @usbdev: USB bus device
+ * @sdev: USB SND device to add
+ *
+ * Notify of a new USB SND device connection.  The sdev->card_idx can be used to
+ * handle how the DPCM backend selects, which device to enable USB offloading
+ * on.
+ *
+ */
+int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (IS_ERR(ctx))
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, true);
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
+
+/**
+ * snd_soc_usb_disconnect() - Notification of USB device disconnection
+ * @usbdev: USB bus device
+ * @sdev: USB SND device to remove
+ *
+ * Notify of a new USB SND device disconnection to the USB backend.
+ *
+ */
+int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev)
+{
+	struct snd_soc_usb *ctx;
+
+	if (!usbdev)
+		return -ENODEV;
+
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (IS_ERR(ctx))
+		return -ENODEV;
+
+	mutex_lock(&ctx_mutex);
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, false);
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SoC USB driver for offloading");

