Return-Path: <linux-input+bounces-10726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58302A5D601
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 07:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ABC6189ABFC
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 06:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF001E5B72;
	Wed, 12 Mar 2025 06:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kdZzXQBj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF6E1E47AD;
	Wed, 12 Mar 2025 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741760582; cv=none; b=N9YVOpZeBxPYcydKD8p+UTn0iXl33BnORWqhePJJupqTzJIBG2Qpm0zygiAuLAg2MD+GqdO2K6Lbn8Q9FGIlp+/zR9Nvgg7ZCaYjaELr5AjS7q8eU19Il/lWzrF1a08AKqBAffsgKR239voFFnXNE4ptVWjGsMH3Gy4iOXgkElw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741760582; c=relaxed/simple;
	bh=edZR1btW6A4eDg3x1fEnZEnlele9TQiBEwxkzxjCbec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ansQE+AwKyNNM0m5c5ru9hpuhbdv9WJ4LeejIE5vBmx4lSe1/BzzR/yraoxl5C2DJPAguiJ1PApqgB0ip+4AOnHoswAT9rSCznKDYRcj/FrUctU/XaxK+zdFFJECHqOBrmIYcoI/9A9hfJ3CHSUE/IXe3FKuU4Dxw+aaXH7FBVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kdZzXQBj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54954fa61c8so6633815e87.1;
        Tue, 11 Mar 2025 23:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741760578; x=1742365378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86M3pmzwJRLDCFOCVFnJvUsA5KO70ZclE0/xWDdlZuk=;
        b=kdZzXQBjiN2rqzgYDgSO8sFlvSbzHBwwr6nUa7+iVjDVKMvdebYyNoBDFvS5mElR7E
         X9krFJKd2mMkupDkJKIiyMKmKs69l0V26VJPEtU7kBjfwftI+kP8Bf6QGReOHDbJZb1+
         e9yUtpo8D7+j2PYvwgRU8eN7rcNy790eARRCuM37Xy3cVGB1yu7txlfv12g4ClDdqQSu
         /pXivQXAS+L/ttJDuDxbdnujTVBYqiwiu2nqZFbzWFSA/jHa2Iv3LNcda+4LV6sZlqV6
         AjPc0NX05qQiihjSgHt/ZT9A4yX19g/1lgDDmMYdrD6L6l+DJjIlmsCoBm9olNVFZptG
         KRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741760578; x=1742365378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86M3pmzwJRLDCFOCVFnJvUsA5KO70ZclE0/xWDdlZuk=;
        b=umfyiXEMyAFWRSW8ki2igq1gL7d8BkLiKzgiGBkyyDzxyseViIeltijCH4uTGWSJkI
         ShNuQpIB0A0FB9YXKTiek3YVlTP+yHrZGN8CJLXHNchcPkVbRfXTwB37QxneWHv19IhC
         1n3I5lYGs1woPPRZRK4EW0A7patNxuOoHv5m4rJPqekdtTjXiUNC1rn2dDY0e/s5tmIs
         DRTurBJhnFqGBmXXHopHqu8hywXLz7Uj0mhlANmT+dJT++edo+yvDUDDNhf9xM4DTmFA
         n50ZE6uNzPWv6TzrHcpqXf5hOeVfo13I8o4G96qqKQ7wGDREQ3R/uESmiEWtUGaHSUHw
         MEhA==
X-Forwarded-Encrypted: i=1; AJvYcCVJIinoVWmh0rJJu9Wk1vrayX9rsAtBhyCVjUSduWlaPvU9P1fzVEg/yJbiOw90kjSeVYqhEZUbxFPGT94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwseODQy1OyAR4BBatfnk3+LiG1gcv0c48USfkkdNvCi8QBYao2
	mYOBr7OWkNt0/XwM3PDbZbipbGdqL4E2GbALue2+9cuIus/A5OBB
X-Gm-Gg: ASbGncvJ1r/Bc9UUPrGjNaJfz+MSI0GwX6cC4zGgUNtOAhShtzQAYwIhpTPnxpqXsvj
	IzwGUlQ3PEYGvxKlcYlX800HA9kuJTVrCehZ6TCS60vGLaqBb2ERmW1DT8GNkTiPqXL+islpb1e
	uFlL90aP1aZfTK/oRPzq+HXUsKw71+B7US8TjM1tWmmU8J7US3R7arMDEVr7yfdLXHF+H7KwIlG
	DpATs33S3aYWa+YcgagHDQ/gaY8axjsaHr+zmSDyJfqucW751QbYEZNYLHiWIxCacV0r/yFiqTQ
	eoQqf13uw+NjmGO/Y2Acnu/jq+BWS3ejx4QW
X-Google-Smtp-Source: AGHT+IE6V2g/DJ0hQHnNMGOLJgOvVsmXFY4Sm5qN3r0ygthXQDTjSMImCZSH/UBaFvuQejR4+RD22Q==
X-Received: by 2002:a05:6512:282b:b0:549:8c86:9bf6 with SMTP id 2adb3069b0e04-54990ea92femr7507255e87.39.1741760578386;
        Tue, 11 Mar 2025 23:22:58 -0700 (PDT)
Received: from xeon.. ([188.163.112.73])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4623asm1991728e87.49.2025.03.11.23.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 23:22:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] input: touchcreen: tsc2007: make interrupt optional
Date: Wed, 12 Mar 2025 08:22:28 +0200
Message-ID: <20250312062228.11195-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250312062228.11195-1-clamor95@gmail.com>
References: <20250312062228.11195-1-clamor95@gmail.com>
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


