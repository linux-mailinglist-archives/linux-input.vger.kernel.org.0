Return-Path: <linux-input+bounces-16987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E845D1403F
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B0D73018F55
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7CE36402A;
	Mon, 12 Jan 2026 16:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in7a3IVS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9C0306B12
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 16:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235276; cv=none; b=pWKfrlBqtwJvXHAy0GhpTw0x4ecJ4i8KThzLhGsICdh6V9mRZUmmIhpSoh7J2mOeMmP8KySU4eR0jBf93N76pXV4airynOP3KDsHQ0nPS8bPdsxRwe7LXFpfWoK+HIS8e7NPvakVI2Sd9+c/ZwdajJ0ZEZUbVuqeeuHCNJdOsRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235276; c=relaxed/simple;
	bh=Ym9iAOi2QmtFizMGxPfIuVGDo/GSjOtJOh27DakKL5s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D0OaVe7cWuk7TOUqN7MCQDSSjpRMOgOdQgPHYlVIsLOv7Z1IjCn6zHJDjUnzl4GyZhpKkiemuqwD9Q7uBIJq6UkDBnh8NHwLFZ5Q13C5F8jNXJjPFCu9pXE18GOo2XFAaZITM4CAxNC2jTc6GHeQY1azNqMfoghwRGo6XPx7WMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in7a3IVS; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-122008d3936so4403910c88.1
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 08:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235274; x=1768840074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aO4dW0PPvrBK2e+2bcJkCbAe5usMN7SqRQ3oa8krF0=;
        b=in7a3IVS0YxOO0KhChp/XXximRYSgULD0UqkZfEcUPVP7oFX6eClel3kHGPS9p/meO
         CZ3cYVDZl1IrG0fG6Yzto+PhV9O/oN5gl71a5ArxjUR9aRv4dizCJriSbogljbpE3IqA
         S8QdbnD1R7F/Xw8GVIeJre25vWI6npu1MYawohRA3ofEBdhh1qFBRZXzO7BFWGOoBtBW
         zgzACmglMUI2+kJMlGUUe7zSSs1QUD4JHuQU4G339mrZ2EmV5IcBr2KpyjLEUjOQUH/Y
         8gs4bwtwERB8Y9f61AP6eBksra3Hp7RJpOJLilHwwYiyRO+8Jav6RG7c/Um3oRcuUk7i
         TMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235274; x=1768840074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aO4dW0PPvrBK2e+2bcJkCbAe5usMN7SqRQ3oa8krF0=;
        b=PZJItv0ekVouML1RW45S+NF3CjYTrUxei6bN8t9HrHBOlU/xpMzYIodOgFKl7C0/We
         mqT6p/+vWsATg1p3FIE8ER9ZAYaLQiDbinF8jhjDiYIwYAwPkLyzISlx3uUOuKYFhkUN
         nhFqElwUHPiqT69s2fMsgKwI1PCwnfLl5YB46vs1HoO93t+ZMfBQAiPSaMpgTcV+slWU
         wSbBuOPp+v/Kdv+WDe1973vZd1jpoGRolVt7k9QepBiwkIKidMroeMZefPTMLUR1A+gk
         7/1kW4RjB3yH8VMuLq4aBDAU+TGh19xu7AgV8XtigxsUAorC5AcxoE80Hslfahs5mdGI
         iqYA==
X-Forwarded-Encrypted: i=1; AJvYcCUB1Le1rjVWKz6roFThVa+cb/W12LkiIfldI8ejyYNXTx8TrmioJIXL2kYqLvlnVyy7OegVIVsmD5pGmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6bi5m5qgkT72yOIVOzuG8rNMavxACdCR7VMYd3hDfztP7JfI
	ZaFRxi5JHZoQjhtqPWQHEQ2wUbHm0ChhhgWrZO3Z1EhsD/GKRECGirsRgndEvQ2e
