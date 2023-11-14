Return-Path: <linux-input+bounces-60-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5D7EBA52
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 00:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24571C20954
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 23:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE622FC5C;
	Tue, 14 Nov 2023 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJQEDKvN"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7182FC2D
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 23:57:39 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F5CCD
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 15:57:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6bcef66f9caso1180608b3a.0
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 15:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700006257; x=1700611057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSjAVyU9KnFUolvxv3AgmcIIggThi1NdClOcfcUA/A4=;
        b=OJQEDKvN9bJ69XhwcIfLN8q535+wYAJfkstaiL9BMOa0bjCu+OCYitHpA9mRLUMwuG
         +1Z57jJjgpfCvTCuL6NJ34N7XlPMUgj+jn8hgiX5aKOUHw9klyZAHGxBv9xdS8WAxOzI
         c4Ad606en3rAbjq79F87jrgCgNXOhP/DRF1SM0z512ouMPbkNLaKlDtI+zDjxptIieij
         r0eksD0flJOfJfkV4DP8jrjbXRp6UGmYNQMerUgiho5pr+Fr0WXNRki2Z//99+rNkVFI
         IzbMfMrwuisP+MN4tOVP3YDHBiH3pKON2yqfqQWsGVlM+HIY1eY7xnPTY7iVuqoZ6er4
         KnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006257; x=1700611057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSjAVyU9KnFUolvxv3AgmcIIggThi1NdClOcfcUA/A4=;
        b=auNAY85IH4Csq3zUsf9RYJV/9lujKTGJwrk/FGThj8Ki2XA/6gM9O+989B2hnHARCX
         h6qltvqwomgrEd5DDTMrLAYtm1FsX7OOboaFIq4rGKrej6kqL4bAdOkicpSpCC+wkf6Y
         hQcce7rMfS9KOCTIX7eVdVWgWcOVxpbWH88GQxpMzTFwLC/TVctEpgIAPY2MyLsCovgY
         rwVY4anU3TnAczwX8Hu9zWboGgW9aqFGAjsPiRs5TBex0J/COw7ZJY9U/rgUueNZqGsF
         srOImV6HnfqJ3chpiXDtsuBim9OlQb42dMqdkfkYCaJSv50e3kQkEsf6XyS/CCDKWaNJ
         ENgg==
X-Gm-Message-State: AOJu0YzaI/JyG5E9f/cIMUsIh1r23Fkg1tG4tWfCvhjKQ+uoNjyhQzpO
	eOY+ygsFl/T3CAZyIThzFPUqPWIV7NnzPtuF
X-Google-Smtp-Source: AGHT+IFMUZI3kwZerW490/CDVqBMx7H5pOL6BOB2ujvss1Ddpail6tM7LfxBr5UIQ9K3wsHTfVNU2g==
X-Received: by 2002:a05:6a00:3016:b0:6b2:51a0:e1c9 with SMTP id ay22-20020a056a00301600b006b251a0e1c9mr1029394pfb.1.1700006256762;
        Tue, 14 Nov 2023 15:57:36 -0800 (PST)
Received: from Rongo.stama1.kt.home.ne.jp (110-131-90-90.rev.home.ne.jp. [110.131.90.90])
        by smtp.gmail.com with ESMTPSA id fh23-20020a056a00391700b006be0bd6a4d8sm1767570pfb.36.2023.11.14.15.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:57:36 -0800 (PST)
From: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>,
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>,
	Jason Gerecke <Jason.Gerecke@wacom.com>,
	Aaron Skomra <aaron.skomra@wacom.com>,
	Josh Dickens <joshua.dickens@wacom.com>
Subject: [PATCH] HID: wacom: Remove AES power_supply after extended inactivity
Date: Wed, 15 Nov 2023 08:57:29 +0900
Message-Id: <20231114235729.6867-1-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if a user does not use their AES pen for an extended period,
the battery power supply attributes continue to exist.
This results in the desktop showing battery status for a pen
that is no longer in use and which may in fact be in a different
state (e.g. the user may be charging the pen).
To avoid confusion and ensure userspace has an accurate view
of the battery state, this patch automatically removes
the power_supply after 30 minutes of inactivity.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Reviewed-by: Jason Gerecke <Jason.Gerecke@wacom.com>
Reviewed-by: Aaron Skomra <aaron.skomra@wacom.com>
Reviewed-by: Josh Dickens <joshua.dickens@wacom.com>
---
 drivers/hid/wacom.h     |  1 +
 drivers/hid/wacom_sys.c |  8 ++++++++
 drivers/hid/wacom_wac.c | 12 +++++++++++-
 drivers/hid/wacom_wac.h |  1 +
 4 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom.h b/drivers/hid/wacom.h
