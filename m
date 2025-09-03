Return-Path: <linux-input+bounces-14444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5166B41519
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 08:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FBFD547147
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 06:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB582D781F;
	Wed,  3 Sep 2025 06:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUeIGv3W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8AD2D781B;
	Wed,  3 Sep 2025 06:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756880357; cv=none; b=atqGwEONRbdJ9kR+9sWve9InKOsXBjkoCtp6a2Gf+0FqxYCs8Vzzm4PTCyeR9NLNjcc1ikIi1b2YZtHtpgKeMNEYCkP4m6wUiXy0RNqli5dpBiVHbuEM57RJDeEgCCfYRCw26LTyUOV2E7OjwRUcLCo083Q01nON7+PyoTk8Phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756880357; c=relaxed/simple;
	bh=k4Djx9gzZI0uItX5F6U8NOACJ0CiqvtEXulvh5L7zcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dBm3rr6ZKpiCJfhEh+LBzsu6RrHSsfL0JopQNvGFMnJ4pIuVcfn4rOKw/ttDZtr5e5m+pMGaEZk1m+B7VYnSQP1VZQkrYMdPjhr8atCKjHIQpOurOmY2PClUDTgGTUBOzYIFd45XCBIZAAI3N6lcK+FesmU430Uzm9U19GWXGEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUeIGv3W; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7722c88fc5fso4006046b3a.2;
        Tue, 02 Sep 2025 23:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756880355; x=1757485155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6iyLT6U/SMFeXIY3WMF6/nHjn/xLgYLeb3rEUCa7ZA=;
        b=kUeIGv3WYNIaQ9/lEyV982d+gDvRtQdZRg0cPj7W6xa5UkGULAAGJ6SVILYGYaDQ+P
         NVguINpx9U7o7qW2qMCIj35LFuzGawspAiJJLLATrx6zfKe/GXBsaF2Ozg9sf6zpXoqq
         ztPTNA/FUz7hizzl68eCULosWAelWgy0yl4NqTeh6EpcW5lvFxNCO3EQ/6jQq1Jpplag
         wqimHOy+rsy5ofLNEUc3nOzXuanPOJvW4bLDC1i4PnmS7/YAiNODzoMOHG8GoVlbOMU0
         MGMtBHFPRAPBMgH4jzVU/LzC8MK4PTZGia7FvaKEVYdgBQYrb8gTsN08Ww1487FKNHAr
         qBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756880355; x=1757485155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6iyLT6U/SMFeXIY3WMF6/nHjn/xLgYLeb3rEUCa7ZA=;
        b=ajvoWFS0KyVo3zQKAuSt5mNvAx/Ucno4hrw8UAzoGusbciXje7jJpqXl312ODub1GC
         AQP81VYGobXct+Poom0Yj3EkeuGNxtugJoxg+3RkwpJhE2beyDxZ8wEvtXVohbN1ziZw
         qMJl4hIhqX9wCjvn33NRA2s9OpoMtuare82EOiT6yUWb7RVrvK8jtWXSrnPPK1X27rTc
         EqoKhGsywQEZBAPK1XPGnXQ0zZowb31Yz2ifa/stWWREc51/hIUZ9kkSSp7tbKyQsolP
         6I4g1HJuOcyrwNlmd76sJT6Tfu9deVUElykNzxvXwo1RaMeEQd3ymJ06QIE8ALGJO7oA
         ZYXw==
X-Forwarded-Encrypted: i=1; AJvYcCWLVDCvtfaGTqmwhSebIkSa40FAXcLUyD2Nd1QXWgIZADQTqfdCpwIWJm0a+Z6tpc0Sm02N8CnoY0ONxIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+YQ31v0tvscTCYZleQuVqg5D4UWPuMIdChI5uvZjkP12qDtOJ
	rEvg9eVBvbAw3zdTqAllRVgxeH/eSUkiSK8mtj6UXWHjqBNyd+y5iDD24o3/ZMd9
