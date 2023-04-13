Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2C56E13F5
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 20:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjDMSSI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 14:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbjDMSSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 14:18:01 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 798418689
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 11:17:51 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54fc337a650so47084387b3.4
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681409870; x=1684001870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbgaqt9S6wRblWIya0iAYomPL2Ki6P5qw7xRjL8xJ7Y=;
        b=UeaYMbFz3lPJB+rGsc4cbz81/Dc95KrTHvvgab1h+qJqEY3CSZUkDOYwY2gjzK4qU5
         P91r/tDBgPMPy3JeatYAWDLU+3F19gJDRETp4Y5GFoKzH0fNlB91Ivv8zjrOA7+LKXSn
         0Gw3S2ee01YzXJ2pKdk93gb+yZFxCC7zQTeeOE7Bb9NId1SGztaUXjnW6Ho1HEwBVsq6
         VTNLwDKEwL/sLspcQ6iRZFgiLotrJFU5q868bW9bbMJ15PCCzrnj5PiJD7VLvaelbF6W
         YaoK95u1ESGn7GYcTQQ8leL7WZDbsR7NZ94qORkUUartn6eieaG5OiffsOs7f0Egsbey
         Osww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681409870; x=1684001870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbgaqt9S6wRblWIya0iAYomPL2Ki6P5qw7xRjL8xJ7Y=;
        b=K5klc4EjZwQVvJoYKdCtBEAo0apMl6hPuv7bB6QYRQzK+XGrLM/fnIN+8uwejGbw7I
         sHiQoULpAxcJn9AVh8ieuhziLaoXN/65z1ztP3DHvfIiuB24g4DQVCpgmtMSNR80C+1F
         w2rgXHVml6ae38+F3RydlCSJa0d4ZX14yJOH+G5hMl9owkLc2PO91NfYw7rKKqljQkHQ
         Qn6uuGkij7HZtJHC1BZtwlEjH7GLVgTjby0Z10Ua1qo+B/IYAG86hgekS37eEU0hrI4I
         0JRSbqvkyySVKF3Afs4XRf2wTrJsUVqp4RdHMkewWnHcy9YDd9AohgClBaZWCK/xY/UT
         /V6A==
X-Gm-Message-State: AAQBX9eveA9BMwoWKPHYSnRhO1zVpEZEuTaks1zPjXI7mYqdqcz8f5Uu
        RORlPSyuAGB+9ae2U/7WsXMMqXTJ7JSDGg==
X-Google-Smtp-Source: AKy350bUs7kYxMSBhdXsZj14nGU55szC9OwEzqDvVG8lPhLgG/8jpCWBKsibS2TnChIU+zY17r5Jxw==
X-Received: by 2002:a0d:e253:0:b0:536:cb21:7223 with SMTP id l80-20020a0de253000000b00536cb217223mr2892982ywe.6.1681409870353;
        Thu, 13 Apr 2023 11:17:50 -0700 (PDT)
Received: from horus.lan (71-34-68-4.ptld.qwest.net. [71.34.68.4])
        by smtp.gmail.com with ESMTPSA id l9-20020a817009000000b00545a08184aasm641547ywc.58.2023.04.13.11.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 11:17:50 -0700 (PDT)
From:   Jason Gerecke <killertofu@gmail.com>
X-Google-Original-From: Jason Gerecke <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <Joshua@Joshua-Dickens.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] HID: wacom: generic: Set battery quirk only when we see battery data
Date:   Thu, 13 Apr 2023 11:17:43 -0700
Message-Id: <20230413181743.7849-2-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230413181743.7849-1-jason.gerecke@wacom.com>
References: <20230413181743.7849-1-jason.gerecke@wacom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Gerecke <killertofu@gmail.com>

Some devices will include battery status usages in the HID descriptor
but we won't see that battery data for one reason or another. For example,
AES sensors won't send battery data unless an AES pen is in proximity.
If a user does not have an AES pen but instead only interacts with the
AES touchscreen with their fingers then there is no need for us to create
a battery object. Similarly, if a family of peripherals shares the same
HID descriptor between wired-only and wireless-capable SKUs, users of the
former may never see a battery event and will not want a power_supply
object created.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/wacom_wac.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 391fde5bf6024..5db7de7a6b171 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -1960,18 +1960,7 @@ static void wacom_map_usage(struct input_dev *input, struct hid_usage *usage,
 static void wacom_wac_battery_usage_mapping(struct hid_device *hdev,
 		struct hid_field *field, struct hid_usage *usage)
 {
-	struct wacom *wacom = hid_get_drvdata(hdev);
-	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
-	struct wacom_features *features = &wacom_wac->features;
-	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
-
-	switch (equivalent_usage) {
-	case HID_DG_BATTERYSTRENGTH:
-	case WACOM_HID_WD_BATTERY_LEVEL:
-	case WACOM_HID_WD_BATTERY_CHARGING:
-		features->quirks |= WACOM_QUIRK_BATTERY;
-		break;
-	}
+	return;
 }
 
 static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *field,
@@ -1992,18 +1981,21 @@ static void wacom_wac_battery_event(struct hid_device *hdev, struct hid_field *f
 			wacom_wac->hid_data.bat_connected = 1;
 			wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
 		}
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	case WACOM_HID_WD_BATTERY_LEVEL:
 		value = value * 100 / (field->logical_maximum - field->logical_minimum);
 		wacom_wac->hid_data.battery_capacity = value;
 		wacom_wac->hid_data.bat_connected = 1;
 		wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	case WACOM_HID_WD_BATTERY_CHARGING:
 		wacom_wac->hid_data.bat_charging = value;
 		wacom_wac->hid_data.ps_connected = value;
 		wacom_wac->hid_data.bat_connected = 1;
 		wacom_wac->hid_data.bat_status = WACOM_POWER_SUPPLY_STATUS_AUTO;
+		wacom_wac->features.quirks |= WACOM_QUIRK_BATTERY;
 		break;
 	}
 }
@@ -2019,18 +2011,15 @@ static void wacom_wac_battery_report(struct hid_device *hdev,
 {
 	struct wacom *wacom = hid_get_drvdata(hdev);
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
-	struct wacom_features *features = &wacom_wac->features;
 
-	if (features->quirks & WACOM_QUIRK_BATTERY) {
-		int status = wacom_wac->hid_data.bat_status;
-		int capacity = wacom_wac->hid_data.battery_capacity;
-		bool charging = wacom_wac->hid_data.bat_charging;
-		bool connected = wacom_wac->hid_data.bat_connected;
-		bool powered = wacom_wac->hid_data.ps_connected;
+	int status = wacom_wac->hid_data.bat_status;
+	int capacity = wacom_wac->hid_data.battery_capacity;
+	bool charging = wacom_wac->hid_data.bat_charging;
+	bool connected = wacom_wac->hid_data.bat_connected;
+	bool powered = wacom_wac->hid_data.ps_connected;
 
-		wacom_notify_battery(wacom_wac, status, capacity, charging,
-				     connected, powered);
-	}
+	wacom_notify_battery(wacom_wac, status, capacity, charging,
+			     connected, powered);
 }
 
 static void wacom_wac_pad_usage_mapping(struct hid_device *hdev,
-- 
2.40.0

