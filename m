Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A52C47A6D4A
	for <lists+linux-input@lfdr.de>; Tue, 19 Sep 2023 23:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjISVtp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Sep 2023 17:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233452AbjISVti (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Sep 2023 17:49:38 -0400
Received: from gcc-spam-ims-003.plexus.com (gcc-spam-ims-003.plexus.com [206.209.244.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C278FD7
        for <linux-input@vger.kernel.org>; Tue, 19 Sep 2023 14:49:12 -0700 (PDT)
Received: from gcc-spam-ims-003.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 10614E00C7;
        Tue, 19 Sep 2023 16:27:32 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plexus.com; s=us;
        t=1695158852; bh=GgW5iYe+D4lnJHx7xSJ+eHUitrhvVwLg02sp2f1wTIg=;
        h=From:To:Date;
        b=utQXh0ITI7Ap6EdGMzceX3scKH/5OnW1/Pnc1pWR27fRHlYWpStyp6KTsrYmLYFOP
         rpUfYnqoYiKsmbAGxcywJkiiRaT3vq03B/Lg0g6CnCLeQJ4fGxBQBn6jS26uDPlvK5
         G8jFWWcAzETkGofb7WOyjG7Rbtd1DYDPWpK6P9T3VcThckCDN9c8o0xJRGw54ZBgIJ
         9PaCxNhyNHF+ooBfdaGnjjbc4jPzzpyEpgb53gcM6W/av0k2BjYZ/KEUFiHW6ZB5Eq
         je6jF6bjAGZhD7tClq+5DiVF7KQaisFsbvDiM6tAtFg8+u11WhKXF9b/sJ9LTff4XS
         tPQmqM6JZeorA==
Received: from gcc-spam-ims-003.plexus.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 01F4BE0091;
        Tue, 19 Sep 2023 16:27:32 -0500 (CDT)
Received: from Dcc-mail-mx-001.na.plexus.com (unknown [10.249.48.15])
        by gcc-spam-ims-003.plexus.com (Postfix) with ESMTPS;
        Tue, 19 Sep 2023 16:27:31 -0500 (CDT)
Received: from dcc-mail-mx-001.na.plexus.com (10.249.48.15) by
 Dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 21:27:31 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 21:27:31 +0000
From:   Danny Kaehn <danny.kaehn@plexus.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-input@vger.kernel.org>, <ethan.twardy@plexus.com>,
        Danny Kaehn <danny.kaehn@plexus.com>
Subject: [PATCH] hid: cp2112: Fix duplicate workqueue initialization
Date:   Tue, 19 Sep 2023 16:22:45 -0500
Message-ID: <20230919212245.483646-1-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-SNTS-SMTP: 8A79A5E8D5A496DE2D836DF393A65635CB81A3854FBD1A4AD6606689BA0781FD2000:8
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.2164-9.0.0.1002-27886.002
X-TM-AS-Result: No--17.035-3.0-31-10
X-imss-scan-details: No--17.035-3.0-31-10
X-TMASE-Version: IMSVA-9.1.0.2164-9.0.1002-27886.002
X-TMASE-Result: 10--17.034600-10.000000
X-TMASE-MatchedRID: TPyKUOUUvtEl3q2mDd7YjuA/bh6avLQ2cgDifvL5MervZFvZsQkL7Rgf
        f28UuvITFxOIernkp32+EodAtMqKbE7yBNcycurj8zNox86R2ZsKlOLZpoNxyKoXHZz/dXlxTJD
        l9FKHbrnAuQ0xDMaXkLKoUszL+VmmasOJoXx/wo+1uR5DbjvHlxM07BCTU20/zr16YOzjZ13qtO
        CMCMzOYZsoi2XrUn/Jn6KdMrRsL14qtq5d3cxkNQP90fJP9eHt
X-TMASE-SNAP-Result: 1.821001.0001-0-2-1:0,12:0,22:0,33:0,34:0-0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previously the cp2112 driver called INIT_DELAYED_WORK within
cp2112_gpio_irq_startup, resulting in duplicate initilizations of the
workqueue on subsequent IRQ startups following an initial request. This
resulted in a warning in set_work_data in workqueue.c, as well as a rare
NULL dereference within process_one_work in workqueue.c.

Initialize the workqueue within _probe instead.

Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
---

Note -- the warning & NULL dereference that were caused by this were
completely decoupled from the driver code, making this a fairly tricky
bug to track down. I wonder if there would be a way to add a WARN into
__INIT_WORK if an already initialized workqueue is re-initialized
without a lot of overhead...

 drivers/hid/hid-cp2112.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 54c33a24f844..36f76c6dfa20 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1151,8 +1151,6 @@ static unsigned int cp2112_gpio_irq_startup(struct irq_data *d)
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct cp2112_device *dev = gpiochip_get_data(gc);
 
-	INIT_DELAYED_WORK(&dev->gpio_poll_worker, cp2112_gpio_poll_callback);
-
 	if (!dev->gpio_poll) {
 		dev->gpio_poll = true;
 		schedule_delayed_work(&dev->gpio_poll_worker, 0);
@@ -1307,6 +1305,8 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	girq->handler = handle_simple_irq;
 	girq->threaded = true;
 
+	INIT_DELAYED_WORK(&dev->gpio_poll_worker, cp2112_gpio_poll_callback);
+
 	ret = gpiochip_add_data(&dev->gc, dev);
 	if (ret < 0) {
 		hid_err(hdev, "error registering gpio chip\n");
-- 
2.25.1

