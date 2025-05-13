Return-Path: <linux-input+bounces-12345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBDBAB5FB9
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:00:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 032D97AC585
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 22:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9453C1E1E1F;
	Tue, 13 May 2025 23:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="zsGP4I6M"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BE11F16B
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177211; cv=none; b=pPyenq3SjSkFRRm7gQlScbx284IdQUN+WRu86pRUujav/HXgtt9jEe9lF/1GIygdjI1hOgaaqrlYpqS8ehK5ipEz7gC4YbbNGo0ttioj/QutLk8a3Xnsu3rpvSeqBLc3usAl9G81FcFmHGUmes8wmIaCWaPzzMCPk8mBUfNXxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177211; c=relaxed/simple;
	bh=tL+R5O/UVIG/5zRVi5dd8S1p7icNO2aglS7wtusJ4sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/LtcPE0l7ScrDicqdSga/dZ1yVs9/q/bqvYyQE8kx8J15l3XrgLJbe/pFeyOzInIWdXPpSYq/OvENml9oIhDHA2fkN5IODxry5GNzfPZw5TCh7oeFbxmoRStJbC5OagkOITmlPzWebc64L4wH/s6jIDm4Gy+XiH0WbIm9qtljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=zsGP4I6M; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747177209; bh=tL+R5O/UVIG/5zRVi5dd8S1p7icNO2aglS7wtusJ4sc=;
	h=From:To:Cc:Subject:Date:From;
	b=zsGP4I6MaLtnCjQQlxRZetrHp5ANaGFsyg/1GT3jMwsLhq6ErYzlKHM2IH6xPVZhO
	 bPJVSIx8prVa5eIXbn8USFMWBI6XAyz0HbMyMHu3xOyOahorJK3OSSXxOqeO5mtpIH
	 B+yPCK4/4AfwYezlCdjgZBAV8GsgiEzTjElchvbpxjqFJGKf6Dn2ubP7y4WfPc6PZR
	 eTxjDhZtoC5d2nVJjsQaDwhtMf8Oto1o8TkGF2w3MELgUXhIe8EVkynGXYSusNTZ8i
	 YD/PMNWrQ3N7kdHMw7ApIPZmpVvmLV0/PlVQHQXUmYU3U/7Bfjj0LutWeBAu/g0PZ9
	 KMDO1fMex/Rpw==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id EA695A199;
	Tue, 13 May 2025 16:00:08 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2] Input: xpad - Add more controllers
Date: Tue, 13 May 2025 15:59:48 -0700
Message-ID: <20250513225950.2719387-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
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
 drivers/input/joystick/xpad.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7746530da030..c066a4da7c14 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -293,6 +293,8 @@ static const struct xpad_device {
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
+	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
+	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
 	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
@@ -357,6 +359,7 @@ static const struct xpad_device {
 	{ 0x1ee9, 0x1590, "ZOTAC Gaming Zone", 0, XTYPE_XBOX360 },
 	{ 0x20d6, 0x2001, "BDA Xbox Series X Wired Controller", 0, XTYPE_XBOXONE },
 	{ 0x20d6, 0x2009, "PowerA Enhanced Wired Controller for Xbox Series X|S", 0, XTYPE_XBOXONE },
+	{ 0x20d6, 0x2064, "PowerA Wired Controller for Xbox", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x20d6, 0x281f, "PowerA Wired Controller For Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x20d6, 0x400b, "PowerA FUSION Pro 4 Wired Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x20d6, 0x890b, "PowerA MOGA XP-Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
-- 
2.49.0


