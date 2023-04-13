Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67496E13F4
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 20:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjDMSSH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 14:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbjDMSSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 14:18:01 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A798A58
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 11:17:49 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54c0c86a436so418048997b3.6
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 11:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681409869; x=1684001869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQczAQBrWdzaEL6ONLzRykYRkgSEoAdka2nj7Q8ZvSc=;
        b=g4SDWQ+1EG77eUOiWzWcr4zuGk+HceHHndMMEEGB5L2iT+FJhhE26kKkGJtJJg2Fci
         cG7VpM3azBrzvrI0sL1vZwW6H0LHiJqvkQzcaPkaEDl8k2TypXHnbZz+QIlUymtGeqe/
         qtQNe84uRRkI1C2nghuvMlTTzPZB13GcNz2GfzSnNk0wXFSbznv9WLTFSFefXfnf5NCs
         5X1uxcAtOl0ReglSWvxR9YFADT/3T+V57cYfuXNHEp+DldhpQVqYZV/IunwX6sEAhjrc
         0fVSbQcCmJ5qIBCCPHDstBwWG4JOGjGNb4zTKjnVYZInOaBbP/3OydImBHrPJZUGRCK0
         qyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681409869; x=1684001869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQczAQBrWdzaEL6ONLzRykYRkgSEoAdka2nj7Q8ZvSc=;
        b=QVV2GKCw4xubPTLmx5ueiygyE6uKtPvg9CaNPH7iK9GLRhHSWPsRdvD/YTGXCPLhit
         2Ne7DSrFa+zUcHghLeeZfOIlPsKa6i8YKR5js5WEwjd0hh0swtXwkd+H2NG8nLkT4Dp0
         TcaB22xoZLKOiFg906ZY8ZQoGZ5uvBa0eX8/UmzpUIacZ+XHCTIFhQPKj/VS9FEBca7/
         rkBpp60Km0QgXZNHe8XVMfXh/xMHKDr056MxHK72Lf13Zpcxhm5QTix/Vm5NJTO0RilN
         Vyjl88kXzlJX+fL8ARgOdfrkp2op0tnYZOTHPfOvjIt8vEGPUdtekZM/nRN8b+J9wrPi
         rwzg==
X-Gm-Message-State: AAQBX9dc6E0+IqPnJqtSKgdC3u66qh+cG2Sg8EDEsPbSRmMPSKiwt9Ms
        MOsSuhoBdMvO8zzJ+oXXC/HIw6jMPgMepw==
X-Google-Smtp-Source: AKy350Z3xEYKSu8abthHPiOec0cjLiEF4TESEWP5jvJO1std0AC4+N9iOJcez8goaywmz/crH6virg==
X-Received: by 2002:a0d:ddc9:0:b0:54f:895e:70ff with SMTP id g192-20020a0dddc9000000b0054f895e70ffmr2832745ywe.21.1681409868717;
        Thu, 13 Apr 2023 11:17:48 -0700 (PDT)
Received: from horus.lan (71-34-68-4.ptld.qwest.net. [71.34.68.4])
        by smtp.gmail.com with ESMTPSA id l9-20020a817009000000b00545a08184aasm641547ywc.58.2023.04.13.11.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 11:17:47 -0700 (PDT)
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
Subject: [PATCH 1/2] HID: wacom: Lazy-init batteries
Date:   Thu, 13 Apr 2023 11:17:42 -0700
Message-Id: <20230413181743.7849-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.40.0
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

Rather than creating batteries as part of the initial device probe, let's
make the process lazy. This gives us the opportunity to prevent batteries
from being created in situations where they are unnecessary.

There are two cases in particular where batteries are being unnecessarily
created at initialization. These are AES sensors (for which we don't know
any battery status information until a battery-powered pen actually comes
into prox) peripheral tablets which share HID descriptors between the
wired-only and wireless-capable SKUs of a family of devices.

This patch will delay battery initialization of the former until a pen
actually comes into prox. It will delay battery initialization of the
latter until either a pen comes into prox or a "heartbeat" packet is
processed.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Tested-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/hid/wacom_sys.c | 10 ----------
 drivers/hid/wacom_wac.c | 13 ++++++-------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index fb538a6c4add8..8214896adadad 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2372,13 +2372,6 @@ static int wacom_parse_and_register(struct wacom *wacom, bool wireless)
 	if (error)
 		goto fail;
 
-	if (!(features->device_type & WACOM_DEVICETYPE_WL_MONITOR) &&
-	     (features->quirks & WACOM_QUIRK_BATTERY)) {
-		error = wacom_initialize_battery(wacom);
-		if (error)
-			goto fail;
-	}
-
 	error = wacom_register_inputs(wacom);
 	if (error)
 		goto fail;
@@ -2509,9 +2502,6 @@ static void wacom_wireless_work(struct work_struct *work)
 
 		strscpy(wacom_wac->name, wacom_wac1->name,
 			sizeof(wacom_wac->name));
-		error = wacom_initialize_battery(wacom);
-		if (error)
-			goto fail;
 	}
 
 	return;
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 4cfa51416dbcb..391fde5bf6024 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -113,6 +113,11 @@ static void wacom_notify_battery(struct wacom_wac *wacom_wac,
 	bool bat_connected, bool ps_connected)
 {
 	struct wacom *wacom = container_of(wacom_wac, struct wacom, wacom_wac);
+	bool bat_initialized = wacom->battery.battery;
+	bool has_quirk = wacom_wac->features.quirks & WACOM_QUIRK_BATTERY;
+
+	if (bat_initialized != has_quirk)
+		wacom_schedule_work(wacom_wac, WACOM_WORKER_BATTERY);
 
 	__wacom_notify_battery(&wacom->battery, bat_status, bat_capacity,
 			       bat_charging, bat_connected, ps_connected);
@@ -3391,19 +3396,13 @@ static int wacom_status_irq(struct wacom_wac *wacom_wac, size_t len)
 		int battery = (data[8] & 0x3f) * 100 / 31;
 		bool charging = !!(data[8] & 0x80);
 
+		features->quirks |= WACOM_QUIRK_BATTERY;
 		wacom_notify_battery(wacom_wac, WACOM_POWER_SUPPLY_STATUS_AUTO,
 				     battery, charging, battery || charging, 1);
-
-		if (!wacom->battery.battery &&
-		    !(features->quirks & WACOM_QUIRK_BATTERY)) {
-			features->quirks |= WACOM_QUIRK_BATTERY;
-			wacom_schedule_work(wacom_wac, WACOM_WORKER_BATTERY);
-		}
 	}
 	else if ((features->quirks & WACOM_QUIRK_BATTERY) &&
 		 wacom->battery.battery) {
 		features->quirks &= ~WACOM_QUIRK_BATTERY;
-		wacom_schedule_work(wacom_wac, WACOM_WORKER_BATTERY);
 		wacom_notify_battery(wacom_wac, POWER_SUPPLY_STATUS_UNKNOWN, 0, 0, 0, 0);
 	}
 	return 0;
-- 
2.40.0

