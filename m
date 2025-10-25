Return-Path: <linux-input+bounces-15724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0ACC0960B
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 18:23:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76908401BC7
	for <lists+linux-input@lfdr.de>; Sat, 25 Oct 2025 16:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 441C5305E24;
	Sat, 25 Oct 2025 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATsb0VnH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FC30171D;
	Sat, 25 Oct 2025 16:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409029; cv=none; b=YndKo9O4NTlmogsGHpZPrmQc415BaqG++xr5+OszrCFYUHrnCpjk+iaNsLApyYGD435bOeQAi1OV90BstnpcVo4EmVHoFtv27neZR6UCnfMLHzvsCT4VcGSwNVWJamoK7ZTB4WxeDhsWixoLyDNVK6hCHMi0bI2YlA3oX4v73wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409029; c=relaxed/simple;
	bh=7k3v/DaDCG2/zDCymQG5MnzL+6f2oZRTaDFIdf7yPEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XNu0tq4fV6c1as/yvzpUFuPA69AOF00t40uGP4GuC9sxv17m/w28p7Je6/NPpQPgC9gS/vYhbGlNseEVJ38wzDWe5veIvOFGooA5jY1k5cediJQIwKFGY9rEMV2fcjJ6HBtL8vfyUTG3oIVBBKDbx3RROiUF3eeXcn3pEfnPbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATsb0VnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B982C4CEF5;
	Sat, 25 Oct 2025 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409027;
	bh=7k3v/DaDCG2/zDCymQG5MnzL+6f2oZRTaDFIdf7yPEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATsb0VnHidwGki5g81o/KSf23EiqscGwWtSd/iSCBciO5ukmetNEkgTM17+H0mlh6
	 71QEfW8iNq/AUg21bqESP0VDW+YG4drnQNc3+BIrkQDs4Dt+lDjXDYv9mIxFxFDnR2
	 uSv2rIefpEaKOPBRmWAXwWOI0cYe2A31pxfr9VhZ174C4J/tEXes2B4UDzWYZht29v
	 TNvQargZpZRFUj686VRQU336kNoUzDkGymuUKp9iDYr/7G67VdVk//gfoQKLrQEgOb
	 VIkztsps3SJT/+XhUjhVFLMdB1/pGzqVcHDzTii62l30KRwl6KdPl7STdB4674VGux
	 vV6kSd6hs0SQg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Oleg Makarenko <oleg@makarenk.ooo>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.12] HID: pidff: Use direction fix only for conditional effects
Date: Sat, 25 Oct 2025 11:56:46 -0400
Message-ID: <20251025160905.3857885-175-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit f345a4798dab800159b09d088e7bdae0f16076c3 ]

The already fixed bug in SDL only affected conditional effects. This
should fix FFB in Forza Horizion 4/5 on Moza Devices as Forza Horizon
flips the constant force direction instead of using negative magnitude
values.

Changing the direction in the effect directly in pidff_upload_effect()
would affect it's value in further operations like comparing to the old
effect and/or just reading the effect values in the user application.

This, in turn, would lead to constant PID_SET_EFFECT spam as the effect
direction would constantly not match the value that's set by the
application.

This way, it's still transparent to any software/API.

Only affects conditional effects now so it's better for it to explicitly
state that in the name. If any HW ever needs fixed direction for other
effects, we'll add more quirks.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes
  - The earlier quirk forced a fixed direction (0x4000) for all effect
    types on specific wheelbases to work around mis-set PID directions
    in some user stacks (dinput → wine → SDL). That broad forcing breaks
    games that legitimately use the direction field for non-conditional
    effects (e.g., Forza Horizon 4/5 uses direction flips for constant
    force instead of negative magnitudes). This patch narrows the quirk
    to conditional effects only (spring, damper, inertia, friction),
    matching where the SDL-side bug actually applied.

- How it changes behavior
  - Adds a helper to detect conditional effects and a wrapper to set the
    direction only when appropriate:
    - New logic: pidff_is_effect_conditional() and
      pidff_set_effect_direction() in drivers/hid/usbhid/hid-pidff.c
      (replaces unconditional forcing in Set Effect).
    - Set Effect now calls the helper instead of unconditionally forcing
      direction for all effects.
  - Renames the quirk to reflect scope:
    HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION →
    HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION, still using the same bit
    (BIT(3)).
  - Updates device ID table entries to use the new quirk name for Moza
    devices in drivers/hid/hid-universal-pidff.c.

