Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFA2C66ACD8
	for <lists+linux-input@lfdr.de>; Sat, 14 Jan 2023 18:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjANRDM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Jan 2023 12:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbjANRDK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Jan 2023 12:03:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3142AB750
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 09:03:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9017760BC1
        for <linux-input@vger.kernel.org>; Sat, 14 Jan 2023 17:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12541C43392;
        Sat, 14 Jan 2023 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673715789;
        bh=8MWA74o7i6QEFtXjv1ic0ouMom0PTXjvt90h1UTO5/I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dxOGgDdiat1w6hiZlSvFY8jlazu57VmTi92TtuDVTfyaHd//1c3Dr1rqPFkAQ5sl3
         32GaDgl9/8dv1z/2s8iqrg+SRdo7ZjkfQcYjQ5F+0p6L8tCKgTlhsr7NfojRzgo1om
         0xqhhYqUglUfa+8k1ugkwVn3KFvhyC0HbtYhyiNPVJ4nbVjxRUzo24lCKPJ4smiU34
         L6OSYkKQBX4Jcx3NAXuqN5psTyJnvOKUCW52Okbdth5umeBf9zzWIe8vyp1n1ryKwG
         MfB7ITqOnvMEU93T5xWczf7inPlA6r7YicYENKafIGvnykPwLmIvZb7zky0/ZkLicD
         J8qypBAreG3Sw==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jic23@kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 14/16] Input: Use pm_sleep_ptr() to avoid need for ifdef CONFIG_PM_SLEEP
Date:   Sat, 14 Jan 2023 17:16:18 +0000
Message-Id: <20230114171620.42891-15-jic23@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
References: <20230114171620.42891-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

As the new pm_sleep_ptr() macro lets the compiler see the code, but
then remove it if !CONFIG_PM_SLEEP it can be used to avoid the need
for #ifdef guards.  Use that in the input core to simplify the code
a little.  Note pm_sleep_ptr() has not been applied to each callback
in the ops structure because the pm_sleep_ptr() at the usage site
is sufficient.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/input/input.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index ca2e3dd7188b..9fdb22db2ca4 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -19,6 +19,7 @@
 #include <linux/proc_fs.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
+#include <linux/pm.h>
 #include <linux/poll.h>
 #include <linux/device.h>
 #include <linux/kstrtox.h>
@@ -1828,7 +1829,6 @@ static int input_uninhibit_device(struct input_dev *dev)
 	return ret;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int input_dev_suspend(struct device *dev)
 {
 	struct input_dev *input_dev = to_input_dev(dev);
@@ -1903,15 +1903,12 @@ static const struct dev_pm_ops input_dev_pm_ops = {
 	.poweroff	= input_dev_poweroff,
 	.restore	= input_dev_resume,
 };
-#endif /* CONFIG_PM */
 
 static const struct device_type input_dev_type = {
 	.groups		= input_dev_attr_groups,
 	.release	= input_dev_release,
 	.uevent		= input_dev_uevent,
-#ifdef CONFIG_PM_SLEEP
-	.pm		= &input_dev_pm_ops,
-#endif
+	.pm		= pm_sleep_ptr(&input_dev_pm_ops),
 };
 
 static char *input_devnode(const struct device *dev, umode_t *mode)
-- 
2.39.0

