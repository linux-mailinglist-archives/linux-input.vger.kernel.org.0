Return-Path: <linux-input+bounces-6148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 728A396B01F
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C3162866BA
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA0B824A0;
	Wed,  4 Sep 2024 04:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUQOagCW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E381AC6;
	Wed,  4 Sep 2024 04:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725425346; cv=none; b=GWs2Ip9AFH1wJwWJcjmmzbKeoIfKi9ZlW0whEpFyAxCGuCeKahGMRlqXkSf1IhiJLYW+W3gSqr0vwfBjJqK4bg9f5zav8XDPsE3KgBRVwIaO6s6Qx1SwevQIMda656BLqt4z6XKotTzR/9oZ66+vasDT2T5aspp+NthcnmHzpqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725425346; c=relaxed/simple;
	bh=6H2O+hymwVqCkSxF4BNUpyqoY9L8X4Xll/N219fJmT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JADgHig4QZTeVpKOT8zW+1GhWtBBvVDf9OfVAxTik9ahviv9kb7cMtIdiFlyxMZfE18wyHkKr1+kJezvMX9HUnruqY+jqZcgBJlwMzF85kulH3U+ei900fKykE4l3GeywZbD/WWklJw1t9jJgIM6zW0pbN1MzDpp4mmvzxiaK3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUQOagCW; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7c6b4222fe3so4035216a12.3;
        Tue, 03 Sep 2024 21:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725425344; x=1726030144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcGffBkg5gfBz41muJc+ok399PNqaO5iRm+4RBz3HMU=;
        b=jUQOagCWUCFBQaTNWChTAEarSzR3OxVkNgB7je/tPlJ/qLTJdJhls/l5J29oBu/Y2J
         4CzgkoF+yXgjWQbsxRxPkYJmO9cjFdpNygSeZBQHWm/74ISdrajhIiilbEKV1xH1oSf6
         gnJU36qf7ZBbzU9qhkaGwk23ae2OgZcKlimM/10Hne3BPkROyhohIbo4chHhwHeeYsqB
         RfD0397jn4o5w9YBzVMMcv0l363Tn8nNRBBmaIXZrx6fqYjemy7Oa28U9uszB2z+O1/j
         Uu6Lmyo6EZCN+Evr6JSllp3DZIYfiCz0/E6Bnx9MfZhvaRajs/ETrS5sL81PHxTyk9Lf
         DgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725425344; x=1726030144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcGffBkg5gfBz41muJc+ok399PNqaO5iRm+4RBz3HMU=;
        b=F8yTcOCcDBt3xywUnP4x8oVjRo+3Bx3eihIt9qDeUDak+cL2vWvU0xfnAir4yqsGjb
         CMFaZQfAD37WYjl0hXr9h8HF6IEfzZJ7WLLfHW39pPJdZpyfyRCL8p2hUzda6eeLp7EL
         cF2BZfVeE8YNpmT7HN3hDQMc+UCTZz80nveXVfird9RErALgUEvGM6qO22lsLAjH+p56
         TJbQ4Xm5QYHG9fSBFCaCJQgwXugAkc/9pXQCHwgYDJbG+6FbkgX7mG9Np/6clw7E5xuU
         9g+xKE2CDt6giuqZhWoCu6M8sSEYVCH9TFiUwu8Rzygdy2dGC0a+hUGhoHWiEjX5POHy
         Qwvg==
X-Forwarded-Encrypted: i=1; AJvYcCVCFS+Tx/h27QO5hBb9+Z2RRibfsYv636jlQ+XtC8/Tx61ov0l7xpjdeifYhYVbexNKlcDEqNTUYBCTUyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LWPLrb+uX0e4L7qbod9hfhUeCEOA0aCasUWd3m0jKjInPx7r
	L3EBVCyKeFl7Hb+9WyH7PXJ4CBZF8+O2l/+IB7pD2Z7gXJaP8zxaOU8MYQ==
X-Google-Smtp-Source: AGHT+IErqCaBS207q6JPA9qp9bojr6rVBoZ9wVsgoquhlnGBD+lWPn4JgjSt08cHAwMFXSCSLgxUGw==
X-Received: by 2002:a17:902:f650:b0:205:5de3:b964 with SMTP id d9443c01a7336-2055de3bbe9mr75798305ad.5.1725425343757;
        Tue, 03 Sep 2024 21:49:03 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392cdsm5727045ad.156.2024.09.03.21.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:49:03 -0700 (PDT)
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
Subject: [PATCH 18/22] Input: powermate - use guard notation when acquiring spinlock
Date: Tue,  3 Sep 2024 21:49:00 -0700
Message-ID: <20240904044902.1049017-1-dmitry.torokhov@gmail.com>
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
 drivers/input/misc/powermate.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index 4b039abffc4b..ecb92ee5ebbc 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -194,22 +194,18 @@ static void powermate_sync_state(struct powermate_device *pm)
 static void powermate_config_complete(struct urb *urb)
 {
 	struct powermate_device *pm = urb->context;
-	unsigned long flags;
 
 	if (urb->status)
 		printk(KERN_ERR "powermate: config urb returned %d\n", urb->status);
 
-	spin_lock_irqsave(&pm->lock, flags);
+	guard(spinlock_irqsave)(&pm->lock);
 	powermate_sync_state(pm);
-	spin_unlock_irqrestore(&pm->lock, flags);
 }
 
 /* Set the LED up as described and begin the sync with the hardware if required */
 static void powermate_pulse_led(struct powermate_device *pm, int static_brightness, int pulse_speed,
 				int pulse_table, int pulse_asleep, int pulse_awake)
 {
-	unsigned long flags;
-
 	if (pulse_speed < 0)
 		pulse_speed = 0;
 	if (pulse_table < 0)
@@ -222,8 +218,7 @@ static void powermate_pulse_led(struct powermate_device *pm, int static_brightne
 	pulse_asleep = !!pulse_asleep;
 	pulse_awake = !!pulse_awake;
 
-
-	spin_lock_irqsave(&pm->lock, flags);
+	guard(spinlock_irqsave)(&pm->lock);
 
 	/* mark state updates which are required */
 	if (static_brightness != pm->static_brightness) {
@@ -245,8 +240,6 @@ static void powermate_pulse_led(struct powermate_device *pm, int static_brightne
 	}
 
 	powermate_sync_state(pm);
-
-	spin_unlock_irqrestore(&pm->lock, flags);
 }
 
 /* Callback from the Input layer when an event arrives from userspace to configure the LED */
-- 
2.46.0.469.g59c65b2a67-goog


