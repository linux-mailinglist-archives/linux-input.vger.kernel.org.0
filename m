Return-Path: <linux-input+bounces-11692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524A1A83D0B
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 10:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A2A3A80A7
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 08:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3529B207A23;
	Thu, 10 Apr 2025 08:31:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395411F1932
	for <linux-input@vger.kernel.org>; Thu, 10 Apr 2025 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273864; cv=none; b=tePqgN0EhVe6f+JEsFjocR/iK7XcbUrdj1DGBHo99qTak4nvPEfeBov3/2cs4u9J+1WPaTOoEXpStNGnV2sCFW/dYr1BXE68wsJw6huFtIE+D78TIlx3cWXc9SsiDg7bPcddHImpo1KbBkTtSuRGtdsCc4X3xX7vn6JazTcMu5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273864; c=relaxed/simple;
	bh=WNxzZulseYfokjA82gBJGgk0nI2uc03lGM7VmIHXjtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCQ590b3WO36KPV4p03xDPJ1V8J9+Wilj/m9he7hlFtBOX+WD6RV3s5tMz1xF6nED/MBSVVSWRGo9woOxP1Hg1541kD53qTJLxuDJJpbK78C0glQsLQz7i15gizWAWv7xxfBHh12UiehyBJ2C3n8Iq9uVW/XFilHm6/SeBsiFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1f1c:893d:f419:6517])
	by xavier.telenet-ops.be with cmsmtp
	id bLWz2E00N3xgA3j01LWz1B; Thu, 10 Apr 2025 10:31:00 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJK-00000000Gmy-2vB9;
	Thu, 10 Apr 2025 10:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJL-00000009IPN-3MAN;
	Thu, 10 Apr 2025 10:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Aditya Garg <gargaditya08@live.com>,
	Kerem Karabay <kekrby@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] HID: HID_APPLETB_BL should depend on X86
Date: Thu, 10 Apr 2025 10:30:57 +0200
Message-ID: <9f1fcef9094c62eea84872a5d4ba04eaf46f664e.1744273511.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744273511.git.geert+renesas@glider.be>
References: <cover.1744273511.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Apple Touch Bar is only present on x86 MacBook Pros.  Hence add a
dependency on X86, to prevent asking the user about this driver when
configuring a kernel for a different architecture.

Fixes: 1fd41e5e3d7cc556 ("HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on
X86".

v2:
  - Split in two patches.
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 119e5190a2df786e..43859fc757470caf 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -151,6 +151,7 @@ config HID_APPLEIR
 config HID_APPLETB_BL
 	tristate "Apple Touch Bar Backlight"
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on X86 || COMPILE_TEST
 	help
 	  Say Y here if you want support for the backlight of Touch Bars on x86
 	  MacBook Pros.
-- 
2.43.0


