Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2BB3C81D0
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 11:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238723AbhGNJl2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 05:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbhGNJl2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 05:41:28 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0EC7C061760
        for <linux-input@vger.kernel.org>; Wed, 14 Jul 2021 02:38:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by michel.telenet-ops.be with bizsmtp
        id Uxeb250091ccfby06xeb5y; Wed, 14 Jul 2021 11:38:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3bLe-0015XX-Sy; Wed, 14 Jul 2021 11:38:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3bLe-00A3Ik-Bm; Wed, 14 Jul 2021 11:38:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH resend] Input: adc-keys - drop bogus __refdata annotation
Date:   Wed, 14 Jul 2021 11:38:33 +0200
Message-Id: <7091e8213602be64826fd689a7337246d218f3b1.1626255421.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As the ADC ladder input driver does not have any code or data located in
initmem, there is no need to annotate the adc_keys_driver structure with
__refdata.  Drop the annotation, to avoid suppressing future section
warnings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/input/keyboard/adc-keys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
index 6d5be48d1b3d7988..bf72ab8df817756f 100644
--- a/drivers/input/keyboard/adc-keys.c
+++ b/drivers/input/keyboard/adc-keys.c
@@ -193,7 +193,7 @@ static const struct of_device_id adc_keys_of_match[] = {
 MODULE_DEVICE_TABLE(of, adc_keys_of_match);
 #endif
 
-static struct platform_driver __refdata adc_keys_driver = {
+static struct platform_driver adc_keys_driver = {
 	.driver = {
 		.name = "adc_keys",
 		.of_match_table = of_match_ptr(adc_keys_of_match),
-- 
2.25.1

