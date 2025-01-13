Return-Path: <linux-input+bounces-9190-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A0A0B774
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 13:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEF7C7A05F2
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 12:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B86230D3D;
	Mon, 13 Jan 2025 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6ya6S1n"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF03235BFE;
	Mon, 13 Jan 2025 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772579; cv=none; b=g3X3lF4ZA5xuZ1lTaArZqNIjz32Khdwm5mr9LbwAkFufIeexxLmupYzigcci6WhQv3TtvGsjcz8AejkcBI3jDajwxHDUogcnAGZQA8LHYzEJ7uiYdtno1iQ5eWgXxno6fvV4PYuf5CUSRDfRwgDorCRBIGo+KMapSfqWuNzgx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772579; c=relaxed/simple;
	bh=IaypjfdSOe8nS4otI9Be/27/cxLcxi0UpgFYsqF8KKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u3wEQtO/mzZZ0Or50AZ3va2sF7aJXuWGOaR97MMQ9X2RxuYPyMyg11v0D2ZKN3fIP0Fxd84JDzAy4KNO/uo1Z+bAwEiliZnr3uI2UgfCPz0QKvG2ej1UNEbq1bFxtHMoUHVM47UUX4e0DCjt0EhVJgBaVoTSSVkdpqp/Xb/J9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6ya6S1n; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30600722804so2546921fa.1;
        Mon, 13 Jan 2025 04:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736772575; x=1737377375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAkPBKIk6Eax1YHZili/NnZHZkLHuP8KZdGBQcPKewo=;
        b=N6ya6S1nkH14e6BoKvolnrpU6BLvC8TEvHKEg4ZYKJzcY2PNqf6DUf3jxdgb8yT5mW
         HsoQI0NUEgx6c6jJRgjZfaZo7wSeyOr/tMp8vU48Wh2TJbjpfbjCGOE4yBQmh5L3PsTT
         3vUBd5QwwYcODgM4sZxfFaZB+/ZcNuLjl9EWv+S8nqEdUhxHqJWGRgvAP8t2K/A6SJHl
         YcdCaRnXDNGZyLpk0L9QCcz4gCKMe16OcDg8O29ak3ESN/KVa4iuSqaIz97AZ5TbWF3E
         oMXte1VdolM5NiZkKBwzQrH/r8BB4jcxlpHtDZjAi5kj5vecja/qeNNsa5TNN/lbOPin
         peVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772575; x=1737377375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAkPBKIk6Eax1YHZili/NnZHZkLHuP8KZdGBQcPKewo=;
        b=qUU1erOxJqj3Z9k5mS5yFT1GAVos99uk5vrTp1vSZgEyAVgktuGBdOyHbbTwsGppAr
         D8iNzvBPhh/sqCYuFzRon/D+Uux8sN5t6k+ixzdfxWJopfDNj7DUN32dgxvRp6ssY1cU
         jFpOZARzKIVkpcq34x1qBy2rftTX0UUwUMnJFoT+5NmtT06cKKZ7ZT3q8YBXyI/mC/D3
         2iaDCziUeGnX+sJZL7gVbtCKAzfXKiGsn5ASbJalHCosaMSWTB0ijOh3JvsxeF8Owoea
         XZDbym0puClqVIv+wbVPHVuBNrYUASoRWa7HeZUeuLIQugRNCNMxvGNTv1Mg99FMykG2
         FLpA==
X-Forwarded-Encrypted: i=1; AJvYcCVBL5v2XMPilJu/+HD2fHlGatBVtIaI/CSqbt6pBFWqropnu+VckLT0IcCS4+qnPf/VBYePVsvgdi3zjw==@vger.kernel.org, AJvYcCXeLhGWOO3XMc6pjN1hYItWH/SBq25MVTdR5OxEGSaVHiLOIknSdOQlZvJhbunsT7YQBcpyacbdPr54@vger.kernel.org
X-Gm-Message-State: AOJu0YxqF4DmYWqwZBBjPoojGMNcA0YFnH7nyIBG2B60K7iysrDPPP5M
	er06GkphSIFJQoC5UpoxzBgbn1hS5f7xPV2qQk7joqu+V9P30F15
X-Gm-Gg: ASbGncumlgKx3V8o8nSeWb0Sex2beiOOvkQZdjLbDDpy14afjiTdazkVsQjfoe+6Ynt
	gR5KVdOalqqgN16pLGTC7tOGoRsDwTZxaN98z0FXxPcLIxO6I0AVVsPl44JB7mkNo9RR1MX2chd
	kqbL2TxWoZ2FxjVc3QzX1UvtEHQzNAKU1b1epK8W6mDlNoN52Bbr2rca2PpkSAlhHYaQ+F07mZe
	xRU7AKuRYpY/oPQuMRp7u0liNyekLqZ52Zckh6eawY9uf9v6zKXWD8rUjrt9kDDFM3YeyCoD0rj
	RQ1gCDKVdg3uUU7yfe933hL3VRU=
X-Google-Smtp-Source: AGHT+IG30YU4e24YJv9/9dVjXcMTLLOtQm5ebP8+gwTcC/nl+e+sCqpxFXJj547Pur75Pv/I9UHecQ==
X-Received: by 2002:a05:651c:1544:b0:302:3356:54e2 with SMTP id 38308e7fff4ca-305f45f262amr23011861fa.10.1736772575130;
        Mon, 13 Jan 2025 04:49:35 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1ec162sm14256181fa.101.2025.01.13.04.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:49:34 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 08/11] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Mon, 13 Jan 2025 13:49:20 +0100
Message-ID: <20250113124923.234060-9-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250113124923.234060-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> SDL -> Linux API translation, and this value can be incorrect.
This can lead to partial/complete loss of Force Feedback or even
unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 5a328860685b..6b4c4ecf4943 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -136,6 +136,9 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
+/* Polar direction 90 degrees (North) */
+#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -354,9 +357,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	// Use fixed direction if needed
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	// Omit setting delay field if it's missing
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 93233c5b75a6..5237f9040950 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_MISSING_DEVICE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.0


