Return-Path: <linux-input+bounces-7219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33C99706E
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03881C2274E
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C961E0485;
	Wed,  9 Oct 2024 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="O5uoXPaV"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785311A3AB8;
	Wed,  9 Oct 2024 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488467; cv=none; b=dkdK1+xj65Qdnqv1DosoSN4mICZd2TeDKNQyTOPyEdNAJIqhRb0smdoWIhOjgIHg7e0lAT9BbfzraChT4+2nbYzAXcTBMA1tsoHcG/EqueSlz0uGOb6zL1L2tlpLSz8vPXHN+tBIsu7kM9I7E5oERJsgyo4BffrsX1FR2zpfD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488467; c=relaxed/simple;
	bh=Q5KWlqEFVdruWvrKVBozCOZU5hPkfxydK9faXJBbNr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+6Ly+Lj1k99fL1aTFHyjsTNvT9yvgp0kRoCKgKpQ8TfbIkRdpoMhXUeGQdMKhqAOfNP/H3f2A1bHTba3b8COzS9BWn87CzAnF/80yxKEu335Typw0+zSuO1fTPkhfg1RnbZVTXxYsrPYAGaGb40lBf4dUuw9MNDQVsCffF0OnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=O5uoXPaV; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499499oL031691;
	Wed, 9 Oct 2024 10:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=4PWAFjB+tAqkahdkYgxAvFZGDOgghbdCykeRaL9hNW0=; b=
	O5uoXPaVYmZU8dCCUYdljnias919kpZTg1IliFzkLrszAmS2XGVIxt6Z2MrSTU+5
	wGrcGHnOftry44PxUcU7tbkBqiWdO7oLbDwwmWbzBihX5szJnRUYkPXCX+JqGbOL
	pX3ZH9Es0NikxLkhzTlTKCKzPvzR1Y+PG78t5lsVekhgzZZxi/PKtIdMJlkbRrwB
	qN6oda3h0x5saSPO6sTzryrkxaCzljS+Ny+ZbvQXO9W6b3OkGCAeJAuF1O+IfeZ3
	aTlOlzCk3bgtc0N4XOwUrYUNvB6eSMYbjvuPnT+eBT3P3ywZcG5S3D+PTrfgF6RR
	O2e4MVMftVWWoLx3sLw65w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy661f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:41:02 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:41:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:41:00 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9B6BD82024B;
	Wed,  9 Oct 2024 15:40:59 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 4/6] Input: cs40l50 - Assign max concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:44 +0000
Message-ID: <20241009154046.1011226-5-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: rn4y7N3lYozhU9vQdHeXFnlSfEXVy6FY
X-Proofpoint-ORIG-GUID: rn4y7N3lYozhU9vQdHeXFnlSfEXVy6FY
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


