Return-Path: <linux-input+bounces-10137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F558A3A96E
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D57C7A2B83
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 20:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170C221519F;
	Tue, 18 Feb 2025 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ap9alKiO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F4215194;
	Tue, 18 Feb 2025 20:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739910478; cv=none; b=MLmU7KgLGcGkOG34NQ1bJ6SLddCLnChbI0zsNtgFu4WO0EmynLTaQVAwedbPfcLY+bhqxStmeDYgCAwR5HqdYxxELP0lGI8yvtxyPLbyEBiYrgnTQgqx1+jw4/B7QXBSLfexhXZlRz4s/2sIyzt2ap2qzF8ZYa9J0gdNq+2Ybxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739910478; c=relaxed/simple;
	bh=c7Yb66aVzPwl1jZ51yRqIvDvE1XIEwTRDCJYU4pnHTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iHOn/9cOaIwcdg74zT6uZtCm6A9efH4RjXzZuZGI5C8ST1a7XwI3NHs+zotINDDlMq7jZ+OK7MGS97ekrNCjMAzH1xYRj2LRYq5taUpQWCdM+ZIlA/k7sFW1LuC9oxGKDKRCdLcNC+wMlrB2HyGlwg7lwkzdiD4rA5DwnVqAiS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ap9alKiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3666C4CEE2;
	Tue, 18 Feb 2025 20:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910477;
	bh=c7Yb66aVzPwl1jZ51yRqIvDvE1XIEwTRDCJYU4pnHTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ap9alKiOWPNgrZf/JVBdV5fWudzYI6ZOt9eoX0slY+vnXGoLXGCRAXk/4UFExd8/z
	 cNhnQXYkNd97TvAEgsRyQU9BGzy7pjYJHV0exz+FU2K5qOBzmCDrARt799+V8ajn8q
	 +cZ+KxGOnv4yw5H+dZBaMrs0fKWTEb8m8m9v7mXFqMyJNwJn9i/ePlnXpPRTTNwoMx
	 shqox9qXc89/eBdDpKztRHPIr7DHJcduxbG8ku4xHDHfBn5N9Lp0EyDcUgFbtZYgjn
	 h4uPOQ5Ty978zPwb5qdS9/8LCUCaNU5qOK1xjE75Ew2agG0onMVvkNqIfKzRc4P2k9
	 /Xce9QoBwWYFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Daniel Brackenbury <daniel.brackenbury@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/17] HID: topre: Fix n-key rollover on Realforce R3S TKL boards
Date: Tue, 18 Feb 2025 15:27:29 -0500
Message-Id: <20250218202743.3593296-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202743.3593296-1-sashal@kernel.org>
References: <20250218202743.3593296-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.78
Content-Transfer-Encoding: 8bit

From: Daniel Brackenbury <daniel.brackenbury@gmail.com>

[ Upstream commit 9271af9d846c7e49c8709b58d5853cb73c00b193 ]

Newer model R3* Topre Realforce keyboards share an issue with their older
R2 cousins where a report descriptor fixup is needed in order for n-key
rollover to work correctly, otherwise only 6-key rollover is available.
This patch adds some new hardware IDs for the R3S 87-key keyboard and
makes amendments to the existing hid-topre driver in order to change the
correct byte in the new model.

Signed-off-by: Daniel Brackenbury <daniel.brackenbury@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/Kconfig     | 3 ++-
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-topre.c | 7 +++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 9e2cde55b465c..979ebe69c8e30 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1151,7 +1151,8 @@ config HID_TOPRE
 	tristate "Topre REALFORCE keyboards"
 	depends on HID
 	help
-	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key keyboards.
+	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key and
+          Topre REALFORCE R3S 87 key keyboards.
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index ff996accd371d..b807d01ecca6e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1285,6 +1285,7 @@
 #define USB_VENDOR_ID_TOPRE			0x0853
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_108			0x0148
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_87			0x0146
+#define USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87			0x0313
 
 #define USB_VENDOR_ID_TOPSEED		0x0766
 #define USB_DEVICE_ID_TOPSEED_CYBERLINK	0x0204
diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
index d1d5ca310eadc..e69367267d841 100644
--- a/drivers/hid/hid-topre.c
+++ b/drivers/hid/hid-topre.c
@@ -29,6 +29,11 @@ static __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		hid_info(hdev,
 			"fixing up Topre REALFORCE keyboard report descriptor\n");
 		rdesc[72] = 0x02;
+	} else if (*rsize >= 106 && rdesc[28] == 0x29 && rdesc[29] == 0xe7 &&
+				    rdesc[30] == 0x81 && rdesc[31] == 0x00) {
+		hid_info(hdev,
+			"fixing up Topre REALFORCE keyboard report descriptor\n");
+		rdesc[31] = 0x02;
 	}
 	return rdesc;
 }
@@ -38,6 +43,8 @@ static const struct hid_device_id topre_id_table[] = {
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_108) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_87) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
+			 USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, topre_id_table);
-- 
2.39.5


