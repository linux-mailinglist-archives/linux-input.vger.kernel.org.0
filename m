Return-Path: <linux-input+bounces-6584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 057BF97B5A6
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 00:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FA4B1F22493
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 22:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C07E192B63;
	Tue, 17 Sep 2024 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UFoCebZO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A70415ECD5;
	Tue, 17 Sep 2024 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726611361; cv=none; b=fguiifFgdKJuQq0IG8gyH8kDqD3vqfhMHcOYu0f/EufHub0eOxd5dhQL5CXXyRPhX3Wpvx+VawApZDcd7FL7ayt1fn/3Fhl+YRjFFbcU93jNTYap5Y580FS27zPSvaFLp9UmKueQEpR2Rwhxct0PuOu3lnwopm72i62kn/eGzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726611361; c=relaxed/simple;
	bh=IVaYPAA3Q/12P+uPdVn47GgZJ/fdH1FHZB2NjGgYVic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gMRGjHRC0pWJIsAjGSrwIEHzDRsZLsBVpU57JTlIJ86eckdbRwbHZ3/6aIs3tqPgZG6hPxCVBfkH0yqM1UwRftt5ypXmR2RbASy6s+pEBP/xBak+J7bSh0gVmcO2tBsR2/rE1f+KbYWPt2mLwuGo81P1nC61mO/5+yMGEVm9u04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UFoCebZO; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48H9n74t005331;
	Tue, 17 Sep 2024 17:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=TCdwABpkNR7O/jzOBWgPx9KVyKo76p1h99dB3k2a/EQ=; b=
	UFoCebZOjYRrTgvVabWXLsjM7SxEYCCQzlrJnrP+WC0UgztPwndIDLvAOPYiE9Cf
	VO39sPNPUmnjSj5tVZFSgphPBH2ZHL6Du/ryUkjN6Ml+/PJFyo5TsJRmWV9sgbE7
	MpwC8tt43IjenKV816cOCpewMpA6yjSSc4GKe3iiuNZto6mlx8Bng56f1t39nwPC
	UsYT1JRESFnOeVATJQDZDFh71zT6Or5cSugqFEn/ZgI6N42x0jdHshRYJzpP+a1x
	xYVB/vfY9nvTW3On38KoHzUjspGEmRvFYvyhf/RSrzWs8fhOK3u8PAksoA2xkjEc
	MKU/fgKpI+KyK0a0Ol+DgA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41n7vy4991-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Sep 2024 17:15:50 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 23:15:48 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 17 Sep 2024 23:15:48 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1C3EA820244;
	Tue, 17 Sep 2024 22:15:46 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 6/6] Input: uinput - Assign max concurrent playbacks
Date: Tue, 17 Sep 2024 22:14:12 +0000
Message-ID: <20240917221412.1003718-7-jogletre@opensource.cirrus.com>
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
X-Proofpoint-ORIG-GUID: BR-NkRPfMVUqrKvPpGVkKUF7PDJXm_IQ
X-Proofpoint-GUID: BR-NkRPfMVUqrKvPpGVkKUF7PDJXm_IQ
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


