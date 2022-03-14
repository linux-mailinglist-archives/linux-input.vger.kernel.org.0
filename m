Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 651834D8199
	for <lists+linux-input@lfdr.de>; Mon, 14 Mar 2022 12:47:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236452AbiCNLs5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Mar 2022 07:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232688AbiCNLs5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Mar 2022 07:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3C4F710FD4
        for <linux-input@vger.kernel.org>; Mon, 14 Mar 2022 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647258465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=bcpZVS9jvdmkopqFrbtM3sjMZDj+ts0ptUqEv+TD0sY=;
        b=d79WQB1Evn8/Teji+NbFGplBliDKzF8lqtUUyqtPidTAOaQaM9ChdPeeSXKSnDYY6tUojr
        kkFs7aNyCD+rWp+ou9zX1ZbR9lk2+5KjLOs/Eg4mo0qy8ryZTVk/kcnyogcmt0x1/qPBpx
        1C8QwCJVV+Tz3GxU9iQSdEmNhwGcpaE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-SsaBBhlINP2IPj14h3fADw-1; Mon, 14 Mar 2022 07:47:44 -0400
X-MC-Unique: SsaBBhlINP2IPj14h3fADw-1
Received: by mail-oi1-f200.google.com with SMTP id g5-20020a0568080dc500b002d73eb5c37fso11448981oic.16
        for <linux-input@vger.kernel.org>; Mon, 14 Mar 2022 04:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bcpZVS9jvdmkopqFrbtM3sjMZDj+ts0ptUqEv+TD0sY=;
        b=u8tSMhFyW7h1ORCsJVZPNw38BizRvPobEQb0iS0f5a43d1tqbcAZd+oAf4tHnOfItq
         A0IwaaR3kg199AKn2YNZ7KRsRsvB2xYTIfT2LEDCJtVwataX+z4BgR5oL6wluf86QAsp
         0dAzmsaAYN0ALilvo4y/oOcn1kDKDtYRE8xjgprO5skqtv4LSxT2z7S4beSQ8uvzF+fW
         5nnOk9EDo6Jk0RFH3eEFaM33yl8hhao8+Qi469piBjCf0HBbnokzI895X8gQLERinVnU
         pKLafLS+McTYNgDsp30qOFRFA6GdClTvwJTVUD8NEhmMdyN5ACkoaVy8Lt03IlMbR1Q6
         o9/g==
X-Gm-Message-State: AOAM533OXu0LY1nfUMRYhTOEtIKRxVBF+UHhfm56H62CYL2mzPgaL662
        JekoY1TJVEZL3dVZ/Ea/Hxns1Ltc3292eelUiNHG+kObzF2OVWjCA/+X9QPMwCEwuO8Ns1Lq4su
        U5JkQrjTAmOkAI+NU1ZSixJY=
X-Received: by 2002:a9d:a26:0:b0:5b2:62f9:8951 with SMTP id 35-20020a9d0a26000000b005b262f98951mr10746040otg.90.1647258463130;
        Mon, 14 Mar 2022 04:47:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwAqYk4P1BWHg3E8uMP/QwyEazpxiKmi1fZygLGLiMJjqBhE26gasRX3j+K/Rj2zdZtSk8vg==
X-Received: by 2002:a9d:a26:0:b0:5b2:62f9:8951 with SMTP id 35-20020a9d0a26000000b005b262f98951mr10746026otg.90.1647258462846;
        Mon, 14 Mar 2022 04:47:42 -0700 (PDT)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id 125-20020a4a1483000000b003175bffb677sm7367924ood.2.2022.03.14.04.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:47:42 -0700 (PDT)
From:   trix@redhat.com
To:     nehal-bakulchandra.shah@amd.com, basavaraj.natikar@amd.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com, lains@riseup.net,
        djogorchock@gmail.com, erazor_de@users.sourceforge.net,
        srinivas.pandruvada@linux.intel.com, Shyam-sundar.S-k@amd.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] HID: cleanup comments
Date:   Mon, 14 Mar 2022 04:47:34 -0700
Message-Id: <20220314114734.1606537-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

For spdx, move to first line, use // style comment

Double words removed
not, the, in

Replacements
stuructures to structures
Maganetic to Magnetic
repond to respond
behvaior to behavior
Secial to Special
informations to information

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h  | 8 ++++----
 drivers/hid/hid-logitech-hidpp.c                          | 2 +-
 drivers/hid/hid-magicmouse.c                              | 2 +-
 drivers/hid/hid-nintendo.c                                | 2 +-
 drivers/hid/hid-redragon.c                                | 2 +-
 drivers/hid/hid-roccat-kone.c                             | 4 ++--
 drivers/hid/hid-sony.c                                    | 2 +-
 drivers/hid/intel-ish-hid/ishtp-hid-client.c              | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
index 8d97ca0f9b526..b07dc4bbb858a 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * HID  descriptor stuructures
+ * HID  descriptor structures
  * Copyright 2020-2021 Advanced Micro Devices, Inc.
  * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  *	    Sandeep Singh <Sandeep.singh@amd.com>
