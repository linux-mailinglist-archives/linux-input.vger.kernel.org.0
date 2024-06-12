Return-Path: <linux-input+bounces-4318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4884904AE9
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 07:31:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0D41F22A0C
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3E12E417;
	Wed, 12 Jun 2024 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3fyLFvd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3746E22092;
	Wed, 12 Jun 2024 05:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170307; cv=none; b=WPBl5PRWDWdt30bpeNsfj5hyAw6/CAQAjOELBja6sMXzGDHijl/gR0AXO8WvFLIH4y9qbGrKnCOh7+7Tp+aveWwm3gJZb8heZ2+xz7zQACIRHlIt6ZHV+BMAod6DjFQc9RTENtfsWTga0+mMwsK6Ur+YpRU/TR/zCbf8DvHLRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170307; c=relaxed/simple;
	bh=tpXpYk02XunfGAs+UGnMoSZ1SSbgmpeXpxB1InHLaOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i2twsNCuuz1FOvbv8ZplRWpgLDXH8imonDuYVJBKwjPbHyGuehvZLsjcjuoYol/GG4AiEBAK6BnzPweAt0J1LzyIAXbMteRxIWZ6Ci+TlYSK96zNQfiMAtQN9DPHIDlf6AOxo2+EgqCZtXPck0RKLh+q18UHsjvNRmpX3EFv/zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3fyLFvd; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so1214131a12.2;
        Tue, 11 Jun 2024 22:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170305; x=1718775105; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8O4evamKXuWqTPGHIl46sPGNgVHjOBdlOE3EoJxFkw=;
        b=l3fyLFvdMQL+DEEXgAekN8KGpKg958QeDWBs7JUuJJKZ+Or4Sukr9BquwcaNj7psPB
         4eIwzf4XTqAVI2Y8eaK2zWJF+o8JXcJDtHUcnb3KvZutT++NfnsKkCzZ9ZZ4TAQsRXTw
         deEpTpWx6OS595LJgtxWM2i2SXDSwkmYT+Wgnt+gXoGYABlWawhLLhxAcO8zJZlvPz/T
         yZmAKDNzyqP0ZxHz544ipxdg5bmU6gWodHiqHOfwofGnXciaiMageyLKe4igysgP3dzU
         MxCH33ncD1O1MY+F+IWBd5L03JTouRn6ahSE81x730A1EQ4goR9775UflxJHHn40fm14
         k/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170305; x=1718775105;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8O4evamKXuWqTPGHIl46sPGNgVHjOBdlOE3EoJxFkw=;
        b=StLxRuiPczDBsk5eCLy/gH6NI55jcP1NsvF9jvkbH8sioRZ5S4AQNR2Xzf0XIpBfsj
         pPd5jzOBOF9V0/OCQejuDStAQltQCt+zv/Oeu9CTrh/HukWjDCuYgAC34W8KOGIuzyn2
         R2bX4f+zCl2F/JB7jnbVQ8cLdNdSF/JnXWJnhkhgmsoZU17jYeKeZMFOBSmFT9n0/fVi
         ICb/G2T7x9dfQpc3DM/0nJjy5VGiTvP8nVz1ts156eq6cZ1OEGLZANbMuyZRyz0TnAJS
         EAK/StOni0dj0wp4PUWv6DEz7E4b1y1WNQxrJZWdWlhhhsmkkvbuTKM0C39eLH6zBpK0
         3FVw==
X-Gm-Message-State: AOJu0YxATGwyb7RtJxQZRrfMbzsNkD/ih+2IjEYU8WZwlAp8t/GmHBjt
	NlePSZ8q8hTWcbACHriDAU3YrZx3CSk15axOcd/XiCXMwFlI76elDlVyug==
X-Google-Smtp-Source: AGHT+IEPfzLFXMsfONTi2WiTACZo/K5z/KK+5Q1dCTxygk62WcXlzjPYv74Cp7+7k/vZ36JbOUoitQ==
X-Received: by 2002:a05:6a20:841d:b0:1b8:b517:9bf9 with SMTP id adf61e73a8af0-1b8b5179cecmr615437637.25.1718170304923;
        Tue, 11 Jun 2024 22:31:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a75defafsm679440a91.7.2024.06.11.22.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:31:44 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:31:42 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org, Jason Gerecke <jason.gerecke@wacom.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] Input: wacom_w8001 - use "guard" notation when acquiring
 mutex
Message-ID: <Zmkyvkr9AFyywy1V@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch the driver to use guard notation when acquiring mutex to
have it released automatically.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_w8001.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_w8001.c b/drivers/input/touchscreen/wacom_w8001.c
index c8abb9557ee8..ed2ca8a689d5 100644
--- a/drivers/input/touchscreen/wacom_w8001.c
+++ b/drivers/input/touchscreen/wacom_w8001.c
@@ -380,30 +380,28 @@ static int w8001_open(struct input_dev *dev)
 	struct w8001 *w8001 = input_get_drvdata(dev);
 	int err;
 
-	err = mutex_lock_interruptible(&w8001->mutex);
-	if (err)
-		return err;
+	scoped_guard(mutex_intr, &w8001->mutex) {
+		if (w8001->open_count == 0) {
+			err = w8001_command(w8001, W8001_CMD_START, false);
+			if (err)
+				return err;
+		}
 
-	if (w8001->open_count++ == 0) {
-		err = w8001_command(w8001, W8001_CMD_START, false);
-		if (err)
-			w8001->open_count--;
+		w8001->open_count++;
+		return 0;
 	}
 
-	mutex_unlock(&w8001->mutex);
-	return err;
+	return -EINTR;
 }
 
 static void w8001_close(struct input_dev *dev)
 {
 	struct w8001 *w8001 = input_get_drvdata(dev);
 
-	mutex_lock(&w8001->mutex);
+	guard(mutex)(&w8001->mutex);
 
 	if (--w8001->open_count == 0)
 		w8001_command(w8001, W8001_CMD_STOP, false);
-
-	mutex_unlock(&w8001->mutex);
 }
 
 static int w8001_detect(struct w8001 *w8001)
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
Dmitry

