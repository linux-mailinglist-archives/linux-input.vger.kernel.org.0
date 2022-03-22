Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCDC4E484E
	for <lists+linux-input@lfdr.de>; Tue, 22 Mar 2022 22:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbiCVVew (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Mar 2022 17:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234571AbiCVVev (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Mar 2022 17:34:51 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC825DA32
        for <linux-input@vger.kernel.org>; Tue, 22 Mar 2022 14:33:21 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id mz9-20020a17090b378900b001c657559290so4457168pjb.2
        for <linux-input@vger.kernel.org>; Tue, 22 Mar 2022 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joshua-dickens-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R5rnRkyW+WOB8bhlNJdb6s4bV20490lK73kEByDAyvk=;
        b=eKfmDZnUe9/sWZkbt4spatu7g0WLmqtcvNaDxi2IGgA6IZ/J1VyOTfMdK3zsGtGTfX
         JUs+1rz8a2FedBOStqDrl8pD8KAIdBj/X4BLGIYAsp8CleIxSs9HT8OgS2o3Z+20yKDN
         J2czozYU97tcISHhfzdFsgaLMiQ6a2Jk1Y2eZl+9c1iBhB/4AeYkL1etJ7K884xzZnFk
         hSXhoyZsnQFf+mMq+G07oRZ33G6esN5IwFHQ5EmIqggdv/wOhjULVgvsElXiH6sj/IhW
         laeqdXbcSw3qpGWbFkkJnWKyqa3uOL1SBh6P08Jt63rlu7x/2BbeVQV9e5Sp3Ld1PXur
         fwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R5rnRkyW+WOB8bhlNJdb6s4bV20490lK73kEByDAyvk=;
        b=GvOnX2BN/7tIkEHl8Uni3vivNHReNrLhTuYjpc3XT1DySTefAOVSj/4EU0c43MDT3y
         prmt2b6Zj8BcOTI2uRzV7aG/m4GygRurlqCxgjxY5xy/al6leD7+Svvxzf7s7y3RKBIm
         7P4H1r7Cqd1Kk57kw35glCsmfUG473HytAaY24LMlYBgOVrXxCHd8uUHN2gIB38SJlcF
         QxvXPUOxrhz58QibsshxT7+DCo+0fIJJdZk5MdpfSDxhEL5Ho2oI4uqWXDSm4ATQ5hRQ
         PFUK+ye3LXs4IoG7dJKuSS2m3VCPb+giqUOCLge5ujYqsKo1PvOZKWtnCVqkiskRJPXh
         3irw==
X-Gm-Message-State: AOAM530cnnZ4pBaVT21yl8oruPnOp1tGKOKinz8jOqrhWklSvRzTjGBI
        e0G+5jtxLjrRjIxWKoELhmodMDVUsvcFe4aPlS76zw==
X-Google-Smtp-Source: ABdhPJxz8IhSpk+cZfH0YRntg6sP7tSeXcmokdwjCtyL+iK7jy1sTe+UdniD0tpcLTzkjWs9rtJbNA==
X-Received: by 2002:a17:90a:6393:b0:1bf:70e7:27d2 with SMTP id f19-20020a17090a639300b001bf70e727d2mr7413858pjj.1.1647984800659;
        Tue, 22 Mar 2022 14:33:20 -0700 (PDT)
Received: from fedora.. (c-76-27-202-13.hsd1.or.comcast.net. [76.27.202.13])
        by smtp.gmail.com with ESMTPSA id k12-20020a056a00134c00b004fabc8fa42esm3373672pfu.87.2022.03.22.14.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 14:33:20 -0700 (PDT)
From:   Joshua Dickens <joshua@joshua-dickens.com>
X-Google-Original-From: Joshua Dickens <Joshua@Joshua-Dickens.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua-Dickens <Joshua@Joshua-Dickens.com>,
        Joshua Dickens <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Adding Support for new usages
Date:   Tue, 22 Mar 2022 14:33:16 -0700
Message-Id: <20220322213316.101787-1-Joshua@Joshua-Dickens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Joshua-Dickens <Joshua@Joshua-Dickens.com>

Added supprt for the following usages:
* HID_DG_SCANTIME to report the timestamp for pen and touch events.
* WACOM_HID_WD_BARRELSWITCH3 to support pens with 3 buttons.
* WACOM_HID_WD_SEQUENCENUMBER to detect and report dropped packets.

Signed-off-by: Joshua Dickens <joshua.dickens@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 43 +++++++++++++++++++++++++++++++++--------
 drivers/hid/wacom_wac.h |  5 +++++
 2 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index a7176fc0635d..ce3555c54425 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1811,7 +1811,9 @@ int wacom_equivalent_usage(int usage)
 		    usage == WACOM_HID_WD_TOUCHSTRIP2 ||
 		    usage == WACOM_HID_WD_TOUCHRING ||
 		    usage == WACOM_HID_WD_TOUCHRINGSTATUS ||
-		    usage == WACOM_HID_WD_REPORT_VALID) {
+		    usage == WACOM_HID_WD_REPORT_VALID ||
+		    usage == WACOM_HID_WD_BARRELSWITCH3 ||
+		    usage == WACOM_HID_WD_SEQUENCENUMBER) {
 			return usage;
 		}
 
@@ -2196,8 +2198,11 @@ static void wacom_set_barrel_switch3_usage(struct wacom_wac *wacom_wac)
 	if (!(features->quirks & WACOM_QUIRK_AESPEN) &&
 	    wacom_wac->hid_data.barrelswitch &&
 	    wacom_wac->hid_data.barrelswitch2 &&
-	    wacom_wac->hid_data.serialhi)
+	    wacom_wac->hid_data.serialhi &&
+	    !wacom_wac->hid_data.barrelswitch3) {
 		input_set_capability(input, EV_KEY, BTN_STYLUS3);
+		features->quirks |= WACOM_QUIRK_PEN_BUTTON3;
+	}
 }
 
 static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
