Return-Path: <linux-input+bounces-7462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AF99F9C2
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4B61F225F2
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BDC20F5A4;
	Tue, 15 Oct 2024 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CQYHqB0f"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C912076BD;
	Tue, 15 Oct 2024 21:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027808; cv=none; b=LQF8AnehE/A64tBLS7RIWsg7J5sIWepd8aPpIw6C/9lfTBINKKsOKj85+hHL2vb3UE7NBJ3Snj/LkUbFsmIq3phIWe6R0NlwDdUgo/oGhdbwTlYfbkEmb0Fq6a98Gju5IbfNj6zKi3sHAIitYOKjZLIChsyfvgXVEVT8+AYMWJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027808; c=relaxed/simple;
	bh=4trjLWNIb819U9eQL0MDWHTJ/XtRtL19cAMVtQHvDsY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eKZi079JeKh7ajadzchXnA6XtpQUgg2OZ5oRFEqlXhMan455tYn2q4RcEWIX01oVQXxzRFsV7ImQWe3TxZHvd7ucL92hayPV4G6i56BR2z7sk8MzuPF9U4VeM9cxmtUz+tXzNswJskL5hkgHLbK6mflcyuVCgW4Ci7I+TabmCac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CQYHqB0f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FCAMga019156;
	Tue, 15 Oct 2024 21:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2vezV3Zza/xgH0BZ3VNkKFXpb1xQQt3wj73SiZQny8c=; b=CQYHqB0fuWq+zJ4l
	qe9Vs/VvfXuVvxdmkC23K1MELy95RBM5ewDyhvnzTqHhR/UIdNWfPCdU1ygbBSj5
	M9offjYY25bGeVpyORdG0VYwBm6aUErZrb/lc6epbuGqP8/+LY9xXIjvcghT5yMe
	YvnDbDQNFZhn3es2W/xqgHLrGeZHmVlNDr0EL/gW1JhmSUDEm9G79m76oRCzNvPe
	FJGLRqyPvKb3wOGiZcUCacmSBrZDBcZnZ90hil6x8ilXviPi2hdNMzeHKz93n2zr
	JpOLkDBvjXVJFL9rIGC6InhTbTW+cls6h6VaM3VbsIllbiipYxd0M/luIcglDh4u
	Gt4nVQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rs470-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTZSV030558
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:35 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:34 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>
Subject: [PATCH v29 29/33] ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
Date: Tue, 15 Oct 2024 14:29:11 -0700
Message-ID: <20241015212915.1206789-30-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4HYzia4CpYYIzW0NXZNWqijgWWTU-BBb
X-Proofpoint-GUID: 4HYzia4CpYYIzW0NXZNWqijgWWTU-BBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143

Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
support USB sound devices.  This vendor driver will implement the required
handshaking with the DSP, in order to pass along required resources that
will be utilized by the DSP's USB SW.  The communication channel used for
this handshaking will be using the QMI protocol.  Required resources
include:
- Allocated secondary event ring address
- EP transfer ring address
- Interrupter number

The above information will allow for the audio DSP to execute USB transfers
over the USB bus.  It will also be able to support devices that have an
implicit feedback and sync endpoint as well.  Offloading these data
transfers will allow the main/applications processor to enter lower CPU
power modes, and sustain a longer duration in those modes.

Audio offloading is initiated with the following sequence:
1. Userspace configures to route audio playback to USB backend and starts
playback on the platform soundcard.
2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
port.
3. This results in a QMI packet with a STREAM enable command.
4. The QC audio offload driver will fetch the required resources, and pass
this information as part of the QMI response to the STREAM enable command.
5. Once the QMI response is received the audio DSP will start queuing data
on the USB bus.

As part of step#2, the audio DSP is aware of the USB SND card and pcm
device index that is being selected, and is communicated as part of the QMI
request received by QC audio offload.  These indices will be used to handle
the stream enable QMI request.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/Kconfig                 |   15 +
 sound/usb/Makefile                |    2 +-
 sound/usb/qcom/Makefile           |    2 +
 sound/usb/qcom/qc_audio_offload.c | 1957 +++++++++++++++++++++++++++++
 4 files changed, 1975 insertions(+), 1 deletion(-)
 create mode 100644 sound/usb/qcom/Makefile
 create mode 100644 sound/usb/qcom/qc_audio_offload.c

diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
index 4a9569a3a39a..5cc3eaf53e6b 100644
--- a/sound/usb/Kconfig
+++ b/sound/usb/Kconfig
@@ -176,6 +176,21 @@ config SND_BCD2000
 	  To compile this driver as a module, choose M here: the module
 	  will be called snd-bcd2000.
 
+config SND_USB_AUDIO_QMI
+	tristate "Qualcomm Audio Offload driver"
+	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
+	select SND_PCM
+	help
+	  Say Y here to enable the Qualcomm USB audio offloading feature.
+
+	  This module sets up the required QMI stream enable/disable
+	  responses to requests generated by the audio DSP.  It passes the
+	  USB transfer resource references, so that the audio DSP can issue
+	  USB transfers to the host controller.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called snd-usb-audio-qmi.
+
 source "sound/usb/line6/Kconfig"
 
 endif	# SND_USB
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 0532499dbc6d..54a06a2f73ca 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -34,5 +34,5 @@ obj-$(CONFIG_SND_USB_UA101) += snd-usbmidi-lib.o
 obj-$(CONFIG_SND_USB_USX2Y) += snd-usbmidi-lib.o
 obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
 
-obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/
+obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
 obj-$(CONFIG_SND_USB_LINE6)	+= line6/
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
new file mode 100644
index 000000000000..a81c9b28d484
--- /dev/null
+++ b/sound/usb/qcom/Makefile
@@ -0,0 +1,2 @@
+snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
+obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
\ No newline at end of file
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
new file mode 100644
index 000000000000..ca5be81a7fbd
--- /dev/null
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -0,0 +1,1957 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/ctype.h>
+#include <linux/dma-mapping.h>
+#include <linux/dma-map-ops.h>
+#include <linux/init.h>
+#include <linux/iommu.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/soc/qcom/qmi.h>
+#include <linux/usb.h>
+#include <linux/usb/audio.h>
+#include <linux/usb/audio-v2.h>
+#include <linux/usb/audio-v3.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/quirks.h>
+#include <linux/usb/xhci-sideband.h>
+
+#include <sound/control.h>
+#include <sound/core.h>
+#include <sound/info.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/q6usboffload.h>
+#include <sound/soc.h>
+#include <sound/soc-usb.h>
+
+#include "../usbaudio.h"
+#include "../card.h"
+#include "../endpoint.h"
+#include "../format.h"
+#include "../helper.h"
+#include "../pcm.h"
+#include "../power.h"
+
+#include "usb_audio_qmi_v01.h"
+
+/* Stream disable request timeout during USB device disconnect */
+#define DEV_RELEASE_WAIT_TIMEOUT 10000 /* in ms */
+
+/* Data interval calculation parameters */
+#define BUS_INTERVAL_FULL_SPEED 1000 /* in us */
+#define BUS_INTERVAL_HIGHSPEED_AND_ABOVE 125 /* in us */
+#define MAX_BINTERVAL_ISOC_EP 16
+
+#define QMI_STREAM_REQ_CARD_NUM_MASK 0xffff0000
+#define QMI_STREAM_REQ_DEV_NUM_MASK 0xff00
+#define QMI_STREAM_REQ_DIRECTION 0xff
+
+/* iommu resource parameters and management */
+#define PREPEND_SID_TO_IOVA(iova, sid) ((u64)(((u64)(iova)) | \
+					(((u64)sid) << 32)))
+#define IOVA_MASK(iova) (((u64)(iova)) & 0xFFFFFFFF)
+#define IOVA_BASE 0x1000
+#define IOVA_XFER_RING_BASE (IOVA_BASE + PAGE_SIZE * (SNDRV_CARDS + 1))
+#define IOVA_XFER_BUF_BASE (IOVA_XFER_RING_BASE + PAGE_SIZE * SNDRV_CARDS * 32)
+#define IOVA_XFER_RING_MAX (IOVA_XFER_BUF_BASE - PAGE_SIZE)
+#define IOVA_XFER_BUF_MAX (0xfffff000 - PAGE_SIZE)
+
+#define MAX_XFER_BUFF_LEN (24 * PAGE_SIZE)
+
+struct iova_info {
+	struct list_head list;
+	unsigned long start_iova;
+	size_t size;
+	bool in_use;
+};
+
+struct intf_info {
+	unsigned long data_xfer_ring_va;
+	size_t data_xfer_ring_size;
+	unsigned long sync_xfer_ring_va;
+	size_t sync_xfer_ring_size;
+	unsigned long xfer_buf_va;
+	size_t xfer_buf_size;
+	phys_addr_t xfer_buf_pa;
+	unsigned int data_ep_pipe;
+	unsigned int sync_ep_pipe;
+	u8 *xfer_buf;
+	u8 intf_num;
+	u8 pcm_card_num;
+	u8 pcm_dev_num;
+	u8 direction;
+	bool in_use;
+};
+
+struct uaudio_qmi_dev {
+	struct device *dev;
+	struct q6usb_offload *data;
+
+	/* list to keep track of available iova */
+	struct list_head xfer_ring_list;
+	size_t xfer_ring_iova_size;
+	unsigned long curr_xfer_ring_iova;
+	struct list_head xfer_buf_list;
+	size_t xfer_buf_iova_size;
+	unsigned long curr_xfer_buf_iova;
+
+	/* bit fields representing pcm card enabled */
+	unsigned long card_slot;
+	/* indicate event ring mapped or not */
+	bool er_mapped;
+	/* reference count to number of possible consumers */
+	atomic_t qdev_in_use;
+};
+
+struct uaudio_dev {
+	struct usb_device *udev;
+	/* audio control interface */
+	struct usb_host_interface *ctrl_intf;
+	unsigned int usb_core_id;
+	atomic_t in_use;
+	struct kref kref;
+	wait_queue_head_t disconnect_wq;
+
+	/* interface specific */
+	int num_intf;
+	struct intf_info *info;
+	struct snd_usb_audio *chip;
+
+	/* xhci sideband */
+	struct xhci_sideband *sb;
+
+	/* SoC USB device */
+	struct snd_soc_usb_device *sdev;
+};
+
+static struct uaudio_dev uadev[SNDRV_CARDS];
+static struct uaudio_qmi_dev *uaudio_qdev;
+static struct uaudio_qmi_svc *uaudio_svc;
+static DEFINE_MUTEX(qdev_mutex);
+
+struct uaudio_qmi_svc {
+	struct qmi_handle *uaudio_svc_hdl;
+	struct sockaddr_qrtr client_sq;
+	bool client_connected;
+};
+
+enum mem_type {
+	MEM_EVENT_RING,
+	MEM_XFER_RING,
+	MEM_XFER_BUF,
+};
+
+/* Supported audio formats */
+enum usb_qmi_audio_format {
+	USB_QMI_PCM_FORMAT_S8 = 0,
+	USB_QMI_PCM_FORMAT_U8,
+	USB_QMI_PCM_FORMAT_S16_LE,
+	USB_QMI_PCM_FORMAT_S16_BE,
+	USB_QMI_PCM_FORMAT_U16_LE,
+	USB_QMI_PCM_FORMAT_U16_BE,
+	USB_QMI_PCM_FORMAT_S24_LE,
+	USB_QMI_PCM_FORMAT_S24_BE,
+	USB_QMI_PCM_FORMAT_U24_LE,
+	USB_QMI_PCM_FORMAT_U24_BE,
+	USB_QMI_PCM_FORMAT_S24_3LE,
+	USB_QMI_PCM_FORMAT_S24_3BE,
+	USB_QMI_PCM_FORMAT_U24_3LE,
+	USB_QMI_PCM_FORMAT_U24_3BE,
+	USB_QMI_PCM_FORMAT_S32_LE,
+	USB_QMI_PCM_FORMAT_S32_BE,
+	USB_QMI_PCM_FORMAT_U32_LE,
+	USB_QMI_PCM_FORMAT_U32_BE,
+};
+
+static int usb_qmi_get_pcm_num(struct snd_usb_audio *chip, int direction)
+{
+	struct snd_usb_substream *subs = NULL;
+	struct snd_usb_stream *as;
+	int count = 0;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[direction];
+		if (subs->ep_num)
+			count++;
+	}
+
+	return count;
+}
+
+static enum usb_qmi_audio_device_speed_enum_v01
+get_speed_info(enum usb_device_speed udev_speed)
+{
+	switch (udev_speed) {
+	case USB_SPEED_LOW:
+		return USB_QMI_DEVICE_SPEED_LOW_V01;
+	case USB_SPEED_FULL:
+		return USB_QMI_DEVICE_SPEED_FULL_V01;
+	case USB_SPEED_HIGH:
+		return USB_QMI_DEVICE_SPEED_HIGH_V01;
+	case USB_SPEED_SUPER:
+		return USB_QMI_DEVICE_SPEED_SUPER_V01;
+	case USB_SPEED_SUPER_PLUS:
+		return USB_QMI_DEVICE_SPEED_SUPER_PLUS_V01;
+	default:
+		return USB_QMI_DEVICE_SPEED_INVALID_V01;
+	}
+}
+
+static struct snd_usb_substream *find_substream(unsigned int card_num,
+						unsigned int pcm_idx,
+						unsigned int direction)
+{
+	struct snd_usb_substream *subs = NULL;
+	struct snd_usb_audio *chip;
+	struct snd_usb_stream *as;
+
+	chip = uadev[card_num].chip;
+	if (!chip || atomic_read(&chip->shutdown))
+		goto done;
+
+	if (pcm_idx >= chip->pcm_devs)
+		goto done;
+
+	if (direction > SNDRV_PCM_STREAM_CAPTURE)
+		goto done;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		if (as->pcm_index == pcm_idx) {
+			subs = &as->substream[direction];
+			goto done;
+		}
+	}
+
+done:
+	return subs;
+}
+
+static int info_idx_from_ifnum(int card_num, int intf_num, bool enable)
+{
+	int i;
+
+	/*
+	 * default index 0 is used when info is allocated upon
+	 * first enable audio stream req for a pcm device
+	 */
+	if (enable && !uadev[card_num].info)
+		return 0;
+
+	for (i = 0; i < uadev[card_num].num_intf; i++) {
+		if (enable && !uadev[card_num].info[i].in_use)
+			return i;
+		else if (!enable &&
+			 uadev[card_num].info[i].intf_num == intf_num)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int get_data_interval_from_si(struct snd_usb_substream *subs,
+				     u32 service_interval)
+{
+	unsigned int bus_intval_mult;
+	unsigned int bus_intval;
+	unsigned int binterval;
+
+	if (subs->dev->speed >= USB_SPEED_HIGH)
+		bus_intval = BUS_INTERVAL_HIGHSPEED_AND_ABOVE;
+	else
+		bus_intval = BUS_INTERVAL_FULL_SPEED;
+
+	if (service_interval % bus_intval)
+		return -EINVAL;
+
+	bus_intval_mult = service_interval / bus_intval;
+	binterval = ffs(bus_intval_mult);
+	if (!binterval || binterval > MAX_BINTERVAL_ISOC_EP)
+		return -EINVAL;
+
+	/* check if another bit is set then bail out */
+	bus_intval_mult = bus_intval_mult >> binterval;
+	if (bus_intval_mult)
+		return -EINVAL;
+
+	return (binterval - 1);
+}
+
+/* maps audio format received over QMI to asound.h based pcm format */
+static snd_pcm_format_t map_pcm_format(enum usb_qmi_audio_format fmt_received)
+{
+	switch (fmt_received) {
+	case USB_QMI_PCM_FORMAT_S8:
+		return SNDRV_PCM_FORMAT_S8;
+	case USB_QMI_PCM_FORMAT_U8:
+		return SNDRV_PCM_FORMAT_U8;
+	case USB_QMI_PCM_FORMAT_S16_LE:
+		return SNDRV_PCM_FORMAT_S16_LE;
+	case USB_QMI_PCM_FORMAT_S16_BE:
+		return SNDRV_PCM_FORMAT_S16_BE;
+	case USB_QMI_PCM_FORMAT_U16_LE:
+		return SNDRV_PCM_FORMAT_U16_LE;
+	case USB_QMI_PCM_FORMAT_U16_BE:
+		return SNDRV_PCM_FORMAT_U16_BE;
+	case USB_QMI_PCM_FORMAT_S24_LE:
+		return SNDRV_PCM_FORMAT_S24_LE;
+	case USB_QMI_PCM_FORMAT_S24_BE:
+		return SNDRV_PCM_FORMAT_S24_BE;
+	case USB_QMI_PCM_FORMAT_U24_LE:
+		return SNDRV_PCM_FORMAT_U24_LE;
+	case USB_QMI_PCM_FORMAT_U24_BE:
+		return SNDRV_PCM_FORMAT_U24_BE;
+	case USB_QMI_PCM_FORMAT_S24_3LE:
+		return SNDRV_PCM_FORMAT_S24_3LE;
+	case USB_QMI_PCM_FORMAT_S24_3BE:
+		return SNDRV_PCM_FORMAT_S24_3BE;
+	case USB_QMI_PCM_FORMAT_U24_3LE:
+		return SNDRV_PCM_FORMAT_U24_3LE;
+	case USB_QMI_PCM_FORMAT_U24_3BE:
+		return SNDRV_PCM_FORMAT_U24_3BE;
+	case USB_QMI_PCM_FORMAT_S32_LE:
+		return SNDRV_PCM_FORMAT_S32_LE;
+	case USB_QMI_PCM_FORMAT_S32_BE:
+		return SNDRV_PCM_FORMAT_S32_BE;
+	case USB_QMI_PCM_FORMAT_U32_LE:
+		return SNDRV_PCM_FORMAT_U32_LE;
+	case USB_QMI_PCM_FORMAT_U32_BE:
+		return SNDRV_PCM_FORMAT_U32_BE;
+	default:
+		/*
+		 * We expect the caller to do input validation so we should
+		 * never hit this. But we do have to return a proper
+		 * snd_pcm_format_t value due to the __bitwise attribute; so
+		 * just return the equivalent of 0 in case of bad input.
+		 */
+		return SNDRV_PCM_FORMAT_S8;
+	}
+}
+
+/* Offloading IOMMU management */
+static unsigned long uaudio_get_iova(unsigned long *curr_iova,
+				     size_t *curr_iova_size,
+				     struct list_head *head, size_t size)
+{
+	struct iova_info *info, *new_info = NULL;
+	struct list_head *curr_head;
+	size_t tmp_size = size;
+	unsigned long va = 0;
+	bool found = false;
+
+	if (size % PAGE_SIZE)
+		goto done;
+
+	if (size > *curr_iova_size)
+		goto done;
+
+	if (*curr_iova_size == 0)
+		goto done;
+
+	list_for_each_entry(info, head, list) {
+		/* exact size iova_info */
+		if (!info->in_use && info->size == size) {
+			info->in_use = true;
+			va = info->start_iova;
+			*curr_iova_size -= size;
+			found = true;
+			goto done;
+		} else if (!info->in_use && tmp_size >= info->size) {
+			if (!new_info)
+				new_info = info;
+			tmp_size -= info->size;
+			if (tmp_size)
+				continue;
+
+			va = new_info->start_iova;
+			for (curr_head = &new_info->list; curr_head !=
+			&info->list; curr_head = curr_head->next) {
+				new_info = list_entry(curr_head, struct
+						iova_info, list);
+				new_info->in_use = true;
+			}
+			info->in_use = true;
+			*curr_iova_size -= size;
+			found = true;
+			goto done;
+		} else {
+			/* iova region in use */
+			new_info = NULL;
+			tmp_size = size;
+		}
+	}
+
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info) {
+		va = 0;
+		goto done;
+	}
+
+	va = *curr_iova;
+	info->start_iova = *curr_iova;
+	info->size = size;
+	info->in_use = true;
+	*curr_iova += size;
+	*curr_iova_size -= size;
+	found = true;
+	list_add_tail(&info->list, head);
+
+done:
+	return va;
+}
+
+static void uaudio_put_iova(unsigned long va, size_t size, struct list_head
+	*head, size_t *curr_iova_size)
+{
+	struct iova_info *info;
+	size_t tmp_size = size;
+	bool found = false;
+
+	list_for_each_entry(info, head, list) {
+		if (info->start_iova == va) {
+			if (!info->in_use)
+				return;
+
+			found = true;
+			info->in_use = false;
+			if (info->size == size)
+				goto done;
+		}
+
+		if (found && tmp_size >= info->size) {
+			info->in_use = false;
+			tmp_size -= info->size;
+			if (!tmp_size)
+				goto done;
+		}
+	}
+
+	if (!found)
+		return;
+
+done:
+	*curr_iova_size += size;
+}
+
+/**
+ * uaudio_iommu_unmap() - unmaps iommu memory for adsp
+ * @mtype: ring type
+ * @va: virtual address to unmap
+ * @iova_size: region size
+ * @mapped_iova_size: mapped region size
+ *
+ * Unmaps the memory region that was previously assigned to the adsp.
+ *
+ */
+static void uaudio_iommu_unmap(enum mem_type mtype, unsigned long va,
+			       size_t iova_size, size_t mapped_iova_size)
+{
+	size_t umap_size;
+	bool unmap = true;
+
+	if (!va || !iova_size)
+		return;
+
+	switch (mtype) {
+	case MEM_EVENT_RING:
+		if (uaudio_qdev->er_mapped)
+			uaudio_qdev->er_mapped = false;
+		else
+			unmap = false;
+		break;
+
+	case MEM_XFER_RING:
+		uaudio_put_iova(va, iova_size, &uaudio_qdev->xfer_ring_list,
+				&uaudio_qdev->xfer_ring_iova_size);
+		break;
+	case MEM_XFER_BUF:
+		uaudio_put_iova(va, iova_size, &uaudio_qdev->xfer_buf_list,
+				&uaudio_qdev->xfer_buf_iova_size);
+		break;
+	default:
+		unmap = false;
+	}
+
+	if (!unmap || !mapped_iova_size)
+		return;
+
+	umap_size = iommu_unmap(uaudio_qdev->data->domain, va, mapped_iova_size);
+	if (umap_size != mapped_iova_size)
+		dev_err(uaudio_qdev->data->dev,
+			"unmapped size %zu for iova 0x%08lx of mapped size %zu\n",
+			umap_size, va, mapped_iova_size);
+}
+
+/**
+ * uaudio_iommu_map() - maps iommu memory for adsp
+ * @mtype: ring type
+ * @dma_coherent: dma coherent
+ * @pa: physical address for ring/buffer
+ * @size: size of memory region
+ * @sgt: sg table for memory region
+ *
+ * Maps the XHCI related resources to a memory region that is assigned to be
+ * used by the adsp.  This will be mapped to the domain, which is created by
+ * the ASoC USB backend driver.
+ *
+ */
+static unsigned long uaudio_iommu_map(enum mem_type mtype, bool dma_coherent,
+				      phys_addr_t pa, size_t size,
+				      struct sg_table *sgt)
+{
+	struct scatterlist *sg;
+	unsigned long va = 0;
+	size_t total_len = 0;
+	unsigned long va_sg;
+	phys_addr_t pa_sg;
+	bool map = true;
+	size_t sg_len;
+	int prot;
+	int ret;
+	int i;
+
+	prot = IOMMU_READ | IOMMU_WRITE;
+
+	if (dma_coherent)
+		prot |= IOMMU_CACHE;
+
+	switch (mtype) {
+	case MEM_EVENT_RING:
+		va = IOVA_BASE;
+		/* er already mapped */
+		if (uaudio_qdev->er_mapped)
+			map = false;
+		break;
+	case MEM_XFER_RING:
+		va = uaudio_get_iova(&uaudio_qdev->curr_xfer_ring_iova,
+				     &uaudio_qdev->xfer_ring_iova_size,
+				     &uaudio_qdev->xfer_ring_list, size);
+		break;
+	case MEM_XFER_BUF:
+		va = uaudio_get_iova(&uaudio_qdev->curr_xfer_buf_iova,
+				     &uaudio_qdev->xfer_buf_iova_size,
+				     &uaudio_qdev->xfer_buf_list, size);
+		break;
+	default:
+		dev_err(uaudio_qdev->data->dev, "unknown mem type %d\n", mtype);
+	}
+
+	if (!va || !map)
+		goto done;
+
+	if (!sgt)
+		goto skip_sgt_map;
+
+	va_sg = va;
+	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
+		sg_len = PAGE_ALIGN(sg->offset + sg->length);
+		pa_sg = page_to_phys(sg_page(sg));
+		ret = iommu_map(uaudio_qdev->data->domain, va_sg, pa_sg, sg_len,
+				prot, GFP_KERNEL);
+		if (ret) {
+			uaudio_iommu_unmap(MEM_XFER_BUF, va, size, total_len);
+			va = 0;
+			goto done;
+		}
+
+		va_sg += sg_len;
+		total_len += sg_len;
+	}
+
+	if (size != total_len) {
+		uaudio_iommu_unmap(MEM_XFER_BUF, va, size, total_len);
+		va = 0;
+	}
+	return va;
+
+skip_sgt_map:
+	iommu_map(uaudio_qdev->data->domain, va, pa, size, prot, GFP_KERNEL);
+
+done:
+	return va;
+}
+
+/* looks up alias, if any, for controller DT node and returns the index */
+static int usb_get_controller_id(struct usb_device *udev)
+{
+	if (udev->bus->sysdev && udev->bus->sysdev->of_node)
+		return of_alias_get_id(udev->bus->sysdev->of_node, "usb");
+
+	return -ENODEV;
+}
+
+/**
+ * uaudio_dev_intf_cleanup() - cleanup transfer resources
+ * @udev: usb device
+ * @info: usb offloading interface
+ *
+ * Cleans up the transfer ring related resources which are assigned per
+ * endpoint from XHCI.  This is invoked when the USB endpoints are no
+ * longer in use by the adsp.
+ *
+ */
+static void uaudio_dev_intf_cleanup(struct usb_device *udev, struct intf_info *info)
+{
+	uaudio_iommu_unmap(MEM_XFER_RING, info->data_xfer_ring_va,
+			   info->data_xfer_ring_size, info->data_xfer_ring_size);
+	info->data_xfer_ring_va = 0;
+	info->data_xfer_ring_size = 0;
+
+	uaudio_iommu_unmap(MEM_XFER_RING, info->sync_xfer_ring_va,
+			   info->sync_xfer_ring_size, info->sync_xfer_ring_size);
+	info->sync_xfer_ring_va = 0;
+	info->sync_xfer_ring_size = 0;
+
+	uaudio_iommu_unmap(MEM_XFER_BUF, info->xfer_buf_va, info->xfer_buf_size,
+			   info->xfer_buf_size);
+	info->xfer_buf_va = 0;
+
+	usb_free_coherent(udev, info->xfer_buf_size, info->xfer_buf,
+			  info->xfer_buf_pa);
+	info->xfer_buf_size = 0;
+	info->xfer_buf = NULL;
+	info->xfer_buf_pa = 0;
+
+	info->in_use = false;
+}
+
+/**
+ * uaudio_event_ring_cleanup_free() - cleanup secondary event ring
+ * @dev: usb offload device
+ *
+ * Cleans up the secondary event ring that was requested.  This will
+ * occur when the adsp is no longer transferring data on the USB bus
+ * across all endpoints.
+ *
+ */
+static void uaudio_event_ring_cleanup_free(struct uaudio_dev *dev)
+{
+	clear_bit(dev->chip->card->number, &uaudio_qdev->card_slot);
+	/* all audio devices are disconnected */
+	if (!uaudio_qdev->card_slot) {
+		uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE,
+				   PAGE_SIZE);
+		xhci_sideband_remove_interrupter(uadev[dev->chip->card->number].sb);
+	}
+}
+
+static void uaudio_dev_cleanup(struct uaudio_dev *dev)
+{
+	int if_idx;
+
+	if (!dev->udev)
+		return;
+
+	/* free xfer buffer and unmap xfer ring and buf per interface */
+	for (if_idx = 0; if_idx < dev->num_intf; if_idx++) {
+		if (!dev->info[if_idx].in_use)
+			continue;
+		uaudio_dev_intf_cleanup(dev->udev, &dev->info[if_idx]);
+		dev_dbg(uaudio_qdev->data->dev,
+			"release resources: intf# %d card# %d\n",
+			dev->info[if_idx].intf_num, dev->chip->card->number);
+	}
+
+	dev->num_intf = 0;
+
+	/* free interface info */
+	kfree(dev->info);
+	dev->info = NULL;
+	uaudio_event_ring_cleanup_free(dev);
+	dev->udev = NULL;
+}
+
+/**
+ * disable_audio_stream() - disable usb snd endpoints
+ * @subs: usb substream
+ *
+ * Closes the USB SND endpoints associated with the current audio stream
+ * used.  This will decrement the USB SND endpoint opened reference count.
+ *
+ */
+static void disable_audio_stream(struct snd_usb_substream *subs)
+{
+	struct snd_usb_audio *chip = subs->stream->chip;
+
+	snd_usb_hw_free(subs);
+	snd_usb_autosuspend(chip);
+}
+
+/* QMI service disconnect handlers */
+static void qmi_stop_session(void)
+{
+	struct snd_usb_substream *subs;
+	struct usb_host_endpoint *ep;
+	struct snd_usb_audio *chip;
+	struct intf_info *info;
+	int pcm_card_num;
+	int if_idx;
+	int idx;
+
+	mutex_lock(&qdev_mutex);
+	/* find all active intf for set alt 0 and cleanup usb audio dev */
+	for (idx = 0; idx < SNDRV_CARDS; idx++) {
+		if (!atomic_read(&uadev[idx].in_use))
+			continue;
+
+		chip = uadev[idx].chip;
+		for (if_idx = 0; if_idx < uadev[idx].num_intf; if_idx++) {
+			if (!uadev[idx].info || !uadev[idx].info[if_idx].in_use)
+				continue;
+			info = &uadev[idx].info[if_idx];
+			pcm_card_num = info->pcm_card_num;
+			subs = find_substream(pcm_card_num, info->pcm_dev_num,
+					      info->direction);
+			if (!subs || !chip || atomic_read(&chip->shutdown)) {
+				dev_err(&subs->dev->dev,
+					"no sub for c#%u dev#%u dir%u\n",
+					info->pcm_card_num,
+					info->pcm_dev_num,
+					info->direction);
+				continue;
+			}
+			/* Release XHCI endpoints */
+			if (info->data_ep_pipe)
+				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+						       info->data_ep_pipe);
+			xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
+
+			if (info->sync_ep_pipe)
+				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+						       info->sync_ep_pipe);
+			xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
+
+			disable_audio_stream(subs);
+		}
+		atomic_set(&uadev[idx].in_use, 0);
+		mutex_lock(&chip->mutex);
+		uaudio_dev_cleanup(&uadev[idx]);
+		mutex_unlock(&chip->mutex);
+	}
+	mutex_unlock(&qdev_mutex);
+}
+
+/**
+ * qmi_bye_cb() - qmi bye message callback
+ * @handle: QMI handle
+ * @node: id of the dying node
+ *
+ * This callback is invoked when the QMI bye control message is received
+ * from the QMI client.  Handle the message accordingly by ensuring that
+ * the USB offload path is disabled and cleaned up.  At this point, ADSP
+ * is not utilizing the USB bus.
+ *
+ */
+static void qmi_bye_cb(struct qmi_handle *handle, unsigned int node)
+{
+	struct uaudio_qmi_svc *svc = uaudio_svc;
+
+	if (svc->uaudio_svc_hdl != handle)
+		return;
+
+	if (svc->client_connected && svc->client_sq.sq_node == node) {
+		qmi_stop_session();
+
+		/* clear QMI client parameters to block further QMI messages */
+		svc->client_sq.sq_node = 0;
+		svc->client_sq.sq_port = 0;
+		svc->client_sq.sq_family = 0;
+		svc->client_connected = false;
+	}
+}
+
+/**
+ * qmi_svc_disconnect_cb() - qmi client disconnected
+ * @handle: QMI handle
+ * @node: id of the dying node
+ * @port: port of the dying client
+ *
+ * Invoked when the remote QMI client is disconnected.  Handle this event
+ * the same way as when the QMI bye message is received.  This will ensure
+ * the USB offloading path is disabled and cleaned up.
+ *
+ */
+static void qmi_svc_disconnect_cb(struct qmi_handle *handle,
+				  unsigned int node, unsigned int port)
+{
+	struct uaudio_qmi_svc *svc;
+
+	if (!uaudio_svc)
+		return;
+
+	svc = uaudio_svc;
+	if (svc->uaudio_svc_hdl != handle)
+		return;
+
+	if (svc->client_connected && svc->client_sq.sq_node == node &&
+	    svc->client_sq.sq_port == port) {
+		qmi_stop_session();
+
+		/* clear QMI client parameters to block further QMI messages */
+		svc->client_sq.sq_node = 0;
+		svc->client_sq.sq_port = 0;
+		svc->client_sq.sq_family = 0;
+		svc->client_connected = false;
+	}
+}
+
+/* QMI client callback handlers from QMI interface */
+static struct qmi_ops uaudio_svc_ops_options = {
+	.bye = qmi_bye_cb,
+	.del_client = qmi_svc_disconnect_cb,
+};
+
+/* kref release callback when all streams are disabled */
+static void uaudio_dev_release(struct kref *kref)
+{
+	struct uaudio_dev *dev = container_of(kref, struct uaudio_dev, kref);
+
+	uaudio_event_ring_cleanup_free(dev);
+	atomic_set(&dev->in_use, 0);
+	wake_up(&dev->disconnect_wq);
+}
+
+/**
+ * enable_audio_stream() - enable usb snd endpoints
+ * @subs: usb substream
+ * @pcm_format: pcm format requested
+ * @channels: number of channels
+ * @cur_rate: sample rate
+ * @datainterval: interval
+ *
+ * Opens all USB SND endpoints used for the data interface.  This will increment
+ * the USB SND endpoint's opened count.  Requests to keep the interface resumed
+ * until the audio stream is stopped.  Will issue the USB set interface control
+ * message to enable the data interface.
+ *
+ */
+static int enable_audio_stream(struct snd_usb_substream *subs,
+			       snd_pcm_format_t pcm_format,
+			       unsigned int channels, unsigned int cur_rate,
+			       int datainterval)
+{
+	struct snd_pcm_hw_params params;
+	struct snd_usb_audio *chip;
+	struct snd_interval *i;
+	struct snd_mask *m;
+	int ret;
+
+	chip = subs->stream->chip;
+
+	_snd_pcm_hw_params_any(&params);
+
+	m = hw_param_mask(&params, SNDRV_PCM_HW_PARAM_FORMAT);
+	snd_mask_leave(m, pcm_format);
+
+	i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	snd_interval_setinteger(i);
+	i->min = channels;
+	i->max = channels;
+
+	i = hw_param_interval(&params, SNDRV_PCM_HW_PARAM_RATE);
+	snd_interval_setinteger(i);
+	i->min = cur_rate;
+	i->max = cur_rate;
+
+	pm_runtime_barrier(&chip->intf[0]->dev);
+	snd_usb_autoresume(chip);
+
+	ret = snd_usb_hw_params(subs, &params);
+	if (ret < 0)
+		goto put_suspend;
+
+	if (!atomic_read(&chip->shutdown)) {
+		ret = snd_usb_lock_shutdown(chip);
+		if (ret < 0)
+			goto detach_ep;
+
+		if (subs->sync_endpoint) {
+			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
+			if (ret < 0)
+				goto unlock;
+		}
+
+		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
+		if (ret < 0)
+			goto unlock;
+
+		snd_usb_unlock_shutdown(chip);
+
+		dev_dbg(uaudio_qdev->data->dev,
+			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
+			subs->direction ? "capture" : "playback",
+			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
+			(1 << subs->cur_audiofmt->datainterval) *
+			(subs->dev->speed >= USB_SPEED_HIGH ?
+			BUS_INTERVAL_HIGHSPEED_AND_ABOVE :
+			BUS_INTERVAL_FULL_SPEED));
+	}
+
+	return 0;
+
+unlock:
+	snd_usb_unlock_shutdown(chip);
+
+detach_ep:
+	snd_usb_hw_free(subs);
+
+put_suspend:
+	snd_usb_autosuspend(chip);
+
+	return ret;
+}
+
+/* returns usb hcd sysdev */
+static struct device *usb_get_usb_backend(struct usb_device *udev)
+{
+	if (udev->bus->sysdev && udev->bus->sysdev->of_node)
+		return udev->bus->sysdev;
+
+	return NULL;
+}
+
+/**
+ * uaudio_transfer_buffer_setup() - fetch and populate xfer buffer params
+ * @subs: usb substream
+ * @xfer_buf: xfer buf to be allocated
+ * @xfer_buf_len: size of allocation
+ * @mem_info: QMI response info
+ *
+ * Allocates and maps the transfer buffers that will be utilized by the
+ * audio DSP.  Will populate the information in the QMI response that is
+ * sent back to the stream enable request.
+ *
+ */
+static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
+					u8 *xfer_buf, u32 xfer_buf_len,
+					struct mem_info_v01 *mem_info)
+{
+	struct sg_table xfer_buf_sgt;
+	phys_addr_t xfer_buf_pa;
+	u32 len = xfer_buf_len;
+	bool dma_coherent;
+	unsigned long va;
+	u32 remainder;
+	u32 mult;
+	int ret;
+
+	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
+
+	/* xfer buffer, multiple of 4K only */
+	if (!len)
+		len = PAGE_SIZE;
+
+	mult = len / PAGE_SIZE;
+	remainder = len % PAGE_SIZE;
+	len = mult * PAGE_SIZE;
+	len += remainder ? PAGE_SIZE : 0;
+
+	if (len > MAX_XFER_BUFF_LEN) {
+		dev_err(uaudio_qdev->data->dev,
+			"req buf len %d > max buf len %lu, setting %lu\n",
+			len, MAX_XFER_BUFF_LEN, MAX_XFER_BUFF_LEN);
+		len = MAX_XFER_BUFF_LEN;
+	}
+
+	xfer_buf = usb_alloc_coherent(subs->dev, len, GFP_KERNEL, &xfer_buf_pa);
+	if (!xfer_buf)
+		return -ENOMEM;
+
+	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
+			xfer_buf_pa, len);
+	va = uaudio_iommu_map(MEM_XFER_BUF, dma_coherent, xfer_buf_pa, len,
+			      &xfer_buf_sgt);
+	if (!va) {
+		ret = -ENOMEM;
+		goto unmap_sync;
+	}
+
+	mem_info->pa = xfer_buf_pa;
+	mem_info->size = len;
+	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	sg_free_table(&xfer_buf_sgt);
+
+	return 0;
+
+unmap_sync:
+	usb_free_coherent(subs->dev, len, xfer_buf, xfer_buf_pa);
+
+	return ret;
+}
+
+/**
+ * uaudio_endpoint_setup() - fetch and populate endpoint params
+ * @subs: usb substream
+ * @endpoint: usb endpoint to add
+ * @card_num: uadev index
+ * @mem_info: QMI response info
+ * @ep_desc: QMI ep desc response field
+ *
+ * Initialize the USB endpoint being used for a particular USB
+ * stream.  Will request XHCI sideband to reserve the EP for
+ * offloading as well as populating the QMI response with the
+ * transfer ring parameters.
+ *
+ */
+static phys_addr_t
+uaudio_endpoint_setup(struct snd_usb_substream *subs,
+		      struct snd_usb_endpoint *endpoint, int card_num,
+		      struct mem_info_v01 *mem_info,
+		      struct usb_endpoint_descriptor_v01 *ep_desc)
+{
+	struct usb_host_endpoint *ep;
+	phys_addr_t tr_pa = 0;
+	struct sg_table *sgt;
+	bool dma_coherent;
+	unsigned long va;
+	struct page *pg;
+	int ret;
+
+	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
+
+	ep = usb_pipe_endpoint(subs->dev, endpoint->pipe);
+	if (!ep) {
+		dev_err(uaudio_qdev->data->dev, "data ep # %d context is null\n",
+			subs->data_endpoint->ep_num);
+		goto exit;
+	}
+
+	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
+
+	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
+	if (ret < 0) {
+		dev_err(&subs->dev->dev,
+			"failed to add data ep to sideband\n");
+		ret = -ENODEV;
+		goto exit;
+	}
+
+	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
+	if (!sgt) {
+		dev_err(&subs->dev->dev,
+			"failed to get data ep ring address\n");
+		ret = -ENODEV;
+		goto remove_ep;
+	}
+
+	pg = sg_page(sgt->sgl);
+	tr_pa = page_to_phys(pg);
+	mem_info->pa = sg_dma_address(sgt->sgl);
+	sg_free_table(sgt);
+
+	/* data transfer ring */
+	va = uaudio_iommu_map(MEM_XFER_RING, dma_coherent, tr_pa,
+			      PAGE_SIZE, NULL);
+	if (!va) {
+		ret = -ENOMEM;
+		goto clear_pa;
+	}
+
+	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	mem_info->size = PAGE_SIZE;
+
+	return 0;
+
+clear_pa:
+	mem_info->pa = 0;
+remove_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, ep);
+exit:
+	return ret;
+}
+
+/**
+ * uaudio_event_ring_setup() - fetch and populate event ring params
+ * @subs: usb substream
+ * @card_num: uadev index
+ * @mem_info: QMI response info
+ *
+ * Register secondary interrupter to XHCI and fetch the event buffer info
+ * and populate the information into the QMI response.
+ *
+ */
+static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
+				   int card_num, struct mem_info_v01 *mem_info)
+{
+	struct sg_table *sgt;
+	phys_addr_t er_pa;
+	bool dma_coherent;
+	unsigned long va;
+	struct page *pg;
+	int ret;
+
+	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
+	er_pa = 0;
+
+	/* event ring */
+	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
+					       0, uaudio_qdev->data->intr_num);
+	if (ret < 0) {
+		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
+		goto exit;
+	}
+
+	sgt = xhci_sideband_get_event_buffer(uadev[card_num].sb);
+	if (!sgt) {
+		dev_err(&subs->dev->dev,
+			"failed to get event ring address\n");
+		ret = -ENODEV;
+		goto remove_interrupter;
+	}
+
+	pg = sg_page(sgt->sgl);
+	er_pa = page_to_phys(pg);
+	mem_info->pa = sg_dma_address(sgt->sgl);
+	sg_free_table(sgt);
+
+	va = uaudio_iommu_map(MEM_EVENT_RING, dma_coherent, er_pa,
+			      PAGE_SIZE, NULL);
+	if (!va) {
+		ret = -ENOMEM;
+		goto clear_pa;
+	}
+
+	mem_info->va = PREPEND_SID_TO_IOVA(va, uaudio_qdev->data->sid);
+	mem_info->size = PAGE_SIZE;
+
+	return 0;
+
+clear_pa:
+	mem_info->pa = 0;
+remove_interrupter:
+	xhci_sideband_remove_interrupter(uadev[card_num].sb);
+exit:
+	return ret;
+}
+
+/**
+ * uaudio_populate_uac_desc() - parse UAC parameters and populate QMI resp
+ * @subs: usb substream
+ * @resp: QMI response buffer
+ *
+ * Parses information specified within UAC descriptors which explain the
+ * sample parameters that the device expects.  This information is populated
+ * to the QMI response sent back to the audio DSP.
+ *
+ */
+static int uaudio_populate_uac_desc(struct snd_usb_substream *subs,
+				    struct qmi_uaudio_stream_resp_msg_v01 *resp)
+{
+	struct usb_interface_descriptor *altsd;
+	struct usb_host_interface *alts;
+	struct usb_interface *iface;
+	int protocol;
+
+	iface = usb_ifnum_to_if(subs->dev, subs->cur_audiofmt->iface);
+	if (!iface) {
+		dev_err(&subs->dev->dev, "interface # %d does not exist\n",
+			subs->cur_audiofmt->iface);
+		return -ENODEV;
+	}
+
+	alts = &iface->altsetting[subs->cur_audiofmt->altset_idx];
+	altsd = get_iface_desc(alts);
+	protocol = altsd->bInterfaceProtocol;
+
+	if (protocol == UAC_VERSION_1) {
+		struct uac1_as_header_descriptor *as;
+
+		as = snd_usb_find_csint_desc(alts->extra, alts->extralen, NULL,
+					     UAC_AS_GENERAL);
+		if (!as) {
+			dev_err(&subs->dev->dev,
+				"%u:%d : no UAC_AS_GENERAL desc\n",
+				subs->cur_audiofmt->iface,
+				subs->cur_audiofmt->altset_idx);
+			return -ENODEV;
+		}
+
+		resp->data_path_delay = as->bDelay;
+		resp->data_path_delay_valid = 1;
+
+		resp->usb_audio_subslot_size = subs->cur_audiofmt->fmt_sz;
+		resp->usb_audio_subslot_size_valid = 1;
+
+		resp->usb_audio_spec_revision = le16_to_cpu(0x0100);
+		resp->usb_audio_spec_revision_valid = 1;
+	} else if (protocol == UAC_VERSION_2) {
+		resp->usb_audio_subslot_size = subs->cur_audiofmt->fmt_sz;
+		resp->usb_audio_subslot_size_valid = 1;
+
+		resp->usb_audio_spec_revision = le16_to_cpu(0x0200);
+		resp->usb_audio_spec_revision_valid = 1;
+	} else if (protocol == UAC_VERSION_3) {
+		if (iface->intf_assoc->bFunctionSubClass ==
+					UAC3_FUNCTION_SUBCLASS_FULL_ADC_3_0) {
+			dev_err(&subs->dev->dev,
+				"full adc is not supported\n");
+			return -EINVAL;
+		}
+
+		switch (le16_to_cpu(get_endpoint(alts, 0)->wMaxPacketSize)) {
+		case UAC3_BADD_EP_MAXPSIZE_SYNC_MONO_16:
+		case UAC3_BADD_EP_MAXPSIZE_SYNC_STEREO_16:
+		case UAC3_BADD_EP_MAXPSIZE_ASYNC_MONO_16:
+		case UAC3_BADD_EP_MAXPSIZE_ASYNC_STEREO_16: {
+			resp->usb_audio_subslot_size = 0x2;
+			break;
+		}
+
+		case UAC3_BADD_EP_MAXPSIZE_SYNC_MONO_24:
+		case UAC3_BADD_EP_MAXPSIZE_SYNC_STEREO_24:
+		case UAC3_BADD_EP_MAXPSIZE_ASYNC_MONO_24:
+		case UAC3_BADD_EP_MAXPSIZE_ASYNC_STEREO_24: {
+			resp->usb_audio_subslot_size = 0x3;
+			break;
+		}
+
+		default:
+			dev_err(&subs->dev->dev,
+				"%d: %u: Invalid wMaxPacketSize\n",
+				subs->cur_audiofmt->iface,
+				subs->cur_audiofmt->altset_idx);
+			return -EINVAL;
+		}
+		resp->usb_audio_subslot_size_valid = 1;
+	} else {
+		dev_err(&subs->dev->dev, "unknown protocol version %x\n",
+			protocol);
+		return -ENODEV;
+	}
+
+	memcpy(&resp->std_as_opr_intf_desc, &alts->desc, sizeof(alts->desc));
+
+	return 0;
+}
+
+/**
+ * prepare_qmi_response() - prepare stream enable response
+ * @subs: usb substream
+ * @req_msg: QMI request message
+ * @resp: QMI response buffer
+ * @info_idx: usb interface array index
+ *
+ * Prepares the QMI response for a USB QMI stream enable request.  Will parse
+ * out the parameters within the stream enable request, in order to match
+ * requested audio profile to the ones exposed by the USB device connected.
+ *
+ * In addition, will fetch the XHCI transfer resources needed for the handoff to
+ * happen.  This includes, transfer ring and buffer addresses and secondary event
+ * ring address.  These parameters will be communicated as part of the USB QMI
+ * stream enable response.
+ *
+ */
+static int prepare_qmi_response(struct snd_usb_substream *subs,
+				struct qmi_uaudio_stream_req_msg_v01 *req_msg,
+				struct qmi_uaudio_stream_resp_msg_v01 *resp,
+				int info_idx)
+{
+	struct q6usb_offload *data;
+	u32 xfer_buf_len;
+	int pcm_dev_num;
+	int card_num;
+	u8 *xfer_buf;
+	int ret;
+
+	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
+	xfer_buf_len = req_msg->xfer_buff_size;
+	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
+
+	if (!uadev[card_num].ctrl_intf) {
+		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
+		ret = -ENODEV;
+		goto err;
+	}
+
+	ret = uaudio_populate_uac_desc(subs, resp);
+	if (ret < 0)
+		goto err;
+
+	resp->slot_id = subs->dev->slot_id;
+	resp->slot_id_valid = 1;
+
+	data = snd_soc_usb_find_priv_data(usb_get_usb_backend(subs->dev));
+	if (!data)
+		goto err;
+
+	uaudio_qdev->data = data;
+
+	resp->std_as_opr_intf_desc_valid = 1;
+	ret = uaudio_endpoint_setup(subs, subs->data_endpoint, card_num,
+				    &resp->xhci_mem_info.tr_data,
+				    &resp->std_as_data_ep_desc);
+	if (ret < 0)
+		goto err;
+
+	resp->std_as_data_ep_desc_valid = 1;
+
+	if (subs->sync_endpoint) {
+		ret = uaudio_endpoint_setup(subs, subs->sync_endpoint, card_num,
+					    &resp->xhci_mem_info.tr_sync,
+					    &resp->std_as_sync_ep_desc);
+		if (ret < 0)
+			goto drop_data_ep;
+
+		resp->std_as_sync_ep_desc_valid = 1;
+	}
+
+	resp->interrupter_num_valid = 1;
+	resp->controller_num_valid = 0;
+	ret = usb_get_controller_id(subs->dev);
+	if (ret >= 0) {
+		resp->controller_num = ret;
+		resp->controller_num_valid = 1;
+	}
+
+	/* event ring */
+	ret = uaudio_event_ring_setup(subs, card_num,
+				      &resp->xhci_mem_info.evt_ring);
+	if (ret < 0)
+		goto drop_sync_ep;
+
+	uaudio_qdev->er_mapped = true;
+	resp->interrupter_num = xhci_sideband_interrupter_id(uadev[card_num].sb);
+
+	resp->speed_info = get_speed_info(subs->dev->speed);
+	if (resp->speed_info == USB_QMI_DEVICE_SPEED_INVALID_V01) {
+		ret = -ENODEV;
+		goto free_sec_ring;
+	}
+
+	resp->speed_info_valid = 1;
+
+	ret = uaudio_transfer_buffer_setup(subs, xfer_buf, req_msg->xfer_buff_size,
+					   &resp->xhci_mem_info.xfer_buff);
+	if (ret < 0) {
+		ret = -ENOMEM;
+		goto free_sec_ring;
+	}
+
+	resp->xhci_mem_info_valid = 1;
+
+	if (!atomic_read(&uadev[card_num].in_use)) {
+		kref_init(&uadev[card_num].kref);
+		init_waitqueue_head(&uadev[card_num].disconnect_wq);
+		uadev[card_num].num_intf =
+			subs->dev->config->desc.bNumInterfaces;
+		uadev[card_num].info = kcalloc(uadev[card_num].num_intf,
+					       sizeof(struct intf_info),
+					       GFP_KERNEL);
+		if (!uadev[card_num].info) {
+			ret = -ENOMEM;
+			goto unmap_er;
+		}
+		uadev[card_num].udev = subs->dev;
+		atomic_set(&uadev[card_num].in_use, 1);
+	} else {
+		kref_get(&uadev[card_num].kref);
+	}
+
+	uadev[card_num].usb_core_id = resp->controller_num;
+
+	/* cache intf specific info to use it for unmap and free xfer buf */
+	uadev[card_num].info[info_idx].data_xfer_ring_va =
+					IOVA_MASK(resp->xhci_mem_info.tr_data.va);
+	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
+	uadev[card_num].info[info_idx].sync_xfer_ring_va =
+					IOVA_MASK(resp->xhci_mem_info.tr_sync.va);
+	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
+	uadev[card_num].info[info_idx].xfer_buf_va =
+					IOVA_MASK(resp->xhci_mem_info.xfer_buff.va);
+	uadev[card_num].info[info_idx].xfer_buf_pa =
+					resp->xhci_mem_info.xfer_buff.pa;
+	uadev[card_num].info[info_idx].xfer_buf_size =
+					resp->xhci_mem_info.xfer_buff.size;
+	uadev[card_num].info[info_idx].data_ep_pipe = subs->data_endpoint ?
+						subs->data_endpoint->pipe : 0;
+	uadev[card_num].info[info_idx].sync_ep_pipe = subs->sync_endpoint ?
+						subs->sync_endpoint->pipe : 0;
+	uadev[card_num].info[info_idx].xfer_buf = xfer_buf;
+	uadev[card_num].info[info_idx].pcm_card_num = card_num;
+	uadev[card_num].info[info_idx].pcm_dev_num = pcm_dev_num;
+	uadev[card_num].info[info_idx].direction = subs->direction;
+	uadev[card_num].info[info_idx].intf_num = subs->cur_audiofmt->iface;
+	uadev[card_num].info[info_idx].in_use = true;
+
+	set_bit(card_num, &uaudio_qdev->card_slot);
+
+	return 0;
+
+unmap_er:
+	uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE, PAGE_SIZE);
+free_sec_ring:
+	xhci_sideband_remove_interrupter(uadev[card_num].sb);
+drop_sync_ep:
+	if (subs->sync_endpoint) {
+		uaudio_iommu_unmap(MEM_XFER_RING,
+				   IOVA_MASK(resp->xhci_mem_info.tr_sync.va),
+				   PAGE_SIZE, PAGE_SIZE);
+		xhci_sideband_remove_endpoint(uadev[card_num].sb,
+			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
+	}
+drop_data_ep:
+	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.va),
+			   PAGE_SIZE, PAGE_SIZE);
+	xhci_sideband_remove_endpoint(uadev[card_num].sb,
+			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));
+
+err:
+	return ret;
+}
+
+/**
+ * handle_uaudio_stream_req() - handle stream enable/disable request
+ * @handle: QMI client handle
+ * @sq: qrtr socket
+ * @txn: QMI transaction context
+ * @decoded_msg: decoded QMI message
+ *
+ * Main handler for the QMI stream enable/disable requests.  This executes the
+ * corresponding enable/disable stream apis, respectively.
+ *
+ */
+static void handle_uaudio_stream_req(struct qmi_handle *handle,
+				     struct sockaddr_qrtr *sq,
+				     struct qmi_txn *txn,
+				     const void *decoded_msg)
+{
+	struct qmi_uaudio_stream_req_msg_v01 *req_msg;
+	struct qmi_uaudio_stream_resp_msg_v01 resp = {{0}, 0};
+	struct uaudio_qmi_svc *svc = uaudio_svc;
+	struct snd_usb_audio *chip = NULL;
+	struct snd_usb_substream *subs;
+	struct usb_host_endpoint *ep;
+	int datainterval = -EINVAL;
+	int info_idx = -EINVAL;
+	struct intf_info *info;
+	u8 pcm_card_num;
+	u8 pcm_dev_num;
+	u8 direction;
+	int ret = 0;
+
+	if (!svc->client_connected) {
+		svc->client_sq = *sq;
+		svc->client_connected = true;
+	}
+
+	mutex_lock(&qdev_mutex);
+	req_msg = (struct qmi_uaudio_stream_req_msg_v01 *)decoded_msg;
+	if (!req_msg->audio_format_valid || !req_msg->bit_rate_valid ||
+	    !req_msg->number_of_ch_valid || !req_msg->xfer_buff_size_valid) {
+		ret = -EINVAL;
+		goto response;
+	}
+
+	if (!uaudio_qdev) {
+		ret = -EINVAL;
+		goto response;
+	}
+
+	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
+	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
+	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
+	if (pcm_card_num >= SNDRV_CARDS) {
+		ret = -EINVAL;
+		goto response;
+	}
+
+	if (req_msg->audio_format > USB_QMI_PCM_FORMAT_U32_BE) {
+		ret = -EINVAL;
+		goto response;
+	}
+
+	subs = find_substream(pcm_card_num, pcm_dev_num, direction);
+	chip = uadev[pcm_card_num].chip;
+	if (!subs || !chip || atomic_read(&chip->shutdown)) {
+		ret = -ENODEV;
+		goto response;
+	}
+
+	info_idx = info_idx_from_ifnum(pcm_card_num, subs->cur_audiofmt ?
+			subs->cur_audiofmt->iface : -1, req_msg->enable);
+	if (atomic_read(&chip->shutdown) || !subs->stream || !subs->stream->pcm ||
+	    !subs->stream->chip) {
+		ret = -ENODEV;
+		goto response;
+	}
+
+	if (req_msg->enable) {
+		if (info_idx < 0 || chip->system_suspend) {
+			ret = -EBUSY;
+			goto response;
+		}
+	}
+
+	if (req_msg->service_interval_valid) {
+		ret = get_data_interval_from_si(subs,
+						req_msg->service_interval);
+		if (ret == -EINVAL)
+			goto response;
+
+		datainterval = ret;
+	}
+
+	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
+
+	if (req_msg->enable) {
+		ret = enable_audio_stream(subs,
+					  map_pcm_format(req_msg->audio_format),
+					  req_msg->number_of_ch, req_msg->bit_rate,
+					  datainterval);
+
+		if (!ret)
+			ret = prepare_qmi_response(subs, req_msg, &resp,
+						   info_idx);
+	} else {
+		info = &uadev[pcm_card_num].info[info_idx];
+		if (info->data_ep_pipe) {
+			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+					       info->data_ep_pipe);
+			if (ep) {
+				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
+							    ep);
+				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+							      ep);
+			}
+
+			info->data_ep_pipe = 0;
+		}
+
+		if (info->sync_ep_pipe) {
+			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+					       info->sync_ep_pipe);
+			if (ep) {
+				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
+							    ep);
+				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+							      ep);
+			}
+
+			info->sync_ep_pipe = 0;
+		}
+
+		disable_audio_stream(subs);
+	}
+
+response:
+	if (!req_msg->enable && ret != -EINVAL && ret != -ENODEV) {
+		mutex_lock(&chip->mutex);
+		if (info_idx >= 0) {
+			info = &uadev[pcm_card_num].info[info_idx];
+			uaudio_dev_intf_cleanup(uadev[pcm_card_num].udev,
+						info);
+		}
+		if (atomic_read(&uadev[pcm_card_num].in_use))
+			kref_put(&uadev[pcm_card_num].kref,
+				 uaudio_dev_release);
+		mutex_unlock(&chip->mutex);
+	}
+	mutex_unlock(&qdev_mutex);
+
+	resp.usb_token = req_msg->usb_token;
+	resp.usb_token_valid = 1;
+	resp.internal_status = ret;
+	resp.internal_status_valid = 1;
+	resp.status = ret ? USB_QMI_STREAM_REQ_FAILURE_V01 : ret;
+	resp.status_valid = 1;
+	ret = qmi_send_response(svc->uaudio_svc_hdl, sq, txn,
+				QMI_UAUDIO_STREAM_RESP_V01,
+				QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN,
+				qmi_uaudio_stream_resp_msg_v01_ei, &resp);
+}
+
+static struct qmi_msg_handler uaudio_stream_req_handlers = {
+	.type = QMI_REQUEST,
+	.msg_id = QMI_UAUDIO_STREAM_REQ_V01,
+	.ei = qmi_uaudio_stream_req_msg_v01_ei,
+	.decoded_size = QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
+	.fn = handle_uaudio_stream_req,
+};
+
+/**
+ * qc_usb_audio_offload_init_qmi_dev() - initializes qmi dev
+ *
+ * Initializes the USB qdev, which is used to carry information pertaining to
+ * the offloading resources.  This device is freed only when there are no longer
+ * any offloading candidates. (i.e, when all audio devices are disconnected)
+ *
+ */
+static int qc_usb_audio_offload_init_qmi_dev(void)
+{
+	uaudio_qdev = kzalloc(sizeof(*uaudio_qdev), GFP_KERNEL);
+	if (!uaudio_qdev)
+		return -ENOMEM;
+
+	/* initialize xfer ring and xfer buf iova list */
+	INIT_LIST_HEAD(&uaudio_qdev->xfer_ring_list);
+	uaudio_qdev->curr_xfer_ring_iova = IOVA_XFER_RING_BASE;
+	uaudio_qdev->xfer_ring_iova_size =
+			IOVA_XFER_RING_MAX - IOVA_XFER_RING_BASE;
+
+	INIT_LIST_HEAD(&uaudio_qdev->xfer_buf_list);
+	uaudio_qdev->curr_xfer_buf_iova = IOVA_XFER_BUF_BASE;
+	uaudio_qdev->xfer_buf_iova_size =
+		IOVA_XFER_BUF_MAX - IOVA_XFER_BUF_BASE;
+
+	return 0;
+}
+
+/* Populates ppcm_idx array with supported PCM indexes */
+static int qc_usb_audio_offload_fill_avail_pcms(struct snd_usb_audio *chip,
+						struct snd_soc_usb_device *sdev)
+{
+	struct snd_usb_stream *as;
+	struct snd_usb_substream *subs;
+	int idx = 0;
+
+	list_for_each_entry(as, &chip->pcm_list, list) {
+		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
+		if (subs->ep_num) {
+			sdev->ppcm_idx[idx] = as->pcm->device;
+			idx++;
+		}
+		/*
+		 * Break if the current index exceeds the number of possible
+		 * playback streams counted from the UAC descriptors.
+		 */
+		if (idx >= sdev->num_playback)
+			break;
+	}
+
+	return -1;
+}
+
+/**
+ * qc_usb_audio_offload_probe() - platform op connect handler
+ * @chip: USB SND device
+ *
+ * Platform connect handler when a USB SND device is detected. Will
+ * notify SOC USB about the connection to enable the USB ASoC backend
+ * and populate internal USB chip array.
+ *
+ */
+static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
+{
+	struct usb_interface *intf = chip->intf[chip->num_interfaces - 1];
+	struct usb_interface_descriptor *altsd;
+	struct usb_device *udev = chip->dev;
+	struct usb_host_interface *alts;
+	struct snd_soc_usb_device *sdev;
+	struct xhci_sideband *sb;
+
+	/*
+	 * If there is no priv_data, or no playback paths, the connected
+	 * device doesn't support offloading.  Avoid populating entries for
+	 * this device.
+	 */
+	if (!snd_soc_usb_find_priv_data(usb_get_usb_backend(udev)) ||
+	    !usb_qmi_get_pcm_num(chip, 0))
+		return;
+
+	mutex_lock(&qdev_mutex);
+	mutex_lock(&chip->mutex);
+	if (!uadev[chip->card->number].chip) {
+		sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+		if (!sdev)
+			goto exit;
+
+		sb = xhci_sideband_register(udev);
+		if (!sb)
+			goto free_sdev;
+	} else {
+		sb = uadev[chip->card->number].sb;
+		sdev = uadev[chip->card->number].sdev;
+	}
+
+	if (!uaudio_qdev)
+		qc_usb_audio_offload_init_qmi_dev();
+
+	atomic_inc(&uaudio_qdev->qdev_in_use);
+
+	uadev[chip->card->number].sb = sb;
+	uadev[chip->card->number].chip = chip;
+	uadev[chip->card->number].sdev = sdev;
+
+	alts = &intf->altsetting[0];
+	altsd = get_iface_desc(alts);
+
+	/* Wait until all PCM devices are populated before notifying soc-usb */
+	if (altsd->bInterfaceNumber == chip->last_iface) {
+		sdev->num_playback = usb_qmi_get_pcm_num(chip, 0);
+
+		/*
+		 * Allocate playback pcm index array based on number of possible
+		 * playback paths within the UAC descriptors.
+		 */
+		sdev->ppcm_idx = kcalloc(sdev->num_playback, sizeof(unsigned int),
+					 GFP_KERNEL);
+		if (!sdev->ppcm_idx)
+			goto unreg_xhci;
+
+		qc_usb_audio_offload_fill_avail_pcms(chip, sdev);
+		sdev->card_idx = chip->card->number;
+		sdev->chip_idx = chip->index;
+
+		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
+	}
+
+	mutex_unlock(&chip->mutex);
+	mutex_unlock(&qdev_mutex);
+
+	return;
+
+unreg_xhci:
+	xhci_sideband_unregister(sb);
+	uadev[chip->card->number].sb = NULL;
+free_sdev:
+	kfree(sdev);
+	uadev[chip->card->number].sdev = NULL;
+	uadev[chip->card->number].chip = NULL;
+exit:
+	mutex_unlock(&chip->mutex);
+	mutex_unlock(&qdev_mutex);
+}
+
+/**
+ * qc_usb_audio_cleanup_qmi_dev() - release qmi device
+ *
+ * Frees the USB qdev.  Only occurs when there are no longer any potential
+ * devices that can utilize USB audio offloading.
+ *
+ */
+static void qc_usb_audio_cleanup_qmi_dev(void)
+{
+	kfree(uaudio_qdev);
+	uaudio_qdev = NULL;
+}
+
+/**
+ * qc_usb_audio_offload_disconnect() - platform op disconnect handler
+ * @chip: USB SND device
+ *
+ * Platform disconnect handler.  Will ensure that any pending stream is
+ * halted by issuing a QMI disconnect indication packet to the adsp.
+ *
+ */
+static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
+{
+	struct qmi_uaudio_stream_ind_msg_v01 disconnect_ind = {0};
+	struct uaudio_qmi_svc *svc = uaudio_svc;
+	struct uaudio_dev *dev;
+	int card_num;
+	int ret;
+
+	if (!chip)
+		return;
+
+	card_num = chip->card->number;
+	if (card_num >= SNDRV_CARDS)
+		return;
+
+	mutex_lock(&qdev_mutex);
+	mutex_lock(&chip->mutex);
+	dev = &uadev[card_num];
+
+	/* Device has already been cleaned up, or never populated */
+	if (!dev->chip) {
+		mutex_unlock(&qdev_mutex);
+		mutex_unlock(&chip->mutex);
+		return;
+	}
+
+	/* cleaned up already */
+	if (!dev->udev)
+		goto done;
+
+	if (atomic_read(&dev->in_use)) {
+		mutex_unlock(&chip->mutex);
+		mutex_unlock(&qdev_mutex);
+		dev_dbg(uaudio_qdev->data->dev,
+			"sending qmi indication disconnect\n");
+		disconnect_ind.dev_event = USB_QMI_DEV_DISCONNECT_V01;
+		disconnect_ind.slot_id = dev->udev->slot_id;
+		disconnect_ind.controller_num = dev->usb_core_id;
+		disconnect_ind.controller_num_valid = 1;
+		ret = qmi_send_indication(svc->uaudio_svc_hdl, &svc->client_sq,
+					  QMI_UAUDIO_STREAM_IND_V01,
+					  QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN,
+					  qmi_uaudio_stream_ind_msg_v01_ei,
+					  &disconnect_ind);
+		if (ret < 0)
+			dev_err(uaudio_qdev->data->dev,
+				"qmi send failed with err: %d\n", ret);
+
+		ret = wait_event_interruptible_timeout(dev->disconnect_wq,
+					!atomic_read(&dev->in_use),
+					msecs_to_jiffies(DEV_RELEASE_WAIT_TIMEOUT));
+		if (!ret) {
+			dev_err(uaudio_qdev->data->dev,
+				"timeout while waiting for dev_release\n");
+			atomic_set(&dev->in_use, 0);
+		} else if (ret < 0) {
+			dev_err(uaudio_qdev->data->dev,
+				"failed with ret %d\n", ret);
+			atomic_set(&dev->in_use, 0);
+		}
+		mutex_lock(&qdev_mutex);
+		mutex_lock(&chip->mutex);
+	}
+
+	uaudio_dev_cleanup(dev);
+done:
+	/*
+	 * If num_interfaces == 1, the last USB SND interface is being removed.
+	 * This is to accommodate for devices w/ multiple UAC functions.
+	 */
+	if (chip->num_interfaces == 1) {
+		snd_soc_usb_disconnect(usb_get_usb_backend(chip->dev), dev->sdev);
+		xhci_sideband_unregister(dev->sb);
+		dev->chip = NULL;
+		kfree(dev->sdev->ppcm_idx);
+		kfree(dev->sdev);
+		dev->sdev = NULL;
+	}
+	mutex_unlock(&chip->mutex);
+
+	atomic_dec(&uaudio_qdev->qdev_in_use);
+	if (!atomic_read(&uaudio_qdev->qdev_in_use))
+		qc_usb_audio_cleanup_qmi_dev();
+
+	mutex_unlock(&qdev_mutex);
+}
+
+/**
+ * qc_usb_audio_offload_suspend() - USB offload PM suspend handler
+ * @intf: USB interface
+ * @message: suspend type
+ *
+ * PM suspend handler to ensure that the USB offloading driver is able to stop
+ * any pending traffic, so that the bus can be suspended.
+ *
+ */
+static void qc_usb_audio_offload_suspend(struct usb_interface *intf,
+					 pm_message_t message)
+{
+	struct qmi_uaudio_stream_ind_msg_v01 disconnect_ind = {0};
+	struct snd_usb_audio *chip = usb_get_intfdata(intf);
+	struct uaudio_qmi_svc *svc = uaudio_svc;
+	struct uaudio_dev *dev;
+	int card_num;
+	int ret;
+
+	if (!chip)
+		return;
+
+	card_num = chip->card->number;
+	if (card_num >= SNDRV_CARDS)
+		return;
+
+	mutex_lock(&chip->mutex);
+	dev = &uadev[card_num];
+
+	if (atomic_read(&dev->in_use)) {
+		mutex_unlock(&chip->mutex);
+		dev_dbg(uaudio_qdev->data->dev, "sending qmi indication suspend\n");
+		disconnect_ind.dev_event = USB_QMI_DEV_DISCONNECT_V01;
+		disconnect_ind.slot_id = dev->udev->slot_id;
+		disconnect_ind.controller_num = dev->usb_core_id;
+		disconnect_ind.controller_num_valid = 1;
+		ret = qmi_send_indication(svc->uaudio_svc_hdl, &svc->client_sq,
+					  QMI_UAUDIO_STREAM_IND_V01,
+					  QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN,
+					  qmi_uaudio_stream_ind_msg_v01_ei,
+					  &disconnect_ind);
+		if (ret < 0)
+			dev_err(uaudio_qdev->data->dev,
+				"qmi send failed with err: %d\n", ret);
+
+		ret = wait_event_interruptible_timeout(dev->disconnect_wq,
+				!atomic_read(&dev->in_use),
+				msecs_to_jiffies(DEV_RELEASE_WAIT_TIMEOUT));
+		if (!ret) {
+			dev_err(uaudio_qdev->data->dev,
+				"timeout while waiting for dev_release\n");
+			atomic_set(&dev->in_use, 0);
+		} else if (ret < 0) {
+			dev_err(uaudio_qdev->data->dev,
+				"failed with ret %d\n", ret);
+				atomic_set(&dev->in_use, 0);
+		}
+		mutex_lock(&chip->mutex);
+	}
+	mutex_unlock(&chip->mutex);
+}
+
+static struct snd_usb_platform_ops offload_ops = {
+	.connect_cb = qc_usb_audio_offload_probe,
+	.disconnect_cb = qc_usb_audio_offload_disconnect,
+	.suspend_cb = qc_usb_audio_offload_suspend,
+};
+
+static int __init qc_usb_audio_offload_init(void)
+{
+	struct uaudio_qmi_svc *svc;
+	int ret;
+
+	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
+	if (!svc)
+		return -ENOMEM;
+
+	svc->uaudio_svc_hdl = kzalloc(sizeof(*svc->uaudio_svc_hdl), GFP_KERNEL);
+	if (!svc->uaudio_svc_hdl) {
+		ret = -ENOMEM;
+		goto free_svc;
+	}
+
+	ret = qmi_handle_init(svc->uaudio_svc_hdl,
+			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
+			      &uaudio_svc_ops_options,
+			      &uaudio_stream_req_handlers);
+	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
+			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
+
+	uaudio_svc = svc;
+
+	ret = snd_usb_register_platform_ops(&offload_ops);
+	if (ret < 0)
+		goto release_qmi;
+
+	return 0;
+
+release_qmi:
+	qmi_handle_release(svc->uaudio_svc_hdl);
+free_svc:
+	kfree(svc);
+
+	return ret;
+}
+
+static void __exit qc_usb_audio_offload_exit(void)
+{
+	struct uaudio_qmi_svc *svc = uaudio_svc;
+	int idx;
+
+	/*
+	 * Remove all connected devices after unregistering ops, to ensure
+	 * that no further connect events will occur.  The disconnect routine
+	 * will issue the QMI disconnect indication, which results in the
+	 * external DSP to stop issuing transfers.
+	 */
+	snd_usb_unregister_platform_ops();
+	for (idx = 0; idx < SNDRV_CARDS; idx++)
+		qc_usb_audio_offload_disconnect(uadev[idx].chip);
+
+	qmi_handle_release(svc->uaudio_svc_hdl);
+	kfree(svc);
+	uaudio_svc = NULL;
+}
+
+module_init(qc_usb_audio_offload_init);
+module_exit(qc_usb_audio_offload_exit);
+
+MODULE_DESCRIPTION("QC USB Audio Offloading");
+MODULE_LICENSE("GPL");

