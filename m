Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FC3389A6C
	for <lists+linux-input@lfdr.de>; Thu, 20 May 2021 02:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbhETAYk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 20:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETAYj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 20:24:39 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 808CDC061574
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:16 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id s5-20020a252d450000b02905161dc6c7e1so3582490ybe.23
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=8e4OVut70ZQa0ZDUJJCtb+WnyeU95+VW5Jt/vnIGs1o=;
        b=bGXRfNP4lhUMkXycO2t4wKMaT6gSoW4u6JS+bnluKieKSni//7PtfFGGatr0fHW+sr
         Rt61gbxrxKtWAmNxnSHmv/6BE+nQ0gkj5U4LzBB2pstXpqNoqZvhJK0nXHonO0Sx6TXh
         H7tGhS06Avt4L781wYs+0PEE4YdfXHu42hz4U7KWAnjvvad1gpsZutVSl8UlscZeXA29
         XuRTLqnPCSqWOE6qh/fqzRXB/QwP47NPtLGGGDnQK1rxToCVziChNVkgEd9AY0DMZv+Y
         bd8GVh0xLk43VNrLUPUQ4AvP5gYTeClP9kQLCoZhtDf8N0HV9BicX8OVKxfVRI4/jdqJ
         HWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=8e4OVut70ZQa0ZDUJJCtb+WnyeU95+VW5Jt/vnIGs1o=;
        b=caJX6nMYXsRHmYspBvPz6UvNS3Q6ALlC12jPMJT92LAXlICW+Q/GTTzs/yP52RMEHz
         +0jd7f5F5gA/+5c4RFX3YqUM8IEQqKrczjGLwJxesD4hmzhf4QLL+n+yn8KZnAFqCfyP
         8EEqrZERAMtL5+HK1btug1lgPI4ongzZniw+6ix70tpum8v8+ni4jsPWlke0QSuFTeIa
         fgQuqpIDvJUuhn9anYsmQiKISb/OgBsPH8ogV8f3qTIvuCqEBVCB08bvw65IJcI+BO3H
         Fiux4Sqp8BRDViXCW7BR/yhaIrgq8eBewd2GstWtqhdbgzXpPZB0Sx7Es3zAsP21T5lU
         eUtA==
X-Gm-Message-State: AOAM533PWk5QmnkVaqJmecPIlcaYs1Mx+LfVb+3O3PYAR6v/H2MQNIyH
        KpsF4KJANE0wIeLQv2LEXfAIC43W4CqpHkXdnHg30jme+pZrL3inEp7nWck6Mba645IsTi/e0jw
        ZwqLR2ON/LyBO8xFIHNX+FPnVrPkYk4vmT6wORvikE4xIcAO67VTEl2SfPEBHACyoIip7DMw=
X-Google-Smtp-Source: ABdhPJzAOHna+Qbnxjti5LFCW4HLvYs2ov8fiLSqjr+7T2rYQoGUrRSB44fGLg/r2zF5BxtQnVSKiHuls5g2
X-Received: from kenalba1.mtv.corp.google.com ([2620:15c:203:200:4404:83b2:506f:fd71])
 (user=kenalba job=sendgmr) by 2002:a25:b78c:: with SMTP id
 n12mr3372016ybh.291.1621470195636; Wed, 19 May 2021 17:23:15 -0700 (PDT)
Date:   Wed, 19 May 2021 17:22:47 -0700
In-Reply-To: <20210520002249.361821-1-kenalba@google.com>
Message-Id: <20210519143836.1.I8e23cff04fc537877668462d98d5054bac10d940@changeid>
Mime-Version: 1.0
References: <20210520002249.361821-1-kenalba@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 1/3] [hid] Minor cleanup
From:   Kenneth Albanowski <kenalba@google.com>
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

No functional changes, just cleanup.

Clarify actual integer size limits in a few comments.

Make one constant explicit to improve readability.

Replace open-coded sign-extension with common routine.

Signed-off-by: Kenneth Albanowski <kenalba@google.com>
---

 drivers/hid/hid-core.c | 19 +++++++------------
 include/linux/hid.h    |  3 ++-
 2 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 5b30783e2353d..19b2b0aae0c7e 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -337,7 +337,8 @@ static int hid_add_field(struct hid_parser *parser, unsigned report_type, unsign
 }
 
 /*
- * Read data value from item.
+ * Read data value from global items, which are
+ * a maximum of 32 bits in size.
  */
 
 static u32 item_udata(struct hid_item *item)
@@ -709,7 +710,7 @@ static void hid_device_release(struct device *dev)
 
 /*
  * Fetch a report description item from the data stream. We support long
- * items, though they are not used yet.
+ * items, though there are not yet any defined uses for them.
  */
 
 static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
@@ -745,6 +746,7 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
 	item->format = HID_ITEM_FORMAT_SHORT;
 	item->size = b & 3;
 
+	/* Map size values 0,1,2,3 to actual sizes 0,1,2,4 */
 	switch (item->size) {
 	case 0:
 		return start;
@@ -763,7 +765,7 @@ static u8 *fetch_item(__u8 *start, __u8 *end, struct hid_item *item)
 		return start;
 
 	case 3:
-		item->size++;
+		item->size = 4;
 		if ((end - start) < 4)
 			return NULL;
 		item->data.u32 = get_unaligned_le32(start);
@@ -1300,9 +1302,7 @@ int hid_open_report(struct hid_device *device)
 EXPORT_SYMBOL_GPL(hid_open_report);
 
 /*
- * Convert a signed n-bit integer to signed 32-bit integer. Common
- * cases are done through the compiler, the screwed things has to be
- * done by hand.
+ * Convert a signed n-bit integer to signed 32-bit integer.
  */
 
 static s32 snto32(__u32 value, unsigned n)
@@ -1310,12 +1310,7 @@ static s32 snto32(__u32 value, unsigned n)
 	if (!value || !n)
 		return 0;
 
-	switch (n) {
-	case 8:  return ((__s8)value);
-	case 16: return ((__s16)value);
-	case 32: return ((__s32)value);
-	}
-	return value & (1 << (n - 1)) ? value | (~0U << n) : value;
+	return sign_extend32(value, n - 1);
 }
 
 s32 hid_snto32(__u32 value, unsigned n)
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 7a13e9d3441a4..59828a6080e83 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -391,6 +391,7 @@ struct hid_item {
 
 struct hid_global {
 	unsigned usage_page;
+	/* HID Global fields are constrained by spec to 32-bits */
 	__s32    logical_minimum;
 	__s32    logical_maximum;
 	__s32    physical_minimum;
@@ -457,7 +458,7 @@ struct hid_field {
 	unsigned  maxusage;		/* maximum usage index */
 	unsigned  flags;		/* main-item flags (i.e. volatile,array,constant) */
 	unsigned  report_offset;	/* bit offset in the report */
-	unsigned  report_size;		/* size of this field in the report */
+	unsigned  report_size;		/* size of this field in the report, in bits */
 	unsigned  report_count;		/* number of this field in the report */
 	unsigned  report_type;		/* (input,output,feature) */
 	__s32    *value;		/* last known value(s) */
-- 
2.31.0

