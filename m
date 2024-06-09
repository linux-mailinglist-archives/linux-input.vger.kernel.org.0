Return-Path: <linux-input+bounces-4281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B5B9018CE
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F44A1F2115E
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E761B4315F;
	Sun,  9 Jun 2024 23:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aM8Vn4FJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5311CF9B;
	Sun,  9 Jun 2024 23:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717977100; cv=none; b=WiHmUJw7jIVu/EhyE6eM4lfN8LWprCOy/7kxgsHUf0TXQhC+QBAw6EMECaSDfgZQWiAlHLX6G1NLsJ1HEQFaM9/1GTJ7xUWsJXyAcWP/3zc3y2YqLzCkMG92PyjRdqaekv04ttGcU4ypj1SFnPn12pz6CqrH4u4ay8PTbuQHrpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717977100; c=relaxed/simple;
	bh=QfJXZWN1aAAuPSN6rqBZFArPNWvXGjthvGQVIq1WSnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hG+6M+z7UgcZH5sWv59Ez33lFzOTFGLhwdEGKzk3RM1GU1fuy/+B8nGaPHm3qeovy9XmcMt0AQAwgxAIUq9PCcHsWud/36OsJDVy/NvbZ4+HwMaj38VGealpvDPdnV/Am24v5M1GdCz+ecwSDAY3iOUDOrjoC9UmdAeSWwqv02s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aM8Vn4FJ; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-250ca14422aso2091727fac.0;
        Sun, 09 Jun 2024 16:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717977098; x=1718581898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVIaAx3x412TkipycxEGUU2uFvDryTHNfZAKZgr8qfg=;
        b=aM8Vn4FJ8cwu9AE+EQ5qNaAri799xhMLRvHMck7uizyTUgfiPtgsK2UUJXcNRqhoyG
         CqlSDZLDA/701zjThO38AEMBfxUNhBAwotbSHgXIP8+DYz2l6+1OLGLKWP6K/5Z+Jay+
         duBDLInnn7JDMmIp5dOopTF63elVoxfVBU7jZfTChK7usDL/VuJb9b4Ag6qvyik4dCdd
         PC0xfMWbeVtmUoG+DeUTYe0gjLNtRnoZ/eV+uPhTKgiQK4B/wdTmA9XWMmrnROB1jckj
         Ae33sPUBNSBh7lETs0YmK3bXuUdXf2+pwf9WYs8x9+/HLQdPXDZWpjgsEgMY93Juyh6/
         hknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717977098; x=1718581898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVIaAx3x412TkipycxEGUU2uFvDryTHNfZAKZgr8qfg=;
        b=up0Gdhe/y+hY4zrZLsde1lmhmsTvFT8Q+8gqmQugPqpW31Q3mOURsyr8t4DvuuK0Jl
         gj5ChDJCbScfLXJho5nXc6aaEKIFBFVB1K1NzsKHTH+plCjxtPcUFP4/OdilaLW4NeWh
         w+cIBwKY4itcvB/76du+TTAWGifR0kVe8cu2/C5R3AFSJrvlHnup4FeMD1Fu6RZ22UBI
         arD1nBIyTlNgctcA4zYc5RAXcRxmEVzMsEyooWOPL1h+Fvpfd1+sPqMnQcNL141RTROH
         Z7FTfTgVLWG83mtyChRB2nTlWOo+JrWnU5mcNyEmL+RSXGs4JmHDrUs1abgHbaDp2EjL
         oINw==
X-Gm-Message-State: AOJu0YwMUEQ6KhYDplkBI6qFiMrshjbThOf2L7fMnE6jtxOSWwYA6zvl
	Ie6HrlWVVZbN8PApAAZRdSHx4tprGWI4Yfa2JwuzAgSnyjcz1BIHhjHt/w==
