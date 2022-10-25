Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10DA860CBDA
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 14:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiJYM3q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 08:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbiJYM3n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 08:29:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E17311F484
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666700981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0OGoyHtqnmD9ACt9x2y6qnsRK8WGuXI56KZ+SPguV7A=;
        b=BCz1T3F3Kmk6XXbo42I92f58Z45kZPAydKS4GZ4zf3ZvZ1JUHRyvKuIxHXgVWtlkX+N3y1
        z6O/KueYpZm0pmOLeXyRS3AtPzzOKoC4CmjS1OdEG3xVxMbwvioUAknRPAvnnGCuA5aS1x
        PCt8zdwpehbJuEi/tp3I8UNahal6CCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-O9Rv6JDRNr2cozZVblRTWg-1; Tue, 25 Oct 2022 08:29:38 -0400
X-MC-Unique: O9Rv6JDRNr2cozZVblRTWg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAB1C823F65;
        Tue, 25 Oct 2022 12:29:37 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 196BD492CA4;
        Tue, 25 Oct 2022 12:29:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 4/4] Input: goodix - Add a settings module-parameter
Date:   Tue, 25 Oct 2022 14:29:30 +0200
Message-Id: <20221025122930.421377-5-hdegoede@redhat.com>
In-Reply-To: <20221025122930.421377-1-hdegoede@redhat.com>
References: <20221025122930.421377-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a settings module-parameter which can be allowed to specify/override
various device-properties.

Usuually Goodix touchscreens on x86 devices (where there is no devicetree
to specify the properties) just work. But in some cases the touchscreen is
mounted 90 or 180 degrees rotated vs the display, requiring setting the
touchscreen-x/y-inverted or touchscreen-swapped-x-y properties.

Being able to specify the necessary properties through a module parameter,
allows users of new device-models to help us with bringing up support for
new devices without them needing to do a local kernel-build just to modify
these settings.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index c281e49826c2..36873f053f63 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -53,6 +53,10 @@
 #define ACPI_GPIO_SUPPORT
 #endif
 
+static char *settings;
+module_param(settings, charp, 0444);
+MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-fuzz-x=5;touchscreen-fuzz-y=5;touchscreen-swapped-x-y\"");
+
 struct goodix_chip_id {
 	const char *id;
 	const struct goodix_chip_data *data;
@@ -1163,7 +1167,8 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	goodix_read_config(ts);
 
 	/* Try overriding touchscreen parameters via device properties */
-	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
+	touchscreen_parse_properties_with_settings(ts->input_dev, true,
+						   &ts->prop, settings);
 
 	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
 		if (!ts->reset_controller_at_probe &&
-- 
2.37.3

