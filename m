Return-Path: <linux-input+bounces-14279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C7B32EB6
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 11:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A415E1B6052E
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 09:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710472652B2;
	Sun, 24 Aug 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBNY0Gb+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4628253B67;
	Sun, 24 Aug 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756027196; cv=none; b=mQemJTcrXwjGDB9bo8VJg58yKLB/0vJPmOIMl81vrnawiU+ZDhjxFbfADapWC4tcTzfbEUBNPb40JhX5GPM5m1pqZZr09yPWylBZGoHeSaZ+wLRVLFeXe8c4ekB8fn1o1t5OjxddXn8aL+epVMGBMTjmRMr0Zpa66KoH/r8tWQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756027196; c=relaxed/simple;
	bh=edZR1btW6A4eDg3x1fEnZEnlele9TQiBEwxkzxjCbec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqRkrPmZW91RrHHlL/6ekzezSEfEHCRjofsxdQMF0j7njCggRotlf4jc2CA2Da+9BH+mtV/diTG6WY/dx64KSP9sRkPwY+d6c4yUb3oKxWyqr6G3bB2uIzBn6Ki90+G17zZg8E7qNsp+YsBngfgChulEO7sk7BbjvnaKuxbafGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBNY0Gb+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7ae31caso630322266b.3;
        Sun, 24 Aug 2025 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756027193; x=1756631993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86M3pmzwJRLDCFOCVFnJvUsA5KO70ZclE0/xWDdlZuk=;
        b=QBNY0Gb+DSuf8AtQLrR0vrvYtBWGGLU4HTDpLolywNrYzu784m+sHh9sNBomFgrkRO
         L2mOLOMovXLW5PpGrl1Wb5svaZMvQDqbXDsgx2Bac1OEysqZ3AcDh9BLaXSSLb1cVznA
         yNieXFuhRuFsTXaSR9N5twq1KAbayd15Jval/47x3FA8YF48poc5hrkQ5XR9dT8xdSlD
         gFhHHK3HsSQR/sXURSEBvhHUdL6mMySdfLHfNvI76wrNDN88yQb6envZvSGH7ci8p+6z
         mVAOZpiYQd6FwB1rMzG1IpDBBE4/dOSRQHnJ0lo0XZhsPDwvkqgjrJ50ThI/ZKrzb0v1
         xETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756027193; x=1756631993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86M3pmzwJRLDCFOCVFnJvUsA5KO70ZclE0/xWDdlZuk=;
        b=TXmL/FZlGRbxLS69GnCLQlk4mut4nJYmWEowZvT3G8Tvqo2dlB0Dk+NAPSX/7ErJTo
         1ObMfSNKcxBoNspsrn+GVLgJQju+CyZxYPOdkFDQkAIsveVmI9ZHYYXkSp4h2VBHNqPF
         buHISZkYy219gK9tzqek5S2FNCRiA1VdLHO6/eJ2g8ir1rUDTgNYOtDIzjWc6fL1JnT1
         /pAr57q8Ya1MYbFyBBnmArjGdFH+tzuhhX9kYUCnmkRlsaSQBwXpNYcuSbXW++OCnIKd
         QYGz1z608TzuVWzCDmRf5QePcDGpnyqdFmKDEc8sFiSji5j6TXeW8JoPhFEKr3kIDYO3
         if/A==
X-Forwarded-Encrypted: i=1; AJvYcCWDcNBqj3PtvoO6Rwaotb1pnGMniXJ9uRIh+UL+NXhntcDOv4qmRqkAyNaTM69DTgTnoy6qRbAuBwkGlyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/yOuDHv4iM0/SrDV8wD6iFnHf9rYmKFD55Oq6bWcCTjohLPR
	m/3z94/Jev3lh0ALAcdl3+q8zpoGSU47eav6cqDM99PWVFaXtt9ThgLr
