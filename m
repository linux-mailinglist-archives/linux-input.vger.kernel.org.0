Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622C22AD058
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 08:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgKJHWg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 02:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJHWf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 02:22:35 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726E9C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 23:22:34 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id z1so6025785plo.12
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 23:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U2wmd8E30VXBNniV0j7JBzF/Qznio3upP+g2QyP8x4g=;
        b=mYS9cE91fb2g+uJAhpmy1E1y973b/n5/pO58kNhvZn2AMvwQMDbLeDwaPP+p+Hjuys
         Im6pd7I3Rqa5l80GERseqP/qLA0VXhnc0P/RIqiFVWoZ45r8JqNVLI1+Lkjt714coIRf
         Ux/jD5JFKA03F3ZO75J3stg+VglxdH7PZ5EWal2AZkkE+xKAqgcVA/HCAmvfZ9FVix1t
         ObRVa0FgeV7ZG/MPJZbwt5OTqMz6tgH+5P/H90d+EnEyv4poC03aZe4ztamfrRcYdyaz
         cuHtiegldW0mOkeUXaJ/syWmr8tkEMAncW6Exe9l1Rgz2P/n/OKY6aFjict1Gmvg93UA
         9sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U2wmd8E30VXBNniV0j7JBzF/Qznio3upP+g2QyP8x4g=;
        b=fcUiIv3rt48MqT3kJZZz+xtUu96+qm0+euO461w0KRST1s2K5+yeKbnDXJ9qWE10m2
         xJTnZjhOR4WUzgAXK05wd2gHV7HtUwJZZw5y9UQrCQskdTeB6uo/J1hyFOCkcptTkprH
         GGYchPYZKObiVydDdOYKpWu8qFhLYh1jpxhWTgVWAsvKCQpof2B1gcnyraPQResUr2Ed
         VHJQKzYn91eeC6CQSYiDwVTmcxuLN2F7DnOTy08R/Bh68jKk+LGtQ7kUh30nfQPYVrMZ
         bQ74jwXpgGnVRyoU/9O+bdJgB2HNvxmINXr/dLKLOet0+Uc6wjS7rO9VBJsnoHn3mP62
         xm8A==
X-Gm-Message-State: AOAM531IHbjwmmTAJOlbpk/LHY6tRSiXZ9SOqk3MDOM/PEZEkSeLtUGc
        JlP+XBxybKfZtjKD+z7bWgmrfA==
X-Google-Smtp-Source: ABdhPJxoQlHEaNsVClwIuEAaMOobLE8qOxADKA0A2OoO5YnotFUW0lY5q8BBDlzmStlkqX9GVUJdUQ==
X-Received: by 2002:a17:902:8e8b:b029:d2:4276:1df0 with SMTP id bg11-20020a1709028e8bb02900d242761df0mr15609741plb.62.1604992954026;
        Mon, 09 Nov 2020 23:22:34 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id j11sm12908189pfh.143.2020.11.09.23.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:22:33 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 1/3] HID: sony: Report more accurate DS4 power status.
Date:   Mon,  9 Nov 2020 23:22:27 -0800
Message-Id: <20201110072229.9112-2-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110072229.9112-1-roderick@gaikai.com>
References: <20201110072229.9112-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

This patch moves the power supply status logic to DS3/DS4 parse_report,
to allow for more accurate DS4 status reporting.

The DS4 power status code was actually incorrect, but reported okay'ish
data in most cases. There was a different interpretation of the battery_info
values 0-10 or 0-9 depending on cable state. It added +1 to extend the range
to 0-10. This is actually incorrect, there is no different range. Values
higher than 11 actually indicates 'full' and 14/15 'error' for which we
reported 100% and a valid power state.

