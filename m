Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5148B5506C2
	for <lists+linux-input@lfdr.de>; Sat, 18 Jun 2022 23:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbiFRVCm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jun 2022 17:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbiFRVCl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jun 2022 17:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 05B55316
        for <linux-input@vger.kernel.org>; Sat, 18 Jun 2022 14:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655586158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=EM9ns7WXlx/hpsbDurcNj5cHvvzI0wCTk93mA6+8cXs=;
        b=eJp7NRa7YIYTs+TTFZ128FMNVXxXTzoFQCVihBFD3GNeGkbC1MpFmOSOWPUvXGJxDXClhN
        iOrW7oyldBdIgu5nLssxUaQzaBAx3dmpByMGROZ7YPpQqw5wlI9w4OD0RS4P89ttsjyAU8
        s18ezK/B1txZ035TjoBG+Oxg8rFBxv4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-wofMOYk5MtO_X48BWTnmKg-1; Sat, 18 Jun 2022 17:02:35 -0400
X-MC-Unique: wofMOYk5MtO_X48BWTnmKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A79585A581;
        Sat, 18 Jun 2022 21:02:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3364F2026987;
        Sat, 18 Jun 2022 21:02:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: [PATCH] Input: goodix - call acpi_device_fix_up_power() in some cases
Date:   Sat, 18 Jun 2022 23:02:33 +0200
Message-Id: <20220618210233.208027-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On ACPI boards, when we cannot get the GPIOs to do a reset ourselves
if necessary, call acpi_device_fix_up_power() to force the ACPI _PS0
method to run.

On some devices without proper GPIO descriptions this will reset
the touchscreen for us and this may be necessary for us to be able
to communicate to the touchscreen at all.

Specifically on an Aya Neo Next this change will cause the _PS0()
ACPI function to call INIT() which does:

            Method (INIT, 0, Serialized)
            {
                TP_I = 0x00A50000
                TP_R = 0x00A50000
                Sleep (0x0A)
                TP_I = 0x00E50000
                Sleep (One)
                TP_R = 0x00E50000
                Sleep (0x06)
                TP_I = 0x00A50000
                Sleep (0x3C)
                TP_I = 0x00041800
            }

On older kernels the ACPI core assumed a power-on was necessary by itself
and would run _PS0 before our probe function runs, which can be seen from
the GPIO pin ctrl registers in /sys/kernel/debug/gpio which match
the above hex values with older kernels.

With newer kernels before this change the GPIO pin ctrl registers do not
match, indicating INIT() has not run and probing the touchscreen fails.

This change makes Linux run _PS0() again fixing the touchscreen not working
on the Aya Neo Next.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=209061
Reported-and-tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index af2ddee76f58..293bb064e8aa 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -904,6 +904,11 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 	} else {
 		dev_warn(dev, "Unexpected ACPI resources: gpio_count %d, gpio_int_idx %d\n",
 			 ts->gpio_count, ts->gpio_int_idx);
+		/*
+		 * On some devices _PS0 does a reset for us and
+		 * sometimes this is necessary for things to work.
+		 */
+		acpi_device_fix_up_power(ACPI_COMPANION(dev));
 		return -EINVAL;
 	}
 
-- 
2.36.0

