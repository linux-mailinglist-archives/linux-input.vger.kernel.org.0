Return-Path: <linux-input+bounces-5642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D899562D5
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FE3328236B
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B10F15699E;
	Mon, 19 Aug 2024 04:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FwtQ4yOM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC18E149C57;
	Mon, 19 Aug 2024 04:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043515; cv=none; b=K7M1ebYq1To9Rihy0z332j66anQR5peXXpMtAp7uJ7ibVoKuVGeiazU/ef4zXL5g8PwtPXNoei36HZG0AlOg2BtoeNeLvpSRi5lnHkCSuLb0oRcvCP7SUlfWmHGdWBnp7MPLi/sHHtE+lWvQqXOubTxN7RkXJXAOjKrCgRvuv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043515; c=relaxed/simple;
	bh=ZoPgjCMEACTo98nK7vvU3V+27SddMvzdpYlUHESHMZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uK0yNSiG8eF65eQJWGw8b4uvltR5NxSm6Lx8bGwiaw7m1X84giRKRnRVL9ICg6rAJC0EPggo36zSmq1r5KYnf8MkFQoNww4lBEDaehttRpouRpshr9KiHUO1W3xPNyBVQUgfVeLg2y/wkS2w8jWuvq8yzlylK6oohz1RMNM4eG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FwtQ4yOM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7a263f6439eso2495266a12.3;
        Sun, 18 Aug 2024 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043513; x=1724648313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygqoPfWAW6OFjzFeMVvvEaUInHc1K7ny5EjqPZNE9l4=;
        b=FwtQ4yOMrdW3AmDgx+d00+Srkzs/3Nvlsyo3Yym4OW6nUt9nG5HaG9BH71Rrcoogdx
         lqDhrae/GUWZqOsd2jMATAWcpTy+7Y8NwtaaAHgu3Fp+pA32BUiO2205AD3Y37GmeeBU
         Qexlh1t1G6fMNUeQM7mwoAHnsyepJeLqf48xMNIEJcfNB15/0kXxx1DkhPj2RYbbV/Ui
         EMz3WBjwMzgjlJWjj7Pp0ad9l7GwBmsK+BkbQqmocBCFRvZcdPDz7KarBba2LGaotBgG
         K4WKxQqEB/IbA8L1o+Ih6ATSwG2YxenYjIb4eZX7PdwGaaBEZU5N3N5wk+k5REnZnv9J
         ZQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043513; x=1724648313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygqoPfWAW6OFjzFeMVvvEaUInHc1K7ny5EjqPZNE9l4=;
        b=QLr6Vbam34f7jHnr87ABvSZjpZI9/2mW8Cx+S+5Zr7tKjHHQCc6eABVasZaWnOP8hQ
         GCr+MGtEDmKROJH2366VfsH8fKzi8bAFZfW43VzzwGTzTebWnUhZEeQjmCmiQ7CCwhI2
         A8/RI8UCqb1rdpJGAWepBZamsZEBVbZajw3e+6umaoSasaCB64uUJ+bqbQ2atzjSJGX+
         rYatV2geHFT4qrZwJU45SaXvdE50uvhXSBefbxJd1E3tz78jquKDUZxfbiBEaFzGy+bt
         npvbfFBFjsP7Y5HO6psh1jkrLdm+MqBh6XcScxiUDCE4JAKren32ldw3C63yfXr0m7CL
         V8xA==
X-Forwarded-Encrypted: i=1; AJvYcCV53LQ671cBhWHGhcgwJbCbpgRA9EeRaAQ1zdSGpw84XVw0SgCFTxjZlkx1W9F8xctDdLOSx+pbdz5OpDGF6oitGoeRsfdpjVkECRIAPA0xws3mBCn4IPfwIMHii3AHncsWzkk0Tz5NWz/BFwCM2Gr2oOGIHb8JRb1RIOlg5iZXROTiUCuoaeKr8yTL
X-Gm-Message-State: AOJu0Yw2vaF27BEMmA1gUSABHo5mLVmJyuNARvZyrIW2ybj0uZI2VeDm
	kFyL7399EZJZWi7/zRlwctNODTX+oNznikVwc8JNabFUICKnIPtcx9y70w==
X-Google-Smtp-Source: AGHT+IFeaM8qHan63qZff53j+wzJZr72I4+OcPJOuBS6lMPEx82cmFqJMPlxZb5d4552hWK/VzOVjw==
X-Received: by 2002:a05:6a20:bf24:b0:1ca:6b6e:9aaa with SMTP id adf61e73a8af0-1ca6b6e9b33mr5884996637.2.1724043512829;
        Sun, 18 Aug 2024 21:58:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:32 -0700 (PDT)
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
Subject: [PATCH 06/14] Input: samsung-keypad - use guard notation to acquire mutex
Date: Sun, 18 Aug 2024 21:58:03 -0700
Message-ID: <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
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

Guard notation is more compact and ensures that the mutex will be
released when control leaves the function.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 924327de4d8f..71f5b85b02bd 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -519,15 +519,13 @@ static int samsung_keypad_suspend(struct device *dev)
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev))
 		samsung_keypad_stop(keypad);
 
 	samsung_keypad_toggle_wakeup(keypad, true);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
@@ -537,15 +535,13 @@ static int samsung_keypad_resume(struct device *dev)
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	samsung_keypad_toggle_wakeup(keypad, false);
 
 	if (input_device_enabled(input_dev))
 		samsung_keypad_start(keypad);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.184.g6999bdac58-goog


