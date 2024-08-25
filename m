Return-Path: <linux-input+bounces-5841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC695E1FD
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69ED41C21571
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD63384A40;
	Sun, 25 Aug 2024 05:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQv5yTJY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4706382899;
	Sun, 25 Aug 2024 05:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563015; cv=none; b=qQXXQ2qcE+sFE7HK+KUtx6Ep/8MUnXhvm+s8G5L6ptcwv7pioLIUxOkg3ZvzcaAhzODPJ8iCAWDDO7hBZDfsocByJqC2rN9oFnGX29IL5EryKFeOYTd2FeikP4ZZcLlW+jy8nm4lSDxY+LAV6hi8ynQEwo3tJmBr4wd770tIzeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563015; c=relaxed/simple;
	bh=t69M2XHLck0t1pHwwBsDi+zgTTfrFl42KdqvyDwMG1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpjsb4qk9vK/TvMilJf+fPAD3ILrzI7wO4aKGew8RxYpq5h3p9VcCavz6wYW4R6A3ZF5cJdUByUSq2PJLk0vTZ+eEWwNQi6Qk1qw43SaRQ4QSLHTJL/INejJ7M/aakpmqyafq7wZpWVXdUkGCaBrTxHUJNZhEO4n2NL/NZd/Et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQv5yTJY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7143165f23fso2467553b3a.1;
        Sat, 24 Aug 2024 22:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563013; x=1725167813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9zYR0W/Xjhx97slmPTim4xkiDUhOUV5BM1jCImN77U=;
        b=UQv5yTJYa62HeYiH+RLBIZsLnZP79q2INDdxPt9NiRa9jWT1nblCIHnpRaXxK79dwW
         WaRt/CrMelLBFEy5DJudHXGkwm5lbY4RQBxNnubz49sknRx7puEvZdcwn6O/ymZcTu3B
         JPTGfwQk5eBruSp5AjgEAMzV0kKYLy7vfuUmhJLcwrPBrcN4Jyy+1czvMyQ0txUKmmMg
         yJ/LUrXlK6yfbxA4JqJnpKlej3kfjcRIdcJiypJXxdr0Dy0uQll/VLQS3wJXLuP6MC47
         oqiemt2NpBiyKhcR07x2wm8WYQ27kzPl/flZgT98NywoYcv2HbDF/779v72dn1XJQget
         vc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563013; x=1725167813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9zYR0W/Xjhx97slmPTim4xkiDUhOUV5BM1jCImN77U=;
        b=kR+Bz3SI2RUsLdxG/WYVYPrT2+g/TcjHm5Ko9tHNYVltOc3KO6YpNQ2F5GkzBr6h0P
         qA22hjrbkGDd3DLRLidsuYsmBHSbKsEoNnkMx7LHOuWEc0Y/dpRlXXh4RKWBi7ZoNoNv
         IqkTrnIb39HVsVM52g1BLUU7OkpZPOvk0P24hL0oD1PtiwhsLbMVFQq1saKi4SybOIa4
         9xcrEKNqjNYYjV/Y1XzSCJ1kajPLx0vcKM11j7h/tUoeLTA6ZYHJfiM6okXBAGDUxPaT
         ZwCUTqlxgCrW30qH6bT+7n6SXOj9YV7gijTR7X4/WfpWOlBUQEZOxvHFf1Zhy/9mwrao
         YTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTNE6SRB4eAHxWX3qXia4uP+ZV1JV2YCmytPlE+vwhg11nLkM2HBCHzTOpEa/8ojvlSIwCTDwqm/y+6SY=@vger.kernel.org, AJvYcCXRvMrMvTfQ8UpyOoBhHo5/55M9Az60jHQq/ol+UJp/+9mpy5SSSKPTmf88/a+rBZMg6JkuSHtnUojrQSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9uGuOgJYRtQ8HoMCkgYO9xVxwN3pGDjx5hFy3+r/kNeUGTzqI
	AWZrgGkvQOlhi4Dz+o3tA+jDShlTybI7qmwY5wVHNi9icolBZuBE8vGUew==
X-Google-Smtp-Source: AGHT+IHcuT4NA41j3BiOlgdyA7A3m2CkwtxDOGLO51Pqdelg8y5qs9HsGoezNmvzuRmb2+38RG5t8A==
X-Received: by 2002:a05:6a00:18a1:b0:70e:8e3a:10ee with SMTP id d2e1a72fcca58-7144587e2dbmr7640487b3a.21.1724563013105;
        Sat, 24 Aug 2024 22:16:53 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:52 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 11/17] Input: matrix_keypad - use guard notation when acquiring spinlock
Date: Sat, 24 Aug 2024 22:16:15 -0700
Message-ID: <20240825051627.2848495-12-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 7a56f3d3aacd..bd763d704306 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -158,18 +158,17 @@ static void matrix_keypad_scan(struct work_struct *work)
 	activate_all_cols(pdata, true);
 
 	/* Enable IRQs again */
-	spin_lock_irq(&keypad->lock);
-	keypad->scan_pending = false;
-	enable_row_irqs(keypad);
-	spin_unlock_irq(&keypad->lock);
+	scoped_guard(spinlock_irq, &keypad->lock) {
+		keypad->scan_pending = false;
+		enable_row_irqs(keypad);
+	}
 }
 
 static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
 {
 	struct matrix_keypad *keypad = id;
-	unsigned long flags;
 
-	spin_lock_irqsave(&keypad->lock, flags);
+	guard(spinlock_irqsave)(&keypad->lock);
 
 	/*
 	 * See if another IRQ beaten us to it and scheduled the
@@ -185,7 +184,6 @@ static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
 		msecs_to_jiffies(keypad->pdata->debounce_ms));
 
 out:
-	spin_unlock_irqrestore(&keypad->lock, flags);
 	return IRQ_HANDLED;
 }
 
@@ -209,9 +207,9 @@ static void matrix_keypad_stop(struct input_dev *dev)
 {
 	struct matrix_keypad *keypad = input_get_drvdata(dev);
 
-	spin_lock_irq(&keypad->lock);
-	keypad->stopped = true;
-	spin_unlock_irq(&keypad->lock);
+	scoped_guard(spinlock_irq, &keypad->lock) {
+		keypad->stopped = true;
+	}
 
 	flush_delayed_work(&keypad->work);
 	/*
-- 
2.46.0.295.g3b9ea8a38a-goog


