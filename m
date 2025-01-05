Return-Path: <linux-input+bounces-8917-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B36A01B9F
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C12160926
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358FE1CDFAC;
	Sun,  5 Jan 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbHynd91"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E641CCEF8
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105896; cv=none; b=JMgZIMu1tOjHRA5pqXi0w4/zWQfG8CBPR3Aa05Nq7UhwzPxWe2cVTn0y5RcxYHZrCs7aiC6IAvvBVVvn67ZCgbMBnHDksmgioees4Q1kzS2ippSd3lEgHJ+S7wvGhSBAD+VJzCuM03iCx+5gXSlRSO0wdKJQHNzgmjn8T0Ol7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105896; c=relaxed/simple;
	bh=bdAhw0nOJ3gMlwXW6fj6vIVj/mzHEAxs+HQq0rqYgFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vk55KlVbD0J0fhhxvG0rh1kl4AoelydpvbT516qTG32fkWBxkd2bK9YDpE1TywU4gmgk+UK1tuOys8WRGYIFgOkiQbd0m4/BNB+2JL1CXE1VA5RYybNacf4TQIBuDV3wNh57rfFZMFsKBuV9BS/2g0eWDkZGvcrQjKqJeJrgpJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbHynd91; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso144379025e9.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105892; x=1736710692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5IdXdhiuC4G8QgetXQKn1DDQ9a+7iNLXhj3vhY83Do=;
        b=MbHynd91m8v8BimiiQ4uzIbOKYNVdZe17QQAuTzuQAs7uZkIeUcOJVd2ioT97uz4U3
         +/JEKj2VgfrGntkg0hSkI2p7s6CMgZ4JSoaGCIni+wRRRmk7023sh/CRfCkj/aJtCyR2
         pWP93KbPvrgKkHYxtOGbwvQhpm/MIEmZw6A0LsWZFWl/wMlPTNV8wo0iPRNSumSxAzFN
         Xbb6f1xacx1z/5mnqOODXdA5pYps0n2bQGFPoGCWwjNtDlXCt8rQr77FDYZNckXuQ8Nn
         EkIKHAO4WC4MNYkS0Pg+BQvXsKLKrbmYHV8XlA7Pt8giWBT4nNGEvzxt8HpC6Pe2jvdt
         jDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105892; x=1736710692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5IdXdhiuC4G8QgetXQKn1DDQ9a+7iNLXhj3vhY83Do=;
        b=uB2hoIASppKaTU4j6g+wHJH/x4Uh0R4XBucvEJnHjDyfpQi4h2ky3rHMrU6gnbK2zZ
         vXsH2nE5XqMOnfShEoYYjhhIVEnyhq485mUv4/P2SFzcOKwzcmKdtC01WHdeZW2jk4jf
         RZRyRRhZTAQ+zkje+J90+MCSnDjNeBMCMMoW6iG8vQ56+kTdV/XhTm3VCtCN6S1PGHK7
         6ftI67H0ZFz3PQxgeYmhuFPiKdEunaBIwVOScf6LlEN61Zy38yg6DpELQbF9i5HHTDMh
         hDtx8lbQfzTzlt6sAdt1jIzDxm6CXYUCBHX/2sqbi2pKMZJJ2lFZIIyYEgOMtr+Byfgb
         LjWA==
X-Gm-Message-State: AOJu0YysRa1gQbE0jm50t5T3oBgE4vJk+C+loT/J72riHztNMse79EYn
	sFz3CMiTeTqopsUyInHkVVqA52Jc7U8QlxkQVGZV82UFwHL+k0Hq1MiN+R1LwT9UEQ==
X-Gm-Gg: ASbGncu2VlNSY/v/y4hZTF3SoTprotCb4cG6weRVNvI1flVRvAs7Z66pp9Y+/DnbRsS
	SwD4R/ZZ7utBHEuDyhqg0dYAMexEflOw4zIIWtTMUJaS+9uBgepZ9TToOzyJi/mqo2Xgucff90x
	q2XWO0TxUWbzsE/6Y84svIm658GXYgH4MSWynhDUkHEfvph4MLgLzKYSVdUkiCTWX5FrD9EQqOv
	Q6XIqvKIbwvTbjm/N5vYU9ZDpSGlXap54JRRWOViSW8P7T38FbzyOzDKHP9admsMK6z
X-Google-Smtp-Source: AGHT+IEbhuDnvWKJ473k1TY5c5yg6lo2r7w+LTLY2/QJUZ11aRaxbWzmkiCbIhBGovEUDu7od0KYKQ==
X-Received: by 2002:a05:600c:524f:b0:434:a0bf:98ea with SMTP id 5b1f17b1804b1-43668643bb4mr493456105e9.9.1736105891606;
        Sun, 05 Jan 2025 11:38:11 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:11 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Matheos Mattsson <matheos.mattsson@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 11/13] Input: xpad - add support for Nacon Evol-X Xbox One Controller
Date: Sun,  5 Jan 2025 20:37:48 +0100
Message-ID: <20250105193750.91460-12-rojtberg@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105193750.91460-1-rojtberg@gmail.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matheos Mattsson <matheos.mattsson@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 237704b3fab5..18e33e2aeaa7 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -394,6 +394,7 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
+	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
@@ -543,6 +544,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
-- 
2.43.0


