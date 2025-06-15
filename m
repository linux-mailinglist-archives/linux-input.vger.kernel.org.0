Return-Path: <linux-input+bounces-12915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4966ADA476
	for <lists+linux-input@lfdr.de>; Mon, 16 Jun 2025 00:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FB9188E9A4
	for <lists+linux-input@lfdr.de>; Sun, 15 Jun 2025 23:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADD52641E2;
	Sun, 15 Jun 2025 22:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoWUDO59"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC861F09AD;
	Sun, 15 Jun 2025 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750028393; cv=none; b=ZH+89kPu/JPi6g1gjjENMUAR9KfjcU2SC1+0jUjqvjpsICtTTmufatzr5y2SH46Xfew86IPwDWUt9nn39c+jp5/oMtHMKF8WRFlLOlxx1BVsreD8EQSQ0k8ER0Efi30qdflVZRqoCZ8xE3II4pF6yh52/XJNzk1S32YG3wt7lWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750028393; c=relaxed/simple;
	bh=YR3upt6a7NIgFrhsrnVSjKhZGYJ8tzeA4EEKjyuJIa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EuLNwlyxJLIafJqJ+jf1xOfLdKxTxyVYkMMoR7tjL+lmQEUTTlrHKu07bmEVbh47AmXyY53ioUcYrUj5KYyRfPNY1CW5Na9Ee4+WpMvn0bhLhmOfXx3B9whhzArIZ37V4KzYhmh659egM0F5xzRavKF4T9lVvFoSNvzpgbhsHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoWUDO59; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb79177so23606095e9.0;
        Sun, 15 Jun 2025 15:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750028390; x=1750633190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asoSzLl/Wq1XUSwb4kGRQ/8z2OWVCrEll4V7xShXbq8=;
        b=BoWUDO594vdfJSiLmW0Oy1NlJL8vofO1OTJxSVHI3Qrap/Ogv+Ewjb1YnURs/AMf8Y
         E0nv7GDzbzB2n3zAepENkkE2GYTvZEobOh2h2OVu7v4Y3UWD+5aG5kgoPki8pQ2Fxuoo
         wWJ1DJ2Vv/b9Ab6o5cQIILUUZnet0MA6mDTfcQMHiqTqbmRARv3BTBo4RaV5SUCTMHDZ
         fSvuMD1rm19Hn5vlfs7F759DhRykHMpgZwZpkfkBmrjg6PMOeBuKYUTM6YIr+ZKsbMYB
         pON6ML3Gu+gA2RIpWItVtMCwTIXMT+L/ie3H+XDSZ9N9M6099WrQnYzmbt8TxvPZokVm
         ONOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750028390; x=1750633190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asoSzLl/Wq1XUSwb4kGRQ/8z2OWVCrEll4V7xShXbq8=;
        b=WIudIcAPsXgqAf5PsdiClCUYkphSp4y939jOcdOIZ5n7Aio3rMiU9If1wzVguIupfx
         blNbbrUU6JUXylFxapvVQrbGRLM1JH0a2U/cRpODisJei8gfx4s+fgG7Nznskq+X1uT5
         IbsMVaXWayDeQbiUpfWIjB+xqqKFvIv3m+w2FsJ4GDPh832IXPJT1HmliENlN58xuTMi
         YGo3VgAR6zdgDjDaZKI1PUaU54Wl9t3s4hHjFS82JmC8YlsjMsDrSGrQw/ukEHqan6UR
         JVIbhhha5i2R9nVSR1J3OWzjcwAr248heOMMyFyrkW3Uo40Dmg0DLe+OZFkbrjz/v1KS
         jhzw==
