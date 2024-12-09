Return-Path: <linux-input+bounces-8470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA799E9E38
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 19:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E50280E11
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 18:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC25167DAC;
	Mon,  9 Dec 2024 18:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+OuQpZo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1EC7080B;
	Mon,  9 Dec 2024 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769636; cv=none; b=CrpwZShur6qT6L2BrYQ4eE9x44cAf/tBrdZYu45Wx7XylLSTcGDetk1owjrztpA9+4T3ecXtiH0oU0Pn7+sUffUyq+RQQ7979OcQ7TzY352AmyBs6SJulOCgERdWZxdNLK/tEsj5MnszoG+up4o6y608k0wepWD8cMM0ymBJxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769636; c=relaxed/simple;
	bh=X+klWZ2YByJdBdyyVPKDTZ78WQEyOGXNmWNHTWhK4/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p//rB0V0/mFxqzCiooKFgxjZBOwpMUridbWxLO5QW8mB/+KZ2PNWdnhelb0Pi9a0EHDeqdtdW+OALsTgYS/dy5pjKWROK7O7+NHQDz1Ug9s5TMMnSd8kEtcsXbnsi3M6446SX0Zu3Iyuo63b2IUvsTX3nDJBW1+IfHDT7pBwE/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+OuQpZo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7258bce5289so3679662b3a.0;
        Mon, 09 Dec 2024 10:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733769634; x=1734374434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kIxDc4DRvgXZ4xcjfXE+4+mWRgUsmLP5l8Fevcm8+E=;
        b=Z+OuQpZoPFE6nxCf0qybnZ3cRWYgbRM9yRAr1N/5z0XeYwmwetozkyeD6yvJFCeWc7
         lhiszN9kPFXGtSymNFui+/62oesQz7/aW16U+ARKi5OjAXY/CIwp8sfM72AjVgDW51qc
         vOw+TbFi0adoSqEfeS9nhZCr8PYuscFUe/t8Qs1QZhtYqKSvsGs5+ydn+PeHimolrd8b
         6J8orOfkw5SIGVd7uH3ZnVy3CLSIhLOPQ2W6fmA7wnwSgTPxJvxHMvVatkujseqg+FkM
         WhLeO/JE/vpuVIdQ8fROKpkPrgCmgQUIQDCOgPGhbrFsn1V5Etd5llC4EhA8qDt4NVVH
         VIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769634; x=1734374434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kIxDc4DRvgXZ4xcjfXE+4+mWRgUsmLP5l8Fevcm8+E=;
        b=TAMeaH7BnCJ4WunQMfzVdwhlieIBOjO502oYdaNKZqY0fOmlfMbYIH61whRghtErWm
         WdoELQQpi93AN5Su25FRnJR7v33RBFuM1257ZIuAzBWzyvC9dBgCE231aM2VPleiRHS/
         qaATyXO2VlPpin6tIBVeRacTvwO/yTGrFI53Fsm29V3MixCQlmxW5HencqCGk64uwWj/
         22G3wsjwdKE+nxvTtePwa/S2dV0/GfMFxsxm9WPzhS9i8Hi2EPv0QLst6QD3lEbMJbIg
         sYeC90IApu8HhvfBS7ptIazzgjEw1zI2DD42Yr8+piV45X0UpDdojWemM7LNyeEqD1QI
         b96Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtFfNcdT7HCKtkEv6hm/OtwUjQiUSxAO92/PpjgxOeDLipvRzCqXaQcajM1O97nJ7excHuRuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYl3lFoMiDRwvxAJOqPsq/nW8zadFD+Mw5+Ydf9Tt2ltRe9tgN
	ZHSHpig8Dn15QssTohIwXXefpVkfP5QZIYxgNBxxyCy4QborxqwK/iW/0Q==
X-Gm-Gg: ASbGncuqMS9itozIzL62pgC6wg8tQVtu7FB1x/Rt30hl5/luDZu4sYpz2YTsw7mZ9sG
	egpD7YSoz7BwazL/pSTBDSFS3QsPmJuh2rKVZNX4euNgw79ReDILSXBleK0fDSkh1EJCq78OAoh
	ihP4If3r/WtnXZcTsyT5zEDiw6K27Yy9gQKNtDyFkvUotJk1z7bU6RHBpNBkkH9vw8rBuWGOL2R
	wBIxYNLKWoD8vftlmyFBiFR/GCsPw5NIpMEYDbEVYWRhtJKuUVJia1fuqxPZIkx9W/qSvNUZo8+
	8OO/Kl0VMhW3KB6UZCDmromZ
X-Google-Smtp-Source: AGHT+IFCwkvMEAzkhUHbm2usKHGCDu3htrs/Xrl8Znw9ppI38NbAqBjiECSMOT3AORWhZhG15HHtxw==
X-Received: by 2002:a05:6a00:1c85:b0:727:3b77:417c with SMTP id d2e1a72fcca58-7273b774407mr2964128b3a.20.1733769633646;
        Mon, 09 Dec 2024 10:40:33 -0800 (PST)
Received: from localhost.localdomain (75-164-192-68.ptld.qwest.net. [75.164.192.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd4ec342b2sm2006462a12.70.2024.12.09.10.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:40:32 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Erin Skomra <skomra@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: wacom: Initialize brightness of LED trigger
Date: Mon,  9 Dec 2024 10:40:29 -0800
Message-ID: <20241209184029.15101-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <jason.gerecke@wacom.com>

If an LED has a default_trigger set prior to being registered with
the subsystem, that trigger will be executed with a brightness value
defined by `trigger->brightness`. Our driver was not setting this
value, which was causing problems. It would cause the selected LED
to be turned off, as well as corrupt the hlv/llv values assigned to
other LEDs (since calling `wacom_led_brightness_set` will overite
these values).

This patch sets the value of `trigger->brightness` to an appropriate
value. We use `wacom_leds_brightness_get` to transform the llv/hlv
values into a brightness that is understood by the rest of the LED
subsystem.

Fixes: 822c91e72eac ("leds: trigger: Store brightness set by led_trigger_event()")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 2bc45b24075c3..e60ca39ac7adc 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1370,17 +1370,6 @@ static int wacom_led_register_one(struct device *dev, struct wacom *wacom,
 	if (!name)
 		return -ENOMEM;
 
-	if (!read_only) {
-		led->trigger.name = name;
-		error = devm_led_trigger_register(dev, &led->trigger);
-		if (error) {
-			hid_err(wacom->hdev,
-				"failed to register LED trigger %s: %d\n",
-				led->cdev.name, error);
-			return error;
-		}
-	}
-
 	led->group = group;
 	led->id = id;
 	led->wacom = wacom;
@@ -1397,6 +1386,19 @@ static int wacom_led_register_one(struct device *dev, struct wacom *wacom,
 		led->cdev.brightness_set = wacom_led_readonly_brightness_set;
 	}
 
+	if (!read_only) {
+		led->trigger.name = name;
+		if (id == wacom->led.groups[group].select)
+			led->trigger.brightness = wacom_leds_brightness_get(led);
+		error = devm_led_trigger_register(dev, &led->trigger);
+		if (error) {
+			hid_err(wacom->hdev,
+				"failed to register LED trigger %s: %d\n",
+				led->cdev.name, error);
+			return error;
+		}
+	}
+
 	error = devm_led_classdev_register(dev, &led->cdev);
 	if (error) {
 		hid_err(wacom->hdev,
-- 
2.47.1


