Return-Path: <linux-input+bounces-5640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 919269562CE
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C50E1F222A1
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F36E155C83;
	Mon, 19 Aug 2024 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF+vlxDo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DB21552F5;
	Mon, 19 Aug 2024 04:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043514; cv=none; b=qnDDLursbivgc4DwyIGKXuLdeB+3Wxf1wFlsVBc6WjCoDyEDrxXYwAk4LyXx7f8VIrZDN9Wqa9jVKoxDYfG0suvZ0OIQRmNONCPdq6wj59Swdd1uIpgLHOK//mx0m3zOvDxn9vsugfERpgiNxfOhJPW7kwAp9LkIKfPWkIXg7EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043514; c=relaxed/simple;
	bh=F21f8qUMJlNMhArOFMlRGkgsjYrnEPCk6x9R+1gG2lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dP3u/69EfaiPTk5GJTgJY1yrYdDyXd1hgAn75x/oyiksyXpAe3vnauvLcGvd9ZpTH0lmwuKuwsynPOz7XSvVftVb36HJzYb3YONXOS7KkK9gb9qd+QvxdTjtgkRCxbuOrboUvx/j2SzbHDvmpfs8LXSi9blZyTfWfaENXDzoDYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF+vlxDo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-202376301e6so3616605ad.0;
        Sun, 18 Aug 2024 21:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043511; x=1724648311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITu37U4/rpe9ZTz2X5NzcdA46rL5xwCcVFnyhFY3V3s=;
        b=SF+vlxDokXSrhm4ohLHQE54mAkbPUaqfIpO3CxfDnLE3GFuKR7On7h6aUmEskeTUmO
         IxR3g1ODK9ALAL69jK4xnSbuAUMmxGw1NTdtCn2Qd2D5I7MkM+KXXf8yqwOCGnh/BHcO
         KxUIjIcDhPAAkx3P99UFBqH2RQFJfqiHIHIaNIqvfOR3N/QJudmcYwJarQCCkE6VP90E
         W2yYkUU7L+kHlog60Ab3qs1O3K8r2/n4nBZuPe2nUbV/L7Bf7xBKpFuzEu3tFOwyO2ug
         Y24+LPuMMRY2YHmLXUuvkgQTOq9PjNXMuhyqKs45UZj0PI2uSJRqcRhSZ+4yQRVUhimX
         xzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043511; x=1724648311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITu37U4/rpe9ZTz2X5NzcdA46rL5xwCcVFnyhFY3V3s=;
        b=j2oLmKUHqgilAJdk3ikk8nWj5Wor6YZRjvXJmt3IW/eJ0TCDUVuw8lnEgmInmAqbNt
         0+NsidI8BMsx+0/QakQuQCRVcXawpTS2W2uJP58N2IqAnV/YKt4iPRSQrABWTtZZOtoe
         8kLZoPzeD27B15qeWoIjecGpX39oWrVlf++S7j+day6J6rmE7Jowd3GAHCmJxztOu9bx
         9Ba4htiPHmqhnT1Le6PsbqKF+BQm6ykYTVcyqiEhh4Rl3w3kNXJpgjn4fleADayEPHSU
         q3H9OoFzSJvtPnx7P6Sh9W5ddqeDWfxl3+hKuCijgnRzc4m/cvX0AGgQ9ISPXBqFfVPF
         Yk8w==
X-Forwarded-Encrypted: i=1; AJvYcCVMRchDhDmkePn00V3O9USVGDJHBis/JCe4NncaTi8vQfJAd1p69XMgpGFmw5b961XuY9/7KAP7y97ZtCSiD2I0GQluHv+PFoiAkpeX6KcJpwFMVoJ0fhWpyx0bh1Q98XpJqQMHjGVl+KMKZZ5fPcbqVH4vj8vi9rYtWrVGfl0Z8ZHDl5VpnqOcq5Xx
X-Gm-Message-State: AOJu0Yy6LvgpKAjep4fEGNFxNh25Md6wWfv3tceuHiMPUvkH7SoiQ00V
	whlNFQaHzLoaAGjBvbptS1Pn87etyfL6CZnSSXI3vtYchjxkfkOz
X-Google-Smtp-Source: AGHT+IGyYm8REzQMteDxukf92aWZeLkKfujBq+Mrydghp3vE1mMv5rcx7DHM0ZE+eHHIzMw7eFWBmw==
X-Received: by 2002:a17:903:1d2:b0:202:3107:e769 with SMTP id d9443c01a7336-2023107e9f7mr33840835ad.22.1724043510499;
        Sun, 18 Aug 2024 21:58:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 04/14] Input: samsung-keypad - use struct_size() helper
Date: Sun, 18 Aug 2024 21:58:01 -0700
Message-ID: <20240819045813.2154642-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When allocating memory for the keypad use struct_size() helper to be
protected from overflows.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 2be3bfa87ce1..7adcd2657bca 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -318,7 +318,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct input_dev *input_dev;
 	unsigned int row_shift;
-	unsigned int keymap_size;
 	int error;
 
 	pdata = dev_get_platdata(&pdev->dev);
@@ -345,9 +344,10 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		pdata->cfg_gpio(pdata->rows, pdata->cols);
 
 	row_shift = get_count_order(pdata->cols);
-	keymap_size = (pdata->rows << row_shift) * sizeof(keypad->keycodes[0]);
 
-	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad) + keymap_size,
+	keypad = devm_kzalloc(&pdev->dev,
+			      struct_size(keypad, keycodes,
+					  pdata->rows << row_shift),
 			      GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
-- 
2.46.0.184.g6999bdac58-goog


