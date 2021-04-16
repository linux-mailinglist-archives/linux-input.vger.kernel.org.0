Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89A5236209B
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235575AbhDPNOA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26514 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235252AbhDPNN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uPniQ55/p3S2h23mtw/MqnwWJYYEEkCWf3qP1ZgqZ3E=;
        b=f93NZsiFYsR2ee263oJbRoINZAb9RdDbgg6gSlfUUwu7cnfC+51uio2OxuPdf8allzf8YU
        8Kn0rnTe9lqQz68M3d10AqcJdy8fBtZMhlN+JnuegFgaNQGRCKBDQ9uK1KqwE/mL0DN8VQ
        +cjltFB2a4VDFE3IWO1gBl93Y6WkAak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-pC4PdPj6MvyTT91c0gWhug-1; Fri, 16 Apr 2021 09:13:32 -0400
X-MC-Unique: pC4PdPj6MvyTT91c0gWhug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06C9081425A;
        Fri, 16 Apr 2021 13:13:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EAEB55C266;
        Fri, 16 Apr 2021 13:13:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 2/6] HID: lg-g15: Add a lg_g15_handle_lcd_menu_keys() helper function
Date:   Fri, 16 Apr 2021 15:13:19 +0200
Message-Id: <20210416131323.233184-3-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Factor out the handling of the G15 LCD menu keys out of
lg_g15_event() into a new lg_g15_handle_lcd_menu_keys() helper function.

This is a preparation patch for adding support for the LCD menu
keys on the Logitech Z-10 speakers (with LCD) which use the same
funky HID report format.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index b887af72957c..75a27b48d9c9 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -464,6 +464,19 @@ static int lg_g15_get_initial_led_brightness(struct lg_g15_data *g15)
 /******** Input functions ********/
 
 /* On the G15 Mark I Logitech has been quite creative with which bit is what */
+static void lg_g15_handle_lcd_menu_keys(struct lg_g15_data *g15, u8 *data)
+{
+	int i, val;
+
+	/* Most left (round/display) button below the LCD */
+	input_report_key(g15->input, KEY_KBD_LCD_MENU1, data[8] & 0x80);
+	/* 4 other buttons below the LCD */
+	for (i = 0; i < 4; i++) {
+		val = data[i + 2] & 0x80;
+		input_report_key(g15->input, KEY_KBD_LCD_MENU2 + i, val);
+	}
+}
+
 static int lg_g15_event(struct lg_g15_data *g15, u8 *data)
 {
 	int i, val;
@@ -494,13 +507,7 @@ static int lg_g15_event(struct lg_g15_data *g15, u8 *data)
 	/* MR */
 	input_report_key(g15->input, KEY_MACRO_RECORD_START, data[7] & 0x40);
 
-	/* Most left (round) button below the LCD */
-	input_report_key(g15->input, KEY_KBD_LCD_MENU1, data[8] & 0x80);
-	/* 4 other buttons below the LCD */
-	for (i = 0; i < 4; i++) {
-		val = data[i + 2] & 0x80;
-		input_report_key(g15->input, KEY_KBD_LCD_MENU2 + i, val);
-	}
+	lg_g15_handle_lcd_menu_keys(g15, data);
 
 	/* Backlight cycle button pressed? */
 	if (data[1] & 0x80)
-- 
2.31.1

