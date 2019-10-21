Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78431DE563
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 09:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfJUHit (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 03:38:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46826 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUHit (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 03:38:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id q5so7852596pfg.13;
        Mon, 21 Oct 2019 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=EzHxjxCcrcWxlhbOhJJt2pI5JzN3G5bQJpPRRDe1b54=;
        b=mhtFUZYDU7p/6USSWWIpO2oDPN2BtQP4Gi8UwQ6U/+OwOc3tNZ9X3UWYWAv+1ZPd3Y
         Ep4LV+34lZ+bL6btTFlfGl9fDwcw9N4SzOLXrYBdGPVR/T7qmnBRD369Gcukyf7Ts1Zk
         A1CL6HlqscRL6LaC6ta/BiQhc0wyTVzkQpK7G4VhDAAS7lBeFUU65YYSSCOm6SsmzpS4
         rFX2T0CxfQLN0MTCNmOE3tPKi9v0Fyss69WOegnupe/EUYecty8rS+eNFm8bsiBfrOCt
         wBgMbkfk1KeTN3+tOkJoRWpTMTZ+5bNuicWBCf7QqRCA+lCaVOErAWKhZCgCPcG450J9
         g9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=EzHxjxCcrcWxlhbOhJJt2pI5JzN3G5bQJpPRRDe1b54=;
        b=QRscAnmOX4dN21C2tdBKveCadlnKu35/H4nhpVgNf3Z+0Y7NZq7YHcnu/Rgi31unJm
         QsJdVihrGCq+3Obcko/MfTSql0PY3WkSLqqF+rJQsFooYcCzzLoWTylcisvjkxBtWD5L
         Q5IFQ8Jd9Jwe66BMCPs2r9PW+ePLCjKsSh7nELjOgoq+W6fu+Go+JLSHqE01dvu1zW0G
         3K675/fdxughckcuzHKbrhCk9RXxg7PPXwufQHB9FfQtpmtpgoNE41laLpdwBK5H5wgh
         feIrWQrcxfDePNm2CKd/70npYBaD0Txj1kjWZMR/EjohGMDV1QEZDuOappWM2gGMRB7y
         HksQ==
X-Gm-Message-State: APjAAAVUZFwf30j0EQP47guVLvCoqzNWTgrs4wpDv7ek5ivFwPxlPUWB
        vtdh4jgavF7WUDXAiQwbcxE=
X-Google-Smtp-Source: APXvYqxZ4Zy000feFimquQuetvRgWDV76y01WrKxqUcRgqrztaartd1p8WnciGOZzNJyKeR1cow7Sw==
X-Received: by 2002:a17:90a:c382:: with SMTP id h2mr26197953pjt.110.1571643528196;
        Mon, 21 Oct 2019 00:38:48 -0700 (PDT)
Received: from bj04616pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id r30sm14822659pfl.42.2019.10.21.00.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 00:38:47 -0700 (PDT)
From:   Candle Sun <candlesea@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        nsaenzjulienne@suse.de
Cc:     orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: [PATCH v3] HID: core: check whether usage page item is after usage id item
Date:   Mon, 21 Oct 2019 15:38:19 +0800
Message-Id: <20191021073819.18181-1-candlesea@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Candle Sun <candle.sun@unisoc.com>

Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
to Main item") adds support for Usage Page item after Usage ID items
(such as keyboards manufactured by Primax).

Usage Page concatenation in Main item works well for following report
descriptor patterns:

    USAGE_PAGE (Keyboard)                   05 07
    USAGE_MINIMUM (Keyboard LeftControl)    19 E0
    USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
    LOGICAL_MINIMUM (0)                     15 00
    LOGICAL_MAXIMUM (1)                     25 01
    REPORT_SIZE (1)                         75 01
    REPORT_COUNT (8)                        95 08
    INPUT (Data,Var,Abs)                    81 02

-------------

    USAGE_MINIMUM (Keyboard LeftControl)    19 E0
    USAGE_MAXIMUM (Keyboard Right GUI)      29 E7
    LOGICAL_MINIMUM (0)                     15 00
    LOGICAL_MAXIMUM (1)                     25 01
    REPORT_SIZE (1)                         75 01
    REPORT_COUNT (8)                        95 08
    USAGE_PAGE (Keyboard)                   05 07
    INPUT (Data,Var,Abs)                    81 02

But it makes the parser act wrong for the following report
descriptor pattern(such as some Gamepads):

    USAGE_PAGE (Button)                     05 09
    USAGE (Button 1)                        09 01
    USAGE (Button 2)                        09 02
    USAGE (Button 4)                        09 04
    USAGE (Button 5)                        09 05
    USAGE (Button 7)                        09 07
    USAGE (Button 8)                        09 08
    USAGE (Button 14)                       09 0E
    USAGE (Button 15)                       09 0F
    USAGE (Button 13)                       09 0D
    USAGE_PAGE (Consumer Devices)           05 0C
    USAGE (Back)                            0a 24 02
    USAGE (HomePage)                        0a 23 02
    LOGICAL_MINIMUM (0)                     15 00
    LOGICAL_MAXIMUM (1)                     25 01
    REPORT_SIZE (1)                         75 01
    REPORT_COUNT (11)                       95 0B
    INPUT (Data,Var,Abs)                    81 02

With Usage Page concatenation in Main item, parser recognizes all the
11 Usages as consumer keys, it is not the HID device's real intention.

This patch adds usage_page_last to flag whether Usage Page is after
Usage ID items. usage_page_last is false default, it is set as true
once Usage Page item is encountered and is reverted by next Usage ID
item.

Usage Page concatenation on the currently defined Usage Page will do
firstly in Local parsing when Usage ID items encountered.

When Main item is parsing, concatenation will do again with last
defined Usage Page if usage_page_last flag is true.

Signed-off-by: Candle Sun <candle.sun@unisoc.com>
Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
---
Changes in v3:
- Rework the GET_COMPLETE_USAGE macro as static complete_usage()
  function
- Add some code comments for usage_page_last

Changes in v2:
- Update patch title
- Add GET_COMPLETE_USAGE macro
- Change the logic of checking whether to concatenate usage page again
  in main parsing
---
 drivers/hid/hid-core.c | 42 +++++++++++++++++++++++++++++++++++++-----
 include/linux/hid.h    |  1 +
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3eaee2c37931..779b7798dae8 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -211,6 +211,18 @@ static unsigned hid_lookup_collection(struct hid_parser *parser, unsigned type)
 	return 0; /* we know nothing about this usage type */
 }
 
+/*
+ * Concatenate usage which defines 16 bits or less with the
+ * currently defined usage page to form a 32 bit usage
+ */
+
+static void complete_usage(struct hid_parser *parser, unsigned int index)
+{
+	parser->local.usage[index] &= 0xFFFF;
+	parser->local.usage[index] |=
+		(parser->global.usage_page & 0xFFFF) << 16;
+}
+
 /*
  * Add a usage to the temporary parser table.
  */
@@ -221,7 +233,18 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
 		hid_err(parser->device, "usage index exceeded\n");
 		return -1;
 	}
