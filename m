Return-Path: <linux-input+bounces-3297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0C8B60E0
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 20:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A2B1C20ECD
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6528B127E24;
	Mon, 29 Apr 2024 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l8cAQKsk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC2127E0E
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714414108; cv=none; b=mx29Dkpi3swwvMwd1Vym9ymfGbsIwuCKWT2QqIZfxSWtFbTAjPiwbDRbZwW3OzI6bedfIOEBknQAWA55zNlIrQ17hnAHSHXnJqg0qFrDc7X7uNuGJKi5K0CTvGQD8LVfFvjghvRr3qx4dLzRDNQxhp5JijuGjEiChNYVd3ERDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714414108; c=relaxed/simple;
	bh=ZdfPcczF7xRDV5aIKhhSE/OBvQACkiweQ02X0owtYuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kNLV0O3cCv98fMQTvVIaKs932ckXDvzNgsmxvmT/AkgRRmNK4Qk/nsUPO4IBY7IiGn7k9Y9wxkvhkw1INJGQ38Z1zlSbcTU3sKhP2JtBC9PQRpK1IIvYBfm1lLCBYoYCrKBrYF5cCFEsAiVVgqfskMr+HuXYdpde7BaVQ/aCBxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l8cAQKsk; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f043eaee9so292888985a.3
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714414106; x=1715018906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nf84ojcMOq0M0VVKXZcmBf3YAZLtizS/AKsNC5U5GYU=;
        b=l8cAQKskurRSjog+c7tB695KI+VrF0fVEz6ixKEw4hepxxHCY0sTzQNG+VPrrDg0J3
         xd7UC9uhgEBZabdsGAgIyeJVOiILLg0w5taWgixi8dtIx09VyBN+0DDA5ZJcflV7LY9n
         0+9/bs7IfOQpLiN2uaXMZSxPzxD0Ky6bzaxi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714414106; x=1715018906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf84ojcMOq0M0VVKXZcmBf3YAZLtizS/AKsNC5U5GYU=;
        b=B+DilXONBbzKIDjklQYGkGhvoPCKkDGIVOa3Poz3H8hnr/UCU8+jDaDg7hStlUM0Qp
         Xv6Qp6LvX8UdmQBwAho366x6g+FVom+h79WAMu3mb/2xGUDvegenD9g/d86YNo6hC9/9
         HLaX4xXLDONyZ+BVuL/wAzzbmai9TRabB8UwgroNMFnMfg66rY056jcdqvX82nqxHC67
         /JnJ5C2EwWLclfJcsuDX1RXS1lSD7/PSPBtX41rllL9OcDYvydEEeJZwEwv4kgogYPp8
         SK6LvkbvP/S6NvuXfjfyPwoo8OqewZTB6/SyjR9Mt+2P1ECLGoew+Qo81ANKmgangEiJ
         dRpw==
X-Forwarded-Encrypted: i=1; AJvYcCXzKd79A2/98G7NXY6EwVbCg7Q06QsNqkC67nPfkBFnGmSeHoPJgxKofs2zgMkt3vuHn/vS0xKzVyF1NUaBQFBgdFhX+AmbJIUWAis=
X-Gm-Message-State: AOJu0YxWVmAyPfzKTIuotArF7aikd4d9pCStVGXzzsrnSA9S6uQOgqn+
	r/UiJHHdARBmWwHCzRQ8WSmoDQbs2iVjF0ZypTJQ2gYPEjpcEBYuXUce793POQ==
X-Google-Smtp-Source: AGHT+IGP1JSt1zLTAdWv9/e6S2FAtWsol5Gu2tWZkbfJuYw18dt64uiBxNizrMEZPQkdCdYZac/8Vg==
X-Received: by 2002:a05:620a:4551:b0:790:a3a7:7cab with SMTP id u17-20020a05620a455100b00790a3a77cabmr392969qkp.39.1714414105812;
        Mon, 29 Apr 2024 11:08:25 -0700 (PDT)
Received: from seobrien.c.googlers.com.com (114.66.194.35.bc.googleusercontent.com. [35.194.66.114])
        by smtp.gmail.com with ESMTPSA id m6-20020ae9e006000000b0078efdcd9aa6sm10669039qkk.127.2024.04.29.11.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:08:25 -0700 (PDT)
From: Sean O'Brien <seobrien@chromium.org>
To: Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jikos@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 29 Apr 2024 18:08:05 +0000
Message-ID: <20240429180804.1.Ie7e8d0ba595f9e39f71cbe4ab3468f79c00b4581@changeid>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device sometimes doesn't send touch release signals when moving
from >=4 fingers to <4 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

MT_QUIRK_FORCE_MULTI_INPUT is not necessary for this device, but does no
harm.

Signed-off-by: Sean O'Brien <seobrien@chromium.org>
---

 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8376fb5e2d0b4..68b0f39deaa9a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -823,6 +823,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 04a014cd2a2f6..56fc78841f245 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2081,6 +2081,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Logitech devices */
+	{ .driver_data = MT_CLS_NSMU,
+		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
 		MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
-- 
2.45.0.rc0.197.gbae5840b3b-goog


