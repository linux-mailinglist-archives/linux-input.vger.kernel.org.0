Return-Path: <linux-input+bounces-7573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148089A5694
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 21:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4461C1C2101F
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 19:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6689D1759F;
	Sun, 20 Oct 2024 19:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="iQDQ0VFG"
X-Original-To: linux-input@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCC111C83
	for <linux-input@vger.kernel.org>; Sun, 20 Oct 2024 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729454242; cv=none; b=VvdbFv8WPSmGswBfTaKJZ4/LldUu7jixOv/Xb8YyHc972/TFFWQG+VDn4Wlr1O9jOODBBHD8kGMUXZAb5wNIhq+uDx7fiaCvy0WBZY3R1v3m5HTrLyx6UYUyB7XmkaWpPMzwsuhB1m+ZxUN3CWAjBDU/MlviL1mR3YSShyGN1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729454242; c=relaxed/simple;
	bh=apsx1SBG+n5K6lKlbzgITHhgVf+3+heApchwPtJ2tcM=;
	h=From:Date:Subject:To:Cc:Message-Id; b=aPiZZRoa4QZuaO/bvoj/AURjjKiCSQWln1MaO+ehCKab0JnH9wfuqKAZVzRiQVTaU0alchS6erjdXx6g+io4WqmGytCd+tijqgXqiju3FqtgUZ6spDMvmYXBeUrNHyoVAc7Iu7UDIe5ugTbyCap7ngCSWct6j0kKaEol1Mq8e9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=none smtp.mailfrom=bout3.ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=iQDQ0VFG; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bout3.ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729454237; bh=apsx1SBG+n5K6lKlbzgITHhgVf+3+heApchwPtJ2tcM=;
	h=From:Date:Subject:To:Cc:From;
	b=iQDQ0VFGevlwZzew2RVFyWWtpHCBtKSVtm9hg3EX3HfGBlw17Q2wFeWQ/QlpD+Wiw
	 7eU9GbkO38dyJfYoyqmWBxt8f8vHv9+fsi5PTQyxUGS1asXl8vs/p60rBHjmYVkHk3
	 36KBGMv+pWZcAAbg/wB9njsirz6Vmefj1Rs2dJlv3PuToO+BYu4zkvdvLkdl4puwLM
	 fTSd8fQOdtXFVolFResioqwFF3zvlVRj93ijsbmEzv4/iAnqLrcOGPNVb00jM2pPl4
	 eTWnuuo6z1ZT1EuM+NZcpU4N3iK2vnn9D3nucwfl1YjZ7Oyy5yahBd6h+M2ygazYaV
	 X70I+X4p8bHqUtVx8kUSeU7DyAVENVoYD/0CzE0NseRKGReIPeWdBEe6hFfK4hPxWu
	 vh3rbLEAoS/6cvmf97cndfH2G3QzUouezgKW2yj2F4lzPWwMpmycyBl4mvGKobTFb5
	 cCHvrpnU06ZLuwoFO7iKBODfFEUhweyrjM3sYMb3GdDKPWP4dAfJ4viWODC1GZosiu
	 ejtQLMFpoxyR3eWPNc064vibfMnQ70DGCmEpHtnSgSbNSreEMNghxWqTS0ApvTpbqm
	 pWLr5TE/IKNUW0VZo83V6QT9kqF6TF0IIzyT9Emawlle3+nPX7ma918FTJY1hEMrIH
	 yQW0yC6mddhs/P4DKxg41/dQ=
Received: by bout3.ijzerbout.nl (Postfix, from userid 1000)
	id CD7CC17525E; Sun, 20 Oct 2024 21:57:17 +0200 (CEST)
From: Kees Bakker <kees@ijzerbout.nl>
Date: Sun, 20 Oct 2024 21:47:17 +0200
Subject: [PATCH] HID: corsair-void: Add missing initializer
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Cc: Linux Input <linux-input@vger.kernel.org>
Message-Id: <20241020195717.CD7CC17525E@bout3.ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

This was detected by Coverity, CID 1600743

Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
---
 drivers/hid/hid-corsair-void.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
index 6ece56b850fc..d1fd04264656 100644
--- a/drivers/hid/hid-corsair-void.c
+++ b/drivers/hid/hid-corsair-void.c
@@ -553,7 +553,7 @@ static void corsair_void_battery_remove_work_handler(struct work_struct *work)
 static void corsair_void_battery_add_work_handler(struct work_struct *work)
 {
 	struct corsair_void_drvdata *drvdata;
-	struct power_supply_config psy_cfg;
+	struct power_supply_config psy_cfg = {};
 	struct power_supply *new_supply;
 
 	drvdata = container_of(work, struct corsair_void_drvdata,
-- 
2.47.0


