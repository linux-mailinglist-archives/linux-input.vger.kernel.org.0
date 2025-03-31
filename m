Return-Path: <linux-input+bounces-11419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBAAA76A37
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EBCE188ECCA
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D20B23F296;
	Mon, 31 Mar 2025 14:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ryuDpr9h"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C9423F28D;
	Mon, 31 Mar 2025 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432971; cv=none; b=uYaipScsU4dVxcP1+GWE3+Q/qM2w/PJrk6WBfBYgJwiy13xCtk3+1N22dG0kQqEAITqleg8cymEsD2ob5MhOqSI7cPGbyBD/hKhvz29+0kzc6goqFlUBAizjBN380I4jSniGRmHoldofDjGgZoKwmY9tMssbQr6qbCfuX6N34KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432971; c=relaxed/simple;
	bh=4G/B+se5WADzqz1Xsvdwithaxk0xKFqW0qoLHt2gCF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jyJ+sDOZPoHdhkYtz4KCaYMD0LBnvIv/eThByqytv13r/aXIumMhGQfWm04spI9bbQDmuN27cklPo8BWZ9BnDaKZ4+6qxCpS8evK/yjOwbkKahFBr8giBZ0onFonzHfi5vI3LFdCpDVAdTQdXGhbgJCgLW+DH5fPWPxAp00P14g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ryuDpr9h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4333DC4CEE4;
	Mon, 31 Mar 2025 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432971;
	bh=4G/B+se5WADzqz1Xsvdwithaxk0xKFqW0qoLHt2gCF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ryuDpr9hepZxcdNC0/VNDMYykQ6m5Yt0hptGNVjOFCKegZNlZOmhHsYiQrHe29S2D
	 Mw9DHdsGPVF/AuFYydz/KBnPmD3eeawJ3xhyj1S46PtvbQrUjgcGdl1yTROwnRpOzg
	 2XSUqw4D7xLTgyugSWLg0AzvDlqS3sBO6/wsARJI9INm+2+h0ZjsH+GBh8ChXbY7CT
	 pxaqjwSXnDVyZqxbDeHZMMc6078PNp1cWf4q5Nvk6CAbcn9dgQ2L0Vq+meIpHjk9BH
	 PI6JsoSKyny/v5kT+DZPpYxMW2ueq566HuQfxxluQz0pRz8wl9wH3WstTwssa8FuMO
	 VvCqk/aUQsSKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Makarenko Oleg <oleg@makarenk.ooo>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 05/19] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Mon, 31 Mar 2025 10:55:46 -0400
Message-Id: <20250331145601.1705784-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145601.1705784-1-sashal@kernel.org>
References: <20250331145601.1705784-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit fc7c154e9bb3c2b98875cfc565406f4787e3b7a4 ]

Some devices with only one axis are missing PARAMETER_BLOCK_OFFSET field
for conditional effects. They can only have one axis, so we're limiting
the max_axis when setting the report for those effects.

Automatic detection ensures compatibility even if such device won't be
explicitly defined in the kernel.

Fixes initialization of VRS DirectForce PRO and possibly other devices.

Changes in v6:
- Fixed NULL pointer dereference. When PBO is missing, make sure not
  to set it anyway

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-pidff.c | 47 +++++++++++++++++++++-------------
 include/linux/hid.h            |  1 +
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 929f5967e7cb1..503b22feacdbb 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -391,13 +391,19 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
 static void pidff_set_condition_report(struct pidff_device *pidff,
 				       struct ff_effect *effect)
 {
-	int i;
+	int i, max_axis;
+
+	/* Devices missing Parameter Block Offset can only have one axis */
+	max_axis = pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO ? 1 : 2;
 
 	pidff->set_condition[PID_EFFECT_BLOCK_INDEX].value[0] =
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 
-	for (i = 0; i < 2; i++) {
-		pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+	for (i = 0; i < max_axis; i++) {
+		/* Omit Parameter Block Offset if missing */
+		if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_PBO))
+			pidff->set_condition[PID_PARAM_BLOCK_OFFSET].value[0] = i;
+
 		pidff_set_signed(&pidff->set_condition[PID_CP_OFFSET],
 				 effect->u.condition[i].center);
 		pidff_set_signed(&pidff->set_condition[PID_POS_COEFFICIENT],
@@ -809,6 +815,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			pr_debug("Setting MISSING_DELAY quirk\n");
 			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
 		}
+		else if (!found && table[k] == pidff_set_condition[PID_PARAM_BLOCK_OFFSET]) {
+			pr_debug("PBO field not found, but that's OK\n");
+			pr_debug("Setting MISSING_PBO quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_PBO;
+		}
 		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
@@ -1088,7 +1099,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int envelope_ok = 0;
 	int status = 0;
 
 	/* Save info about the device not having the DELAY ffb field. */
@@ -1119,13 +1129,10 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		return -ENODEV;
 	}
 
-	if (!PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1))
-		envelope_ok = 1;
-
 	if (pidff_find_special_fields(pidff) || pidff_find_effects(pidff, dev))
 		return -ENODEV;
 
-	if (!envelope_ok) {
+	if (PIDFF_FIND_FIELDS(set_envelope, PID_SET_ENVELOPE, 1)) {
 		if (test_and_clear_bit(FF_CONSTANT, dev->ffbit))
 			hid_warn(pidff->hid,
 				 "has constant effect but no envelope\n");
@@ -1150,16 +1157,20 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 		clear_bit(FF_RAMP, dev->ffbit);
 	}
 
-	if ((test_bit(FF_SPRING, dev->ffbit) ||
-	     test_bit(FF_DAMPER, dev->ffbit) ||
-	     test_bit(FF_FRICTION, dev->ffbit) ||
-	     test_bit(FF_INERTIA, dev->ffbit)) &&
-	    PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1)) {
-		hid_warn(pidff->hid, "unknown condition effect layout\n");
-		clear_bit(FF_SPRING, dev->ffbit);
-		clear_bit(FF_DAMPER, dev->ffbit);
-		clear_bit(FF_FRICTION, dev->ffbit);
-		clear_bit(FF_INERTIA, dev->ffbit);
+	if (test_bit(FF_SPRING, dev->ffbit) ||
+	    test_bit(FF_DAMPER, dev->ffbit) ||
+	    test_bit(FF_FRICTION, dev->ffbit) ||
+	    test_bit(FF_INERTIA, dev->ffbit)) {
+		status = PIDFF_FIND_FIELDS(set_condition, PID_SET_CONDITION, 1);
+
+		if (status < 0) {
+			hid_warn(pidff->hid, "unknown condition effect layout\n");
+			clear_bit(FF_SPRING, dev->ffbit);
+			clear_bit(FF_DAMPER, dev->ffbit);
+			clear_bit(FF_FRICTION, dev->ffbit);
+			clear_bit(FF_INERTIA, dev->ffbit);
+		}
+		pidff->quirks |= status;
 	}
 
 	if (test_bit(FF_PERIODIC, dev->ffbit) &&
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 744a498462cec..8876d5f0cd87f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1220,6 +1220,7 @@ int hid_pidff_init(struct hid_device *hid);
 
 /* HID PIDFF quirks */
 #define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.39.5