index 166a76c9bcad..77c5fb26cd14 100644
--- a/drivers/hid/wacom.h
+++ b/drivers/hid/wacom.h
@@ -164,6 +164,7 @@ struct wacom {
 	struct work_struct battery_work;
 	struct work_struct remote_work;
 	struct delayed_work init_work;
+	struct delayed_work aes_battery_work;
 	struct wacom_remote *remote;
 	struct work_struct mode_change_work;
 	struct timer_list idleprox_timer;
diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 3f704b8072e8..b613f11ed949 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1813,6 +1813,13 @@ static void wacom_destroy_battery(struct wacom *wacom)
 	}
 }
 
+static void wacom_aes_battery_handler(struct work_struct *work)
+{
+	struct wacom *wacom = container_of(work, struct wacom, aes_battery_work.work);
+
+	wacom_destroy_battery(wacom);
+}
+
 static ssize_t wacom_show_speed(struct device *dev,
 				struct device_attribute
 				*attr, char *buf)
@@ -2794,6 +2801,7 @@ static int wacom_probe(struct hid_device *hdev,
 
 	mutex_init(&wacom->lock);
 	INIT_DELAYED_WORK(&wacom->init_work, wacom_init_work);
+	INIT_DELAYED_WORK(&wacom->aes_battery_work, wacom_aes_battery_handler);
 	INIT_WORK(&wacom->wireless_work, wacom_wireless_work);
 	INIT_WORK(&wacom->battery_work, wacom_battery_work);
 	INIT_WORK(&wacom->remote_work, wacom_remote_work);
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 471db78dbbf0..c205198ded11 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2528,11 +2528,12 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 	struct input_dev *input = wacom_wac->pen_input;
 	bool range = wacom_wac->hid_data.inrange_state;
 	bool sense = wacom_wac->hid_data.sense_state;
+	bool entering_range = !wacom_wac->tool[0] && range;
 
 	if (wacom_wac->is_invalid_bt_frame)
 		return;
 
-	if (!wacom_wac->tool[0] && range) { /* first in range */
+	if (entering_range) { /* first in range */
 		/* Going into range select tool */
 		if (wacom_wac->hid_data.invert_state)
 			wacom_wac->tool[0] = BTN_TOOL_RUBBER;
@@ -2583,6 +2584,15 @@ static void wacom_wac_pen_report(struct hid_device *hdev,
 		input_sync(input);
 	}
 
+	/* Handle AES battery timeout behavior */
+	if (wacom_wac->features.quirks & WACOM_QUIRK_AESPEN) {
+		if (entering_range)
+			cancel_delayed_work(&wacom->aes_battery_work);
+		if (!sense)
+			schedule_delayed_work(&wacom->aes_battery_work,
+					      msecs_to_jiffies(WACOM_AES_BATTERY_TIMEOUT));
+	}
+
 	if (!sense) {
 		wacom_wac->tool[0] = 0;
 		wacom_wac->id[0] = 0;
diff --git a/drivers/hid/wacom_wac.h b/drivers/hid/wacom_wac.h
index 57e185f18d53..e63b1e806e34 100644
--- a/drivers/hid/wacom_wac.h
+++ b/drivers/hid/wacom_wac.h
@@ -14,6 +14,7 @@
 #define WACOM_MAX_REMOTES	5
 #define WACOM_STATUS_UNKNOWN	255
 #define WACOM_REMOTE_BATTERY_TIMEOUT	21000000000ll
+#define WACOM_AES_BATTERY_TIMEOUT       1800000
 
 /* packet length for individual models */
 #define WACOM_PKGLEN_BBFUN	 9
-- 
2.34.1


