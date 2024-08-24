Return-Path: <linux-input+bounces-5814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28095DC06
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73788283F8C
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546DA15573A;
	Sat, 24 Aug 2024 05:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QR5yoyBS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF011547EE;
	Sat, 24 Aug 2024 05:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478664; cv=none; b=hZQoZZ0wnI4wQ0/3lCpC7RlrsM06nQPgf1b3uRlCYtnAub2keknjxALoWHG1PJzkULkJPwhuK9o3kSUFMxU2syPW2DvmNI+K0kZvXgIWlLi6ycDqTr02+QX/mJN8n5DTTfW3e5UCH0IOMZT51Ph5o3KafY56dJS40m+PJf+E+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478664; c=relaxed/simple;
	bh=DO2POWR+L4mpoJESl3OGhJJvqVw8fpyfFYUIvsIfyV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpWbniVRte1zd1ygXdFy2O1MgcfiFKmCCJ5D73CQeKRnBrbNfU4exesFyytyjK0SaQiJusovOpmWxjuzjV3JcQ6fEjCXCPHUwMLc1S1GaqfqHFkKoR6d/I531+vb2p7Rz82iiJbN8UgnAH5ZDfl72oKVxtzr3wa2uBqPZSjKgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QR5yoyBS; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-201d5af11a4so23871295ad.3;
        Fri, 23 Aug 2024 22:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478662; x=1725083462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehLi53HnV4EpA+uVYR2JtIJT0ACD//Baaeue9KBcNcI=;
        b=QR5yoyBS3bwXMJvovrQwPFfhSq/iTzlkPvazaoN7C9Y55Amadew31WA+bNFyLb7j1o
         hMxoXr6p1sNyWsYVSd1a/C7MF+rl+atk55zs58NoGS3oifqh59YOkFRmww1SYyJRKklb
         /YfvVvNC9qTP0Nwetx92IuaMV+uR6RHk1puhUsh7Bl9qejquC5MncSOkmOOZM+EvRcKG
         I01IfRPVt3fmR4erjDIAwkHE+68t1DgfQA9xdATisiE1Ow895q76nUOhfQPh5KEcCTgo
         +2n6tZqnL+QmzsqC3fdWkPFBHrEBjE8c2ycVfqiP7wYHlGaTKbzidxeAc/UlvUg4wJ/8
         NM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478662; x=1725083462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehLi53HnV4EpA+uVYR2JtIJT0ACD//Baaeue9KBcNcI=;
        b=mPQJNCEcMmVmf8ElZWh7ewQ8f6cBKGSaSZbKz3YYaPX1ipMYS2HdHO5gri2CREGJsS
         sN948XKoCjwDyP0+iMl05V8nH6eXx/lOlo3TBZvhKMUCfYyodHkx8lXtwrKmcNk2YCF3
         uwhYVawj8mkaG82HokBr9/lG6pZdja+sGCZVmQCnuodbxTlTD826nwumQCKsL/Sq1/YL
         Aco2noscHQCu8NGqg8Gy2Efj3jmHbWoObizqjKjfortp9toKvlPu8D03mC3M4rWyIOU9
         zRvfnIluM5VvkH3ouOcJVoAHOam0RmVpdYlS5KEB4nE6q40Dx4T2iAjj6HhM03vGoEfT
         8dLw==
X-Forwarded-Encrypted: i=1; AJvYcCVO8grpormtsCaK4k2Xr1QztwlIvNKT3OuZAYX/N01r0c34VoSP9//EsKm8jkWsTidCv1i91NHGDA30iw==@vger.kernel.org, AJvYcCXcxJwo0gjJt8qsRYTBsf1gB35d21NTjdtbcEYL5KPwoC7W/zxSk63LU3IfYtxzDyBYHKt5m3YiNJYcnSJu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw892FLjv/wukTd9eUV1zQrDIrXLdoP9gTCUsRybNFjvWowJmkd
	jSJjan1ltmQB2m9hjPlELi2bgBJvrQjGzyJVAkxnYgYPMJtzr/OD
X-Google-Smtp-Source: AGHT+IEgSszwWvTWjjBYNM43ijA8tNPk16mglLTjE9eznV7DUm/LrglTUm9Hikoo4gKdLsskpuQXbQ==
X-Received: by 2002:a17:902:e889:b0:202:1db8:d9aa with SMTP id d9443c01a7336-2039e4cefb4mr47257555ad.30.1724478661767;
        Fri, 23 Aug 2024 22:51:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] Input: zforce_ts - remove unneeded locking
Date: Fri, 23 Aug 2024 22:50:30 -0700
Message-ID: <20240824055047.1706392-7-dmitry.torokhov@gmail.com>
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

There is no need to have a lock around calls to i2c_master_send() and
i2c_master_recv() as they are not issued concurrently and they are not
sharing any buffers. Also there is no need for command_mutex as all
commands are issued sequentially.

