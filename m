Return-Path: <linux-input+bounces-3293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712238B5202
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 09:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B17428152E
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 07:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2F1171A;
	Mon, 29 Apr 2024 07:09:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874976FCB
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 07:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714374597; cv=none; b=XsFUh8FVoFA7e9Ux9TdFX/eGFbz8+taGg7XX8976p3NoKULJFOK5ktqSaekntK3EdwcH96soJmXzDLo4J+l1iXhVswA+6vntIMMVNKzyaOWqsSTHBdg0Gyq2p+22SuXT5op+/iUmR42Ne2ZkQ3y2JTEztNUYQlFFvonLRu0TfxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714374597; c=relaxed/simple;
	bh=NFWdHg4LmKk/hkjf2G0rJ30m62FvLY4wiHRo8IeUUNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqj/71PUljrA7d086PiSskVymt48RpwfKRr+jt1msKpiN6uJj67xKZ9v+NG28K+NDmr7r3S5MyBWLBlmAV78nr9Cr2oZF6tlyASYFEMR+QLmqBj6cujVoeueHx+WG10W4ldZWAakQ4PVMEmtwx0p1YD7V0aSMaVG27eIuH6ptoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=moeller.io; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=moeller.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2634718a12.0
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 00:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714374595; x=1714979395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcnpv9+fdGZK22wqh/w5qpi5eLU2yU0EOmeRd7Kx8zQ=;
        b=p5p6oOPuVsudBLeaA2gsaQB7tEeJH/34BrLFVzL0JnI3CHrkOL/v1hk/g/jxVIB0j5
         FfxPcCWlmFIjQ4ePYhygVDYwFfk9B7BjKpeH/QJeDeLc2vEja/PtB4AJA6gy0IqCFxtV
         g6e+UaeXxzbVyYGEd8Xu89M6MGpKlk1jVIjMnYHrzFSixZ9PfpiZYeKok8hPRhcniI+m
         sS46BzDj2l+5V0vMNWmYbKCSREj8HBFjfiRX9Xwo8ezhcGWV5VoA9QgX3YbAUvjYvH3c
         2iEdNyuUdB5KZHwTxzU0oyHlUM1a+3v19gq8mgtGJyII97BvI5Ehd9j1ArVGaCASEWgK
         S+fA==
X-Gm-Message-State: AOJu0YxaajQ6LMFcTWIeTgf9ditFoEs5qQ1HwUoZr9gyHozAwD3TLjiw
	2dp9PxKPYJCqZvAgiqmvLVEkOBAqCHSh6cIEgIZpcGEXI+6KK60WwYCvQ4mkrQ8=
X-Google-Smtp-Source: AGHT+IFWPr3yIen7fQg3imxci/L8gqSseO5v0zqvFZI9EvnR32DfKTRxu8PBGhOwS1s1EgmEpnjOmQ==
X-Received: by 2002:a05:6a21:6da2:b0:1a3:bb75:17ab with SMTP id wl34-20020a056a216da200b001a3bb7517abmr11233835pzb.59.1714374594813;
        Mon, 29 Apr 2024 00:09:54 -0700 (PDT)
Received: from 009958524e89.moeller.io (static-198-54-134-104.cust.tzulo.com. [198.54.134.104])
        by smtp.gmail.com with ESMTPSA id gd26-20020a056a00831a00b006ea923678a6sm18575053pfb.137.2024.04.29.00.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Apr 2024 00:09:54 -0700 (PDT)
Received: from spectre.moeller.io ([10.10.10.14])
	by 009958524e89.moeller.io with esmtp (Exim 4.89)
	(envelope-from <jon@moeller.io>)
	id 1s1L97-00003w-3C; Mon, 29 Apr 2024 07:09:53 +0000
From: Jon Moeller <jon@moeller.io>
To: linux-input@vger.kernel.org
Cc: Jon Moeller <jon@moeller.io>
Subject: [PATCH] Adding quirks for 2024 HP Spectre x360 touchpads
Date: Mon, 29 Apr 2024 00:09:39 -0700
Message-ID: <20240429070950.247183-1-jon@moeller.io>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 drivers/hid/hid-multitouch.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 04a014cd2a2f..7a7918191628 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -212,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_HP_SPECTRE_ELAN_HAPTIC		0x0114
 
 #define MT_DEFAULT_MAXCONTACT	10
 #define MT_MAX_MAXCONTACT	250
@@ -396,6 +397,13 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_SLOT_IS_CONTACTID |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_CONFIDENCE |
+			MT_QUIRK_WIN8_PTP_BUTTONS,
+	},
 	{ }
 };
 
@@ -1992,6 +2000,12 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_ELAN, 0x3148) },
 
+	{ .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+		HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x32c8) },
+
+	{ .driver_data = MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
+		HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x310a) },
+
 	/* Elitegroup panel */
 	{ .driver_data = MT_CLS_SERIAL,
 		MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
-- 
2.44.0

Signed-off-by: Jon Moeller <jon@moeller.io>

