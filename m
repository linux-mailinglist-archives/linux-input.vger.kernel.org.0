Return-Path: <linux-input+bounces-4744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B591D7DD
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 08:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 056B0B224B9
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 06:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661326F2F1;
	Mon,  1 Jul 2024 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzWK0CtR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAA57C8D;
	Mon,  1 Jul 2024 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813969; cv=none; b=G3FjCTYbeZ0hL4TgA9ozTBLW/znpaOwduIRq8EsQgiVc0qokIc8TruKuz3KxMu7xx069b1e0LTZvjqWAHR5NhHxngdDqVuw6V4MwGQQ8WRlDQ/2UrppEEI7b+luYKu1vZIPiHnBfFkb86BLQ3evlg2iq1toncUddE8yCSNKHtPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813969; c=relaxed/simple;
	bh=GHguZZLZw97oK/tMyhuJnePfemI4Sonaez15KjSgGgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DH1q3WqBSIxpvDm+lb1e+Q2bHaSRzebzpXGRQbKYKwlVEN8nVwnGKWMEdoAtC8bOZ77buf1gaQhsZCfwMKwaHtQ052QMUXhQnQ0GhHL9WObeVP2GRMEwjUILp1o4xBmiS+MEOsH1X4YlptzBZxrotirzpAL4TV7OTs1CO8qtzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzWK0CtR; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-706627ff48dso1833879b3a.1;
        Sun, 30 Jun 2024 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719813967; x=1720418767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ENd3iWts9E5sWcDevFainVuokL7jAhtRNlUwZiapko=;
        b=SzWK0CtRtPzI77yJYA9czHjC7oKkFAK9Y3/7x37nWCPH3BLAuhH6Dj1DljTByfnuJ4
         SOnhP5ddCpgHK22XPHDMWz49LJWlXzwdE8eORwczKBD2qINwQeSnK8lC1VDBEELucmkF
         EMncnQ8jun/6rq8JUtQDDqkxq3nfuXXdyGDBSvO3ccmCl1N+8rUYwq8f5qTEc8xmok8n
         eCqooYgDsTHpmWNKBAtXMnICNzMapBEOtb52hQBqi8X2LjrTdtbBI60zkSsnLpJKzxn6
         bL5VMKVbNLuUDtOOcrWuXoo15w0iXzoNbRrJf8jVv1kRRxuD99JCzDxsZHXHFSl+Uieh
         qJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813967; x=1720418767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ENd3iWts9E5sWcDevFainVuokL7jAhtRNlUwZiapko=;
        b=lJcQn4DgKiN3uqZRLZkh2xOZKWzEHuXOfp30teXYn+pBde49gh3uTzzMSZj5Ozxz0e
         w5cah0VSxwqaEajZrY2p3lH5qTgqQdS47AUFoT8YEDq5nV6j7PAuu/4m8FajKPOO8ELp
         0fjxTzaA+TmeHijgHLRxgwv/Oss9LOr85PDq3vqG1uuI98E2KmuVKMf5XmMepJtKLJcu
         s1o2C+CKEKrMqlHgZJWtl3Q7ye6Ayw/nKOzfhjjQu/pFOm513INxtWWWqXvdWL0lyl+0
         YbsLUosbm5SedG8wF2p915JkSNZijUdcLwsJ5AHGmDtIFBxLUxidDDmcagsxb7KBMUXR
         5zYw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ9u5rp99UIKUtmjkICa91DKDZrsI9QsLS+uT1xgi9QIE4fjJam9EDROfQ/gYPBuQinSE+w1LF1sXG92eYC9Df9F0KzwC3JuFt05cz
X-Gm-Message-State: AOJu0YykgsQZqqhGyY6Qo7mRRF94Sw1DV04hOB8LjVZAE6S83+8Dz13z
	vEprov33EC5yZF9RLTCAKNtVCoG2ON1LeTDg0cYGmpsFxe+fgVRWNoYaaQ==
X-Google-Smtp-Source: AGHT+IHpxwEYtCEov+1Xu9Ejied7dJGEytl3yxzOxHkBJqgSOFzDj/Z7p09gLr2IBbXMx5H89FMlgA==
X-Received: by 2002:a05:6a21:193:b0:1be:c62f:13ec with SMTP id adf61e73a8af0-1bef6109db7mr8502817637.18.1719813966748;
        Sun, 30 Jun 2024 23:06:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad304311csm44588205ad.31.2024.06.30.23.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:06:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: simplify event handling logic
