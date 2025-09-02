Return-Path: <linux-input+bounces-14431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB2EB40AE8
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 18:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 946D31BA2B3E
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 16:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D8F2E4241;
	Tue,  2 Sep 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm/8MtOm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2972DD60E;
	Tue,  2 Sep 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756831441; cv=none; b=KUdF8PwfIcCg9GSHEv2JrtoXw1XqrjvciT+odez+Aj+gLlpmxBIaJ6xOvLG/uSnx0YudijjRepE3c2zx/MerlRb6nxH4mICSIdgTFmfMsM3/Roqi/xoEkPMa5YFmH8c+glVQI2cXFL0SfCBg8zVIn5u9Nt+aBN/QGZcap+8EJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756831441; c=relaxed/simple;
	bh=iSi019zg+85SfqcwkQSzYtglNtT3gMatjXdwTMEt05M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NKrDwDjk9fUOTHvmm9IlPXmmF3vKpxZsNNiHs7PN80KCk27XAfpfESGow395u1euXlWfQCBXmu0JxB9c4QzLaJ1E+ZxF2q9jRkwOEoa4GZcCZ1pLTar0g40oHo0l8MGryvmMDH0j6mH+6Xq2gCj/G0UCcPpuRDHFK0RuP5F0H8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm/8MtOm; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77238a3101fso2264721b3a.0;
        Tue, 02 Sep 2025 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756831439; x=1757436239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDFLUlwGZ9fcnaymc/LV1ZN4f5ggTixFKC+VevtRkBU=;
        b=Bm/8MtOm48Km59dRTcBQfjtsJdBOwXW78/wDb+j7e4ed+jDZ+7HH+BZoSgw4yaTzFm
         dDRqQtTRVXoSFkVRVlY3rCwQiaJ0aezPGtKXbrp0W3Fjh5NB8svvNA/Zt1X7k9Ku1NE5
         Dud/YpGWYp5sC5i6Vt2BHwskp84XI8GhSsfcGyP36Ye52AIT2eKykccVTWd5+q7bhSOB
         YN6/WN5nQ/bAfL4Xbz65lA2nn/TjuziIOMDS9b1VrWBcsHk4H8/uPnKb5v1ocNyc+Dbc
         Z58JQQZ+M3RhmSU2k3POYJX7/xahiRK4/68WsfkyyMCCXxsaX8d5d41QrHLVyP8Xw6zu
         pohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756831439; x=1757436239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDFLUlwGZ9fcnaymc/LV1ZN4f5ggTixFKC+VevtRkBU=;
        b=DZY4DKOUs5GFzC0Xmpu5M957brBoJAFp/Bv0SSJYJcsUSAZLYcwdB4TSLCqok4Eb6p
         Jm60/gBCrFyKz0wKQ7zT9uFwqmWozs2ri5OOkGtSoNNmRI6YpucUr15Av/84oF9h+cyW
         ZhD502dyJx5LjOktCDcPKQBq0/8ojMCdmgMEaR/IyU2bW7WWGGywNz1w9BKqYFCI7ARc
         f7Mt+w0LNF1RivWV8gz2nHiedMWO17ft5LbWbDampbl6+sV4Y2J/qJhLC3tZnGZrDEv2
         T770E77JNNEuuf/3klQKN6WzBanO098ZZcV6S9P5F04HtgAV1b0yOClYaXSQTzAj6NhM
         mKmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Aivpvd3LqQo1ztxJ6LHKWfdDdPeffgCmEPic9jQ7F0w1Jvj2nf7iIzEOwsiJu5KrylliShuNV0MRHnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ABltgTkxceUP615+ipY2XS2JkbqgHMS7I78mbQ2Ejf9H867O
	im3KKMWEDMtJluTPdNahZGUY9qQWw2rIPbzRRVXA1L97zYDAbwAHADX2
