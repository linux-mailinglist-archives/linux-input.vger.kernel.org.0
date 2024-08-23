Return-Path: <linux-input+bounces-5779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8095D696
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 22:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BD26B20FF7
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 20:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377191990CE;
	Fri, 23 Aug 2024 20:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YEE14eln"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF61198A02;
	Fri, 23 Aug 2024 20:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724443315; cv=none; b=Xs09oBzg26L+aymJgqIAG5hOUnEVXSuFJHhL6uLRYVlNicXRHo+aoCUKm3oT+GuHGg+G800xpKzIim8PWjgjh7kcw5qOj9IYXt2BChT70W6RQSh8XBH1mwoFY3wl9pszGvvrup+AsSeFoIHOGbOfXkhzoFksGDTLHu+Hlulj2ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724443315; c=relaxed/simple;
	bh=1Hp7NsyUYlfn3QAxb9QnxnkH97Pw2w+Y8pA0TZzpWMk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSkMFNpa2vwqdGmkJjDuH2IokOKxeOgHyRhYCpGzP1UH81x6zUXzabMI0JnJXVaDdqSaPO5GJCm9saqMX1eclO8A+v/DsfbZoD2GaWYWC3JXW6o7jysAULxkxm3BjwyNaIejNzVrOFizgZ0c+QcIb7AgLzvt+lvGlHAOjo0NkVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YEE14eln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NBWUTX030906;
	Fri, 23 Aug 2024 20:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PGp6ZQrpBw6E+mtDZb2UpP5A
	W9qYy/DIjxLaXDKBVPk=; b=YEE14elnzbKNonHI0X0VDaxhgOtrW45M/S096u+x
	9BB7cVJ7CMid8hbjBcEPwys0sOn5UTsCBoDffCv8BSr1cmhet49/IvsTCY8QKuo1
	cjVVdBid1ARBK9sDWfOSdGl+AwVeJrktOL+pFI8SXU61FzwJ3UFjLYbmx8rCqDtN
	mJmMNPgIpGcNkXleEfSaXH+94Dxhs8AzcUX89IhFbZVlbZjhWBAngocq8TkF5dxz
	vPf8gYt3H66mtX10cKX5jixTbfjJQ2Pm9O/wB2DvodSKw5n7d8Mx9W3Ctx+fpIY+
	bum25W+YThKAKw+TUlwt65wOfopQGvfpVIq02tB3TBc8zg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415ck9gpxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NK1Ebu008316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 20:01:14 GMT
Received: from hu-wcheng-lv.qualcomm.com (10.49.16.6) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 13:01:13 -0700
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: [PATCH v25 01/33] xhci: add helper to stop endpoint and wait for completion
Date: Fri, 23 Aug 2024 13:00:29 -0700
Message-ID: <20240823200101.26755-2-quic_wcheng@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240823200101.26755-1-quic_wcheng@quicinc.com>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S7pu7PYNE4IGi6LTxP4rc212N3W3r7YW
X-Proofpoint-ORIG-GUID: S7pu7PYNE4IGi6LTxP4rc212N3W3r7YW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230147

From: Mathias Nyman <mathias.nyman@linux.intel.com>

Expose xhci_stop_endpoint_sync() which is a synchronous variant of
xhci_queue_stop_endpoint().  This is useful for client drivers that are
using the secondary interrupters, and need to stop/clean up the current
session.  The stop endpoint command handler will also take care of cleaning
up the ring.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
---
 drivers/usb/host/xhci.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci.h |  2 ++
 2 files changed, 41 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 37eb37b0affa..3a051ed32907 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2784,6 +2784,45 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 	return -ENOMEM;
 }
 
+/*
+ * Synchronous XHCI stop endpoint helper.  Issues the stop endpoint command and
+ * waits for the command completion before returning.
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
index 30415158ed3c..1c6126ed55b0 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1914,6 +1914,8 @@ void xhci_ring_doorbell_for_active_rings(struct xhci_hcd *xhci,
 void xhci_cleanup_command_queue(struct xhci_hcd *xhci);
 void inc_deq(struct xhci_hcd *xhci, struct xhci_ring *ring);
 unsigned int count_trbs(u64 addr, u64 len);
+int xhci_stop_endpoint_sync(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
+			    int suspend, gfp_t gfp_flags);
 
 /* xHCI roothub code */
 void xhci_set_link_state(struct xhci_hcd *xhci, struct xhci_port *port,

