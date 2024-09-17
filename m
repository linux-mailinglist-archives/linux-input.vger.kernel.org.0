Return-Path: <linux-input+bounces-6587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9EB97B5E0
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 916D8B230B4
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DA61925A3;
	Tue, 17 Sep 2024 22:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="l0sIbnJ9"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6198B158522;
	Tue, 17 Sep 2024 22:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726613081; cv=none; b=fW5G8//IcfgA2+8Ayn4ybRfXEnjthmYgmbwjbvYF6oydP1nEFjoWFo1tHp6I3zXGCFjkkQFR8NHnbv9oUuVQOPqp0/CCG2aHbGz87lkGpg2p6QEvkSVh9Dj5uObnemzXpwJR3oZIM+c9mm0jlqnmZ84Bs4gYgB5LyWtHps1IlEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726613081; c=relaxed/simple;
	bh=Q5KWlqEFVdruWvrKVBozCOZU5hPkfxydK9faXJBbNr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhVAI9MytRE8etEck7J9GIruqu4Gcn+w0KmcpwFA+IXCeabF79YDoKyBb2LxJYBYzsISTExxf9UDAA9pWFjAx8p/p4jBt9LLeP0iYvr9Y8iwfny9NvfApII0vLV/FzOymzYLADugWGyIsIdpAwfsC7l/vpeGe9c5rAXfcoJt3vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=l0sIbnJ9; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H62R8p000811;
	Tue, 17 Sep 2024 17:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4PWAFjB+tAqkahdkYgxAvFZGDOgghbdCykeRaL9hNW0=; b=
	l0sIbnJ92pKn1FOXQo1W9b7ITrXtX65kIXENRqmWeCJ2PP1KjDioSRGAXDHwIfXT
	tT8MWlcjz9kF9xVbSbXWDbyWxxHZ+6LR7cCHo2+bxtNK7AsOFVwt2A9KKjC8fEwi
	bLfx32PlGitg9q5CPp25CgMaowBUCxYZ0GLs5LF2HWC2Ys+5+a3/dcXSspGawtNf
	hw/n9jonmIIL4hLIRi68/2PLrNILnqhx/HuwhACQkegqbo6qQwvEEyeiAzIllGNR
	whgOdwvGgOqcvWjkEbKUoZa/U+Vb0taRFp8kDZ68aCNeHdymWVQZgMfdf8Y/E2cW
	wMAXG7PrAToScPHjhJ9Dsg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41n6wjkvv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:46 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:45 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:45 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2F573820244;
	Tue, 17 Sep 2024 22:15:44 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 4/6] Input: cs40l50 - Assign max concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:10 +0000
Message-ID: <20240917221412.1003718-5-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: zSeUmsQff9DQpBf6J6_wgayRKOFyuGQ9
X-Proofpoint-ORIG-GUID: zSeUmsQff9DQpBf6J6_wgayRKOFyuGQ9
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/input/misc/cs40l50-vibra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 03bdb7c26ec0..733f2989183b 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -508,7 +508,7 @@ static int cs40l50_vibra_probe(struct platform_device *pdev)
 	input_set_capability(vib->input, EV_FF, FF_PERIODIC);
 	input_set_capability(vib->input, EV_FF, FF_CUSTOM);
 
-	error = input_ff_create(vib->input, CS40L50_EFFECTS_MAX);
+	error = input_ff_create(vib->input, FF_MAX_EFFECTS);
 	if (error) {
 		dev_err(vib->dev, "Failed to create input device\n");
 		return error;
@@ -517,6 +517,7 @@ static int cs40l50_vibra_probe(struct platform_device *pdev)
 	vib->input->ff->upload = cs40l50_add;
 	vib->input->ff->playback = cs40l50_playback;
 	vib->input->ff->erase = cs40l50_erase;
+	vib->input->ff->max_concurrent_playbacks = CS40L50_EFFECTS_MAX;
 
 	INIT_LIST_HEAD(&vib->effect_head);
 
-- 
2.43.0


