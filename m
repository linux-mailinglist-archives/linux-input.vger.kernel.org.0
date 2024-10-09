Return-Path: <linux-input+bounces-7220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A0997071
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 751FD282DC4
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6031F9AB0;
	Wed,  9 Oct 2024 15:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IqJcH/2A"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D01E04B5;
	Wed,  9 Oct 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488469; cv=none; b=GHPc2kf3fPJdcrRhCBLcg4rLWDGGdriqAg0E+bqlMaTM1rCt7xNBYeZSEoy/vF3SeZV8Y7m20LPXVLOuORrjQf1TcZ0+6ioU3AoRwnJgaq0waJ3bOZokqcgunJkg4Gjo6gZfh0ekwaWmCH3Vb4XRD1yWVCr/5Nt4kwRWbsUWeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488469; c=relaxed/simple;
	bh=49NVQ2yqL/opbcve1AD5yU3dx5v/JkhFF6MZmcX5lag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nB7k/Z8fql1lGE8+JYKGdFfqVdw7aj/NtBXpHs0mcBQhpeXezkv8UuVDWI3FYdRDmnF/6/ORXid9xvW0k80z/QGbHdgcnATuwkWmebKtGCnQ9sJSVKP2MGM/uW2zH+f7BV4YL5dYuGZsNxlwyDF9wFlmIEuQsekZplST6GTpyU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IqJcH/2A; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49949FZq031957;
	Wed, 9 Oct 2024 10:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zgVO9U8LyTR4hlaMioqYBrhe36zqzDVXzY3C/MXqVPo=; b=
	IqJcH/2AT2s5XNX+eDlroodcAFaX3WS4cqN50us7b01Xb+HpZjx3Ww9yWgnGQBbL
	O9GhUrpgLwN3eOSvJZJT2nyaQLyciDNihA+Tx64veq375YSTou0+WdWOV9F46pYZ
	Qc9hEUVUlJ0OnoSk00QgRQ1ZnQFcN88Raxq6kIf36d0mcCK4PImnI4Paw6qvD5hg
	RierL5C4Ipcri2ZktfHpZbP3G7yLLXS8PvnK6fJbEy6SVS8yAVnmJ0hip59q6f81
	SVXggl7TC5KBz7oph9lmTwygTqnxExmQW4NUOXbbFnOb7L3PN5enulR4siDPXkGD
	0ufREbc4tPv5jfEHsnHp2A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy661j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:41:04 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:41:02 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:41:02 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 199D882024D;
	Wed,  9 Oct 2024 15:41:00 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 5/6] Input: da7280 - Assign max concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:45 +0000
Message-ID: <20241009154046.1011226-6-jogletre@opensource.cirrus.com>
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
X-Proofpoint-GUID: e2KHIhlPesXc-r6etFwTudc8RNhva6XK
X-Proofpoint-ORIG-GUID: e2KHIhlPesXc-r6etFwTudc8RNhva6XK
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


