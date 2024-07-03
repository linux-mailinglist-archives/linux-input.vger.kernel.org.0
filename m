Return-Path: <linux-input+bounces-4832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AAA926A71
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 201D2B25119
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32308191F8E;
	Wed,  3 Jul 2024 21:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cm1aOsHm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7627194A42;
	Wed,  3 Jul 2024 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042691; cv=none; b=goF0A/UgfyHfwIlnw+NFQCFKq5/EjWjoMSxHhOeKcJf/UdxCl+dq9DtB0z/ojew3Jop7IL9k+71i22fqgmY7y9eEyLDtN6xU6CpCwhsPTI0GL0sS2NPVRT+KgSv1iAbRB8aTyfqoCoRTkHTAXKD5VvXJEwOQib29POW4JkrXLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042691; c=relaxed/simple;
	bh=qn1bfiZa9Wt1bHCvSu7/CFvYP8ZtrUUyc8t5ef9UDEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4DjqQHqywJrw/+1PaV8kUOK4iDHxrXC/p4DuZul2HkDOdkcIE1WXXEYBZ8IT8sW2ciwrW6mJIzQ2WtQ4qFW6IUg88DrYIaU4Y/eZVyqNyMtE0UPTQDHk2UXGluZuTmgxcwETyg/hcJnsceb+PS09Eb68OECdxElxb/lCz9giNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cm1aOsHm; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-75c5bdab7faso544329a12.1;
        Wed, 03 Jul 2024 14:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042689; x=1720647489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0a0Jx1WOSLgu2QcRu/CLQEgd8mBLORvujCrOGKL+DU=;
        b=cm1aOsHmTLuCvWXhWoHUUklH57sB/vYbYQogpsL62th5qrX9OdpQpgs8yBE8a9RcH/
         X1go63LmHMu6eoZxlI/nvXDt5sgAaVXchI2e9I6iTAkqz7piejoEFnddpzCV89OYjJgK
         10BStvTiiW/MHxUh/2DCnL0jreTRNrelrWi9Dg0COraELDCcrP2yF0KVhwYyioq9aRh5
         ZLcgQVIucag1uz/ip55uf237h6EuO+yhHScF2+s7AoZwafhtOERqGMlmKKNkbPu8h/ha
         7z88X+zH2kLJIGmeJT9mpUIus8puNFukS8wX1D139N2OqeVGP3q0vEUxx3h7CJUJ0wGE
         5MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042689; x=1720647489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O0a0Jx1WOSLgu2QcRu/CLQEgd8mBLORvujCrOGKL+DU=;
        b=jAVTzQcO0R64gPyzFs0qBC+GGN+mNQYQqikDsd/y4/sbO8aaA7P3ohpMPkjkJzxQGG
         at7L7+8ddBnRPVC6rt+5mhIq3moe5O1MlFbHXBmUxudvZ8kXkA+samGqg1l37W3B4GZL
         SnVfcLFfcY1wwy0e4ZFw9WUpGU4dQS9MDPGwVNYIQ0f0CjUpeyvMqZfiEY39UrD8ayS0
         3mZc3DqH+9nCD39eerBseY08gdxzq5LYHYEPo5JjhXG9yH3EojD4LtWzp/6WmmmqvOaL
         CZRkh2bKWRhEy7FjCYngiXnqALZ1rMdDaLNppW0cAcJ3LAnsl5Zm6oXKUHfR94c8hVaO
         mffA==
X-Forwarded-Encrypted: i=1; AJvYcCU4zAmzv/enSemXXzscU0Hrcgx1TUkgr28NcGTHDciWxjcL3sMMLs43IVh+7YAbUIeoZ9HuGx2W42ketTZXFxST02BQ/JrXC1OpKgZt
X-Gm-Message-State: AOJu0YxRLepLYdJUUS1KT7mRF15SxYj/En1tM3OTjtv0cQu1UVjfTd2S
	yGv/NQ22LQbrJtlzMCiN0yZ+epOVx9Ccuj2klTICOC3jolmIK/7/lcYksQ==
X-Google-Smtp-Source: AGHT+IFvY+WSk5ZcoZUXAb4aXd46QfdkMD7q7yJlJTblyGPzWOYoJXmppABuQT9YQlMiXavUOlp1Iw==
X-Received: by 2002:a05:6a20:4307:b0:1bd:233f:e60e with SMTP id adf61e73a8af0-1bef6140792mr14926722637.19.1720042688619;
        Wed, 03 Jul 2024 14:38:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:08 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] Input: make events() method return number of events processed
Date: Wed,  3 Jul 2024 14:37:50 -0700
Message-ID: <20240703213756.3375978-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation to consolidating filtering and event processing in the
input core change events() method to return number of events processed
by it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/evdev.c | 6 ++++--
 include/linux/input.h | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 05abcd45b5d4..a8ce3d140722 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -288,8 +288,8 @@ static void evdev_pass_values(struct evdev_client *client,
 /*
  * Pass incoming events to all connected clients.
  */
-static void evdev_events(struct input_handle *handle,
-			 const struct input_value *vals, unsigned int count)
+static unsigned int evdev_events(struct input_handle *handle,
+				 struct input_value *vals, unsigned int count)
 {
 	struct evdev *evdev = handle->private;
 	struct evdev_client *client;
@@ -306,6 +306,8 @@ static void evdev_events(struct input_handle *handle,
 			evdev_pass_values(client, vals, count, ev_time);
 
 	rcu_read_unlock();
+
+	return count;
 }
 
 static int evdev_fasync(int fd, struct file *file, int on)
diff --git a/include/linux/input.h b/include/linux/input.h
index c22ac465254b..89a0be6ee0e2 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -275,7 +275,8 @@ struct input_handle;
  *	it may not sleep
  * @events: event sequence handler. This method is being called by
  *	input core with interrupts disabled and dev->event_lock
- *	spinlock held and so it may not sleep
+ *	spinlock held and so it may not sleep. The method must return
+ *	number of events passed to it.
  * @filter: similar to @event; separates normal event handlers from
  *	"filters".
  * @match: called after comparing device's id with handler's id_table
@@ -312,8 +313,8 @@ struct input_handler {
 	void *private;
 
 	void (*event)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
-	void (*events)(struct input_handle *handle,
-		       const struct input_value *vals, unsigned int count);
+	unsigned int (*events)(struct input_handle *handle,
+			       struct input_value *vals, unsigned int count);
 	bool (*filter)(struct input_handle *handle, unsigned int type, unsigned int code, int value);
 	bool (*match)(struct input_handler *handler, struct input_dev *dev);
 	int (*connect)(struct input_handler *handler, struct input_dev *dev, const struct input_device_id *id);
-- 
2.45.2.803.g4e1b14247a-goog


