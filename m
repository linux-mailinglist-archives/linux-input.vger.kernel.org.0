Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A983198ED
	for <lists+linux-input@lfdr.de>; Fri, 12 Feb 2021 04:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbhBLDuM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Feb 2021 22:50:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLDuK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Feb 2021 22:50:10 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F24EC061756;
        Thu, 11 Feb 2021 19:49:30 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id b24so5838377qtp.13;
        Thu, 11 Feb 2021 19:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZveoRDfU1ztK8NF19LRexUft1jiNWtqDdCKy/TbMan8=;
        b=pjm1QKRM29Trvl+CxxFOg8dRtiTrIZ+HhH/xaNmAvTIG0VsWFCcy7Ads943+y2GhSb
         FhiIMKBZ8D6NCuMlnsLOe07bqNXS9NP42yS4TYHG03Qw0ZsAKwAAdj4MVgRhSufavWip
         x1M51WAWv2vDxhCQfkb8kL60zH30OzYN6SQdL612ES6riuK2fFW9EQ4rW61D1NEL8itw
         Ho/GuulbV3u7PzqEQMY7Tnqqpc6Vab/g+uezoJLB3eg0SyQgCDkzYvbQB0KOTVAAsfOc
         ImQnaw8RCPJIfyUZuxsBvb3Nql7vTR0nhHAcra1gIiQwoNbBFQayI57MBDo7o3BsRUSu
         RoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZveoRDfU1ztK8NF19LRexUft1jiNWtqDdCKy/TbMan8=;
        b=NsKtunj2650ropmE7KYrD/nfqG18SUP6efMkIiXKRxMCJhaLUBpXdmpBDZUk4xbJ9S
         +zDVZD6ZBzOpHokB45iJ9Dx/hgGSElEuI02BVyRM5EIFBfwE0fbvwCw2Ftk7k/Ynylfq
         t7U77gIPP9rmLya3onCK9ELHjI6STd0B98aEjHQY9f7mt5LxPK0xO95YAtAEqMu+ws6f
         B94pvyg93hYUQss8iZWcQ2b6F4mu4vbQOxEhCqF0LDkStFrO6o8oYguy3vcdofUK45U+
         UQLiZMx9sEq06+tTvQTbLwMp9xLgn5uXowbNUrlLEi91BKcgzfmxE24f4X9eddVz1dc+
         bjYw==
X-Gm-Message-State: AOAM5333pMMp/Ipihe0saAcjYUtD8r+QvTbqoiMbYDIyGrJeAZmiq9aR
        uyC6DV6tCxub24hAD9Mft5FqOCdg4CY5Jg==
X-Google-Smtp-Source: ABdhPJwrq49A6o36tlRp3i75H3PiQLhCGubuZsZ/+8pLkpjqRii1rHYC5DI5/0MZ4NrNZs6XxO3UdQ==
X-Received: by 2002:ac8:d03:: with SMTP id q3mr895048qti.19.1613101769684;
        Thu, 11 Feb 2021 19:49:29 -0800 (PST)
Received: from localhost ([128.211.185.211])
        by smtp.gmail.com with ESMTPSA id i65sm5408670qkf.105.2021.02.11.19.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 19:49:29 -0800 (PST)
Date:   Thu, 11 Feb 2021 22:49:27 -0500
From:   Akash Melachuri <amelachuri@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] HID: ezkey: Fix trailing statements error style and blank
 line after declarations warning style.
Message-ID: <20210212034927.3gktbkxzjniyylcg@akash.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fixes the checkpatch.pl errors and warnings:
ERROR: trailing statements should be on next line
ERROR: trailing statements should be on next line
ERROR: trailing statements should be on next line
WARNING: Missing a blank line after declarations

Signed-off-by: Akash Melachuri <amelachuri@gmail.com>
---
 drivers/hid/hid-ezkey.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ezkey.c b/drivers/hid/hid-ezkey.c
index d14f91d78c96..8fa568ac79f9 100644
--- a/drivers/hid/hid-ezkey.c
+++ b/drivers/hid/hid-ezkey.c
@@ -30,14 +30,20 @@ static int ez_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 		return 0;
 
 	switch (usage->hid & HID_USAGE) {
-	case 0x230: ez_map_key(BTN_MOUSE);	break;
-	case 0x231: ez_map_rel(REL_WHEEL);	break;
+	case 0x230:
+		ez_map_key(BTN_MOUSE);
+		break;
+	case 0x231:
+		ez_map_rel(REL_WHEEL);
+		break;
 	/*
 	 * this keyboard has a scrollwheel implemented in
 	 * totally broken way. We map this usage temporarily
 	 * to HWHEEL and handle it in the event quirk handler
 	 */
-	case 0x232: ez_map_rel(REL_HWHEEL);	break;
+	case 0x232:
+		ez_map_rel(REL_HWHEEL);
+		break;
 	default:
 		return 0;
 	}
@@ -54,6 +60,7 @@ static int ez_event(struct hid_device *hdev, struct hid_field *field,
 	/* handle the temporary quirky mapping to HWHEEL */
 	if (usage->type == EV_REL && usage->code == REL_HWHEEL) {
 		struct input_dev *input = field->hidinput->input;
+
 		input_event(input, usage->type, REL_WHEEL, -value);
 		return 1;
 	}
-- 
2.30.0

