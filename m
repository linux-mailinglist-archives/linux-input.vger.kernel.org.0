Return-Path: <linux-input+bounces-7940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC59BFEDD
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 08:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980982832AF
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 07:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE7C1B0F1B;
	Thu,  7 Nov 2024 07:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjxODQR8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3701993B5;
	Thu,  7 Nov 2024 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730963753; cv=none; b=TjtFTglxe86EGHv1XPVz9Q2MYU8LH4QlOrsL3kmZcYmj32mgF+f6LYLmJ0ywhZfqbm/zz/7w9ACV7wZ9rwfPIm/SIfKuByBLZqdYjV2+32NCeyhaTGjsXpKCMyVB0YnpSKNpupcWT8KTLWnOiTUkzgvL9TpsYhmwuvrJyncXb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730963753; c=relaxed/simple;
	bh=L6g45plCb9kOyXyFczhKIRSi/3kWgV6hbUr+X8HZGS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5I1drHZti6+MUH7ft1cZ7/isvOOPPrZICxBMOSxPJTr4BjBJnDcwopqL/G7ANoOQC/7UMxofzhAuKhMQkx4ZJ3Q3TeSO3dguKKFfWuhMrp4pO3mZRXgi88xlwcXHZEz0XwCdwEJJY1S3ghr5FZQQzmdNhxCtrbWjNd0pjy7KSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjxODQR8; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso472221a12.3;
        Wed, 06 Nov 2024 23:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730963751; x=1731568551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qP55KbfcJGjsyuftlPO9tdZ5NIYYO/K9vfzn7T/7FKI=;
        b=IjxODQR8Cz/J9O+K9T6a9iiaVp87g0ClO75XNgKL8Pr0wgmE+nEIZl0b7/VIIPBnXA
         mEXzqWQZef76Sef2tSrkYikixNnwedTnpn4hy0h5csQnW4GBxsOhKZKZ8F/f6qkFfxfp
         vFzR9Ep61q+94lXgXPD7iZhIxns2O+C3e55kDlTganwgylciKjkNGYZ0IXQCvZIjgIkR
         YEXm+6e7pVzVWeSB25mmItB2Y8IoABwQFIkOoQT7s4ji7DKpyoVe0qGetvp19FnI+lQt
         IkjMPUFsWaMckLp0t/8163sZbW+dmCn+IUlak+L/pzjxYcT1ElwR4WXiGA+O9QzY9Edt
         IRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963751; x=1731568551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP55KbfcJGjsyuftlPO9tdZ5NIYYO/K9vfzn7T/7FKI=;
        b=OWx0lVTPUtvzUQpDyoLGo+hM7l4X9t9GPqlfHVh2ATMe9Fyg03cTuI4KzuC87ltTpC
         3eev88DNc4Ziu3Cwl8wDkK09+1fkDDRRTeIl/jL+dgt74pHdjDUUtsbDSyJCIdhViNlo
         1RCxVrWW6XvUKZwBe6rnBCkH781uz4Y4Mt/V1952AyFSb5nVdtHc6tl9XEvBwh+z8iar
         JSh4lYrRRoXKMI/3UV15v8GPlG5bYhHXFvI2fRu0WIZVKoChKqwubNvi5ABXMkJUma7/
         2cgg7hOc5h1jFktylb/CHUKtbXcC6gnpPbUUrYkkO5CKoAsNdhH0JQ1o5vSdUsD95kw4
         8egw==
X-Forwarded-Encrypted: i=1; AJvYcCUl8rgFhXcP0YZdzvw80l7pjZXhPCloKKuQYaVOXJ0De05PWvhQ+6WpIY0FaQp5QEN/5ijkHYQnuHemHUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3k+sF1twqQ46XssMC6ZOANGvEHne84Dy4iJYu7JTI6i/BFdL
	mpnySGMaHSuABUC+4TyRzjHWW1NcPEaGzzX35UrIZbccZZxFO1aN
X-Google-Smtp-Source: AGHT+IHrIIHEGLutXc60xyYKJ42NkDZxEiCObN13Abxkpv+RpPH1uKomQSllc+/Nq36iUiWPGo9+tA==
X-Received: by 2002:a05:6a20:4321:b0:1db:dd9d:cd3f with SMTP id adf61e73a8af0-1dc17b2a593mr181031637.28.1730963750863;
        Wed, 06 Nov 2024 23:15:50 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:e838:5f55:2b1d:de33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e58399sm5703905ad.196.2024.11.06.23.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 23:15:50 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] Input: ff-memless - convert locking to guard notation
Date: Wed,  6 Nov 2024 23:15:30 -0800
Message-ID: <20241107071538.195340-4-dmitry.torokhov@gmail.com>
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
 drivers/input/ff-memless.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
index c321cdabd214..ec99c070a97c 100644
--- a/drivers/input/ff-memless.c
+++ b/drivers/input/ff-memless.c
@@ -401,13 +401,11 @@ static void ml_effect_timer(struct timer_list *t)
 {
 	struct ml_device *ml = from_timer(ml, t, timer);
 	struct input_dev *dev = ml->dev;
-	unsigned long flags;
 
 	pr_debug("timer: updating effects\n");
 
-	spin_lock_irqsave(&dev->event_lock, flags);
+	guard(spinlock_irqsave)(&dev->event_lock);
 	ml_play_effects(ml);
-	spin_unlock_irqrestore(&dev->event_lock, flags);
 }
 
 /*
@@ -465,7 +463,7 @@ static int ml_ff_upload(struct input_dev *dev,
 	struct ml_device *ml = dev->ff->private;
 	struct ml_effect_state *state = &ml->states[effect->id];
 
-	spin_lock_irq(&dev->event_lock);
+	guard(spinlock_irq)(&dev->event_lock);
 
 	if (test_bit(FF_EFFECT_STARTED, &state->flags)) {
 		__clear_bit(FF_EFFECT_PLAYING, &state->flags);
@@ -477,8 +475,6 @@ static int ml_ff_upload(struct input_dev *dev,
 		ml_schedule_timer(ml);
 	}
 
-	spin_unlock_irq(&dev->event_lock);
-
 	return 0;
 }
 
-- 
2.47.0.277.g8800431eea-goog


