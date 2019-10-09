Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A605AD0F34
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 14:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731174AbfJIMyC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 08:54:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43114 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731170AbfJIMyC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 08:54:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id i32so1349136pgl.10;
        Wed, 09 Oct 2019 05:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DJP3EtJwnU1At2E0cpdnlKVvFa1qfwS0i3jVgskCmNY=;
        b=QBrUbxSHIfGezkaPMFV1E8tgALbo4ugWl1DvFB4cyC+XrjUqj9mqXlXy7SnyTl2ro3
         TTk7wOHp6x1v8DZUWfxTkVWO/D1tHQvh8EIWWlpbm4UodFjc1qbCwwoEtEmbaz+1VXyE
         5gE3XYR14MNF4T3nJIwztu+7bF8Iihie8QxxXkZo0oz0DOeKjWOjF7qYghLNHZvaVD8L
         fW5qA1+4i3QadWiNiXB37rVUHZZxPGlVCjdLk31r0H+pniN0XSKlyj759SSWNA7rJCWS
         XCvdExIjjlZWxYrdh+8bVJL0YQiSmbAMEFBUTel3DUfQSgBNT7foWV5RUO+BA/yksrSx
         m7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DJP3EtJwnU1At2E0cpdnlKVvFa1qfwS0i3jVgskCmNY=;
        b=XM/X28AFLGbmoapO74JLq7O1bvX5F7/QLtJi2/65XTFE6T57CCMLubmUHouy4wcf3D
         n1wgZdi7DcH7Az4369KSdms0FJIawpbA/IpMtwYCpdKzI3oPiOmcbbToOnltV1SCiBne
         BGbn5gqpfeKqXh2mFtP44lkNHYSzIWPCX9aEZro5JcHWRnzi6juBMM5iJ/W0inC/8/to
         JRjN/IbbEWViIO+87XAZvb3pSpx2Fj+rksO2y3PvPX2zLBNxWWSiyNwV+RUB/Pz/2QfZ
         Brfbiu8ICMWtbRGhjuLw8hLXUl/vXa4GOtL4V3Ds66J+7+0zUAycOEM5Ubskyq28AArR
         KgjQ==
X-Gm-Message-State: APjAAAVMITVI5D+Hp66yowfI6aUztCVxg3OkDE8yqTj5LR7d6GrHs6y9
        +nxFJhVP08QnfG6NPU3CedM=
X-Google-Smtp-Source: APXvYqy1e304xWPAXWtyGl/TDt20eR7yBAFWpO7xyYXpSuTWfg5few7aalangruSL/GdPCLJzwItMw==
X-Received: by 2002:a17:90a:bc49:: with SMTP id t9mr3841915pjv.111.1570625641460;
        Wed, 09 Oct 2019 05:54:01 -0700 (PDT)
Received: from bj04616pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id f5sm674306pgs.72.2019.10.09.05.53.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 09 Oct 2019 05:54:00 -0700 (PDT)
From:   Candle Sun <candlesea@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        nsaenzjulienne@suse.de
Cc:     orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: [PATCH v2] HID: core: check whether usage page item is after usage id item
Date:   Wed,  9 Oct 2019 20:53:29 +0800
Message-Id: <1570625609-11083-1-git-send-email-candlesea@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Changes in v2:
- Update patch title
- Add GET_COMPLETE_USAGE macro
- Change the logic of checking whether to concatenate usage page again
  in main parsing
---
 drivers/hid/hid-core.c | 31 +++++++++++++++++++++++++------
 include/linux/hid.h    |  1 +
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3eaee2c..3394222 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -35,6 +35,8 @@
 
 #include "hid-ids.h"
 
+#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))
+
 /*
  * Version Information
  */
@@ -221,7 +223,15 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
 		hid_err(parser->device, "usage index exceeded\n");
 		return -1;
 	}
-	parser->local.usage[parser->local.usage_index] = usage;
+
+	if (size <= 2) {
+		parser->local.usage_page_last = false;
+		parser->local.usage[parser->local.usage_index] =
+			GET_COMPLETE_USAGE(parser->global.usage_page, usage);
+	} else {
+		parser->local.usage[parser->local.usage_index] = usage;
+	}
+
 	parser->local.usage_size[parser->local.usage_index] = size;
 	parser->local.collection_index[parser->local.usage_index] =
 		parser->collection_stack_ptr ?
@@ -366,6 +376,7 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
 
 	case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
 		parser->global.usage_page = item_udata(item);
+		parser->local.usage_page_last = true;
 		return 0;
 
 	case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
@@ -543,13 +554,21 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
  * usage value."
  */
 
-static void hid_concatenate_usage_page(struct hid_parser *parser)
+static void hid_concatenate_last_usage_page(struct hid_parser *parser)
 {
 	int i;
+	unsigned int usage;
+	unsigned int usage_page = parser->global.usage_page;
+
+	if (!parser->local.usage_page_last)
+		return;
 
 	for (i = 0; i < parser->local.usage_index; i++)
-		if (parser->local.usage_size[i] <= 2)
-			parser->local.usage[i] += parser->global.usage_page << 16;
+		if (parser->local.usage_size[i] <= 2) {
+			usage = parser->local.usage[i];
+			parser->local.usage[i] =
+				GET_COMPLETE_USAGE(usage_page, usage);
+		}
 }
 
 /*
@@ -561,7 +580,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int ret;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
@@ -772,7 +791,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int i;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index cd41f20..2e0ea2f7 100644
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
2.7.4