-	parser->local.usage[parser->local.usage_index] = usage;
+
+	/*
+	 * If Usage item only includes usage id, concatenate it with
+	 * currently defined usage page and clear usage_page_last flag
+	 */
+	if (size <= 2) {
+		parser->local.usage_page_last = false;
+		complete_usage(parser, parser->local.usage_index);
+	} else {
+		parser->local.usage[parser->local.usage_index] = usage;
+	}
+
 	parser->local.usage_size[parser->local.usage_index] = size;
 	parser->local.collection_index[parser->local.usage_index] =
 		parser->collection_stack_ptr ?
@@ -366,6 +389,8 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
 
 	case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
 		parser->global.usage_page = item_udata(item);
+		/* Regard Usage Page is after Usage ID items */
+		parser->local.usage_page_last = true;
 		return 0;
 
 	case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
@@ -543,13 +568,20 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
  * usage value."
  */
 
-static void hid_concatenate_usage_page(struct hid_parser *parser)
+static void hid_concatenate_last_usage_page(struct hid_parser *parser)
 {
 	int i;
 
+	/*
+	 * Concatenate usage page again only on detecting some Usage Page
+	 * is really after Usage ID items
+	 */
+	if (!parser->local.usage_page_last)
+		return;
+
 	for (i = 0; i < parser->local.usage_index; i++)
 		if (parser->local.usage_size[i] <= 2)
-			parser->local.usage[i] += parser->global.usage_page << 16;
+			complete_usage(parser, i);
 }
 
 /*
@@ -561,7 +593,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int ret;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
@@ -772,7 +804,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int i;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index cd41f209043f..2e0ea2f7ec5c 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -412,6 +412,7 @@ struct hid_local {
 	unsigned usage_minimum;
 	unsigned delimiter_depth;
 	unsigned delimiter_branch;
+	bool usage_page_last;      /* whether usage page is after usage id */
 };
 
 /*
-- 
2.17.1

