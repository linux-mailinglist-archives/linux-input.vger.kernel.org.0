Return-Path: <linux-input+bounces-11526-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B56A7B4EC
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 02:44:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E33F18823F3
	for <lists+linux-input@lfdr.de>; Fri,  4 Apr 2025 00:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C051FAC4C;
	Fri,  4 Apr 2025 00:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SbHsK+C2"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C261F3FD0;
	Fri,  4 Apr 2025 00:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743726489; cv=none; b=um/CpV/4g5n8/zCsVVO+wUvrAD04k0WY8ZBUH+J7Dy4v6AqSPq4Pk/FFHkhcR12sF+6gdub5dpQroSFZinRKpTrurLH/AGqblm4eGrVVhKlPvTZMaLYjtl2agBy7qCJdrcYei0cr8+nKRMCg6zpJuK2NSgpf7arvJjCfKxlVbvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743726489; c=relaxed/simple;
	bh=3QFTum6b6TYkCsoCbA8ri0iL95hPrcAGFqDlRqu9AZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VuOQEijjkxI6O8lYFDtneyJDSH2ompflFBOd4umhwvlBqzbshq66dnH9+cm5iV3KOR4riI8ibJhktI1PEC/5DqFXGmHq5kra5A1AiN9O/OG9rnTbYAKjm3EFSdE3mSxOu8vTHbRtpxDOMhtyE4LYI7wMV3b3g6bQwuGPOTLjjio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SbHsK+C2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533NXAUa027094;
	Fri, 4 Apr 2025 00:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tHOjyOXhTDWn+i/TaTd9A+AO+bPk4LxFuw8J0AV0EqA=; b=SbHsK+C2kgqBx+3X
	rbg0RKrjZrFgsl8qEkIRDRgTew3O+xHFDSD1gUbW+iQ8PyWTcC6oZSS1hpQ5m6aV
	BHW4H+l8tTBxT6shS7w6dAusL8sKJ9WQIgVbUApVictq8sS+kIBtjq52WPWyQL2Z
	bSOsE1CQ6t14+PVD8y7ghqMvOMUOCKQlTBTXAqtHHQuBAVQYiheoDfWJWZCnjSH9
	ZWobM2PaCKM+QQa/vkcOTYm9cq0CMV7j8oVnhKkCg9LLcVfjLec3OWYBw7rKEt2h
	a0tUMTSD6cWDru//TsmI6Je4Z/XEvi6TlQqbwBhy423tIhKF8xPmLvwovz+ecIkx
	T2jQZg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2deg8r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 00:27:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5340RkS7012130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 00:27:46 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 3 Apr 2025 17:27:46 -0700
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
Subject: [PATCH v37 27/31] ALSA: usb-audio: qcom: Add USB QMI definitions
Date: Thu, 3 Apr 2025 17:27:24 -0700
Message-ID: <20250404002728.3590501-28-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: xGqq5hRySKLPjTAKEdmzEGbi0TVc-Bud
X-Proofpoint-ORIG-GUID: xGqq5hRySKLPjTAKEdmzEGbi0TVc-Bud
X-Authority-Analysis: v=2.4 cv=boxMBFai c=1 sm=1 tr=0 ts=67ef2783 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=RQyiJLi3wYNDmdbsWLcA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_11,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040001

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
index 000000000000..151ae7b591de
--- /dev/null
+++ b/sound/usb/qcom/usb_audio_qmi_v01.c
@@ -0,0 +1,863 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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
index 000000000000..f2563537ed40
--- /dev/null
+++ b/sound/usb/qcom/usb_audio_qmi_v01.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
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

