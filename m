Return-Path: <linux-input+bounces-2905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5038A0269
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 23:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0C9288161
	for <lists+linux-input@lfdr.de>; Wed, 10 Apr 2024 21:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4962118412D;
	Wed, 10 Apr 2024 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F/eeD8sE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80390181D03
	for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 21:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712786089; cv=none; b=B1Ae+VBBPYM4ZK4UxHRpqakLswejOkWxKSSq6bnOK2Err57u1SeqB1fnV1PEQmImdX6NyeYwxIsRqogR227wLA30XaJw9bZDr4oANhWxjKRy/OwC5BClxSs5tPA2oC3g+hY574S5UXNySrQ3u5SdC3q+sOKI+dFpJaC1C9i69+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712786089; c=relaxed/simple;
	bh=rzGNe4hZhMnB8M/40dl2p6r/nVedCnlrPhrsN56MHoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwTr+TYzuiBHHKrcOntCHOeo4i1cd0Egh1NhuQt9Ab1dt3h19hBBv/GJIj2F5oXuq6avaqvQaJhu04o5kiljo9twszzGo73oSSGDihZ+qpF24rVu5fbydzS/ZZUx7e4jQ45xBgK6i5Yr8g1ib8kLKoKn+cDrnywr7Pb6P4fDpv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F/eeD8sE; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-434925427c6so18721461cf.1
        for <linux-input@vger.kernel.org>; Wed, 10 Apr 2024 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712786086; x=1713390886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPW2ppTL8S189BnwjTGvFf2yuc7RYQzJKkrIYHPYwNk=;
        b=F/eeD8sEjrY+EhekZafyZQoJa27/IyQrTtkPnnDb5U32vvUEhclqgJvnkF3yk2IA9s
         b/I2HvnnaY4uosfvxdHNI9Y47+AKPYlkUJ9vjHEzNxwYapYUYRJ+hONV3g5voEXutj1R
         S91spzMhdSx1FopiRRS3HNBIvbRWtNgmhSq2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712786086; x=1713390886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPW2ppTL8S189BnwjTGvFf2yuc7RYQzJKkrIYHPYwNk=;
        b=Jp2JKRFU3VlLr5OK/NQv9JO3XmNGEDFxGec5voSJK8E7nLip77s3SYdL81jxNDPAEt
         4je7WYtz/r+VD5hP+uJuK1zUwPpXCMIpQJ+bWemkKis99D5datjO9z20+E33YMlN8UCS
         xRvGV2kMgrxuHZTPIL+HOFx10mztcyOFF45kn/6kQT96IgfYCrxvGRNs6ShSn8lHS5XM
         xBpO/fkodlblATScOhx7rMLnF7dwUFNB8PL89UHWWa0kBFNM9VzH+cEJyux3agnW0wzf
         kuhkMtZ/T3viryOzoXWraW4oQx6YIM7wrFXJlNuofuEC5XEPL3cM+oeT6FcHgRPaeg6d
         REFg==
X-Forwarded-Encrypted: i=1; AJvYcCXPiL6oh2DQa0qtex7NtQrYAqpVZFlcOCe7APYQe+tG+1Xooja1RjeAp/7hzSNs1So8Wl6iRn5TGLc0E3VUuMX1NdVIgZXVnMKoq98=
X-Gm-Message-State: AOJu0YxHr/lU7CH5gh54BnuwjAsf4faX5HQzPH/2hZQWeGSA4AGAtwn1
	lRhETlzfmunMg8ARgehlOCcKiaCIMNbY9MsbkWfVaj2Vg+cGXj+chgB6+FXDZw==
