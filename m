Return-Path: <linux-input+bounces-9651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAAFA248A3
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106103A791B
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143EB1662F6;
	Sat,  1 Feb 2025 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKz5DgrF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459B615ECDF;
	Sat,  1 Feb 2025 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409963; cv=none; b=OwEdKdXKMWVQ97PA4HmsgK9p1hKLrvTNr7Cve6bLBWMMTkS9m0/r4av4xmdq9ySQk8ke4uZtduiVhRo8H5rmV9/D3iWGvseYIgReL4NxXISwXAlWrSxrAqiVrvDHTNzYJ5xIDG5BHirW7id+KoeEYshdBYlhU/jUs1Uf0VdY518=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409963; c=relaxed/simple;
	bh=zTwIXpyg0mHNtD7uCHb5GL5R3gE+O9SOPeN8sdeiguw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hk4GykpMryxwk6FEbm/ae16CwFaNOnY2x+ylwBAOdwgCxDupLqh/1zv0X93pLn+FmXAvKB8oKhz60RFgiPT4jHrkFpxJAnrUijO2WelKF3iO6klJhYodhx3HmGnbatihj6oZUdN7dnfRFXXr/UjpZdIeJZMQJbA0bQQe3LsM8eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKz5DgrF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so548673a12.3;
        Sat, 01 Feb 2025 03:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409959; x=1739014759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC4iGOt2xuq/oJPQvyauKugGtl8Y3SOpW/Za369SnpQ=;
        b=kKz5DgrFh0yFVrntO4b9qoBJU4fPmZ2RPPYfr+oXScL6a5YvMGBI602spmQx16D0JW
         TUPXhwO8+SwTtYIlW7RPDS/9phfIe5W+ZAHZHu6WHkmR2kowBrp7lZ/hLXJq5ipD11IH
         wExCNyEgYRROFtPQMUtO4ojlGkv3tnBgsT1K+cUr8KSylbJDTWp+9qqgAe40FQ4KwWXE
         IRZ0iBE5Qt9BIk2Pn4EGx2iY0Wz5AZ5ijICQxp7vw4ovmjPf40SEFtsF0lXjvdQ4cVGG
         JLTJfCNEIWQFPfbQNp0O4M94V/07KqRhaJQBORL4C+GZEWm7F14vu4ZguNcnTU/OV93H
         eoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409959; x=1739014759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC4iGOt2xuq/oJPQvyauKugGtl8Y3SOpW/Za369SnpQ=;
        b=Vz12dt28RJBWhCTIHh9xV98rGYWiza08rXP1+VFbviKh2svnx2CnuHAaaVXP72FOJH
         RtKNEZIR0JbIQXTHzWtJ2WEf3BJ7EhjgZXL7vVgFvz1UAFBraDTmU0Jbco9/5bENOvMw
         lEfimYXDycRh1tKHUIrP5i/BhdFqc5+rQzQt3Yy+BUxxy2S/iDF6PZi40D26PrwPntMN
         begC9pqySnj0V8nIJbu4ZeJ9w3O5lt58t4oUnNm6Zbf98RJMkxZv7idvHguEYtbbFo0M
         04/PczS4e5vH0KDNdBTspenqm89/dAbpObQhuL9HwUHdPbivlVTtT8L3FrVaPInmh1xo
         fJcA==
X-Forwarded-Encrypted: i=1; AJvYcCWDyY1xf0OO4bP5KKXxc3C1fsCxCYYuBrGfqgRdouM74oKMro/IRmdIsxfNwZZZG33nDa16ow3EerdSaQ==@vger.kernel.org, AJvYcCXRYzo/ZFeualrFuORCmiV814o1kdJdnpqUM+bsCTLMzleCsaVBlZzGNkiTbz+/KtNVgI5b2CYmkUua@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkcx3pu67Lzn4cRzV9jLtGTc/JZSLCBWWvxhXa2xIRIyfcPYCD
	dfl2aIUSQzToisCmp5pVia0AyJTktqjVUNjp6XOsQ4BST7UeRzlO
X-Gm-Gg: ASbGncu4gAZ3T4blCxmR5utBkhuOfIFIR4/X4jio0+pTEiV0TUZBB3Ia75Dl2S6XMN8
	UmosYc5MlAYswQCHbQx8L1a0u+MPL4d6CNdCPiwSkUlD3Wq3yEVaoQjjuCB5o7Oh5acxYXDgu3j
	GmWZv6yRfBOzj4d8EUOE0NXfzkdoVyTe1YW4TzxOHcQQv79WnFSF0aXuliq4OpesMBk7VLdsGek
	yWYcSeKLcBrWfAwvKr/p0r8cGSDbRVpUWXBAL08i1FgSN531SWgE3FQqNBW6uuDtMviUiLVAaqx
	fox9hk347siZkD1X7fVZEjFJvhkAfRImO+Fum4x9giJuSC6KtO2uv4/zCIRbMg==
X-Google-Smtp-Source: AGHT+IHbgsjMc9CVesWDKqWbpiiEunAM453qdYij5/G9IptCofFVo1JyAUlIHoXJAk6w0hFRV/Kddw==
X-Received: by 2002:a05:6402:4029:b0:5dc:882f:74b4 with SMTP id 4fb4d7f45d1cf-5dc882f7581mr2068302a12.4.1738409959309;
        Sat, 01 Feb 2025 03:39:19 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 09/22] HID: pidff: Stop all effects before enabling actuators
Date: Sat,  1 Feb 2025 12:38:53 +0100
Message-ID: <20250201113906.769162-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick and others

Reported-by: Jules Noirant <jules.noirant@orange.fr>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 9e03dfb2b1e7..c125f029b6d6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1222,6 +1223,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.48.1


