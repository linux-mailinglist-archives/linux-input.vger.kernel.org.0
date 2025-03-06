Return-Path: <linux-input+bounces-10569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A31A5432B
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 08:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F82F3ACB24
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 07:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2759A1A2C25;
	Thu,  6 Mar 2025 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b="qcgJmm9l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608C91A0712
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244444; cv=none; b=YfJsojsHfRj0B4YRc7n+rQ1+8fCkAA+4ppIUKZ8A8qIlE5HHL3AmMJLUPVQk+sssW0zDa8g3csCTOflPwUi1JGkf0LQgi1tN+JIUp8Z6NLBp5/Uu7/XMhbuuNd7h8S3JbLs7ppCxZ4OlWhdvYb3a9YKXmL7NW0GvEvCQnf8R/Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244444; c=relaxed/simple;
	bh=R8mD42C8JSzeDOw/OyH96NT7Zu4tAstbJIMNxeeoAvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n826WtHjEuAribryWPp/Zff72GrXZQYy7Ew//xNWg3FrxpkhJqp+Y6pM1xDjnBGkmAMozqnJ6AHzjGVm+9DuenbU6Rvwa9jRwd9RV5Y4iaskChs0s6KghDxu+A31oDJpqnpDSfXAtupjOxnHoDLLxOOq5uscc/1PhsZaNC01eGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info; spf=none smtp.mailfrom=g-sokol.info; dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b=qcgJmm9l; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=g-sokol.info
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30795988ebeso3139741fa.3
        for <linux-input@vger.kernel.org>; Wed, 05 Mar 2025 23:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-sokol-info.20230601.gappssmtp.com; s=20230601; t=1741244440; x=1741849240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19askMh4Gm0YmwCpt25BNi0LwkLNtJtl5vhunDMvF40=;
        b=qcgJmm9lfr9JPsEntpq1NgHKS7xlcB/NR85S8rbZrbtj4Oh8d7+jmj/2LJY2pXYetb
         vGZD2ShJSoelb8TJVPg5SMP4FbJf8VGf5xTQmNNN/E5SNuv/Knglcgap6zxoO1dxQ2L/
         w8xiYJw/xxztT2JEN7Ip++xtOwcprCxmQUH6jwZVyoXIIFmo7oIYr0RBgB0EcnR1u8cK
         6vXDEGArQdkFyz4jvFLA/ePJ+NlOEJQCNZ6/TacuQAhip5xL/Cjlr5xRmtAXP9b8cvwi
         4Il7GMClwAZ8yWXUN3vOs00ybGRwWymUKuKkI2Z1flcRl2uKOJ5wHM2RDkVEkxXXO5v2
         9AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741244440; x=1741849240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19askMh4Gm0YmwCpt25BNi0LwkLNtJtl5vhunDMvF40=;
        b=YQ+tN4akTgoAlyt1ATQVS8OWi4u5Zb7rihv62P9u0Uu3yZS56bOkaxaZkQKlreN8s2
         cW75gnH2GEoO4QisntP+Ddy1V6HkjTLfYcVYlAGGQXczHTpHCHSyLZZbewQLPPiuFO1h
         gdspbMG8awjekpBkZbyNac+yYxU88B6wMWI7HnIskP4DhOmJyZhUyHTmZsbh5/tRSb0H
         FcuXl1xwQrbEkJ1OEAmY4cvKwuaOSacLGoK+akpAK6KtYGjCz3nOMIgM6gxYW62dtzAB
         QgqaXiNpA3H21WgDjlsY/3g4g8qXGdB2K+WVYL5cZLlMDRlvQ/2/8R6AJAYmhMYPuP0F
         uLoA==
X-Gm-Message-State: AOJu0YxlrRQrEremL9hiI2FucdAcUdPvZqThyv6qZQ77xsYvmJaMk5/H
	EUQqDpTBYcw80mPrGVUKdD1W2lVNsZcdk6+wdQKFrtvQPnoqI1tgN49OlJZasqPrCvHZbubq4Z+
	GpIAuBN6A
X-Gm-Gg: ASbGncs/24Wk9ypRxYzasZZ+cG0E3P18aBNKhcS3jlfrqsoqMwnAGaCJnu/lwkI66yo
	VHAPnS3pq1AOGDs8OTB4TzCKxo/MOzaZ1K2k2AkwfKav9SrrSBhQQZTYmoK/tQm7SPrL3BXFLGT
	59LKcGeHzOjJI3CIGeigW57leFXf27t6ZtAedOCTiMdekMEl0Z4jaHJziGqkjj0oqG/2t5hVUk1
	OhUw2bK1uomlGKfR1qQtMLEvnJRqtBEcbGGI/ZF85Ol9O7gToJ9LC2dOp1zUecf/Jh9Pj11k7Hv
	c/jrkUePHZVBtYEGuAjeSjthIQXSaAJMEmP1fC799Sgb6++UjfzFT/NHkdNn7lRVtV3fRsxg9V4
	1wGjJ/vzgHpUJbGk=
X-Google-Smtp-Source: AGHT+IGTQP0RmmF3o0faCYv2vzOoFrWmMCi5re1vbItTdicJaE0e/uGLrAbn8hiSjz/upAzjHP8FsQ==
X-Received: by 2002:a05:651c:198d:b0:30b:e440:dbdb with SMTP id 38308e7fff4ca-30be440dc7cmr6584071fa.37.1741244440211;
        Wed, 05 Mar 2025 23:00:40 -0800 (PST)
Received: from localhost.localdomain (185-11-210-173.s1networks.fi. [185.11.210.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be99e81cbsm1059991fa.93.2025.03.05.23.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 23:00:39 -0800 (PST)
From: Grigorii Sokolik <g.sokol99@g-sokol.info>
To: linux-input@vger.kernel.org
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>
Subject: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C support
Date: Thu,  6 Mar 2025 09:00:27 +0200
Message-ID: <20250306070027.532052-2-g.sokol99@g-sokol.info>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306070027.532052-1-g.sokol99@g-sokol.info>
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0321)
to those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3c3f67d0bf..daf4c505e7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -475,6 +475,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
+			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
 			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
 			table = apple2021_fn_keys;
@@ -1155,6 +1156,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4f583d6f2e..953850f043 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -185,6 +185,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
-- 
2.48.1


