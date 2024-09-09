Return-Path: <linux-input+bounces-6375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481A9723C9
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 22:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 291411C21C57
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 20:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA2F18A922;
	Mon,  9 Sep 2024 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwv21oB9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06057175D20;
	Mon,  9 Sep 2024 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725914266; cv=none; b=AhsVFoIs0IS7b0lHZFyDaTLUOkm0Nllmt0K9gPV8dX4LcUFKQHqlI/QsW1SfOCtNHybdYoLNEpg9JKvsXSyW8mAlqfkD4qM4iEZYsMujQezFe8qLalSrk6unllTUEUOkbjPl4i6ETz84NYRpEUTezEgxEvD1l04hMSSEF5PvOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725914266; c=relaxed/simple;
	bh=FQwp55THaOFhoWri431V+DCooTQ8FjRChY6nZiZeZTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBP89tZlJqLEOkU3PUFWvlXSHWCPyZ0NIhJK5Hzb+iZfC3lTT9hh8nBn7m/T+YFCHh5GD8cDT3zYieJkAFxPgk2u8u0bzmIrIi8qBui2mTfhYIl+fN4B6dLrxSdfp1HLoIeJdMU0AE81z4MePfoXiYZ4dUIOrjapsvHy/hDRnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwv21oB9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-206e614953aso37812575ad.1;
        Mon, 09 Sep 2024 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725914264; x=1726519064; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2b3pN5NY3MIDf/Bhko9EttmVHICHvYF86oIt9ZDjsOE=;
        b=Rwv21oB9Y1rUuAkdpJ+q3EIqjAiCcoCRWprgt4646g20AV6znHUDL3EGtSzI8dymQC
         N89P45T2mUR0KkesrblcDqZscs0fSPsunhJnnWX8pRvKtIVNLTkkpVI/+DQ3ISsWTQ6u
         +01esj9nN5AmB0+qsAUy3pZ/uRqWjV72TFwSnPGWSIK6FD4/d1Yb8UFMSqxIIQCdWDeY
         pYT1k4F5hwBEFTXaYOQcVianuUSAQdfFeXp+uK2fn1GXpAH2DrWIZaJqXwFopk0psRn1
         s2gmLGMbGUd3VqIzdglmoZQkr4pN8mlE0n3VcelyuD/ZG7EtqIqBxak5Bj9NuOC7k12u
         chzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725914264; x=1726519064;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2b3pN5NY3MIDf/Bhko9EttmVHICHvYF86oIt9ZDjsOE=;
        b=WhCzl+/m+hkNYA7EwxmWWHOqs26tCozeGvLLCzqQNubokGP9NeJxKz74wQCqUk3+qt
         w59OUQ+AzhtYPZ4330JZnNjy1z0J7BvT+Y+4FCUleENNV75wCum4cVgjFMtro8ICfCn0
         JbMJs4t5gK/Geeq5G+VJM86ShPGHluQ7b3ya2w6a1SgjArcFi09+OmA9kT96QxI2ofvt
         qvrxNCfgtaUOwVYTumdTQUA+sX3nzOFMEXot7QZwl9p5cNiMd5SLWvNEo+jjFGQWuPh+
         Sk8dRTvPXsatzC7En4qHpUr7FKR16qb4DOL60Cafqc5CJpbupVRzcRJsNf/578078mTp
         /Q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVspeXQHFwHor1rM6U23uGFvQK/BjePoP1JAmfw0WdW0CJECEQ6o4akWj/qfJ7hDT/36Xpu9rF9MPihWzzz@vger.kernel.org, AJvYcCWoEebIT933O2qEEb2PDUMJ3Ue/m7REFVc10ALLbMWkpVsSOEVC5+xD5SevIG6DlwtwlRijdimziaW6pQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDQ4qxda/gfdHlo76EGxHrBHmkxSAlp6Ej3TnswIDXTciWhBov
	NocdMj9dewTujecNoIF/0ff0hjxabSWctJRMSk2b7u9LX6Wzw2AoHFi4Cw==
X-Google-Smtp-Source: AGHT+IEqhh4L/9hi+bp+FibU2F0yYTwo7DxYg7VJMKY6lCr2XtIZ6O+EazUPzg10ch5+v1VZVv5rsw==
X-Received: by 2002:a17:903:2b05:b0:207:232f:36dc with SMTP id d9443c01a7336-207232f3760mr92767885ad.50.1725914263979;
        Mon, 09 Sep 2024 13:37:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e257:6de2:7d45:59cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1f608sm37642345ad.222.2024.09.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 13:37:43 -0700 (PDT)
