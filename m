Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F5A34A9FC
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhCZOf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhCZOfV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:21 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13CB9C0613B1
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:21 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id x16so5868170wrn.4
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ncqrjTAWBMAuIT+QNk4MgUhfbKLtj8kt+uo2wlM/dg=;
        b=weMDUSGRSCQGL4pgXx8iQgbzg5Nye4DqunH91ALPfVpL5kE61ywzM7VTxlg2W7Es4D
         oNQa61mKg+gtrY4ryXcuLjSNGXUo582RhCNDzKcAWTNYnZqo+iEGaTZB7ODutah3VICz
         +ev6t1uq/xB+BZt0yxA4rdMu4uEmmHNJS57KeVoZc+ZBZsfg1oYGKCBVStk7iWMD2no/
         0gFlTPKYmzJ6xHMKfMj+hVG4nuYcjMFnEMqeDwgoqa5NpL46gHUhKu04TXjeijAwJaaR
         7EMiJjqTZBorv+b5NJvNcnTGRJA4riENhLqjOa0iZosr5fYSrUcJlh13WbZxUGjW+fLz
         Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ncqrjTAWBMAuIT+QNk4MgUhfbKLtj8kt+uo2wlM/dg=;
        b=TznThZ0f6Y8MugK3oHJTvMZiaHB1+0/9nMhlZC6+CZR59k6Qb0N9lPh+Srf7MN7QuF
         0Di8jSq/Co04vk72LNVnvTCdN02mYsAJRu4VD1xLCZIELC7vemlLDZk7SatfvOyP69or
         ZOwZ5YwyKK0hZSpWeNolVY569iin8EskD61kun+cVXfcQVBFErxrdsfFFOfCo2bFnywv
         Fe8HeaOpkgMvlHf/TXbOzPrVTBTeeiirRh0rXe5Fr03bd8bkLjOVc5pwX6aBsiRJtrQE
         HuCR8JaN4ojgoUABRtVh4hhg9xXitY0u+kUvApYcqOcB3GfZ+6XTc1xkHzNWZdY/Hl1E
         EltA==
X-Gm-Message-State: AOAM532lk6VcT5LQ2/aJqNTPuFnl3gC8jRGMsT50OqzfqzcHNZY7ioBw
        QQzvpAEDfonsYwU9LYMPgsyKfA==
X-Google-Smtp-Source: ABdhPJxmQkgaSlZ6BYyWv6tZwjthp9lMrPlua6NXOhA6VZmavOYOxv6tr/znawI4FNqHcL2lE7SBRQ==
X-Received: by 2002:a5d:6307:: with SMTP id i7mr15081805wru.305.1616769319829;
        Fri, 26 Mar 2021 07:35:19 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:19 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dario Pagani <dario.pagani.146+linuxk@gmail.com>,
        Kim Kuparinen <kimi.h.kuparinen@gmail.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 18/25] HID: hid-thrustmaster: Demote a bunch of kernel-doc abuses
Date:   Fri, 26 Mar 2021 14:34:51 +0000
Message-Id: <20210326143458.508959-20-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-thrustmaster.c:23: warning: Incorrect use of kernel-doc format:  * These interrupts are used to prevent a nasty crash when initializing the
 drivers/hid/hid-thrustmaster.c:26: warning: cannot understand function prototype: 'const u8 setup_0[] = '
 drivers/hid/hid-thrustmaster.c:49: warning: cannot understand function prototype: 'struct tm_wheel_info '
 drivers/hid/hid-thrustmaster.c:62: warning: wrong kernel-doc identifier on line:
 drivers/hid/hid-thrustmaster.c:84: warning: cannot understand function prototype: 'struct __packed tm_wheel_response '
 drivers/hid/hid-thrustmaster.c:143: warning: wrong kernel-doc identifier on line:
 drivers/hid/hid-thrustmaster.c:202: warning: Function parameter or member 'urb' not described in 'thrustmaster_model_handler'
 drivers/hid/hid-thrustmaster.c:202: warning: expecting prototype for Called by the USB subsystem when the wheel responses to our request(). Prototype was for thrustmaster_model_handler() instead
 drivers/hid/hid-thrustmaster.c:265: warning: wrong kernel-doc identifier on line:

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Dario Pagani <dario.pagani.146+linuxk@gmail.com>
Cc: Kim Kuparinen <kimi.h.kuparinen@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-thrustmaster.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index bfcd08759ba09..4f9c0642e816b 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * When connected to the machine, the Thrustmaster wheels appear as
  * a «generic» hid gamepad called "Thrustmaster FFB Wheel".
  *
