Return-Path: <linux-input+bounces-5850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A095E21D
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 07:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E011C212A7
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 05:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F76E3839C;
	Sun, 25 Aug 2024 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYEq9zvh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59C44AED1;
	Sun, 25 Aug 2024 05:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563802; cv=none; b=TOqJ5d13JOa5DH3mmwM4WbOeCMx3Hhnf5++q42WslIHSqO/0xyUutlY3qTbJmIH25962oojcrD9JejoKWnn9K3U5pZ780Ee5m/GZnVz5ceeHxmXpYx7F65/Qhs0WBzCHLDSN+CyQ6Mtlfd1RUUWqr2omO1oL0FaUi0ArcE4kqyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563802; c=relaxed/simple;
	bh=3sLepJVo3EqHOaPhR6HKH/1S8UXr492eMHGBSFMTFBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iB/orbYSYDBIxrwP6U86l4guAqawKSY6F/FRyZc8bCm62mQsp4F4eRrmhS1f0KipQg1SdTBaMd3almtHtM0xwcFu8u4b0ICqo+mZ1W8XaD30NPZ9kvZYRbL7dqtVg3UxmpGeESPSmvmVbNABRtKLSRAvwb1J9u0yn6Yixdp5a2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYEq9zvh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7142014d8dfso2602461b3a.3;
        Sat, 24 Aug 2024 22:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563800; x=1725168600; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jesHZoy1LOpL1fJ5vhOWLHbOQxcrszMI3SL25m9QCtY=;
        b=JYEq9zvhHCRaa5/bXlHPg6GGoQJp6FAySUEMqQsvsxOtbV8oc7dAdpa/q/OtIn6u0y
         iPF5wsbHgHxiwy7UE1vFPP7mkqiUcOYI2t/VFUpSP4zViYb5w/jQJsIEh/VtIuk3kzqA
         uz16PakfildSfVHXE054BscpDi3KtOz3DCTbSSbHiRLGIaBFVzExlSt3pxwkouR4JZqj
         Z3EkzjPshBzHWuSHQKAl6/csaKnC4VES4o79ubjDQ+6pfavbyjydd+HswvRZhNCsBQG2
         jgEZuibnhObzN9ly8kwxtBtlliZgjk8ppeQn/QNufEjl7WVDlXLJNJ/yadgpJ6X5wG4H
         qCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563800; x=1725168600;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jesHZoy1LOpL1fJ5vhOWLHbOQxcrszMI3SL25m9QCtY=;
        b=ewbh813xJm/i3QdZigKv+s3yyDnBP54K5UvpuIceGPih22NwhqGa15Ww84ASXM/nUA
         GA0ZhSm/nlekMeF1wHy/Wf2+8X7HUJkDL4F0dv3qBYMQu49VVjzXhgoHPdMU376bSl8g
         vSzPYVk6M6UvVrSYC5YC0ZlohWBqd1jgiFw56INjKITV8B0wPVt3Jr7qZNuqYdsgXHpM
         YKMwcfBIqhs+hOqhBc9rqOFwdBgLTKpIcFTD6YqZp9xoPGSRF5PoWpLrsfkNXZ86Dadr
         Evci0Nirko9NXBiI5UViZeoVgrdIZElUDr8yiOJRbTWZr1wmfl2vd1itZzsKhpDWFE7Z
         9DWw==
X-Forwarded-Encrypted: i=1; AJvYcCVdi6HPWJlWLq9wXpQkCjGfKV0dIgXeUixobv0gvpKaGrflWPp7rnpycAc+/cTIPJp7bRUckmY6Wr4Bt+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YygGw4hrnFeZcybfgge5MWkdD77lWAbg07Jmm7Pali/nQPIvxKH
	XKk+n12Q6VqpmGuYr39YOFTH4UNdpZMCEfQ4yQUjbv7XxF0OcfyM+4tcfg==
X-Google-Smtp-Source: AGHT+IFsrfZKz/3CfggQk6tMGLgjkd+AUMQAuQ5fux4zBwByt6AAWs7vOdYBZ92GW2bIOTP9wxw0Pg==
X-Received: by 2002:a05:6a00:1990:b0:710:7efe:a870 with SMTP id d2e1a72fcca58-71445dfe700mr6513016b3a.19.1724563799637;
        Sat, 24 Aug 2024 22:29:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71437356737sm5176419b3a.94.2024.08.24.22.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:29:59 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:29:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Henrik Rydberg <rydberg@bitmath.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: bcm5974 - use guard notation when acquiring mutex
Message-ID: <ZsrBVO2w9WwX73iU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/bcm5974.c | 35 +++++++++++++----------------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index 10a03a566905..dfdfb59cc8b5 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -834,13 +834,11 @@ static int bcm5974_open(struct input_dev *input)
 	if (error)
 		return error;
 
-	mutex_lock(&dev->pm_mutex);
-
-	error = bcm5974_start_traffic(dev);
-	if (!error)
-		dev->opened = 1;
-
-	mutex_unlock(&dev->pm_mutex);
+	scoped_guard(mutex, &dev->pm_mutex) {
+		error = bcm5974_start_traffic(dev);
+		if (!error)
+			dev->opened = 1;
+	}
 
 	if (error)
 		usb_autopm_put_interface(dev->intf);
@@ -852,12 +850,10 @@ static void bcm5974_close(struct input_dev *input)
 {
 	struct bcm5974 *dev = input_get_drvdata(input);
 
-	mutex_lock(&dev->pm_mutex);
-
-	bcm5974_pause_traffic(dev);
-	dev->opened = 0;
-
-	mutex_unlock(&dev->pm_mutex);
+	scoped_guard(mutex, &dev->pm_mutex) {
+		bcm5974_pause_traffic(dev);
+		dev->opened = 0;
+	}
 
 	usb_autopm_put_interface(dev->intf);
 }
@@ -866,29 +862,24 @@ static int bcm5974_suspend(struct usb_interface *iface, pm_message_t message)
 {
 	struct bcm5974 *dev = usb_get_intfdata(iface);
 
-	mutex_lock(&dev->pm_mutex);
+	guard(mutex)(&dev->pm_mutex);
 
 	if (dev->opened)
 		bcm5974_pause_traffic(dev);
 
-	mutex_unlock(&dev->pm_mutex);
-
 	return 0;
 }
 
 static int bcm5974_resume(struct usb_interface *iface)
 {
 	struct bcm5974 *dev = usb_get_intfdata(iface);
-	int error = 0;
 
-	mutex_lock(&dev->pm_mutex);
+	guard(mutex)(&dev->pm_mutex);
 
 	if (dev->opened)
-		error = bcm5974_start_traffic(dev);
+		return bcm5974_start_traffic(dev);
 
-	mutex_unlock(&dev->pm_mutex);
-
-	return error;
+	return 0;
 }
 
 static int bcm5974_probe(struct usb_interface *iface,
-- 
2.46.0.295.g3b9ea8a38a-goog


-- 
Dmitry

