Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20DA5CDC4
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 12:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfGBKpf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jul 2019 06:45:35 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39383 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfGBKpf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jul 2019 06:45:35 -0400
Received: by mail-lj1-f193.google.com with SMTP id v18so16361073ljh.6
        for <linux-input@vger.kernel.org>; Tue, 02 Jul 2019 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OzV903G6oRdicXMmJCSJjOVrwM3mwI/PIVRxq1eL/AI=;
        b=YvC1pIZ/b2gQGcJLoG4bXjVzk08N3q60rd8zPkTK4fwRtUVYnS+GksM+iF1g2T57gA
         sz+DFiPGFST0TOHVWejXBjOlWDem1wGK5JorpOY2UwTgEtSY7aHCjgorDxOQZTZB8IH9
         l8QuZH06wFWAJhVCx66uCrdpoC9wHsQLSG4qPB0QWrRuUz+RPpvXxnQooEmSa/jVavMi
         RkdRR+Q2hX5B1muJUhNP6PfoItZ45loFvlj/TA+UDIAEsy7E0iAX6yv5HSDE2fKyYbau
         QIfL/KsGjKDxFCFKMut47nkxEMDmwvjzPDVssZDrYxXeORqmHZezZSkfYbqt4QS/NuwO
         9aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OzV903G6oRdicXMmJCSJjOVrwM3mwI/PIVRxq1eL/AI=;
        b=V9YVrfopoylqP86qpNhTvDVqaIl3Sdnb+JwxoDhnOdtx8CJ4jUtm/AwXZK0r1eJRvt
         9OGh2uZeGhSGwbNpWjD0/9fdPBwI+hsXy9uGl2YLBNwxIcihF2gQp9ZRddmivfrnb+b0
         0nszVzJyGO6KB2k5p9+J6/dervwrAE9vUvUbKPanByDtLyHcGs7gDDNe+h2leuj7lIMu
         AIE4JdAVc7aEWu+Yo8WCSG140kMtbFhPGiiumej+e6jrEgNmJypK7Cc5SAo1Op4Q2snM
         ZPaG4mpqlPppTxzgC0Jy8RXHfQmAzzxfJwuJBG+jDlxRgwGv7UQXem+WGPrufiO20TBE
         cNtA==
X-Gm-Message-State: APjAAAUzPB8UbDlS+tGsZQ2G4IJ9dKTU49m5yflDuZN5QvvKl7bTQDwg
        vg7C3FhJc2SLpHAUop95Aqk=
X-Google-Smtp-Source: APXvYqy8eEowJk1sttFynGxFCQQ4c24c9Z93KYWU2mR7QQF4pXvfFJe/fMWGdPPUwIdPHoOXlgPZ3A==
X-Received: by 2002:a2e:1290:: with SMTP id 16mr16323470ljs.88.1562064333685;
        Tue, 02 Jul 2019 03:45:33 -0700 (PDT)
Received: from lahvuun.homenetwork ([93.76.175.10])
        by smtp.gmail.com with ESMTPSA id u22sm4182289ljd.18.2019.07.02.03.45.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 03:45:32 -0700 (PDT)
Date:   Tue, 2 Jul 2019 13:45:31 +0300
From:   Ilya Trukhanov <lahvuun@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
Message-ID: <20190702104531.enu2krtofbtt5n2e@lahvuun.homenetwork>
References: <20190624152816.xbo2oqyviqbrpkur@lahvuun.homenetwork>
 <CAO-hwJJ7nnYftyBkjU3NXEMcLiBa29n7TL7ZfN+=QL0vESzZ=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJJ7nnYftyBkjU3NXEMcLiBa29n7TL7ZfN+=QL0vESzZ=g@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Benjamin,

Thank you for taking the time to reply.

I've sent the v2 patch with the following changes:

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 7408a4759b35..e5ca6fe2ca57 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -638,7 +638,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_THRUSTMASTER)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb300) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb324) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb605) },
diff --git a/drivers/hid/hid-tmff.c b/drivers/hid/hid-tmff.c
index 78b931d8617f..bdfc5ff3b2c5 100644
--- a/drivers/hid/hid-tmff.c
+++ b/drivers/hid/hid-tmff.c
@@ -22,6 +22,8 @@
 
 #include "hid-ids.h"
 
+#define THRUSTMASTER_DEVICE_ID_2_IN_1_DT	0xb320
+
 static const signed short ff_rumble[] = {
 	FF_RUMBLE,
 	-1
@@ -102,7 +104,7 @@ static int tmff_play(struct input_dev *dev, void *data,
 					ff_field->logical_maximum);
 
 		/* 2-in-1 strong motor is left */
-		if (hid->product == 0xb320) {
+		if (hid->product == THRUSTMASTER_DEVICE_ID_2_IN_1_DT) {
 			motor_swap = left;
 			left = right;
 			right = motor_swap;
@@ -234,7 +236,7 @@ static const struct hid_device_id tm_devices[] = {
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb304),   /* FireStorm Dual Power 2 (and 3) */
 		.driver_data = (unsigned long)ff_rumble },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb320),   /* Dual Trigger 2-in-1 */
+	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, THRUSTMASTER_DEVICE_ID_2_IN_1_DT),   /* Dual Trigger 2-in-1 */
 		.driver_data = (unsigned long)ff_rumble },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_THRUSTMASTER, 0xb323),   /* Dual Trigger 3-in-1 (PC Mode) */
 		.driver_data = (unsigned long)ff_rumble },