Date: Mon, 9 Sep 2024 13:37:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	". Benjamin Tissoires" <bentiss@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: ensure various commands do not interfere with
 each other
Message-ID: <Zt9clAu04BinzIcd@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

i2c-hid uses 2 shared buffers: command and "raw" input buffer for
sending requests to peripherals and read data from peripherals when
executing variety of commands. Such commands include reading of HID
registers, requesting particular power mode, getting and setting
reports and so on. Because all such requests use the same 2 buffers
they should not execute simultaneously.

Fix this by introducing "cmd_lock" mutex and acquire it whenever
we needs to access ihid->cmdbuf or idid->rawbuf.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 42 +++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 632eaf9e11a6..2f8a9d3f1e86 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -105,6 +105,7 @@ struct i2c_hid {
 
 	wait_queue_head_t	wait;		/* For waiting the interrupt */
 
+	struct mutex		cmd_lock;	/* protects cmdbuf and rawbuf */
 	struct mutex		reset_lock;
 
 	struct i2chid_ops	*ops;
@@ -220,6 +221,8 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 static int i2c_hid_read_register(struct i2c_hid *ihid, __le16 reg,
 				 void *buf, size_t len)
 {
+	guard(mutex)(&ihid->cmd_lock);
+
 	*(__le16 *)ihid->cmdbuf = reg;
 
 	return i2c_hid_xfer(ihid, ihid->cmdbuf, sizeof(__le16), buf, len);
@@ -252,6 +255,8 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	/* Command register goes first */
 	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
 	length += sizeof(__le16);
@@ -342,6 +347,8 @@ static int i2c_hid_set_or_send_report(struct i2c_hid *ihid,
 	if (!do_set && le16_to_cpu(ihid->hdesc.wMaxOutputLength) == 0)
 		return -ENOSYS;
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	if (do_set) {
 		/* Command register goes first */
 		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
@@ -384,6 +391,8 @@ static int i2c_hid_set_power_command(struct i2c_hid *ihid, int power_state)
 {
 	size_t length;
 
+	guard(mutex)(&ihid->cmd_lock);
+
 	/* SET_POWER uses command register */
 	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
 	length = sizeof(__le16);
@@ -440,25 +449,27 @@ static int i2c_hid_start_hwreset(struct i2c_hid *ihid)
 	if (ret)
 		return ret;
 
-	/* Prepare reset command. Command register goes first. */
-	*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
-	length += sizeof(__le16);
-	/* Next is RESET command itself */
-	length += i2c_hid_encode_command(ihid->cmdbuf + length,
-					 I2C_HID_OPCODE_RESET, 0, 0);
+	scoped_guard(mutex, &ihid->cmd_lock) {
+		/* Prepare reset command. Command register goes first. */
+		*(__le16 *)ihid->cmdbuf = ihid->hdesc.wCommandRegister;
+		length += sizeof(__le16);
+		/* Next is RESET command itself */
+		length += i2c_hid_encode_command(ihid->cmdbuf + length,
+						 I2C_HID_OPCODE_RESET, 0, 0);
 
-	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+		set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 
-	ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
-	if (ret) {
-		dev_err(&ihid->client->dev,
-			"failed to reset device: %d\n", ret);
-		goto err_clear_reset;
-	}
+		ret = i2c_hid_xfer(ihid, ihid->cmdbuf, length, NULL, 0);
+		if (ret) {
+			dev_err(&ihid->client->dev,
+				"failed to reset device: %d\n", ret);
+			break;
+		}
 
-	return 0;
+		return 0;
+	}
 
-err_clear_reset:
+	/* Clean up if sending reset command failed */
 	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
 	i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
 	return ret;
@@ -1200,6 +1211,7 @@ int i2c_hid_core_probe(struct i2c_client *client, struct i2chid_ops *ops,
 	ihid->is_panel_follower = drm_is_panel_follower(&client->dev);
 
 	init_waitqueue_head(&ihid->wait);
+	mutex_init(&ihid->cmd_lock);
 	mutex_init(&ihid->reset_lock);
 	INIT_WORK(&ihid->panel_follower_prepare_work, ihid_core_panel_prepare_work);
 
-- 
2.46.0.598.g6f2099f65c-goog


-- 
Dmitry

