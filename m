Return-Path: <linux-input+bounces-16385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 729B6C90437
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 23:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F1CC034F3D1
	for <lists+linux-input@lfdr.de>; Thu, 27 Nov 2025 22:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1044D2E173B;
	Thu, 27 Nov 2025 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E14682QM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868B9258CE9
	for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281098; cv=none; b=rShyXPtG7MqfsdRfECCr3KR4/WmdsZxMjo12JCjXjPvX+mt1TwGTUN4j6hLbK6Hk2QXZPeJmpgmaP+tUzhF/q+rVMOtUiNFSikXc2AtPSkb9V0zcab5fzHXhq0VqIODZMokot7siVyBYe3EufbffpZ79Fr2k9z3vEcAf5suVusc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281098; c=relaxed/simple;
	bh=leQxvCDZGM0ZdtWs0cwDmQjkTiimbzrVICuk5cKWwNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OLHwbYjlsRmzz6yf3uJQGXsiQ659qDGM5ty164iv5/Trjsry0ICkwCZpidK8JLXFSSEamQp48rSk5GmhmUUDA+vJid85h3kV+NUrUACp4hiRbfoEsfRJ7MVO8LyeTRGYzt48fdvLU78v5ErMNbDeMiU+7+d0ik4RlhiWxmYtRBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E14682QM; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc09b3d3b06so711518a12.2
        for <linux-input@vger.kernel.org>; Thu, 27 Nov 2025 14:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764281096; x=1764885896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eE3jWwUBeNBwotvMaOoLsxAW53Rx1wxHI/kdT4LjgPM=;
        b=E14682QMpFyJD3l60Y47xyDStxcUpVCFwwPz/eykIMqWHyu/eEy8c4IuRk7mb5zbiu
         BQKMqAs21Yn5Ee+LD8kmEHijp/vEG3Bha9O7avnOFHaTsBZOLTaU/fr032xgzrVPvC5Q
         wru4jZFwN3VLklsYePrExOkQbJd26Vz0qCb4R3xolKxWV5Fl+X8hnoO1IrunI+aPrJxl
         2Of3bsXen8EFJZ4U+OTVtBdbToeoBMTad82OOtfmear7Wk3FC4pCzZajiyOq0Mw30mF+
         EaSED1sMOUEeIei0RX/8em/ybs5zkZ9sufq2x5yWNUm+hqhbcKOKKXQD6DlQOw9nKmxf
         gMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764281096; x=1764885896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE3jWwUBeNBwotvMaOoLsxAW53Rx1wxHI/kdT4LjgPM=;
        b=bYqQjDrjZgaBun4GBZ4qk4kZzh8UM4c7JR75ZSON9zRdbSm8aOGwgS1myAYQFT6/RA
         I7uHNwEj+RH5WbV+EmLQDaalZlmPsWRsi8Db95pG+hcCa5zXMHlluXbHBx8+s8FHM6uX
         wKJw7yLPYomAAEAkjBllQKc5CGjSpvg+3fUDgFvOf5LpLnbhlHk7jQMWWh6R+S02Ohx5
         mHy4ssH3OEK+l/jGNMNstFUfGQNJjZA/CvGTTVYnUOVl7U4/aR+8mNOVQgGTNqnX8MQE
         8LlCzB7O3MLdlWoZchJ6uTSV73v85gLB7ivd61CsTNW62dV6KPI6GCjomtd2DcyYmZ+i
         D2KQ==
X-Gm-Message-State: AOJu0Yzk536rasEdgMt0Nw4p0X0s/KUfye5F7IYFQEQf2njQlMDTIxjg
	RHlarGOi13vhztFz5DEzl/Rz1Z+tQBF6zE15a5/J7QPAwt/R0nS6BXLCS5gJ2qawfYw=
X-Gm-Gg: ASbGnctxx9ISVnYLuo0+xjas4uF8gBZiHYYkPD99xGEo+HzaHkuzGxC8kfpNIKOnJEI
	ph4CpdhexIalikq8RyLTggn+GJt6f0Js8ptVaPZIvq+/tlVWHOS0QVDFduqHQcGmNPqE0VdafnA
	/NUQmIXBu9gz+MSQlmyd9fS756L19KwjtzFB1iq0yXOQzUXWKkCFSBVFtuADeM+UBTllZ5SpQVB
	ELwQnH5QIrqd04u7VrUt9vbUjlsBTJcvHO+2Llxs/5l9WI6puDHCkAskk5tGh36EpCyCL6XcFsx
	ea5TP7J86t0mSUveCJZWpvwp2Ets8thxykDUmaKi0p7Zv5XdycytV29GDMlsfGjJUXHbC2dnvn5
	z1nSybqUz4SrLMOdfLBZMnkOS3ipTvN/PQOn887FNvCG6l017bjHz4Oz/T9z3JwwHiLDPMeT8Kv
	Xu8qbLhMwOn0oJ565SG0qQ4GU0vpBxfNsL9IXE3u5HhGqK06Fg61KNUw==
X-Google-Smtp-Source: AGHT+IF9sx3tyNko/VRd2ErYrohrhI+XHQmwImdHaHPGXKSiSEtP/7hWCmOgd14XsBzeXqCS9rRf3w==
X-Received: by 2002:a05:693c:800d:b0:2a4:3593:4674 with SMTP id 5a478bee46e88-2a9415a4876mr6126355eec.16.1764281095812;
        Thu, 27 Nov 2025 14:04:55 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a9653ca11esm9621462eec.0.2025.11.27.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 14:04:55 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: bentiss@kernel.org,
	jikos@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stern@rowland.harvard.edu,
	dmitry.torokhov@gmail.com,
	linuxhid@cosmicgizmosystems.com,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	michal.pecio@gmail.com
Subject: [PATCH v3] HID: Apply quirk HID_QUIRK_ALWAYS_POLL to Edifier QR30 (2d99:a101)
Date: Thu, 27 Nov 2025 19:03:57 -0300
Message-ID: <20251127220357.1218420-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB speaker has a bug that causes it to reboot when changing the
brightness using the physical knob.

Add a new vendor and product ID entry in hid-ids.h, and register
the corresponding device in hid-quirks.c with the required quirk.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
v3:
 - Defined correct vendor
 - Moved the added lines to the correct location
v2:
 - Fixed title
 - Simplified commit message
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..fbccac79e75a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -438,6 +438,9 @@
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_A001	0xa001
 #define USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002	0xc002
 
+#define USB_VENDOR_ID_EDIFIER		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_ELAN		0x04f3
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..f6b7ed467723 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -81,6 +81,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_PS3), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRISE_WIIU), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DWAV, USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER), HID_QUIRK_MULTI_INPUT | HID_QUIRK_NOGET },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_EDIFIER, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELO, USB_DEVICE_ID_ELO_TS2700), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_EMS, USB_DEVICE_ID_EMS_TRIO_LINKER_PLUS_II), HID_QUIRK_MULTI_INPUT },
-- 
2.52.0


