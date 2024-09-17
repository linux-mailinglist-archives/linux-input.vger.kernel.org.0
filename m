Return-Path: <linux-input+bounces-6588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1597997B5E3
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6B181F25B23
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5673C192D89;
	Tue, 17 Sep 2024 22:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PhT2xBKM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4AF1925B9;
	Tue, 17 Sep 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726613083; cv=none; b=oedT/L77GBHJuGZ7wnhF2dhHa2DOBfVhTADfO+mVsxwPVNNBurmPbfrbP2sIVTGJBjvXsOAA/K6QA8sP9re06NC5FwppX9MxPgqFUOt+zGMJpl/biwXV5JJLRwk0PCAMT7Fq66AIIwjQqaiVUU6XIG7UJgSmryxQ+wLkYCklqSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726613083; c=relaxed/simple;
	bh=WOHh/UpaH8St+UhgxQ7+nTUjI5YWKW9EZ0ZmLituKTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7aWeYHIfAir96vQo0Z/i3c9MIKaz4xsG46/KaayHb++Lz91AeIZS/4i9mwo26+aX4XQwGy+YidRhED3xc+9ju86QHc+c7J8rSE1QEZ8jBwcNFWlOt88EE05qPCI9SYjtJ9wSKWiYCkA39Iq+46vdQewdWkeOtMDUzh/vn4lYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PhT2xBKM; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HBdjOn007522;
	Tue, 17 Sep 2024 17:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DPKVopMgdrrwHMHENM1Bl0UTsCXlqlh0hbgfzu8Bkwk=; b=
	PhT2xBKMFmhZZmn2SGPbdipXGYJtwNPvgwoAQwCKtgX811BcbX/Lx2IQg0M7m1kC
	a5ua8smwNbJNkv6MQAORBiyqngNXiL3zBQd4i/9boT7bSGbbROHP+CmCHXB5eL2a
	tJjjmchs5mixb4NGcq90O+bctxTQgf9+hYKG128RBu9SMVPD7FiMaOf/cpYRlowB
	/PC0mXtZdUF9RBXL4AWr+o1CxlSzcVyGIrTBIULQawTMZjuJS71qoiBnnyaB8I1x
	NiAGHUX1i785AehH+QcQIYAWqfPYVqpyD2jQi2kMHh8tLWbZM/1CN816S5Yod+42
	djPpZ4SLFaiqVCgr+MIFjA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41n6wjkvuy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:44 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:43 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:43 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B1AC1820244;
	Tue, 17 Sep 2024 22:15:42 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 3/6] HID: pidff: Assign max concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:09 +0000
Message-ID: <20240917221412.1003718-4-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917221412.1003718-1-jogletre@opensource.cirrus.com>
References: <20240917221412.1003718-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: h5nUleeCzEeMGWUJP86B9x5kUpacBnZb
X-Proofpoint-ORIG-GUID: h5nUleeCzEeMGWUJP86B9x5kUpacBnZb
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/hid/usbhid/hid-pidff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..dd260fcdad60 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1309,6 +1309,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->set_gain = pidff_set_gain;
 	ff->set_autocenter = pidff_set_autocenter;
 	ff->playback = pidff_playback;
+	ff->max_concurrent_playbacks = max_effects;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
 
-- 
2.43.0


