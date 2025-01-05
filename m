Return-Path: <linux-input+bounces-8907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 396E5A01B95
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 20:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25917160D0C
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 19:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6714143725;
	Sun,  5 Jan 2025 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9C8jAtI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D0A189B83
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 19:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105887; cv=none; b=FQjt55a19/JbHlZ9d2MpGK1tD9c4FS/DzCNej+9Y7d7EDF4t3afXn5LXA6KtcTLBQRPGbn7BXQ0NGrUKdMxbnp2EMAqCsuSBjYKRz7tLJ+tm/KBhPnzZZX1GgWNrBBZChKFEU/mYxCaOq/Xprq7iGuHDQs188sc8hRyv8fonHjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105887; c=relaxed/simple;
	bh=Lkge2qpqBfaColBuXaLwVdgs8nuY9pXm/5kQ2hVpaLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFHhyyS6si8e9lmjwDT5rui+DTGMEa84ihYCTVPzQ6wNd6GNyjtv4UpTe5FEimNLQVnZ495jNZI0SyVIBFUoRbLnRqrDpKHwCKhXj3tvBxL5BUYpWebuMWi8y50I7/nSHXkjgybTNWz3GhGkpz9z+mnPsooFbESNghGVp2AcyKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z9C8jAtI; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso6992007f8f.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 11:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736105884; x=1736710684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uZROf4hO6Zu/UCzMPIcoL3UdQ51TdURKKK1wj026yE=;
        b=Z9C8jAtIXjqdIWbrZYhA0r7Ch0CeCJ/W3S6NWzYvM2nIhrGL3EFxdPhUulVJy/8Jn2
         cGTMUYCjLpkPZUCkGolaPeXVCi5cTSpc2LxjKMoUKMCvXARGzgzPkUhgwDdDqREHbrRN
         kz6EAL5ckvbJ383Gyjuc4b8aFraWXzxFGkxgpR/C7edvKjqkVZXgDS+Pb4Q8JEbm26qf
         8sveSBAVIpLTlphCVqfeanJkjW5QZ0VDmTUvAcLoR7RfXSuhtUQZsvA7O1lEUSSMzY7Y
         bpM3MMwSyHYdGpPUlKYGTOD4Pc5XlzWOnj+iYzAhI0l4cny7AwWy5+0ATuoL0IgmOK/a
         9Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736105884; x=1736710684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uZROf4hO6Zu/UCzMPIcoL3UdQ51TdURKKK1wj026yE=;
        b=vkqn7Crw1cs03hN59jGU9zDaVZbWaftMNWMhN0mAkSZz4NRMReLknV+w8r7T+/tYDr
         yNbnqe0s1oBeo0A2NJt5mZ9esteiNOHFuiSU8lGbMEeG5rhN54qt+2bsgCSMroXs1/U0
         luLn5MFw+2qCj61/ha1xnh5Q3Yph+S49qvaIgt0AgWpox9pEpa2dIpTJqOSu/l9TGnic
         145PQImmVBDAx5J5os9uk1zQn8XLRBydXsnk5k68WU8FPHw/9VLmDoTcM7xtaHia4e3l
         /wVeQwHM9Lwy/wFfEub10ikZGWadh3psb2sJJb2NYG/9NxZiI4SvtngjmyM+wFyD+mVp
         q6/g==
X-Gm-Message-State: AOJu0YxZxe8te+Fdl0a/XZpO5K4Cjr0KIuqoBtlWqYeqvvXoJ6TwKogL
	FVK5JYPaD19qZ49dPVQajLDjL4uO/WCGW9gT4HKk8ItP7QMnFwNJ2yy2KhW3qBDRrA==
X-Gm-Gg: ASbGncsqJx9EPgrb4Nmabp2wWLdu7kR0WQh/Oj5sQXnprIUC47MSZGW8asVxlBksg9N
	fvw43bCyhokd083lHqIMFTASULhxQDMHCNryOh8efbIztwUu3uIU4qrNL+C14fkTcrrKiSDyYHJ
	BMydz9m6/vg+/up+nBLrFf5JjauZgwsI79vXCm0DLfiE51890ioqaYAttOZ7A0GUrhbZ3fVdVbm
	syYVUvjwlq/Ana1TIAfjKJx62N+UdVyQxe+70ORIe+vcHSd9PcjNJRBhtI2rdYE2Y3V
X-Google-Smtp-Source: AGHT+IFYZvpHMeXlxtLZaQu1iRqTZpkHAAwgO/kbioUwok9BYQiVlHklugF5qRS6e/mpuoXVre9dHA==
X-Received: by 2002:a5d:5f4f:0:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38a221fa986mr46893936f8f.16.1736105884388;
        Sun, 05 Jan 2025 11:38:04 -0800 (PST)
Received: from deepwhite.fritz.box ([2001:16b8:b4b1:f000:b401:d562:1102:1bc4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8332absm45579309f8f.38.2025.01.05.11.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 11:38:04 -0800 (PST)
From: Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To: linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org
Cc: jdarn <109807817+jdarn@users.noreply.github.com>,
	Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 02/13] Input: xpad - add support for 8BitDo Ultimate bluetooth/hall effect variant
Date: Sun,  5 Jan 2025 20:37:39 +0100
Message-ID: <20250105193750.91460-3-rojtberg@gmail.com>
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

From: jdarn <109807817+jdarn@users.noreply.github.com>

Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8a02b9a5ef79..f03e44c51efc 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -374,6 +374,7 @@ static const struct xpad_device {
 	{ 0x294b, 0x3404, "Snakebyte GAMEPAD RGB X", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless / Pro 2 Wired Controller", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x3109, "8BitDo Ultimate Wireless Bluetooth", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x310a, "8BitDo Ultimate 2C Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x2e24, 0x0652, "Hyperkin Duke X-Box One pad", 0, XTYPE_XBOXONE },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
-- 
2.43.0


