Return-Path: <linux-input+bounces-13957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D4EB24014
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 07:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394B61A25685
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 05:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EF82877D9;
	Wed, 13 Aug 2025 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vkRMB/3n"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37442110E
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 05:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755062288; cv=none; b=kWpFPuX4xXIWELVALwjnvSslvHH2Xp2LljR5AjnMc4aDkCmLBwe5Z0/sVhsv8hWo74A4bfK7ZdZFjG/Y1zWO4g9p9cr3LtEdVud24NYUZdVnJ8M5VI6zrUHKkSM2QS3P/63PppeKq4DwKSTYaLs4PYfXO30+y6ufY/JfNu4mIVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755062288; c=relaxed/simple;
	bh=pqt4TowKaairXtxotzS9GcjIWm2v0xycJVC1daM6Wcs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=QpBiW5j0vaofbDmO+a6pE4yY+09TY1KonNnADvJpeN0BstxgqpWZrkCl6ZC2CuZznlBbEkJTME36fpzvNAMScDgxChK/2/O3ZWWwWpyEGIAGuBunlWUa93EX8Noo0QMffdC6eF4A/cFCzVxi2oW9HJGzzXExd0lVoGyqFDZZJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vkRMB/3n; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250813051756epoutp02b69abffd0528331fe171ded33d256b6b~bO9eD7nKc2186421864epoutp02o
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 05:17:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250813051756epoutp02b69abffd0528331fe171ded33d256b6b~bO9eD7nKc2186421864epoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755062276;
	bh=hpvD0dypGmFLQDWc1pQmIUIu7vdT6qLoNn3MqbTtnAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vkRMB/3nXFf3vwqavr8qfI3S3nkrU/2WWw03joEBz3q2cJ+3DGG7Z+NJt3mwYcSkD
	 F5A9AKim8GcJR4GBCCroL+tqLtubYgRoaNrlXp2AJsKiwGsiKGUx+q54mBXfWsxwFg
	 eL1YC3IghX4cKBl5YtGxQAivqDRUoVHPSVP0pHVo=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPS id
	20250813051756epcas1p3e7124ac6418c2c4cc1ccdc02502771bf~bO9dwl2A30069800698epcas1p3Z;
	Wed, 13 Aug 2025 05:17:56 +0000 (GMT)
Received: from epcas1p2.samsung.com (unknown [182.195.38.248]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c1xTc1GB3z3hhT3; Wed, 13 Aug
	2025 05:17:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250813051755epcas1p2afddf98d4639ee15a3f8aa72b8e99c14~bO9c3s-9u1089710897epcas1p2N;
	Wed, 13 Aug 2025 05:17:55 +0000 (GMT)
Received: from minbellkim-500TGA-500SGA (unknown [10.252.69.135]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250813051755epsmtip24ce12ffd36354bf7a8233c95ee9e4ff6~bO9c1tNxW1683016830epsmtip2C;
	Wed, 13 Aug 2025 05:17:55 +0000 (GMT)
Date: Wed, 13 Aug 2025 14:17:51 +0900
From: Minjong Kim <minbell.kim@samsung.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
Message-ID: <20250813051751.z6vxd6tvrfelmxou@minbellkim-500TGA-500SGA>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <rqo85n88-82s2-30s6-qn80-r4r943p4q59o@xreary.bet>
X-CMS-MailID: 20250813051755epcas1p2afddf98d4639ee15a3f8aa72b8e99c14
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----TQfym8SLV53j68Oh-Z7X3icTIQ_pywbqltYHDPsxVxR0HChE=_226c20_"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38
References: <CGME20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38@epcas1p3.samsung.com>
	<20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
	<rqo85n88-82s2-30s6-qn80-r4r943p4q59o@xreary.bet>

------TQfym8SLV53j68Oh-Z7X3icTIQ_pywbqltYHDPsxVxR0HChE=_226c20_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 12, 2025 at 02:46:24PM +0200, Jiri Kosina wrote:
> 
> I know that mixing declarations and code is fine these days, but we 
> haven't been progressive enough to switch to that coding style in HID 
> subsystem yet :) Would you be willing to move it below the declarations?
>  

From 75e52defd4b2fd138285c5ad953942e2e6cf2fbb Mon Sep 17 00:00:00 2001
From: Minjong Kim <minbell.kim@samsung.com>
Date: Thu, 17 Jul 2025 14:37:47 +0900
Subject: [PATCH v2] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()

in ntrig_report_version(), hdev parameter passed from hid_probe().
sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
if hdev->dev.parent->parent is null, usb_dev has
invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
when usb_rcvctrlpipe() use usb_dev,it trigger
page fault error for address(0xffffffffffffff58)

add null check logic to ntrig_report_version()
before calling hid_to_usb_dev()

Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
---
 drivers/hid/hid-ntrig.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 2738ce947434..fa948d9e236c 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -144,6 +144,9 @@ static void ntrig_report_version(struct hid_device *hdev)
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
 	unsigned char *data = kmalloc(8, GFP_KERNEL);

+	if (!hdev->dev.parent->parent)
+		return;
+
 	if (!data)
 		goto err_free;

--
2.34.1

I move it below the declarations.

Best regards,


------TQfym8SLV53j68Oh-Z7X3icTIQ_pywbqltYHDPsxVxR0HChE=_226c20_
Content-Type: text/plain; charset="utf-8"


------TQfym8SLV53j68Oh-Z7X3icTIQ_pywbqltYHDPsxVxR0HChE=_226c20_--

