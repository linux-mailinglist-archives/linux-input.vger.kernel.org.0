Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 458677A6CEF
	for <lists+linux-input@lfdr.de>; Tue, 19 Sep 2023 23:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbjISV3B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Sep 2023 17:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjISV3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Sep 2023 17:29:00 -0400
X-Greylist: delayed 82 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 19 Sep 2023 14:28:55 PDT
Received: from gcc-spam-ims-003.plexus.com (gcc-spam-ims-003.plexus.com [206.209.244.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3DDB3
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 14:28:55 -0700 (PDT)
Received: from gcc-spam-ims-003.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 18569E0091;
        Tue, 19 Sep 2023 16:28:54 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1695158934; bh=4eSM2i0Kmt7HdstefMHIBAFZDCVUuRvQXFUDwfewmQc=;
        h=From:To:Date;
        b=b22Cm+ZTOLsv8+grHRG/8Qo+BrWw/Hc9fbvt2+qH9S5Y941tLqd8JA1SOL57lpD1N
         vMI56m3Vfq4D7YyoxMZ1GQzdpRvd+8FmuqrI1iq0rwNswn2GnQQ4t4ZiiZgoh75x0e
         QrY3fErU8/C+SnmBpUgsHu93SvVC0G6KsyNtwhw67nFt3tharHtpGKtxt2tvismi0y
         Mb3PWGMmSR4CuoUMaEEbQZfdJhzA0mltx6b999KkQUjjHhmxfj1Pg+V3XiOgX3Ijw3
         UdULdrYip/6fSxK1fkmgOVJv4oscru+Xew8CxLfIHQseoIKWAyLBwwEyH8BVaXC+5H
         qSkRMT5T0++og==
Received: from gcc-spam-ims-003.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 092AFE0083;
        Tue, 19 Sep 2023 16:28:54 -0500 (CDT)
Received: from Dcc-mail-mx-001.na.plexus.com (unknown [10.249.48.15])
        by gcc-spam-ims-003.plexus.com (Postfix) with ESMTPS;
        Tue, 19 Sep 2023 16:28:53 -0500 (CDT)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 21:28:53 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 21:28:53 +0000
From:   Danny Kaehn <danny.kaehn@plexus.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-input@vger.kernel.org>, <ethan.twardy@plexus.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH] hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
Date:   Tue, 19 Sep 2023 16:24:26 -0500
Message-ID: <20230919212426.489637-1-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-SNTS-SMTP: 1274B52C3778239AD30BA1657C347D1AB67E634E35DD3B5F816C7D83BECB3EAA2000:8
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27886.002
X-TM-AS-Result: No--13.953-3.0-31-10
X-imss-scan-details: No--13.953-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27886.002
X-TMASE-Result: 10--13.953300-10.000000
X-TMASE-MatchedRID: MWbpXFXsFA6jcB5AGOhX7jY9eRDvjeTZUBOomz25VdESEYfcJF0pRfX7
        1s7cIJuTLtU3Flh33sdrFmVfWDAwWyL637QCIVpi8vc3EUpCmrVD7uP4VuVvNxmCYUYerLHrW9D
        GjPU7rM96mVK0rVE3R6DmkLztB9AW4vM1YF6AJbbieYV7J8ae4wtuKBGekqUpI/NGWt0UYPCWpt
        zvEHzFH7bkKK8C+PgBhgukVoEv050WYpNPSY8F4BGmlq2wtT5V
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously cp2112_gpio_irq_shutdown always cancelled the
gpio_poll_worker, even if other IRQs were still active, and did not set
the gpio_poll flag to false. This resulted in any call to _shutdown()
resulting in interrupts no longer functioning on the chip until a
_remove occurred (a.e. the cp2112 is unplugged or system rebooted).

Only cancel polling if all IRQs are disabled/masked, and correctly set
the gpio_poll flag, allowing polling to restart when an interrupt is
next enabled.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---
 drivers/hid/hid-cp2112.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 36f76c6dfa20..d589214834b9 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1166,7 +1166,12 @@ static void cp2112_gpio_irq_shutdown(struct irq_data *d)
 	struct cp2112_device *dev = gpiochip_get_data(gc);
 
 	cp2112_gpio_irq_mask(d);
-	cancel_delayed_work_sync(&dev->gpio_poll_worker);
+
+	if (!dev->irq_mask)
+	{
+		dev->gpio_poll = false;
+		cancel_delayed_work_sync(&dev->gpio_poll_worker);
+	}
 }
 
 static int cp2112_gpio_irq_type(struct irq_data *d, unsigned int type)
-- 
2.25.1

