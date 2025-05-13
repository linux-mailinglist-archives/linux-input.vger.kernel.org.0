Return-Path: <linux-input+bounces-12347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF73AB5FC1
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 858477A6143
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 23:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84281E991D;
	Tue, 13 May 2025 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Yg0+ciBc"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C88E1E3DF2
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177401; cv=none; b=d1jDU0TN9I8ElanB+QL4/kM94183Ei7uzWm+tgQ9NtIFmoJ5uP2N3Ut7jNso1SX9g5xFsdhbhxBM1Pb3Fq/pNzYyCzbeeVcgLWYqsxFF3UjjDG5qNQ3ZBi363vw9U8SY97KfKZ9bUGIO4kIFJgYQRKl/JFR+RmY9CkrElpjqaLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177401; c=relaxed/simple;
	bh=QMhd193Ty2SO3GdkxWB+HNMqi3ZyG8PQnqYpkNN9ZBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPJ6x3hw9Owm380FIjnj4JXqFIFwpmdGnkP4I3x+ZJRVz5aSIV0byikmJlw0k4YogY5ye/ZrKmPoSwMUe1y6OXVo1gxCDn7UWIRvO4vFVrGbCjcKr/xh5b0gVohPWzjZdob6OHas0M6zTu0PFRpoNSBiseD1/rJ3NTwUUcOjEWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=Yg0+ciBc; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747176916; bh=QMhd193Ty2SO3GdkxWB+HNMqi3ZyG8PQnqYpkNN9ZBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yg0+ciBcntHEY4NeM6Q48VeGMvO9LJvRaxFm4HPoZv52S7UGThNkDTp74GPdGXnNB
	 OCh/LWtRkmQkJCe4aeUjXLyKgSdWRWj3WplhvdYnJ+B4723UjdYQAtQYP6h2JFyTN/
	 PF0+32SsOOQvnf+BgYlq4i6S8fO7IdY/4ACy9zt4TH0S9BP4Cg3Z4XktZ49hNxZaYJ
	 zrVj317A3r8dyC4YdhS91xwxWIrfDZcor9VGxP1xsYj2mVGGV+7gtfli6iuUhNSzu6
	 e9MdWyt4axyPyahCdpMqIwzIFAIvt9+t70QxnMYEFop34Y2l5oVSWTDlHRmx7Zx77y
	 DbJG/4i2vstXg==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 926D5A195;
	Tue, 13 May 2025 15:55:16 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 4/4] Input: xpad - Add more controllers
Date: Tue, 13 May 2025 15:54:02 -0700
Message-ID: <20250513225411.2718072-5-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513225411.2718072-1-vi@endrift.com>
References: <20250513225411.2718072-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds support for a revision of the Turtle Beach Recon Wired Controller, the
Turtle Beach Stealth Ultra, and the PowerA Wired Controller.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7746530da030..03449571a19f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -293,6 +293,9 @@ static const struct xpad_device {
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
+	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
+	{ 0x10f5, 0x7072, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* bluetooth */
+	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },		/* wired */
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -357,6 +360,7 @@ static const struct xpad_device {
 	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
+	{ 0x20d6, 0x2064, "PowerA Wired Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x20d6, 0x400b, "PowerA FUSION Pro 4 Wired Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x20d6, 0x890b, "PowerA MOGA XP-Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-- 
2.49.0


