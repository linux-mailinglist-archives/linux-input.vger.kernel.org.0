Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA5B17EF5A
	for <lists+linux-input@lfdr.de>; Tue, 10 Mar 2020 04:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCJDhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Mar 2020 23:37:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36255 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgCJDhA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Mar 2020 23:37:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id d9so5678776pgu.3;
        Mon, 09 Mar 2020 20:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQ2evaN/DUZCzsdhMP92QzqwwkEVtumTyoEOmufO0vk=;
        b=NBngvdjNTbn5o7d9bDXPCfdayWCkx2I0a4WvFB9aiaCEkdDExDUhV4k94sf2/kE92R
         7H9XV1KdNHbM9DIpZE7lw2ZKJ+ZOSJd4BQ2fRq6mT2CcOZ/Qq1ULmiT5rRqScMHulAKd
         1YNeXm8FwoKRM2Jg8b9fMWcj6Ms+cKcufpvVDihQpak3XZYQA8kAvT36cqU2kYQlvhrb
         tW0QNRW6j4C8KdJiumKzBoi/zBSuJNfmBwiYIOVKJWqGtAOSzz2bmcRKl4Rsk1QPcO1v
         Fo+B4LO6zKDYvzQfRJQGEGHZvBC9TQ/NRLTwua/2hPAqtS+Z6+0YIcJAPsNF9i3qualj
         7uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQ2evaN/DUZCzsdhMP92QzqwwkEVtumTyoEOmufO0vk=;
        b=s0HZWB+41H1dAEwzXlIhbRxXYrIpzdH19EFJ57A7QOKkt7xnUu6nbG5cEa9HkcdPPE
         wOdaCsgPrrrBAptbrjqJ2Cab/tzgbmNom/NRJ4d9Cc9Sc4H0OZGU5jFT9H3rPpABxbYc
         bQPXlxej7TvrlR5SypUCV2T6SD3G99u1ohzzhf4N7PZJgs5f9xqm3mdQr6JYbZ5fBOjw
         H7sS85mNdpj1Xq7MX+hGjFqbdMKKkKGyEk9AHzlTrFdeSldMJfe14IrJYhz4+C1EWn+0
         8ONo2w4MoDm/s2zHPLzbgjUj+g2UeEj+gHI+NJGX4BPCX1bs/C6hsj5Ftx+TwvCHo2yS
         PjRA==
X-Gm-Message-State: ANhLgQ1IvuCu0LADdxh0ZfbTDXi21s9L9oWuVeiWpN0/BcVPDPgYAiup
        /ooe8BoKlovefMJtmUh/iEY=
X-Google-Smtp-Source: ADFU+vu0hhbW1grwInMnvMYCCVCZkUyMIl4B+MN0MIL7TY/q0bmUaRo1QTWAw2yaEmJYOYZPs9j59g==
X-Received: by 2002:a62:8144:: with SMTP id t65mr11599054pfd.188.1583811418672;
        Mon, 09 Mar 2020 20:36:58 -0700 (PDT)
Received: from localhost (111-82-208-34.emome-ip.hinet.net. [111.82.208.34])
        by smtp.gmail.com with ESMTPSA id d77sm34060984pfd.109.2020.03.09.20.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 20:36:57 -0700 (PDT)
From:   You-Sheng Yang <vicamo@gmail.com>
To:     vicamo@gmail.com
Cc:     acelan.kao@canonical.com, allison@lohutok.net,
        dmitry.torokhov@gmail.com, info@metux.net,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael.j.wysocki@intel.com, swboyd@chromium.org,
        tglx@linutronix.de, You-Sheng Yang <vicamo.yang@canonical.com>
Subject: [PATCH v2] Input: i8042 - fix the selftest retry logic
Date:   Tue, 10 Mar 2020 11:36:40 +0800
Message-Id: <20200310033640.14440-1-vicamo@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <501e8224-e334-0aa8-41c0-8f67552e7069@gmail.com>
References: <501e8224-e334-0aa8-41c0-8f67552e7069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: You-Sheng Yang <vicamo.yang@canonical.com>

It returns -NODEV at the first selftest timeout, so the retry logic
doesn't work. Move the return outside of the while loop to make it real
retry 5 times before returns -ENODEV.

BTW, the origin loop will retry 6 times, also fix this.

Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 drivers/input/serio/i8042.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 20ff2bed3917..e8f2004071d4 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -937,25 +937,28 @@ static int i8042_controller_selftest(void)
 {
 	unsigned char param;
 	int i = 0;
+	int ret;
 
 	/*
 	 * We try this 5 times; on some really fragile systems this does not
 	 * take the first time...
 	 */
-	do {
-
-		if (i8042_command(&param, I8042_CMD_CTL_TEST)) {
-			pr_err("i8042 controller selftest timeout\n");
-			return -ENODEV;
-		}
+	while (i++ < 5) {
 
-		if (param == I8042_RET_CTL_TEST)
+		ret = i8042_command(&param, I8042_CMD_CTL_TEST);
+		if (ret)
+			pr_err("i8042 controller selftest timeout (%d/5)\n", i);
+		else if (param == I8042_RET_CTL_TEST)
 			return 0;
+		else
+			dbg("i8042 controller selftest: %#x != %#x\n",
+			    param, I8042_RET_CTL_TEST);
 
-		dbg("i8042 controller selftest: %#x != %#x\n",
-		    param, I8042_RET_CTL_TEST);
 		msleep(50);
-	} while (i++ < 5);
+	}
+
+	if (ret)
+		return -ENODEV;
 
 #ifdef CONFIG_X86
 	/*
-- 
2.25.0

