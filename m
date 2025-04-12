Return-Path: <linux-input+bounces-11744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F53A86F2C
	for <lists+linux-input@lfdr.de>; Sat, 12 Apr 2025 21:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69B41189D025
	for <lists+linux-input@lfdr.de>; Sat, 12 Apr 2025 19:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12A6221290;
	Sat, 12 Apr 2025 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAKrruet"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E43219A80;
	Sat, 12 Apr 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744487044; cv=none; b=PP2aNqFPTEGEjFVv8MYl8NNERyZRgTZTxMJHH4593qJx5+A2qU3HLIxuMgRjNg60HYmz6Xdge6s9AHcxrltfqGQtuCAgHYafe1eQ1V2I7w8W+7w8ZDW7EroOpN9rg+JAg3gp1zO3zCgFKbeZwNZ6BaY2tg1bVuyzpoVGTjiICjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744487044; c=relaxed/simple;
	bh=RWx7edEqVSw05AR9zc+XkyF/HaO6n5ZssN30PFSDVxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qy3uaKs0T8zEpAhqWrtHVIezLK/jsNG/n7zh4i7q+IjM+jEa98n8j7xJSpFOkmaXUr/huU3iEIlDatt40yC5ZKrvl8QB8LkP2sF6GGU9DoJGOK7lZOfLuzjSHdrQhfcsoQq9ifght5FgHoIFbacS6JQQ5PcemuPhST4YTvfP8BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAKrruet; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47745b4b9aaso5033101cf.0;
        Sat, 12 Apr 2025 12:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744487042; x=1745091842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLU6M72PZFcmEyUkSA+Jq6N3LqykUR5gLm3jSukM11k=;
        b=CAKrruetgU1yIGVsh8ldj23V9NZQk66cFg/N+JUcA5OI/XZn3ovb6r1DRPuJarxlIo
         npLeDdeHqza9xTfWydhArhoHxgIV1BWgSJ8Bhv50VHpA59yc4iYEgfDl8zrW67GIceNa
         UOZkHjfcDi6YjNTuPQYyIRFMshi/DhcFTXFBJAe94p2oyOSuqf6Q7WYrz6xD2nfLyDQ7
         hW4wejTQbeGi2ibntcsQdE84+73bxuVMVh0iFmLKfchYEuF4mKyTFLjOIjVzYRc0pF45
         hTKmxabH9yFGrsvmNz/+lqtkmHFjH+80ll7jGqwmGqXDMu+DMu1o0S5EXpFapYdtFaSd
         bL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744487042; x=1745091842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLU6M72PZFcmEyUkSA+Jq6N3LqykUR5gLm3jSukM11k=;
        b=XlapGuzx0HAYpeFvFlJ+D9kCbU60jmI+2ftBtNxlp5+lujq8wwQgZDdypdYPoEjZuf
         jPndsq5T/dxFvCgxJhul6pQkWBbJCyGaRMUu01bw7AwFv5WR7NjlC6OQbNRproGpB1gY
         mLToy8MK8FFWV6VMI0je+ApZ3UJvdyXqiGNc8r6EEjfICcP+tIPxKGbOf3p02JlYbENq
         U0/vxYulW+2CFQMuZqX1Nswz/9tXlseoUvy5TdkIXhnYYHYWKHCQIkrg8qNDPEE3V8Ds
         jvAjpDpwPj5RJ3v326Pc7zLvbHrBne5TZni/XZ4cvTN7yB9JKPsBUJ9fZsOAZhA3qU6b
         C83A==
X-Forwarded-Encrypted: i=1; AJvYcCVysjAelLJK/+o8HKB47qroZDaG1V/aHDZJpSs5ih8y/w9WT+w421lWjg516ZD0mxlr4Bv5yVA5YDI+D8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQiWRYG/xRSVfr1YbqZ9xIziAa0C7neO8yOMe8MiqiIMds9CpN
	EfUN5h6Hvn9vYjzigq9rA0vyPII1Cjfn4ciVoT0JbOl3Ak8oPZM=
X-Gm-Gg: ASbGncsOaYyoRyWGtPVkyI1ThPVOopMGEMP4fJbYroFTkYibGA7OGyYqRC0R2mvrpqW
	sYufGQwRNvcaU4QZE67rOqAqeTtOAF1AZowHgQgdwHEZN7rpv9h7g/DZIJdoCXwsFmDmDZ07b6s
	UWUkuftq3zl87XBd0JoAyU25lBS5JmTtGQgTI9yIUuD5t8Fezyq+6R2A5bQcy3Yh3+rIok/QzN0
	Q19LnLYmKqjQyHTfU2727BnP4YJG02FaN/hvpPW6C0VGBKjEPBYY1Q2JfmAHaBc3l/VGtU/svdB
	TNpdYbEKqGXFRi6tVpN0uBcFBtQYi0QRKRfWpwUTDCifTuD+
X-Google-Smtp-Source: AGHT+IG1n022zqb+63GyIELedKBYHMJuxQj6S134HXbtAfRHJydhndY6lIBOWyIb0tThRxrKlKCYIA==
X-Received: by 2002:a05:620a:f11:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c7af1ce7femr380540785a.13.1744487041921;
        Sat, 12 Apr 2025 12:44:01 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89437a4sm447988985a.23.2025.04.12.12.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 12:44:01 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: dmitry.torokhov@gmail.com,
	u.kleine-koenig@baylibre.com,
	jy0922.shim@samsung.com,
	kyungmin.park@samsung.com,
	kgene.kim@samsung.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] input: samsung-keypad: Add check for clk_enable()
Date: Sat, 12 Apr 2025 14:43:59 -0500
Message-Id: <20250412194359.164533-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() to catch
the potential error.

This is similar to the commit 8332e6670997
("spi: zynq-qspi: Add check for clk_enable()").

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 0fffed27f92d ("Input: samsung-keypad - Add samsung keypad driver")
---
 drivers/input/keyboard/samsung-keypad.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 9f1049aa3048..a6657f8d085c 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -484,11 +484,14 @@ static int samsung_keypad_runtime_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	unsigned int val;
+	int ret;
 
 	if (keypad->stopped)
 		return 0;
 
-	clk_enable(keypad->clk);
+	ret = clk_enable(keypad->clk);
+	if (ret)
+		return ret;
 
 	val = readl(keypad->base + SAMSUNG_KEYIFCON);
 	val &= ~SAMSUNG_KEYIFCON_WAKEUPEN;
-- 
2.34.1


