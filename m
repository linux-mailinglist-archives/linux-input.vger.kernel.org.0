Return-Path: <linux-input+bounces-5644-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEB9562DF
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57880B21496
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED53D15853A;
	Mon, 19 Aug 2024 04:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApDZrw4l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE0D15748A;
	Mon, 19 Aug 2024 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043517; cv=none; b=Lx6Jt7fqyisTrp8YnlvQVAt18TOucrBzBTfnhIIUlqvltO9IgyU7FK0ytozOdmPB/RllJdTYC786MznCIFCcwKLdSvVMl8NPzr+ETb4xgyR6JvT5YOugNbf88HcPa+AG9bG4uTxOvnWYUogAeG9ZJ2YSdkuHWz+awSBOTw85lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043517; c=relaxed/simple;
	bh=BTiujj2l0WxfCgLrW19jjCl/GAAqW/LU68XtUdnHkGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JM1zS03aGSvRyhGdUxRRQ/hizgPJdUDhtDSJVtuNKZerGwH3iZQkydbykYFCIjBMy1yrN2LAp62jC5uBlFVVPbCBTu/mgZfgh/1pf/tziDR1vluPj2qAcrOcBb6Wt6hVR9hNXbV2GK+gmEU/lif+hbtcCjam8Wb9jtt6yXmLpQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApDZrw4l; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a18ba4143bso2383601a12.2;
        Sun, 18 Aug 2024 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043516; x=1724648316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN/1Xk9FI8/pPGNyqXKAqL6DAUxzZAXBVprXsawgfYo=;
        b=ApDZrw4lEVhFcqX37kue66/xRju+MrafTcZX7+OVMiMws3TZm2p1XPo0spueymnuAu
         YrYIY/KiKkKkG8MS7EoDrTZ+fCI+aV3CGVCG0K712c4XzlvosEqRz0q3um7cZI4Q867O
         VdQMLVvE4KKVFykuws8QKwL+WWnNkOsaACrHTmfWX2MWM5iVhKcMbc0kDS0lx2MQr2gw
         5LFhN3UQuGpMu4TCLjgiZNXGldJwSOQ3dOGqizCszh6o52r04LNiItmHXW+RoZFXyguy
         +6I/Zs7ofTuZ8ruqyQJXCgJqkHOO4MFBN4kPbe6IroXkAoiFj5n0B7Tod4r2zygG0dBZ
         SNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043516; x=1724648316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN/1Xk9FI8/pPGNyqXKAqL6DAUxzZAXBVprXsawgfYo=;
        b=K9Yl/tlWJeTYl/jwI3Logc4srW9KSrOiCzgjxBZTZ7vPHzaYp7GUJhF5QTq9BfEW5u
         ez7URrdE1GMlVWb2Ku/yg352hYn1Ia0K0oDuASRIP7Q18AiUVkEw7JzyiX2KuMHJD1M9
         QkhKQKqhrO02yHO1/oTsfx42OhTa2wOFwLgn8Mgm2U50z4UtVrqlUKY5h/p5kwiSLwca
         p8RqRaKYTQlSm17pCSZtXo/6Qzd7cEu03x2Hor9WMBdGq2xbivSc1/DjmnNfjkHu+J0q
         NGbL8yOH1vI+1gzOHQqXpuJmKcVoTyS6skpm2RI89pCWvay4GxEXGL9r/9bij3nFZz9M
         7ZZA==
X-Forwarded-Encrypted: i=1; AJvYcCUTB9bxOZ5iWkZGW/n08daFWymWJEqF0j8TqgLkPzxGAOqW7RyuZ1QQkethANJlx8X/OrXPX19+RxjR@vger.kernel.org, AJvYcCVil/ifmLSdTF8n3VzefP+JmAlyqSz1fgL5QBg9SlAfg0lbUW3FxXR3BMCi2Gu6sAYqyBtfkovJlSWIRZjQEEe4diw=@vger.kernel.org, AJvYcCWuLKQfllygAqyX/YNDtDnZGwdYqQqrggARlKJkqhix4JNUDQJFVLSsSmRF0lEfeLU9gUvu6jrTchkOxtlw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AcWgWuDvTxLxNmLvMACAkJdGCmke6x+Es69MeP/m+CMLWI5k
	mSJzuWvrHsIGfOQnr4dl8xSRBU1vZ5zFbpJi83gWbvF7Op5O/Q1N
