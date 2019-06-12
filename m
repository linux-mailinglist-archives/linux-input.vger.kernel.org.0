Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08BC44977
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728380AbfFMRRf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39722 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728367AbfFLVTz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:19:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so10406411pfe.6
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+Gs3dUnf0lvFU6Y9D7j4o8m55XLSOT6vzM8Pt6nXjys=;
        b=jyuvLfQRkx7P8zsLYFIVI/BGnj+qjLHvwn1XelpvFCZrHOtATpyWG4jvgdUqGBsZCF
         p2H7LpdQpvV1BY8lm0IFbutKaUXIJEiTIuJ/LrIRajoXxQLrZjCt3pb5LceNc5I8zNFj
         RvtY40GTRTEwBhDY6w28fTiyITN8DVwbRxr+7Z2SUQN7xdnkcWwJmWUH2Xx/J6kStkG+
         N1b9ye/sio+kZIUfYms4WjtJWgmEVus3goaY5L7wwWcbHgIcN+/SGA8FfmHXO6trrISb
         IwDUdPyNZZrwDoKNI6QYOcT7hk7BpdLGcgTzetx7cVG3VYJ5WreINKOquuRjfVSMPanD
         Jx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+Gs3dUnf0lvFU6Y9D7j4o8m55XLSOT6vzM8Pt6nXjys=;
        b=S04hwX48QiP8AOQ+dlvaS7PaGUJN6eE34313k3PIlZa184lOy2qwf3iqZbfffr7J/1
         wYKUhx+jTy3M4TrK93sDOVKlhhWZ3ZB6VMAlNls+kRHcxn4/bRwfI6kjqj7re+8Sa9Bs
         tv+/ddiBVQp9h6UWttKUMUtDUvAmUtXR7r+bTSlEh9SQC4zmRN3NURRujwxJSpaLl+4A
         +bBwhY4Ec2bO3of+H6S32SKcJWnskdrN+GdkwexiOs3PqGaUNb1autpLem0rP5rORE1l
         VOgOzMII3I09dKZXswQO6BoRKbIzch170VMbIUsObOvOBBwMCFwQ0l3bppUan+BlmfYG
         0EZg==
X-Gm-Message-State: APjAAAVYw8U71oG5BrGcvsMnfN+q2RO7Y1YziJxKoHzh7QvbYxqml/wT
        wSq2/OR7LXs9yqArEZghnefINiJnCwZEzg==
X-Google-Smtp-Source: APXvYqw14+DbF3TCgkcGMwCdOd2YHpY/Kdfag3x8y7Cl4ovTH1ihlLnYMywhuzLuspRhEDkrWwo5Cw==
X-Received: by 2002:aa7:8a95:: with SMTP id a21mr89262244pfc.215.1560374394133;
        Wed, 12 Jun 2019 14:19:54 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id m6sm423283pgr.18.2019.06.12.14.19.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Jun 2019 14:19:53 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 2/4] HID: wacom: generic: read HID_DG_CONTACTMAX from any feature report
Date:   Wed, 12 Jun 2019 14:19:29 -0700
Message-Id: <1560374371-2688-3-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
References: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the generic code path, HID_DG_CONTACTMAX was previously
only read from the second byte of report 0x23.

Another report (0x82) has the HID_DG_CONTACTMAX in the
higher nibble of the third byte. We should support reading the
value of HID_DG_CONTACTMAX no matter what report we are reading
or which position that value is in.

To do this we submit the feature report as a event report
using hid_report_raw_event(). Our modified finger event path
records the value of HID_DG_CONTACTMAX when it sees that usage.

Fixes: 8ffffd5212846 ("HID: wacom: fix timeout on probe for some wacoms")
Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_sys.c | 10 ++++++----
 drivers/hid/wacom_wac.c |  4 ++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 2e3e03df83da..9ec895e5fd00 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -314,14 +314,16 @@ static void wacom_feature_mapping(struct hid_device *hdev,
 		/* leave touch_max as is if predefined */
 		if (!features->touch_max) {
 			/* read manually */
-			data = kzalloc(2, GFP_KERNEL);
+			n = hid_report_len(field->report);
+			data = hid_alloc_report_buf(field->report, GFP_KERNEL);
 			if (!data)
 				break;
 			data[0] = field->report->id;
 			ret = wacom_get_report(hdev, HID_FEATURE_REPORT,
-						data, 2, WAC_CMD_RETRIES);
-			if (ret == 2) {
-				features->touch_max = data[1];
+					       data, n, WAC_CMD_RETRIES);
+			if (ret == n) {
+				ret = hid_report_raw_event(hdev,
+					HID_FEATURE_REPORT, data, n, 0);
 			} else {
 				features->touch_max = 16;
 				hid_warn(hdev, "wacom_feature_mapping: "
diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index b764e9d72b5b..678f504239a0 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2492,6 +2492,7 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	struct wacom *wacom = hid_get_drvdata(hdev);
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
 	unsigned equivalent_usage = wacom_equivalent_usage(usage->hid);
+	struct wacom_features *features = &wacom->wacom_wac.features;
 
 	switch (equivalent_usage) {
 	case HID_GD_X:
@@ -2512,6 +2513,9 @@ static void wacom_wac_finger_event(struct hid_device *hdev,
 	case HID_DG_TIPSWITCH:
 		wacom_wac->hid_data.tipswitch = value;
 		break;
+	case HID_DG_CONTACTMAX:
+		features->touch_max = value;
+		return;
 	}
 
 
-- 
2.17.1

