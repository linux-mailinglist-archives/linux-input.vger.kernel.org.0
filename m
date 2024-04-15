Return-Path: <linux-input+bounces-3022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA638A4F75
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9662B1F22625
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7987172D;
	Mon, 15 Apr 2024 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ba5gLAks"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B002570CC7
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185298; cv=none; b=WOB5k7UDTryBxdMeNvgt5oH58XCYJUgg2dthcYwAMMtirZ4NWvSgWXBiY9LiPlWrhC1ETOX+9Gq5jtrjqzonvL2H1NCOC4kOmKWAuiDCWfa7Ov7XQJwSaeONl8veBi/xhf+oi/DlM71B5w1Mkio1wSwdR6jNafr8PY0nRAZ5ysM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185298; c=relaxed/simple;
	bh=GiAL7AQwqxatMiC1wtqf96rwk/+L3Y723maHiKd24mQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vc8UHWLD64ni3Ch2Ep0o2V7bucwEomj9vDQtAE5zi3dU7MCgnv5/hmW/JdZAJrF6eAyNoYdEbHjjHhMZvQUBrDCNR/lWaTVqb2Tv+HF1xcRKK4tp0vyKzneu7fVQPrYC7YlBc5aOPl8MDxHPr7EGSVwaTsE59dUhaRWexsGKynI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ba5gLAks; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78d6bc947aeso262538085a.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713185295; x=1713790095; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dve//qsVqFoPISv+fNeUNTT8BnSMNPQ+ikVvv/LniyI=;
        b=Ba5gLAksCKmOFwSd5OnV1XD7iR8iESQDmFpJ3FzifOo6xZd/8U14sdUrM2GVnMLBDC
         oS/uH60ybiujgm5ssoa5dxToFP6LZ8VVAaaQgvvPtdveW6vhWia2tcA0TIZlooGoR9xO
         O/kj1AufiyoYa6fl8mXzLRcJom2CZ48e3ItIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185295; x=1713790095;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dve//qsVqFoPISv+fNeUNTT8BnSMNPQ+ikVvv/LniyI=;
        b=A4vb6KBlJ8dVTn+YdVhEn0J3iRycKQZ26U7WzL8FtaCu/WahkH1H0TSMAWAk6ZOrhj
         UWIRM6d/heZQpEj4fBBMLFVvt/Iaq11UfME5sPMYOdAEHpITXYI+qmm/DQultwSOJwCC
         We4EH7+mY5zu90fRnz8Y1M9SSdFYLcBLpMVGTEFVmwLkJ34z/U9dIW89zv1O4iQ+q24S
         xgWTP4ZP6Ic2B/9maV3Xl/k3AghcI8TIgP/mB1n2zfabiihteHRTBD/wkiUx6L8Rc3Av
         1t1TNhgtVxLx/dm92ugGBCD/LC9DF9/vpPH6PTfP8ywdO9cotFiVZkGAIQqh16zIw3Wi
         zayg==
X-Forwarded-Encrypted: i=1; AJvYcCVCnz0U9/7HH5svERVCV5RoOBICFOLKzxeWKz7STgcE8u4I8UzSMxC0i5SuGhzQ1/xMrJQI7mEDyWch2ua5oaa48q3df+i7mPvp5Ag=
X-Gm-Message-State: AOJu0YzSOfTi8UPcKIY7RPmGP4oL0LgLCncrQvErDWyBpyVIlzA5v0yp
	zUDiVa6vPJJd0a+YYGQiSs/e1Xy3s8DClPtU4nbP+RAAslLwrtHUwgvFlqFPz7/3yqiBU1iCSos
	QjBz2
X-Google-Smtp-Source: AGHT+IGGMVMgU9pcekBy2o8Q4hRzW7aGYI9W6mUPy3Ru/xUnvMaPLLrOjste8+2tlkKDnbLOSF+kuA==
X-Received: by 2002:a05:620a:31a7:b0:78e:f058:66ef with SMTP id bi39-20020a05620a31a700b0078ef05866efmr642944qkb.77.1713185295008;
        Mon, 15 Apr 2024 05:48:15 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id ye2-20020a05620a3b8200b0078a54c25ea6sm6243453qkn.56.2024.04.15.05.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:48:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 12:48:13 +0000
Subject: [PATCH v4] media: usb: siano: Fix allocation of urbs
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-smatch-v4-1-8dce3d80b64a@chromium.org>
X-B4-Tracking: v=1; b=H4sIAAwiHWYC/22OzQ6CMBAGX4X0bE1/WGg9+R7GA9KF9gA1LTYaw
 rtbOBijHOfLzmRnEjE4jORUzCRgctH5MUN5KEhrm7FH6kxmIpgoWckZjUMztZaqTkgwwGqQhuT
 je8DOPbfQ5ZrZujj58Nq6ia/rXyJxymitwDCmGwXidm5t8IN7DEcferJWkvg24WMKymkFgoOWl
 ZFa7Zhy35TZRCPz9502gPhjLsvyBoFEkfATAQAA
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
Changes in v4:
- Remove unneeded label free_urbs
- Link to v3: https://lore.kernel.org/r/20240415-smatch-v3-1-ed3f23f9d5ee@chromium.org

Changes in v3: Thanks Hans
- Remove unneeded NULL assignment
- Use the proper variable :)
- Link to v2: https://lore.kernel.org/r/20240415-smatch-v2-1-65215936d398@chromium.org

Changes in v2: Thanks Hans
- Only leave 1/6, the other ones are in another PR
- Fix the return tag and NULLify the urbs on return
- Link to v1: https://lore.kernel.org/r/20240410-smatch-v1-0-785d009a852b@chromium.org
---
 drivers/media/usb/siano/smsusb.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 723510520d09..2c8179a84991 100644
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
@@ -463,7 +468,9 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	/* initialize urbs */
 	for (i = 0; i < MAX_URBS; i++) {
 		dev->surbs[i].dev = dev;
-		usb_init_urb(&dev->surbs[i].urb);
+		dev->surbs[i].urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!dev->surbs[i].urb)
+			goto err_unregister_device;
 	}
 
 	pr_debug("smsusb_start_streaming(...).\n");
@@ -486,6 +493,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	return rc;
 
 err_unregister_device:
+	/* smsusb_term_device() frees any allocated urb. */
 	smsusb_term_device(intf);
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB
 	media_device_unregister(mdev);

---
base-commit: 34d7bf1c8e59f5fbf438ee32c96389ebe41ca2e8
change-id: 20240410-smatch-8f235d50753d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


