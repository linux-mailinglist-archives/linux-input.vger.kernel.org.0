Return-Path: <linux-input+bounces-9008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE7A04A32
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CF6A3A6550
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A291F4E53;
	Tue,  7 Jan 2025 19:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWVt4suW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36C1F2C35
	for <linux-input@vger.kernel.org>; Tue,  7 Jan 2025 19:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278120; cv=none; b=NXOIuiWRefOHoOSW3lZLS5yVVDiVXlrkDMsNfdNTEZR+TvVW9pBqHNFzsf3R49P3yLijkUiIQ0SPnZjNN/JQakdWJwBIMRShcL4mnU9UCCBrz96uGnqjvhZW3CAmKzwuPufek3h71c6wDbGFvexOQpNsybh8OLJMT8X5bMxTwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278120; c=relaxed/simple;
	bh=UrsIFDteo8Lr3f7hDrb8UKdv77Y1AiDtVGViM8XJWz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOypipMewLVwJt0HRxUs4m4lZzGdZWvxWpTx5ROvCkUHXgaZo2C0i7JYdMKiMdN34Cyx8MmE+ArlYPQoUPul/rmAww5XhdeBM2y4hhO9my2zhqOpni8xF+94IAAioKXbEhRJYhoTHgGytxnR4PTXMJyw6/xIoFPhrkHupJ6HdzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWVt4suW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso158395235e9.0
        for <linux-input@vger.kernel.org>; Tue, 07 Jan 2025 11:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736278116; x=1736882916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=QWVt4suWJOhWFxEhQMI0UXAWBrxPx4lH2dPbvNyHRZTKBTQm2O/pG2gcwoJskRl5wW
         YshBxSlXjwmjq2nELvrtDl4Hw7FDbIazvptCvDi94LYBPxXN00Uj7l4HbidycnQ0CTN+
         XvbQbzepmZwJJ4GNoqsWNK0EpUJ9DZjlRlnEIQmUaFCjFGc6UjkhF3s+wKME2rmQDtUg
         4qDQjgpExKud4bAd6t28ZzbWiG1WIDoU/BXwgx5jvEoQQEr4kcreUu5A48DwDWf+peTd
         HuTWrvBAfjWhvSwOrfGrC9XZ1jLqDfhc4GtVCp04Yr7eKzDMLGZEUf0YVH9q1lzYPFWF
         Gkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736278116; x=1736882916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdOCN/wG1FyfinZDH8+CSB82bceiDFR7njZ0SL5uyXk=;
        b=Sr6kPg7iy8yYCmnLKcpGLJc3dVBgzyhUrGZGqTNSZAgG1DHWxC5s6+oQu5fagA6DmP
         kT/aG3xVI/K4aAR5WYxZ5MPk1x7qx/dTPbNnmOUKZkFP0QRkmhMlxXvl6x1C7Wgg1nJp
         xqeLws2Z9c6yTYCNSYECBR8X1FgDPPx40SQ3xjMK4DuwVrDaPb/p6wUdPxDM1iYoy3+p
         qFki9d320Ps3MZ+PkpBcELMhD9IVErkICKEyS5NWuT9Rpo0O55EXuCoDkCAaZWoQHog8
         tVLLjEJElTjtzTbFXcU4/xVCa+BXDUBlkBSFRUsmsSwzAYTrlgTszs5dZb4h/xWSD9Ph
         CfqA==
X-Gm-Message-State: AOJu0YwLCVXCc3jlQ8P18XjcHdoFM0oQTrI5lBWow4Clg1ep6YBkwgXf
	B7S737JbssMzR36l1bdM2YJT0MA+C3tODagqYUfUFR+Vfg7KdVY6djlNw5cA7DIMew==
X-Gm-Gg: ASbGnct9n/Vh49emaYaY+OXZlYsYbHk1lKeQ77N19tAJU4SXsEst2voHooPPjxus7gc
	r7eqnmKsWcIzYRa1HSihPtxAq8BWBH09gZlpOajf/7qb9KLYAupGw9OfpvPMHqnxNQFtQk5HJN/
	NGbzFGnXeYejhtPKt14EKm9PkgjCx33zUqNtycQWeuAfiDfA7iPu8syPZ8nasyUZFgQiX6X4LUb
	OQyvnn9WS/wiQqnMc3m5EpOAyQV5NgP2zYQr8s9GzZ34H3NOh6Rmfgqb8clajGgjYjR
X-Google-Smtp-Source: AGHT+IH3fB+2txNLrTBFSXPY0OG/wY25G+hdJr/X/SmOjFVpHs457K9ezwmNvo1tOh7K3mB2/pewtQ==
X-Received: by 2002:a5d:5847:0:b0:385:f6de:6266 with SMTP id ffacd0b85a97d-38a221fd10cmr50001357f8f.24.1736278115846;
        Tue, 07 Jan 2025 11:28:35 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4a8:4000:2867:420d:1978:6fdd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acb17sm50456700f8f.97.2025.01.07.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:28:35 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Leonardo Brondani Schenkel <leonardo@schenkel.net>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v3 01/11] Input: xpad - improve name of 8BitDo controller 2dc8:3106
Date: Tue,  7 Jan 2025 20:28:20 +0100
Message-ID: <20250107192830.414709-2-rojtberg@gmail.com>
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

From: Leonardo Brondani Schenkel <leonardo@schenkel.net>

8BitDo Pro 2 Wired Controller shares the same USB identifier
(2dc8:3106) as a different device, so amend name to reflect that and
reduce confusion as the user might think the controller was misdetected.

I have personally tested it and I can confirm that Pro 2 Wired will also
not work in XTYPE_XBOXONE mode (buton presses won't register), therefore
XTYPE_XBOX360 remains appropriate.

Signed-off-by: Leonardo Brondani Schenkel <leonardo@schenkel.net>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ff9bc87f2f70..8a02b9a5ef79 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -373,7 +373,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3303, "Snakebyte GAMEPAD BASE X", 0, XTYPE_XBOXONE },
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
-	{ 0x2dc8, 0x3106, "8BitDo Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
-- 
2.43.0


