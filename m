Return-Path: <linux-input+bounces-5816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E795DC09
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EAB41F227B4
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C6315C140;
	Sat, 24 Aug 2024 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CapdDkz4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6456B155747;
	Sat, 24 Aug 2024 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478665; cv=none; b=Afs8eeK2c+u0oBHL9w46GuyLAPYHNIbVHEgcFr4ZWI+xXy16JNyhmgGRAgLA0Ps9Ue2xb0y1pxmxDN9wFsRniNhniKdTf/wsDSYt28MZl6xV3l+tHKi1SbbOoQiX0xrV2bNrpS1coyxi6EUtDZDOiURXZC8MdvSas/jp9PE3490=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478665; c=relaxed/simple;
	bh=eTmMw6sy5a3FwLOkXsn0i8esUShU9HaG4PdhLj5Aigo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+iRWos92j2lyeNRlgCKPaNOFzn7n2S2wnQdx1+suZPx8cyLjmCSCg0RfzUIA0LHx60tCfPNdLqBrulZGhaqeMGaK5KbOsue0ei3Dd2wIDRwyNQwFxB3VFaAltqRuPhJ/oD3uj2FOuIzxq4xc4GIHXpcffmw8wydOwaMKIiPK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CapdDkz4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2021537a8e6so23741545ad.2;
        Fri, 23 Aug 2024 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478664; x=1725083464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0DoNrVX1zw5AZFrBvhUTXomIhhIXtmiB4re9ahxacuw=;
        b=CapdDkz4+RSeGeMaKEIOb03c4pYHuCRvVjYPer9rHy8oLV6duOsU8T0OozIYSY2ydh
         n3I7PP2tupk8Ljytt5PNW4hEb5TkbU6+uJZh+eArJANFN/om1hyV2Gg8Y1iyRlUpnCV1
         31QPROq7ZcZnrhg0r5W/EDXFjhw9mapLNukJznvslEhcYE9uCs/KwtFMuQWwvaHoSUTA
         +R2i1r6g+j3oLMpVyfoIX7Ocf/z7ZzbUeYHdB4PTkEKeAfVX5GlR0c786x7U7F5Vpw3N
         BrSP+lnW7892d5bDSDF5q5O83HHhRyiPzevO5f1TAJO3APSP7BY0x8efS8XNy/OWLgVA
         qPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478664; x=1725083464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0DoNrVX1zw5AZFrBvhUTXomIhhIXtmiB4re9ahxacuw=;
        b=N98/a9VDC1TtNvWt6qfRdkABDWoZ+inSpvCDt+BZPFKreQNUy/cijufr46vsyPyLcu
         knFKRhASMsUqjaszD7LOZaUBj3Z7HQseyU1dyLRPQAVVNGAyhTfqs/tDR6lxMTx2BQdU
         Z5KmpY6AyNr3qxJZpen6f3EDOy4fC6N03lBbJiwWxQVAXuvSSEqDiHDGCGWRuIsey/rA
         UTXR5kd7y3zC+WWde6YcsV/6z3WkdRanv/60bKzaaYd8ooYhF0df7a7xyejgbqYD0q2T
         zEcWxux2irn0p0NoN0nF/7c8swSIb5FaoQ+A9hI0+ug2LdAlAGfrae3FVSSGU+J0aIpc
         1bcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU68UUNNr6ihhEqsn37ZhmG7TNb2a7M/rzxHYFsky8XUkEqzoAcw9SPiaHRsnSCVHOUgSHBB1VJSTqwIQ==@vger.kernel.org, AJvYcCW9a3vKgGYhLpTA6Bjy/Vu6H5FUnqqk6ISAooJyUWoHe3iJCx1hn1GSPb31oZ5shrSeJlNwrCjPP20bjQdD@vger.kernel.org
X-Gm-Message-State: AOJu0YygwF5/Wba+RrnvERiulwbysIZF9dWsPQBDAWYbt0ELoA04Zlcp
	UZurdMOh6K2AFnfJ1FDX4g3UFfxMH65Q500ADdWaXfnpUo3c5e2f
X-Google-Smtp-Source: AGHT+IGFL3X8GJP4kWNn6gyGFuylxySYdAuiNwhJZ8hD2/YigZDRmmFNebN96CyuXf6sjxnNFGHIiw==
X-Received: by 2002:a17:903:2292:b0:1fb:9b91:d7c9 with SMTP id d9443c01a7336-2039e44f6d1mr52227285ad.4.1724478663380;
        Fri, 23 Aug 2024 22:51:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] Input: zforce_ts - use guard notation when acquiring mutexes
Date: Fri, 23 Aug 2024 22:50:32 -0700
Message-ID: <20240824055047.1706392-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guard notation allows for simpler code and ensures that mutexes are
automatically released in all code paths.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 45 ++++++++++++++-------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 004ef728fb90..0dea389594bd 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -578,17 +578,13 @@ static void zforce_input_close(struct input_dev *dev)
 	return;
 }
 
-static int zforce_suspend(struct device *dev)
+static int __zforce_suspend(struct zforce_ts *ts)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct zforce_ts *ts = i2c_get_clientdata(client);
+	struct i2c_client *client = ts->client;
 	struct input_dev *input = ts->input;
-	int ret = 0;
-
-	mutex_lock(&input->mutex);
+	int ret;
 
-	WRITE_ONCE(ts->suspending, true);
-	smp_mb();
+	guard(mutex)(&input->mutex);
 
 	/*
 	 * When configured as a wakeup source device should always wake
@@ -601,7 +597,7 @@ static int zforce_suspend(struct device *dev)
 		if (!input_device_enabled(input)) {
 			ret = zforce_start(ts);
 			if (ret)
-				goto unlock;
+				return ret;
 		}
 
 		enable_irq_wake(client->irq);
@@ -611,18 +607,28 @@ static int zforce_suspend(struct device *dev)
 
 		ret = zforce_stop(ts);
 		if (ret)
-			goto unlock;
+			return ret;
 
 		disable_irq(client->irq);
 	}
 
 	ts->suspended = true;
+	return 0;
+}
 
-unlock:
+static int zforce_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct zforce_ts *ts = i2c_get_clientdata(client);
+	int ret;
+
+	WRITE_ONCE(ts->suspending, true);
 	smp_mb();
-	WRITE_ONCE(ts->suspending, false);
 
-	mutex_unlock(&input->mutex);
+	ret = __zforce_suspend(ts);
+
+	smp_mb();
+	WRITE_ONCE(ts->suspending, false);
 
 	return ret;
 }
@@ -632,9 +638,9 @@ static int zforce_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct zforce_ts *ts = i2c_get_clientdata(client);
 	struct input_dev *input = ts->input;
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	ts->suspended = false;
 
@@ -647,7 +653,7 @@ static int zforce_resume(struct device *dev)
 		if (!input_device_enabled(input)) {
 			ret = zforce_stop(ts);
 			if (ret)
-				goto unlock;
+				return ret;
 		}
 	} else if (input_device_enabled(input)) {
 		dev_dbg(&client->dev, "resume without being a wakeup source\n");
@@ -656,13 +662,10 @@ static int zforce_resume(struct device *dev)
 
 		ret = zforce_start(ts);
 		if (ret < 0)
-			goto unlock;
+			return ret;
 	}
 
-unlock:
-	mutex_unlock(&input->mutex);
-
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(zforce_pm_ops, zforce_suspend, zforce_resume);
-- 
2.46.0.295.g3b9ea8a38a-goog


