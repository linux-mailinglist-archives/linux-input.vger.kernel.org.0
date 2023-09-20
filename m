Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF7C7A8247
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 14:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjITM7C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 08:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236090AbjITM6y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 08:58:54 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683D4197
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 05:58:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-0005GJ-QY; Wed, 20 Sep 2023 14:58:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-007gzb-Dk; Wed, 20 Sep 2023 14:58:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiwmu-003IDi-4k; Wed, 20 Sep 2023 14:58:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 20/52] input: pcap_keys - Convert to platform remove callback returning void
Date:   Wed, 20 Sep 2023 14:57:57 +0200
Message-Id: <20230920125829.1478827-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NsnvjeEM0GTNhGElgcW9S6qu8vAW08o7AX/RLHShzfA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhlSuN14rd6k0n0sJCr302l9sgRArs19Lw+HghmWi/Z8vJ KU7MWt0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARoXPsv1nOKr/PLTQS0yzd +/q2tnqA/O+aADf3DGtfMTPRaf/PZ3PITO+edeZki/DEMyznjGs6WXsvOC+Zd5/13KVNX1mmPT1 tsnaff0zcytarKm/qlzu1vf7+WHvel4YzzbxhX3QEHrbs4m5qjjhkkH0tTzvcp/VrsG8Jc83xzz 15W3J7Lm7V+s129WH7mqtRjOJPo1g36n5vlPZyV/6p6rvsnn7BmfJjlb3xNi3NGsWrLtgqXjmht P2psY7RVe2vGUesAgUan1xVcLgfE3eBiyf5hMHi340HTSRVTvN3BXIeOf+55NuNE55TOaQM5130 e3OvMjenfeeFXQ98I57P6Ir9drGvLXmFXvmRT5JLlctVAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/misc/pcap_keys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/pcap_keys.c b/drivers/input/misc/pcap_keys.c
index b5a53636d7e2..8a7e9ada5952 100644
--- a/drivers/input/misc/pcap_keys.c
+++ b/drivers/input/misc/pcap_keys.c
@@ -99,7 +99,7 @@ static int pcap_keys_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int pcap_keys_remove(struct platform_device *pdev)
+static void pcap_keys_remove(struct platform_device *pdev)
 {
 	struct pcap_keys *pcap_keys = platform_get_drvdata(pdev);
 
@@ -108,13 +108,11 @@ static int pcap_keys_remove(struct platform_device *pdev)
 
 	input_unregister_device(pcap_keys->input);
 	kfree(pcap_keys);
-
-	return 0;
 }
 
 static struct platform_driver pcap_keys_device_driver = {
 	.probe		= pcap_keys_probe,
-	.remove		= pcap_keys_remove,
+	.remove_new	= pcap_keys_remove,
 	.driver		= {
 		.name	= "pcap-keys",
 	}
-- 
2.40.1

