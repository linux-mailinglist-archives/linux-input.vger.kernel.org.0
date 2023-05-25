Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97200711826
	for <lists+linux-input@lfdr.de>; Thu, 25 May 2023 22:32:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234025AbjEYUcb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 May 2023 16:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241529AbjEYUca (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 May 2023 16:32:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A185F1A2
        for <linux-input@vger.kernel.org>; Thu, 25 May 2023 13:32:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Hd6-0005OP-Jf; Thu, 25 May 2023 22:32:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Hd4-002nkN-Hq; Thu, 25 May 2023 22:32:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Hd3-007xVo-NE; Thu, 25 May 2023 22:32:09 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Raul E Rangel <rrangel@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>,
        Douglas Anderson <dianders@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] HID: i2c-hid: Switch i2c drivers back to use .probe()
Date:   Thu, 25 May 2023 22:32:02 +0200
Message-Id: <20230525203202.646669-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2826; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qEKtC/X4VkQWb4H4CAs4iSH3zEFury80JPKVS7INJv8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb8W/fxjOsxaNK1EesoiEkrmKzu5oWr2UGcPiE p3NUrupIIKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/FvwAKCRCPgPtYfRL+ TlOHB/sEptT9cU4ZNZ/76BKd9RxujoRa9oeQ0Lqn13U6/ginvEG0U/w4xlAKlRHYd1ZrqX1O2A8 se0eIUUwpCONuRdDwzY2Z0EFsqwFCMKsB5gDgcI3K9pIgwHTQIDD1+m1CF3tQ3eQS7jzV0gN6Rp tj5jPGT3v2vVjOcywg9loPX42oNr2Itg6tjDZFNHEuWhdy8ZvhEh+Z8ZqCmxyenFgPgtvxI0udi O5+hbtkQfv1ukWdWJFa/BMDASe2b91ZsGU2ptFHHrnwai1tvLz1ZGmB7trKPD11u08sQzzJZy1O Sq9XwfPbAOg1Nw/1n4HslhC4B7Ylq3blIQg1Y+N6Q+aj0prF
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hid/i2c-hid/i2c-hid-acpi.c      | 2 +-
 drivers/hid/i2c-hid/i2c-hid-of-elan.c   | 2 +-
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 2 +-
 drivers/hid/i2c-hid/i2c-hid-of.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 3a7e2bcb5412..ac918a9ea8d3 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -118,7 +118,7 @@ static struct i2c_driver i2c_hid_acpi_driver = {
 		.acpi_match_table = i2c_hid_acpi_match,
 	},
 
-	.probe_new	= i2c_hid_acpi_probe,
+	.probe		= i2c_hid_acpi_probe,
 	.remove		= i2c_hid_core_remove,
 	.shutdown	= i2c_hid_core_shutdown,
 };
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-elan.c b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
index 76ddc8be1cbb..029045d9661c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-elan.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-elan.c
@@ -118,7 +118,7 @@ static struct i2c_driver elan_i2c_hid_ts_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(elan_i2c_hid_of_match),
 	},
-	.probe_new	= i2c_hid_of_elan_probe,
+	.probe		= i2c_hid_of_elan_probe,
 	.remove		= i2c_hid_core_remove,
 	.shutdown	= i2c_hid_core_shutdown,
 };
diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
index 0060e3dcd775..06edb90ab7c0 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
@@ -114,7 +114,7 @@ static struct i2c_driver goodix_i2c_hid_ts_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = of_match_ptr(goodix_i2c_hid_of_match),
 	},
-	.probe_new	= i2c_hid_of_goodix_probe,
+	.probe		= i2c_hid_of_goodix_probe,
 	.remove		= i2c_hid_core_remove,
 	.shutdown	= i2c_hid_core_shutdown,
 };
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 855f53092f4e..c4e1fa0273c8 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -157,7 +157,7 @@ static struct i2c_driver i2c_hid_of_driver = {
 		.of_match_table = of_match_ptr(i2c_hid_of_match),
 	},
 
-	.probe_new	= i2c_hid_of_probe,
+	.probe		= i2c_hid_of_probe,
 	.remove		= i2c_hid_core_remove,
 	.shutdown	= i2c_hid_core_shutdown,
 	.id_table	= i2c_hid_of_id_table,

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

