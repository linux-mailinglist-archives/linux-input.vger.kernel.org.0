Return-Path: <linux-input+bounces-6583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D502197B5A5
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A466B282B1A
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030EC1925AE;
	Tue, 17 Sep 2024 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AgIGNb9v"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4131607A4;
	Tue, 17 Sep 2024 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611360; cv=none; b=SKHj1OvR6basbUiBbV1++hooEbIk/mJjDzM6W/SA492Kr0IbnguMWMGksMlBkmoWxQKvC8qpjy8DPJzzvd7pzNRACg3KTEwFz+nb6pVLnR5z1lhl2vyO+FjrtpcbmNjqxXEucPu2Yx8Q9bspK4JPB1853BnL3NOuVHC7CNfe/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611360; c=relaxed/simple;
	bh=49NVQ2yqL/opbcve1AD5yU3dx5v/JkhFF6MZmcX5lag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WsyG+Pclzx/t29mmNKdg3HxAl8F8kDShVD+QDeFhfW9V9+CSXNmOWRyBSLRVWj057BEg/Z5+LcHLWURR0kfhg/cphoeClNyrGeetId6YeBDigNkqS/JViVprULeyP+UdJArJdmsr9j84k9YnZi3aVGEVNBu0cZGGtUfs5Oz8syk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AgIGNb9v; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H5vDc1008726;
	Tue, 17 Sep 2024 17:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zgVO9U8LyTR4hlaMioqYBrhe36zqzDVXzY3C/MXqVPo=; b=
	AgIGNb9vQrWv0ViKiDY2BMwMrPTVurN34VjZaNhZsUPUxP1Ocs5CYf9MJW2sGyNF
	bGLZ4aGbvSM0RAjt6X/6t9ALGXSZIRB3dQQHxs+7Hrw5wXj0pHyhKGhoSu/QW2Q3
	YQSphHjIuRzqTBJnZS5Kh1Vr3YIhfAdhS1FTeLH+LpOzg6q67LSIhO4ghzZYZjfx
	ZHJOy/pi0+3p2ynYXI84UsiVD/wz9WlsnLxJxYdnM5BAgqN9q/Qw2GVkU3ihtaJF
	5c8hX8w4h8AXtWbj9f8NdDMUXzXm8i3mVWZgBFOBfIwJCRDfaZaJJIk5PA3kMFPg
	cJidFsuRChNOtzfWFOY3aQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41n7vy498y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:48 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:46 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9FD2C820244;
	Tue, 17 Sep 2024 22:15:45 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 5/6] Input: da7280 - Assign max concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:11 +0000
Message-ID: <20240917221412.1003718-6-jogletre@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: 7dnxupkE_pX1xJlPoLNzPyO9Chw0RgF6
X-Proofpoint-GUID: 7dnxupkE_pX1xJlPoLNzPyO9Chw0RgF6
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/input/misc/da7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 1629b7ea4cbd..3d892ba343d0 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -1239,6 +1239,7 @@ static int da7280_probe(struct i2c_client *client)
 	ff = input_dev->ff;
 	ff->upload = da7280_haptics_upload_effect;
 	ff->playback = da7280_haptics_playback;
+	ff->max_concurrent_playbacks = DA7280_FF_EFFECT_COUNT_MAX;
 
 	error = input_register_device(input_dev);
 	if (error) {
-- 
2.43.0


