Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E12A5635D6B
	for <lists+linux-input@lfdr.de>; Wed, 23 Nov 2022 13:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237384AbiKWMnF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Nov 2022 07:43:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237398AbiKWMmD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Nov 2022 07:42:03 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD81E6BDEC;
        Wed, 23 Nov 2022 04:41:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8853FB81F37;
        Wed, 23 Nov 2022 12:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFDFC433D6;
        Wed, 23 Nov 2022 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669207296;
        bh=YHcjeRETRWjMGSO4ndh1O2l3ktz4uzoL4Rcq6wzbhSg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p0qp17TJTq9tBmy/Tn/OWdiz+oviy0ycEe37y2ug7NZo5DtOa0JTbEtSL/3hAQiLw
         /xLtjsC14C+rcQ1gEUY3kq8IHYkKwjUMJYiS0lzAx0kAeetCxcNmuIrW8uGdQWNsYc
         t1swTlPNHCOkb07xwJZEEUImvRIbUGYuGsVYbfZJ7HNXn1SnaVlraA05/kHCv2OBn+
         Lj0gqQpcE6cWm+8EHu042GH3rPisoi7BYgK9rNCvRbkJ/CZFmjocJjlO/IdfYSfrST
         +evkkj3UTyeqCYYYLRegaOrTenBXeDU2ajFTvObljFXGkt+s9WqOHiibrRb7NGMtjF
         uRbbA6H4+c0mw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>,
        andriy.shevchenko@linux.intel.com, rafael.j.wysocki@intel.com,
        mail@mariushoch.de, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 15/44] Input: soc_button_array - add use_low_level_irq module parameter
Date:   Wed, 23 Nov 2022 07:40:24 -0500
Message-Id: <20221123124057.264822-15-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123124057.264822-1-sashal@kernel.org>
References: <20221123124057.264822-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 8e9ada1d0e72b4737df400fe1bba48dc42a68df7 ]

It seems that the Windows drivers for the ACPI0011 soc_button_array
device use low level triggered IRQs rather then using edge triggering.

Some ACPI tables depend on this, directly poking the GPIO controller's
registers to clear the trigger type when closing a laptop's/2-in-1's lid
and re-instating the trigger when opening the lid again.

Linux sets the edge/level on which to trigger to both low+high since
it is using edge type IRQs, the ACPI tables then ends up also setting
the bit for level IRQs and since both low and high level have been
selected by Linux we get an IRQ storm leading to soft lockups.

As a workaround for this the soc_button_array already contains
a DMI quirk table with device models known to have this issue.

Add a module parameter for this so that users can easily test if their
device is affected too and so that they can use the module parameter
as a workaround.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20221106215320.67109-1-hdegoede@redhat.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/misc/soc_button_array.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 480476121c01..50497dd05027 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -18,6 +18,10 @@
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
 
+static bool use_low_level_irq;
+module_param(use_low_level_irq, bool, 0444);
+MODULE_PARM_DESC(use_low_level_irq, "Use low-level triggered IRQ instead of edge triggered");
+
 struct soc_button_info {
 	const char *name;
 	int acpi_index;
@@ -164,7 +168,8 @@ soc_button_device_create(struct platform_device *pdev,
 		}
 
 		/* See dmi_use_low_level_irq[] comment */
-		if (!autorepeat && dmi_check_system(dmi_use_low_level_irq)) {
+		if (!autorepeat && (use_low_level_irq ||
+				    dmi_check_system(dmi_use_low_level_irq))) {
 			irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
 			gpio_keys[n_buttons].irq = irq;
 			gpio_keys[n_buttons].gpio = -ENOENT;
-- 
2.35.1

