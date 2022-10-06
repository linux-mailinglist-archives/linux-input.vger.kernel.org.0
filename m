Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E697E5F5E8F
	for <lists+linux-input@lfdr.de>; Thu,  6 Oct 2022 04:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiJFCCL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Oct 2022 22:02:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbiJFCCK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Oct 2022 22:02:10 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DB93F30F
        for <linux-input@vger.kernel.org>; Wed,  5 Oct 2022 19:02:08 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id b5so593090pgb.6
        for <linux-input@vger.kernel.org>; Wed, 05 Oct 2022 19:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=05se/QLxbcZC/U9SJgyBO6TtEpzcC1Jq7/S8OolD1VM=;
        b=HRviHXRXeKUirb9N5uHMQ4dpr977PHs6a7po5onser1w7SIsWAcCGVmFJC9LltkYnT
         2l8RTPYq7xnXrF2Yu1xNA7C05VJ3F9MUUiKvJlDzQIi/iyQGaA1yTl1YZVj3GWYilqG9
         qjI2JyRUKNR5PkwZfvVFOC0KR90C1rrf3Pr2DKeT8JKPv/MJopHyg6HIU2EK+V9hDaiR
         slXT4/fsi5aZRSlOXkTKM8TEfms9oKSSG3bJwAgoiaEAGKc8pgDNyqh9KvO6da0ROqA6
         /Yij6e95qEK2FXVa4e5AFM792MPLIVTqp+brQ1EozxEFGcnfH9ete5TGbJ7sul4SHg36
         e4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=05se/QLxbcZC/U9SJgyBO6TtEpzcC1Jq7/S8OolD1VM=;
        b=W5IfODeSwsoVid5awenMQipbrm7dgiIAMIp7K25CKz2F70nKeVKuRybTOAYXv8No4u
         h7PTukELnRdi0UDw2Iu/4xyRfIW0F0QENDVipIPimdi2h0O3etcTdbcc6q/rWKiKq08H
         AypANsh75/Wb3MsjQBeM8BmorBKY+0fbbRt/jIgHWCYRLUCOyBMlBQDp4ORVIzL8NO14
         8AKsVh8rgJOlNwMClzglviptRWmEnDaKNINXN52Yp4jVxdoAbqeS7pucxoYXAdXpRe7Z
         5HrK5tlyDdRRntISctytb0YqrvbU10qlC/ypwlrMHwwXJr0bcWgMGd5hyzX3klxeICV+
         lZ5g==
X-Gm-Message-State: ACrzQf0dQl9NCrD6ngwscwcmfnxNahhZMRMXE1tPuWGZ55EzJkvjnR3F
        131W/cHAKZKfY3Q66fD+B9srMQ==
X-Google-Smtp-Source: AMsMyM5XjzTkqUBSbSVuH8sG/Pgz+akZJGYKBC9vDvNsIRdwrZ63ulNRPug+J62l6dbhw5OitrE6PQ==
X-Received: by 2002:a05:6a00:1249:b0:543:aa0a:9c0a with SMTP id u9-20020a056a00124900b00543aa0a9c0amr2779522pfi.2.1665021728221;
        Wed, 05 Oct 2022 19:02:08 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id w13-20020a63d74d000000b0043be67b6304sm482768pgi.0.2022.10.05.19.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:02:07 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        stable@vger.kernel.org
Subject: [PATCH 2/3] HID: playstation: add initial DualSense Edge controller support
Date:   Wed,  5 Oct 2022 19:01:50 -0700
Message-Id: <20221006020151.132434-3-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221006020151.132434-1-roderick.colenbrander@sony.com>
References: <20221006020151.132434-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Provide initial support for the DualSense Edge controller. The brings
support up to the level of the original DualSense, but won't yet provide
support for new features (e.g. reprogrammable buttons).

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
CC: stable@vger.kernel.org
---
 drivers/hid/hid-ids.h         | 1 +
 drivers/hid/hid-playstation.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f80d6193fca6..cd8087ed412c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1142,6 +1142,7 @@
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2	0x09cc
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE	0x0ba0
 #define USB_DEVICE_ID_SONY_PS5_CONTROLLER	0x0ce6
+#define USB_DEVICE_ID_SONY_PS5_CONTROLLER_2	0x0df2
 #define USB_DEVICE_ID_SONY_MOTION_CONTROLLER	0x03d5
 #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER	0x042f
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d727cd2bf44e..396356b6760a 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1464,7 +1464,8 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_stop;
 	}
 
-	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER ||
+		hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
 		dev = dualsense_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualsense.\n");
@@ -1499,6 +1500,8 @@ static void ps_remove(struct hid_device *hdev)
 static const struct hid_device_id ps_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ps_devices);
-- 
2.37.3

