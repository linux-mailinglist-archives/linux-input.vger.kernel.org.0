Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB34768805C
	for <lists+linux-input@lfdr.de>; Thu,  2 Feb 2023 15:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjBBOrs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Feb 2023 09:47:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbjBBOrr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Feb 2023 09:47:47 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C687D8D636
        for <linux-input@vger.kernel.org>; Thu,  2 Feb 2023 06:47:44 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id mi9so2100130pjb.4
        for <linux-input@vger.kernel.org>; Thu, 02 Feb 2023 06:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qh3NU4Hu/3pryZhrjxzgEDUiKJ+C8ZvPc2LnDmxMk4Y=;
        b=aKgwKxTr59GRNLgGV7nApQJaqm5e5/XYsfjiW1kjgM6Eo+0ZcCiJfFuku7F0Q5GaBz
         YPEmWYvLbMnxIOVtdOrrPEEUbacSuk3FQpk/FCLBodovxMcY1lDGIZrS8iYUUfTixqCk
         M60NjQ1u7u8gsjZnyHj7vCr7tBLrmNOqeJCAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh3NU4Hu/3pryZhrjxzgEDUiKJ+C8ZvPc2LnDmxMk4Y=;
        b=SG2T5XsTJLnFbjFcnMJglIy9bZ8dL6jpl2DiCkssrNUAkpImiFOPW20PHil4iM5qbC
         xvlC4UsHPYxS+F+saurmdO3ziyvdBfpcZN46Nb/oS4AGXA8p6UDg0ZMXDWWFD7AFO88M
         1a//+PBaZTmWVKUlpWAVWaGKuZauAWc4OTI1Ojs+DVo2rA/vW/6ROc2fWbZBneXjQz6C
         Pw+cIqCea8E2gQ+Wl6bj6VhzLvix+1tpF6ibikC8/d1orKVVcEMXKMfzs4HQB55wDseK
         tj8NLI27MYZR/Lgirysac7F+cNO+NBf5Ap+gLb2UdyNqy48bSdrWl0KfBevJzRuLsB/R
         7vGw==
X-Gm-Message-State: AO0yUKVgM9IX7/S9C6offdEF1fw3P//1I8TNI+Er+HCr7S/Z3A8BI6N1
        jtZBh9iMu4BkQ3hHsUOMsJZc23shtyE0rBMH
X-Google-Smtp-Source: AK7set8QMGiNU8p73FTyVidLdZka5kdITOynMVS7Lq9LKK9RCEAnB6wUoECUWV7uwL/4jur9LZawSg==
X-Received: by 2002:a17:90a:1a5e:b0:22c:7e2a:efc8 with SMTP id 30-20020a17090a1a5e00b0022c7e2aefc8mr6722668pjl.47.1675349264087;
        Thu, 02 Feb 2023 06:47:44 -0800 (PST)
Received: from ballway1.c.googlers.com.com (97.173.125.34.bc.googleusercontent.com. [34.125.173.97])
        by smtp.gmail.com with ESMTPSA id gc5-20020a17090b310500b0022c52a0c202sm3359508pjb.18.2023.02.02.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 06:47:43 -0800 (PST)
From:   Allen Ballway <ballway@chromium.org>
To:     benjamin.tissoires@redhat.com
Cc:     jikos@kernel.org, lukas.bulwahn@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Allen Ballway <ballway@chromium.org>
Subject: [PATCH] HID: multitouch: Fix typo in config check
Date:   Thu,  2 Feb 2023 14:47:28 +0000
Message-Id: <20230202144149.1.I7f213388b358718068c63acb698dc4937716cf35@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes a typo causing a config check to look for a nonexistent config,
leaving the affected code unusable.

Signed-off-by: Allen Ballway <ballway@chromium.org>
---

 drivers/hid/hid-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 78452faf3c9b4..8417066b5ff72 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -1300,7 +1300,7 @@ unsigned long hid_lookup_quirk(const struct hid_device *hdev)
 	mutex_unlock(&dquirks_lock);

 	/* Get quirks specific to I2C devices */
-	if (IS_ENABLED(CONFIG_I2C_DMI_CORE) && IS_ENABLED(CONFIG_DMI) &&
+	if (IS_ENABLED(CONFIG_I2C_HID_CORE) && IS_ENABLED(CONFIG_DMI) &&
 	    hdev->bus == BUS_I2C)
 		quirks |= i2c_hid_get_dmi_quirks(hdev->vendor, hdev->product);

--
2.39.1.456.gfc5497dd1b-goog

