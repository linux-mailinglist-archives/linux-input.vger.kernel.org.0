Return-Path: <linux-input+bounces-8909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E58A01B97
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C163A31FD
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C5219DF5B;
	Sun,  5 Jan 2025 19:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUHMezD7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477711B5ECB
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105888; cv=none; b=khLrX49PRWexQy4s91zAnupIv1EmsOoC5hk6cT5jaKURil/W3xl5XJMlD0+vUzHcCL7AfLDcyM4lqfXcQ6d6G8LtXk9fiRriYens66DQFnQ20U8CCe1wTmlodJCsb4Z/U93gJItq/lv9DaKHbv8v9Etj7cPm5VeoCFKfGuQmEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105888; c=relaxed/simple;
	bh=aWU8an+CJYMvH3dyEDsgLafCDRGAhQsyF4pSi/jfJ0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u758ZWvaTu08aIB6qgtDg6qikMK6RRpjs7Y5qOMXblAvIwV4bLd2imUnAvc2CY++ONf/tLjYEYFeJL522Wdxt6naCshANlQrK7orbWsWoQ4BHQTz7Pst0SSDCmnmBQq8akcmRbN4WaK7StEEynp7KFPIKsfUv5/ao85bZQVhRhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUHMezD7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862d161947so6535175f8f.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105886; x=1736710686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VhUXSGT47hwHqVMEei28Ndiotsn4GzGiobmN8tIssk=;
        b=PUHMezD7pdGxysc7KH/xbkQKj3NnPDrs/6uJ3MvHUm+bhKNpDLH5pSC4RDKSpApbND
         7uwBhETZkF18ci0bTYVvP+C6cP56OwNPjfGy3ra6m0ZSCoOLl8ARSejdwnAcVRY4Fyax
         GTUixy1tswQ+Q2QIDKjwpcp/O7M/P8QT7W9V3bjDgJ1YIk8MPirke6OYq7VYamHSnL5W
         qfEddL71LFmSFO7eoHx+CpgZwCpghE7H70+YLvwpOGXTVAf9yYcmnq7h/7+bHjzWrZKj
         AbtqTyUd3jmZUUE6kDRVHctnYVkjEWJv+HV9z6NWMyBvd7w1y3v8KYQH0taaOHpW04cX
         TrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105886; x=1736710686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VhUXSGT47hwHqVMEei28Ndiotsn4GzGiobmN8tIssk=;
        b=HmsL81rvph7YTJMlajEaY5gEd5U4LcyLQhA8JKbNGA2UbtMXF4RhUrIvCIcISUrfoD
         gM9jlKcn3Tay/jp7rYOglxWV8Nq4PfRrTFyHRFfhxaXD9sKK1hAF1DGVOloPwYudEvNb
         MTaGrsexy++hHdLkmhtWyly+rxVk6dY3e1IdK2LxVrVsS/q2vqb7EHtMt05Kqu+c1hTA
         QIMj1WuPiCYmNy9hKU0vZXMXSWP2dGG/eOkKZYYSK4gKlAzH7e666LsrYh6CxerIH1Yx
         neNGzVRKFkPLqarkcjqMlVivqwi4EczS74FlcGpmKNp37D0n/vlKB7aj+7/c9z44IUDm
         cGZg==
X-Gm-Message-State: AOJu0Yw8WVyEtMq59aFpuB1HXa+wURnKcASuh2MW+Xt4Ef3vA2Yme7OD
	hHiR8NUesWGEIyRvy4MPDDk7+5WtEHSfscQabX/RXe0Iw58MPOQ5aKrsJlaU30dUhw==
X-Gm-Gg: ASbGnct7qMqRRKrbdp+xWiYhFU4PYtoKVNB5dqtAk6yQCw+/E8TMH3MHPXZZofUYhbz
	gtkcdvAILzYxUGpDLy9S0EmSKwQVBhfLoToT7mdSvoGE/QNwX8QimMSjmaJssGOm+8IN/sBu32k
	nwS1c89e3NlQ3U2ImtU3G76HsRoREF2hZ66JANU2o1wznU7gvLJvBzoV9Y62dLj75wgtJQRQuBO
	L0zv+aZcIeSSMHF73mrZWgE4a4dfZkSCKvd2c0wO6bb6sMAlbpj8V7ez1u0ltSxvZj8
X-Google-Smtp-Source: AGHT+IHb1ldZFmFRt23zYO7yN47o0oExbSDZO0c2MCig6w3ds18LW08sVQ0Tc9mpsLTVplu00jPIlQ==
X-Received: by 2002:a5d:6c6e:0:b0:385:f9db:3c4c with SMTP id ffacd0b85a97d-38a221e2e0amr43111622f8f.9.1736105885622;
        Sun, 05 Jan 2025 11:38:05 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:05 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: Jocelyne Jones <bumpycarrot@gmail.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 04/13] Input: xpad - add support for SCUF Instinct
Date: Sun,  5 Jan 2025 20:37:41 +0100
Message-ID: <20250105193750.91460-5-rojtberg@gmail.com>
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

From: Jocelyne Jones <bumpycarrot@gmail.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 9b9ddf4aaac9..a7666a21704d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -377,6 +377,7 @@ static const struct xpad_device {
 	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
+	{ 0x2e95, 0x0504, "SCUF Gaming Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -530,6 +531,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
+	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
-- 
2.43.0


