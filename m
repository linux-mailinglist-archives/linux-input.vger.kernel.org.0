Return-Path: <linux-input+bounces-7448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B51299F958
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 23:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07D06B215AA
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 21:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EF82036F2;
	Tue, 15 Oct 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mfYSFGA/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E11FF047;
	Tue, 15 Oct 2024 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027796; cv=none; b=TvVuNFOa9prnZ8tcgrrj3WtnaUwIYxF6etabxL4C/3fczMMAf5Ma0Zs2etrMjsizUMPwS5QXqYChQSJSj6WSk/NUHNTyLvXprawcDZqz4X1AwLeL+3i3bUsgEsR2NvvJdbpxPjO1xQ2ZwiuLPRjizwHOxxoI5ksV1yb/Tq4Na8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027796; c=relaxed/simple;
	bh=3nFyRTVOUVhLHMFASESfShsxhY8idPyIGAYXXG9qqd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nf7KO35hBeErJIUPvzxquWs+vf5Q1I0bScVAT2FwhZJ6guH0zn2wpDq50Nbe50Aj7hUEP3uxc8YTpGhezYdrDnJdQzet//hkcWJIo/AlMgNDhVBMuyacFqRCV/UGzqAI9IoAlJrOiA5esKCr9bh2hyipjoFQf+qvBLOvmT8SA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mfYSFGA/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49FC52TQ023260;
	Tue, 15 Oct 2024 21:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVZiV+f4SnId4RLZpdWICppkMgvqXrXjIq8fTSzECKc=; b=mfYSFGA/n0x+HtmN
	CXvLglrZf3jArKeXi6D5ga1rgyzDNiWFPP2boJxP8/3jLkBELcZxVntnSkzzoZbY
	3I6fOQfdve8svjBvHnXgRVDzk949mFBe/srakDSk8rjJml2kEiqnu7+SClz5OJlI
	W5GYS26696x2hy7DhpIA49+p/3IrJNadZs0EdK8cYasolVRxfAeQlbJ0lV5fdI6y
	iQNIM3aFRLd+TnMoV0QaNN7sBRdUAgq9TOFdBvq2m313YNcfu/GRdQWJE7CkGjXn
	qLGTgTQCFgsAcfhSaPsNEpy47Li/8bWsfNK4z8XMNbsxN0THUbo8FitDw2RJU5IZ
	7EX2yg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429r3b9mt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FLTRWK026390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 21:29:28 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 14:29:27 -0700
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
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v29 02/33] xhci: add helper to stop endpoint and wait for completion
Date: Tue, 15 Oct 2024 14:28:44 -0700
Message-ID: <20241015212915.1206789-3-quic_wcheng@quicinc.com>
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
X-Proofpoint-ORIG-GUID: rvr34GTYsWZPlydLQGgglonVZMFdA_RP
X-Proofpoint-GUID: rvr34GTYsWZPlydLQGgglonVZMFdA_RP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150143

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Expose xhci_stop_endpoint_sync() which is a synchronous variant of
xhci_queue_stop_endpoint().  This is useful for client drivers that are
using the secondary interrupters, and need to stop the current endpoint
session.

This does not go through the normal xhci_handle_cmd_stop_ep() command
completion handler, because it utilizes the completion path to achieve
synchronous behavior.  Users of this API are primarily intended to be
clients that maintain their own transfer rings, such as in the case of USB
audio offload.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci.c | 45 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ed1bb7ed44b0..8d7566e33faf 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2784,6 +2784,51 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 	return -ENOMEM;
 }
 
+/*
+ * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
+ * waits for the command completion before returning.  This does not call
+ * xhci_handle_cmd_stop_ep(), which has additional handling for 'context error'
+ * cases, along with transfer ring cleanup.
+ *
+ * xhci_stop_endpoint_sync() is intended to be utilized by clients that manage
+ * their own transfer ring, such as offload situations.
+ */
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep, int suspend,
+			    gfp_t gfp_flags)
+{
+	struct xhci_command *command;
+	unsigned long flags;
+	int ret;
+
+	command = xhci_alloc_command(xhci, true, gfp_flags);
+	if (!command)
+		return -ENOMEM;
+
+	spin_lock_irqsave(&xhci->lock, flags);
+	ret = xhci_queue_stop_endpoint(xhci, command, ep->vdev->slot_id,
+				       ep->ep_index, suspend);
+	if (ret < 0) {
+		spin_unlock_irqrestore(&xhci->lock, flags);
+		goto out;
+	}
+
+	xhci_ring_cmd_db(xhci);
+	spin_unlock_irqrestore(&xhci->lock, flags);
+
+	wait_for_completion(command->completion);
+
+	/* No handling for COMP_CONTEXT_STATE_ERROR done at command completion*/
+	if (command->status == COMP_COMMAND_ABORTED ||
+	    command->status == COMP_COMMAND_RING_STOPPED) {
+		xhci_warn(xhci, "Timeout while waiting for stop endpoint command\n");
+		ret = -ETIME;
+	}
+out:
+	xhci_free_command(xhci, command);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xhci_stop_endpoint_sync);
 
 /* Issue a configure endpoint command or evaluate context command
  * and wait for it to finish.
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 324644165d93..51a992d8ffcf 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1917,6 +1917,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    int suspend, gfp_t gfp_flags);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

