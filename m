Return-Path: <linux-input+bounces-14785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F9DB7C621
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52A31B27F6F
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 04:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05F521CC4F;
	Wed, 17 Sep 2025 04:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ai2ca+kJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8142A99
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 04:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758084697; cv=none; b=TPWyrINn2TcRDtUKIskyWWa7hNOcU/YcaZeQ4wGQhaJp76hSkby0A4wNWqoGrUFgq5Sjmt8NVXsR6PZjb9XD8Y5k+HD1/dkoRqiEkIwIh9RA+ALnFwP0VsstNakSoB0B53AO73jKsSzKcS9wsXnzsi3nAPHKooRsYd1cPO+44d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758084697; c=relaxed/simple;
	bh=eBq9H4xIjBRAwKo2tBIMXWyZBxSf+01NnPWwxBCPU+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQdE4/Fmc6TXm6WlZGlgicFIm8IPhtlQVUbu4T4Lwhw1g76Rz+58dEbn+793EQ1ExQbIze4FBbEQ7TkvS9mJKC5GTwPkXSE8aT3JlnQ5aE2HvVgDJiVGiYP/xmDr3OVd8SBpko2uL74QCLDA/Lx/0yALMxyk+K7z2cKgeR+kbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ai2ca+kJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-251fc032d1fso70119175ad.3
        for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 21:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758084696; x=1758689496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l12+SyVuQT2nnjzs7oO7aJYiEciTeGoUNepyZVbe8Qg=;
        b=Ai2ca+kJU6nbYup7u8KSgxoE4Go7SN8uRrIhtidwGhgMl2YBbcRVJMLw5sYptsuTPQ
         8Rk0fO744+uCNbVUg/bPGGrZtdoE+foyHXZiZZmhkSXl2SLvMuNfvcKop1IKPm29i6zm
         EX1TgrxJgdsbLJ28ZHf+p2qL4ayOu/XcLajk5Ks8W1edaRb03A21GdOWUWMg7HBizhxQ
         KUr9vDbNU0opJImnTL4Di0uy6hamPvo76Ou4bu22zVVqvCHvqOrtTq3jMAr0F7TNIM/g
         mdA0yxIzJa8PnIvz6DJkmbJroade4ZZvlIRylUlDHidfRa3AQRdLdh16S0aAHfM/cBAV
         l6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758084696; x=1758689496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l12+SyVuQT2nnjzs7oO7aJYiEciTeGoUNepyZVbe8Qg=;
        b=NOi2oV0qltkYmMu2jwDzme0Qy5ZWFsMU+mMVgKzlmYfkWf2h6lPwY6GsymQEv4o0WJ
         9YvUUUHZ4xm4g+NXbknr82uTbS5gYeTyzedSfQt7u3eBPYili2P4BOLbjyzQhE4HBcJ7
         Nd3c7xYhKVfyg5jzVGg+H1tzKtPcMcRItoEJ99YeGdgl+yuDGMra9Wyk5IhOIXVUQU2j
         SsgW0gKj8fFYa90D6K2NmP+cjiFxX5utdtWABIHoxXYOHma7R34F8/Vdq+J5e5xRR+mC
         i/Aq31i0vGqQUMLxBlb0FXU6BUKgjdkkA/PwtYDp/bCLWau9hlIIeU1ESDMopFbKRSVT
         JJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMA6MpJT8FF4v0Qty/0s55DqQWIM9OqSlEu2mZIUmouSWTKaxQbuEI/73cP97zNWBCQvp/J7OaExikMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAdAJURWnogSwJZv7uQEeVcLAl7Z7CPm3DJeRYshbb5bRlzUVB
	OsnYvXl2OWhnB30u8ZLHjpvlEEX04z0Y1z/bhKTsRCxtha35vxt33Lqe
X-Gm-Gg: ASbGnctnD5Dvd2irm6O6GeaflNoAEwW+Gb43oq/6nedCi6xnidO4ssxd+lzwA7vfJ92
	e1P6ab0b9J1R1QzI0UO8cAs0Ruzo1iGT2VRRw2pXm3+mtHdYD7Y3gLKX680d+8a4sUXjHl6fK0v
	pO5EcXxYKbXn4YPyC3N8KP4z11LyK2fcDrPcXIFxz97HPh9YdbIY6FZknDsFWCjYLxRzcPU4XL/
	4DHwN9miMsG7M5ot1+0ZQiZ+EInqlS4W+eMMiTwWuMytjpCeBHk/uyych3NztKEp0e9hWTRA4Yp
	i6SrAropH3DcBQ8a+lC4BoQHd6ULkdVG1Ya5/xOzMvZo5P5orjmDsS9p+JzZuXUFowVia2HS2sW
	lWzBoUCikEeqs+SfPawywKd2ccKm6TCDGxlHXm2maVPHTKsWf
X-Google-Smtp-Source: AGHT+IGBaqGx7H5M1H4Flxyge/OwlLNw429tAgTEgBqOR1oXLDwpAnqBx8u0wVLxKgw7Vyy11rlyMg==
X-Received: by 2002:a17:902:e888:b0:246:4077:4563 with SMTP id d9443c01a7336-268137f242bmr7098995ad.34.1758084695547;
        Tue, 16 Sep 2025 21:51:35 -0700 (PDT)
Received: from orion (FL1-125-194-6-184.tky.mesh.ad.jp. [125.194.6.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267c19bf68esm40176265ad.111.2025.09.16.21.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 21:51:35 -0700 (PDT)
From: Masami Ichikawa <masami256@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: minbell.kim@samsung.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masami Ichikawa <masami256@gmail.com>
Subject: [PATCH] HID: hid-ntrig: Fix potential memory leak in ntrig_report_version()
Date: Wed, 17 Sep 2025 13:50:26 +0900
Message-ID: <20250917045026.601848-1-masami256@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc() was called before checking hid_is_usb(hdev). If hid_is_usb()
returned false, the function would return early and leak the allocated
memory.
It is safe to move the kmalloc() call after the hid_is_usb() check to avoid
unnecessary allocation and potential memory leak.

Fixes: 185c926283da ("HID: hid-ntrig: fix unable to handle page fault in ntrig_report_version()")
Signed-off-by: Masami Ichikawa <masami256@gmail.com>
---
 drivers/hid/hid-ntrig.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
index 0f76e241e0af..52e8e7fe9681 100644
--- a/drivers/hid/hid-ntrig.c
+++ b/drivers/hid/hid-ntrig.c
@@ -142,11 +142,12 @@ static void ntrig_report_version(struct hid_device *hdev)
 	int ret;
 	char buf[20];
 	struct usb_device *usb_dev = hid_to_usb_dev(hdev);
-	unsigned char *data = kmalloc(8, GFP_KERNEL);
+	unsigned char *data = NULL;
 
 	if (!hid_is_usb(hdev))
 		return;
 
+	data = kmalloc(8, GFP_KERNEL);
 	if (!data)
 		goto err_free;
 
-- 
2.51.0


