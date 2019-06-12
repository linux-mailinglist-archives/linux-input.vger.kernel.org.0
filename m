Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF63944975
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbfFMRRe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:34 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38459 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbfFLVUA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:20:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id v11so9606430pgl.5
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jbXWyJaGiOfwS6mYiG2SXG/TJnY2qBshaIYIe+LLt1A=;
        b=dp29t4oaU3yEO5G9oAc2ontxol5WQq/UZbrxItjnVn1eL694yZ6CEc/5/whbA8+VHV
         Ar5beHjVgYdlDoaD33WSdkJRErTvwj4ei1HfZCtME7IWyDSj7BYPdjfpAlRQPkK053jb
         RI4QbaRrgrsopA49XkWxmNNK/z0qp7NwIcBH6U66ONBaT8AwupAQSEqZ+v+2PpLF26LO
         Hn6COC2sfKb50BryBcryVPNerDl7QNgzJMglI0VELba7JibXQuuf2owlk6PSrtfbMwes
         58T9fBEuzD0H18cB1h53eHHa02LHxb+wVTnjxnJ3oU2xqMiRZ88B+nDZGl1HBIS3rb6Z
         mTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jbXWyJaGiOfwS6mYiG2SXG/TJnY2qBshaIYIe+LLt1A=;
        b=ltPlkeTXWJFC0YkNrgPIFHqINc8tbP6KH2XgjHoaI1k2BHSdX785znecS3ML/cBHcP
         iL5QfWt28r6EdJJABZ4VnnDuCQE5+fgfiMwmox6dG63NPmdg0oAMk5pIDFP7abkcMIxn
         YWVXnOyarSk/8PrShoi0PA4GN8+UkYAmmgFGauFo26NDqGlsSgcbbeOWgRwtgSV8THWV
         3fZTciDqVG0Y/oTiDpFtuan+XVTHtEx0CkG4qwF3zhb2GKcyLr7PdZFFGrZN5haMIgGJ
         rEpPUZr3cVnzDnuo3jSmIO+NLERhX7h72PSKKD2mSxibkT5u3s6J0vSpxOzD+EdzZ3Pm
         td4Q==
X-Gm-Message-State: APjAAAXajQ8wI7J4u9bA+ZugZ9WWtHi/lv9tqGIH9kd1v18Snc8iETRG
        398X9OsyNLhHTzHQhBvT/4xVNEZ2YgbAAQ==
X-Google-Smtp-Source: APXvYqyx7ZKt+0YLJDGkUkv8VC1KWkvHtKa5EH9llikgNK8I7bjOCK3sKdygcNFOJ/jPjZs8vQxJig==
X-Received: by 2002:a63:1343:: with SMTP id 3mr27851724pgt.426.1560374398565;
        Wed, 12 Jun 2019 14:19:58 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id m6sm423283pgr.18.2019.06.12.14.19.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Jun 2019 14:19:57 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 4/4] HID: wacom: generic: read the number of expected touches on a per collection basis
Date:   Wed, 12 Jun 2019 14:19:31 -0700
Message-Id: <1560374371-2688-5-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
References: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bluetooth connections may contain more than one set of touches,
or a partial set of touches, in one report.

Set the number of expected touches when reading a collection
instead of once per report (in the pre-report function).

Accordingly, reset the number of touches expected after each sync.

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
---
 drivers/hid/wacom_wac.c | 79 ++++++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 67ecd149ad21..104e6d1f4c80 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2563,25 +2563,9 @@ static void wacom_wac_finger_pre_report(struct hid_device *hdev,
 			case HID_DG_TIPSWITCH:
 				hid_data->last_slot_field = equivalent_usage;
 				break;
-			case HID_DG_CONTACTCOUNT:
-				hid_data->cc_report = report->id;
-				hid_data->cc_index = i;
-				hid_data->cc_value_index = j;
-				break;
 			}
 		}
 	}
-
-	if (hid_data->cc_report != 0 &&
-	    hid_data->cc_index >= 0) {
-		struct hid_field *field = report->field[hid_data->cc_index];
-		int value = field->value[hid_data->cc_value_index];
-		if (value)
-			hid_data->num_expected = value;
-	}
-	else {
-		hid_data->num_expected = wacom_wac->features.touch_max;
-	}
 }
 
 static void wacom_wac_finger_report(struct hid_device *hdev,
@@ -2591,6 +2575,7 @@ static void wacom_wac_finger_report(struct hid_device *hdev,
 	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
 	struct input_dev *input = wacom_wac->touch_input;
 	unsigned touch_max = wacom_wac->features.touch_max;
+	struct hid_data *hid_data = &wacom_wac->hid_data;
 
 	/* If more packets of data are expected, give us a chance to
 	 * process them rather than immediately syncing a partial
@@ -2604,6 +2589,7 @@ static void wacom_wac_finger_report(struct hid_device *hdev,
 
 	input_sync(input);
 	wacom_wac->hid_data.num_received = 0;
+	hid_data->num_expected = 0;
 
 	/* keep touch state for pen event */
 	wacom_wac->shared->touch_down = wacom_wac_finger_count_touches(wacom_wac);
@@ -2678,12 +2664,73 @@ static void wacom_report_events(struct hid_device *hdev,
 	}
 }
 
+static void wacom_set_num_expected(struct hid_device *hdev,
+				   struct hid_report *report,
+				   int collection_index,
+				   struct hid_field *field,
+				   int field_index)
+{
+	struct wacom *wacom = hid_get_drvdata(hdev);
+	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
+	struct hid_data *hid_data = &wacom_wac->hid_data;
+	unsigned int original_collection_level =
+		hdev->collection[collection_index].level;
+	bool end_collection = false;
+	int i;
+
+	if (hid_data->num_expected)
+		return;
+
+	// find the contact count value for this segment
+	for (i = field_index; i < report->maxfield && !end_collection; i++) {
+		struct hid_field *field = report->field[i];
+		unsigned int field_level =
+			hdev->collection[field->usage[0].collection_index].level;
+		unsigned int j;
+
+		if (field_level != original_collection_level)
+			continue;
+
+		for (j = 0; j < field->maxusage; j++) {
+			struct hid_usage *usage = &field->usage[j];
+
+			if (usage->collection_index != collection_index) {
+				end_collection = true;
+				break;
+			}
+			if (wacom_equivalent_usage(usage->hid) == HID_DG_CONTACTCOUNT) {
+				hid_data->cc_report = report->id;
+				hid_data->cc_index = i;
+				hid_data->cc_value_index = j;
+
+				if (hid_data->cc_report != 0 &&
+				    hid_data->cc_index >= 0) {
+
+					struct hid_field *field =
+						report->field[hid_data->cc_index];
+					int value =
+						field->value[hid_data->cc_value_index];
+
+					if (value)
+						hid_data->num_expected = value;
+				}
+			}
+		}
+	}
+
+	if (hid_data->cc_report == 0 || hid_data->cc_index < 0)
+		hid_data->num_expected = wacom_wac->features.touch_max;
+}
+
 static int wacom_wac_collection(struct hid_device *hdev, struct hid_report *report,
 			 int collection_index, struct hid_field *field,
 			 int field_index)
 {
 	struct wacom *wacom = hid_get_drvdata(hdev);
 
+	if (WACOM_FINGER_FIELD(field))
+		wacom_set_num_expected(hdev, report, collection_index, field,
+				       field_index);
 	wacom_report_events(hdev, report, collection_index, field_index);
 
 	/*
-- 
2.17.1

