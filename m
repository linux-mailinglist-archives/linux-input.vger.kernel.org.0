Return-Path: <linux-input+bounces-6684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F22B985056
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 03:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 022F61F215A9
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 01:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE2918B484;
	Wed, 25 Sep 2024 01:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L05KghCp"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405D189BA8;
	Wed, 25 Sep 2024 01:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727226100; cv=none; b=Iup3Q2sipRrD7imiUIm7UpPUgrdiIkMqGTVjIp9DlVFEND6xz1kjnzmLhncW0+p+LRn8pzdl85mpTXqBHZvBzUGCMyIM8L9f18NauM0uKbhSBOMC40koXVqWKr2yUgKWrsQ7ybJSjRnXqDVBOj1rods7W9KumfL24Kgp9W7ybwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727226100; c=relaxed/simple;
	bh=3nFyRTVOUVhLHMFASESfShsxhY8idPyIGAYXXG9qqd0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HU/1u+GeFRzd+QMcu1LxwAZUc9ywztcJtMubjpy+iqxaJBJz/Kjcfiug+H6Ky1GZbU2o2XWDGKRwNvR2EhwTmygi6diCN6vlajzBQndpDo9dSBDYl9whoHdCYbe6DQJxOHAAVgl9mv7BcE9kIxuuwpcaex1Rv79QDrphN9LDvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L05KghCp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHQCK5026499;
	Wed, 25 Sep 2024 01:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SVZiV+f4SnId4RLZpdWICppkMgvqXrXjIq8fTSzECKc=; b=L05KghCpw+SucqSl
	goZXCXKKZ2PrwNmCZX8jmu/0d7fnyorDgSfLJ1ZX6dRH5c2H8SJP1nAMNjISxXS0
	n726FBaGtgPL5ZcIT7f6HyTPbjq46dSvfFO1gBI/3fhRcqN1ZXn622AVmqCsgtwa
	6jd73AEUf96lDL1XCrvY14/FssTkkTfi2cxoImWERqDcIMzJ8qz0ax+v2fz7gWbT
	V9nCr+7YvMTSk1dYOyWq0OCGbp8gd6ocZ5HyOmaf/9OrgbqQbtycB4dUD4zS4mm7
	lF+UOrd9uCVPQoWAhJ18F9TPNjPYDofvbXafo1KkuIcClrz5Yy2RMBhg/Kxsvg70
	cKVsoA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sp7ujj72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48P10B0U005984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 01:00:11 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 18:00:11 -0700
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
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v28 01/32] xhci: add helper to stop endpoint and wait for completion
Date: Tue, 24 Sep 2024 17:59:29 -0700
Message-ID: <20240925010000.2231406-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
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
X-Proofpoint-GUID: IY5S9hcSr9jgpHRkSSzoKy6uwHXKU3tp
X-Proofpoint-ORIG-GUID: IY5S9hcSr9jgpHRkSSzoKy6uwHXKU3tp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409250005

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