@@ -429,21 +429,21 @@ const u8 comp3_report_descriptor[] = {
 0x95, 1,		/* HID report count(1) */
 0x55, 0x0F,		/* HID unit exponent(0x0F) */
 0xB1, 0x02,		/* HID feature (Data_Arr_Abs) */
-0x0A, 0x84, 0x14,	/* Maganetic flux and change sensitivity ABS) */
+0x0A, 0x84, 0x14,	/* Magnetic flux and change sensitivity ABS) */
 0x15, 0,		/* HID logical Min_8(0) */
 0x26, 0xFF, 0xFF,	/* HID logical Max_16(0xFF,0xFF) */
 0x75, 16,		/* HID report size(16) */
 0x95, 1,		/* HID report count(1) */
 0x55, 0x0E,		/* HID unit exponent(0x0E) */
 0xB1, 0x02,		/* HID feature (Data_Arr_Abs) */
-0x0A, 0x84, 0x24,	/* Maganetic flux and mod change sensitivity Max) */
+0x0A, 0x84, 0x24,	/* Magnetic flux and mod change sensitivity Max) */
 0x16, 0x01, 0x80,	/* HID logical Min_16(0x01,0x80) */
 0x26, 0xFF, 0x7F,	/* HID logical Max_16(0xFF,0x7F) */
 0x75, 16,		/* HID report size(16) */
 0x95, 1,		/* HID report count(1) */
 0x55, 0x0F,		/* HID unit exponent(0x0F) */
 0xB1, 0x02,		/* HID feature (Data_Arr_Abs) */
-0x0A, 0x84, 0x34,	/* Maganetic flux and mod change sensitivity Min */
+0x0A, 0x84, 0x34,	/* Magnetic flux and mod change sensitivity Min */
 0x16, 0x01, 0x80,	/* HID logical Min_16(0x01,0x80) */
 0x26, 0xFF, 0x7F,	/* HID logical Max_16(0xFF,0x7F) */
 0x75, 16,		/* HID report size(16) */
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 81de88ab2ecc7..68f9e9d207f42 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1694,7 +1694,7 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 			val->strval = hidpp->hid_dev->uniq;
 			break;
 		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-			/* hardware reports voltage in in mV. sysfs expects uV */
+			/* hardware reports voltage in mV. sysfs expects uV */
 			val->intval = hidpp->battery.voltage * 1000;
 			break;
 		case POWER_SUPPLY_PROP_CHARGE_TYPE:
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 664a624a363d0..f6790dc6fd026 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -869,7 +869,7 @@ static int magicmouse_probe(struct hid_device *hdev,
 	report->size = 6;
 
 	/*
-	 * Some devices repond with 'invalid report id' when feature
+	 * Some devices respond with 'invalid report id' when feature
 	 * report switching it into multitouch mode is sent to it.
 	 *
 	 * This results in -EIO from the _raw low-level transport callback,
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2204de889739f..0eb017333bca6 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1071,7 +1071,7 @@ static void joycon_parse_imu_report(struct joycon_ctlr *ctlr,
 	 * samples, so the IMU sampling rate should be avg_time_delta/3. We can
 	 * also use this average to detect events where we have dropped a
 	 * packet. The userspace timestamp for the samples will be adjusted
-	 * accordingly to prevent unwanted behvaior.
+	 * accordingly to prevent unwanted behavior.
 	 */
 	if (!ctlr->imu_first_packet_received) {
 		ctlr->imu_timestamp_us = 0;
diff --git a/drivers/hid/hid-redragon.c b/drivers/hid/hid-redragon.c
index 73c9d4c4fa34d..b32ac27940b29 100644
--- a/drivers/hid/hid-redragon.c
+++ b/drivers/hid/hid-redragon.c
@@ -1,8 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  HID driver for Redragon keyboards
  *
  *  Copyright (c) 2017 Robert Munteanu
- *  SPDX-License-Identifier: GPL-2.0+
  */
 
 /*
diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 76da04801ca9b..2ba5cc5a1ab6a 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -688,7 +688,7 @@ static int kone_init_kone_device_struct(struct usb_device *usb_dev,
  * Since IGNORE_MOUSE quirk moved to hid-apple, there is no way to bind only to
  * mousepart if usb_hid is compiled into the kernel and kone is compiled as
  * module.
- * Secial behaviour is bound only to mousepart since only mouseevents contain
+ * Special behaviour is bound only to mousepart since only mouseevents contain
  * additional notifications.
  */
 static int kone_init_specials(struct hid_device *hdev)
@@ -835,7 +835,7 @@ static void kone_report_to_chrdev(struct kone_device const *kone,
 
 /*
  * Is called for keyboard- and mousepart.
- * Only mousepart gets informations about special events in its extended event
+ * Only mousepart gets information about special events in its extended event
  * structure.
  */
 static int kone_raw_event(struct hid_device *hdev, struct hid_report *report,
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 60ec2b29d54de..03691cdcfb8e1 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -368,7 +368,7 @@ static const unsigned int buzz_keymap[] = {
 };
 
 /* The Navigation controller is a partial DS3 and uses the same HID report
- * and hence the same keymap indices, however not not all axes/buttons
+ * and hence the same keymap indices, however not all axes/buttons
  * are physically present. We use the same axis and button mapping as
  * the DS3, which uses the Linux gamepad spec.
  */
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 4338c9b68a43d..e3d70c5460e96 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -328,7 +328,7 @@ static void process_recv(struct ishtp_cl *hid_ishtp_cl, void *recv_buf,
 
 /**
  * ish_cl_event_cb() - bus driver callback for incoming message/packet
- * @device:	Pointer to the the ishtp client device for which this message
+ * @device:	Pointer to the ishtp client device for which this message
  *		is targeted
  *
  * Remove the packet from the list and process the message by calling
-- 
2.26.3

