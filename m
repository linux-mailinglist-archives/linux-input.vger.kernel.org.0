Return-Path: <linux-input+bounces-7221-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B4997074
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A3411C218ED
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59EC01FA259;
	Wed,  9 Oct 2024 15:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KvOF+XYB"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FF51F9A94;
	Wed,  9 Oct 2024 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488470; cv=none; b=cnQZS0gDxO79+Y0uRnZY/EYocGmCni9yK1b2UbIFq8P+AxTYnTGUzeUgmtMxhG/Yt1PzEt43h+EUTNGZJrhAl1jFG7lmOtQbuAbQ9NDYie49QCFPVX58jG4/cI4MqRa8mN3MrBxOzaWK7O6eWYCNdsa64Z4mJotbfhngG39Ou98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488470; c=relaxed/simple;
	bh=IVaYPAA3Q/12P+uPdVn47GgZJ/fdH1FHZB2NjGgYVic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gfbHACokMwNeRzSaQX7dRrwU6YKPgn3oPs8ZNU0G5ZN3Uzx+DZ5CQlhqV9yr5YGCLNyDSIW/3ley/kY6AmirgPlDEEE4XxJNxU1zxq3yy8/h0/hM0AYUJ1SNm/EaPsPqBWrYYtLQH5a0pIt3fJsy9k9IfpjB5vKEg2irLQHg0MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KvOF+XYB; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49949FZr031957;
	Wed, 9 Oct 2024 10:41:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TCdwABpkNR7O/jzOBWgPx9KVyKo76p1h99dB3k2a/EQ=; b=
	KvOF+XYBPWfdTw5ZHXvzRJyt14ChOM4J0eWfrM/sH90FzsR3ANXq/FxSMPSMCsZA
	7+nx88CJqqFWAEN/oOGqROYZxOszL+lJ01abegnlFtQ9ggMiwZ/P9UQeRad8q05a
	h8W3aKs8Hg4cPNSfvctxkZT1W2AEglbgTDyKObPi3p7G0TGY7hB0FpKie3dCEa8+
	P0ZVBeb8ddDQSghjQt8nbs7aAcew9W8bobdZfSdda2a58PydBaviNNWCIkdmkBPk
	C73x6L8TTShq5noIWd8bVJd1PXItv5SseFQ6EwATLbBEXKx43WiGtvMjwwrsQ+5R
	UNpLCS3YMLFvS9BgAQx70w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy661j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:41:05 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:41:03 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:41:03 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8C06182255B;
	Wed,  9 Oct 2024 15:41:02 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 6/6] Input: uinput - Assign max concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:46 +0000
Message-ID: <20241009154046.1011226-7-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: b0SDrwfpwxMGIe2kUFhlAZVoiREbSzD0
X-Proofpoint-ORIG-GUID: b0SDrwfpwxMGIe2kUFhlAZVoiREbSzD0
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/input/misc/uinput.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index 445856c9127a..81372e942ba4 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -350,6 +350,7 @@ static int uinput_create_device(struct uinput_device *udev)
 		dev->ff->playback = uinput_dev_playback;
 		dev->ff->set_gain = uinput_dev_set_gain;
 		dev->ff->set_autocenter = uinput_dev_set_autocenter;
+		dev->ff->max_concurrent_playbacks = udev->ff_effects_max;
 		/*
 		 * The standard input_ff_flush() implementation does
 		 * not quite work for uinput as we can't reasonably
-- 
2.43.0


