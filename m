Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F27C9371212
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 09:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhECHhR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 03:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhECHhQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 May 2021 03:37:16 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E74C06174A;
        Mon,  3 May 2021 00:36:22 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t21so2358628plo.2;
        Mon, 03 May 2021 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=9BigGFMAPEzpEN5kovmTljqu8CBdZtn8Br2Xtxah7dI=;
        b=P6G0RWfnoNugQauj7Yzz66qk4wtVDI1A57eLjZ7sAQnvoveIF/2OkcsA8aVQhfQKWJ
         klKI5QDMjr/ui9oNvLVYxunutO8ZT2Isu+WDxE9ZWoS6vE0n2tZSlVoCEapvaNxPBqy2
         Wi/XHghrC3df+XFtL91bUtBkiyxYsbbbxUE5bX41N4q6H14vQm3ZPzvoZyHMdAEsaoRP
         gt/EBIGT8eqcb2Gnc0qsCVRYmuRwioudwkEWFLHu8NBCy+lQC+0zlWmZdfgFlUlTP6uq
         ayC701c6vmPVW2JO/U1QaqKqTrF5yeIEw/evzizQcwDBBIobZjcrBXGwYat7kAT6qCQW
         wwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=9BigGFMAPEzpEN5kovmTljqu8CBdZtn8Br2Xtxah7dI=;
        b=tdZXzdTl1FTmwYP7OrEUTQnNljYfcm2xxw9RvEqOgevZSvghYHJCUE+BzzcWs6FC5H
         CxFtnpkyUP0cvhc3DK8telRlIgfd03t6hSkO1SXKOW399CRDQrfcKkOvJBwO5VW7HkH/
         lBG9RcFi0JxIm5lJLy25oPar47auzyocq2/N7jlr2qH4Rt4nOK32vO/D79Ka3Wm0jcbV
         9AdPPIF6huDPu/CRzfdzW7Ml5oo06swWAEu5+c62ZN6XZmGmqy7vNEXKc02bjt6RNwWW
         AHiun8ALPdOJu9+qJR6e3Ok5LmPJ7R+puRWTLGbgOT7fREBRWIj211FQP9QF2NACBnQP
         69GQ==
X-Gm-Message-State: AOAM532cc7cduU6520sA0C3xwYBJfvQHiZk5xowFsZETuutu3DWh+MNV
        HKnFI3bASam/hWwe75UHMMergb4AekiSkQ==
X-Google-Smtp-Source: ABdhPJyAn/PkIijE4YkTbx5LBi4vcwMScF22s09Fa8ZtbJ7tBJrry4WJOC0fbSUVNScG1SdSpc4P1Q==
X-Received: by 2002:a17:902:d104:b029:ee:ac12:4b31 with SMTP id w4-20020a170902d104b02900eeac124b31mr14370036plw.56.1620027382293;
        Mon, 03 May 2021 00:36:22 -0700 (PDT)
Received: from localhost ([157.45.34.47])
        by smtp.gmail.com with ESMTPSA id gw7sm2599503pjb.57.2021.05.03.00.36.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 May 2021 00:36:21 -0700 (PDT)
Date:   Mon, 3 May 2021 13:06:13 +0530
From:   Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        sanjanasrinidhi1810@gmail.com
Subject: [PATCH] drivers: hid: hid-logitech-hidpp.c: Fix indentation errors
Message-ID: <20210503073613.utl3xmlglboxv4qg@kewl-virtual-machine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20171215
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

case and switch have been indented one below the other.
A * has been added for every  line in a multi line comment.
The closing */ has been shifted to a new line
This is done to maintain code uniformity.
Incorrect repetiton of the word 'in' corrected.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 170 ++++++++++++++++---------------
 1 file changed, 87 insertions(+), 83 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d459e2dbe647..1de187c9a0eb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1083,30 +1083,31 @@ static int hidpp20_batterylevel_map_status_capacity(u8 data[3], int *capacity,
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
 		/* 5 = invalid battery type
-		   6 = thermal error
-		   7 = other charging error */
-		default:
-			status = POWER_SUPPLY_STATUS_NOT_CHARGING;
-			break;
+		 * 6 = thermal error
+		 * 7 = other charging error
+		 */
+	default:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
 	}
 
 	return status;
@@ -1454,24 +1455,24 @@ static int hidpp20_unifiedbattery_map_status(struct hidpp_device *hidpp,
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
+			 hidpp->name);
+		break;
+	default:
+		status = POWER_SUPPLY_STATUS_NOT_CHARGING;
+		break;
 	}
 
 	return status;
@@ -1620,44 +1621,44 @@ static int hidpp_battery_get_property(struct power_supply *psy,
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
@@ -3607,7 +3608,8 @@ static int hidpp_raw_event(struct hid_device *hdev, struct hid_report *report,
 	}
 
 	/* If no report is available for further processing, skip calling
-	 * raw_event of subclasses. */
+	 * raw_event of subclasses.
+	 */
 	if (ret != 0)
 		return ret;
 
@@ -3668,8 +3670,9 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 			ret = hidpp_solar_request_battery_event(hidpp);
 		else {
 			/* we only support one battery feature right now, so let's
-			   first check the ones that support battery level first
-			   and leave voltage for last */
+			 * first check the ones that support battery level first
+			 * and leave voltage for last
+			 */
 			ret = hidpp20_query_battery_info_1000(hidpp);
 			if (ret)
 				ret = hidpp20_query_battery_info_1004(hidpp);
@@ -3846,7 +3849,8 @@ static void hidpp_connect_event(struct hidpp_device *hidpp)
 	}
 
 	/* the device is already connected, we can ask for its name and
-	 * protocol */
+	 * protocol
+	 */
 	if (!hidpp->protocol_major) {
 		ret = hidpp_root_get_protocol_version(hidpp);
 		if (ret) {
-- 
2.17.1

