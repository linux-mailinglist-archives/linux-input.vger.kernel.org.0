Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04D33CF011
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 01:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352812AbhGSW5U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jul 2021 18:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345648AbhGSUPR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jul 2021 16:15:17 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2CBC061766
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:54:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so493863pju.4
        for <linux-input@vger.kernel.org>; Mon, 19 Jul 2021 13:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W22iJGxX2OAA41FydcLwVMM8jH6XnncPKRGPCWl0jvU=;
        b=Hx33IV2E49AjhtHem0Eyw3eyNYOkuPPWOh5OCMObrQqygCD1Yi0ZugQivJ5nmkBVCh
         dEIlAybrI362KO6hw8ZxmuM1uuQc2otXw+HjCyuAIMLVPihcjMNEOZkckxKQ4jFZLlSF
         N+qxKR7py6+Glppro5TIJcsV6l9jDX3NM/qbTjJ+gYlpDCR3RQDk52CdU7eMEJd+XfrS
         PRmTb3NOq5bQU1VHZjSlxYB7piXAu8F6ZBks+rRqFHy1EaokYW3bxMhCEzRINZ2XGFqH
         mO3mmoswId5kAoyiOnArt9LVQ4s968b8aObacGftjKP8Y5esV1vEMmZfdB5QiNDdoTVv
         xUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W22iJGxX2OAA41FydcLwVMM8jH6XnncPKRGPCWl0jvU=;
        b=JPIIRn+arlJgVSJXqUfRoEP0QFnW6W56k2Vz3yt0xibrWs9gCXD8yMxyVSg5zHVBmU
         95BQV6RM23zM6xCGrngFzTMmlVCheDSb5Xz/zNYfm4+0gUSRkTdnYbnYhbMBtJnnMePz
         97CXLynibMc3ZWrL9+m/T4loIAQbjEGvjZFAp25E80PhUpaJFu1Pomj8vMjb5gx1T3MF
         6j6L6v82LUKd7V7m6g5+P8hVWh5jVQ+w2b6aEv90kKrSf+3eC23Z9ffK8pF/Um0ao/KG
         BvO+3/m9I6aGNcx8NfP3U4tQxr/ftPAex0LC5xycVz34/OdnjISUwQVeHXTQh9AZu3Yu
         8DNQ==
X-Gm-Message-State: AOAM533IEPz8IYseNG8r5JXO6/2GRAGwIvQReCUuJTlEzW0k/9yXvFID
        PBI4t2jqcsx4YOnO5gPwkEYHeb7IBMvMXA==
X-Google-Smtp-Source: ABdhPJzcqSkC5RgUKGym1xqQDScCSgp4M9mOk0x1bctVsRXV7N3t7+Ew9+7mwYjzNhW3ZodsGmyJYQ==
X-Received: by 2002:a17:90a:7f02:: with SMTP id k2mr26152369pjl.134.1626728144007;
        Mon, 19 Jul 2021 13:55:44 -0700 (PDT)
Received: from horus.lan (71-34-86-28.ptld.qwest.net. [71.34.86.28])
        by smtp.gmail.com with ESMTPSA id y82sm21451233pfb.121.2021.07.19.13.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 13:55:43 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH 2/6] HID: wacom: set initial hardware touch switch state to 'off'
Date:   Mon, 19 Jul 2021 13:55:29 -0700
Message-Id: <20210719205533.2189804-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719205533.2189804-1-jason.gerecke@wacom.com>
References: <20210719205533.2189804-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ping Cheng <ping.cheng@wacom.com>

Wacom touch devices have two types of touch switches: softkey touch
toggle and hardware touch switch. For softkey toggle, we assume
touch is on by default in the driver. However the hardware touch
switch is controlled by end users. We don't know if it's on or off
before getting the status event.

This patch sets touch off for devices with a hardware switch until we
get the status. This is a bit safer for users who leave the switch "off"
and don't want any accidental touches. The tradeoff is a slight delay
between device connection and touch becoming enabled for users who
leave the switch "on".

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c |  8 +++++++-
 drivers/hid/wacom_wac.c | 12 ++++++++----
 drivers/hid/wacom_wac.h |  1 +
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 57bfa0ae9836..713a2504092f 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2287,7 +2287,13 @@ static void wacom_set_shared_values(struct wacom_wac *wacom_wac)
 
 	if (wacom_wac->has_mute_touch_switch) {
 		wacom_wac->shared->has_mute_touch_switch = true;
-		wacom_wac->shared->is_touch_on = true;
+		/* Hardware touch switch may be off. Wait until
+		 * we know the switch state to decide is_touch_on.
+		 * Softkey state should be initialized to "on" to
+		 * match historic default.
+		 */
+		if (wacom_wac->is_soft_touch_switch)
+			wacom_wac->shared->is_touch_on = true;
 	}
 
 	if (wacom_wac->shared->has_mute_touch_switch &&
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 496a000ef862..b87fbd2a81a6 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1987,14 +1987,17 @@ static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
 		features->numbered_buttons++;
 		features->device_type |= WACOM_DEVICETYPE_PAD;
 		break;
-	case WACOM_HID_WD_TOUCHONOFF:
 	case WACOM_HID_WD_MUTE_DEVICE:
+		/* softkey touch switch */
+		wacom_wac->is_soft_touch_switch = true;
+		fallthrough;
+	case WACOM_HID_WD_TOUCHONOFF:
 		/*
-		 * This usage, which is used to mute touch events, comes
-		 * from the pad packet, but is reported on the touch
+		 * These two usages, which are used to mute touch events, come
+		 * from the pad packet, but are reported on the touch
 		 * interface. Because the touch interface may not have
 		 * been created yet, we cannot call wacom_map_usage(). In
-		 * order to process this usage when we receive it, we set
+		 * order to process the usages when we receive them, we set
 		 * the usage type and code directly.
 		 */
 		wacom_wac->has_mute_touch_switch = true;
@@ -3832,6 +3835,7 @@ int wacom_setup_touch_input_capabilities(struct input_dev *input_dev,
 			input_dev->evbit[0] |= BIT_MASK(EV_SW);
 			__set_bit(SW_MUTE_DEVICE, input_dev->swbit);
 			wacom_wac->has_mute_touch_switch = true;
+			wacom_wac->is_soft_touch_switch = true;
 		}
 		fallthrough;
 
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 8f16654eca09..4e9eb0c1eff6 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -352,6 +352,7 @@ struct wacom_wac {
 	int mode_value;
 	struct hid_data hid_data;
 	bool has_mute_touch_switch;
+	bool is_soft_touch_switch;
 	bool has_mode_change;
 	bool is_direct_mode;
 	bool is_invalid_bt_frame;
-- 
2.32.0

