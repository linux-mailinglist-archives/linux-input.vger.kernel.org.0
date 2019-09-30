Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D3EC1C8F
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 10:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfI3IKe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 04:10:34 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44350 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3IKd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 04:10:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id i14so6926033pgt.11;
        Mon, 30 Sep 2019 01:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BY/AK+N2g5Gtdi627g4PugnddcbhUUIEgKh0LJ4aymM=;
        b=hjBvolgAOikZ8KI85AaIjAhrKEjdSJQtJCTGg3n0Dwa8JiuoUdMxviHxsJ9FJT1Qhr
         z4JQs5k9uUt/r/SXOmYYJsoqR1HZnJtH12Yt18DoTREuLRyW5GKTf9avam8KuCsoVInw
         2Czgyfz5Mm49cl43LIDDdzKDsgDoBON0tYE3j13mckCzfs8TzjBa572igIbWN9qCwLg6
         uxvmxjmGmrW1e/XTeEu2Bx9QE8kPTD6QUm1tISAMBnrFSvDQ8D9VTZlZO90sXKO7NjSU
         EBr2gVbQeE/JuQ/ctn8W59v5xmqTL9RiT1/PvaMN7mkIHHApBxuvUnWLfh782JcY7jQP
         d8DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BY/AK+N2g5Gtdi627g4PugnddcbhUUIEgKh0LJ4aymM=;
        b=ax84nlZdv5YI0b0rx5EiWc8YrbSdASZKs/lWfXXIIBXHTvjeRdLuG4TwjidxJq0Dtx
         82HjCbg0iOmTTkvz74zhD/O+zkBslqHtMNsAmyO9vG8y2P9ehbjGZNfsflRCt3ftM+vZ
         DYaCY4HaFU/2eBI8+vMs78VVKSuzPdx5YKTVRWKkEAolvFpJq8r7+U2N+zmP+kJhaB9m
         llo+ajlS3CneaKOe7sx3SdKpEW37c57P+t90AieDqOtu0ko815sFvKCuQIi4go6jvBl/
         6NRQfID5cVGaUqA0UykgOLV7fyKc+t2bub63IzYwmqbnsS2rj7+KdMKZ7UCM7gX/zvf0
         f/Ew==
X-Gm-Message-State: APjAAAWazkdmAG18eonz9VdH+QeU1zIlw9bxho0Coeyr2zAf8cf9xtwt
        5/IMDISls8sC7D3JHUJS8Ic=
X-Google-Smtp-Source: APXvYqxSXY/8FcJbLzD8lYwR4LPA8YS0irks7PX80NuJBfs+E5E+2x2PGXFu+SqhtZVe2OPGGPcWUQ==
X-Received: by 2002:a63:20d:: with SMTP id 13mr23472009pgc.253.1569831032417;
        Mon, 30 Sep 2019 01:10:32 -0700 (PDT)
Received: from bj04616pcu.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id z29sm15699911pff.23.2019.09.30.01.10.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 30 Sep 2019 01:10:31 -0700 (PDT)
From:   Candle Sun <candlesea@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        chunyan.zhang@unisoc.com, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: [PATCH] HID: core: add usage_page_preceding flag for hid_concatenate_usage_page()
Date:   Mon, 30 Sep 2019 16:09:09 +0800
Message-Id: <1569830949-10771-1-git-send-email-candlesea@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Candle Sun <candle.sun@unisoc.com>

Upstream commit 58e75155009c ("HID: core: move Usage Page concatenation
to Main item") adds support for Usage Page item following Usage items
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

This patch adds usage_page_preceding flag to detect the third pattern.
Usage Page concatenation is done in both Local and Main parsing.
If usage_page_preceding equals 3(the third pattern encountered),
hid_concatenate_usage_page() is jumped.

Signed-off-by: Candle Sun <candle.sun@unisoc.com>
Signed-off-by: Nianfu Bai <nianfu.bai@unisoc.com>
---
 drivers/hid/hid-core.c | 21 +++++++++++++++++++--
 include/linux/hid.h    |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 3eaee2c..043a232 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -221,7 +221,15 @@ static int hid_add_usage(struct hid_parser *parser, unsigned usage, u8 size)
 		hid_err(parser->device, "usage index exceeded\n");
 		return -1;
 	}
-	parser->local.usage[parser->local.usage_index] = usage;
+	if (!parser->local.usage_index && parser->global.usage_page)
+		parser->local.usage_page_preceding = 1;
+	if (parser->local.usage_page_preceding == 2)
+		parser->local.usage_page_preceding = 3;
+	if (size <= 2 && parser->global.usage_page)
+		parser->local.usage[parser->local.usage_index] =
+			(usage & 0xffff) + (parser->global.usage_page << 16);
+	else
+		parser->local.usage[parser->local.usage_index] = usage;
 	parser->local.usage_size[parser->local.usage_index] = size;
 	parser->local.collection_index[parser->local.usage_index] =
 		parser->collection_stack_ptr ?
@@ -366,6 +374,8 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
 
 	case HID_GLOBAL_ITEM_TAG_USAGE_PAGE:
 		parser->global.usage_page = item_udata(item);
+		if (parser->local.usage_page_preceding == 1)
+			parser->local.usage_page_preceding = 2;
 		return 0;
 
 	case HID_GLOBAL_ITEM_TAG_LOGICAL_MINIMUM:
@@ -547,9 +557,16 @@ static void hid_concatenate_usage_page(struct hid_parser *parser)
 {
 	int i;
 
+	if (parser->local.usage_page_preceding == 3) {
+		dbg_hid("Using preceding usage page for final usage\n");
+		return;
+	}
+
 	for (i = 0; i < parser->local.usage_index; i++)
 		if (parser->local.usage_size[i] <= 2)
-			parser->local.usage[i] += parser->global.usage_page << 16;
+			parser->local.usage[i] =
+				(parser->global.usage_page << 16)
+				+ (parser->local.usage[i] & 0xffff);
 }
 
 /*
diff --git a/include/linux/hid.h b/include/linux/hid.h
index cd41f20..7fb6cf3 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -412,6 +412,7 @@ struct hid_local {
 	unsigned usage_minimum;
 	unsigned delimiter_depth;
 	unsigned delimiter_branch;
+	unsigned int usage_page_preceding;
 };
 
 /*
-- 
2.7.4

