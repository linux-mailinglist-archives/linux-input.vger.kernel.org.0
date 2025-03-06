Return-Path: <linux-input+bounces-10568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8BFA5432A
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 08:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 521AF188FDDE
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 07:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B600A1A0B0E;
	Thu,  6 Mar 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b="BFgZR07o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA93E19DF4D
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 07:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244442; cv=none; b=tM+S9RY0D69HPC2e8BVAHaepKkNRwrcSEtsRcycHICFMtujmMr2fuZtApggbb5GImxKvkWtH6Z2rTUTGUlS2nPIpDJnZiYe0sXkOF8SDho6l0QHyy520S743l2llDcdLhBxhj0liPDXqZC1DO2QwbLW3lXUGYc9RXKZsz+lEiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244442; c=relaxed/simple;
	bh=84F6xy6gw1rvRcDsIfhxQ100b6HsmDruweAtANwXhto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDFINXm8gx5EOtZzzCT+zZh34JERzwcoOTRQCeF6p5hKooWeTyhb0aDJtuHri+8tm6b/ztJbvQgtJiS9IICcDuhkDfs9zqHlLop0MxHl5zffxdpc66T1Ewdv9RwpzxzE7tOT5x0kV5bN87OddogME8RAzyiEnbjnEJlkYsNRDTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info; spf=none smtp.mailfrom=g-sokol.info; dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b=BFgZR07o; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=g-sokol.info
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so121402e87.1
        for <linux-input@vger.kernel.org>; Wed, 05 Mar 2025 23:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-sokol-info.20230601.gappssmtp.com; s=20230601; t=1741244438; x=1741849238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9J1UAFxuft6AB5He5eDNnL2NYFVVFehRdJNW0D9EciM=;
        b=BFgZR07or3udihWtJsAbAEBCexhYF2RsfAIAOSigD5YpL+mCFMf1aV8Rny4zAdJhCu
         /HVruXrRmkleCl+EHKrKRNHBj/vfKhCipN8J++tKJk/t8t/q9lNwJlWEdY5XWUmu2Wov
         xFM3rbF/m26J8URaBKV8rmNV7TT1iBGaPI+5j7gOwIMUG9otrt6fcGeAnG8JDBpVhwuC
         C0dktCuvOMi2eh5w4lDKBajNcN9iAJI/4wrjoN1bZRVrySnclsBjDJ8H8YpxZTj9r6bG
         dPAa8McGzhC0MRfOqoA/ntVLGsgFWM6937/NGp3v+arGc1DXVDh1m81sz6JNR6hczHtP
         sz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741244438; x=1741849238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9J1UAFxuft6AB5He5eDNnL2NYFVVFehRdJNW0D9EciM=;
        b=SiITAQGbk8UEMjiNkIiWQoXemqzJLshjCKSvJz81qEVAtUQVU3GHPXkbacTwIpgsNc
         jf530cEWiMIN/yNGanfwBZxYDc86YbiFMLW0M/43Jb+XTwRg7DcR94l2yVcfkgXjiBtF
         LlxWGV6+J6E7NgKeFTKuRG/UW69gI5Xudwy4CWuVsFnPTkc2SYbKPmJuTCMsH7b7c2fX
         toLYs4EoB6s54LX9Wuer0DqejmZd1NxDo1WvzzChrfuEpDG6C39kHZRu2yZj8y8y2OrX
         JbwiwVUO1DeGvzoPDS2kacBWaY2LrvTpDcv69qkVrPMdyKA50CPmd/FMg8NhQ4ePTNL9
         +vTQ==
X-Gm-Message-State: AOJu0YxJeA0pz+4y5+F6UjL5jcUL3GAsnG3+MXhBUq2exBoziQBWlFZp
	Vrv+Szxxqe+cqbW2cdA5SVaq8+1ZnzNQYGvi0Egzqx8DPJRPAi7d8LOmKLLgn01mbZhfrFMxWve
	yQdbWag1m
X-Gm-Gg: ASbGnctgfBKTVhCUshy5UI07gOW4H2oim9MbeHkcCAULf7e+h/RQRGeORoRiLIOGiaM
	Sg09Y0TLR6qANhd2UPnwKENOLiIx0AhyiVu3aZcqzse/GUUXx4pJ1u2KoMK/AClvoqYMtHhJ3xi
	OfpS+5umk6Tj93fXfeEqlcHvjSEZObA2kFDrpl9mMeBbIACkX5U06TJCVHjznU9nY7qtWoY/wuE
	Xi2iFDAdTbPmXzJOjy3S2NcWJ6Y2/VZvaHI9UWSxCm6OLLK7zntFskSrdZfI3nrO3SwNo2t7UAf
	+KB2P/ObPpcjvnMyJMueBWdGaxxayTxD0lL8N1uFGKL8oOmlzF6wGEJqcGQD61hF2g2K2gekmLh
	ZX+oqINxNC6sth1s=
X-Google-Smtp-Source: AGHT+IGQsx18A+2w2GKnZRN0o65GqS6mLBOhXlwhOlironfiF8iblrQ6/7qQTkl/r0EQo1XJVp57EQ==
X-Received: by 2002:a05:6512:3e26:b0:549:5b54:2c6c with SMTP id 2adb3069b0e04-5497d33bbc4mr2293431e87.23.1741244438208;
        Wed, 05 Mar 2025 23:00:38 -0800 (PST)
Received: from localhost.localdomain (185-11-210-173.s1networks.fi. [185.11.210.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99e81cbsm1059991fa.93.2025.03.05.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:00:37 -0800 (PST)
From: Grigorii Sokolik <g.sokol99@g-sokol.info>
To: linux-input@vger.kernel.org
Cc: Ievgen Vovk <YevgenVovk@ukr.net>,
	Jiri Kosina <jkosina@suse.com>
Subject: [PATCH 1/2] HID: hid-apple: Apple Magic Keyboard a3203 USB-C support (backporting)
Date: Thu,  6 Mar 2025 09:00:26 +0200
Message-ID: <20250306070027.532052-1-g.sokol99@g-sokol.info>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ievgen Vovk <YevgenVovk@ukr.net>

Backporting of Ievgen Vovk's commit 2813e00dcd748cef47d2bffaa04071de93fddf00
From 6.14-rc5 to 6.13

Signed-off-by Grigorii Sokolik <g.sokol99@g-sokol.info>
---
[PATCH] HID: hid-apple: Apple Magic Keyboard a3203 USB-C support
Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0320)
to those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Ievgen Vovk <YevgenVovk@ukr.net>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 7e1ae2a2bc..3c3f67d0bf 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -474,6 +474,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
 			table = magic_keyboard_2015_fn_keys;
 		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
+			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
 			table = apple2021_fn_keys;
@@ -1150,6 +1151,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 1f47fda809..4f583d6f2e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -184,6 +184,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
-- 
2.48.1


