Return-Path: <linux-input+bounces-9541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35CA1C568
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 513ED18881BE
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1695D206F05;
	Sat, 25 Jan 2025 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF9yu3JS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD50206F1A;
	Sat, 25 Jan 2025 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843943; cv=none; b=U3cxjgZ3ugAd+QBGRk1rCUTV+q/wch+HHbIYS5eiHy0i73nWrIEYL89bZAxCiMtBqroBs1vhb3lABgKDzmuH4qfBuCRrQxNokTyS3VNKpf/InyntgAWomtAgz4q0p9nZmRhH08REszF7tIY19I70F6JEFW5uTeZwxvm+ag+3F94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843943; c=relaxed/simple;
	bh=8GmzhpaMxYiy8UkJ/MzDUSAv38faldGoZ9y5VIJO0dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1IYij3CmtBLTHFrXzII/laHia4H0BAisedBclK3qgZmysDorn35U84bTLaPnsAfh1VdPivqw4sNiOOzMfgJoyM5oM9OefAzl7wbi+BEFoFIHYTUXuPODXrM65YDeapjJ73BAAAbWbw/51cFe0vJXgYR1xszR2mN6++03onJd5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF9yu3JS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab69712eaffso8519966b.3;
        Sat, 25 Jan 2025 14:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843939; x=1738448739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxiAHTud/zEPLuazvDKVn1LXHelcgSwsXbJXagSiwyo=;
        b=OF9yu3JS3hGNSqVyNFcXBnB6o2IrQJxxKb/n9Lq9wnLYKl4N8gyQz6RDj6uFyJUspt
         z4dwa/nZkVHVhdGzUfV1kjEBpKZNQbTeKG7eaQ6CfOPcGWORz5IHwG1EuBf1ALqX0D40
         FzxSmq4D59F66QbEg/GuWNHrQmUQSGpGYwAYDXFlfkFtsFOJgWv04V9SZAgc/xdHZpMh
         l4VlXHat6eQF2bLuORh1/h4VtnUf8w2tZWYhE+QimEgvi614niBtJQWe7bH6vy42wI//
         qJVVW7dW8mPVi8I0m5FxjJpgaHjefN0D/IEF7rvNoDKznNtWCm8pHnRzICmvx8zmrr9a
         M6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843939; x=1738448739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxiAHTud/zEPLuazvDKVn1LXHelcgSwsXbJXagSiwyo=;
        b=LNsJheOQytmzIZdK03VUnMMyF8966jxHF+Vkfc3GQJOdt1LMZHTX7rOI9tQ2RGBPvI
         Zp7TwQV8Umr7EQ+Wuccn5UtSq6XqbXNF+j5P6U/TdRSk26VLIrBXYxqGRqc9w/Nol7zt
         OViXaAzExDduPP8UbxjPxpnL+L/i+1xTeAUGzXRYozCngO0YMIjslyWl8xspAiIDLb/K
         4iM5pNq6WJZ57Gipzvp24h0ZF5emxbWiy/gwqwVZBbyxaWqPrRKI92EkBulrPlj2COIa
         PHFxlJJpmXXUax4IVb6xkAR3cszIUg6brc0XvLMszVxVtuWZxmi7k+54BV8H1YIOi96/
         rplw==
X-Forwarded-Encrypted: i=1; AJvYcCUiMtG+DOVNx5NPgcUVaamgDvJ9XElEgKbt8LB6toWOR7GfCgH3bqG5w/c1Ad02AfJ7OCi90BTDrjhrtw==@vger.kernel.org, AJvYcCVMQXIP0Ktos/rqHeLHNNQFSdIofffBPwEZC7tflkvH6qKxMthb5JoIPeKkgfNB/3c5ujpCMWSt2Ma5@vger.kernel.org
X-Gm-Message-State: AOJu0YzoRDlbPT5FTrgCJrauxcrqIRMNQ8MFjefPpAxjcvKbY8+ktnbV
	Zo3iV4iPlrCnZ1KHpKeE6E2So5soFQy6cU1RyQT8jdbJXrUpYCUK
X-Gm-Gg: ASbGncu0co/Q2IhGnKtF1jIcJf6QGKiGGHkWxP8598DrBqxPAOM5WkuZ+hZOFk5JKd7
	cblVrXMOpwjdEkHjP4Hj/kOPStwQQwoejsshVnTTcKe8dmAMkGIDwB6k3wMTax1utXBXQK0j6Yt
	3HkVIRQ5xIK3PF4F/SksubSvWydTTij/Q/pMacGRv03ImMonbsjYRK15lhxrQQY6H9KEIxtTVV9
	k/Y38u1rmqg1924SCyMO0E0YbZwZ4AurfL3wbEgUcE4HWpBpaGOnW+orUxfZvNf7vabl2XH0W1f
	TfjlyqJrajrMbrBzPW1uZni8gANlcJU5T2wQljeUEM86O4s+vw8=
X-Google-Smtp-Source: AGHT+IHlkkc1SxaySKtyjml9NIeYfx0sKppwRd3NTXFQ/ul/lLjwZaFKI2OM5gtNRWGmKZdTNWEgkQ==
X-Received: by 2002:a17:907:3f0a:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-ab651587b33mr664885766b.4.1737843939342;
        Sat, 25 Jan 2025 14:25:39 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:38 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 05/17] HID: pidff: Add MISSING_PBO quirk and its detection
Date: Sat, 25 Jan 2025 23:25:18 +0100
Message-ID: <20250125222530.45944-6-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
 drivers/hid/usbhid/hid-pidff.c | 47 +++++++++++++++++++++-------------
 include/linux/hid.h            |  1 +
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e2e431dec936..89a1b6a55c1b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -404,13 +404,19 @@ static int pidff_needs_set_periodic(struct ff_effect *effect,
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
@@ -822,6 +828,11 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
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
@@ -1101,7 +1112,6 @@ static int pidff_find_effects(struct pidff_device *pidff,
  */
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
-	int envelope_ok = 0;
 	int status = 0;
 
 	/* Save info about the device not having the DELAY ffb field. */
@@ -1132,13 +1142,10 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
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
@@ -1163,16 +1170,20 @@ static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
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
index 94ad5a510639..29f0a91f505f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1229,6 +1229,7 @@ int hid_pidff_init(struct hid_device *hid);
 
 /* HID PIDFF quirks */
 #define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+#define HID_PIDFF_QUIRK_MISSING_PBO	BIT(1)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


