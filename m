Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62823F2E5A
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 16:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240879AbhHTOrx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 10:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240894AbhHTOrx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 10:47:53 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41630C061575;
        Fri, 20 Aug 2021 07:47:15 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id q21so17707299ljj.6;
        Fri, 20 Aug 2021 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRUNiHmzilQZfb/V+s5DKq2XSbVm2taM5+A4BTzCW/0=;
        b=mETpwM00S0K97/cFMdZmGjex1FryJgGdJT71eRtoHCkn6biNSrTuBKJ/stGFLHgHcX
         09TE+jFSM7qaecGe9//ebbXG8YFiZNuYywkFjA3pgG5eJRr+Rw/Tn8W2OKDUYl7XpcKf
         tCyFYfIL2lUn/IR6cf0HIHOfXgj9gOkyVdZnKyenn5NIBFwqr40CZA2DJm7Qc7+e6s9w
         EiWrlja8SfcOpZ7S/WNG7sUPIHFWO9pEX2fTGW8ufa7WkQwKwSpTHYkeSeCDYxTrs3LA
         caF2IcV093ic+GD06yqQy961m0RkBsYeu8DM2+K9jGNGaKYBTSAlCWZV5IWvS/ov6vWA
         +RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CRUNiHmzilQZfb/V+s5DKq2XSbVm2taM5+A4BTzCW/0=;
        b=OexvD7SEmbRoouXhCl+3yjy1lZ+wQiSUYiCVtGQCWuQDXU9vUvtwVm7BvwWIqpPO+D
         fwNJCEsF4mNkHMdL2rrv6MCMnfcyDzVm/oTz2h8RBNbMQTlLeVZrZVDgRkbAclkGpxeE
         fB8nwj88EQxZdGaEpjx8T/Y2WcMVKbEPZ9lyQ/7pgmeWzD2MykTKxyjk1PGFB8OGr6AB
         zcs5CiICQz2b/XjrY0HK14zRuVHBupm0NyJX4D6T7iIrfvaDx1SVnFqSm7B9dtAWBNdy
         8mK+/Ll3AifUHT4hBP0eeOMH1ratEuYo1uDOlqdulHeRHtXAfBwBrQtUfGt7SwWSibU1
         7V8w==
X-Gm-Message-State: AOAM531F29lUO1kLyWubJVA2fmA6iObsYbrP7F4/rwBXtW4tbr11CHeb
        6I+LOcGPeUbwRCJxKprTl3Q=
X-Google-Smtp-Source: ABdhPJxq7MsiQCnVgrhyitPx2OiBfMiCStUaB6gU+RrxR+zuozes64arhndOnVXmKSmB7E2MO3+EUA==
X-Received: by 2002:a2e:b4a1:: with SMTP id q1mr16376759ljm.221.1629470833618;
        Fri, 20 Aug 2021 07:47:13 -0700 (PDT)
Received: from localhost.localdomain (h-62-63-208-27.A230.priv.bahnhof.se. [62.63.208.27])
        by smtp.googlemail.com with ESMTPSA id y14sm552766lji.89.2021.08.20.07.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 07:47:13 -0700 (PDT)
From:   Niklas Lantau <niklaslantau@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Niklas Lantau <niklaslantau@gmail.com>
Subject: [PATCH] Hid: hid-logitech-hidpp: fixed coding style issues
Date:   Fri, 20 Aug 2021 16:45:27 +0200
Message-Id: <20210820144527.19137-1-niklaslantau@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixed coding style issues that generated 5 errors and 10 warnings.

