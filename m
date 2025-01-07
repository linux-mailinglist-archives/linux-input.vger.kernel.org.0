Return-Path: <linux-input+bounces-9012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62FA04A35
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A718D164964
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901DB1F4E57;
	Tue,  7 Jan 2025 19:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBFJBqMg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B022E1F5426
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278122; cv=none; b=jF/fM95GzLEIpX2GLQ8vmq7TYPGwwdzId2D1bBJwELU+fsxwhtzeKGPEbtnh6+hOAPNtdOKj7xCIqQz9lrGgokNivm+Y470K/xVpzjnMskY87XiyNIycnytrduOEkuargCdt+ea9EGfxaJLGF+0QgKmByH2A1lR7yq6gGYW0pMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278122; c=relaxed/simple;
	bh=jrcmZ9F5N0ZDjAloPPppU6ErTxx7l2sMztlQ2Bpy2KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVpG5LATKBVTL001T3ocen7B+EsIyxMbq+YIhyDkgJLZStMs7ulbORoq6yFPN13hOc0+tgvcYg8bbO4Rl7FD//KvbTU7ezQuTlCrVqxoqbNKdh/kYwb0CRhubcHgMaToEbh/temuBnDkKtHrrLQD282jb1VvOZgCb/CJdBfHkuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBFJBqMg; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso106625905e9.3
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278119; x=1736882919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JchWo8i/DfXxHTtawJ2hwkbqhK3EOQ7MSHoZV9cta9I=;
        b=PBFJBqMg8xYLav9ywg6SKehuqJrS9XQsCSz5XyCPKs8OAg0JZbdUkXYorOD4FFQGed
         +wSVRqxNl7bhtvqXw24LQVeZs8veXotySdgHUM2bBJDV6OAjt1lUWuHIstDa9dslgOqW
         GS+ALSgcBN6TULjiPgDP92qukjGY8ZUYOEyO2iCUguTS1Kjm3C7l9toTQBzfZrltlgDN
         hmZXUf7Gg0aic/aCMFDgUhZOuhSjpysXHDg8PMjKFxZmhFOMHgSgcccAfRmoGGGXIFAj
         DpzeN0O5ha4zIVDbFl7BI1Af+NyrwNZol4QWSedhsULUzJeDmYD1csZJjzHyWkEwxQ9m
         o2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278119; x=1736882919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JchWo8i/DfXxHTtawJ2hwkbqhK3EOQ7MSHoZV9cta9I=;
        b=il+0BTpKokMR4yE44djciVHuYEJFkRbmkjlyEAjGC8g5qp4+qBx2rJA/7+w6aRZ3li
         ZfJK6F3zXZzL6cAqULs5G/U83pbXec8dxo0kbo75W077Au04WnGtQ2sGCQCejLYldxe2
         oYHAgNcVqEHfx/rC+rzOBr9hxcj/70DuKUGuN0ORE1ByMmwOD7dpUS2yg8HsJdL0Kr7L
         F6FwbdN9SdlhUPgVIaNXYGqrEoh51pdN+ZYwBQZAivM5WvmtvliS7OgebqtNmSuJj2RL
         Mv6qyys3mSSP5aKzMtr0qU8C5xPblybgeuamxtGm7a+3peA0vckYWcX8sLiQAOBUe2h6
         IYlg==
X-Gm-Message-State: AOJu0Yw7u9JvAu0oochQxkDClpmrIhGw+OnqHhievSrM2VDQ7Bnq8jNp
	Tgn/7SJtkrWYVamirAbxJQ0XE3sjmLsfzytVi5JHHMBKfoHyn8NmBXnydBnlY6NseQ==
X-Gm-Gg: ASbGncvgj2DQcWrE6u2ATLYY5/+tddq2M1xXWlBGj9/tblv/6lPrhQttbk/whJR3G5G
	J63II+skCCnudRZWnQm0NlR/EbDNj+D4TmOG/UjvCHBzZYK4LjV4NYVArXwcmt2ta+/vU665QUI
	PrjP6EKyGMaAAuSnAI/9y3lP4MQq0phiLNoUnR/Sq/G4UAtw0nVDZZtHwQoPdIK5P+PP/XZsxcy
	LOpRfu7Df7F+UGSJdRCtUFt8iTAbd5+u2MC6VfqNwSZa5310HB0ze4lJHYgmfZgd+Z0
X-Google-Smtp-Source: AGHT+IEsfydCJNIZuQohbWh21aBEo5FXX9Br7zUuQUrz52zM4OYif2Oi0GrKMVli7OZ/ezv9sebsaA==
X-Received: by 2002:a05:600c:138d:b0:434:a4fe:cd71 with SMTP id 5b1f17b1804b1-436686439e6mr566727605e9.12.1736278118818;
        Tue, 07 Jan 2025 11:28:38 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:38 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 05/11] Input: xpad - add multiple supported devices
Date: Tue,  7 Jan 2025 20:28:24 +0100
Message-ID: <20250107192830.414709-6-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107192830.414709-1-rojtberg@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pavel Rojtberg <rojtberg@gmail.com>

This is based on multiple commits at https://github.com/paroj/xpad
that had bouncing email addresses and were not signed off.

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d1b771457b51..b2716b49d3b6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -275,6 +275,8 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+	{ 0x0f0d, 0x0152, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x0151, "Hori Racing Wheel Overdrive for Xbox Series X", 0, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -374,6 +376,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
@@ -384,9 +387,12 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1230, "Wooting Two HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0603, "Nacon Pro Compact controller for Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
@@ -535,6 +541,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
 	{ }
 };
 
-- 
2.43.0