@@ -2261,6 +2266,9 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		features->quirks |= WACOM_QUIRK_TOOLSERIAL;
 		wacom_map_usage(input, usage, field, EV_MSC, MSC_SERIAL, 0);
 		break;
+	case HID_DG_SCANTIME:
+		wacom_map_usage(input, usage, field, EV_MSC, MSC_TIMESTAMP, 0);
+		break;
 	case WACOM_HID_WD_SENSE:
 		features->quirks |= WACOM_QUIRK_SENSE;
 		wacom_map_usage(input, usage, field, EV_KEY, BTN_TOOL_PEN, 0);
@@ -2274,6 +2282,11 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 		input_set_capability(input, EV_KEY, BTN_TOOL_AIRBRUSH);
 		wacom_map_usage(input, usage, field, EV_ABS, ABS_WHEEL, 0);
 		break;
+	case WACOM_HID_WD_BARRELSWITCH3:
+		wacom_wac->hid_data.barrelswitch3 = true;
+		wacom_map_usage(input, usage, field, EV_KEY, BTN_STYLUS3, 0);
+		features->quirks &= ~WACOM_QUIRK_PEN_BUTTON3;
+		break;
 	}
 }
 
@@ -2390,6 +2403,14 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 	case WACOM_HID_WD_REPORT_VALID:
 		wacom_wac->is_invalid_bt_frame = !value;
 		return;
