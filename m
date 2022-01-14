Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9B948EFFA
	for <lists+linux-input@lfdr.de>; Fri, 14 Jan 2022 19:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243088AbiANScr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jan 2022 13:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243089AbiANScj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jan 2022 13:32:39 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39099C061746
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:39 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id s6-20020a7bc386000000b0034a89445406so5076683wmj.2
        for <linux-input@vger.kernel.org>; Fri, 14 Jan 2022 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPhgwQ8WkgPyMrOjDMnndrFsC54fCBYnmYW2kzBu0ks=;
        b=6jt6q+eiZcRb6bVZKY3YXveqMzOJsrBjufmuIYrDC3kAfSw0ZxD9DXEqrI6MeqYjF4
         Q7ujBuJW2uV/Wy7Wm6HQLqV1L/N38VZUiDLiYeNU0snkSpcLg8u3XG6Rb0WSpjnBl5Hl
         JmNcT1l1sxtIQRZv65/NAkfMY10FSIgjY9l7kogUqcRpHGjut6rniPtNuoC3qvUN2sE+
         HURkYixhtttwEq/d/730S+YjBz78dfAjsd+n68NORAZsVGXbk+kG3XvkrGAhlvKN8vYf
         ZCi8U14q4uZa5Ypt01OWZ0Kox8UO3vIqzUT5L7bWRkWJD5lIFRVr2ccHKPuqfJp1AjWM
         amAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPhgwQ8WkgPyMrOjDMnndrFsC54fCBYnmYW2kzBu0ks=;
        b=KtIuCeAgpHSabcYFBAsGQx+xrfdHT7e9ptMxl2sh71s18AgUIzZ7HYkQiXwT8cZ6FQ
         L3hZOMBqCbR6op8I5I9x+wxZr9z7LuuVnrd5nTRagERHiWzK0SHYDWLUu640UKCao0Gh
         /clXYXj5BK7bWnVEqw5TKfH7SY+S+GVH1kIcWzRihOaD0BM+QQmluDsbubHCj0KthOgg
         sL+7tfRz0VBsr1RpYs3Y2q4q6dhn1jAxIYkyLLNTlpcEnHqlwycTGT/maskANqRiWBAY
         5Ghnft8BLzc0hYsdhZ7mAETitjQXCVQf+zNqTLVlZI7p9VnNSxRXjSL+i7MAtozBE8+l
         k9KQ==
X-Gm-Message-State: AOAM532Ol0hs+tog3rWf410ZRLYar6ErPMbxBX2Lvdy9hMBw5nQ0Hymq
        g8JIXMrTrvX8yzBGUDwW7mJr0UBYwWE6Y5VI0WQ=
X-Google-Smtp-Source: ABdhPJy6zTyMjXBX9Im3H2yOaVVK5nUvF17gSJSLXvlvlIqiTCo3uGMpztee8ccrSP2VVTfzBZDofw==
X-Received: by 2002:a05:600c:21cf:: with SMTP id x15mr9280402wmj.8.1642185157885;
        Fri, 14 Jan 2022 10:32:37 -0800 (PST)
Received: from aczubak.c.googlers.com.com (109.36.187.35.bc.googleusercontent.com. [35.187.36.109])
        by smtp.gmail.com with ESMTPSA id az4sm6410984wrb.14.2022.01.14.10.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 10:32:37 -0800 (PST)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, dmitry.torokhov@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH v2 16/16] HID: i2c-hid: fix handling numbered reports with IDs of 15 and above
Date:   Fri, 14 Jan 2022 18:31:52 +0000
Message-Id: <20220114183152.1691659-17-acz@semihalf.com>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114183152.1691659-1-acz@semihalf.com>
References: <20220114183152.1691659-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Special handling of numbered reports with IDs of 15 and above is only
needed when executing what HID-I2C spec is calling "Class Specific
Requests", and not when simply sending output reports.

Additionally, our mangling of report ID in i2c_hid_set_or_send_report()
resulted in incorrect report ID being written into SET_REPORT command
payload.

To solve it let's move all the report ID manipulation into
__i2c_hid_command() where we form the command data structure.

Signed-off-by: Angela Czubak <acz@semihalf.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 6726567d7297..3195a1ffae23 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -97,6 +97,7 @@ union command {
 		__le16 reg;
 		__u8 reportTypeID;
 		__u8 opcode;
+		__u8 reportID;
 	} __packed c;
 };
 
@@ -232,7 +233,13 @@ static int __i2c_hid_command(struct i2c_client *client,
 
 	if (length > 2) {
 		cmd->c.opcode = command->opcode;
-		cmd->c.reportTypeID = reportID | reportType << 4;
+		if (reportID < 0x0F) {
+			cmd->c.reportTypeID = reportType << 4 | reportID;
+		} else {
+			cmd->c.reportTypeID = reportType << 4 | 0x0F;
+			cmd->c.reportID = reportID;
+			length++;
+		}
 	}
 
 	memcpy(cmd->data + length, args, args_len);
@@ -300,11 +307,6 @@ static int i2c_hid_get_report(struct i2c_client *client, u8 reportType,
 
 	i2c_hid_dbg(ihid, "%s\n", __func__);
 
-	if (reportID >= 0x0F) {
-		args[args_len++] = reportID;
-		reportID = 0x0F;
-	}
-
 	args[args_len++] = readRegister & 0xFF;
 	args[args_len++] = readRegister >> 8;
 
@@ -350,18 +352,12 @@ static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
 	size =		2			/* size */ +
 			(reportID ? 1 : 0)	/* reportID */ +
 			data_len		/* buf */;
-	args_len =	(reportID >= 0x0F ? 1 : 0) /* optional third byte */ +
-			2			/* dataRegister */ +
+	args_len =	2			/* dataRegister */ +
 			size			/* args */;
 
 	if (!use_data && maxOutputLength == 0)
 		return -ENOSYS;
 
-	if (reportID >= 0x0F) {
-		args[index++] = reportID;
-		reportID = 0x0F;
-	}
-
 	/*
 	 * use the data register for feature reports or if the device does not
 	 * support the output register
-- 
2.34.1.703.g22d0c6ccf7-goog