Date: Sun, 30 Jun 2024 23:05:51 -0700
Message-ID: <20240701060553.869989-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Streamline event handling code by providing batch implementations for
filtering and event processing and using them in place of the main
event handler, as needed, instead of having complex branching logic
in the middle of the event processing code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 90 ++++++++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 8434348faeac..eeb755cb12e7 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -99,41 +99,6 @@ static void input_stop_autorepeat(struct input_dev *dev)
 	del_timer(&dev->timer);
 }
 
-/*
- * Pass event first through all filters and then, if event has not been
- * filtered out, through all open handles. This function is called with
- * dev->event_lock held and interrupts disabled.
- */
-static unsigned int input_to_handler(struct input_handle *handle,
-			struct input_value *vals, unsigned int count)
-{
-	struct input_handler *handler = handle->handler;
-	struct input_value *end = vals;
-	struct input_value *v;
-
-	if (handler->filter) {
-		for (v = vals; v != vals + count; v++) {
-			if (handler->filter(handle, v->type, v->code, v->value))
-				continue;
-			if (end != v)
-				*end = *v;
-			end++;
-		}
-		count = end - vals;
-	}
-
-	if (!count)
-		return 0;
-
-	if (handler->events)
-		handler->events(handle, vals, count);
-	else if (handler->event)
-		for (v = vals; v != vals + count; v++)
-			handler->event(handle, v->type, v->code, v->value);
-
-	return count;
-}
-
 /*
  * Pass values first through all filters and then, if event has not been
  * filtered out, through all open handles. This function is called with
@@ -154,11 +119,12 @@ static void input_pass_values(struct input_dev *dev,
 
 	handle = rcu_dereference(dev->grab);
 	if (handle) {
-		count = input_to_handler(handle, vals, count);
+		count = handle->handler->events(handle, vals, count);
 	} else {
 		list_for_each_entry_rcu(handle, &dev->h_list, d_node)
 			if (handle->open) {
-				count = input_to_handler(handle, vals, count);
+				count = handle->handler->events(handle, vals,
+								count);
 				if (!count)
 					break;
 			}
@@ -2537,6 +2503,47 @@ static int input_handler_check_methods(const struct input_handler *handler)
 	return 0;
 }
 
+/*
+ * An implementation of input_handler's events() method that simply
+ * invokes handler->event() method for each event one by one.
+ */
+static unsigned int input_handler_events_default(struct input_handle *handle,
+						 struct input_value *vals,
+						 unsigned int count)
+{
+	struct input_handler *handler = handle->handler;
+	struct input_value *v;
+
+	for (v = vals; v != vals + count; v++)
+		handler->event(handle, v->type, v->code, v->value);
+
+	return count;
+}
+
+/*
+ * An implementation of input_handler's events() method that invokes
+ * handler->filter() method for each event one by one and removes events
+ * that were filtered out from the "vals" array.
+ */
+static unsigned int input_handler_events_filter(struct input_handle *handle,
+						struct input_value *vals,
+						unsigned int count)
+{
+	struct input_handler *handler = handle->handler;
+	struct input_value *end = vals;
+	struct input_value *v;
+
+	for (v = vals; v != vals + count; v++) {
+		if (handler->filter(handle, v->type, v->code, v->value))
+			continue;
+		if (end != v)
+			*end = *v;
+		end++;
+	}
+
+	return end - vals;
+}
+
 /**
  * input_register_handler - register a new input handler
  * @handler: handler to be registered
@@ -2554,12 +2561,17 @@ int input_register_handler(struct input_handler *handler)
 	if (error)
 		return error;
 
+	INIT_LIST_HEAD(&handler->h_list);
+
+	if (handler->filter)
+		handler->events = input_handler_events_filter;
+	else if (handler->event)
+		handler->events = input_handler_events_default;
+
 	error = mutex_lock_interruptible(&input_mutex);
 	if (error)
 		return error;
 
-	INIT_LIST_HEAD(&handler->h_list);
-
 	list_add_tail(&handler->node, &input_handler_list);
 
 	list_for_each_entry(dev, &input_dev_list, node)
-- 
2.45.2.803.g4e1b14247a-goog


