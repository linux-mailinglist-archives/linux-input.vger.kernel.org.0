Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11E8347F81
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237270AbhCXReq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237269AbhCXRe3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:29 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EB3C061786
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:25 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b7so34261747ejv.1
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GplnaeoWUVj8YBA4hvKiO7ws+s2Csp6NEYWiX1mt5gw=;
        b=VHClLwAUzIb8iYeiAyEWXQru4R64ocooDxkmzS9YKD4aB311JjvITE3MmWSogieYag
         hRpDGdiOkCUTx9cPzBhC71za1sKvJ7t0ZphkRRsFrIjQPPaXz7x5AlZmRSGy1c5vhqGs
         kaAsZP4fqtKbuLLH7gYc83Gm+IZ7M5Icp7D/QqJrr2CmnfNtFAyyDskXEmRLAiADqw6i
         FqRP/52eFpkYV9FFFh/TmOdbiWypa6c/8hWLjXWw1nIlDamHHxkvrCCphAs0qnSmJfOu
         UPklZqyk98vshn1njj+OyITrLhuR8MTMYRWM/Kngvkc+s2vNrrPqtSzCmfZeyyI/oW8H
         y6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GplnaeoWUVj8YBA4hvKiO7ws+s2Csp6NEYWiX1mt5gw=;
        b=sqvitEJrBljaGmNimB7vwi/H5szm6xF1LklXT2r4/eZN2Pa4C+01a3V38YtM4HPYZe
         CUTpOJZtuHHNFOy1vcZaGS/sFdV7ph/ueH6NHUWHtEEAtoyt3xpqqBtOTOWgLdMUBHp1
         6Mm7wKzOP/FwLM5ettrywjryz2V7gUAyxzzCyRuo9svg3cK5rN0OvJ+i1FLYEOuFnRZr
         dOqYUy/zv8eGKg9gNv+q5VB3f5RA1EvUB4iwRIFsPRZJ0q3Msvx83/7xnxMmobu5XFAJ
         GEjw6CIVfpegxUCTzp5s01Pcd774psxLdt6D7jbw6vcrNks/FBx1OslHWXZmtesS7Ppi
         K8Rg==
X-Gm-Message-State: AOAM531WJJpAud3BfFa8n522GkXta816AvrNRUZKGaL+SBYndvRypu8p
        tBMTidd4IBQZeEqjWzy34N0KIA==
X-Google-Smtp-Source: ABdhPJyYu4OfJkDB02jrt02iTBQ1rdz4gwaiw4naFpRztIkA+MXS3Kxc9cXKU1EuXCk8F2b2bXzHmw==
X-Received: by 2002:a17:906:b297:: with SMTP id q23mr4986590ejz.315.1616607264319;
        Wed, 24 Mar 2021 10:34:24 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Lopez Casado <nlopezcasad@logitech.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 16/25] HID: hid-logitech-hidpp: Fix conformant kernel-doc header and demote abuses
Date:   Wed, 24 Mar 2021 17:33:55 +0000
Message-Id: <20210324173404.66340-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/hid-logitech-hidpp.c:275: warning: Function parameter or member 'hidpp' not described in 'hidpp_send_message_sync'
 drivers/hid/hid-logitech-hidpp.c:275: warning: Function parameter or member 'message' not described in 'hidpp_send_message_sync'
 drivers/hid/hid-logitech-hidpp.c:275: warning: Function parameter or member 'response' not described in 'hidpp_send_message_sync'
 drivers/hid/hid-logitech-hidpp.c:275: warning: expecting prototype for and something else(). Prototype was for hidpp_send_message_sync() instead
 drivers/hid/hid-logitech-hidpp.c:427: warning: wrong kernel-doc identifier on line:
 drivers/hid/hid-logitech-hidpp.c:470: warning: Function parameter or member 'input_dev' not described in 'hidpp_scroll_counter_handle_scroll'
 drivers/hid/hid-logitech-hidpp.c:1894: warning: Function parameter or member 'hidpp' not described in 'hidpp_touchpad_fw_items_set'
 drivers/hid/hid-logitech-hidpp.c:1894: warning: Function parameter or member 'feature_index' not described in 'hidpp_touchpad_fw_items_set'
 drivers/hid/hid-logitech-hidpp.c:1894: warning: Function parameter or member 'items' not described in 'hidpp_touchpad_fw_items_set'
 drivers/hid/hid-logitech-hidpp.c:1894: warning: expecting prototype for send a set state command to the device by reading the current items(). Prototype was for hidpp_touchpad_fw_items_set() instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Lopez Casado <nlopezcasad@logitech.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d459e2dbe6474..d598094dadd0c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -261,7 +261,7 @@ static int __hidpp_send_report(struct hid_device *hdev,
 	return ret == fields_count ? 0 : -1;
 }
 
-/**
+/*
  * hidpp_send_message_sync() returns 0 in case of success, and something else
  * in case of a failure.
  * - If ' something else' is positive, that means that an error has been raised
@@ -423,7 +423,7 @@ static inline bool hidpp_report_is_connect_event(struct hidpp_device *hidpp,
 		(report->rap.sub_id == 0x41));
 }
 
-/**
+/*
  * hidpp_prefix_name() prefixes the current given name with "Logitech ".
  */
 static void hidpp_prefix_name(char **name, int name_length)
@@ -454,6 +454,7 @@ static void hidpp_prefix_name(char **name, int name_length)
  * hidpp_scroll_counter_handle_scroll() - Send high- and low-resolution scroll
  *                                        events given a high-resolution wheel
  *                                        movement.
+ * @input_dev: Pointer to the input device
  * @counter: a hid_scroll_counter struct describing the wheel.
  * @hi_res_value: the movement of the wheel, in the mouse's high-resolution
  *                units.
@@ -1884,7 +1885,7 @@ struct hidpp_touchpad_fw_items {
 	uint8_t persistent;
 };
 
-/**
+/*
  * send a set state command to the device by reading the current items->state
  * field. items is then filled with the current state.
  */
-- 
2.27.0

