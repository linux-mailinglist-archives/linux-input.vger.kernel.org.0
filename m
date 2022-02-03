Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEE64A863F
	for <lists+linux-input@lfdr.de>; Thu,  3 Feb 2022 15:32:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351190AbiBCOcw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Feb 2022 09:32:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49187 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351206AbiBCOcw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Feb 2022 09:32:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643898771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VoRCLd9eiRJJa6lwo70UloqImIyHvXdJD57CHhtcnqY=;
        b=Q2Pk5V0D4FxTuH6MV629a3SzdNCI2jePQ9vgYrcKfZhKNKPMFs2TNyhyPqOwAfh8I7UukH
        aJvSj0C7gaU1Fo5c//G06S1OZa8XvqfsHBdLSVvyRoM/j4MTAbh0x5tWy7i/m1q3PBSdwW
        v7jI+Ah2c+EYZICgQIvhkV0LIsOkLhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-PNN1-BKzPdSpfRmtqeYMZA-1; Thu, 03 Feb 2022 09:32:46 -0500
X-MC-Unique: PNN1-BKzPdSpfRmtqeYMZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AEB343CC;
        Thu,  3 Feb 2022 14:32:44 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.192.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 464DB7D4D0;
        Thu,  3 Feb 2022 14:32:42 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Ahelenia=20Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 02/12] HID: core: de-duplicate some code in hid_input_field()
Date:   Thu,  3 Feb 2022 15:32:16 +0100
Message-Id: <20220203143226.4023622-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20220203143226.4023622-1-benjamin.tissoires@redhat.com>
References: <20220203143226.4023622-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I had to go twice through the history to get a grasp at this code.
De-duplicate the various tests in one common helper to make it
more explicit.

Note that the `HID_UP_KEYBOARD + 1` condition is tested through
https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/121

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-core.c | 54 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 75e7b8447bf7..fad4dbdf6391 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1525,6 +1525,24 @@ static void hid_process_event(struct hid_device *hid, struct hid_field *field,
 		hid->hiddev_hid_event(hid, field, usage, value);
 }
 
+/*
+ * Checks if the given value is valid within this field
+ */
+static inline int hid_array_value_is_valid(struct hid_field *field,
+					   __s32 value)
+{
+	__s32 min = field->logical_minimum;
+
+	/*
+	 * Value needs to be between logical min and max, and
+	 * (value - min) is used as an index in the usage array.
+	 * This array is of size field->maxusage
+	 */
+	return value >= min &&
+	       value <= field->logical_maximum &&
+	       value - min < field->maxusage;
+}
+
 /*
  * Analyse a received field, and fetch the data from it. The field
  * content is stored for next report processing (we do differential
@@ -1539,7 +1557,6 @@ static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 	unsigned offset = field->report_offset;
 	unsigned size = field->report_size;
 	__s32 min = field->logical_minimum;
-	__s32 max = field->logical_maximum;
 	__s32 *value;
 
 	value = field->new_value;
@@ -1554,8 +1571,7 @@ static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 
 		/* Ignore report if ErrorRollOver */
 		if (!(field->flags & HID_MAIN_ITEM_VARIABLE) &&
-		    value[n] >= min && value[n] <= max &&
-		    value[n] - min < field->maxusage &&
+		    hid_array_value_is_valid(field, value[n]) &&
 		    field->usage[value[n] - min].hid == HID_UP_KEYBOARD + 1)
 			return;
 	}
@@ -1563,21 +1579,29 @@ static void hid_input_field(struct hid_device *hid, struct hid_field *field,
 	for (n = 0; n < count; n++) {
 
 		if (HID_MAIN_ITEM_VARIABLE & field->flags) {
-			hid_process_event(hid, field, &field->usage[n], value[n], interrupt);
+			hid_process_event(hid,
+					  field,
+					  &field->usage[n],
+					  value[n],
+					  interrupt);
 			continue;
 		}
 
-		if (field->value[n] >= min && field->value[n] <= max
-			&& field->value[n] - min < field->maxusage
-			&& field->usage[field->value[n] - min].hid
-			&& search(value, field->value[n], count))
-				hid_process_event(hid, field, &field->usage[field->value[n] - min], 0, interrupt);
-
-		if (value[n] >= min && value[n] <= max
-			&& value[n] - min < field->maxusage
-			&& field->usage[value[n] - min].hid
-			&& search(field->value, value[n], count))
-				hid_process_event(hid, field, &field->usage[value[n] - min], 1, interrupt);
+		if (hid_array_value_is_valid(field, field->value[n]) &&
+		    search(value, field->value[n], count))
+			hid_process_event(hid,
+					  field,
+					  &field->usage[field->value[n] - min],
+					  0,
+					  interrupt);
+
+		if (hid_array_value_is_valid(field, value[n]) &&
+		    search(field->value, value[n], count))
+			hid_process_event(hid,
+					  field,
+					  &field->usage[value[n] - min],
+					  1,
+					  interrupt);
 	}
 
 	memcpy(field->value, value, count * sizeof(__s32));
-- 
2.33.1

