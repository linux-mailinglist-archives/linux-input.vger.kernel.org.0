Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5006367B063
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 11:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232999AbjAYKzF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 05:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbjAYKzE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 05:55:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15B3271A
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 02:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TKij3fyxoq/8VKQCHkV4iCLox0kN040mdy7eiQPNDYA=;
        b=Baf7jXK7s/zpTEwAoK3GUDMiP55W5qyhG4h8GP5kPMTC7CMmvhZpSvyxj7igEKqlmxei8h
        PNZPoHP1mXmR8qO8m4tu3rYPd1z6HXy9QXYcLtHMZpRTH5cmBxwHbp08tSKAlhicg0urfr
        6h3dwwDYSE6ilkKVo7zcPJZAAS+TLGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-0qDC1HfDPK6yUlFBcX2mhg-1; Wed, 25 Jan 2023 05:54:22 -0500
X-MC-Unique: 0qDC1HfDPK6yUlFBcX2mhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A31A185C6E3;
        Wed, 25 Jan 2023 10:54:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C4AB540C1141;
        Wed, 25 Jan 2023 10:54:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 3/3] Input: goodix - Add a settings module-parameter
Date:   Wed, 25 Jan 2023 11:54:16 +0100
Message-Id: <20230125105416.17406-4-hdegoede@redhat.com>
In-Reply-To: <20230125105416.17406-1-hdegoede@redhat.com>
References: <20230125105416.17406-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 620f5ec0962f..a105dee04156 100644
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
@@ -1197,7 +1201,8 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	goodix_read_config(ts);
 
 	/* Try overriding touchscreen parameters via device properties */
-	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
+	touchscreen_parse_properties_with_settings(ts->input_dev, true,
+						   &ts->prop, settings);
 
 	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
 		if (!ts->reset_controller_at_probe &&
-- 
2.39.0

