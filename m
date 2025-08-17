Return-Path: <linux-input+bounces-14072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB960B2959A
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 00:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED891963F45
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 22:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D021772D;
	Sun, 17 Aug 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbu4OiuA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EA19F11B;
	Sun, 17 Aug 2025 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755470863; cv=none; b=dYKhDvfjvzYg6PaqOcxAUCN7+LtTx+wOyjf4cMN0MtqSOv9yhCI1IPMO7tR9gpuP5xd43Js23hCPiiNOomm0rbPZ5u1ECePfdSZuq6LluZ4Q/fAPSdI/fG4Iuvzi6mLcrtqrSzgHhQv1oCAP9xkOXI6UVjkjkCj3Uur3O43slyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755470863; c=relaxed/simple;
	bh=tbl97MBhqNHa0YpKifyb97kj/fE/XvGDjQ+/N/dxQ38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDq56NpYUwUn0dHQmCI0Tuy4vMN3altTpAbf8ZVuRNycGZb+MswgTlup6ZuQdwyNgJqALFsyeMPk/EPmXRdw8l78amUttyxsvL073OctZObEjfI2sCOtpntHKDB9Qnsi8ZdFUy3u0+LaijHFrJ6rT2Pg/KgYn5pGrV3VhKR7KDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbu4OiuA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f53d2eso41499155ad.0;
        Sun, 17 Aug 2025 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755470862; x=1756075662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BEfTOpAjlbhAGUieLNlJUFrroE45JiNlevZjfqFQ6ss=;
        b=mbu4OiuAKweRXtPUeQpS52jsQF9POz3pxj3wm3hTjh6/WXcYBZALIKo7XAR2B1pypp
         mXoGG+eFJK618hbKUWfCHu4gDpzkyGc5Szk3ijsLplwZHRuZXBS0F28P9ae5TDXLU9VV
         bzhIevqSx6dWbYwUntnQ5/cO4yRKzFhkMn10+TMRhcDuLP2kHpQij2llYursED2+ZbZO
         5EaDhapsolsrrKJaXZyFXn5rQdYvm7lDP6TJW1mss89nFHnpcZTMNAXxeRRGJdMfx+yM
         DX8/hq5g0sSfuUHilBiuTXMHARBvmA7NsRn1+YTdeutVEq9YtEkWy4rbSLx9mEYkEbof
         TJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755470862; x=1756075662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEfTOpAjlbhAGUieLNlJUFrroE45JiNlevZjfqFQ6ss=;
        b=l0+JehHAVKZeUKQ6IcV5ItgllY2MEbqp38PB9FQBJofMcRU3qHzuQTuhkrdQVbUQy0
         usceFuawi47fy944YWHB9wpeC97es+PFXcBdnhRkzcZ/g0fo2yZFHZ5qfjuRdE7t+GzP
         lJGpFs3ffGg3rCi/bJbnQDB/wb0Ws+7wOzTOAckmYXFkqxgn/d1bIQ1HDWvKO09r8pGr
         kOgMPZ9HxnZa7reCEExsqLQ3lo56p9+oysGv/EiZQVE9aqzNBSsksnk3GBuUAWZs/SHK
         nSjEnXkvdGmQB5YWQtxfUJXc1W/Fcsv69v9kwJPc50ucA6zK5QGqDg7GAVKupkG45N88
         4Hpg==
X-Forwarded-Encrypted: i=1; AJvYcCVYPBa4E+Z56iSROhK47DgYQiJm7R+YBarxjqJ1vjDMA1YsmRyQR+aX8FW0Dh4ROovi3v5ubyvmzwuehQ==@vger.kernel.org, AJvYcCX4PG0J14gLKA32jNc3D9gb2bOp2exQTr4yOhcpHqrYEl2pYzRguem5nTYYmEjD9Qg9dRXjD0Fp2m9AQ9b9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs+x1P0elpsYuh3XVaoawo3Zvzm4+nlA2g4q8ERNdMOqRhc6Y6
	JTxI/DNDF2eJEipUYrKIv7BfBof9n/rph/03ugY74IhnWXpxvGaL8Xjw
X-Gm-Gg: ASbGncuscdmG/y8eDzi8hn/iHGfYfeZoEEEsQINVyqivRls/p9Dd3bAFoQ8jAZYEt02
	Tsq/SLaYP62XJ4LLD//bac+OBzZBUvDbf0fWI9R6T7IvERrUPQmytl+oRLFwzIoJI2ucPcSSahg
	Z0ALKvHIph8IQtTpb0LhGITjKqbFtJGMhjJgfwD/mEZwNPDUHvcMlZtbg1C/w67zx+hoOif1Rx9
	NIf7QcSxkt/p+ye6dK7JCJt3ySvl72tkNcxOW+tXlJssTGzreGqSqBVIf2t5BeelU68XYZRj8Ao
	eZuxdIKLOUWlItORZpuKZfcDTsgHKehxq9lUcwFe+OZBKsSoO2Px2rIjRVJrLiFRjEkERj8rb/J
	OZyvBjiwsRhX5KsVyCM6LNhLh6TLTKG8JGp+vW2nbKHOM
X-Google-Smtp-Source: AGHT+IG6Vzyo5u4PrTj9Zs1XpIJFCwuAkuLXGEUrBflcgADf0Rn2ygADohdF3N+Xb0c1qqYZzyDYxw==
X-Received: by 2002:a17:903:2ac4:b0:23e:22dc:665c with SMTP id d9443c01a7336-2446d888ab1mr162344515ad.33.1755470861856;
        Sun, 17 Aug 2025 15:47:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5792f1sm62741795ad.155.2025.08.17.15.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:47:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: gpio_keys - fall back to platform_get_irq() for interrupt-only keys
Date: Sun, 17 Aug 2025 15:47:26 -0700
Message-ID: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To allow transitioning away from gpio-keys platform data attempt to
retrieve IRQ for interrupt-only keys using platform_get_irq_optional()
if interrupt is not specified in platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/gpio_keys.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index f9db86da0818..f56e92f7d631 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -616,12 +616,19 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
 			break;
 		}
 	} else {
-		if (!button->irq) {
-			dev_err(dev, "Found button without gpio or irq\n");
-			return -EINVAL;
-		}
+		if (button->irq) {
+			bdata->irq = button->irq;
+		} else {
+			irq = platform_get_irq_optional(pdev, idx);
+			if (irq < 0) {
+				error = irq;
+				return dev_err_probe(dev, error,
+						     "Unable to determine IRQ# for button #%d",
+						     idx);
+			}
 
-		bdata->irq = button->irq;
+			bdata->irq = irq;
+		}
 
 		if (button->type && button->type != EV_KEY) {
 			dev_err(dev, "Only EV_KEY allowed for IRQ buttons.\n");
-- 
2.51.0.rc1.163.g2494970778-goog


