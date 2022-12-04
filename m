Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8113E641E4D
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 18:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbiLDR4M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 12:56:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbiLDR4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 12:56:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D20B140CD
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 09:56:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2DE97B80886
        for <linux-input@vger.kernel.org>; Sun,  4 Dec 2022 17:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26CCC433D6;
        Sun,  4 Dec 2022 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670176566;
        bh=YGTA4QSvnnQhQd3OCvTlGUOYTIOmfeCOEY0AkWtOnjE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Dba3sMuw17Mhoe+eNVaR8b/zZAoetci9PYSh2RIP15UMWM7cRL4OIwN3yAQSzJxLp
         wTYSnlqDPXCsIFFYe5/6t116sOIkWSyvSIZBnzZ8EZvAtIiE/RSvWoUreuGWI1OW5l
         xm8E4sN+asfggvTJ0GZgtdr5yvYQ0QTYd9v9yaTLVsuu6mJTg/FQP56GMHwoWKtQWb
         3FykCZQIn9faUzfFZ98JsobwjBeH6/tJ6OWAsgLjWBcW7AvzAqAnX4J0NYQER7ufH0
         XwAjHD4sIpaS4dd2EuVomUnCEJ7pjhgpTUPzKfGtlHUnyCe694pRuadEG+GW0UZx4F
         pG49WWxc4/Aug==
From:   Jonathan Cameron <jic23@kernel.org>
To:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomohiro Yoshidomi <sylph23k@gmail.com>
Subject: [PATCH 01/32] Input: pxspad - switch to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr()
Date:   Sun,  4 Dec 2022 18:08:10 +0000
Message-Id: <20221204180841.2211588-2-jic23@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204180841.2211588-1-jic23@kernel.org>
References: <20221204180841.2211588-1-jic23@kernel.org>
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

SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
against used function warnings.  The new combination of pm_sleep_ptr()
and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
thus suppressing the warning, but still allowing the unused code to be
removed. Thus also drop the __maybe_unused markings.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Tomohiro Yoshidomi <sylph23k@gmail.com>
---
 drivers/input/joystick/psxpad-spi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/psxpad-spi.c b/drivers/input/joystick/psxpad-spi.c
index a32656064f39..2c395af13d42 100644
--- a/drivers/input/joystick/psxpad-spi.c
+++ b/drivers/input/joystick/psxpad-spi.c
@@ -371,7 +371,7 @@ static int psxpad_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int __maybe_unused psxpad_spi_suspend(struct device *dev)
+static int psxpad_spi_suspend(struct device *dev)
 {
 	struct spi_device *spi = to_spi_device(dev);
 	struct psxpad *pad = spi_get_drvdata(spi);
@@ -381,7 +381,7 @@ static int __maybe_unused psxpad_spi_suspend(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(psxpad_spi_pm, psxpad_spi_suspend, NULL);
+static DEFINE_SIMPLE_DEV_PM_OPS(psxpad_spi_pm, psxpad_spi_suspend, NULL);
 
 static const struct spi_device_id psxpad_spi_id[] = {
 	{ "psxpad-spi", 0 },
@@ -392,7 +392,7 @@ MODULE_DEVICE_TABLE(spi, psxpad_spi_id);
 static struct spi_driver psxpad_spi_driver = {
 	.driver = {
 		.name = "psxpad-spi",
-		.pm = &psxpad_spi_pm,
+		.pm = pm_sleep_ptr(&psxpad_spi_pm),
 	},
 	.id_table = psxpad_spi_id,
 	.probe   = psxpad_spi_probe,
-- 
2.38.1

