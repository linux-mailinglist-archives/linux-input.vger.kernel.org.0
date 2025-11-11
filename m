Return-Path: <linux-input+bounces-15992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A10AC4C26D
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 08:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 273203AC088
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 07:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1724832C328;
	Tue, 11 Nov 2025 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8o45t4R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDD32B99D
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847026; cv=none; b=uKILxBm1IjVodpnFwXH6bBG+nQcO/6yn+GvKj+u3pTxmUkIHP3iRsMWiZX1q4RmOh1ZVPRlqlFwYLyIuE2wRinbiUKKev24+TpVtv/3jZM71n7csZK9WKzGmE7xApE8Oxm6tY4UvDEAmFL8hr1VJBP7qzNL5jZtvBIzMvrWW6Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847026; c=relaxed/simple;
	bh=hGu+GzN+iPOCwdycByBZkRXiL6hZVXSrjCx1H7RoOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbKkU1iQL4IYhBjcHypjO+j+BF6iYQNd5tKZ37Mp4b3sQ8jwa3kDR34b80uRf2tbOJU2OYBibDiS6aDMep69F+fv3A4W5WoIkH+cUop4N1vmverO97dAhiQoLO3uWzeaRC7ZtHV6tySDYKRXWcRBR4gNu28DWx7UKcKarNV1Z20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8o45t4R; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3437c093ef5so2190558a91.0
        for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762847024; x=1763451824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=C8o45t4R8X/j3JVDvFIsTsCerU3/X997xy1pjZXWPfu+qhbjyoi+uYFGbY5J2BMDMi
         ydanYgqPchkwRp1O9b6Oc5Q95NlgIImmZ567NsxU7Rgd1EmkFAmmeFCsqSjWwhufL1nn
         d7XGKhyQKljcU5eOF2fF5Tyai8GdlAntFDX3pGXuoNK5OcRYY7dzHAO8AcERH+GX9Gfq
         1tD9gt7kZgFwNlEak+sI8dEllto5hVBCrU5r7opAwJl3y2Uh4N5zQxRSWZNbumNFQwRn
         UyAltlOn5LSrzwJbFh9totjIJSZkWhnogK4dkMeROSt0EMc8cSA3dvSZImz0KgFhfyBA
         QRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847024; x=1763451824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=Q9n570tTbqhYz5R94V6pp4HxtzvLd3U8/dhze8UPWKyMZwYb/PvimtvcaF26GFqV8Y
         Bu2bH8LNP8VIhsaK1o4Jxdr7trhPO4ZXDChUC8V1/UBV1/7hQcFpiuJ55YQQ4Nmummuk
         43Y40g8CSQ5ntnQcYEQ5QcEg2tFX1mvmYNGf+o80CqeuElHk+/iHPlu59MPeVrwh7Bfe
         koL1Z8p6fNILyK0GVTIe/OW4u2A2BS3pJcTA2+2GgAoXoLE3tzjPGtSREDYqCKYf5xYw
         RGUvKZcDr7qBLRnnExBrYYpSDojYLM0Fk/QsByxBwr5gqHb0nIVJ5Ra719A8UE+0yeQJ
         FgwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1r5G1ymXkg/nWkn7Yv4wrVS3U0YZKa/tcmDj9ebvf4y2gS3FmZsLH9EJk872RAoF7Mjm2l6rtGK0iig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/at5GOH5GduGRG9idGXQUBDVG0KVXSx5Q1nP6bCWGKWZCypko
	qQC67SdYxugFZSQp08EZl6Kb1EGPGiRjunkxeWMZinUoserRJf0UwKEv
X-Gm-Gg: ASbGnctNs2PnSiFXXPao5AnyCiFOS8eJV+naX7DWIb5mH3hCQk2WNJGB7tbPS/Kmklw
	t3yG+RPvPTPvIpPg50US6HNN1vzYGjngOX9Co6A13KU+bJtrMFln2f1t1SHNq5YT4RqOVMwnUlK
	w8z9lulM0bntCxzGRuffpuhsif0E5T9za/B2ld6XJaNCq28oSFOol3XWDJD6sSdg6Eftea3xXhP
	nRAeYI/v1NONKqp1svFrHapuXPAmJeADF37lmiNjgNEee33C70Pi0K5FCGQVWxAIevKIVvjEUxW
	hrT/c72sFion1s3ksgjjsVGPMrjTfuH0D/tl0JGxjLjxAoGMORmq1OkfGWALIjOp/zIqQI2Fo/a
	odHek8R4QKhsOujmwbIg1tYuKqDqTVQbbfwhV9vyPJ4RzmeMOnjlaI4UXcuHTzCepWbMdTHMmgg
	VFtOA6vH39NIQE2/A6t2SbohL7PuVl/vCP4GyusyT8aL0=
X-Google-Smtp-Source: AGHT+IHnUqWbN87MfdnfCGZe3Siga0PrKlesE1NEYJJvVLUvhC1pGxgwxVLeIsjtogtg1QbMwZPCCg==
X-Received: by 2002:a17:90b:2709:b0:340:be4d:8980 with SMTP id 98e67ed59e1d1-3436cb89ab8mr12431413a91.14.1762847023674;
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm13779436a91.8.2025.11.10.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	michal.pecio@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB brightness with the physical knob.
Date: Tue, 11 Nov 2025 04:42:05 -0300
Message-ID: <20251111074205.1533558-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new vendor and product ID entry in hid-ids.h and register
the corresponding device in hid-quirks.c with the required quirk.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..ece1bea0faa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -734,6 +734,9 @@
 #define USB_VENDOR_ID_JESS2		0x0f30
 #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
 
+#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_KBGEAR		0x084e
 #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..d104f4829d93 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.51.2