X-Google-Smtp-Source: AGHT+IGqJ1+HwPYyX9JNsLSdWW24aYLgwinvggdSsd1dVYnvyZyEESK2vRNNPs8/wL4dw6XEd0RjjQ==
X-Received: by 2002:a05:622a:10b:b0:436:5628:d6a6 with SMTP id u11-20020a05622a010b00b004365628d6a6mr818871qtw.48.1712786086346;
        Wed, 10 Apr 2024 14:54:46 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id kg26-20020a05622a761a00b00434c1eedb0esm67330qtb.36.2024.04.10.14.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 14:54:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Apr 2024 21:54:38 +0000
Subject: [PATCH 1/6] media: usb: siano: Fix allocation of urbs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-smatch-v1-1-785d009a852b@chromium.org>
References: <20240410-smatch-v1-0-785d009a852b@chromium.org>
In-Reply-To: <20240410-smatch-v1-0-785d009a852b@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

USB urbs must be allocated with usb_alloc_urb. Quoting the manual

Only use this function (usb_init_urb) if you _really_ understand what you
are doing.

Fix the following smatch error:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/siano/smsusb.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 723510520d092..d85308e0785db 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -40,7 +40,7 @@ struct smsusb_urb_t {
 	struct smscore_buffer_t *cb;
 	struct smsusb_device_t *dev;
 
-	struct urb urb;
+	struct urb *urb;
 
 	/* For the bottom half */
 	struct work_struct wq;
@@ -160,7 +160,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 	}
 
 	usb_fill_bulk_urb(
-		&surb->urb,
+		surb->urb,
 		dev->udev,
 		usb_rcvbulkpipe(dev->udev, dev->in_ep),
 		surb->cb->p,
@@ -168,9 +168,9 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb.transfer_flags |= URB_FREE_BUFFER;
+	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
-	return usb_submit_urb(&surb->urb, GFP_ATOMIC);
+	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
 
 static void smsusb_stop_streaming(struct smsusb_device_t *dev)
@@ -178,7 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
 	int i;
 
 	for (i = 0; i < MAX_URBS; i++) {
-		usb_kill_urb(&dev->surbs[i].urb);
+		usb_kill_urb(dev->surbs[i].urb);
 		if (dev->surbs[i].wq.func)
 			cancel_work_sync(&dev->surbs[i].wq);
 
@@ -338,6 +338,8 @@ static void smsusb_term_device(struct usb_interface *intf)
 	struct smsusb_device_t *dev = usb_get_intfdata(intf);
 
 	if (dev) {
+		int i;
+
 		dev->state = SMSUSB_DISCONNECTED;
 
 		smsusb_stop_streaming(dev);
@@ -346,6 +348,9 @@ static void smsusb_term_device(struct usb_interface *intf)
 		if (dev->coredev)
 			smscore_unregister_device(dev->coredev);
 
+		for (i = 0; i < MAX_URBS; i++)
+			usb_free_urb(dev->surbs[i].urb);
+
 		pr_debug("device 0x%p destroyed\n", dev);
 		kfree(dev);
 	}
@@ -390,6 +395,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	void *mdev;
 	int i, rc;
 	int align = 0;
+	int n_urb = 0;
 
 	/* create device object */
 	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
@@ -461,9 +467,11 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	dev->coredev->is_usb_device = true;
 
 	/* initialize urbs */
-	for (i = 0; i < MAX_URBS; i++) {
-		dev->surbs[i].dev = dev;
-		usb_init_urb(&dev->surbs[i].urb);
+	for (n_urb = 0; n_urb < MAX_URBS; n_urb++) {
+		dev->surbs[n_urb].dev = dev;
+		dev->surbs[n_urb].urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!dev->surbs[n_urb].urb)
+			goto free_urbs;
 	}
 
 	pr_debug("smsusb_start_streaming(...).\n");
@@ -485,6 +493,10 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 
 	return rc;
 
+free_urbs:
+	for (i = 0; i < n_urb; i++)
+		usb_free_urb(dev->surbs[n_urb].urb);
+
 err_unregister_device:
 	smsusb_term_device(intf);
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB

-- 
2.44.0.478.gd926399ef9-goog