X-Gm-Gg: ASbGncsWX6gwtmJKmahQmhP7cYiUc+xDVJWLIPK9f9JuTQpgHKUgv4qn/S4m6wK3WBA
	BG3Z9PAJIANYb2uzL5IcBgxjKPYxfKav85NXBaqyhq9LU0rZ3dqPRKuUtL0nnqkZCViaEDp4gOQ
	SVhAnjQIp1mBi+QwjBdsrDa/k8mi1c3iIXDAbyAdHYUv47gWHvpx8MyRCkmwwz8azR2wiXRhyFs
	QLblfqVyE2i/iiAPtKUbYrG+F4Mo/NJNdpf+GmpaPd5SFVsRJgYolYhImHoHy+/PoAxXhJQvCgC
	r+ANT+FvUEoyBgXhMY44hTEPqCsbbMk2Xl6GymqkWRp1zLuP1CVpA+i19aXmTsEZoqOLxDcNihf
	oiSfrbRCwrRhLXg==
X-Google-Smtp-Source: AGHT+IFM3JHt0NvZu8yGNNoz0qrFo/IJsDqafbZdlO/h7MY8JvCvHdg7gqOvmuJKmYAq6y2NIpPpJw==
X-Received: by 2002:a17:906:a1c2:b0:afe:5765:2011 with SMTP id a640c23a62f3a-afe57660199mr260109366b.53.1756027192825;
        Sun, 24 Aug 2025 02:19:52 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c30cf22d5sm2970156a12.0.2025.08.24.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 02:19:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2 RESEND] input: touchcreen: tsc2007: make interrupt optional
Date: Sun, 24 Aug 2025 12:19:27 +0300
Message-ID: <20250824091927.105121-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250824091927.105121-1-clamor95@gmail.com>
References: <20250824091927.105121-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case tsc2007 is used as an ADC sensor there will be no interrupt
provided at all, so set up an interrupt only if one is present.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/input/touchscreen/tsc2007_core.c | 28 ++++++++++++++----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2007_core.c b/drivers/input/touchscreen/tsc2007_core.c
index 17c82baf87df..4b169200e689 100644
--- a/drivers/input/touchscreen/tsc2007_core.c
+++ b/drivers/input/touchscreen/tsc2007_core.c
@@ -178,7 +178,8 @@ static void tsc2007_stop(struct tsc2007 *ts)
 	mb();
 	wake_up(&ts->wait);
 
-	disable_irq(ts->irq);
+	if (ts->irq)
+		disable_irq(ts->irq);
 }
 
 static int tsc2007_open(struct input_dev *input_dev)
@@ -189,7 +190,8 @@ static int tsc2007_open(struct input_dev *input_dev)
 	ts->stopped = false;
 	mb();
 
-	enable_irq(ts->irq);
+	if (ts->irq)
+		enable_irq(ts->irq);
 
 	/* Prepare for touch readings - power down ADC and enable PENIRQ */
 	err = tsc2007_xfer(ts, PWRDOWN);
@@ -362,17 +364,19 @@ static int tsc2007_probe(struct i2c_client *client)
 			pdata->init_platform_hw();
 	}
 
-	err = devm_request_threaded_irq(&client->dev, ts->irq,
-					NULL, tsc2007_soft_irq,
-					IRQF_ONESHOT,
-					client->dev.driver->name, ts);
-	if (err) {
-		dev_err(&client->dev, "Failed to request irq %d: %d\n",
-			ts->irq, err);
-		return err;
-	}
+	if (ts->irq) {
+		err = devm_request_threaded_irq(&client->dev, ts->irq,
+						NULL, tsc2007_soft_irq,
+						IRQF_ONESHOT,
+						client->dev.driver->name, ts);
+		if (err) {
+			dev_err(&client->dev, "Failed to request irq %d: %d\n",
+				ts->irq, err);
+			return err;
+		}
 
-	tsc2007_stop(ts);
+		tsc2007_stop(ts);
+	}
 
 	/* power down the chip (TSC2007_SETUP does not ACK on I2C) */
 	err = tsc2007_xfer(ts, PWRDOWN);
-- 
2.43.0


