Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFCA60CBD9
	for <lists+linux-input@lfdr.de>; Tue, 25 Oct 2022 14:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiJYM3p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Oct 2022 08:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiJYM3m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Oct 2022 08:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B911E47D
        for <linux-input@vger.kernel.org>; Tue, 25 Oct 2022 05:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666700981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sLJrbmQYx5qLz4I3isFLP0Xs6urszSZp3lm0OAOGEMM=;
        b=YObccfA1eMN+aUSkU3N3v3zKbmLkiI/PKA+Tz6c503/CyXwlpiK1Pg3F8Kc60in2lXQ3KO
        pRduhlaQ5aE1GkkPTmd6I2ltcWNgx1TzX/JFSyqeeOzhFMezGehM9SGLd5TpOWy8xrF9HI
        M0dDedTybdrjR4FVSOkI4LMfV3vlx60=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-aSIO7qHeMNaz47rHxs0K9g-1; Tue, 25 Oct 2022 08:29:35 -0400
X-MC-Unique: aSIO7qHeMNaz47rHxs0K9g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F07EE3817989;
        Tue, 25 Oct 2022 12:29:33 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F001B4A9255;
        Tue, 25 Oct 2022 12:29:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 1/4] Input: goodix - Try resetting the controller when no config is set
Date:   Tue, 25 Oct 2022 14:29:27 +0200
Message-Id: <20221025122930.421377-2-hdegoede@redhat.com>
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

On ACPI systems (irq_pin_access_method == IRQ_PIN_ACCESS_ACPI_*) the driver
does not reset the controller at probe time, because sometimes the system
firmware loads a config and resetting might loose this config.

On the Nanote UMPC-01 device OTOH the config is in flash of the controller,
the controller needs a reset to load this; and the system firmware does not
reset the controller on a cold boot.

To fix the Nanote UMPC-01 touchscreen not working on a cold boot, try
resetting the controller and then re-reading the config when encountering
a config with 0 width/height/max_touch_num value and the controller has
not already been reset by goodix_ts_probe().

This should be safe to do in general because normally we should never
encounter a config with 0 width/height/max_touch_num. Doing this in
general not only avoids the need for a DMI quirk, but also might help
other systems.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index a33cc7950cf5..c281e49826c2 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1158,6 +1158,7 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	input_set_abs_params(ts->input_dev, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
 	input_set_abs_params(ts->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
+retry_read_config:
 	/* Read configuration and apply touchscreen parameters */
 	goodix_read_config(ts);
 
@@ -1165,6 +1166,16 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	touchscreen_parse_properties(ts->input_dev, true, &ts->prop);
 
 	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
+		if (!ts->reset_controller_at_probe &&
+		    ts->irq_pin_access_method != IRQ_PIN_ACCESS_NONE) {
+			dev_info(&ts->client->dev, "Config not set, resetting controller\n");
+			/* Retry after a controller reset */
+			ts->reset_controller_at_probe = true;
+			error = goodix_reset(ts);
+			if (error)
+				return error;
+			goto retry_read_config;
+		}
 		dev_err(&ts->client->dev,
 			"Invalid config (%d, %d, %d), using defaults\n",
 			ts->prop.max_x, ts->prop.max_y, ts->max_touch_num);
-- 
2.37.3

