Return-Path: <linux-input+bounces-4830-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF5926A6D
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 23:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C1E283176
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 21:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE7D61946A5;
	Wed,  3 Jul 2024 21:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtVlalNM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816D51940A2;
	Wed,  3 Jul 2024 21:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720042688; cv=none; b=A7a9xqkEIyFaJfOtLgzQcY6lfrF9zN2MgfmLJlqxnJhxgsPg/AQhM6tbcfBlXFzyXENcvzlEWazEZm/ivii7WUArB17GhKZmBwBZFOlIEYOkO7+X9LiyCSaeU1yFJ9r3QUPHDUYNirwi3rxne77D1ptuPxUd7hXBWwAF8aIq3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720042688; c=relaxed/simple;
	bh=GlsgRKS0Vge58JDAIhBVWh6io5q7xcR19bX1ZhvfVzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tdX7m3vgjaRCaiQFAaS7OSgyxECloirePjkK80FLpdMVrKosLBHnFJ9LlNo7Bz+7DztQOycH0pfp3nvrB62iCAxQhqlHBC6B68KChXO2czTsrgdRX+wDvD8ytLn7beQCS20npw97fLMm4Z0nHayLDTCj5aQwNEANt9yusjTsxdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtVlalNM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-73aba5230b6so15203a12.1;
        Wed, 03 Jul 2024 14:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720042686; x=1720647486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTvHP/zEyqQZs4J1JDZsqVRaoeYMy5eTUMNrxsyDLMg=;
        b=RtVlalNMcZjD7TvnrYGYlllJnYYHrYgnz4p1cnyKmn2/uC1ewKNUQPbXRuH+vyu1/n
         NmcukGysjAVmgfEKat8jXm1eG64mqPAxCXj7TSlImFLBr2EmVHuCzCXKPFWh8Sqc6axA
         TEL3sbU3ESHQLVcsjdFIz7pjeZC1P0wLFQnhXleS49WtVb62QjQ7B0hISpaQaf0bxLSc
         FyMp7kXPmmPH3M4ln2Y8Bl36uX6Zkdm3397fdUhkOGH3gBkQqXC+RSlbmHmYqjWJPcKj
         kGbpzMhcUuxPfRMYdBi69gh01RKyv+6C8hU0CfJCHjSy/gsP9RtmQr6A7PFVFwtxSDq7
         EU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042686; x=1720647486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTvHP/zEyqQZs4J1JDZsqVRaoeYMy5eTUMNrxsyDLMg=;
        b=IEbfSqdhJsQ20w560HSaNYGrrizpGmq5819lRB7JpnOihhk3VBIf9NFtFUGOgqJPyJ
         Jy0eLYfxUriNahE/lurM9OoFDtOOgYhonskfw8tsaWzbubrTjWu1yt5vMglHqmm+e1Oa
         +9wSiRm+EjpZ/UD9ZaMxPh4vv8okN9QVrNc89JIbmwrpdOGjQ6DTnsixqibRDvEDv/nK
         zXdWUYrz4dgbAY6SkKDLyfwE05iPkcC1ONEaCbppmjRyN6VmqKaqZcHpbhbcqDzb+vpN
         bEkFXtXx5vFri2feyTNwIQSGWvuOLwPX2I/dlYyuT8oGpoMYldO61/wz4EkBpydFaCax
         dW2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5zzhkIN1VF+mX0b/TSTDtlaWEspmn0wojKNu8sE6XpW+w1lxXUesVU2KkP8Ua6F1G8Mu9Ry1v+/zL7KjhgyV2YLxIPDOJUcpgowXr
X-Gm-Message-State: AOJu0YymIHVePg6nBxjKlhgOW9szsvELsVyJ+JhAyaxuDfTxTQfndYuW
	qyDMRInI8QM1buw4K3bW3DT+KTse8U1OvWDtTOQk8SbGEmxlTa95bFISIg==
X-Google-Smtp-Source: AGHT+IEZl1MGu/jG2Mj1/oSOl1eodan6Z1ZmUfct2BcPNQ1pYybBsYEokOgcASYuNg5WldzOS5QnnA==
X-Received: by 2002:a05:6a21:6da1:b0:1b6:dd1e:da51 with SMTP id adf61e73a8af0-1c0bff5a968mr4684954637.21.1720042686386;
        Wed, 03 Jul 2024 14:38:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:dd06:1fb8:e932:1ed8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e631f0sm10886376b3a.4.2024.07.03.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:38:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] Input: evdev - remove ->event() method
Date: Wed,  3 Jul 2024 14:37:48 -0700
Message-ID: <20240703213756.3375978-2-dmitry.torokhov@gmail.com>
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

Input core favors ->events() (batch) method over ->event() method
if the former is defined, so there is no point in defining evdev_event()
as it is never called. Remove it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/evdev.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 51e0c4954600..05abcd45b5d4 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -308,17 +308,6 @@ static void evdev_events(struct input_handle *handle,
 	rcu_read_unlock();
 }
 
-/*
- * Pass incoming event to all connected clients.
- */
-static void evdev_event(struct input_handle *handle,
-			unsigned int type, unsigned int code, int value)
-{
-	struct input_value vals[] = { { type, code, value } };
-
-	evdev_events(handle, vals, 1);
-}
-
 static int evdev_fasync(int fd, struct file *file, int on)
 {
 	struct evdev_client *client = file->private_data;
@@ -1418,7 +1407,6 @@ static const struct input_device_id evdev_ids[] = {
 MODULE_DEVICE_TABLE(input, evdev_ids);
 
 static struct input_handler evdev_handler = {
-	.event		= evdev_event,
 	.events		= evdev_events,
 	.connect	= evdev_connect,
 	.disconnect	= evdev_disconnect,
-- 
2.45.2.803.g4e1b14247a-goog


