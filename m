Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77D92023CC
	for <lists+linux-input@lfdr.de>; Sat, 20 Jun 2020 14:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728086AbgFTMeU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jun 2020 08:34:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24867 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727964AbgFTMeS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jun 2020 08:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592656457;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TyrLUhSpgAjrFkpnblWua2St2iTb7r3da/iWtP8ENOc=;
        b=cBaSB+/vF4t62Xh1Hs7jgs98/9KKyAon5573rEfZ/UYY2+U4nB0Vb0mOS2147lYfGolrEU
        BzOLKWNNVlajpDrPf+znR6X6huhebL+Bnz0WBKUeBn+Lu4BKG6wvaEr1swu/fMC0oW2ekK
        gTEau0dbDOwNyKECaMFa34DTOlpLwrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-gAlfqltYOLi9f-Yd7_bQUw-1; Sat, 20 Jun 2020 08:34:15 -0400
X-MC-Unique: gAlfqltYOLi9f-Yd7_bQUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7714100D0D8;
        Sat, 20 Jun 2020 12:34:14 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-42.ams2.redhat.com [10.36.112.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 299FF71676;
        Sat, 20 Jun 2020 12:34:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 1/2] Input: soc_button_array - Add active_low setting to soc_button_info
Date:   Sat, 20 Jun 2020 14:34:11 +0200
Message-Id: <20200620123412.40465-2-hdegoede@redhat.com>
In-Reply-To: <20200620123412.40465-1-hdegoede@redhat.com>
References: <20200620123412.40465-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a preparation patch for adding support for Intel INT33D3
ACPI devices. These INT33D3 devices follow yet another Intel defined
(but not documented) ACPI GPIO button standard.

Unlike the ACPI GPIO button devices supported so far, the GPIO used in
the INT33D3 devices is active-high, rather then active-low.

This commit makes setting the gpio_keys_button.active_low flag
configurable through the soc_button_info struct and enables it for all
currently supported devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 08520b3a18b8..e3a22a61f5d9 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -23,6 +23,7 @@ struct soc_button_info {
 	unsigned int event_code;
 	bool autorepeat;
 	bool wakeup;
+	bool active_low;
 };
 
 struct soc_device_data {
@@ -110,7 +111,7 @@ soc_button_device_create(struct platform_device *pdev,
 		gpio_keys[n_buttons].type = info->event_type;
 		gpio_keys[n_buttons].code = info->event_code;
 		gpio_keys[n_buttons].gpio = gpio;
-		gpio_keys[n_buttons].active_low = 1;
+		gpio_keys[n_buttons].active_low = info->active_low;
 		gpio_keys[n_buttons].desc = info->name;
 		gpio_keys[n_buttons].wakeup = info->wakeup;
 		/* These devices often use cheap buttons, use 50 ms debounce */
@@ -173,6 +174,7 @@ static int soc_button_parse_btn_desc(struct device *dev,
 	}
 
 	info->event_type = EV_KEY;
+	info->active_low = true;
 	info->acpi_index =
 		soc_button_get_acpi_object_int(&desc->package.elements[1]);
 	upage = soc_button_get_acpi_object_int(&desc->package.elements[3]);
@@ -383,11 +385,11 @@ static int soc_button_probe(struct platform_device *pdev)
  * Platforms"
  */
 static const struct soc_button_info soc_button_PNP0C40[] = {
-	{ "power", 0, EV_KEY, KEY_POWER, false, true },
-	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true },
-	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
-	{ "volume_down", 3, EV_KEY, KEY_VOLUMEDOWN, true, false },
-	{ "rotation_lock", 4, EV_KEY, KEY_ROTATE_LOCK_TOGGLE, false, false },
+	{ "power", 0, EV_KEY, KEY_POWER, false, true, true },
+	{ "home", 1, EV_KEY, KEY_LEFTMETA, false, true, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false, true },
+	{ "volume_down", 3, EV_KEY, KEY_VOLUMEDOWN, true, false, true },
+	{ "rotation_lock", 4, EV_KEY, KEY_ROTATE_LOCK_TOGGLE, false, false, true },
 	{ }
 };
 
@@ -444,9 +446,9 @@ static int soc_device_check_MSHW0040(struct device *dev)
  * Obtained from DSDT/testing.
  */
 static const struct soc_button_info soc_button_MSHW0040[] = {
-	{ "power", 0, EV_KEY, KEY_POWER, false, true },
-	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false },
-	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false },
+	{ "power", 0, EV_KEY, KEY_POWER, false, true, true },
+	{ "volume_up", 2, EV_KEY, KEY_VOLUMEUP, true, false, true },
+	{ "volume_down", 4, EV_KEY, KEY_VOLUMEDOWN, true, false, true },
 	{ }
 };
 
-- 
2.26.2

