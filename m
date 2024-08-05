Return-Path: <linux-input+bounces-5320-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AD947281
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 02:45:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9781F20F56
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 00:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14CD2A1CA;
	Mon,  5 Aug 2024 00:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDwBy7MQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721AF23AB;
	Mon,  5 Aug 2024 00:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818708; cv=none; b=ZIaCEGxLd+O562Ik+915MGbjAcad0Nopgd22XJ1Jor1WxEOb0wI52d6WbqXwf54W8uDTgdos6MQx/CsokboSO3cjhyYB9eK1jAJN6XYH2UiMYnZ/Jp1ZBtc4a862NrL5D+KjfAhFui0TjNw1RIDqh9m6UhQB7uqeERFByjH44Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818708; c=relaxed/simple;
	bh=NVAt8QzH6LN78Y7bgJg+NONzxNvYYkm1dX9mEDIYW1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPrRwnO5fuSZEvBd+edZR0o/MGBMv/9Dv5+JLyowaR13KthSdQn0cXwUjtveqohVn6GcLIiWLZnzXOJGV7HJxFRDLBd/dIwGKsKIK65Q9vAy8WOyY61JEdgLRinfXNuD2iR1uzw7/m1a5lvsWBEtFdC1TsuR4/rVbx5+3HQ7IKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDwBy7MQ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2cb57e25387so7579727a91.3;
        Sun, 04 Aug 2024 17:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722818707; x=1723423507; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/T72/HgCQ9HZvJyHpdL8MOMLhTV/SiSFiIaMQu4P98=;
        b=BDwBy7MQiWoqRE4mm0F3WoVyB3Yu0PggXxdUz0gDuULWlnfQFRxinOhTLXW4hlGtyS
         DfySuZjK8SiLG9i1OmBuMwAVTwy3GnPRAaQMSgbmszMi3j1R1h7w5etyd1tbWqr73G2b
         ABufYeQTDCksCOWbQDbUMPr+gRXfPbLVwQyP2dPcrNAhkXHWphXJa2kSdb8Ph/D12TdN
         Jer/mcj/XkGOYHzmCw7HyWzE02/XMkSG5cCcCATWVVKbAg+ppGW6B8Bygp2ndMI7K+Bv
         gP1Fa7csRAxgPSBSukRge1b5jAHl7qlP2N65qjFJbyzRrY7cuWVVlB7fZFQRSGa1Rnsu
         6m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722818707; x=1723423507;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/T72/HgCQ9HZvJyHpdL8MOMLhTV/SiSFiIaMQu4P98=;
        b=KupEwymjo3BsXXx/FFgc7ekIWq37sMvc/H4FWU81y1X43Lvva3amE4iDZKXoV4aTJn
         j7Mvf9rDKUs6LT51Vj+U6IkiE3vU2evVxO4grFvKfCv40QzcMH4wYeZ1QtjWAClrc8Zl
         jSwjki9laBjFvfAHE10v9YRz0WLesc1HVX0voiPBfKwbeX7ezQmLEencixsm/ZrqWXem
         9JeZHyrT7Ef/T21hhihEojkGgCra7WQ08f7VWzqUc2bmlvVU3VJ2wTMhEj3zkzAz4mW4
         jlU9m4mFBGjJAvmOxZYZHi9c+6bvXaPO7znr9dUzJkUQUlMAvHLvLGN3XX3LuLMgZj8h
         d6LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNA55TqXiEEawLc5ZxaCw3820StYXhPSnGJmP+6xInpWaKOl3r0wPfaCRhm683GsoSaRAUDY0EDnLaz14634ol/5GRcmkQMqRnV7j6
X-Gm-Message-State: AOJu0YwF/ROeTKkrKN0XP7o9AydhzePoXsLnbQQUNSuJBvwsuHopGMXa
	QGaQoIdHw1u2ITXDK0TNmepmNHix7TxQpqtZr/RRtrAtyYwmhpEdiIsOFQ==
X-Google-Smtp-Source: AGHT+IGfzKJIYcEprsm4A0eERIA3wLZPoJKd00ZXHqLAacua77aYElmEw8Zhr4hDKqUvvv3B7m11oQ==
X-Received: by 2002:a17:90b:164d:b0:2cb:3748:f5ce with SMTP id 98e67ed59e1d1-2cff9445528mr13770846a91.10.1722818706566;
        Sun, 04 Aug 2024 17:45:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf96996sm5695845a91.16.2024.08.04.17.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 17:45:06 -0700 (PDT)
Date: Sun, 4 Aug 2024 17:45:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyttsp - use devm_regulator_bulk_get_enable()
Message-ID: <ZrAgj9rG6oVqfdoK@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The driver does not try to power down the rails at system suspend or
when touchscreen is not in use, but rather enables regulators at probe
time. Power savings are achieved by requesting the controller to enter
low power mode.

Switch to devm_regulator_bulk_get_enable() instead of separately
requesting regulators, enabling them, and installing a custom
devm-action to disable them on unbind/remove, which simplifies the
code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/cyttsp_core.c | 38 ++++++-------------------
 drivers/input/touchscreen/cyttsp_core.h |  1 -
 2 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 3e77cca4f5ca..b8ce6012364c 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -614,17 +614,14 @@ static int cyttsp_parse_properties(struct cyttsp *ts)
 	return 0;
 }
 
-static void cyttsp_disable_regulators(void *_ts)
-{
-	struct cyttsp *ts = _ts;
-
-	regulator_bulk_disable(ARRAY_SIZE(ts->regulators),
-			       ts->regulators);
-}
-
 struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 			    struct device *dev, int irq, size_t xfer_buf_size)
 {
+	/*
+	 * VCPIN is the analog voltage supply
+	 * VDD is the digital voltage supply
+	 */
+	static const char * const supplies[] = { "vcpin", "vdd" };
 	struct cyttsp *ts;
 	struct input_dev *input_dev;
 	int error;
@@ -642,29 +639,10 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	ts->bus_ops = bus_ops;
 	ts->irq = irq;
 
-	/*
-	 * VCPIN is the analog voltage supply
-	 * VDD is the digital voltage supply
-	 */
-	ts->regulators[0].supply = "vcpin";
-	ts->regulators[1].supply = "vdd";
-	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(ts->regulators),
-					ts->regulators);
-	if (error) {
-		dev_err(dev, "Failed to get regulators: %d\n", error);
-		return ERR_PTR(error);
-	}
-
-	error = regulator_bulk_enable(ARRAY_SIZE(ts->regulators),
-				      ts->regulators);
-	if (error) {
-		dev_err(dev, "Cannot enable regulators: %d\n", error);
-		return ERR_PTR(error);
-	}
-
-	error = devm_add_action_or_reset(dev, cyttsp_disable_regulators, ts);
+	error = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(supplies),
+					       supplies);
 	if (error) {
-		dev_err(dev, "failed to install chip disable handler\n");
+		dev_err(dev, "Failed to enable regulators: %d\n", error);
 		return ERR_PTR(error);
 	}
 
diff --git a/drivers/input/touchscreen/cyttsp_core.h b/drivers/input/touchscreen/cyttsp_core.h
index 82ea611d70d8..40a605d20285 100644
--- a/drivers/input/touchscreen/cyttsp_core.h
+++ b/drivers/input/touchscreen/cyttsp_core.h
@@ -122,7 +122,6 @@ struct cyttsp {
 	enum cyttsp_state state;
 	bool suspended;
 
-	struct regulator_bulk_data regulators[2];
 	struct gpio_desc *reset_gpio;
 	bool use_hndshk;
 	u8 act_dist;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


-- 
Dmitry

