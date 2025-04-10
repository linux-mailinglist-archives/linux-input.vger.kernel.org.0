Return-Path: <linux-input+bounces-11693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A405A83D0E
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 10:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9653AC425
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 08:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C901C20B7F0;
	Thu, 10 Apr 2025 08:31:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2DD1DF984
	for <linux-input@vger.kernel.org>; Thu, 10 Apr 2025 08:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273864; cv=none; b=ZkTqAvg8WYWjwTqeojq1cd9foqMhoS7ZKAnnUiLqRV4xBWbut72bOXhAuHke6xbWw0c64+y6znNQZSYx67E8yqqmxHT7Q1u1gbxj+MQ5ZEPJXXPaIw3UroCx6OEr2Y3gWRMTZJr9qNwkE/xrrMCW1wZdulogVnzseG969d9YKLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273864; c=relaxed/simple;
	bh=c3W3lYbW/FMvDBOJbYSIdkC4R/4qq0CQxdQuqipzVac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXoj1WYdIv4a4PjMwsbGa/aODRLK+Az4+RdLKOaNeXETtkG8me6Z8bI3rMXX81KNijQ7y5RTfaoWUT+wqYHi6WPQvlBhAkIsTK5RDetGL3/xbhbD//+PWIKj81lfP+N1pWAF4XjaYQRQzq43dBLaMu0xMCih9jGk7p26+4SX88Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1f1c:893d:f419:6517])
	by michel.telenet-ops.be with cmsmtp
	id bLWz2E00H3xgA3j06LWzi7; Thu, 10 Apr 2025 10:31:00 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJK-00000000Gmx-2pZN;
	Thu, 10 Apr 2025 10:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u2nJL-00000009IPK-3F5b;
	Thu, 10 Apr 2025 10:30:59 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Aditya Garg <gargaditya08@live.com>,
	Kerem Karabay <kekrby@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] HID: HID_APPLETB_KBD should depend on X86
Date: Thu, 10 Apr 2025 10:30:56 +0200
Message-ID: <8fb6c5995f0e72482bad6367d89d9ee5312dd409.1744273511.git.geert+renesas@glider.be>
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

Fixes: 8e9b9152cfbdc2a9 ("HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch Bars")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is v2 of "HID: HID_APPLETB_BL and HID_APPLETB_KBD should depend on
X86".

v2:
  - Split in two patches,
  - Correct Fixes.
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a503252702b7b43c..119e5190a2df786e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -163,6 +163,7 @@ config HID_APPLETB_KBD
 	depends on USB_HID
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
+	depends on X86 || COMPILE_TEST
 	select INPUT_SPARSEKMAP
 	select HID_APPLETB_BL
 	help
-- 
2.43.0


