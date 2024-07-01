Return-Path: <linux-input+bounces-4743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDD91D7DB
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 08:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB24B23B92
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 06:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E02A57CBC;
	Mon,  1 Jul 2024 06:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtwDfDxJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14D4D8C0;
	Mon,  1 Jul 2024 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813967; cv=none; b=Efp8h56cX+5rCLVYLDuRA7ZpT/20Rcgdl0cpbD+iipIY+kAaKXjPjE0pWClrCighRhGLVEAEScFZXPZAVV+nJ8NH+Ok2AJnS2Dr1HIweSk2g5tqdIpI648VVWndfK07RNhbJtfSVT+h0ERG5+abCV9FtVyXBVTTIbq52e3Y6jcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813967; c=relaxed/simple;
	bh=JgsF10WXr45ZFGxgPnan+aUzgO01DqbfpNA5QUVXiFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C919qED7gz8zvnhZsuc6CvurxY22XVwrVp/N+IDnvPOJwcsZoSKjfli06RLKea7Mx4CrUoGordjANarKPyef073qFKIkDVrVgii+lleCcrkN0+374Obv7Jz8Sm/+DSTfgka+qqo5RoMetF2i1KzT78UErDvID0QI+qRqpj5h/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtwDfDxJ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1faad409ca7so22740015ad.1;
        Sun, 30 Jun 2024 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719813966; x=1720418766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpqmtMTRuzoNPgBgmA0S+dAHbwI2sOJM4aEZFctXUR4=;
        b=CtwDfDxJo+7WnTraBsS0HP4gNAvA+Tp9KfY5cRAWO/8YqfYn+nSvexFqsDuLy9jlh3
         9UU4n5oasYzrooxinp4akQV14MVuHQdMt321y7Qqeg/DCR89bo79C0M3iz5mCXcfjOGh
         yaTcoOUcFX8+EYnVQdVt2J4ZW06NKWUma/PARkjn8Yq0tfp0JrEtjVVaGmKhCkGgxIQp
         GtdOWBwkWCpj+RKBnkFJ/nMUbP1ViWGa6S2OxEwAzwO7Xk/Ho7Pqt24reGhBtC48hif/
         UO1UV9W0OXwA/O6UToRVHwQmPf9y3lbQOv3LezXrWYwp5aIoHiLOUf6c5FirqzH1qSyx
         fp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813966; x=1720418766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpqmtMTRuzoNPgBgmA0S+dAHbwI2sOJM4aEZFctXUR4=;
        b=RQJ8YhdLtIT8JUf1+h6D+3MSMKcQ7akm/4hdfL1ODkF3bx2BGNkZ9NhDI1D3u041Uk
         AOYm2JmmzO9DoxgRw2N7CjwGqmvkzyjaYxIGJA+fDZH1Ir7eapFbZ4eWPcqK6IHn2AhQ
         DRBjIyOFyqbQWKgWz4zbArDfiCiuEjOey3YRAyusovrbSZmAJIdeulZAm9G2asaHDXAr
         xouYQWyDBM/OxxcN5+Tk0Z3IGQOMrzsW9Cfikmqmt5oVZoP6Esi7MnJRqy0JifdfnQpd
         oy8fPlCqeZYShKmNpHpyGkf8h5ABpdfP2wTK2EX1ZQ1RqUq6g2yQZ87ekdJ5+EWn01XO
         9kNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlgfk1Cn99atVbYUEKQXy7z5327uRm79JG+EoIKio0F7xW1fRJcqHX/Kd7hkONC7IRgJR1VcVU/sUJLmuNZrPPMdjy5kXW5qDpzsgO
X-Gm-Message-State: AOJu0Yxr+YjLOfCgVFAdXPmJ1/Lgj2m15GM8iL4qHSM/YaW6yKiiVHH+
	4RK2m1onJXe0ZDU3wFoBCqdU3tQRs8jk+egBZjdEsq7rincaPf+A/DfggQ==
X-Google-Smtp-Source: AGHT+IHamhi81jjbjPM5yjaBTRHjvwrq6ew03U/D6xreb1Pwhu4AwSBpH+BVADFuYBm6syMXx3YZ4g==
X-Received: by 2002:a17:902:f688:b0:1f9:f6e6:5ada with SMTP id d9443c01a7336-1fac7eec818mr130491065ad.22.1719813965719;
        Sun, 30 Jun 2024 23:06:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad304311csm44588205ad.31.2024.06.30.23.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:06:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Input: make events() method return number of events processed
Date: Sun, 30 Jun 2024 23:05:50 -0700
Message-ID: <20240701060553.869989-3-dmitry.torokhov@gmail.com>
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

In preparation to consolidating filtering and event processing in the
input core change events() method to return number of events processed
by it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/evdev.c | 6 ++++--
 include/linux/input.h | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 51e0c4954600..c8eca8cdb976 100644
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
 
 /*
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


