Return-Path: <linux-input+bounces-7449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D6499F95C
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1817C1C23866
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2762E203706;
	Tue, 15 Oct 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QsYCODrU"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8AE1FE10A;
	Tue, 15 Oct 2024 21:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027796; cv=none; b=Zt4T2CyQiISM5oMYln3QuRYHbzMp2xVjJkhmjuC5L4GnakYe3gHVMhNxA7k+FPvsIeZnnKygI2rkyxgnSKpoNP1G//wPeOcyUL5UPfPtqaEz/pJjhX4Z5OXoDMiaqTPO3LbuhVb4SwOxBGswcMwvKpvNIIQ9AfTabhtrFlc4uL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027796; c=relaxed/simple;
	bh=9cdnbJPdjIkgUwVVDViOSctU4pwRwxYTjPMbwEvbRI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+VR5Rbx9EH8/XECw3XsJA/4Yk/WtlDNKs6t1qHWEfnnWUc01BVcazvdxvIodhhTsGqPxT785H6A7XNhhK2C8x4g51kbaUfOHgYBr2Ii/i+0jUS+e7uvtIp4PzafLAbqO93MePhY9oaUGxCOTBM/rj78ztTs69ff3hn6RD3kWc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QsYCODrU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FBZ62b005958;
	Tue, 15 Oct 2024 21:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/iXWyJ+VSbDCGIDrA8mF4MYZ6p5L8xVjpkuwHayJnho=; b=QsYCODrU60hAHMAi
	rQ7iLV7btrHkdXl7Nipjy48GaHKw/nyMiHxo3E8Su9aDLftRCwLcxCit2/7Flr+A
	2ZSTtpdfQgud5UKkj+bqP0SOhE/vnFgxhEROAaEzdGmpbX3J6DJ/mYnvyBOhcbgg
	IINNWld/WYg2haqE5SZQ59lkzxWjwxc/uxM3BeAEjBm3/ym958lqKequv5OELw7c
	HpAAs3LZ4LPi9ESK+mmG6uEuG/0ZLQflw8/zj0p+phoGbcvfGl0WCG7VC5mgF6Pe
	ms1aME2qANa82tcz0g6Yj9OjQ34U56VoT2v36fzOPnoJJ9GOwCpHjpS9l89WRxQr
	KtPj8A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g2rs46y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:35 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTYqM022381
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:34 GMT
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
Subject: [PATCH v29 28/33] ALSA: usb-audio: qcom: Add USB QMI definitions
Date: Tue, 15 Oct 2024 14:29:10 -0700
Message-ID: <20241015212915.1206789-29-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: RO1dhDtUOwpApMIh-CRRmzDqNpZe6B5Q
X-Proofpoint-GUID: RO1dhDtUOwpApMIh-CRRmzDqNpZe6B5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143

The Qualcomm USB audio offload driver utilizes the QMI protocol to
communicate with the audio DSP.  Add the necessary QMI header and field
definitions, so the QMI interface driver is able to route the QMI packet
received to the USB audio offload driver.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 sound/usb/qcom/usb_audio_qmi_v01.c | 863 +++++++++++++++++++++++++++++
 sound/usb/qcom/usb_audio_qmi_v01.h | 164 ++++++
 2 files changed, 1027 insertions(+)
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
 create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h