X-Google-Smtp-Source: AGHT+IHR03pBCS1HkPAq1A4u2Bf9+fNk6P6rh0uFVCEmo/wkeYC6u4wMHRida67w/ccHn9mU0XZ+eQ==
X-Received: by 2002:a05:6a20:ce4a:b0:1c3:b2b3:442d with SMTP id adf61e73a8af0-1c90502616dmr10682336637.40.1724043515380;
        Sun, 18 Aug 2024 21:58:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:34 -0700 (PDT)
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
Subject: [PATCH 08/14] Input: samsung-keypad - use BIT() and GENMASK() where appropriate
Date: Sun, 18 Aug 2024 21:58:05 -0700
Message-ID: <20240819045813.2154642-9-dmitry.torokhov@gmail.com>
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

Instead of using (1 << <shift>) construct use BIT() helper. Convert (1
<< <shift>) - 1 to GENMASK().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index ccc1186e43b6..e262137b6838 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -7,6 +7,7 @@
  * Author: Donghwa Lee <dh09.lee@samsung.com>
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -29,11 +30,11 @@
 #define SAMSUNG_KEYIFFC				0x10
 
 /* SAMSUNG_KEYIFCON */
-#define SAMSUNG_KEYIFCON_INT_F_EN		(1 << 0)
-#define SAMSUNG_KEYIFCON_INT_R_EN		(1 << 1)
-#define SAMSUNG_KEYIFCON_DF_EN			(1 << 2)
-#define SAMSUNG_KEYIFCON_FC_EN			(1 << 3)
-#define SAMSUNG_KEYIFCON_WAKEUPEN		(1 << 4)
+#define SAMSUNG_KEYIFCON_INT_F_EN		BIT(0)
+#define SAMSUNG_KEYIFCON_INT_R_EN		BIT(1)
+#define SAMSUNG_KEYIFCON_DF_EN			BIT(2)
+#define SAMSUNG_KEYIFCON_FC_EN			BIT(3)
+#define SAMSUNG_KEYIFCON_WAKEUPEN		BIT(4)
 
 /* SAMSUNG_KEYIFSTSCLR */
 #define SAMSUNG_KEYIFSTSCLR_P_INT_MASK		(0xff << 0)
@@ -81,14 +82,14 @@ static void samsung_keypad_scan(struct samsung_keypad *keypad,
 	unsigned int val;
 
 	for (col = 0; col < keypad->cols; col++) {
-		val = SAMSUNG_KEYIFCOL_MASK & ~(1 << col);
+		val = SAMSUNG_KEYIFCOL_MASK & ~BIT(col);
 		val <<= keypad->chip->column_shift;
 
 		writel(val, keypad->base + SAMSUNG_KEYIFCOL);
 		mdelay(1);
 
 		val = readl(keypad->base + SAMSUNG_KEYIFROW);
-		row_state[col] = ~val & ((1 << keypad->rows) - 1);
+		row_state[col] = ~val & GENMASK(keypad->rows - 1, 0);
 	}
 
 	/* KEYIFCOL reg clear */
@@ -112,10 +113,10 @@ static bool samsung_keypad_report(struct samsung_keypad *keypad,
 			continue;
 
 		for (row = 0; row < keypad->rows; row++) {
-			if (!(changed & (1 << row)))
+			if (!(changed & BIT(row)))
 				continue;
 
-			pressed = row_state[col] & (1 << row);
+			pressed = row_state[col] & BIT(row);
 
 			dev_dbg(&keypad->input_dev->dev,
 				"key %s, row: %d, col: %d\n",
-- 
2.46.0.184.g6999bdac58-goog


