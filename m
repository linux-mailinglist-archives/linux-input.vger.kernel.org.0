Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2837A7C5B4E
	for <lists+linux-input@lfdr.de>; Wed, 11 Oct 2023 20:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233077AbjJKS3U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Oct 2023 14:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbjJKS3U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Oct 2023 14:29:20 -0400
Received: from gcc-spam-ims-002.plexus.com (gcc-spam-ims-002.plexus.com [206.209.244.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0BCF93
        for <linux-input@vger.kernel.org>; Wed, 11 Oct 2023 11:29:18 -0700 (PDT)
Received: from gcc-spam-ims-002.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6FC21134105;
        Wed, 11 Oct 2023 13:29:17 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1697048957; bh=9G9d4zmZlJdXSmbZU/4RzQL902HusKI4+hbskmU0nlI=;
        h=From:To:Date;
        b=f8z8Xq0eTqfMTsApuinOTXM4JN3YPhT1THuBy3+8tzPvj4jcNceaN+awZtdiBF3sa
         zAkN1LyowqR/PG5jA6sYBuAPedgehr8p5xBl6tE7Y2nO2O3FiFTFR3Y0vvHagZYOrm
         r1LBeM6ANFhB0cQtBlmFSD2212UUX5cxNDIKUDDk0+ZxfgJTF5uwKHkYYp84A2wntG
         X8O2c+pO/Crs4y28CPhJKyAFsoVBOr/l0+GF1+UzssqenZNwSab4gDI+WQHU2OAT3f
         N+203Bfg31gifKWwuBZyt6WuNdfShuNKXZA5wK37yZwvIj1X925cX9pZjNIj7TWQBM
         KUaTzx2fEXvjA==
Received: from gcc-spam-ims-002.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6310B1340FD;
        Wed, 11 Oct 2023 13:29:17 -0500 (CDT)
Received: from gcc-mail-mx-004.na.plexus.com (unknown [10.255.51.224])
        by gcc-spam-ims-002.plexus.com (Postfix) with ESMTPS;
        Wed, 11 Oct 2023 13:29:17 -0500 (CDT)
Received: from gcc-mail-mx-002.Na.Plexus.com (10.255.51.221) by
 gcc-mail-mx-004.na.plexus.com (10.255.51.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:29:16 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-002.Na.Plexus.com (10.255.51.221) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 18:29:16 +0000
From:   Danny Kaehn <danny.kaehn@plexus.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-input@vger.kernel.org>, <ethan.twardy@plexus.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH v2] hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
Date:   Wed, 11 Oct 2023 13:23:17 -0500
Message-ID: <20231011182317.1053344-1-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-SNTS-SMTP: 6788294C848035D517CBCF12F05C4E959B738D0AE6B83567B8E9C4822F8F74082000:8
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27930.001
X-TM-AS-Result: No--16.246-3.0-31-10
X-imss-scan-details: No--16.246-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27930.001
X-TMASE-Result: 10--16.246300-10.000000
X-TMASE-MatchedRID: ZjlhEhW1wQ+jcB5AGOhX7jY9eRDvjeTZUBOomz25VdESEYfcJF0pRfX7
        1s7cIJuTLtU3Flh33seYFC8uMwGxQS1u0Q3ICykxHU1P4jBke7SNATTg/xyXYU7nLUqYrlslFIu
        BIWrdOeOjEIt+uIPPOCZle49VkKqHl/NSQGlzTvYbj3a5GzdeL3eXfumzA7TRngIgpj8eDcBpka
        jQR5gb3lQwtQm7iV5jKrauXd3MZDUD/dHyT/Xh7Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously cp2112_gpio_irq_shutdown() always cancelled the
gpio_poll_worker, even if other IRQs were still active, and did not set
the gpio_poll flag to false. This resulted in any call to _shutdown()
resulting in interrupts no longer functioning on the chip until a
_remove() occurred (a.e. the cp2112 is unplugged or system rebooted).

Only cancel polling if all IRQs are disabled/masked, and correctly set
the gpio_poll flag, allowing polling to restart when an interrupt is
next enabled.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---

Changes since v1 -- resolving comments from Andy:
- Addressed patch message missing parens
- Fixed opening bracket on newline


 drivers/hid/hid-cp2112.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 54c33a24f844..b24d398f430f 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1168,7 +1168,11 @@ static void cp2112_gpio_irq_shutdown(struct irq_data *d)
 	struct cp2112_device *dev = gpiochip_get_data(gc);
 
 	cp2112_gpio_irq_mask(d);
-	cancel_delayed_work_sync(&dev->gpio_poll_worker);
+
+	if (!dev->irq_mask) {
+		dev->gpio_poll = false;
+		cancel_delayed_work_sync(&dev->gpio_poll_worker);
+	}
 }
 
 static int cp2112_gpio_irq_type(struct irq_data *d, unsigned int type)
-- 
2.25.1

