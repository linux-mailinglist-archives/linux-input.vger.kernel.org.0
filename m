Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D28F4472A6
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:23:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234500AbhKGL0d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:26:33 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55594 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234495AbhKGL0d (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:26:33 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgH2mjsTx; Sun, 07 Nov 2021 12:23:49 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284229; bh=uOI5vCuOV2tfAd2+7pOlCZ4OwSmsY8gQEkJvhPRQhRk=;
        h=From;
        b=beovk9gqakoD85AVmqqBsH0Om/d2n7Jn/JIlo9n9tG16yBY7PsU0+QS3KvLMGf/VE
         Yj+9ZFljTkGgV5oXmJqY7NdyAb9wJ5n834Gz8e4lAlpIOO2HZUFNO0PFNUu5CEI8mZ
         KlclsaDy31iehllLOmY9Pgby6AVIrKjK3+1GCO8ly1KjsbLb+6pp8dV0Hu9chwZtwr
         L0Rb6gaH3575U0FTrY85gsPlxunY1BQR+s0ZD23O2ZMFdObodWQIu5E7Glvq7jT5Ha
         wBiLIKnjrqicck9uxVedqpOVpHFSokS4TlKIozbtf2NMHtXCB8/MuDh0pRFXDMTIBo
         tRVscn3h4E5rQ==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b745 cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=HtFsc1wawpgt7NxhaP8A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [RESEND PATCH 5/6] mfd: ti_am335x_tscadc: fix reading a tsc property from DT
Date:   Sun,  7 Nov 2021 12:22:35 +0100
Message-Id: <20211107112236.7969-6-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfB2gslC9y6Fby7yRL5uQ7MUhCkDDwGz1VqESSgr5efL1J+45Vrnh0uIYqDdZKB1IZVYp3cI1gWNTj5WgASM4ViHUcEKq+UpwuZcDNbyhbfBAKTKg8Q41
 Cxh0kLMr1QxQG15y+vSKX9Q4YKcLwuCer/35GGvdVhwbW7LfzItJLookm1/4mt/2p/xUYPfRrOwJIyV5CP7Ks0m1zs1QlJE/lc7B9R9kQrvOG+HZVhINMKtL
 rcjt8/1/HiXjQhCpioxS77UkMFOwwSYewJpbwxwH9kA20h29rzEMX6c9lI7OFfs4oXDxjo31lnVjjY413Wq3X4Jlthuso5sei06SlrbBEagXXZWbSJr4GzE+
 I6MTqUrL5M5nPAqXXQTFrWJ9V1aZPLw4t5RiOs285mu/rLb5JZTKic+IQJ/K9t9kuJQ6N4os/imHqkC0GnW9rRamx0yu8w==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There was a spelling mistake on TSC/ADC binding where "coordinate" was
spelled as "coordiante".

As done by commit c9aeb249bf72 ("Input: ti_am335x_tsc - fix spelling
mistake in TSC/ADC DT binding"), "the approach taken was to first use
correct spelling and if that fails, fall back to miss-spelled version".

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/mfd/ti_am335x_tscadc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 55adc379f94b..53b7a8b7f571 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -141,7 +141,12 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 
 	node = of_get_child_by_name(pdev->dev.of_node, "tsc");
 	of_property_read_u32(node, "ti,wires", &tsc_wires);
-	of_property_read_u32(node, "ti,coordiante-readouts", &readouts);
+	/*
+	 * Try with the new binding first. If it fails, try again with
+	 * bogus, miss-spelled version.
+	 */
+	if (of_property_read_u32(node, "ti,coordinate-readouts", &readouts))
+		of_property_read_u32(node, "ti,coordiante-readouts", &readouts);
 
 	node = of_get_child_by_name(pdev->dev.of_node, "adc");
 	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {
-- 
2.17.1

