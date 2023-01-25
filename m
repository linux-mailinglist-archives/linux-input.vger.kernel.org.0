Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D68C67B064
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 11:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbjAYKzM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 05:55:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbjAYKzL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 05:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B266869F
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674644062;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h8hjiUdmWKbRjstnVkO3nGCIkLWjJfvzNFCbTa5J148=;
        b=GDhbdwEupRgdt0zfqWy5SSCcgRqKFK1yoN5gAauMnmpavgAxrgsquvber97jbyzKwh1X+/
        3nXkxdaG9L0NxljYHWGrJA+b9N92zKK6bb9lkDCe3Ijd6gEHP12aa9jxzTHeKxxTCaFAJ6
        s86wP2NIGPqHXQWl6L5vwgI0fCDqyLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-lNMKYDx7O8qlceNn4kIM4w-1; Wed, 25 Jan 2023 05:54:21 -0500
X-MC-Unique: lNMKYDx7O8qlceNn4kIM4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CEA3811E9C;
        Wed, 25 Jan 2023 10:54:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.104])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ABE2C40C945A;
        Wed, 25 Jan 2023 10:54:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 2/3] Input: silead - Add a settings module-parameter
Date:   Wed, 25 Jan 2023 11:54:15 +0100
Message-Id: <20230125105416.17406-3-hdegoede@redhat.com>
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

Unlike most other touchscreen controllers Silead touchscreens don't tell us
the ranges of the reported x and y coordinates and Silead touchscreens also
often need to have their axis inverted and/or swapped to match the display
coordinates.

Being able to specify the necessary properties through a module parameter,
allows users of new device-models to help us with bringing up support for
new devices without them needing to do a local kernel-build just to modify
these settings.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index 8a7351c4414c..22cee8d1bb22 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -58,6 +58,10 @@
 
 #define SILEAD_MAX_FINGERS	10
 
+static char *settings;
+module_param(settings, charp, 0444);
+MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-x-y\"");
+
 enum silead_ts_power {
 	SILEAD_POWER_ON  = 1,
 	SILEAD_POWER_OFF = 0
@@ -133,14 +137,15 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 
 	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
-	touchscreen_parse_properties(data->input, true, &data->prop);
+	touchscreen_parse_properties_with_settings(data->input, true,
+						   &data->prop, settings);
 	silead_apply_efi_fw_min_max(data);
 
 	input_mt_init_slots(data->input, data->max_fingers,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
 			    INPUT_MT_TRACK);
 
-	if (device_property_read_bool(dev, "silead,home-button"))
+	if (touchscreen_property_read_bool(dev, "silead,home-button", settings))
 		input_set_capability(data->input, EV_KEY, KEY_LEFTMETA);
 
 	data->input->name = SILEAD_TS_NAME;
@@ -173,7 +178,8 @@ static int silead_ts_request_pen_input_dev(struct silead_ts_data *data)
 	input_set_capability(data->pen_input, EV_KEY, BTN_TOUCH);
 	input_set_capability(data->pen_input, EV_KEY, BTN_TOOL_PEN);
 	set_bit(INPUT_PROP_DIRECT, data->pen_input->propbit);
-	touchscreen_parse_properties(data->pen_input, false, &data->prop);
+	touchscreen_parse_properties_with_settings(data->pen_input, false,
+						   &data->prop, settings);
 	input_abs_set_res(data->pen_input, ABS_X, data->pen_x_res);
 	input_abs_set_res(data->pen_input, ABS_Y, data->pen_y_res);
 
@@ -523,8 +529,8 @@ static int silead_ts_setup(struct i2c_client *client)
 	 * this.
 	 */
 
-	if (device_property_read_bool(&client->dev,
-				      "silead,stuck-controller-bug")) {
+	if (touchscreen_property_read_bool(&client->dev, "silead,stuck-controller-bug",
+					   settings)) {
 		pm_runtime_set_active(&client->dev);
 		pm_runtime_enable(&client->dev);
 		pm_runtime_allow(&client->dev);
@@ -591,8 +597,8 @@ static void silead_ts_read_props(struct i2c_client *client)
 	const char *str;
 	int error;
 
-	error = device_property_read_u32(dev, "silead,max-fingers",
-					 &data->max_fingers);
+	error = touchscreen_property_read_u32(dev, "silead,max-fingers", settings,
+					      &data->max_fingers);
 	if (error) {
 		dev_dbg(dev, "Max fingers read error %d\n", error);
 		data->max_fingers = 5; /* Most devices handle up-to 5 fingers */
@@ -605,9 +611,9 @@ static void silead_ts_read_props(struct i2c_client *client)
 	else
 		dev_dbg(dev, "Firmware file name read error. Using default.");
 
-	data->pen_supported = device_property_read_bool(dev, "silead,pen-supported");
-	device_property_read_u32(dev, "silead,pen-resolution-x", &data->pen_x_res);
-	device_property_read_u32(dev, "silead,pen-resolution-y", &data->pen_y_res);
+	data->pen_supported = touchscreen_property_read_bool(dev, "silead,pen-supported", settings);
+	touchscreen_property_read_u32(dev, "silead,pen-resolution-x", settings, &data->pen_x_res);
+	touchscreen_property_read_u32(dev, "silead,pen-resolution-y", settings, &data->pen_y_res);
 }
 
 #ifdef CONFIG_ACPI
-- 
2.39.0

