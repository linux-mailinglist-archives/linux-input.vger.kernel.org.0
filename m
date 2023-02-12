Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3929D693981
	for <lists+linux-input@lfdr.de>; Sun, 12 Feb 2023 20:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjBLTB0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Feb 2023 14:01:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjBLTBY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Feb 2023 14:01:24 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E9B11145
        for <linux-input@vger.kernel.org>; Sun, 12 Feb 2023 11:01:21 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id n10so84899ejc.4
        for <linux-input@vger.kernel.org>; Sun, 12 Feb 2023 11:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRPvAiBkeLUL9hlg8+pXXPP3amhZpL1tscetpufbF0M=;
        b=eYSJq9GNuJsNBNK8O1hPFzBkCeZz6NILexaR/TajgPMMu3EcS2hpUXsTZBZ4pT9Shl
         pmj0/I7BZvvgFvdU1os1Y+OWDY0XFk0I4GWTLH7f4PouTJrTwFMbM5ZSJMQD1O7L3ng8
         uR0/JHyy9jOwc9BB2igVFCOqnUSD9L2BwVW5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRPvAiBkeLUL9hlg8+pXXPP3amhZpL1tscetpufbF0M=;
        b=5lJUOWcSsLdpCx+zVnl1bgNLxCe9ZBdQnG0QLS+ZWkJudnnMWqX+SuLA4fHvLyLy3v
         E8ahNfhfZZyOsCxxOC+MeRdxico3yvmE8WUmQNfD/yLZaIG1JSapcZxLmKnJJZt6hUOU
         08lU2W9LjHbSdjI0tavPx7FEtVa2CexRpHLgGf/4PaoOSk63MK1V/1AD3oMDb12wjFyS
         ClpLmGCDUXCWhhiXK7uvahP6W5JYOBlSEwPhzY/QoO78UQRY8V9cwwMhVpwyG/Rg3kDe
         du+L0strX8Xa8c57s+XaQ7PkiZyLbTWbYGVFhuJFqz5S+G++XoFkfdzy7McQh2RfK5dD
         dsYw==
X-Gm-Message-State: AO0yUKXlFnQIR9NU71Hb8AKY1ialbVWFSRszVBGdzO3V+N+5vBQlRO4X
        Q63V5ByLb/23FIeG/bCenSQKgw==
X-Google-Smtp-Source: AK7set96kZND7hdGmA2oJPkYoZNRV8kjhk8xYY52MzofUZ42iuET58D6spngjEQ0zvgiirTer2heug==
X-Received: by 2002:a17:907:8d17:b0:8af:346a:c186 with SMTP id tc23-20020a1709078d1700b008af346ac186mr15082146ejc.24.1676228479927;
        Sun, 12 Feb 2023 11:01:19 -0800 (PST)
Received: from [192.168.17.2] (wolkje-127.labs.vu.nl. [130.37.198.127])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906079a00b008966488a5f1sm5714368ejc.144.2023.02.12.11.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 11:01:19 -0800 (PST)
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Sun, 12 Feb 2023 19:00:00 +0000
Subject: [PATCH v4 2/5] HID: bigben_worker() remove unneeded check on
 report_field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230125-hid-unregister-leds-v4-2-7860c5763c38@diag.uniroma1.it>
References: <20230125-hid-unregister-leds-v4-0-7860c5763c38@diag.uniroma1.it>
In-Reply-To: <20230125-hid-unregister-leds-v4-0-7860c5763c38@diag.uniroma1.it>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>, Hanno Zulla <abos@hanno.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pietro Borrello <borrello@diag.uniroma1.it>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676228478; l=1130;
 i=borrello@diag.uniroma1.it; s=20221223; h=from:subject:message-id;
 bh=erpS3Lwu6lI02igZY1eCc+3rq7i9mxiiO+QpEzGNGZU=;
 b=zxcicO+6OXIqSiidn0/stqb7E4CL0SQUxJ/RENYMcH8Z8HVV+3rEVBYO/Q9ZkSkBvwK+5Bjiptll
 4iHsurZyDhM6xSfL4Mr6BqHuD0QGvQ85HNCPRMyKhhgnrvqC62gx
X-Developer-Key: i=borrello@diag.uniroma1.it; a=ed25519;
 pk=4xRQbiJKehl7dFvrG33o2HpveMrwQiUPKtIlObzKmdY=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

bigben_worker() checks report_field to be non-NULL.
The check has been added in commit
918aa1ef104d ("HID: bigbenff: prevent null pointer dereference")
to prevent a NULL pointer crash.
However, the true root cause was a missing check for output
reports, patched in commit
c7bf714f8755 ("HID: check empty report_list in bigben_probe()"),
where the type-confused report list_entry was overlapping with
a NULL pointer, which was then causing the crash.

Fixes: 918aa1ef104d ("HID: bigbenff: prevent null pointer dereference")
Signed-off-by: Pietro Borrello <borrello@diag.uniroma1.it>
---
 drivers/hid/hid-bigbenff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index ed3d2d7bc1dd..b98c5f31c184 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -197,7 +197,7 @@ static void bigben_worker(struct work_struct *work)
 	u32 len;
 	unsigned long flags;
 
-	if (bigben->removed || !report_field)
+	if (bigben->removed)
 		return;
 
 	buf = hid_alloc_report_buf(bigben->report, GFP_KERNEL);

-- 
2.25.1

