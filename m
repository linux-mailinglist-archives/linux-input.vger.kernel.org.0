Return-Path: <linux-input+bounces-4980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7892EDBB
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 876FD2833DD
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34BF816E862;
	Thu, 11 Jul 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAbgFgw+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194016DEA4;
	Thu, 11 Jul 2024 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718855; cv=none; b=imaEaYB6zUmPvq7BFP9cGXbmdMvDhKlc4wSu0YcH0o1z2pEVj+2ASeo03Ir2V3YiMy4L5XK52bYzwFZqUrhFT2m2ju1AobLapxc/igUZ2HtZROKojJz0qUHipWk4aH3ZxrVzi6Yowbw06ywmInNfoBVAcTyZGT2RG0bLvthg0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718855; c=relaxed/simple;
	bh=g6RvsJvEBelZQYRBsDfESiSGLCnzJsuJi47mQGX69tI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ds3+SYaM22jZfbN+7H9QlklCWMasWFDJFHC4UbenRk9+vTDGnuQfCbGduE3bAkdSmwrbVgjW0IuCvw+oqq1qIGBnMx5VFr5+g/R4U6V0RFXFEOVrjeDADl//KkPFooskh3II4HFAvn/bDKLmjNa2xV2LDaf9emWuIRFgKMhehuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAbgFgw+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fbe6f83957so5802685ad.3;
        Thu, 11 Jul 2024 10:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718853; x=1721323653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BOesuwkLEFmcZ7ZJT5jxAmqXAgpT28qhJPsL9e5Gek=;
        b=lAbgFgw+kQhPAToJqgpuQq/YDUhp29NiwG4c17aqsTt8vNNg10kVTEOJpvDPF1eOJv
         vyoen5tTDlwquWmIBsANwHHYH+PptCuDl/dQGJR+nKfMOqLIHhPanIhlZnuTL4KTXxBa
         xP7FXMNEoisIQkyqAU9t1WjCMPVCi55VyarD+iQu+98cJu/LTyrXt1tBfpHKVRpIg/xK
         CFwbGOzKZFBHwJcGCy8dq7OAi6YUgMg3C+kw0jr1FV0WgDKx3PO0karyVdal8WL54P7J
         tNtQdJA/A9t2kim3zwkMcoMejKSNXVVV4Tu6NyMeCh9fI55AY1UbynMW19JRKFCTEBuQ
         MmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718853; x=1721323653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BOesuwkLEFmcZ7ZJT5jxAmqXAgpT28qhJPsL9e5Gek=;
        b=wrlnBIKBhN6oWpLwYvCEWtNOR9P+z3cDxGkdMcRAaZDp1FOh5Jt3EXC+7rOp8ws+8s
         XdRd1XqcJ/W89beqQg26OQtBwX4L3JOyqO57yY3veOjyVAIx7WCNe8hPFSBBOaClZxb2
         3o/93fZtZqx0GNJxRBzi6LNdH+MP2juOVySDC80ScwczKyTdKCRKU+j9xYoglrwA7Vr4
         3wZHBnN77KgPTM2afFrdP6G7RcC/OaBp6c/sxkYOPk9Nkds6H9vCwQQqugn6jzfVBYZh
         fe0+xRecbE6v0RGqk3E+CbUPBllVvX94kgdrz/G3FoqklQ6fszGyo9KTrff3XTFHhx3L
         B6TQ==
X-Gm-Message-State: AOJu0Yx2IQNphTudWLagxi8hTnzHUgCCwv9lL134OZ3xuN0HSFauplqB
	mp0GbPeiOvTaANifOwqKmwuO0LaLt9rO7c3n9uwxn6yeEgCyMAsGcYk2bQ==
X-Google-Smtp-Source: AGHT+IHZo1R3wkEolk/aOQEV88/4xoSeprWRPeZYVx1grAOHtqrRU82RG481zF+vOAOMw5dtx3mGmg==
X-Received: by 2002:a17:903:283:b0:1fb:8a0e:7730 with SMTP id d9443c01a7336-1fbb6d4b03cmr78219085ad.26.1720718852429;
        Thu, 11 Jul 2024 10:27:32 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:31 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] Input: tsc2004/5 - do not use irq_set_irq_wake() directly
Date: Thu, 11 Jul 2024 10:27:15 -0700
Message-ID: <20240711172719.1248373-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
References: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of setting irq_set_irq_wake() directly in probe(), mark the device
as wakeup-capable, and use enable_irq_wake() and disable_irq_wake() in
suspend/resume path.

This also allows changing the wakeup setting dynamically at runtime using
/sys/devices/.../tsc2005/power/wakeup.

Reviewed-By: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc200x-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index 87e6839c60fa..cd60bba11c56 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -106,7 +106,9 @@ struct tsc200x {
 
 	struct gpio_desc	*reset_gpio;
 	int			(*tsc200x_cmd)(struct device *dev, u8 cmd);
+
 	int			irq;
+	bool			wake_irq_enabled;
 };
 
 static void tsc200x_update_pen_state(struct tsc200x *ts,
@@ -560,7 +562,8 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		return error;
 	}
 
-	irq_set_irq_wake(irq, 1);
+	device_init_wakeup(dev, true);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tsc200x_probe);
@@ -576,6 +579,9 @@ static int tsc200x_suspend(struct device *dev)
 
 	ts->suspended = true;
 
+	if (device_may_wakeup(dev))
+		ts->wake_irq_enabled = enable_irq_wake(ts->irq) == 0;
+
 	mutex_unlock(&ts->mutex);
 
 	return 0;
@@ -587,6 +593,11 @@ static int tsc200x_resume(struct device *dev)
 
 	mutex_lock(&ts->mutex);
 
+	if (ts->wake_irq_enabled) {
+		disable_irq_wake(ts->irq);
+		ts->wake_irq_enabled = false;
+	}
+
 	if (ts->suspended && ts->opened)
 		__tsc200x_enable(ts);
 
-- 
2.45.2.993.g49e7a77208-goog


