Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 099602794D0
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 01:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgIYXf4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 19:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgIYXfz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 19:35:55 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C55B3C0613CE;
        Fri, 25 Sep 2020 16:35:55 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e18so227748pgd.4;
        Fri, 25 Sep 2020 16:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=i15b0JKcCEn7qZufA0fqER1Rf3NvdTXdprxERiGECxM=;
        b=aJ8TqUp7lTEH3C/zQeCn6egXjz2Hg/sqtoFVyzR8uFxAdj7LUs5azJGf28nuv91mFv
         kDo0esl5hQ+BlX1KVb/m6IrWaE4mnHjnP0wz0L6soz8x125HvdVJSLrUUo3SHmYtT7Rj
         02YmRxYR6RMJ4+asqnZ08VqTZo+w6rQvSAG2VlhfUmffyvJQmZzjTPK+/tEDz2YPZjGM
         9Yi2JAEOFB5iJtmY5U1UImqegvj1KXaby5DbqICZmsqyVQLpXwPM5g0oLOhDtVRAepmQ
         Atk3YO/LgkN5BpSXulZUI2HflWNBmZz2zU/oEZwg8x5W7k7Mb3LLdVUV8yXHDb+xE43H
         Legw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=i15b0JKcCEn7qZufA0fqER1Rf3NvdTXdprxERiGECxM=;
        b=Dn2OuJmQvGu1kSzFDydIqqHlr2kZ45+Ad/dts4XcHi20WEkwzjznpyZ7rTEHYgtryf
         d9vN7KFq4VzHe4CS+8+ZQcYV/GJLHi0pRRcDVAKx7vpLfjckBfyykNKXHZqLDlpRNf4a
         ozG6BGEX/g5F0P2IxWTxPeHmsX/e4vUpHn3wCgGSIof76GqlWipDSNbkT/JxNANIHlPI
         djIbdx3FNgGCDgkZaaVA4tsxlQN880mCYkk9w7NUtaB6Bpouqsts5/n754D4nQAu62y4
         iBcBW4KJAtpXxLNIn5isrfd/rJc2X72qD84TK0kkOYi2zjmRUSc+QBK7PDkMbNbYm1nv
         3s+A==
X-Gm-Message-State: AOAM530aepLeJVq+L0fiYQ2GVFu3BdgSorV7D1Pi0Ag7ucxU/xF0mk3S
        JyQT0ZcbNHL062KJ7IEkmco=
X-Google-Smtp-Source: ABdhPJw67ZTqShxre5CpgvX+xqkOxGhl9OVquoh0aWJtLT4CCOK4PiW6jUmSC/eFr/oX+ouKwRK0Fw==
X-Received: by 2002:a62:fc51:0:b029:142:4506:9a7b with SMTP id e78-20020a62fc510000b029014245069a7bmr863680pfh.28.1601076955127;
        Fri, 25 Sep 2020 16:35:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t24sm3721066pfq.37.2020.09.25.16.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 16:35:54 -0700 (PDT)
Date:   Fri, 25 Sep 2020 16:35:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Kenneth Albanowski <kenalba@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: hid-input: fix stylus battery reporting
Message-ID: <20200925233552.GA4022480@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With commit 4f3882177240 hid-input started clearing of "ignored" usages
to avoid using garbage that might have been left in them. However
"battery strength" usages should not be ignored, as we do want to
use them.

Fixes: 4f3882177240 ("HID: hid-input: clear unmapped usages")
Reported-by: Kenneth Albanowski <kenalba@google.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Kenneth, can you please try this one and see if it fixes your issue?

 drivers/hid/hid-input.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index dea9cc65bf80..5da631d2ec9b 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -797,7 +797,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0x3b: /* Battery Strength */
 			hidinput_setup_battery(device, HID_INPUT_REPORT, field);
 			usage->type = EV_PWR;
-			goto ignore;
+			return;
 
 		case 0x3c: /* Invert */
 			map_key_clear(BTN_TOOL_RUBBER);
@@ -1059,7 +1059,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case HID_DC_BATTERYSTRENGTH:
 			hidinput_setup_battery(device, HID_INPUT_REPORT, field);
 			usage->type = EV_PWR;
-			goto ignore;
+			return;
 		}
 		goto unknown;
 
-- 
2.28.0.681.g6f77f65b4e-goog


-- 
Dmitry
