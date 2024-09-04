Return-Path: <linux-input+bounces-6126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBCA96AFD9
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 06:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2CB71C21AFF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 04:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB2484A31;
	Wed,  4 Sep 2024 04:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUgCi5J5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0548289A;
	Wed,  4 Sep 2024 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725424280; cv=none; b=bGWASIg1XlNBO9W5SnC+noAQhjQCwhiuLxwyd+85guSZXL214QQ9Zy4rT3uFUA1HEHl0Ii/43Gg34u/6l3CypezxCal4RGh6u63dYJa0SlCXRd3ThUE43ZGJ0X/lwn32NdLE/isKBSANlRApupRMx3VshEBqSZdgjdiBqYnXoeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725424280; c=relaxed/simple;
	bh=r0cxrpq12Wc5JLPO0bEEQNp8b1UwZh2OO5LdZdjrSyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DupWFfUtA8okirmPWXMz9MidWc7CeIanRNSlONPoVJVxEPXEyKxqPrp72LWmY/nLLRZ2yVdVoAUO/JiKM+pt3GFx27hnabZAbh3E9NZOc/7W8DRY2DZERAW8o9GgL2e85F+pwJOVEJ0y1JmGA/fbKlWWHkiN2IKSNR1MDH5kxQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUgCi5J5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7163489149eso4105794a12.1;
        Tue, 03 Sep 2024 21:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725424278; x=1726029078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+gNKYsvHuXnjKEvzIZIgUJ9/UmMPbrYSkvOAUKFKPM=;
        b=dUgCi5J50/Zb+RFh749b3Ny3avbU08tkXDFhlat+VdsNQHAqKAvNkuIuQ4zeT5/HJt
         9SsGFaO2prHnQt3e+81IDiQXbAbTJtlY7dRTOitUVkP8jZm1Y1oDv+ud/7L7b5vnbLX2
         udSJMWC+RzMWYClSCo/uNR5gseptHXdIDbtcsEjmP0zQM1e06Z/IpeD8CXMj/v8YUXAE
         /HHLNKXfUU79v7Sk0fJ+59F27NaasBtF20IfHF04DI64m/c5fkrramKVXKbLvKehzTQz
         VXgDFyTVy1rcbL4/tqC64fwl8HbZou8ZkxplNxWa63/foEwdUupFBrLj5whzx050zWbA
         9e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725424278; x=1726029078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+gNKYsvHuXnjKEvzIZIgUJ9/UmMPbrYSkvOAUKFKPM=;
        b=VTk5o9lVxGZ8hXPb3OK903Ld8X+vuFeHM61rA0LRxXvWpltncUARhDgTES6c6yQhGj
         /l3wQ528hmRbM04t9R36kUxA3iDQeyMVWI60Np/6AQbGNKKTjQPtclZVOH/UTRfFCHpl
         zIkJoYkvQB4yRU7kp+UhdzjUME+3l9Q+PHyrwvfrmYTFjGdqKNWajMwywzVNpKbQGSSQ
         YA+ux4KErSITwH/WpkhLjTXgFy7BoAjZDD5EssqR1fICp6jdbfEdQNuVpLipQHueVO/q
         sxBvJIH6iQiI5yfn4oEX6qp4lkEB+/4J3+P9QlTxDLI0T3eLpshIHtC7pmx4rH+rJnt4
         1yxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSQDUfCVvdnZNdRc3q3R6fp6SI61/no+pu5Y2x+qA31TjLJkZ0NahbZQN94TQTCyQ6Ingx4PVRKb90Wnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6UhHpETdJJvGRv2Ffky8TYkz0Dx2gAwowjrvAzEquGNiwhP/M
	MU/0zPWO2seIFen6qbn9lmLheHUFI99Gps3eXquK4k5UIUxZgjMyw4/aqw==
X-Google-Smtp-Source: AGHT+IFKizNM26PpIpqCOHP9ptn1AvEhZFbz0Y25ZyMu/uNJhRLNs6CGsrZEbrGHhtJjKSTRyFST6w==
X-Received: by 2002:a05:6a20:d04a:b0:1ca:cccd:4a1c with SMTP id adf61e73a8af0-1cecdfe0a64mr13978391637.43.1725424277970;
        Tue, 03 Sep 2024 21:31:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea392e3sm5503555ad.135.2024.09.03.21.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 21:31:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Erick Archer <erick.archer@outlook.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] Input: n64joy - use guard notation when acquiring mutex
Date: Tue,  3 Sep 2024 21:31:01 -0700
Message-ID: <20240904043104.1030257-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
References: <20240904043104.1030257-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using guard notation makes the code more compact and error handling
more robust by ensuring that mutexes are released in all code paths
when control leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/joystick/n64joy.c | 35 +++++++++++++++------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index b0986d2195d6..c344dbc0c493 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -191,35 +191,32 @@ static void n64joy_poll(struct timer_list *t)
 static int n64joy_open(struct input_dev *dev)
 {
 	struct n64joy_priv *priv = input_get_drvdata(dev);
-	int err;
-
-	err = mutex_lock_interruptible(&priv->n64joy_mutex);
-	if (err)
-		return err;
-
-	if (!priv->n64joy_opened) {
-		/*
-		 * We could use the vblank irq, but it's not important if
-		 * the poll point slightly changes.
-		 */
-		timer_setup(&priv->timer, n64joy_poll, 0);
-		mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
-	}
 
-	priv->n64joy_opened++;
+	scoped_guard(mutex_intr, &priv->n64joy_mutex) {
+		if (!priv->n64joy_opened) {
+			/*
+			 * We could use the vblank irq, but it's not important
+			 * if the poll point slightly changes.
+			 */
+			timer_setup(&priv->timer, n64joy_poll, 0);
+			mod_timer(&priv->timer, jiffies + msecs_to_jiffies(16));
+		}
 
-	mutex_unlock(&priv->n64joy_mutex);
-	return err;
+		priv->n64joy_opened++;
+		return 0;
+	}
+
+	return -EINTR;
 }
 
 static void n64joy_close(struct input_dev *dev)
 {
 	struct n64joy_priv *priv = input_get_drvdata(dev);
 
-	mutex_lock(&priv->n64joy_mutex);
+	guard(mutex)(&priv->n64joy_mutex);
+
 	if (!--priv->n64joy_opened)
 		del_timer_sync(&priv->timer);
-	mutex_unlock(&priv->n64joy_mutex);
 }
 
 static const u64 __initconst scandata[] ____cacheline_aligned = {
-- 
2.46.0.469.g59c65b2a67-goog