X-Google-Smtp-Source: AGHT+IGpmI1jNSVXx0xYJ+Mp5swmpw+ohybJ87ulQdMuFT4BkypTUae5IK5FSbUpW6qhawe1DnCbYg==
X-Received: by 2002:a05:6870:3122:b0:24f:ee90:4556 with SMTP id 586e51a60fabf-25463f50643mr9673618fac.0.1717977098037;
        Sun, 09 Jun 2024 16:51:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042f37f33asm2090356b3a.3.2024.06.09.16.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:51:37 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: rohm_bu21023 - factor out settings update code
Date: Sun,  9 Jun 2024 16:51:30 -0700
Message-ID: <20240609235134.614592-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code to toggle axis swapping and inversion is repetitive and can
be factored out.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/rohm_bu21023.c | 77 +++++++++---------------
 1 file changed, 29 insertions(+), 48 deletions(-)

diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index 06fa3a19d266..c432ed682d31 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -727,6 +727,29 @@ static int rohm_ts_load_firmware(struct i2c_client *client,
 	return error ? error : error2;
 }
 
+static int rohm_ts_update_setting(struct rohm_ts_data *ts,
+				  unsigned int setting_bit, bool on)
+{
+	int error;
+
+	error = mutex_lock_interruptible(&ts->input->mutex);
+	if (error)
+		return error;
+
+	if (on)
+		ts->setup2 |= setting_bit;
+	else
+		ts->setup2 &= ~setting_bit;
+
+	if (ts->initialized)
+		error = i2c_smbus_write_byte_data(ts->client, COMMON_SETUP2,
+						  ts->setup2);
+
+	mutex_unlock(&ts->input->mutex);
+
+	return error;
+}
+
 static ssize_t swap_xy_show(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
@@ -748,22 +771,8 @@ static ssize_t swap_xy_store(struct device *dev, struct device_attribute *attr,
 	if (error)
 		return error;
 
-	error = mutex_lock_interruptible(&ts->input->mutex);
-	if (error)
-		return error;
-
-	if (val)
-		ts->setup2 |= SWAP_XY;
-	else
-		ts->setup2 &= ~SWAP_XY;
-
-	if (ts->initialized)
-		error = i2c_smbus_write_byte_data(ts->client, COMMON_SETUP2,
-						  ts->setup2);
-
-	mutex_unlock(&ts->input->mutex);
-
-	return error ? error : count;
+	error = rohm_ts_update_setting(ts, SWAP_XY, val);
+	return error ?: count;
 }
 
 static ssize_t inv_x_show(struct device *dev, struct device_attribute *attr,
@@ -787,22 +796,8 @@ static ssize_t inv_x_store(struct device *dev, struct device_attribute *attr,
 	if (error)
 		return error;
 
-	error = mutex_lock_interruptible(&ts->input->mutex);
-	if (error)
-		return error;
-
-	if (val)
-		ts->setup2 |= INV_X;
-	else
-		ts->setup2 &= ~INV_X;
-
-	if (ts->initialized)
-		error = i2c_smbus_write_byte_data(ts->client, COMMON_SETUP2,
-						  ts->setup2);
-
-	mutex_unlock(&ts->input->mutex);
-
-	return error ? error : count;
+	error = rohm_ts_update_setting(ts, INV_X, val);
+	return error ?: count;
 }
 
 static ssize_t inv_y_show(struct device *dev, struct device_attribute *attr,
@@ -826,22 +821,8 @@ static ssize_t inv_y_store(struct device *dev, struct device_attribute *attr,
 	if (error)
 		return error;
 
-	error = mutex_lock_interruptible(&ts->input->mutex);
-	if (error)
-		return error;
-
-	if (val)
-		ts->setup2 |= INV_Y;
-	else
-		ts->setup2 &= ~INV_Y;
-
-	if (ts->initialized)
-		error = i2c_smbus_write_byte_data(client, COMMON_SETUP2,
-						  ts->setup2);
-
-	mutex_unlock(&ts->input->mutex);
-
-	return error ? error : count;
+	error = rohm_ts_update_setting(ts, INV_Y, val);
+	return error ?: count;
 }
 
 static DEVICE_ATTR_RW(swap_xy);
-- 
2.45.2.505.gda0bf45e8d-goog


