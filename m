Return-Path: <linux-input+bounces-11524-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1763A7B4AF
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B0B6174CA5
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C5C1F8EF7;
	Fri,  4 Apr 2025 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UsvC3CQe"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595251F4191;
	Fri,  4 Apr 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726488; cv=none; b=g7aW//eqAUV72cyq+0QmQVsTCTGNiPaZ9aaTA0E1zpcydqcQ9HEb674xGrZJmSlT5zRC3Cw+lkvls8MxuYQPlZDMct7KK7TQR7+PoA3LSkquaWsTAHCGIb8xX9+44EWZLN8/z+Dfqs5dO1zj89XU0lqLg17jHqIfkx+pM5vU3kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726488; c=relaxed/simple;
	bh=IhN48XexCvm/Gob4nOCumiplN7ixuwIjKGInmiRM6Mw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=djmZKwsb6tgTu9Lp5ifsj542F5btmTniUJIEZ/DLu4nCwdlmkM7/DVX4xqbw5buscHxzB03uBLeSHqiUDsQYoA3zaHQRUCwGaCagHiq+Lsg3LK1CamJfh64H3RLBUVGe7KqohnMuXJX2XiUnx6lHIEXXaaSIAN1bo7SAqz9h8wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UsvC3CQe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXiK1031303;
	Fri, 4 Apr 2025 00:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3//3AxDNgCIlW3b084Po4RqJZ1vW5PwKW/kCf52RwRk=; b=UsvC3CQez+smM7OA
	S1o3+8S/dcrCH3JTS5K+dPqts+4GI9LKTcVAbiEcT1NnTy0ZyxsvB1Nr/4N1fJeV
	V3mftc/xROUMRuxiHqgIGQooh2dV5yjWZb794aJJiLkbidLbAfMxkgtpUI5K5EpS
	VMdWBLttVnSBUw2Tld0Czo6rlmnPPfR51ExBSeT5YMH8iXeAhn9u9UDneziAlx8E
	cPWP60H5EkiIBLKee4gUF1RIh0xoE5F91kFGxh1zO7GUPXOgpfauKmo1uu+IGTsg
	qTjV7GqKqcWm+rRxx64v/aXZA2wm/PDzU4N1jTQVdDY9sMNtPJoToIZIIJGzANyT
	uGlwLQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d908qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340RhTR012106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:43 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:42 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v37 14/31] ASoC: Add SoC USB APIs for adding an USB backend
Date: Thu, 3 Apr 2025 17:27:11 -0700
Message-ID: <20250404002728.3590501-15-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: -EAlNwJTpTbVUXKDgicQPurdp2c5NlXU
X-Proofpoint-GUID: -EAlNwJTpTbVUXKDgicQPurdp2c5NlXU
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=67ef2780 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8 a=hFlYR-wYSVHI17uSJ1AA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

Some platforms may have support for offloading USB audio devices to a
dedicated audio DSP.  Introduce a set of APIs that allow for management of
USB sound card and PCM devices enumerated by the USB SND class driver.
This allows for the ASoC components to be aware of what USB devices are
available for offloading.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 include/sound/soc-usb.h |  93 +++++++++++++++++
 sound/soc/Kconfig       |  10 ++
 sound/soc/Makefile      |   2 +
 sound/soc/soc-usb.c     | 219 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 324 insertions(+)
 create mode 100644 include/sound/soc-usb.h
 create mode 100644 sound/soc/soc-usb.c

diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
new file mode 100644
index 000000000000..a7be5d05218f
--- /dev/null
+++ b/include/sound/soc-usb.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __LINUX_SND_SOC_USB_H
+#define __LINUX_SND_SOC_USB_H
+
+#include <sound/soc.h>
+
+/**
+ * struct snd_soc_usb_device - SoC USB representation of a USB sound device
+ * @card_idx: sound card index associated with USB device
+ * @chip_idx: USB sound chip array index
+ * @cpcm_idx: capture PCM index array associated with USB device
+ * @ppcm_idx: playback PCM index array associated with USB device
+ * @num_capture: number of capture streams
+ * @num_playback: number of playback streams
+ * @list: list head for SoC USB devices
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
+ * struct snd_soc_usb - representation of a SoC USB backend entity
+ * @list: list head for SND SOC struct list
+ * @component: reference to ASoC component
+ * @connection_status_cb: callback to notify connection events
+ * @priv_data: driver data
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
+{ }
+
+static inline void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
+{ }
+#endif /* IS_ENABLED(CONFIG_SND_SOC_USB) */
+#endif /*__LINUX_SND_SOC_USB_H */
diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 8b7d51266f81..1b983c7006f1 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -91,6 +91,16 @@ config SND_SOC_OPS_KUNIT_TEST
 config SND_SOC_ACPI
 	tristate
 
+config SND_SOC_USB
+	tristate "SoC based USB audio offloading"
+	depends on SND_USB_AUDIO
+	help
+	  Enable this option if an ASoC platform card has support to handle
+	  USB audio offloading.  This enables the SoC USB layer, which will
+	  notify the ASoC USB DPCM backend DAI link about available USB audio
+	  devices.  Based on the notifications, sequences to enable the audio
+	  stream can be taken based on the design.
+
 # All the supported SoCs
 source "sound/soc/adi/Kconfig"
 source "sound/soc/amd/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 358e227c5ab6..462322c38aa4 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -39,6 +39,8 @@ endif
 
 obj-$(CONFIG_SND_SOC_ACPI) += snd-soc-acpi.o
 
+obj-$(CONFIG_SND_SOC_USB) += soc-usb.o
+
 obj-$(CONFIG_SND_SOC)	+= snd-soc-core.o
 obj-$(CONFIG_SND_SOC)	+= codecs/
 obj-$(CONFIG_SND_SOC)	+= generic/
diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
new file mode 100644
index 000000000000..edfc52c88b58
--- /dev/null
+++ b/sound/soc/soc-usb.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
+	list_for_each_entry(ctx, &usb_ctx_list, list) {
+		if (ctx->component->dev->of_node == node)
+			return ctx;
+	}
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
+ * Fetch the private data stored in the USB SND SoC structure.
+ *
+ */
+void *snd_soc_usb_find_priv_data(struct device *usbdev)
+{
+	struct snd_soc_usb *ctx;
+
+	mutex_lock(&ctx_mutex);
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	mutex_unlock(&ctx_mutex);
+
+	return ctx ? ctx->priv_data : NULL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
+
+/**
+ * snd_soc_usb_allocate_port() - allocate a SoC USB port for offloading support
+ * @component: USB DPCM backend DAI component
+ * @data: private data
+ *
+ * Allocate and initialize a SoC USB port.  The SoC USB port is used to communicate
+ * different USB audio devices attached, in order to start audio offloading handled
+ * by an ASoC entity.  USB device plug in/out events are signaled with a
+ * notification, but don't directly impact the memory allocated for the SoC USB
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
+ * snd_soc_usb_free_port() - free a SoC USB port used for offloading support
+ * @usb: allocated SoC USB port
+ *
+ * Free and remove the SoC USB port from the available list of ports.  This will
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
+ * Register a USB backend DAI link to the USB SoC framework.  Memory is allocated
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
+ * Remove a USB backend DAI link from USB SoC.  Memory is freed when USB backend
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
+	mutex_lock(&ctx_mutex);
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (!ctx)
+		goto exit;
+
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, true);
+
+exit:
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
+	mutex_lock(&ctx_mutex);
+	ctx = snd_soc_find_usb_ctx(usbdev);
+	if (!ctx)
+		goto exit;
+
+	if (ctx->connection_status_cb)
+		ctx->connection_status_cb(ctx, sdev, false);
+
+exit:
+	mutex_unlock(&ctx_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SoC USB driver for offloading");

