Return-Path: <linux-input+bounces-7733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DCC9B2D88
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 11:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B7AAB226D2
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988321DD559;
	Mon, 28 Oct 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9dRTPsH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC191DD552;
	Mon, 28 Oct 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112695; cv=none; b=pS+jxH2vVQ9NVLVPUyaKx128lkNoEPSp5E/ZhbZO0xa17Gjh/BRp+/RZFnOKRYpii5qpoghPx2a+UQJJZNf/4HkULjgl1/LluDgJ2E3QGP8X99J0JZQQIhLatFmnLfgEhYKVXJCLXvsNuk/5VB6UJ0NQkdHhWpwJRoQnH2YEzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112695; c=relaxed/simple;
	bh=8lJ+P9KSX9o1hRSB/48Wv+ZCfu9eEPeLGW7CKNQfTaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRBzwIQ0D53nI+/CqemSP2TBSlwHJDHobuOdtx6Qk8zfM99yHVNJ5u1XkbgMICD1qga+TK70YFf9VnxUvNr10BjYcIEnCHlXn7TFqmLU28Ue9TvhDmtoPihm1pYZa2mzEXLpV7uAjJBZZysOntEaTCJbs+YF4dx/BQlil8d3WAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9dRTPsH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C610C4CEC3;
	Mon, 28 Oct 2024 10:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112695;
	bh=8lJ+P9KSX9o1hRSB/48Wv+ZCfu9eEPeLGW7CKNQfTaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9dRTPsHbHjDKc7sX6frEfd+JHeGlheTBcdTei7r4kjn3l341NVtUC3ulD0+GBDJl
	 Sa1Mx1/cj2ly7151B3DV8y34KtITepHVVNSnLH0/k+ulvuDUb3zuBk+XgvxVU/GyxD
	 C91H0zEFGIudr4oDcetCx5x9/+ThWOjfrX9ni6FmpOlGDUIg4Z5TNQQai8+cFAzrdE
	 lwRti3NLWjdCwSJ9gLMjJ3L0+jdoYA5we4WW04CDWY5CLvz8By2xdWRwrxmszMuIjA
	 dkz/MSswHckc3ixXmGywvFWvi8E6vrPfoq5zodv1kdPNX4iAE7KMv2sHXy9DeW/xNx
	 VWKRrMXOuAhSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	hdegoede@redhat.com,
	dianders@chromium.org,
	kl@kl.wtf,
	dmitry.torokhov@gmail.com,
	viro@zeniv.linux.org.uk,
	namcao@linutronix.de,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 15/32] HID: i2c-hid: Delayed i2c resume wakeup for 0x0d42 Goodix touchpad
Date: Mon, 28 Oct 2024 06:49:57 -0400
Message-ID: <20241028105050.3559169-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105050.3559169-1-sashal@kernel.org>
References: <20241028105050.3559169-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.5
Content-Transfer-Encoding: 8bit

From: Bartłomiej Maryńczak <marynczakbartlomiej@gmail.com>

[ Upstream commit 293c485cbac2607595fdaae2b1fb390fc7b2d014 ]

Patch for Goodix 27c6:0d42 touchpads found in Inspiron 5515 laptops.

After resume from suspend, one can communicate with this device just fine.
We can read data from it or request a reset,
but for some reason the interrupt line will not go up
when new events are available.
(it can correctly respond to a reset with an interrupt tho)

The only way I found to wake this device up
is to send anything to it after ~1.5s mark,
for example a simple read request, or power mode change.

In this patch, I simply delay the resume steps with msleep,
this will cause the set_power request to happen after
the ~1.5s barrier causing the device to resume its event interrupts.

Sleep was used rather than delayed_work
to make this workaround as non-invasive as possible.

[jkosina@suse.com: shortlog update]
Signed-off-by: Bartłomiej Maryńczak <marynczakbartlomiej@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8a991b30e3c6d..25f96494700d8 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -509,6 +509,7 @@
 #define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
 #define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
+#define I2C_DEVICE_ID_GOODIX_0D42	0x0d42
 
 #define USB_VENDOR_ID_GOODTOUCH		0x1aad
 #define USB_DEVICE_ID_GOODTOUCH_000f	0x000f
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2f8a9d3f1e861..8914c7db94718 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -50,6 +50,7 @@
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(3)
 #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
 #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND	BIT(5)
+#define I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME BIT(6)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
@@ -140,6 +141,8 @@ static const struct i2c_hid_quirks {
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET |
 		 I2C_HID_QUIRK_BOGUS_IRQ },
+	{ I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_0D42,
+		 I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME },
 	{ 0, 0 }
 };
 
@@ -981,6 +984,13 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 		return -ENXIO;
 	}
 
+	/* On Goodix 27c6:0d42 wait extra time before device wakeup.
+	 * It's not clear why but if we send wakeup too early, the device will
+	 * never trigger input interrupts.
+	 */
+	if (ihid->quirks & I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME)
+		msleep(1500);
+
 	/* Instead of resetting device, simply powers the device on. This
 	 * solves "incomplete reports" on Raydium devices 2386:3118 and
 	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
-- 
2.43.0


