Return-Path: <linux-input+bounces-6152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 556FE96B027
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1458B28B049
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821F082486;
	Wed,  4 Sep 2024 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Okw4Wswp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F982866;
	Wed,  4 Sep 2024 04:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425383; cv=none; b=X9d4EeZt4uh5gOeDS21luF95mn5d+NTwUdO32MAaxe/PWsyZI5SgvExE/Z7Xt+ELd2yzY3M3VwlaK9nu2jBzdy2NdQnssL9tnd37OMe3sP4t3Y+tQjVuzDaJnQhcwUaqnbXjViv0L9FhUzyYzRru6y6COM8qYHz0O9MYO+be+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425383; c=relaxed/simple;
	bh=244eaGPCLz6NFcuG6n2Qsu+nYop+aZf2tGJGUQkgkfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6jKyuMJN3w2LkYHm46vJyPiMp6OLRUoAPX28SeadivNIiudBcScpixVKLePPJ2pLM6an86H7VBPXcqKI0cmGXi2P1gh/J15MRLaq4XJpI0+nqPGlqRFVjaLrDqQpft9g+EBdlhkrGiFDGLMp/H0eFOOn3shZ0EIh+xfGHXCXyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Okw4Wswp; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71744362c22so2750953b3a.2;
        Tue, 03 Sep 2024 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425380; x=1726030180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NRWhO6LY9zWWiBrJwXb282nuYaIsKgNXPTyljvk7LI=;
        b=Okw4WswptM5CYlh+ktI9etXgAAxUX/99zq4GjsmPnkLpm/GS8BGGbg04JOOioo7w0p
         POpHINVF5XtkzDFruCMTGpYp6+i70amY2DUHMZqS3EqubJBL76H7OOkZ6hA13NhWZk5b
         WzoXc4w6/CuEICmpHdFcTWuofZcprHUl3QLZLSCUxAJjLeNCNk6g3heqVSwQVQAy3zNb
         21yxWutwb/44/eZjT/31c54fXHxZ5U3BWJfx4l8BAgvIiP+7oe5A8odzU6WL+VVlC6lX
         tHRTbzU92ZcLzMRkeSfAQUWvMBjehYThXRM9HnpvV7jyIYEGKoKk4MjGKVc6I6G/8A/+
         UnoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425380; x=1726030180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NRWhO6LY9zWWiBrJwXb282nuYaIsKgNXPTyljvk7LI=;
        b=wNkE3uxRsuRkjEhlZHeVsQTX3Fxu6VonuqPVAfZAjMtbMSmQGxbU1cqA4ewS6H1PUX
         z3VPPGPnUA/hZOuxFHPUbMVzp39+sb8t43Btap42SHQGiMMafx6aAL3iBUa2sJS1PZnV
         oggw5FpP0ZNIY3QpzR6cTngaUeHWXUWTnzGaq7WTyrQWXTqwElwmcXe0jZowOYpY45JK
         reTGAEISDdcti89BEIs56+Uej6oD5Pxb39xNuXPp0b4AlopNSZ174+cGg/xea6Sf1i5F
         bT+rTHYfW9cAtwNq9vK+zmktfxV7D0+aGUcFBicvcQXEuO/tsIj6/rVZZb7Kxu1h/zJz
         ku8A==
X-Forwarded-Encrypted: i=1; AJvYcCXUksL2rJNw7fZVhB3HLmWHX8/Rv0ckmqtL9EngJWZdZPUhNHAzFDQG+rfpnsZhLSYwf+cYFY76Kg8eneA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdwm/qA4px2creyQg1ker3+XICMHYzinNzdzCVV726kcvHO/X
	/KPC+lvx2WmRVmrVZPkEFedU3wh/T9cbG36upHrjmtx/jlrBOQv8A6VnQw==
X-Google-Smtp-Source: AGHT+IF1qytLppvDchMO5lIenFDb6wH9CV0iotnj0pfq/GDgQCHL3wX2LPx9GUfLCY26Hw0i92GblA==
X-Received: by 2002:a05:6a00:80f:b0:714:2d0d:8a90 with SMTP id d2e1a72fcca58-7174578b8f3mr10345475b3a.9.1725425379838;
        Tue, 03 Sep 2024 21:49:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778542183sm708581b3a.89.2024.09.03.21.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:49:39 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/22] Input: sparcspkr - use guard notation when acquiring spinlock
Date: Tue,  3 Sep 2024 21:49:37 -0700
Message-ID: <20240904044938.1049843-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that locks are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/sparcspkr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index 20020cbc0752..5de59ae90c67 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -69,7 +69,6 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
 	struct sparcspkr_state *state = dev_get_drvdata(dev->dev.parent);
 	struct bbc_beep_info *info = &state->u.bbc;
 	unsigned int count = 0;
-	unsigned long flags;
 
 	if (type != EV_SND)
 		return -1;
@@ -85,7 +84,7 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
 
 	count = bbc_count_to_reg(info, count);
 
-	spin_lock_irqsave(&state->lock, flags);
+	guard(spinlock_irqsave)(&state->lock);
 
 	if (count) {
 		sbus_writeb(0x01,                 info->regs + 0);
@@ -97,8 +96,6 @@ static int bbc_spkr_event(struct input_dev *dev, unsigned int type, unsigned int
 		sbus_writeb(0x00,                 info->regs + 0);
 	}
 
-	spin_unlock_irqrestore(&state->lock, flags);
-
 	return 0;
 }
 
@@ -107,7 +104,6 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
 	struct sparcspkr_state *state = dev_get_drvdata(dev->dev.parent);
 	struct grover_beep_info *info = &state->u.grover;
 	unsigned int count = 0;
-	unsigned long flags;
 
 	if (type != EV_SND)
 		return -1;
@@ -121,7 +117,7 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
 	if (value > 20 && value < 32767)
 		count = 1193182 / value;
 
-	spin_lock_irqsave(&state->lock, flags);
+	guard(spinlock_irqsave)(&state->lock);
 
 	if (count) {
 		/* enable counter 2 */
@@ -136,8 +132,6 @@ static int grover_spkr_event(struct input_dev *dev, unsigned int type, unsigned
 		sbus_writeb(sbus_readb(info->enable_reg) & 0xFC, info->enable_reg);
 	}
 
-	spin_unlock_irqrestore(&state->lock, flags);
-
 	return 0;
 }
 
-- 
2.46.0.469.g59c65b2a67-goog