diff --git a/sound/usb/qcom/usb_audio_qmi_v01.c b/sound/usb/qcom/usb_audio_qmi_v01.c
new file mode 100644
index 000000000000..5e8efbec3922
--- /dev/null
+++ b/sound/usb/qcom/usb_audio_qmi_v01.c
@@ -0,0 +1,863 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/soc/qcom/qmi.h>
+
+#include "usb_audio_qmi_v01.h"
+
+static const struct qmi_elem_info mem_info_v01_ei[] = {
+	{
+		.data_type	= QMI_UNSIGNED_8_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u64),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct mem_info_v01, va),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_8_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u64),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct mem_info_v01, pa),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct mem_info_v01, size),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info apps_mem_info_v01_ei[] = {
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct apps_mem_info_v01, evt_ring),
+		.ei_array	= mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct apps_mem_info_v01, tr_data),
+		.ei_array	= mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct apps_mem_info_v01, tr_sync),
+		.ei_array	= mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct apps_mem_info_v01, xfer_buff),
+		.ei_array	= mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct apps_mem_info_v01, dcba),
+		.ei_array	= mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info usb_endpoint_descriptor_v01_ei[] = {
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bLength),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bDescriptorType),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bEndpointAddress),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bmAttributes),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_2_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						wMaxPacketSize),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bInterval),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bRefresh),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_endpoint_descriptor_v01,
+						bSynchAddress),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+static const struct qmi_elem_info usb_interface_descriptor_v01_ei[] = {
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bLength),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bDescriptorType),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bInterfaceNumber),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bAlternateSetting),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bNumEndpoints),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bInterfaceClass),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bInterfaceSubClass),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						bInterfaceProtocol),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0,
+		.offset		= offsetof(struct usb_interface_descriptor_v01,
+						iInterface),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+const struct qmi_elem_info qmi_uaudio_stream_req_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						enable),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						usb_token),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						audio_format_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						audio_format),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						number_of_ch_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						number_of_ch),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						bit_rate_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						bit_rate),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						xfer_buff_size_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						xfer_buff_size),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						service_interval_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_req_msg_v01,
+						service_interval),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+const struct qmi_elem_info qmi_uaudio_stream_resp_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct qmi_response_type_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					resp),
+		.ei_array	= qmi_response_type_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					status_valid),
+	},
+	{
+		.data_type	= QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len	= 1,
+		.elem_size	= sizeof(enum usb_qmi_audio_stream_status_enum_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					status),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					internal_status_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					internal_status),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					slot_id_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					slot_id),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_token_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_token),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_opr_intf_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_interface_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_opr_intf_desc),
+		.ei_array	= usb_interface_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_data_ep_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_endpoint_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_data_ep_desc),
+		.ei_array	= usb_endpoint_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_sync_ep_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_endpoint_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					std_as_sync_ep_desc),
+		.ei_array	= usb_endpoint_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_audio_spec_revision_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_2_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_audio_spec_revision),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x18,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					data_path_delay_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x18,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					data_path_delay),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x19,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_audio_subslot_size_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x19,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					usb_audio_subslot_size),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					xhci_mem_info_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct apps_mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1A,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					xhci_mem_info),
+		.ei_array	= apps_mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					interrupter_num_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1B,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					interrupter_num),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1C,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					speed_info_valid),
+	},
+	{
+		.data_type	= QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len	= 1,
+		.elem_size	= sizeof(enum usb_qmi_audio_device_speed_enum_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1C,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					speed_info),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1D,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					controller_num_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x1D,
+		.offset		= offsetof(struct qmi_uaudio_stream_resp_msg_v01,
+					controller_num),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
+
+const struct qmi_elem_info qmi_uaudio_stream_ind_msg_v01_ei[] = {
+	{
+		.data_type	= QMI_SIGNED_4_BYTE_ENUM,
+		.elem_len	= 1,
+		.elem_size	= sizeof(
+				enum usb_qmi_audio_device_indication_enum_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x01,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						dev_event),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x02,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						slot_id),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_token_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_4_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u32),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x10,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_token),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_opr_intf_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_interface_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x11,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_opr_intf_desc),
+		.ei_array	= usb_interface_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_data_ep_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_endpoint_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x12,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_data_ep_desc),
+		.ei_array	= usb_endpoint_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_sync_ep_desc_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct usb_endpoint_descriptor_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x13,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						std_as_sync_ep_desc),
+		.ei_array	= usb_endpoint_descriptor_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_audio_spec_revision_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_2_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u16),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x14,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_audio_spec_revision),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						data_path_delay_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x15,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						data_path_delay),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_audio_subslot_size_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x16,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						usb_audio_subslot_size),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						xhci_mem_info_valid),
+	},
+	{
+		.data_type	= QMI_STRUCT,
+		.elem_len	= 1,
+		.elem_size	= sizeof(struct apps_mem_info_v01),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x17,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						xhci_mem_info),
+		.ei_array	= apps_mem_info_v01_ei,
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x18,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						interrupter_num_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x18,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						interrupter_num),
+	},
+	{
+		.data_type	= QMI_OPT_FLAG,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x19,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						controller_num_valid),
+	},
+	{
+		.data_type	= QMI_UNSIGNED_1_BYTE,
+		.elem_len	= 1,
+		.elem_size	= sizeof(u8),
+		.array_type	= NO_ARRAY,
+		.tlv_type	= 0x19,
+		.offset		= offsetof(struct qmi_uaudio_stream_ind_msg_v01,
+						controller_num),
+	},
+	{
+		.data_type	= QMI_EOTI,
+		.array_type	= NO_ARRAY,
+		.tlv_type	= QMI_COMMON_TLV_TYPE,
+	},
+};
diff --git a/sound/usb/qcom/usb_audio_qmi_v01.h b/sound/usb/qcom/usb_audio_qmi_v01.h
new file mode 100644
index 000000000000..b549b025fe67
--- /dev/null
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef USB_QMI_V01_H
+#define USB_QMI_V01_H
+
+#define UAUDIO_STREAM_SERVICE_ID_V01 0x41D
+#define UAUDIO_STREAM_SERVICE_VERS_V01 0x01
+
+#define QMI_UAUDIO_STREAM_RESP_V01 0x0001
+#define QMI_UAUDIO_STREAM_REQ_V01 0x0001
+#define QMI_UAUDIO_STREAM_IND_V01 0x0001
+
+struct mem_info_v01 {
+	u64 va;
+	u64 pa;
+	u32 size;
+};
+
+struct apps_mem_info_v01 {
+	struct mem_info_v01 evt_ring;
+	struct mem_info_v01 tr_data;
+	struct mem_info_v01 tr_sync;
+	struct mem_info_v01 xfer_buff;
+	struct mem_info_v01 dcba;
+};
+
+struct usb_endpoint_descriptor_v01 {
+	u8 bLength;
+	u8 bDescriptorType;
+	u8 bEndpointAddress;
+	u8 bmAttributes;
+	u16 wMaxPacketSize;
+	u8 bInterval;
+	u8 bRefresh;
+	u8 bSynchAddress;
+};
+
+struct usb_interface_descriptor_v01 {
+	u8 bLength;
+	u8 bDescriptorType;
+	u8 bInterfaceNumber;
+	u8 bAlternateSetting;
+	u8 bNumEndpoints;
+	u8 bInterfaceClass;
+	u8 bInterfaceSubClass;
+	u8 bInterfaceProtocol;
+	u8 iInterface;
+};
+
+enum usb_qmi_audio_stream_status_enum_v01 {
+	USB_QMI_STREAM_STATUS_ENUM_MIN_VAL_V01 = INT_MIN,
+	USB_QMI_STREAM_REQ_SUCCESS_V01 = 0,
+	USB_QMI_STREAM_REQ_FAILURE_V01 = 1,
+	USB_QMI_STREAM_REQ_FAILURE_NOT_FOUND_V01 = 2,
+	USB_QMI_STREAM_REQ_FAILURE_INVALID_PARAM_V01 = 3,
+	USB_QMI_STREAM_REQ_FAILURE_MEMALLOC_V01 = 4,
+	USB_QMI_STREAM_STATUS_ENUM_MAX_VAL_V01 = INT_MAX,
+};
+
+enum usb_qmi_audio_device_indication_enum_v01 {
+	USB_QMI_DEVICE_INDICATION_ENUM_MIN_VAL_V01 = INT_MIN,
+	USB_QMI_DEV_CONNECT_V01 = 0,
+	USB_QMI_DEV_DISCONNECT_V01 = 1,
+	USB_QMI_DEV_SUSPEND_V01 = 2,
+	USB_QMI_DEV_RESUME_V01 = 3,
+	USB_QMI_DEVICE_INDICATION_ENUM_MAX_VAL_V01 = INT_MAX,
+};
+
+enum usb_qmi_audio_device_speed_enum_v01 {
+	USB_QMI_DEVICE_SPEED_ENUM_MIN_VAL_V01 = INT_MIN,
+	USB_QMI_DEVICE_SPEED_INVALID_V01 = 0,
+	USB_QMI_DEVICE_SPEED_LOW_V01 = 1,
+	USB_QMI_DEVICE_SPEED_FULL_V01 = 2,
+	USB_QMI_DEVICE_SPEED_HIGH_V01 = 3,
+	USB_QMI_DEVICE_SPEED_SUPER_V01 = 4,
+	USB_QMI_DEVICE_SPEED_SUPER_PLUS_V01 = 5,
+	USB_QMI_DEVICE_SPEED_ENUM_MAX_VAL_V01 = INT_MAX,
+};
+
+struct qmi_uaudio_stream_req_msg_v01 {
+	u8 enable;
+	u32 usb_token;
+	u8 audio_format_valid;
+	u32 audio_format;
+	u8 number_of_ch_valid;
+	u32 number_of_ch;
+	u8 bit_rate_valid;
+	u32 bit_rate;
+	u8 xfer_buff_size_valid;
+	u32 xfer_buff_size;
+	u8 service_interval_valid;
+	u32 service_interval;
+};
+
+#define QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN 46
+extern const struct qmi_elem_info qmi_uaudio_stream_req_msg_v01_ei[];
+
+struct qmi_uaudio_stream_resp_msg_v01 {
+	struct qmi_response_type_v01 resp;
+	u8 status_valid;
+	enum usb_qmi_audio_stream_status_enum_v01 status;
+	u8 internal_status_valid;
+	u32 internal_status;
+	u8 slot_id_valid;
+	u32 slot_id;
+	u8 usb_token_valid;
+	u32 usb_token;
+	u8 std_as_opr_intf_desc_valid;
+	struct usb_interface_descriptor_v01 std_as_opr_intf_desc;
+	u8 std_as_data_ep_desc_valid;
+	struct usb_endpoint_descriptor_v01 std_as_data_ep_desc;
+	u8 std_as_sync_ep_desc_valid;
+	struct usb_endpoint_descriptor_v01 std_as_sync_ep_desc;
+	u8 usb_audio_spec_revision_valid;
+	u16 usb_audio_spec_revision;
+	u8 data_path_delay_valid;
+	u8 data_path_delay;
+	u8 usb_audio_subslot_size_valid;
+	u8 usb_audio_subslot_size;
+	u8 xhci_mem_info_valid;
+	struct apps_mem_info_v01 xhci_mem_info;
+	u8 interrupter_num_valid;
+	u8 interrupter_num;
+	u8 speed_info_valid;
+	enum usb_qmi_audio_device_speed_enum_v01 speed_info;
+	u8 controller_num_valid;
+	u8 controller_num;
+};
+
+#define QMI_UAUDIO_STREAM_RESP_MSG_V01_MAX_MSG_LEN 202
+extern const struct qmi_elem_info qmi_uaudio_stream_resp_msg_v01_ei[];
+
+struct qmi_uaudio_stream_ind_msg_v01 {
+	enum usb_qmi_audio_device_indication_enum_v01 dev_event;
+	u32 slot_id;
+	u8 usb_token_valid;
+	u32 usb_token;
+	u8 std_as_opr_intf_desc_valid;
+	struct usb_interface_descriptor_v01 std_as_opr_intf_desc;
+	u8 std_as_data_ep_desc_valid;
+	struct usb_endpoint_descriptor_v01 std_as_data_ep_desc;
+	u8 std_as_sync_ep_desc_valid;
+	struct usb_endpoint_descriptor_v01 std_as_sync_ep_desc;
+	u8 usb_audio_spec_revision_valid;
+	u16 usb_audio_spec_revision;
+	u8 data_path_delay_valid;
+	u8 data_path_delay;
+	u8 usb_audio_subslot_size_valid;
+	u8 usb_audio_subslot_size;
+	u8 xhci_mem_info_valid;
+	struct apps_mem_info_v01 xhci_mem_info;
+	u8 interrupter_num_valid;
+	u8 interrupter_num;
+	u8 controller_num_valid;
+	u8 controller_num;
+};
+
+#define QMI_UAUDIO_STREAM_IND_MSG_V01_MAX_MSG_LEN 181
+extern const struct qmi_elem_info qmi_uaudio_stream_ind_msg_v01_ei[];
+
+#endif