X-Gm-Gg: ASbGnct/6M4lVl9HYG66zSXEiWUZfNCs/ogJeHIvLJNc4Hzw1bEAutPHzAwVgnbJriv
	eSz/LF+8NSeZRR6Q1XKwrlYygWwI2JtjZ62mj7ZAvccKCsnlqbs19+9+iwxmIQfwXt4E6sg4DY8
	WqYQQetQcgrVdF5o0488VuXvn/6TONBvYR/5tfHzDG3L9hFXCZ/vs1qCYuctG/zSvH0vtW8uYdO
	Xt0LXdQ4qP/++Pc/AfT6jW2wYxS3RE2CyzyXidHd1fp/fMevseOC0TKBhPLuTQQCFjsR+UqwYs3
	E5TrnEfMhCT1m1XRw/XW+wQu+P0yWRqD6Lvcaq25Uj0iQVsaDHDFAJTa/nYg4WThlGufevnh00u
	StXFbh3D6XdoBVYIPeoUQ9m+WlC0090U/pw==
X-Google-Smtp-Source: AGHT+IEYBH8aqizGtqUI/QYZ5SP4z32Qsfox8obVDdoIf6zuZo3PvVTsce+pQuGu63/h0UZFAMQJXQ==
X-Received: by 2002:a05:6a20:1592:b0:243:a373:a9e8 with SMTP id adf61e73a8af0-243d6f030bamr20166944637.38.1756880355075;
        Tue, 02 Sep 2025 23:19:15 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77285bb2614sm165999b3a.58.2025.09.02.23.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 23:19:14 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	bhanuseshukumar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Wed,  3 Sep 2025 11:49:08 +0530
Message-Id: <20250903061908.41910-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bhanuseshukumar <bhanuseshukumar@gmail.com>

Debug printk messages are converted to dev_dbg based logs
for better control over debug messages using dynamic logging.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Changes in V2
 1. Removed unnecessary module name(bcm5974) prefix in each dev_dbg logs.
 2. Removed unwanted variable declarations as pointed out in v1 review 
 3. Name is used in signed-off tag instead of email alias.
 
 Note: This patch is tested for compilation.
 v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/

 drivers/input/mouse/bcm5974.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index dfdfb59cc8b5..03e112666c2e 100644
--- a/drivers/input/mouse/bcm5974.c
+++ b/drivers/input/mouse/bcm5974.c
@@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
 MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
 MODULE_LICENSE("GPL");
 
-#define dprintk(level, format, a...)\
-	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
-
-static int debug = 1;
-module_param(debug, int, 0644);
-MODULE_PARM_DESC(debug, "Activate debugging output");
-
 /* button data structure */
 struct bt_data {
 	u8 unknown1;		/* constant */
@@ -550,8 +543,7 @@ static int report_bt_state(struct bcm5974 *dev, int size)
 	if (size != sizeof(struct bt_data))
 		return -EIO;
 
-	dprintk(7,
-		"bcm5974: button data: %x %x %x %x\n",
+	dev_dbg(&dev->intf->dev, "button data: %x %x %x %x\n",
 		dev->bt_data->unknown1, dev->bt_data->button,
 		dev->bt_data->rel_x, dev->bt_data->rel_y);
 
@@ -688,7 +680,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
 		goto out;
 	}
 
-	dprintk(2, "bcm5974: switched to %s mode.\n",
+	dev_dbg(&dev->intf->dev, "switched to %s mode.\n",
 		on ? "wellspring" : "normal");
 
  out:
@@ -718,7 +710,7 @@ static void bcm5974_irq_button(struct urb *urb)
 	}
 
 	if (report_bt_state(dev, dev->bt_urb->actual_length))
-		dprintk(1, "bcm5974: bad button package, length: %d\n",
+		dev_dbg(&intf->dev, "bad button package, length: %d\n",
 			dev->bt_urb->actual_length);
 
 exit:
@@ -753,7 +745,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 		goto exit;
 
 	if (report_tp_state(dev, dev->tp_urb->actual_length))
-		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
+		dev_dbg(&intf->dev, "bad trackpad package, length: %d\n",
 			dev->tp_urb->actual_length);
 
 exit:
@@ -786,7 +778,7 @@ static int bcm5974_start_traffic(struct bcm5974 *dev)
 
 	error = bcm5974_wellspring_mode(dev, true);
 	if (error) {
-		dprintk(1, "bcm5974: mode switch failed\n");
+		dev_dbg(&dev->intf->dev, "mode switch failed\n");
 		goto err_out;
 	}
 
-- 
2.34.1