Remove both.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 47 +++++----------------------
 1 file changed, 9 insertions(+), 38 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index a4956f1eebb2..afeafa589928 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -95,9 +95,7 @@ struct zforce_point {
  * @suspending		in the process of going to suspend (don't emit wakeup
  *			events for commands executed to suspend the device)
  * @suspended		device suspended
- * @access_mutex	serialize i2c-access, to keep multipart reads together
  * @command_done	completion to wait for the command result
- * @command_mutex	serialize commands sent to the ic
  * @command_waiting	the id of the command that is currently waiting
  *			for a result
  * @command_result	returned result of the command
@@ -123,10 +121,7 @@ struct zforce_ts {
 	u16			version_build;
 	u16			version_rev;
 
-	struct mutex		access_mutex;
-
 	struct completion	command_done;
-	struct mutex		command_mutex;
 	int			command_waiting;
 	int			command_result;
 };
@@ -143,9 +138,7 @@ static int zforce_command(struct zforce_ts *ts, u8 cmd)
 	buf[1] = 1; /* data size, command only */
 	buf[2] = cmd;
 
-	mutex_lock(&ts->access_mutex);
 	ret = i2c_master_send(client, &buf[0], ARRAY_SIZE(buf));
-	mutex_unlock(&ts->access_mutex);
 	if (ret < 0) {
 		dev_err(&client->dev, "i2c send data request error: %d\n", ret);
 		return ret;
@@ -169,37 +162,24 @@ static int zforce_send_wait(struct zforce_ts *ts, const char *buf, int len)
 	struct i2c_client *client = ts->client;
 	int ret;
 
-	ret = mutex_trylock(&ts->command_mutex);
-	if (!ret) {
-		dev_err(&client->dev, "already waiting for a command\n");
-		return -EBUSY;
-	}
-
 	dev_dbg(&client->dev, "sending %d bytes for command 0x%x\n",
 		buf[1], buf[2]);
 
 	ts->command_waiting = buf[2];
 
-	mutex_lock(&ts->access_mutex);
 	ret = i2c_master_send(client, buf, len);
-	mutex_unlock(&ts->access_mutex);
 	if (ret < 0) {
 		dev_err(&client->dev, "i2c send data request error: %d\n", ret);
-		goto unlock;
+		return ret;;
 	}
 
 	dev_dbg(&client->dev, "waiting for result for command 0x%x\n", buf[2]);
 
-	if (wait_for_completion_timeout(&ts->command_done, WAIT_TIMEOUT) == 0) {
-		ret = -ETIME;
-		goto unlock;
-	}
+	if (wait_for_completion_timeout(&ts->command_done, WAIT_TIMEOUT) == 0)
+		return -ETIME;
 
 	ret = ts->command_result;
-
-unlock:
-	mutex_unlock(&ts->command_mutex);
-	return ret;
+	return 0;
 }
 
 static int zforce_command_wait(struct zforce_ts *ts, u8 cmd)
@@ -412,41 +392,35 @@ static int zforce_read_packet(struct zforce_ts *ts, u8 *buf)
 	struct i2c_client *client = ts->client;
 	int ret;
 
-	mutex_lock(&ts->access_mutex);
-
 	/* read 2 byte message header */
 	ret = i2c_master_recv(client, buf, 2);
 	if (ret < 0) {
 		dev_err(&client->dev, "error reading header: %d\n", ret);
-		goto unlock;
+		return ret;
 	}
 
 	if (buf[PAYLOAD_HEADER] != FRAME_START) {
 		dev_err(&client->dev, "invalid frame start: %d\n", buf[0]);
-		ret = -EIO;
-		goto unlock;
+		return -EIO;
 	}
 
 	if (buf[PAYLOAD_LENGTH] == 0) {
 		dev_err(&client->dev, "invalid payload length: %d\n",
 			buf[PAYLOAD_LENGTH]);
-		ret = -EIO;
-		goto unlock;
+		return -EIO;
 	}
 
 	/* read the message */
 	ret = i2c_master_recv(client, &buf[PAYLOAD_BODY], buf[PAYLOAD_LENGTH]);
 	if (ret < 0) {
 		dev_err(&client->dev, "error reading payload: %d\n", ret);
-		goto unlock;
+		return ret;
 	}
 
 	dev_dbg(&client->dev, "read %d bytes for response command 0x%x\n",
 		buf[PAYLOAD_LENGTH], buf[PAYLOAD_BODY]);
 
-unlock:
-	mutex_unlock(&ts->access_mutex);
-	return ret;
+	return 0;
 }
 
 static void zforce_complete(struct zforce_ts *ts, int cmd, int result)
@@ -801,9 +775,6 @@ static int zforce_probe(struct i2c_client *client)
 		return -ENOMEM;
 	}
 
-	mutex_init(&ts->access_mutex);
-	mutex_init(&ts->command_mutex);
-
 	ts->client = client;
 	ts->input = input_dev;
 
-- 
2.46.0.295.g3b9ea8a38a-goog


