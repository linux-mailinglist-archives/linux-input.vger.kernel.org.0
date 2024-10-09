Return-Path: <linux-input+bounces-7224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFAB99708B
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7673E2832F2
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F40C1FBCB4;
	Wed,  9 Oct 2024 15:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OELBm3w0"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FE01FBC8D;
	Wed,  9 Oct 2024 15:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488683; cv=none; b=hqwM5vXADNFu2Z+xHu2GOt692psYUmCUT/ukm+gOwN3bsGTmfndsVKBaQqA68QKSNphOjI5aJzarxDDhmN+7H1t3pd1rixlp7q+IvCnnPvJ2O8UQrHNY2QvjK7RDdDt6HuaAJ2DpZP4jcmwm1hOQEb5IRPTSOcsJW+wnczscsxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488683; c=relaxed/simple;
	bh=vN3oSRt+DWWZYqxbDzof1CIKa34v7dtlDeUZmDHCEDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYuihjghRZgyp+VGk3TFZZhY4Dt2chw2DSgRDYaZe5xykt7tRg8DSn8soXtfwo0UICwWhpGc1IbcbdCEqD/EcwRKHRdYk72ouULOMHneKBMzcuGS4BN+thIzL92hhc37JFCG0vJ6cWESRmozSgOKfekPzt62uNMZyJUjJ4usspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OELBm3w0; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4994jS5K008613;
	Wed, 9 Oct 2024 10:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pyKC/dASsCtA3+TZDyqPMdHSCS0SUd5biiWP/yIPQtI=; b=
	OELBm3w0TyQMFW+Pyki/LB0esGQNT/NKmYuitCVLVuSnvCAo4XM/xNYeYzjtABeA
	A85Fzf5zkybp5IykVQwffQVIdA7y+Pxl1WD0QwwRdu/6fo6KIDnouT29ys6gEtBY
	pzMO6xHG7UNXMTwfdu8ZKyp4CflyEohZgG69gyJHFvG/WSEjDtZNBuHfX8tJf9DK
	OGpbRtSWSRxkvWxFAptfZ5TZsU0Zm8vPvkVMIUf1mgwqHjBVHs+zcmeGIfCQ7NpX
	wEvLS51GQ7k+7VdkmCeKw2s14HJJbRf/ekOdGpFZ3qHlH+sssCqQaqTK/It6LljY
	th3ZTtv9gWKhnYW5qYRUgQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4231vhwgp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:40:59 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:40:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:40:57 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id AEAF582024A;
	Wed,  9 Oct 2024 15:40:56 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 2/6] HID: logitech-hidpp: Assign max concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:42 +0000
Message-ID: <20241009154046.1011226-3-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
References: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tgIxNsgKgqIDtWuiPzLtcGz4ZB62_3nz
X-Proofpoint-ORIG-GUID: tgIxNsgKgqIDtWuiPzLtcGz4ZB62_3nz
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 400d70e6dbe2..843697b176ef 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2895,6 +2895,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 	ff->set_gain = hidpp_ff_set_gain;
 	ff->set_autocenter = hidpp_ff_set_autocenter;
 	ff->destroy = hidpp_ff_destroy;
+	ff->max_concurrent_playbacks = num_slots;
 
 	/* Create sysfs interface */
 	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
-- 
2.43.0


