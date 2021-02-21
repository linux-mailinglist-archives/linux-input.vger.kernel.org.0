Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5621320E3B
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 23:15:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhBUWNV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 17:13:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbhBUWNO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 17:13:14 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5B4C061574;
        Sun, 21 Feb 2021 14:12:30 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id s12so4613234qvq.4;
        Sun, 21 Feb 2021 14:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZveoRDfU1ztK8NF19LRexUft1jiNWtqDdCKy/TbMan8=;
        b=ljR0S1WYkdA1OLqy/x6rQdsiPkP/YbdtreQ+yiZ/YNWxwWHBaTPP7vq036qGCDLhiw
         HS9WEUC+bTeHuOvRIKid9otkTKp5CkI6wayvcTtoX5EPPftvQGMsieBSafnjud/hTRL0
         28VUK0krLAXTeADfH6jk3oSI3hoxxD/7zj2k5wSVAkx7HJPcE2iZhILZd8ZYMR2pbyb9
         vJav7upaf73H5spXjkGomfQWH8MJOJzaVI8kmur6WH/bLx7vBoE+dHELmU2/HbCjMEIg
         Tnw8xo1eFLx6JVcqeZZXbgTmkHQHo9w43HhKpGXYfYnlUFRR0BLMSTMi6R66MEDY4Z7k
         tliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZveoRDfU1ztK8NF19LRexUft1jiNWtqDdCKy/TbMan8=;
        b=UWiNlkIT13t/IBWD3vq+6tMaHzXnXrbq6gJleeHzHFDYrzOkewU1AfN0SxKMMeEej9
         uOLqLq6YiFveoqr579mS15UhonYVpg2vQNBtzECJm83tyIWQMthWKj4Gb+zW8HcWBZM5
         xyJOmbo+BbhEqzZMfCLiIsUUh8yqKjjOZyUTymK4QvJ2zRZ5IfVtFBgaC1WjR0u3ZdzI
         Wg2cPV8nPnPXcYbM4R/4XT3BrwqKwAodtqw7KqmhIgx2PRgumPENnEnJANc+hphcGmVk
         zurYpwMkHnEZ4EG9gfgTIcOkvmmLcJ3/s9pN6RwK+09eOezgqTUeGFfx6LkM+mVbXPIN
         10sg==
X-Gm-Message-State: AOAM532hOW92NWFaYymWhkMAfhxWyBYl6tv+0CveK5sYsjnyWdhxZaGP
        MGBvxQ6kGOgIUfh8K3itCpgzYQ3rN3/ooQ==
X-Google-Smtp-Source: ABdhPJwVZxISMQmAB7V7M3w47ceDWkiuPm+mL91l7B89IGpf8ud/mPjoH8xpAu5AIYYW9mcRDnvDpQ==
X-Received: by 2002:a0c:b418:: with SMTP id u24mr17959285qve.20.1613945549780;
        Sun, 21 Feb 2021 14:12:29 -0800 (PST)
Received: from localhost ([128.211.185.212])
        by smtp.gmail.com with ESMTPSA id p12sm9694739qtw.27.2021.02.21.14.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:12:29 -0800 (PST)
Date:   Sun, 21 Feb 2021 17:12:28 -0500
From:   Akash Melachuri <amelachuri@gmail.com>
To:     benjamin.tissoires@redhat.com
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] HID: ezkey: Fix trailing statements error style and blank
 line after declarations warning style.
Message-ID: <20210221221228.avvdbmcn5miebpk2@akash.localdomain>
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