X-Forwarded-Encrypted: i=1; AJvYcCUgj0s8HKJB0daT+gjF5OAsC0TJ0Oezkc0p8290pMoehP0bvccA8pWBGchhoDgJERS7P34hCJg/@vger.kernel.org, AJvYcCWDrsEXjjWCERfsHv+4T0fzopqimx79bD8yWa7efzsH6XW6jexVnbwzkpUzkvc4vwLd+2rgbptt6XK5dpXA@vger.kernel.org, AJvYcCXVAbFoEn9b05CWjAYPzNogJh6gJAzSD4FiI51+9KFARvldAtZM5ZXo7XvUQtYvsq6SFPCzi0eezkDoYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfypS0wknXZuvvNRfvcOKfNVGp9sMp8jhmoyKxEr+1EnGxX91G
	XZvPyioZZITeyfE4HGP1gC01PQOUMmEieV7A3W12N0lGw7aUC6mWTCPB
X-Gm-Gg: ASbGncueq4hgxznxTaAq3BR0KYiv7wO5ggToLN/p979VS0I8FVp/GB7d4bTJsPfuo0x
	Kj2djLUgm6pVEMjvZwJfELfb3hLzswQKwPS1b0aqnYJ5+c8KbpJFortk8DaoQJ3KiQxCO+eHhkQ
	oX3j8e6yLY6Av67mvsdhRzWaoyrhIByDeQXvjXKU6fdYMNWK/78qHkf54nOyHY7xj7t/VLNO6DO
	ApsNlrmL9hDjYqqEwo0/oE4Alzxql6pZKJ2Yo/mFupAhVH/W9fcau9Tne0BaM4s4DFm38IbwZfc
	DgoPQ1u548YHebz4Eej8F1+TQs3X92Lqva9HcGNOh2TMoiQxhSQhYMm6tCsuzg==
X-Google-Smtp-Source: AGHT+IGVXFqrvjaIKJKycIaXRqAwg7yGhm/Jk1Fyt/0+B+0jhnfHEEyUyGQ43RFeYdaDIAYuTGjz2A==
X-Received: by 2002:a05:600c:4fc3:b0:441:b3f0:e5f6 with SMTP id 5b1f17b1804b1-4533caecda9mr59334065e9.25.1750028390367;
        Sun, 15 Jun 2025 15:59:50 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:f4f0:900:e9f2:3619:31b7:c717])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d009sm124887155e9.20.2025.06.15.15.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 15:59:49 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: gargaditya08@live.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: appletb-kbd: fix "appletb_backlight" backlight device reference counting
Date: Sun, 15 Jun 2025 23:59:41 +0100
Message-Id: <20250615225941.18320-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During appletb_kbd_probe, probe attempts to get the backlight device
by name. When this happens backlight_device_get_by_name looks for a
device in the backlight class which has name "appletb_backlight" and
upon finding a match it increments the reference count for the device
and returns it to the caller. However this reference is never released 
leading to a reference leak.

Fix this by decrementing the backlight device reference count on removal
via put_device and on probe failure.

Fixes: 93a0fc489481 ("HID: hid-appletb-kbd: add support for automatic brightness control while using the touchbar")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/hid/hid-appletb-kbd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-appletb-kbd.c b/drivers/hid/hid-appletb-kbd.c
index ef51b2c06872..e06567886e50 100644
--- a/drivers/hid/hid-appletb-kbd.c
+++ b/drivers/hid/hid-appletb-kbd.c
@@ -438,6 +438,8 @@ static int appletb_kbd_probe(struct hid_device *hdev, const struct hid_device_id
 	return 0;
 
 close_hw:
+	if (kbd->backlight_dev)
+		put_device(&kbd->backlight_dev->dev);
 	hid_hw_close(hdev);
 stop_hw:
 	hid_hw_stop(hdev);
@@ -453,6 +455,9 @@ static void appletb_kbd_remove(struct hid_device *hdev)
 	input_unregister_handler(&kbd->inp_handler);
 	timer_delete_sync(&kbd->inactivity_timer);
 
+	if (kbd->backlight_dev)
+		put_device(&kbd->backlight_dev->dev);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.39.5


