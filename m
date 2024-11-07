Return-Path: <linux-input+bounces-7942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913D9BFEE1
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AB2C1C21143
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E81019ABD4;
	Thu,  7 Nov 2024 07:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iebeOqrf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D5192D68;
	Thu,  7 Nov 2024 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963755; cv=none; b=aGj8MxewzAxw9iZBv0soK4DDbt9st2B+04QfYvxdSYiIPy0Gk4tmQYJhuHzDGwMFDmjNoySthC9Xeus7+KMbNkcqsr0Z5fsbw6iPcDku5lrDWHnhYpwb9efZK2w9xRRvVH08busSs8vclARNWNvL+f6+kRBSTB9Ez0ZYJaI2YYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963755; c=relaxed/simple;
	bh=vSGsIgFj+ICDtshl03yiA9Ruvbo9ycry/VM6cjk7TxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jiEoIr0REA79NcdOutVNvZlXMzRQYYXp8WpzZJ+rMVaS4w4v9Y0VIpLEftoKqzn1/lnmhglgPmdtSebfv/mthxoJjWKUW5cX6nBsBhOBS8y2yIyeHAhr+K7DB0Xleih7/OBhYDW6knyiB6K/MkJQ/6ytfbu9dkA1VnQuJ/NYu60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iebeOqrf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2114214c63eso5154905ad.3;
        Wed, 06 Nov 2024 23:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963753; x=1731568553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PnC/CEEyFrp0NngtmFGLRHAHLJYkgnLyAsiePHD2C78=;
        b=iebeOqrfTv81bseUxdawihwHv4eufkASKkJte1TANaC897yED0NTpLRTD5TulGTYoP
         SOosn0FPkrZYm85fuHHxKd/qOVpEB5V7GQbUqRsruOxrtSq9q5KHmQvXqEZJOLxcAewi
         +vj90I9NWSkXAdQS8nGMiTeTvWV7iAQwJ/UwOw9rNLq/vdHgbj6PjRPQ1vBXWI8+zbF2
         K3X8eVT5kRl9Y3IhHPoh7vOmakTOb0pephGRhg6t1GZ53xcvvHy2sGKY0ZEm6HR11KER
         bl7DNdqwzo2Zus/xL9FLN1rMd6/dAgWQqalszeypvH7ScZEj4YCHmhZCmKsV5HkTodg3
         3qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963753; x=1731568553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnC/CEEyFrp0NngtmFGLRHAHLJYkgnLyAsiePHD2C78=;
        b=uWmkapV63YNuPqOq6EpFiNZ96vDp9FJt8yva6PYZV4ZawT3g+zGgYD/TTUbXY0yNNl
         5uI+JFv+LKbnKz40SS0kB/Mmd7TcxnSBpJmEUKjnxz9bWnPmL1DZwIHhRTmDhIzibu64
         OnZhfmdMNvioEQT34+9QpjVMElQGIMUaqe84bnlmzyoVvpybUYzkMmQdj85/uUWSd0Y1
         YQ5DT30L23dUD4TdNBvpfmN83b9OFRNswh02qxS2ulActj3H44wK4f9BM/fseoOhgxg6
         ev82ixgams3a4TJE6TUdd80+Ms+JBjq8Haly+tHAroT6+UpD/+S+Ldx4hlt+9vihtHT0
         coGA==
X-Forwarded-Encrypted: i=1; AJvYcCVUoTsvqyGqOLvYT75a+fgGn+t6dw9OFWzpeMzgZXkULIZUi1aXZxZrw8Q0GIeDpMFpcjxCtm13IUmJFGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+qLWrTT6rZdjac6IgQICpkfSYoR6Rvxj3gjPs5CR78vSpHbK
	5dgjG+xDOmHh6iJOK4oI4+h/Q5jwAUorpI9PWyimxWn4OxDnYDDe
X-Google-Smtp-Source: AGHT+IEhFeUz4ZF4MaeF36cLnGA7X9ZBT+QQ7fuQ5jsEZtThVOWKYSnBqfhMYr5D9o7wROxUQUQTcw==
X-Received: by 2002:a17:903:40c9:b0:20c:c694:f6c6 with SMTP id d9443c01a7336-210c6c52417mr563066245ad.49.1730963753191;
        Wed, 06 Nov 2024 23:15:53 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:52 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] Input: mt - convert locking to guard notation
Date: Wed,  6 Nov 2024 23:15:32 -0800
Message-ID: <20241107071538.195340-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use guard() notation instead of explicitly acquiring and releasing
spinlocks to simplify the code and ensure that all locks are released.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/input-mt.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 6b04a674f832..45e41fc9059c 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -285,14 +285,10 @@ void input_mt_drop_unused(struct input_dev *dev)
 	struct input_mt *mt = dev->mt;
 
 	if (mt) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&dev->event_lock, flags);
+		guard(spinlock_irqsave)(&dev->event_lock);
 
 		__input_mt_drop_unused(dev, mt);
 		mt->frame++;
-
-		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 }
 EXPORT_SYMBOL(input_mt_drop_unused);
@@ -339,11 +335,8 @@ void input_mt_sync_frame(struct input_dev *dev)
 		return;
 
 	if (mt->flags & INPUT_MT_DROP_UNUSED) {
-		unsigned long flags;
-
-		spin_lock_irqsave(&dev->event_lock, flags);
+		guard(spinlock_irqsave)(&dev->event_lock);
 		__input_mt_drop_unused(dev, mt);
-		spin_unlock_irqrestore(&dev->event_lock, flags);
 	}
 
 	if ((mt->flags & INPUT_MT_POINTER) && !(mt->flags & INPUT_MT_SEMI_MT))
-- 
2.47.0.277.g8800431eea-goog