+	case WACOM_HID_WD_BARRELSWITCH3:
+		wacom_wac->hid_data.barrelswitch3 = value;
+		return;
+	case WACOM_HID_WD_SEQUENCENUMBER:
+		if (wacom_wac->hid_data.sequence_number != value)
+			hid_warn(hdev, "Dropped %hu packets", value - wacom_wac->hid_data.sequence_number);
+		wacom_wac->hid_data.sequence_number = value + 1;
+		return;
 	}
 
 	/* send pen events only when touch is up or forced out
@@ -2442,12 +2463,15 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 
 	if (!delay_pen_events(wacom_wac) && wacom_wac->tool[0]) {
 		int id = wacom_wac->id[0];
-		int sw_state = wacom_wac->hid_data.barrelswitch |
-			       (wacom_wac->hid_data.barrelswitch2 << 1);
-
-		input_report_key(input, BTN_STYLUS, sw_state == 1);
-		input_report_key(input, BTN_STYLUS2, sw_state == 2);
-		input_report_key(input, BTN_STYLUS3, sw_state == 3);
+		if (wacom_wac->features.quirks & WACOM_QUIRK_PEN_BUTTON3 &&
+		    wacom_wac->hid_data.barrelswitch & wacom_wac->hid_data.barrelswitch2) {
+			wacom_wac->hid_data.barrelswitch = 0;
+			wacom_wac->hid_data.barrelswitch2 = 0;
+			wacom_wac->hid_data.barrelswitch3 = 1;
+		}
+		input_report_key(input, BTN_STYLUS, wacom_wac->hid_data.barrelswitch);
+		input_report_key(input, BTN_STYLUS2, wacom_wac->hid_data.barrelswitch2);
+		input_report_key(input, BTN_STYLUS3, wacom_wac->hid_data.barrelswitch3);
 
 		/*
 		 * Non-USI EMR tools should have their IDs mangled to
@@ -2529,6 +2553,9 @@ static void wacom_wac_finger_usage_mapping(struct hid_device *hdev,
 			field->logical_maximum = 255;
 		}
 		break;
+	case HID_DG_SCANTIME:
+		wacom_map_usage(input, usage, field, EV_MSC, MSC_TIMESTAMP, 0);
+		break;
 	}
 }
 
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 466b62cc16dc..46c1c761741f 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -86,6 +86,7 @@
 #define WACOM_QUIRK_AESPEN		0x0004
 #define WACOM_QUIRK_BATTERY		0x0008
 #define WACOM_QUIRK_TOOLSERIAL		0x0010
+#define WACOM_QUIRK_PEN_BUTTON3	0x0020
 
 /* device types */
 #define WACOM_DEVICETYPE_NONE           0x0000
@@ -108,6 +109,7 @@
 #define WACOM_HID_WD_DIGITIZERFNKEYS    (WACOM_HID_UP_WACOMDIGITIZER | 0x39)
 #define WACOM_HID_WD_SERIALNUMBER       (WACOM_HID_UP_WACOMDIGITIZER | 0x5b)
 #define WACOM_HID_WD_SERIALHI           (WACOM_HID_UP_WACOMDIGITIZER | 0x5c)
+#define WACOM_HID_WD_BARRELSWITCH3      (WACOM_HID_UP_WACOMDIGITIZER | 0x5d)
 #define WACOM_HID_WD_TOOLTYPE           (WACOM_HID_UP_WACOMDIGITIZER | 0x77)
 #define WACOM_HID_WD_DISTANCE           (WACOM_HID_UP_WACOMDIGITIZER | 0x0132)
 #define WACOM_HID_WD_TOUCHSTRIP         (WACOM_HID_UP_WACOMDIGITIZER | 0x0136)
@@ -115,6 +117,7 @@
 #define WACOM_HID_WD_TOUCHRING          (WACOM_HID_UP_WACOMDIGITIZER | 0x0138)
 #define WACOM_HID_WD_TOUCHRINGSTATUS    (WACOM_HID_UP_WACOMDIGITIZER | 0x0139)
 #define WACOM_HID_WD_REPORT_VALID       (WACOM_HID_UP_WACOMDIGITIZER | 0x01d0)
+#define WACOM_HID_WD_SEQUENCENUMBER     (WACOM_HID_UP_WACOMDIGITIZER | 0x0220)
 #define WACOM_HID_WD_ACCELEROMETER_X    (WACOM_HID_UP_WACOMDIGITIZER | 0x0401)
 #define WACOM_HID_WD_ACCELEROMETER_Y    (WACOM_HID_UP_WACOMDIGITIZER | 0x0402)
 #define WACOM_HID_WD_ACCELEROMETER_Z    (WACOM_HID_UP_WACOMDIGITIZER | 0x0403)
@@ -300,6 +303,7 @@ struct hid_data {
 	bool tipswitch;
 	bool barrelswitch;
 	bool barrelswitch2;
+	bool barrelswitch3;
 	bool serialhi;
 	bool confidence;
 	int x;
@@ -320,6 +324,7 @@ struct hid_data {
 	int bat_connected;
 	int ps_connected;
 	bool pad_input_event_flag;
+	unsigned short sequence_number;
 };
 
 struct wacom_remote_data {
-- 
2.35.1

