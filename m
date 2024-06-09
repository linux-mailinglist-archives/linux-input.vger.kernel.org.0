Return-Path: <linux-input+bounces-4280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D082F9018CB
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:48:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BAD62812EB
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B07855E53;
	Sun,  9 Jun 2024 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTj9bEn7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99C55887;
	Sun,  9 Jun 2024 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976884; cv=none; b=paQ/P8IDq0LQaoKfoK69rVaHM43vGZ9+SoOBSsOoVx3SPLk5baMJIWizEHkxQh9uxemt3F1SNpV7VUpPX2qdmIjq3XYstvE5PwPpKqZ8Y2Pf3aqal8qcWoe8MzEbX5ArGIBuvYVTDGnDoIF10p4luOjwi9kmzvDa9POlksnG4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976884; c=relaxed/simple;
	bh=zvDKQky/gJVq8mZ1HWHxNL6OK0wlZ284LRRqlfST+Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwblNETeyuWCIh7kcWM5/abVS3F4sCX03ow0fsFYUrQgnbN4teGt2dwk6s4Xbdr5YXfRcZk01bzNjxwWMf4BZZEz7LQp2BfiQYUBLgkUFnkovDGckCAh8qvkyB1Y54/0H8nH1AZXc/Q/XHXkiafmlsDuRQvLSyYdzM0h9N3brqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTj9bEn7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f692d6e990so37150025ad.3;
        Sun, 09 Jun 2024 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976882; x=1718581682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESRWO3dPAZdUCyys+3d5Nvuhh/WrCGmtkacdd4dJmJ0=;
        b=JTj9bEn7dSmhTnd1WrIzTc6bX1xow54wNZNraHaOOAzK0abKt3pYGygIRoTID1gK0f
         jF0UIeiIvtQUoNKKZwXsB/C0mnqDYSDhcl4HsVT2Dw0bHMNd4nQpx0kf1Cp1TR6/+8cd
         tHibziImPY87ysW574r6KpM/T/TxcIuPbeOHVDV58hoS/z1XSH4xpN6TM3b1Z2zvJ6JI
         zrALumM4Fye0DRz9ThwsJ7uU5rHKcPZ8OqGmRMXVpCGRVDr2CrKh4mu8Ea3B9sGokibj
         w8JG2T8vC27fv9qG6R3aWmgnGfOJEsP8EQCGlWe4AImPnWNhv5hEws6ji9Z2f6OXdigb
         bFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976882; x=1718581682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESRWO3dPAZdUCyys+3d5Nvuhh/WrCGmtkacdd4dJmJ0=;
        b=GRXKblVkCn5DbSP3wGlVjLeOepHnvSF5Y171I+oNRuXDXG15xlKluMtmZFw2BK1Bdd
         9O0jBfDnoklezNQHj+04R2oLSsNix6Y6+E1T1S5QPDagvytxA4FBvTEA1BmXZd1JMUcy
         CXMigJbfQ7a68t4LRkve9eH6DqCH0IyqwOgCk2THUoYCLgEusITSqOijmRK2c4Pb6mDW
         RsDPWl39yAXjA3gqesKghZ7PjVtyfshLRJXCnmVRtv0Ge8v5kZSkn2xIEN3Xqs27m8as
         XHWWurdmYlYxGvdxm9yCtOLDU+oHKRXHDYrHwXww5v94QfRgb17JHU8yhu+6SCvHXpPN
         gE/A==
X-Forwarded-Encrypted: i=1; AJvYcCUEgqo9FV7fu9EXXlgwdX+M1eRZREFRPQ5RsEkIVdPKQHyNJweEWcGWlgaubW+KSVm3DeWXTr2jCbNZV3sfttMktX/RzYs0W+yHGEwG
X-Gm-Message-State: AOJu0YwA72ZxE9Ll9lCfglUErq1bLNOmO8lLxnnYcEM4ItAPmSLYOy6R
	KloEuBgviSBQiQDfLBMwPzW8AE85vGUdFrqHkAjG6FLfc0PeIPJ3GxN2hg==
X-Google-Smtp-Source: AGHT+IEvQGt9QDVqOnSQxCliYkS1C6WoHxq8x0LA3w/BR2RqEF4yuCOIF8IPLKHNbPj66f88DRZ6mw==
X-Received: by 2002:a17:902:784f:b0:1f4:ac10:3ede with SMTP id d9443c01a7336-1f6d02ddc29mr69922275ad.21.1717976882099;
        Sun, 09 Jun 2024 16:48:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f84dac28sm27503285ad.158.2024.06.09.16.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:48:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Marek Vasut <marex@denx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: ili210x - use guard notation when disabling and reenabling IRQ
Date: Sun,  9 Jun 2024 16:47:55 -0700
Message-ID: <20240609234757.610273-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
References: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 55f3852c8dae..4573844c3395 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -860,19 +860,17 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	 * the touch controller to disable the IRQs during update, so we have
 	 * to do it this way here.
 	 */
-	disable_irq(client->irq);
+	scoped_guard(disable_irq, &client->irq) {
+		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
 
-	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+		ili210x_hardware_reset(priv->reset_gpio);
 
-	ili210x_hardware_reset(priv->reset_gpio);
+		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
 
-	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
+		ili210x_hardware_reset(priv->reset_gpio);
 
-	ili210x_hardware_reset(priv->reset_gpio);
-
-	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
-
-	enable_irq(client->irq);
+		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+	}
 
 	return error ?: count;
 }
-- 
2.45.2.505.gda0bf45e8d-goog


