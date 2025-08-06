Return-Path: <linux-input+bounces-13833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9317BB1C168
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 09:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C077E185EFC
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 07:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DD021A95D;
	Wed,  6 Aug 2025 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvAk3qzz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D57217723;
	Wed,  6 Aug 2025 07:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754466001; cv=none; b=trpej2j53Ufxk63Mz811gNqhys9KqcXj0DPNANZalpjXkzGED/OWU9NvI/PU1WqnwjBYcFZLqDbJLGvmYAiFvz8Np2fHkUPTumZ7xdJNTMsRkPoVdahLkZruDQ6Erb7J2GFH/mmiP2vnjXL3HdiO+6iPTtKNdvERuJeiyG6lzsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754466001; c=relaxed/simple;
	bh=P+mQdIKVx8+6SPXgnvAOQPII5PqeUjTD2wcxHWeYFRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nP4uLzbGpDv9QyvW6mH50XcOxuT1YokCjUothS5SbwZG+VVgx0WH3WvwUewMrJmmtA8OxLHzCwwHhb4b8Uh16S5pv3Oyb7pxkGcBZd/lzlRrxvr7N8yj7QHzetFCZmTmQsDk9LW/z7NnYpE0HmamX9DvFay1JgFOmjKNBEjyOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvAk3qzz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b79bddd604so4233269f8f.0;
        Wed, 06 Aug 2025 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754465998; x=1755070798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLZ9Qr5s+xpRmBmPIo2N0uouymCQZmt4dfwlf4omJlM=;
        b=kvAk3qzzLVt4TJ0rrJc1CHcE/JMezYZG9UQUDDthqNI8K5z6tXds+55hfjhoXqBIGr
         jAgGvWijtGUCAfwzyKDGzynjMN/WGqNfPgoktyZDXc+sHwuPVMWG+55/lVel3H+StgsP
         n7QOOg2JxJIv/gcVYIwhz4XPS0Mc4gQG0Hjqihk5XPW/oamGChvvhAuU0n3nzWo3bgPS
         i6MeR22dELPcoOt4dEq4C4yjXvIi1vvmS54qbXhr4GRmeHBvJuO0RP7mB9MLvJp+fYW8
         pnnt9wv0yCQOsUi4TDJ5B14VQ/CYf9ztNN+uUexK4OzeIPOx78ZJyI31dwYcKmxnvYYe
         VJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754465998; x=1755070798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLZ9Qr5s+xpRmBmPIo2N0uouymCQZmt4dfwlf4omJlM=;
        b=krSlax9x45mlPsbebdoY3c7gqR8Zs2IYiJ6QR2nz9yoNkWWT6Os9lsQS7G+wvMvmtH
         AdGeegHHTVbIaw7zTNxzEZalZOjQQI97KJVZ7MVpAjrNq24xOeR1AUZFhS+5W2Do9Dvr
         gwwNYLAg4JgK+PPUJQVIZ7KECyPiYegKVQajZtP2fvTcO/3eVzHLGMlP4GYoFeH0bf1C
         OZHNaRZeL4IC+YuWDnG5feWeMGfAU2dPCVk7AZpnHKTdYtLTDCLSXkOqlRKdbTE0GTsZ
         x1WqnViq8YpKegNHOl43pcAlMZ3E0FqR5HChnun6srJG5U3btW1yFVrvVhQxUXqPkRNh
         WTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9yfB712RwF4/octjl5xWFTfF3Di6QymDr/ovHriKCPAdlkDUrjxR96bjww6EtMAyRJMhyx8fqDjQQ7IHK@vger.kernel.org, AJvYcCX3uztZ18J2TDiF/ADhV49X87rw7OhQ0gCsyfgI9o4iwyTI5NYZpiiaIglhZkO82OEfBE7wrFnCqAHZiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/GwZHYkpRCxAOzUdtpcRi8AMY6tnnyhacV6ryjE1ah7nif0Jl
	IRu+Lse1rr3QbhYGEhIzv3Tkp6/PTvvp37uV1JzB+fb/AWE9UeBenwUn
X-Gm-Gg: ASbGncutjiNCts7SVyuVcNHC0Sb2z8tmSYM+KQ1pITC6Eo1+h6UJD7JROaOwvQWruWr
	WgVNP0g3E10Nlw2vqAZoOHJFwIzZMg4vPI8Y2vjtThhri+Y9bqyu5OOjyPV164WLbHTODwW72xq
	i94KX4jE8WrGno3FVR/e7FDNMV8mELIeJrh0lLo8k7X4/3Lkq6IYMiPXHi+TrVBGfO1X/YFTF5E
	XkOkLDzMFe8K4xQVC4beEQ2GsPWyVkYeoI+Yr6hq3LShvPQMoCCD/ZBi6yV08Tjsfw+Omuhzeir
	hpn+ZxdhRNRhoN7n6pXc+DZpUnPwJrrE5tU/2arUMdbAYBfMDBI+840S/YZUNzl58TkAkSjVhSG
	DYXQ1QCzhctzESvxM8Is=
X-Google-Smtp-Source: AGHT+IF12SoXPtt2sCWPJz4R53Xg01mev0M8BY7JZJkE6p6WYxbdzyy/pWCAZGYbz1HfLRIEB94qOA==
X-Received: by 2002:a05:6000:258a:b0:3b7:9af4:9c93 with SMTP id ffacd0b85a97d-3b8f41c836cmr1481755f8f.35.1754465998497;
        Wed, 06 Aug 2025 00:39:58 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f5d7deaasm1012694f8f.65.2025.08.06.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:39:58 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 2/2] HID: input: report battery status changes immediately
Date: Wed,  6 Aug 2025 09:39:14 +0200
Message-ID: <20250806073944.5310-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806073944.5310-1-jose.exposito89@gmail.com>
References: <20250806073944.5310-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the battery status changes, report the change immediately to user
space.

Fixes: a608dc1c0639 ("HID: input: map battery system charging")
Reported-by: 卢国宏 <luguohong@xiaomi.com>
Closes: https://lore.kernel.org/linux-input/aI49Im0sGb6fpgc8@fedora/T/
Tested-by: 卢国宏 <luguohong@xiaomi.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-input.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 262787e6eb20..f45f856a127f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -609,13 +609,19 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 	int capacity;
 
 	if (!dev->battery)
 		return;
 
+	if (hidinput_update_battery_charge_status(dev, usage, value)) {
+		power_supply_changed(dev->battery);
+		return;
+	}
+
 	if (value == 0 || value < dev->battery_min || value > dev->battery_max)
 		return;
 
@@ -642,13 +648,8 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 {
 }
 
-static bool hidinput_update_battery_charge_status(struct hid_device *dev,
-						  unsigned int usage, int value)
-{
-	return false;
-}
-
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
+				    int value)
 {
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
@@ -1515,11 +1516,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
-
-		if (!handled)
-			hidinput_update_battery(hid, value);
-
+		hidinput_update_battery(hid, usage->hid, value);
 		return;
 	}
 
-- 
2.50.1