Moving the status logic to parse_report avoids having to pass more state
to the generic sony_battery_get_property and simplifies the code.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-sony.c | 85 +++++++++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 35 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 2f073f536070..81d526a5d003 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -562,9 +562,8 @@ struct sony_sc {
 	u8 hotplug_worker_initialized;
 	u8 state_worker_initialized;
 	u8 defer_initialization;
-	u8 cable_state;
-	u8 battery_charging;
 	u8 battery_capacity;
+	int battery_status;
 	u8 led_state[MAX_LEDS];
 	u8 led_delay_on[MAX_LEDS];
 	u8 led_delay_off[MAX_LEDS];
@@ -892,7 +891,8 @@ static void sixaxis_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	static const u8 sixaxis_battery_capacity[] = { 0, 1, 25, 50, 75, 100 };
 	unsigned long flags;
 	int offset;
-	u8 cable_state, battery_capacity, battery_charging;
+	u8 battery_capacity;
+	int battery_status;
 
 	/*
 	 * The sixaxis is charging if the battery value is 0xee
@@ -904,19 +904,16 @@ static void sixaxis_parse_report(struct sony_sc *sc, u8 *rd, int size)
 
 	if (rd[offset] >= 0xee) {
 		battery_capacity = 100;
-		battery_charging = !(rd[offset] & 0x01);
-		cable_state = 1;
+		battery_status = (rd[offset] & 0x01) ? POWER_SUPPLY_STATUS_FULL : POWER_SUPPLY_STATUS_CHARGING;
 	} else {
 		u8 index = rd[offset] <= 5 ? rd[offset] : 5;
 		battery_capacity = sixaxis_battery_capacity[index];
-		battery_charging = 0;
-		cable_state = 0;
+		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
 	}
 
 	spin_lock_irqsave(&sc->lock, flags);
-	sc->cable_state = cable_state;
 	sc->battery_capacity = battery_capacity;
-	sc->battery_charging = battery_charging;
+	sc->battery_status = battery_status;
 	spin_unlock_irqrestore(&sc->lock, flags);
 
 	if (sc->quirks & SIXAXIS_CONTROLLER) {
@@ -944,7 +941,8 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	struct input_dev *input_dev = hidinput->input;
 	unsigned long flags;
 	int n, m, offset, num_touch_data, max_touch_data;
-	u8 cable_state, battery_capacity, battery_charging;
+	u8 cable_state, battery_capacity;
+	int battery_status;
 	u16 timestamp;
 
 	/* When using Bluetooth the header is 2 bytes longer, so skip these. */
@@ -1049,29 +1047,52 @@ static void dualshock4_parse_report(struct sony_sc *sc, u8 *rd, int size)
 	 */
 	offset = data_offset + DS4_INPUT_REPORT_BATTERY_OFFSET;
 	cable_state = (rd[offset] >> 4) & 0x01;
-	battery_capacity = rd[offset] & 0x0F;
 
 	/*
-	 * When a USB power source is connected the battery level ranges from
-	 * 0 to 10, and when running on battery power it ranges from 0 to 9.
-	 * A battery level above 10 when plugged in means charge completed.
+	 * Interpretation of the battery_capacity data depends on the cable state.
+	 * When no cable is connected (bit4 is 0):
+	 * - 0:10: percentage in units of 10%.
+	 * When a cable is plugged in:
+	 * - 0-10: percentage in units of 10%.
+	 * - 11: battery is full
+	 * - 14: not charging due to Voltage or temperature error
+	 * - 15: charge error
 	 */
-	if (!cable_state || battery_capacity > 10)
-		battery_charging = 0;
-	else
-		battery_charging = 1;
+	if (cable_state) {
+		u8 battery_data = rd[offset] & 0xf;
+
+		if (battery_data < 10) {
+			/* Take the mid-point for each battery capacity value,
+			 * because on the hardware side 0 = 0-9%, 1=10-19%, etc.
+			 * This matches official platform behavior, which does
+			 * the same.
+			 */
+			battery_capacity = battery_data * 10 + 5;
+			battery_status = POWER_SUPPLY_STATUS_CHARGING;
+		} else if (battery_data == 10) {
+			battery_capacity = 100;
+			battery_status = POWER_SUPPLY_STATUS_CHARGING;
+		} else if (battery_data == 11) {
+			battery_capacity = 100;
+			battery_status = POWER_SUPPLY_STATUS_FULL;
+		} else { /* 14, 15 and undefined values */
+			battery_capacity = 0;
+			battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
+		}
+	} else {
+		u8 battery_data = rd[offset] & 0xf;
 
-	if (!cable_state)
-		battery_capacity++;
-	if (battery_capacity > 10)
-		battery_capacity = 10;
+		if (battery_data < 10)
+			battery_capacity = battery_data * 10 + 5;
+		else /* 10 */
+			battery_capacity = 100;
 
-	battery_capacity *= 10;
+		battery_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	}
 
 	spin_lock_irqsave(&sc->lock, flags);
-	sc->cable_state = cable_state;
 	sc->battery_capacity = battery_capacity;
-	sc->battery_charging = battery_charging;
+	sc->battery_status = battery_status;
 	spin_unlock_irqrestore(&sc->lock, flags);
 
 	/*
@@ -2300,12 +2321,12 @@ static int sony_battery_get_property(struct power_supply *psy,
 	struct sony_sc *sc = power_supply_get_drvdata(psy);
 	unsigned long flags;
 	int ret = 0;
-	u8 battery_charging, battery_capacity, cable_state;
+	u8 battery_capacity;
+	int battery_status;
 
 	spin_lock_irqsave(&sc->lock, flags);
-	battery_charging = sc->battery_charging;
 	battery_capacity = sc->battery_capacity;
-	cable_state = sc->cable_state;
+	battery_status = sc->battery_status;
 	spin_unlock_irqrestore(&sc->lock, flags);
 
 	switch (psp) {
@@ -2319,13 +2340,7 @@ static int sony_battery_get_property(struct power_supply *psy,
 		val->intval = battery_capacity;
 		break;
 	case POWER_SUPPLY_PROP_STATUS:
-		if (battery_charging)
-			val->intval = POWER_SUPPLY_STATUS_CHARGING;
-		else
-			if (battery_capacity == 100 && cable_state)
-				val->intval = POWER_SUPPLY_STATUS_FULL;
-			else
-				val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+		val->intval = battery_status;
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.26.2