- Why it’s appropriate for stable
  - User-visible bug/regression: Fixes incorrect or missing FFB in Forza
    Horizon 4/5 on Moza devices when the kernel overrode constant-force
    directions. The message explicitly states this resolves that case.
  - Small and contained: Limited to HID PID force-feedback code and
    quirk tables; no architectural changes.
  - Minimal risk: Only affects devices already marked with the quirk
    bit. Behavior is narrowed (less intrusive) by applying the fixed
    direction only to conditional effects; other effect types now honor
    the application-provided direction as intended.
  - No side effects on unrelated subsystems: Touches only HID FFB code
    paths.
  - Clear lineage: It logically corrects the earlier
    “FIX_WHEEL_DIRECTION” quirk (drivers/hid/usbhid/hid-pidff.c:397)
    that forced direction for all effect types.

- Specific code references
  - Current unconditional forcing (to be replaced by helper call):
    drivers/hid/usbhid/hid-pidff.c:397
  - Quirk bit definition that’s renamed but remains BIT(3):
    drivers/hid/usbhid/hid-pidff.h:20
  - Fixed direction constant (still used, but now applied
    conditionally): drivers/hid/usbhid/hid-pidff.c:151
  - Device entries using the quirk (updated to new name):
    drivers/hid/hid-universal-pidff.c:6

- Additional considerations
  - The commit avoids mutating effect->direction in
    pidff_upload_effect(), preventing mismatches with the application’s
    state and avoiding needless PID_SET_EFFECT churn. It keeps behavior
    transparent to user space.
  - If any future hardware requires fixed direction for non-conditional
    effects, the commit message notes that more targeted quirks will be
    added, which further limits regression risk.

Given it’s a targeted regression fix for a real-world breakage, small in
scope, and reduces the quirk’s blast radius, it’s a strong candidate for
stable backport (especially on branches that already carry the earlier
FIX_WHEEL_DIRECTION quirk).

 drivers/hid/hid-universal-pidff.c | 20 ++++++++++----------
 drivers/hid/usbhid/hid-pidff.c    | 28 +++++++++++++++++++++++-----
 drivers/hid/usbhid/hid-pidff.h    |  2 +-
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
index 554a6559aeb73..70fce0f88e825 100644
--- a/drivers/hid/hid-universal-pidff.c
+++ b/drivers/hid/hid-universal-pidff.c
@@ -144,25 +144,25 @@ static int universal_pidff_input_configured(struct hid_device *hdev,
 
 static const struct hid_device_id universal_pidff_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R3_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R5_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R9_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R12_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MOZA, USB_DEVICE_ID_MOZA_R16_R21_2),
-		.driver_data = HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION },
+		.driver_data = HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CAMMUS, USB_DEVICE_ID_CAMMUS_C12) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_VRS, USB_DEVICE_ID_VRS_DFP),
diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 614a20b620231..c6b4f61e535d5 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -205,6 +205,14 @@ struct pidff_device {
 	u8 effect_count;
 };
 
+static int pidff_is_effect_conditional(struct ff_effect *effect)
+{
+	return effect->type == FF_SPRING  ||
+	       effect->type == FF_DAMPER  ||
+	       effect->type == FF_INERTIA ||
+	       effect->type == FF_FRICTION;
+}
+
 /*
  * Clamp value for a given field
  */
@@ -294,6 +302,20 @@ static void pidff_set_duration(struct pidff_usage *usage, u16 duration)
 	pidff_set_time(usage, duration);
 }
 
+static void pidff_set_effect_direction(struct pidff_device *pidff,
+				       struct ff_effect *effect)
+{
+	u16 direction = effect->direction;
+
+	/* Use fixed direction if needed */
+	if (pidff->quirks & HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION &&
+	    pidff_is_effect_conditional(effect))
+		direction = PIDFF_FIXED_WHEEL_DIRECTION;
+
+	pidff->effect_direction->value[0] =
+		pidff_rescale(direction, U16_MAX, pidff->effect_direction);
+}
+
 /*
  * Send envelope report to the device
  */
@@ -395,11 +417,7 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
 
-	/* Use fixed direction if needed */
-	pidff->effect_direction->value[0] = pidff_rescale(
-		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
-		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
-		U16_MAX, pidff->effect_direction);
+	pidff_set_effect_direction(pidff, effect);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/drivers/hid/usbhid/hid-pidff.h b/drivers/hid/usbhid/hid-pidff.h
index a53a8b436baa6..f321f675e1318 100644
--- a/drivers/hid/usbhid/hid-pidff.h
+++ b/drivers/hid/usbhid/hid-pidff.h
@@ -16,7 +16,7 @@
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
 
 /* Use fixed 0x4000 direction during SET_EFFECT report upload */
-#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
+#define HID_PIDFF_QUIRK_FIX_CONDITIONAL_DIRECTION	BIT(3)
 
 /* Force all periodic effects to be uploaded as SINE */
 #define HID_PIDFF_QUIRK_PERIODIC_SINE_ONLY	BIT(4)
-- 
2.51.0


