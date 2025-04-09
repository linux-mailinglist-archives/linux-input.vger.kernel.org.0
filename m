Return-Path: <linux-input+bounces-11578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4F6A8262C
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 15:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B691BA16F9
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 13:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38569263F4E;
	Wed,  9 Apr 2025 13:16:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF23263F3A
	for <linux-input@vger.kernel.org>; Wed,  9 Apr 2025 13:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744204603; cv=none; b=G2SJ5JsHjgR0IwmcrKtspF/lD02QkZi5ZD2I1cE9J5tYaaZNw7BxOhd5+YfcFiWrDHg39SFqtxr+sPsKgrXuznklbFqy8guIz6Iroge20h7hDlanhjFzze6eL5cBSaZzNQSHhYVCXsdZXi9MhriWqtjMqnGLF0EbELqRgHUvSmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744204603; c=relaxed/simple;
	bh=fNfs/oRPqDo6ajZ+Hk2Cy7Qm/2Gft469D9o4g4l5xXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQO+Ik9UndrdvSGKy7qXaCgfGggL8/pwV4ealhxgdAwxq3HfVcfb3prm9mFTlJe+PhbI2+SSlJ9z7EV4J7lucRQN7x57lcxaO/1nwLh9k8XitqSglUh1MYSIQk1PCf0RGSZbg0eENwBkilLVnCkuXfXqXEDSGYf5NDz1xynDa8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4ZXjsw4FXxz4x3dG
	for <linux-input@vger.kernel.org>; Wed, 09 Apr 2025 15:07:48 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d6c1:79b5:9acd:4fad])
	by michel.telenet-ops.be with cmsmtp
	id b17g2E00N1LzlAN0617g3f; Wed, 09 Apr 2025 15:07:41 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2V9X-00000000DQa-2WGZ;
	Wed, 09 Apr 2025 15:07:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2Rcu-00000002xNn-2keI;
	Wed, 09 Apr 2025 11:21:44 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Kerem Karabay <kekrby@gmail.com>,
	Aditya Garg <gargaditya08@live.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on X86
Date: Wed,  9 Apr 2025 11:21:42 +0200
Message-ID: <4b046ce1cae2170453037c7ea006c91c12383dab.1744190441.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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
Fixes: 93a0fc48948107e0 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/hid/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a503252702b7b43c..43859fc757470caf 100644
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
@@ -163,6 +164,7 @@ config HID_APPLETB_KBD
 	depends on USB_HID
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
+	depends on X86 || COMPILE_TEST
 	select INPUT_SPARSEKMAP
 	select HID_APPLETB_BL
 	help
-- 
2.43.0


