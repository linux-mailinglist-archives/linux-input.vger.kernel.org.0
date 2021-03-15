Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EF833AC32
	for <lists+linux-input@lfdr.de>; Mon, 15 Mar 2021 08:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbhCOH1i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 03:27:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbhCOH11 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 03:27:27 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AE4C061574;
        Mon, 15 Mar 2021 00:27:27 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id 16so13516807pgo.13;
        Mon, 15 Mar 2021 00:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zBUXIeG213KQJlgBsMOwi9S9lWZvHTtOisOkMQVYBLk=;
        b=CzCkjYDyXAJVVOuar2XSkGTsaqW+3/FCjEUIiZ4gg+wG1qF1yb5NxR3oPJOFq4xOZy
         0hO8xx9JD4jlyrIy0zEcxAUFVobAjXWgIqlKKOmVp1FxnqCBStTCdXu3mCaWJvulXhS1
         xlSuI6G6KWblhbu6qK0YQ1yj0nCxnAju0csgP5w8AMV+QJpM8gF4wKzMxL3DE6rDrs2g
         g7wCK1pJ6FI4X985Zsol5LK6/5YJx0y6H9EWxEglF2DIBoJE+fRJ4G3gtXwdutFRPL+U
         4Va+cXhS6WO1vM/wplwG1BqzjHBJxKmfiILwKkemwW9esWwFppoIzVMfcmk3TJU8xrmD
         UC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=zBUXIeG213KQJlgBsMOwi9S9lWZvHTtOisOkMQVYBLk=;
        b=kcfFiteOJZN5a0vlMKdk1VOKJW5RmrVnkM9VYRsLFVut4mrLEPGPgQTtGT7b+Rtyfj
         JRAcyS4UQZ7CwkPPENfRBYm/NkjVnkxs81o9PEYqKakkZBdU7dE3QPXVAUxc48gnC8xM
         09ERUszzYL2jHygJhsI6JNaLsFArjib2BLYh5H8dnMXT75o3pDPB1Fp5HkczUYm4Cl34
         tv7TvQZXFjJeRiuUb4rqKjzNxPBekFMzKh38QTUe/+K5uNvWooAdeS3pC2dw/8ilWBjk
         0ti1V7ZAZQEz5Rez+/cptkj08Y11udD2/x/WDfTz5jhyXu50uW78vh/Tz672CqpxQZQW
         kJMQ==
X-Gm-Message-State: AOAM533uf0ghmf6OyTa+4o1qnNsce8wb5vEVFkP/nG5sG3Mkd3IKwYZ9
        V0qulq1vwpFV8N/jSbhyWVc=
X-Google-Smtp-Source: ABdhPJyXF/H6L/6C5YDBfrOMJYqWKKohWo1Jb/T1M/z8GkpoZ15TyOKNJT+cInHvJhdkfuYRyHyDWw==
X-Received: by 2002:a05:6a00:1507:b029:1e4:d81:5586 with SMTP id q7-20020a056a001507b02901e40d815586mr9273041pfu.53.1615793246679;
        Mon, 15 Mar 2021 00:27:26 -0700 (PDT)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id b14sm12320021pfi.74.2021.03.15.00.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 00:27:25 -0700 (PDT)
Sender: AceLan Kao <acelan@gmail.com>
From:   AceLan Kao <acelan.kao@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rajat Jain <rajatja@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Luo Meng <luomeng12@huawei.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: i8042 - add dmi quirk
Date:   Mon, 15 Mar 2021 15:27:24 +0800
Message-Id: <20210315072724.57651-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>

On some platforms, the EC doesn't support the register reading sequence
for sentelic[1], and then make the EC can't respond commands for a while
when probing. It leads to the keyboard non-responsive for around 10
seconds while waking up from s2idle.

[   44.304488] i8042: [9804] d4 -> i8042 (command)
[   44.304634] i8042: [9804] f3 -> i8042 (parameter)
[   44.304787] i8042: [9804] fa <- i8042 (interrupt, 1, 12)
[   44.304855] i8042: [9804] d4 -> i8042 (command)
[   44.304938] i8042: [9804] 66 -> i8042 (parameter)
[   44.337698] i8042: [9813] d4 -> i8042 (command)
[   44.905695] i8042: [9942] 88 -> i8042 (parameter)
[   45.497478] i8042: [10102] d4 -> i8042 (command)
[   46.098041] i8042: [10253] f3 -> i8042 (parameter)
[   46.098070] i8042: [10253] fe <- i8042 (interrupt, 1, 12)
[   46.718154] i8042: [10386] d4 -> i8042 (command)
[   47.309915] i8042: [10386] f4 -> i8042 (parameter)
[   47.918961] i8042: [10556] d4 -> i8042 (command)
[   48.402624] i8042: [10556] f6 -> i8042 (parameter)

A DMI quirk to mark this platform doesn't have aux device could avoid those
commands to be sent. And the system could still using i2c interface to
communicate with the touchpad.

1. https://www.kernel.org/doc/html/v5.11/input/devices/sentelic.html#programming-sequence-for-register-reading-writing

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
 drivers/input/serio/i8042.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index dbe1810e6242..3d778c9616dc 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/suspend.h>
 #include <linux/property.h>
+#include <linux/dmi.h>
 
 #include <asm/io.h>
 
@@ -174,6 +175,24 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id);
 static bool (*i8042_platform_filter)(unsigned char data, unsigned char str,
 				     struct serio *serio);
 
+static int __init i8042_set_noaux(const struct dmi_system_id *dmi)
+{
+	i8042_noaux = true;
+	return 1;
+}
+
+static const struct dmi_system_id i8042_quirks[] __initconst = {
+	{
+		.callback = i8042_set_noaux,
+		.ident = "Dell laptop",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 5550"),
+		},
+	},
+	{},
+};
+
 void i8042_lock_chip(void)
 {
 	mutex_lock(&i8042_mutex);
@@ -1559,6 +1578,8 @@ static int __init i8042_probe(struct platform_device *dev)
 		i8042_dritek_enable();
 #endif
 
+	dmi_check_system(i8042_quirks);
+
 	if (!i8042_noaux) {
 		error = i8042_setup_aux();
 		if (error && error != -ENODEV && error != -EBUSY)
-- 
2.25.1