X-Gm-Gg: AY/fxX7OR7vfUJV88opRyHuiHwCLDOWgDmCrrDbKOM6qUOHXrzv0HAQkoKPLz2udUYD
	d5JRIpKDV2JenAtkXVqL0UXMmD7muqK+gGvXDABBYOJOE8lejBGkd2LhCphtqXISdSLVyYq/pq9
	9nl2tXT9YFGrLP5mTSKN7ALICQXs4HrNKI0vvyML8l5EiKlu0jpOZ8IXm8uw93sSJTxmgg4jJ71
	4IwxQ111IeYdwlu2Yr6+a4eaID0dnUVfOxpzh4DQ5ZzD/9iZfRKNsF1XB+qCteJaDwdnuh9Hl55
	rrtm6jGyqQBBMswZtdv1IPEX7dCI2IyVE9z0qMlk75Kr1/8h3tazpcIkYQ/Epug1LeEK6vgGyvV
	0SJBBNpn/4O9pvqiHSJFZxNRidDb+SPnBlTkDCEJKvShi6olEdY4QSYsRQPwgv4+XuG/+MAgoDU
	r/HZ72G5yULIlA7v2q3FzXbguNAcZvMQs/GRm9wMSttmSOmRQ=
X-Google-Smtp-Source: AGHT+IHXatHCvAVAcXVV9CLo6IspxEK78KeeRWfP8Xq99Pt856XH31i9+R5UyQJXS5ExN7uopxsNZA==
X-Received: by 2002:a05:7022:118:b0:11b:ade6:45a7 with SMTP id a92af1059eb24-121f8afeb24mr17138730c88.1.1768235274254;
        Mon, 12 Jan 2026 08:27:54 -0800 (PST)
Received: from 9fdcf7ea0ed5.localdomain ([142.171.172.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243f743sm20652079c88.8.2026.01.12.08.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:27:53 -0800 (PST)
From: Wentong Tian <tianwentong2000@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: erick.archer@outlook.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentong Tian <tianwentong2000@gmail.com>
Subject: [PATCH] Input: serio - complete sizeof(*pointer) conversions
Date: Tue, 13 Jan 2026 00:27:09 +0800
Message-Id: <20260112162709.89515-1-tianwentong2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the sizeof(*pointer) conversion for arc_ps2, altera_ps2, and
olpc_apsp drivers. This follows the cleanup initiated in commit
06b449d7f7c3 ("Input: serio - use sizeof(*pointer) instead of sizeof(type)).

Signed-off-by: Wentong Tian <tianwentong2000@gmail.com>
---
 drivers/input/serio/altera_ps2.c | 2 +-
 drivers/input/serio/arc_ps2.c    | 3 +--
 drivers/input/serio/olpc_apsp.c  | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/serio/altera_ps2.c b/drivers/input/serio/altera_ps2.c
index aa445b1941e9..761aaaa3e571 100644
--- a/drivers/input/serio/altera_ps2.c
+++ b/drivers/input/serio/altera_ps2.c
@@ -81,7 +81,7 @@ static int altera_ps2_probe(struct platform_device *pdev)
 	struct serio *serio;
 	int error, irq;
 
-	ps2if = devm_kzalloc(&pdev->dev, sizeof(struct ps2if), GFP_KERNEL);
+	ps2if = devm_kzalloc(&pdev->dev, sizeof(*ps2if), GFP_KERNEL);
 	if (!ps2if)
 		return -ENOMEM;
 
diff --git a/drivers/input/serio/arc_ps2.c b/drivers/input/serio/arc_ps2.c
index e991c72296c9..29095d8804d2 100644
--- a/drivers/input/serio/arc_ps2.c
+++ b/drivers/input/serio/arc_ps2.c
@@ -189,8 +189,7 @@ static int arc_ps2_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return -EINVAL;
 
-	arc_ps2 = devm_kzalloc(&pdev->dev, sizeof(struct arc_ps2_data),
-				GFP_KERNEL);
+	arc_ps2 = devm_kzalloc(&pdev->dev, sizeof(*arc_ps2), GFP_KERNEL);
 	if (!arc_ps2) {
 		dev_err(&pdev->dev, "out of memory\n");
 		return -ENOMEM;
diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index a24324830021..c07fb8a1799d 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -171,7 +171,7 @@ static int olpc_apsp_probe(struct platform_device *pdev)
 	struct olpc_apsp *priv;
 	int error;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(struct olpc_apsp), GFP_KERNEL);
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-- 
2.34.1