Signed-off-by: Niklas Lantau <niklaslantau@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 195 ++++++++++++++++---------------
 1 file changed, 101 insertions(+), 94 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 61635e629469..8fbf65d74c0f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1086,30 +1086,32 @@ static int hidpp20_batterylevel_map_status_capacity(u8 data[3], int *capacity,
 	 * For all other states the device reports 0 (unknown).
 	 */
 	switch (data[2]) {
-		case 0: /* discharging (in use) */
-			status = POWER_SUPPLY_STATUS_DISCHARGING;
-			*level = hidpp_map_battery_level(*capacity);
-			break;
-		case 1: /* recharging */
-			status = POWER_SUPPLY_STATUS_CHARGING;
-			break;
-		case 2: /* charge in final stage */
-			status = POWER_SUPPLY_STATUS_CHARGING;
-			break;
-		case 3: /* charge complete */
-			status = POWER_SUPPLY_STATUS_FULL;
-			*level = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
-			*capacity = 100;
-			break;
-		case 4: /* recharging below optimal speed */
-			status = POWER_SUPPLY_STATUS_CHARGING;
-			break;
-		/* 5 = invalid battery type
-		   6 = thermal error
-		   7 = other charging error */
-		default:
-			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
-			break;
+	case 0: /* discharging (in use) */
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+		*level = hidpp_map_battery_level(*capacity);
+		break;
+	case 1: /* recharging */
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 2: /* charge in final stage */
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 3: /* charge complete */
+		status = POWER_SUPPLY_STATUS_FULL;
+		*level = POWER_SUPPLY_CAPACITY_LEVEL_FULL;
+		*capacity = 100;
+		break;
+	case 4: /* recharging below optimal speed */
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	/*
+	 * 5 = invalid battery type
+	 * 6 = thermal error
+	 * 7 = other charging error
+	 */
+	default:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
 	}
 
 	return status;
@@ -1287,15 +1289,12 @@ static int hidpp20_battery_map_status_voltage(u8 data[3], int *voltage,
 		status = POWER_SUPPLY_STATUS_DISCHARGING;
 
 	*charge_type = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
-	if (test_bit(3, &flags)) {
+	if (test_bit(3, &flags))
 		*charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
-	}
-	if (test_bit(4, &flags)) {
+	if (test_bit(4, &flags))
 		*charge_type = POWER_SUPPLY_CHARGE_TYPE_TRICKLE;
-	}
-	if (test_bit(5, &flags)) {
+	if (test_bit(5, &flags))
 		*level = POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
-	}
 
 	*voltage = get_unaligned_be16(data);
 
@@ -1458,24 +1457,24 @@ static int hidpp20_unifiedbattery_map_status(struct hidpp_device *hidpp,
 	int status;
 
 	switch (charging_status) {
-		case 0: /* discharging */
-			status = POWER_SUPPLY_STATUS_DISCHARGING;
-			break;
-		case 1: /* charging */
-		case 2: /* charging slow */
-			status = POWER_SUPPLY_STATUS_CHARGING;
-			break;
-		case 3: /* complete */
-			status = POWER_SUPPLY_STATUS_FULL;
-			break;
-		case 4: /* error */
-			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
-			hid_info(hidpp->hid_dev, "%s: charging error",
-				 hidpp->name);
-			break;
-		default:
-			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
-			break;
+	case 0: /* discharging */
+		status = POWER_SUPPLY_STATUS_DISCHARGING;
+		break;
+	case 1: /* charging */
+	case 2: /* charging slow */
+		status = POWER_SUPPLY_STATUS_CHARGING;
+		break;
+	case 3: /* complete */
+		status = POWER_SUPPLY_STATUS_FULL;
+		break;
+	case 4: /* error */
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		hid_info(hidpp->hid_dev, "%s: charging error",
+				hidpp->name);
+		break;
+	default:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
 	}
 
 	return status;
@@ -1624,44 +1623,44 @@ static int hidpp_battery_get_property(struct power_supply *psy,
 	struct hidpp_device *hidpp = power_supply_get_drvdata(psy);
 	int ret = 0;
 
-	switch(psp) {
-		case POWER_SUPPLY_PROP_STATUS:
-			val->intval = hidpp->battery.status;
-			break;
-		case POWER_SUPPLY_PROP_CAPACITY:
-			val->intval = hidpp->battery.capacity;
-			break;
-		case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
-			val->intval = hidpp->battery.level;
-			break;
-		case POWER_SUPPLY_PROP_SCOPE:
-			val->intval = POWER_SUPPLY_SCOPE_DEVICE;
-			break;
-		case POWER_SUPPLY_PROP_ONLINE:
-			val->intval = hidpp->battery.online;
-			break;
-		case POWER_SUPPLY_PROP_MODEL_NAME:
-			if (!strncmp(hidpp->name, "Logitech ", 9))
-				val->strval = hidpp->name + 9;
-			else
-				val->strval = hidpp->name;
-			break;
-		case POWER_SUPPLY_PROP_MANUFACTURER:
-			val->strval = "Logitech";
-			break;
-		case POWER_SUPPLY_PROP_SERIAL_NUMBER:
-			val->strval = hidpp->hid_dev->uniq;
-			break;
-		case POWER_SUPPLY_PROP_VOLTAGE_NOW:
-			/* hardware reports voltage in in mV. sysfs expects uV */
-			val->intval = hidpp->battery.voltage * 1000;
-			break;
-		case POWER_SUPPLY_PROP_CHARGE_TYPE:
-			val->intval = hidpp->battery.charge_type;
-			break;
-		default:
-			ret = -EINVAL;
-			break;
+	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		val->intval = hidpp->battery.status;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY:
+		val->intval = hidpp->battery.capacity;
+		break;
+	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
+		val->intval = hidpp->battery.level;
+		break;
+	case POWER_SUPPLY_PROP_SCOPE:
+		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		val->intval = hidpp->battery.online;
+		break;
+	case POWER_SUPPLY_PROP_MODEL_NAME:
+		if (!strncmp(hidpp->name, "Logitech ", 9))
+			val->strval = hidpp->name + 9;
+		else
+			val->strval = hidpp->name;
+		break;
+	case POWER_SUPPLY_PROP_MANUFACTURER:
+		val->strval = "Logitech";
+		break;
+	case POWER_SUPPLY_PROP_SERIAL_NUMBER:
+		val->strval = hidpp->hid_dev->uniq;
+		break;
+	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
+		/* hardware reports voltage in mV. sysfs expects uV */
+		val->intval = hidpp->battery.voltage * 1000;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPE:
+		val->intval = hidpp->battery.charge_type;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
 	}
 
 	return ret;
@@ -3190,7 +3189,9 @@ static int lg_dinovo_input_mapping(struct hid_device *hdev, struct hid_input *hi
 		return 0;
 
 	switch (usage->hid & HID_USAGE) {
-	case 0x00d: lg_map_key_clear(KEY_MEDIA);	break;
+	case 0x00d:
+		lg_map_key_clear(KEY_MEDIA);
+		break;
 	default:
 		return 0;
 	}
@@ -3620,8 +3621,10 @@ static int hidpp_raw_event(struct hid_device *hdev, struct hid_report *report,
 		break;
 	}
 
-	/* If no report is available for further processing, skip calling
-	 * raw_event of subclasses. */
+	/*
+	 * If no report is available for further processing, skip calling
+	 * raw_event of subclasses.
+	 */
 	if (ret != 0)
 		return ret;
 
@@ -3681,9 +3684,11 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 		if (hidpp->quirks & HIDPP_QUIRK_CLASS_K750)
 			ret = hidpp_solar_request_battery_event(hidpp);
 		else {
-			/* we only support one battery feature right now, so let's
-			   first check the ones that support battery level first
-			   and leave voltage for last */
+			/*
+			 * we only support one battery feature right now, so let's
+			 * first check the ones that support battery level first
+			 * and leave voltage for last
+			 */
 			ret = hidpp20_query_battery_info_1000(hidpp);
 			if (ret)
 				ret = hidpp20_query_battery_info_1004(hidpp);
@@ -3859,8 +3864,10 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 			return;
 	}
 
-	/* the device is already connected, we can ask for its name and
-	 * protocol */
+	/*
+	 * the device is already connected, we can ask for its name and
+	 * protocol
+	 */
 	if (!hidpp->protocol_major) {
 		ret = hidpp_root_get_protocol_version(hidpp);
 		if (ret) {
-- 
2.33.0

