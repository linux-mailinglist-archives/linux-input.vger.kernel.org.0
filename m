Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52ED42D6C39
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 01:28:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgLJX7w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 18:59:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbgLJX7V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 18:59:21 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C73DC0613CF;
        Thu, 10 Dec 2020 15:58:41 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f17so5846395pge.6;
        Thu, 10 Dec 2020 15:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=L3d831+dnOWhI5RtMGl5c7cNy6XBFirQmQWs7vyIZBM=;
        b=se07J9oSLReNy7EaHE5a4FPHwySjHq8wdrR5ABcshzUnyVlIE/qcQ8PhBDrvZXAZW8
         m7fo7M4hp8fSnd9nKrOqwG8s2y0BlQgVukLyJ3SYoPaPKBWYyDTYjy6GeDyIeaJnb21I
         oMxw/KUGuZm/DN3wPG+blkmbHXhaFL/0AAnEF/4/VUiO3Ger+YRcWFg9hfEA6d1Kq+xI
         Cf1UxqNDf2G76wWzqLzLMH4/+IiyoQp1OyMBo/eIdxAuwjAJ5rGyYbFZPfGxgyosii6R
         MUt9DJ6+4ze5ApR+MwPM5tdvpkF9Q9MQYw5Om9qxue37ZB5qMR5zG5dVJLuOd6kvzNWM
         H3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=L3d831+dnOWhI5RtMGl5c7cNy6XBFirQmQWs7vyIZBM=;
        b=WwKINOIaQcp9Gg7aampXdv8oVOVwL94fBoiVG2ydfNlv9qdXCO6QivwNneohlLvaSH
         u/mBkwkgJeFD9CjEAgRV9Vcd84rUwvln4/YoOpWHCXpaJ0oOVSCL39c0Y04H+EuEukpb
         FQDyLNETRbY+H1ztFoWPjQNJD13nSToZCW6NHL5nnWxkf2MLw8BPVDSJiJk/CSMPg23N
         cSTd+J8V8bd3vnViXPhpTtTQ16jhsgykbxUryGa4AqN/3X9YW2iJNj0ADE7PL6zgvT1T
         mHCRdEcRUJS9ye+7nOIdB3tw15f7/aTgSoPs3SpH7j8jW8hJsCpJuL0FgCt1ZMIQzaUI
         EaCg==
X-Gm-Message-State: AOAM531Frp3m2LxV8SLCyo5cGqwRhmA0OfYxPm0pcM1KIlJFj/ojz40U
        0IP7HrQ7fte9nnTAPTqMgg+3RgitvY4=
X-Google-Smtp-Source: ABdhPJyQNK+UPTtm0o80UpfbpvYj0BmXjKUBk0wl/jVzbCoV7hZ0rirHnQQRfonyhecfc+Y/DoNFOg==
X-Received: by 2002:aa7:963c:0:b029:19d:dcd3:b2ae with SMTP id r28-20020aa7963c0000b029019ddcd3b2aemr8971968pfg.76.1607644720955;
        Thu, 10 Dec 2020 15:58:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id h11sm8183371pjg.46.2020.12.10.15.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 15:58:40 -0800 (PST)
Date:   Thu, 10 Dec 2020 15:58:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cm109 - do not stomp on control URB
Message-ID: <X9K2LXQ8iLICkpu3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We need to make sure we are not stomping on the control URB that was
issued when opening the device when attempting to toggle buzzer.
To do that we need to mark it as pending in cm109_open().

Reported-and-tested-by: syzbot+150f793ac5bc18eee150@syzkaller.appspotmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/cm109.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index e413801f0491..f515fae465c3 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -568,12 +568,15 @@ static int cm109_input_open(struct input_dev *idev)
 	dev->ctl_data->byte[HID_OR2] = dev->keybit;
 	dev->ctl_data->byte[HID_OR3] = 0x00;
 
+	dev->ctl_urb_pending = 1;
 	error = usb_submit_urb(dev->urb_ctl, GFP_KERNEL);
-	if (error)
+	if (error) {
+		dev->ctl_urb_pending = 0;
 		dev_err(&dev->intf->dev, "%s: usb_submit_urb (urb_ctl) failed %d\n",
 			__func__, error);
-	else
+	} else {
 		dev->open = 1;
+	}
 
 	mutex_unlock(&dev->pm_mutex);
 
-- 
2.29.2.576.ga3fc446d84-goog


-- 
Dmitry
