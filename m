Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB3249CF6A
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 17:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242980AbiAZQTG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 11:19:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31091 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243012AbiAZQTF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 11:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643213945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tuAKfawLm+JaDbn81DenL5Yg02akDAVQDmdL6NAxhv0=;
        b=SHIetzQYRXJCYScdJJNoLLIdaJIRObOq/07obDY3U7I8XjfOkRT53GaRnmaMI4m6vJMCtC
        V85078BeR/s3VhhdUk+Cfp2/04JGGAFyL5E+MPsLwwbdgTQDW3VX76+dKppxuLVFfqZ6kT
        xaSt0ZmJeQeW3F2zdEBX06uXfBM25j8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-y0ghpiLfMGiQW11K8j1bVQ-1; Wed, 26 Jan 2022 11:19:03 -0500
X-MC-Unique: y0ghpiLfMGiQW11K8j1bVQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3CFD87498D;
        Wed, 26 Jan 2022 16:19:01 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.193.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4535B798DD;
        Wed, 26 Jan 2022 16:18:59 +0000 (UTC)
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
Subject: [PATCH 06/12] HID: input: move up out-of-range processing of input values
Date:   Wed, 26 Jan 2022 17:18:26 +0100
Message-Id: <20220126161832.3193805-7-benjamin.tissoires@redhat.com>
In-Reply-To: <20220126161832.3193805-1-benjamin.tissoires@redhat.com>
References: <20220126161832.3193805-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It actually makes sense to clamp the value to its boundaries before
doing further processing.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-input.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 54b3e9c5ccc4..8770d9a2b2af 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1364,6 +1364,30 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 	}
 
+	/*
+	 * Ignore out-of-range values as per HID specification,
+	 * section 5.10 and 6.2.25, when NULL state bit is present.
+	 * When it's not, clamp the value to match Microsoft's input
+	 * driver as mentioned in "Required HID usages for digitizers":
+	 * https://msdn.microsoft.com/en-us/library/windows/hardware/dn672278(v=vs.85).asp
+	 *
+	 * The logical_minimum < logical_maximum check is done so that we
+	 * don't unintentionally discard values sent by devices which
+	 * don't specify logical min and max.
+	 */
+	if ((field->flags & HID_MAIN_ITEM_VARIABLE) &&
+	    field->logical_minimum < field->logical_maximum) {
+		if (field->flags & HID_MAIN_ITEM_NULL_STATE &&
+		    (value < field->logical_minimum ||
+		     value > field->logical_maximum)) {
+			dbg_hid("Ignoring out-of-range value %x\n", value);
+			return;
+		}
+		value = clamp(value,
+			      field->logical_minimum,
+			      field->logical_maximum);
+	}
+
 	switch (usage->hid) {
 	case HID_DG_INVERT:
 		*quirks = value ? (*quirks | HID_QUIRK_INVERT) : (*quirks & ~HID_QUIRK_INVERT);
@@ -1431,30 +1455,6 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		break;
 	}
 
-	/*
-	 * Ignore out-of-range values as per HID specification,
-	 * section 5.10 and 6.2.25, when NULL state bit is present.
-	 * When it's not, clamp the value to match Microsoft's input
-	 * driver as mentioned in "Required HID usages for digitizers":
-	 * https://msdn.microsoft.com/en-us/library/windows/hardware/dn672278(v=vs.85).asp
-	 *
-	 * The logical_minimum < logical_maximum check is done so that we
-	 * don't unintentionally discard values sent by devices which
-	 * don't specify logical min and max.
-	 */
-	if ((field->flags & HID_MAIN_ITEM_VARIABLE) &&
-	    (field->logical_minimum < field->logical_maximum)) {
-		if (field->flags & HID_MAIN_ITEM_NULL_STATE &&
-		    (value < field->logical_minimum ||
-		     value > field->logical_maximum)) {
-			dbg_hid("Ignoring out-of-range value %x\n", value);
-			return;
-		}
-		value = clamp(value,
-			      field->logical_minimum,
-			      field->logical_maximum);
-	}
-
 	/*
 	 * Ignore reports for absolute data if the data didn't change. This is
 	 * not only an optimization but also fixes 'dead' key reports. Some
-- 
2.33.1