@@ -19,7 +19,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 
-/**
+/*
  * These interrupts are used to prevent a nasty crash when initializing the
  * T300RS. Used in thrustmaster_interrupts().
  */
@@ -36,7 +36,7 @@ static const unsigned int setup_arr_sizes[] = {
 	ARRAY_SIZE(setup_3),
 	ARRAY_SIZE(setup_4)
 };
-/**
+/*
  * This struct contains for each type of
  * Thrustmaster wheel
  *
@@ -49,7 +49,7 @@ static const unsigned int setup_arr_sizes[] = {
 struct tm_wheel_info {
 	uint16_t wheel_type;
 
-	/**
+	/*
 	 * See when the USB control out packet is prepared...
 	 * @TODO The TMX seems to require multiple control codes to switch.
 	 */
@@ -58,7 +58,7 @@ struct tm_wheel_info {
 	char const *const wheel_name;
 };
 
-/**
+/*
  * Known wheels.
  * Note: TMX does not work as it requires 2 control packets
  */
@@ -72,7 +72,7 @@ static const struct tm_wheel_info tm_wheels_infos[] = {
 
 static const uint8_t tm_wheels_infos_length = 4;
 
-/**
+/*
  * This structs contains (in little endian) the response data
  * of the wheel to the request 73
  *
@@ -82,7 +82,7 @@ static const uint8_t tm_wheels_infos_length = 4;
  */
 struct __packed tm_wheel_response
 {
-	/**
+	/*
 	 * Seems to be the type of packet
 	 * - 0x0049 if is data.a (15 bytes)
 	 * - 0x0047 if is data.b (7 bytes)
@@ -93,7 +93,7 @@ struct __packed tm_wheel_response
 		struct __packed {
 			uint16_t field0;
 			uint16_t field1;
-			/**
+			/*
 			 * Seems to be the model code of the wheel
 			 * Read table thrustmaster_wheels to values
 			 */
@@ -122,7 +122,7 @@ struct tm_wheel {
 	struct usb_ctrlrequest *change_request;
 };
 
-/** The control packet to send to wheel */
+/* The control packet to send to wheel */
 static const struct usb_ctrlrequest model_request = {
 	.bRequestType = 0xc1,
 	.bRequest = 73,
@@ -139,7 +139,7 @@ static const struct usb_ctrlrequest change_request = {
 	.wLength = 0
 };
 
-/**
+/*
  * On some setups initializing the T300RS crashes the kernel,
  * these interrupts fix that particular issue. So far they haven't caused any
  * adverse effects in other wheels.
@@ -191,7 +191,7 @@ static void thrustmaster_change_handler(struct urb *urb)
 		hid_warn(hdev, "URB to change wheel mode seems to have failed with error %d\n", urb->status);
 }
 
-/**
+/*
  * Called by the USB subsystem when the wheel responses to our request
  * to get [what it seems to be] the wheel's model.
  *
@@ -261,7 +261,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 	hid_hw_stop(hdev);
 }
 
-/**
+/*
  * Function called by HID when a hid Thrustmaster FFB wheel is connected to the host.
  * This function starts the hid dev, tries to allocate the tm_wheel data structure and
  * finally send an USB CONTROL REQUEST to the wheel to get [what it seems to be] its
-- 
2.27.0

