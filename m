Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AD5E064A
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 16:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfJVOWz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 10:22:55 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33471 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJVOWy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 10:22:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id c184so1242761pfb.0;
        Tue, 22 Oct 2019 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JuhwNBI77xw4yhQBYlW3dTjmN2CGF9B3zie8/1I8bQY=;
        b=TssGJoyJtf0kah1LyEchB6MoMZJBUV4sO2nTFmlTPlQnPcVR8qRet1hb/HquglzVP9
         n2Rac6qXlKJFQeMRTy/oigDZD89F/ovDOTToUUjXB3algZxV0owV8Yhn1nNLYSoxxMCT
         JAP+d7Fu3E6ZFqBTXu3MWoMIQrtRzMOLu7U0rVheNqRknwxQ1tohj7lpuU06KU+AJYu2
         Gf8VFgHdH2KrnXgXsxda23VIrHVI+FkDkfm3drwZZ4lggMR6iyvbtZEL/wh1RIgSp5p5
         KQ5BvC3RuNqDV75dMoVCInMWi9PyCKgzsH6yrLNbVTCuT678QR6/WRvOyrRvXBuXRC6f
         BFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JuhwNBI77xw4yhQBYlW3dTjmN2CGF9B3zie8/1I8bQY=;
        b=owIUe7RflM6R9dSZXp3F4WNfeDY+3viMc6BedZR3ZC7tv4ZOYSNoYHiBptgqYAGsTM
         npMBK1KxwJ3gAe39a3ArbZNx7FZYMiov4s934xhFIyrKBBF7+4bofHjD+ReXuO2hengp
         k0oMUBLE5pWbWEJTWDKrmjOt4WbKnI+7MxtHmAs+WdK7EJChlc6SBO8/GO/QxJeU0404
         pMsKBaLm8jABKuWD4yl9V0FqePWJJYaiDkAjn5AtxqNJCJnvECYvXi/rxA20wkygB/VL
         +GwAMcgadxbuJ8gbd6aeXOY26spd0fr0+dXfYHHgVM/wcDlGDf1Cb0b1e5KVo7Fj3cJV
         uNlA==
X-Gm-Message-State: APjAAAW2jfWqMbwGNyMhxgrHhOdmH74wqxMg/68S+qxv7dHwmW8HGkPX
        +mcSwHdkf+91NojIezUpsGI=
X-Google-Smtp-Source: APXvYqw7+og6sWUlhcfAtdPgUV0mhi7b3FbgKcdr07HTjHLSX8x7zblxtYHUQQH7DhzktXi36KbFRQ==
X-Received: by 2002:a63:7845:: with SMTP id t66mr4044985pgc.31.1571754172292;
        Tue, 22 Oct 2019 07:22:52 -0700 (PDT)
Received: from bj04616pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id b185sm24867376pfg.14.2019.10.22.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 07:22:51 -0700 (PDT)
From:   Candle Sun <candlesea@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        nsaenzjulienne@suse.de
Cc:     orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: [PATCH v4] HID: core: check whether Usage Page item is after Usage ID items
Date:   Tue, 22 Oct 2019 22:21:39 +0800
Message-Id: <20191022142139.16789-1-candlesea@gmail.com>
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

This patch checks whether Usage Page is really defined after Usage ID
items by comparing usage page using status.

Usage Page concatenation on currently defined Usage Page will always
do in local parsing when Usage ID items encountered.

When Main item is parsing, concatenation will do again with last
defined Usage Page if this page has not been used in the previous
usages concatenation.

Signed-off-by: Candle Sun <candle.sun@unisoc.com>
Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
---
Changes in v4:
- Fix v3 introduced BUG in hid_add_usage()
- Add checking logic to replace usage_page_last member
- Update patch description

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
 drivers/hid/hid-core.c | 51 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3eaee2c37931..c18ed7180b07 100644
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
@@ -222,6 +234,14 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
 		return -1;
 	}
 	parser->local.usage[parser->local.usage_index] = usage;
+
+	/*
+	 * If Usage item only includes usage id, concatenate it with
+	 * currently defined usage page
+	 */
+	if (size <= 2)
+		complete_usage(parser, parser->local.usage_index);
+
 	parser->local.usage_size[parser->local.usage_index] = size;
 	parser->local.collection_index[parser->local.usage_index] =
 		parser->collection_stack_ptr ?
@@ -543,13 +563,32 @@ static int hid_parser_local(struct hid_parser *parser, struct hid_item *item)
  * usage value."
  */
 
-static void hid_concatenate_usage_page(struct hid_parser *parser)
+static void hid_concatenate_last_usage_page(struct hid_parser *parser)
 {
 	int i;
+	unsigned int usage_page;
+	unsigned int current_page;
 
-	for (i = 0; i < parser->local.usage_index; i++)
-		if (parser->local.usage_size[i] <= 2)
-			parser->local.usage[i] += parser->global.usage_page << 16;
+	if (!parser->local.usage_index)
+		return;
+
+	usage_page = parser->global.usage_page;
+
+	/*
+	 * Concatenate usage page again only if last declared Usage Page
+	 * has not been already used in previous usages concatenation
+	 */
+	for (i = parser->local.usage_index - 1; i >= 0; i--) {
+		if (parser->local.usage_size[i] > 2)
+			/* Ignore extended usages */
+			continue;
+
+		current_page = parser->local.usage[i] >> 16;
+		if (current_page == usage_page)
+			break;
+
+		complete_usage(parser, i);
+	}
 }
 
 /*
@@ -561,7 +600,7 @@ static int hid_parser_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int ret;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
@@ -772,7 +811,7 @@ static int hid_scan_main(struct hid_parser *parser, struct hid_item *item)
 	__u32 data;
 	int i;
 
-	hid_concatenate_usage_page(parser);
+	hid_concatenate_last_usage_page(parser);
 
 	data = item_udata(item);
 
-- 
2.17.1