X-Gm-Gg: ASbGncsz2fJ3PBQnozdfYS8Knwn8BFM0gYuYG4uzv/h9Orp6twxkS/x+xGZGr/Nd7QV
	iM+yLvKbZZ75wcfsnAfTyN2WexKQA3KE4CZLibU4A2Lg/c6lEAcGI/kGjbfw4jIR+a9MLSXxUaM
	yfRWjrZsPChUuVCYfx3jyrPWrsM92eBHWXGZ0qNENiNnSv+6Q2OpOLFvcoTCi9ODaHrZvnWsoET
	ulx4TkV8beWCAhRjMyqNjKEJIzgvpbpABDqCxt/Yfbi+YHq/cuFMLf8mAou2v9Gwfp5rBFwHKrc
	ZDhCtrwqNzbtqOQR7ldrH2RhqxjJ5fnCkJM+EjKB1RyKzQ28yflwlJPaw5hKMysv0EFQjIS/ZLI
	gDruw6fbDopThD2UNTIonUmgKyA4Hdqx3MO+Iyn8=
X-Google-Smtp-Source: AGHT+IFnhXzo9XpMwOvHJQbCUoXvdPp69NweZCk4tNGWxerYMAlk/QXOMn1ujstF2h6EEPXUubxeaw==
X-Received: by 2002:a05:6a20:42a3:b0:243:755:58b0 with SMTP id adf61e73a8af0-243d6f3b622mr16537135637.49.1756831439370;
        Tue, 02 Sep 2025 09:43:59 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.162.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26a1b9sm13831449b3a.7.2025.09.02.09.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 09:43:59 -0700 (PDT)
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	bhanuseshukumar@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Tue,  2 Sep 2025 22:13:51 +0530
Message-Id: <20250902164351.36828-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Debug printk messages are converted to dev_dbg based logs
	for better control over debug messages using dynamic logging.

Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>
---
 drivers/input/mouse/bcm5974.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
index dfdfb59cc8b5..2791fe0c1932 100644
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
@@ -547,11 +540,12 @@ static void setup_events_to_report(struct input_dev *input_dev,
 /* report button data as logical button state */
 static int report_bt_state(struct bcm5974 *dev, int size)
 {
+	struct usb_interface *intf = dev->intf;
+
 	if (size != sizeof(struct bt_data))
 		return -EIO;
 
-	dprintk(7,
-		"bcm5974: button data: %x %x %x %x\n",
+	dev_dbg(&intf->dev, "bcm5974: button data: %x %x %x %x\n",
 		dev->bt_data->unknown1, dev->bt_data->button,
 		dev->bt_data->rel_x, dev->bt_data->rel_y);
 
@@ -688,7 +682,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
 		goto out;
 	}
 
-	dprintk(2, "bcm5974: switched to %s mode.\n",
+	dev_dbg(&dev->intf->dev, "bcm5974: switched to %s mode.\n",
 		on ? "wellspring" : "normal");
 
  out:
@@ -718,7 +712,7 @@ static void bcm5974_irq_button(struct urb *urb)
 	}
 
 	if (report_bt_state(dev, dev->bt_urb->actual_length))
-		dprintk(1, "bcm5974: bad button package, length: %d\n",
+		dev_dbg(&intf->dev, "bcm5974: bad button package, length: %d\n",
 			dev->bt_urb->actual_length);
 
 exit:
@@ -753,7 +747,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 		goto exit;
 
 	if (report_tp_state(dev, dev->tp_urb->actual_length))
-		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
+		dev_dbg(&intf->dev, "bcm5974: bad trackpad package, length: %d\n",
 			dev->tp_urb->actual_length);
 
 exit:
@@ -783,10 +777,11 @@ static void bcm5974_irq_trackpad(struct urb *urb)
 static int bcm5974_start_traffic(struct bcm5974 *dev)
 {
 	int error;
+	struct usb_interface *intf = dev->intf;
 
 	error = bcm5974_wellspring_mode(dev, true);
 	if (error) {
-		dprintk(1, "bcm5974: mode switch failed\n");
+		dev_dbg(&intf->dev, "bcm5974: mode switch failed\n");
 		goto err_out;
 	}
 
-- 
2.34.1


