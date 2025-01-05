Return-Path: <linux-input+bounces-8903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1223A01B8F
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E2543A3447
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9731D5AB8;
	Sun,  5 Jan 2025 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEfKLcNe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3823C1D54E9;
	Sun,  5 Jan 2025 19:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105806; cv=none; b=IN49Oo95F7zlhQN1PriqGedJrdxketPka8xTgh0yx7ME4SUUYIfPMjCU/RsRVsY/zcjz2WWO8mVHpiUb/3Cu1jH4PulHMaiAJFZV6A0SBohnHypsf8h0vUVLgDfatgGO57rKrkdMFG42XDHrG/3PEzEBO6cUeaYne8QIveh1T8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105806; c=relaxed/simple;
	bh=b+zfvgwJH2RorKAcLzDD+FZq/xIErAzyO4/KBsNmong=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CN3Dn92ZDtLrvQg39ww0h3rVudYCsCOT4bC8C53Q81vKTPWIGtEVCgeCA3/5KCWX9UpgHdZiAzn41lmKpOZXOYyE50OFMAf0ctFRiB9xCSS/mXPJV9tSFXohd8l7yY7Z5Y2Ut3InVuIhGR2GAtOpLd/mJOKkFK6pgOA6TXb+390=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEfKLcNe; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54019dfd6f1so2210982e87.0;
        Sun, 05 Jan 2025 11:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105803; x=1736710603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIWbvhwfyoOTXpZRGFAZUIU+5fdfCWd5LhGB3garQ30=;
        b=KEfKLcNeNMZWf0RTZK0U4Dtk+YWIr5eUEdzH3MDsbTyA1MHC1PkYdzntWVf0hn4e9E
         xCkOMOCzkgM/qVJDyILOBcHshi7mO6YZzwkW7NlfXvX/hwtlVKZDyND2TEHQ9b+i4CjX
         446KW7kq7rMExqycjbjfM7ZbJFsr260pmZwJq3TUrD+Hkk0rxe/+CNST2ZflE5/A3jDE
         DitSxsXlB2iQdxJzQbse3pZbEKmEVXb03kSwOG9hmstg9zLbZIWfGC2OszKDLVfVM0YT
         9MXtyEuXw2voW8tdiZM0l4qEWdh1XXs3Lt2Kf1PZw4//a9j+k0wmexlBalMDRg4EuDfK
         x+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105803; x=1736710603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIWbvhwfyoOTXpZRGFAZUIU+5fdfCWd5LhGB3garQ30=;
        b=NmptUGgGW3WQGhT3Q115XyuhHbZ8oO0Dk9AH+v/7RX6Jh5LGNjvoMwAowqlBekyHfN
         3TsN3A3tdsb7I3bg9TnPv5deN5+D0JJPQ1DX2WKvOjG7/XmH7zI3Y9PKQTUmXhHDTYsJ
         M3H14CPgSxs5j0HomoRfv7xtky+O/G10cE8bAIBkUegD3qT16671iAc5IBjEQz63I4Eo
         CqYTGsjk0vxhzIbAqRZA+wlZuHAmunIt+h3Rll5D/Otwu/QclEsGihZYfFNK2kDNKZM2
         uKiOjTAp3TeB79oZWTAk384pLbsVjDq0aAP7WmkeFkklHVAgxyabOuvopGa9JZ8qFbIz
         s5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVJItWJ0Vb4r3ZyQnj+h2CIt5ZBjbXpiO38+oueh417ouC6tiQXMsYv5GS7VjJBAr541hvc0Sqy3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0XgLmIwhbw33rqFZJ718JkHQX+Mdj0Ktv8e2QdF3tQyOSIzox
	g+lIDy3151UGFvksiPw3MAv8P5WlPQ0n8QrLVUG3tWoSToSfeAbvp4IGBw==
X-Gm-Gg: ASbGncsCdgX+9y7F2L1sw9iUnz0i4lT/0DmEyowlcU4+d3Yuef614IKHqw81j8FqAnG
	8TwRy4QJaaB9gNIiBZ0Auhx4OIOOxK5pDLN/hqeQH2CCKNIxhNjrDmhuldClYdSMO9DAdhTUMpG
	waMrky/Lk1HELJKon5jFx2N9eKX8QIJCjc5IYCj0uG0RZcB2ycpigV28JgFL7Ry03NXtiKqqmI0
	gAZX1Q9rT8xiuiIGys8FrJj+ZxbEO4t9OLG9YuqYVaFTHJkTDmqXPWoQKqxgRxeJdBk9bSulkc8
	bERU89Lhm63k9/qgZfUmvZO7T9E=
X-Google-Smtp-Source: AGHT+IGdYne2v084esUxr9jffPl06M5Jol99RzsHx9TpoeJ5GIia9y6V9rhiYUXQQwLymSZk01A5Aw==
X-Received: by 2002:a2e:a903:0:b0:305:d614:5188 with SMTP id 38308e7fff4ca-305d6145702mr5189821fa.12.1736105803202;
        Sun, 05 Jan 2025 11:36:43 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c586sm53297321fa.11.2025.01.05.11.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:36:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 09/10] HID: pidff: Stop all effects before enabling actuators
Date: Sun,  5 Jan 2025 20:36:27 +0100
Message-ID: <20250105193628.296350-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
 <20250105193628.296350-1-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6b4c4ecf4943..25ae80f68507 100644
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
@@ -1240,6 +1241,10 @@ static void pidff_reset(struct pidff_device *pidff)
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
2.47.1


