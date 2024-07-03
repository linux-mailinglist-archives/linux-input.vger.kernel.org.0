Return-Path: <linux-input+bounces-4833-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1D926A73
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7911C1F23155
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 819F9194C85;
	Wed,  3 Jul 2024 21:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0/f1hQP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB333194AC2;
	Wed,  3 Jul 2024 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042692; cv=none; b=lqTqv5Ov/TjfsJ2jJ06K3aGDaycSrY926Zs17GABbLZgC3rVLD26NoCrZw5g3qWm4G/5ujyE1psiU0AC32YbnqeG0sA92mZh943sNA7aLG5BrrhresgROwUM5aSb3Jtd+t/9ajTubyDV+rD1V7AdmEhYK+OZKABLiZnkw2a3CNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042692; c=relaxed/simple;
	bh=93BG1Oebqq4+AkDSHpvLyUcw+spU7y6yxysIeAtqQcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gOZ5Ig2YFpGa4Nz3spAbLbphQP9pTd855g7Jk/CIyycaeUbCwxrONC+DNrleKfYWX+vmuVCYnyshJPdlXs+g78vdsloY+YaP+CObVBC3kximAfE8xe1c/czlQRlOSgREj4uLViUn5DBYU8eVIjsMUiSoY1DGXCzK6TPmkcS8jrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0/f1hQP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6e7b121be30so3526291a12.1;
        Wed, 03 Jul 2024 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042690; x=1720647490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBBVw8f8tnVHi/QRxdBxtSwkH9QahZ7XU4RUYJ2m6T8=;
        b=G0/f1hQPf61I4syTqGO6uIX2WQRhPHyKpJ67AIfOVydrMLPRUrOobS6oaK2Yk3yKdc
         Jkikm5GHGL6IjcaaKwmHn7SVjnkxcX/8DT/Xjp1WqtSIRiVv69LBlhTL5deGtRJvriQ6
         f/NxrTYV5TblA+Rn7plcCIAgdARo1CWtCmXBxg2ydNNdi8VDR/G+eVSN+yiOSg1AwNnO
         zGdovDsBVItx7m6Kg6bp3ZCDxZkuFMZwWIFcsSNlDNyX6HjWcNewcrY0/A1Fxm2DeyUu
         +vrPhrlaxS7VuyV8xhfcwedRXv4fIt9QctiPYVlz/OuzF7evwszWgrd9zJUs+YPJhj2L
         S2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042690; x=1720647490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBBVw8f8tnVHi/QRxdBxtSwkH9QahZ7XU4RUYJ2m6T8=;
        b=ct65BKkM/yYbLT1XyOw3ZG92JBW2bXRaloM58DZG6DlFxgR3f1FkR6El9wq2h4jGuU
         r9bAvZyI+et23LhgNft+ak1owd3lnvUR/AtjQEatrF0xhrV82hKjjUh2lHRt/o7Z4uas
         pmfxr/1BNr+EPbseaQey60LdzcAHD9k49riyHVLZS7vY8ngMslQrrnfMNDpl7O78oT4C
         nDsbbge5BNs4RFFzwbsmzqKckoc2NMBQOwg1daaawQ6VtkY8CchOAh3fhxhmkkR3XUzy
         BbIcXYX1FbaSKTs/p98Kqhegvu5UeuDInXznXlku7JhW9Kw/cy0HqmL5lnVyfytxuFnT
         Eluw==
X-Forwarded-Encrypted: i=1; AJvYcCVOsaF4lI9y54SmilgATflpqYNmzpGFmY1EP5arRUqRJ3gHFz8DxKzwLXubgk16h32ljtyGsfHtjccq00puqweOaRkDoarKTqAAlGqR
X-Gm-Message-State: AOJu0YzYAM2SRWUNwAm6GZy9XC+RzgB7vMEKTswPFubeQo7L3ZMhD5/W
	N+o44HGUxlQnytTV13IeNSOU+5m3wRmKL6/o4IlYTSFSgJ/7m/bwWd+t+w==
X-Google-Smtp-Source: AGHT+IHsCV2Ha5qyz2cPswVjeEC5t+kbTormlOkz02WP+7QgFP3xlPypwVm4tfVB4Y31yPFn10/Q3w==
X-Received: by 2002:a05:6a20:3ca5:b0:1be:e1d1:7ea8 with SMTP id adf61e73a8af0-1bef60f2070mr13463547637.1.1720042689799;
        Wed, 03 Jul 2024 14:38:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] Input: simplify event handling logic
Date: Wed,  3 Jul 2024 14:37:51 -0700
Message-ID: <20240703213756.3375978-5-dmitry.torokhov@gmail.com>
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

Streamline event handling code by providing batch implementations for
filtering and event processing and using them in place of the main
event handler, as needed, instead of having complex branching logic
in the middle of the event processing code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 109 ++++++++++++++++++++++++++----------------
 1 file changed, 68 insertions(+), 41 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 7e4f8824f4fd..40a04154f99d 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -99,45 +99,13 @@ static void input_stop_autorepeat(struct input_dev *dev)
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
- * filtered out, through all open handles. This function is called with
- * dev->event_lock held and interrupts disabled.
+ * filtered out, through all open handles. This order is achieved by placing
+ * filters at the head of the list of handles attached to the device, and
+ * placing regular handles at the tail of the list.
+ *
+ * This function is called with dev->event_lock held and interrupts disabled.
  */
 static void input_pass_values(struct input_dev *dev,
 			      struct input_value *vals, unsigned int count)
@@ -154,11 +122,12 @@ static void input_pass_values(struct input_dev *dev,
 
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
@@ -2537,6 +2506,57 @@ static int input_handler_check_methods(const struct input_handler *handler)
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
+/*
+ * An implementation of input_handler's events() method that does nothing.
+ */
+static unsigned int input_handler_events_null(struct input_handle *handle,
+					      struct input_value *vals,
+					      unsigned int count)
+{
+	return count;
+}
+
 /**
  * input_register_handler - register a new input handler
  * @handler: handler to be registered
@@ -2554,12 +2574,19 @@ int input_register_handler(struct input_handler *handler)
 	if (error)
 		return error;
 
+	INIT_LIST_HEAD(&handler->h_list);
+
+	if (handler->filter)
+		handler->events = input_handler_events_filter;
+	else if (handler->event)
+		handler->events = input_handler_events_default;
+	else if (!handler->events)
+		handler->events = input_handler_events_null;
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


