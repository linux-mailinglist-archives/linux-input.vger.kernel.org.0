Return-Path: <linux-input+bounces-14447-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F40B4195A
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 10:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869C5178CDA
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 08:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1482F1FE1;
	Wed,  3 Sep 2025 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMS1nsiF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDFC2F1FC9;
	Wed,  3 Sep 2025 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756889716; cv=none; b=XmFS+AlTi80edmPWl0+PhGfV7pK1BBkeQJ47BpKrY1JUJmhUqx4XGKeF7zQ07JDiC5lXVkBn1ocvjNsI2vF6yQj9IwFIai6bPqq7o3IrJ0dNusKbqz1y5zKJUu2baVVtLrI4ozSN2VAJqZasc7oko1Xevb1GbDNHgZ9BrlZTg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756889716; c=relaxed/simple;
	bh=O8PBWQwNJ/F70vGI+AS1o/jEY4knrQJnMWmH+oxAvwE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Kab+8Co4p6jEiRsXG+1P8wY9emwxLYBOeilIFQlKfv5qXJzVv3VWBg3I+l4iSTXDDPDlWC6gvorbbXbsUACLkKZyXSIKIsOkQ5WH0/5i0icjhKmLZiFz861hfKkYdcoV8IzDok8AIborDHH4mXcmWmfAyu8m+OqlLe6xiJHyArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMS1nsiF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso5437323b3a.1;
        Wed, 03 Sep 2025 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756889714; x=1757494514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eE9Dqk+BGhLOvtAd8CSQOddrMc+lxDEGcDsD3ik0RG4=;
        b=LMS1nsiFSVY6G2szAflndyQRKyE1IuysiHgcKfeEHMSBqT3ToEm6Wf3JExUCXzMM/H
         yBKGChI3utTylSPSPqqWOJ7Lhzgpu8D7RVyM6dtWBU+cr1izMGmRq7YUk1t1dg6N0A8a
         lrPBlgLPfK44IIEU/1vmzzREFmoTAOBT6ILFo7Hshk8+A4Nxl7CR3JKyhzLFo9VBLnFB
         PkVxlefs1vHZkZsMjObOihOy1qPf8UvZIsT+Gyn2ZM6GPzUkLdhbvN21LZEpG5RMvSKJ
         mAesCtMEMseXOUbaNoiKaQ1r2pirgcLUJTlLv6M031GEPDHg8M0YlI6whSMKNxCshPh0
         /+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756889714; x=1757494514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE9Dqk+BGhLOvtAd8CSQOddrMc+lxDEGcDsD3ik0RG4=;
        b=KtOji+QNL3WLk4cB64En8kk+oLQLUEZKFT2XY9+A0z9axOdgznXDWKaVW/BGgZzkaL
         ulY8lF4XU8+uXQl160cyvDQrtxjq5mNDQ63S3hi4WU3rpO8kjiCfPDYcMYvZ71rwpIu5
         Y4K8E6zTYB2kD44mi1YGPwPc3IDlePmhQNSDvKx07mF2LZf4yvPhom7MxESCuAILqQKJ
         yf7x7x0L+8kqt+cZnXHonJIofJlpEvEsSiaILt+eGizWtbG7GnqJ2R8tlmJXExfRkzVg
         v0vAlNKVOnPXasAIQqoZZ0GMuxLIxuXX8PInnc5Md94WL63pxxt66bl9m8T+KQlZRtH1
         zucA==
X-Forwarded-Encrypted: i=1; AJvYcCXC7iPkMh01ueTW24UdNY4yfmtAmLSK+5h5cS4fCxBtFkyc+xuXE8B/T8zjVPZDFgkYoMX4KUbTU0LVorg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbeIsC3vivAfdC8c8QVC/gspLgfTMaDAKAmfl59ly7JGCGSUtt
	+apjR31r8Nls5h111P++4b8jtumMkChmxKQ8zFM6jU42cdq8vvvp64NX
X-Gm-Gg: ASbGnctnS16IM6L0er8ibH96YxpGeidgSm3tAoEi244WtGNOKgFHjBX51d7uhM2KnpK
	sPPyUDztIDuSzsFgzwj8VnpSFjcOAF0gPcStleY1fgfHZMvvzCLm4leXsyMek+OPE9GPOPc+Ch5
	yHUJncHmzrmSK8u+8/jgnFxb6fhbdO12EEpl1CBkRkbh1iv4u8hiSBQ9285CRJVWJodbHDhMmbE
	/4ssvaMUqRIRrpQ/ObbjFzV5Coc4g8UBcDlVIB7UdoPMhHQGdNvrr5R4npygvdG3i6VDsNb/u/D
	X5vSroD1/7L5uw9t3ZmYjo2VXxyZRaCSyWeGwYO21jorjSp4Rw3//NKb2tfajjbKg5GbLJwixVT
	E1fcKv507UbzPOm5VzJRDqYIz+mmm8/9g7b6oTeYz82YG
X-Google-Smtp-Source: AGHT+IGP3LVDegg2t/sYFf09FF4PFWosWBV1+BXW4mpRYyHpfiHD5ESfphLo+ZvGdzOuFsNDR6KwAQ==
X-Received: by 2002:a05:6a20:918f:b0:246:d43a:3856 with SMTP id adf61e73a8af0-246d449839amr3046338637.22.1756889713564;
        Wed, 03 Sep 2025 01:55:13 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7726c1ed65bsm5419068b3a.45.2025.09.03.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:55:13 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: rydberg@bitmath.org,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bhanuseshukumar@gmail.com
Subject: [PATCH v3] Input: bcm5974 - Driver cleanup by replacing dprintk with dev_dbg
Date: Wed,  3 Sep 2025 14:25:06 +0530
Message-Id: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
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

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Changes in V3
 1. Name in the from tag & signed-off tag are matched.
 
 Note: This patch is tested for compilation.
 v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/
 v2 patch : https://lore.kernel.org/all/20250903061908.41910-1-bhanuseshukumar@gmail.com/ 

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


