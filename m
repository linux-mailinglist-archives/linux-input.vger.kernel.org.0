Return-Path: <linux-input+bounces-4283-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF49018D2
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4EA62812EF
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3920457C8E;
	Sun,  9 Jun 2024 23:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEG8Q7Si"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8355886;
	Sun,  9 Jun 2024 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717977103; cv=none; b=pbisXA5CPg8CJnlYJACZ0s5dM4c3o5iUdEw4EvxvtpVZEk6ekJXCE+2D59VQVBAZY2fRjyVSV7zRAwrPXop1cMamnfNgaQ98sut3WrHWt9Ep1Qdyw/os852N16YhEma7TYBc2WfkhOWb82kFBcPrFC8osdjdpPT72gxjqnQrRTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717977103; c=relaxed/simple;
	bh=0lppzMbonYaTycDosjLPC5k12ImJsX4Aq5tla2baO1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MpLkymnqoXUl9NU3TvihOLTzKevWJgVKeyoiPKDw5mT4U2D4WunH1cYBr9v5ql9DQQXwNJEYjDifcF+xhl1MZDMPu//diZ9Ubkst+06q4Qip2Rg3mlli34UJKLz0+/Du5GMgF9gWyYkjrCQNxrt7xZplOidNVDIpu1w7idpCXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEG8Q7Si; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so2031425a12.2;
        Sun, 09 Jun 2024 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717977101; x=1718581901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIG6qm6SXhSjHzB7ApreedS7McRlGp65PmXhg91i/aE=;
        b=UEG8Q7SinucMaaHXw7v1jZnD3IDLtGgYqug+vCwb3vqchrvbg0hIm+pDJWLgCgRyRe
         b/G/6Y+zvRE3B+/9Bgatcx1u68OIaTDZmihz9iHy52AHPMhIQdmwrTLJoSn8R+0s4A4S
         wxlBrtENbUs5aYHdvkS2uVBv+P7Oen+EQkY5I9h+FzObb9L+oDP+OGmLjY9NOQDKdJ33
         p9CkQhzABdSxjhdQHb1aknPsWrDFy41Pq5ruy5iAA5Z/QxLeKtwYNrVB7+UUASPTtXKa
         eDmEOaxa3il7NSYMEgW9D6FyJMcPUhFL0/qmuHuTkvyiIG6UhF4J0xCxR+DuaUnDibYf
         bAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717977101; x=1718581901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIG6qm6SXhSjHzB7ApreedS7McRlGp65PmXhg91i/aE=;
        b=FD8GqzWTzinIIOxEfw7Xq9RENoxAhXSb+Yu+Snnw1UeUxc0uUWDkizbsWYeoroSf3i
         8w6uw77e47l0Mmz6gPUBDF8gkWRhQY4D+B2H9e/5eoqHD3EnGm9iZ8iPCypjnWKMddPJ
         tXFv+3IvTKgURqYd8YHkW1Xa6l6WmPcqIE+73B5n3tyZjFl4EaI5SxYqx1az3UwFB/7C
         guq2to/Mdwf5xNQ1xF4pss5KAmte4vdpzbP/Ri0JMR43vPIAcWJmvU+fvVsAdeU6aWKn
         QgFbarCefKuqXs33QGUbAQoMojPUzeyGwE2otEGAtFnY5+XWZiLwZGHj43QKpPWs3UtA
         JB0w==
X-Gm-Message-State: AOJu0Yx0POZQEqSLVMS05cp/ZlghQUDq8iTishawUgQYceaEvtR6Gpw7
	A2JFpBFB3SvV5wydba9L91DBfF8YEhue9SkQ5s12dwJsmRyqM0eF4ypoxg==
X-Google-Smtp-Source: AGHT+IHyF10GmfEKuNSGPDcTWv3EHNkxNkdiTaMa8rFbknktjJmNWE8N7Q0YQW1HlnSdoiqY0vUtqg==
X-Received: by 2002:a05:6a20:734c:b0:1b6:1ed4:e916 with SMTP id adf61e73a8af0-1b61ed4eb55mr3092482637.35.1717977100596;
        Sun, 09 Jun 2024 16:51:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042f37f33asm2090356b3a.3.2024.06.09.16.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:51:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: rohm_bu21023 - switch to using cleanup functions
Date: Sun,  9 Jun 2024 16:51:32 -0700
Message-ID: <20240609235134.614592-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609235134.614592-1-dmitry.torokhov@gmail.com>
References: <20240609235134.614592-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using __free() and guard() primitives to simplify the code
and error handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/rohm_bu21023.c | 40 +++++++++++-------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index 7be2549fde85..0e5cc9fbad17 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -643,12 +643,12 @@ static int rohm_ts_load_firmware(struct i2c_client *client,
 				 const char *firmware_name)
 {
 	struct device *dev = &client->dev;
-	const struct firmware *fw;
 	s32 status;
 	unsigned int offset, len, xfer_len;
 	unsigned int retry = 0;
 	int error, error2;
 
+	const struct firmware *fw __free(firmware) = NULL;
 	error = request_firmware(&fw, firmware_name, dev);
 	if (error) {
 		dev_err(dev, "unable to retrieve firmware %s: %d\n",
@@ -722,8 +722,6 @@ static int rohm_ts_load_firmware(struct i2c_client *client,
 out:
 	error2 = i2c_smbus_write_byte_data(client, INT_MASK, INT_ALL);
 
-	release_firmware(fw);
-
 	return error ? error : error2;
 }
 
@@ -732,22 +730,22 @@ static int rohm_ts_update_setting(struct rohm_ts_data *ts,
 {
 	int error;
 
-	error = mutex_lock_interruptible(&ts->input->mutex);
-	if (error)
-		return error;
-
-	if (on)
-		ts->setup2 |= setting_bit;
-	else
-		ts->setup2 &= ~setting_bit;
+	scoped_cond_guard(mutex_intr, return -EINTR, &ts->input->mutex) {
+		if (on)
+			ts->setup2 |= setting_bit;
+		else
+			ts->setup2 &= ~setting_bit;
 
-	if (ts->initialized)
-		error = i2c_smbus_write_byte_data(ts->client, COMMON_SETUP2,
-						  ts->setup2);
-
-	mutex_unlock(&ts->input->mutex);
+		if (ts->initialized) {
+			error = i2c_smbus_write_byte_data(ts->client,
+							  COMMON_SETUP2,
+							  ts->setup2);
+			if (error)
+				return error;
+		}
+	}
 
-	return error;
+	return 0;
 }
 
 static ssize_t swap_xy_show(struct device *dev, struct device_attribute *attr,
@@ -842,7 +840,7 @@ static int rohm_ts_device_init(struct i2c_client *client, u8 setup2)
 	struct device *dev = &client->dev;
 	int error;
 
-	disable_irq(client->irq);
+	guard(disable_irq)(&client->irq);
 
 	/*
 	 * Wait 200usec for reset
@@ -1017,10 +1015,10 @@ static int rohm_ts_device_init(struct i2c_client *client, u8 setup2)
 	/* controller CPU power on */
 	error = i2c_smbus_write_byte_data(client, SYSTEM,
 					  ANALOG_POWER_ON | CPU_POWER_ON);
+	if (error)
+		return error;
 
-	enable_irq(client->irq);
-
-	return error;
+	return 0;
 }
 
 static int rohm_ts_power_off(struct i2c_client *client)
-- 
2.45.2.505.gda0bf45e8d-goog


