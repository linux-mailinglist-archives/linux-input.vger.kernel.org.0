Return-Path: <linux-input+bounces-4742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A30B91D7D9
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 08:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88867B239E0
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 06:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0659A4F215;
	Mon,  1 Jul 2024 06:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+I7wuL6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E90142056;
	Mon,  1 Jul 2024 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813966; cv=none; b=aiuJQBXpTgVUCGWBTBrhutMxXOUfG5z4XupHIMPpetcmgeSEURNbjVR9KJ+i0WrcvrZWY/RkzBFeSIEQLjTFy7qbRR1zRV/80FjjYv72DheYotiQ2OK+f5PEDMazt+FXRTaiKfId6WRHWxWCrS6IKXX1gWD0LtVJ+ObxJRBKDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813966; c=relaxed/simple;
	bh=gE4srvRTq4uMOziw6LpIXybIaA+YogFBoel+P4KrXFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MvsE8gMBUKMro4XcBRDcU+xnaCLmrGKmZOwKijEOVdwA//y8CohUObERSh+WcSuhnYGQPh3T4HVRE6Pol5seDl0uvMe8LltDCItzMQI2QK8U8MZMG1Q0gHEpg0rpMlnhvrnx7vGeMPJaykw0TWbHBbSdJojCVxUvr6k7tVpUysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+I7wuL6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f8395a530dso9676925ad.0;
        Sun, 30 Jun 2024 23:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719813965; x=1720418765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rr5LgW7b41WmKRKWDxksz++aJz2iH/cDfPQ5g0Teqo=;
        b=M+I7wuL6nKLCN14sgu/IreKFlhWZhQO7UUTLvK7+3/WhpfaEtS1MWrMILhIWvtjXTV
         k037dTvdW91+EEMI9Nvbuc4sOzpVfIcpVcgapCkLhf7dgLCTspQdjJ2HRYKaxMR1sBGD
         raP4XKeN+z2IWuqKd5IZcEW3RSZobOLW56j9A3meZb63iHCvvPHPPcUnsZx3HzM825k6
         0lc1L9b3SEBrfVqKeQHp+eQACgahMkYLfBt6ARnt9fmdQSV1pdurOtyfKTgdOy9bLD1m
         WdypHJBkMo025x9kbk8KCYigfx0w5YAUoIUWgJlcpT8qIBTXJaDrqxArSOzV9zvKrUjR
         qVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813965; x=1720418765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rr5LgW7b41WmKRKWDxksz++aJz2iH/cDfPQ5g0Teqo=;
        b=W6VU6mjGcGaMbHENmGv+r3UwhaD/W8Y1JujJALmiz/P+qLtx2zRLVDHmc/Uy2IUWlI
         2gZqkYX1lMUNu3S4NOjZ7nvsZGeXGUMdwK6lkPI0//lYJX+omPOPka/1usN6kWZmmCHD
         4KivWPraHulvPvJ7qY0GOesC+Eqapb6mAjC/jKB50I4HBXsHHtao5IHWTqPnYfrokMV7
         LFQcjN211kAkQPVQY3cWY3l0tsEaEAPW9yak3PobGe5jugpwzwdtfm25TdfrKZgxAoY0
         XFb75aZ8DXUdA7V2bAoiHYHYSbL4JjLLd5rVrZtGPJFZxVMinhq43kNFr/aftzoHSwqt
         v6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3mGrNJPFug2vI8AzrLDhj8OJGCUws2J1lD9jOt5kVN5zCsGzcyvimvuXgI/KdFGlEhLCwhnAhWNonw+qa9se5RidM4uBnmgbeN5R
X-Gm-Message-State: AOJu0YwYxmi/8OUHPFuHClxj2gXyzFTKO/d1uRoKwThrjOO6anWo57XD
	VTm8h1+iDH4KbjhnfWF5DR8CCXYycnSKETN+16RyEdEATZ0XRJ5Xr2gr6Q==
X-Google-Smtp-Source: AGHT+IHKtRt0IZvPSVkDmGcYwtIXVcO+j/Q3xXny3MuW5Vse/pGTgH3D0zXcO3fLQ7oMm7lHyw/Ong==
X-Received: by 2002:a17:903:32cd:b0:1f6:a606:539e with SMTP id d9443c01a7336-1fadbd0b200mr26857885ad.61.1719813964517;
        Sun, 30 Jun 2024 23:06:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad304311csm44588205ad.31.2024.06.30.23.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:06:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] Input: make sure input handlers define only one processing method
Date: Sun, 30 Jun 2024 23:05:49 -0700
Message-ID: <20240701060553.869989-2-dmitry.torokhov@gmail.com>
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

Input core expects input handlers to be either filters, or regular
handlers, but not both. Additionally, for regular handlers it does
not make sense to define both single event method and batch method.

Refuse registering handler if it defines more than one method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index fd4997ba263c..8434348faeac 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2517,6 +2517,26 @@ void input_unregister_device(struct input_dev *dev)
 }
 EXPORT_SYMBOL(input_unregister_device);
 
+static int input_handler_check_methods(const struct input_handler *handler)
+{
+	int count = 0;
+
+	if (handler->filter)
+		count++;
+	if (handler->events)
+		count++;
+	if (handler->event)
+		count++;
+
+	if (count != 1) {
+		pr_err("%s: only one event processing method should be defined (%s)\n",
+		       __func__, handler->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * input_register_handler - register a new input handler
  * @handler: handler to be registered
@@ -2530,6 +2550,10 @@ int input_register_handler(struct input_handler *handler)
 	struct input_dev *dev;
 	int error;
 
+	error = input_handler_check_methods(handler);
+	if (error)
+		return error;
+
 	error = mutex_lock_interruptible(&input_mutex);
 	if (error)
 		return error;
-- 
2.45.2.803.g4e1b14247a-goog


