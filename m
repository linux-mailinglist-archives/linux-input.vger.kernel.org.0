Return-Path: <linux-input+bounces-6586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38997B5DD
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11F141C2343C
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11883166F1A;
	Tue, 17 Sep 2024 22:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="klTkunSS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E115B551;
	Tue, 17 Sep 2024 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726613080; cv=none; b=PQuw83fJ+LFR1T/k+PGWe5adS/W/oGhkb1CdnFX7rNT0pBaXBzAygQxW7QFSngFE014gki1gcStvyXz24NnTOgQwhG3ozMU/FeP+1G/PDL9WudBe1Vlvo28SDGV3exjk7h3PINIMqxZb1DD4DB5Etw/sw7fs1GyaRomzgFWL8cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726613080; c=relaxed/simple;
	bh=vN3oSRt+DWWZYqxbDzof1CIKa34v7dtlDeUZmDHCEDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXk1HrHdMGrYc7LvtAv+DD3R9TnoBYlVx1PTZsBDsZEiSLxsdetjD0beIw37C4WHBiC49VBJBHWFpPjc1xrm6uEr0fygT1B++dq3y/4s6WPbj+sDU62v8zSVG4+TygHeeM1e36K35eO4J++vbFh1oe5RxhutCGlyZrtuW5wHzcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=klTkunSS; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HBdjOm007522;
	Tue, 17 Sep 2024 17:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=pyKC/dASsCtA3+TZDyqPMdHSCS0SUd5biiWP/yIPQtI=; b=
	klTkunSSqLk8Clnion7dvY7MGP7Yv59W6N5ORsfWF1cxE1SbQYPSqniCn7wzeeMu
	NRlf6dxRm1lcAPjiXSK6kbFxLvHnJcaT0iTKuTuz/tthPG9ywlvV7soEmnrJ2I4A
	uMtE4vrkAi8VEYMlZwABko8kqf/wqpLNXeiXoZP9ruRvzps+5Fe/idI9Bhzge0z7
	uCoEm1QH4WF2Ga8VEAIVxS3B54D/RUt96/Zfye6dCB4zyrCilYeNCj58cZvEI0US
	ohRqlv6uDlvSyHVT5UZ7ys1N1m5HRksLA3Q8c9uNpMm/I9eD/CkNmJbgPtQPvGS6
	1WI4oli1gfhEfG4skFiLbw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41n6wjkvuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:42 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:42 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 40FEF820244;
	Tue, 17 Sep 2024 22:15:41 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 2/6] HID: logitech-hidpp: Assign max concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:08 +0000
Message-ID: <20240917221412.1003718-3-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: 05zfyn2WrKX2sYT4WXEebImTaUj3DDh8
X-Proofpoint-ORIG-GUID: 05zfyn2WrKX2sYT4WXEebImTaUj3DDh8
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


