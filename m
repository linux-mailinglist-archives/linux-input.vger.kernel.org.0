Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC203A579A
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 12:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231621AbhFMKYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 06:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45952 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231620AbhFMKYQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 06:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623579735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZiojKX89r9fo1cmK+ap+OGFPSv2GqJVatFKPab3Kdjk=;
        b=RmAZx/58sW2MgKh1yTvzSR/fP3shf5RKAjgNTZE9NoFfUSeFXGOEtAU8GSFz81ehOqwcsM
        pojsm+ytvQnEhT4FK85CbyqseYd8E75kgAiifP4UwnUlT0aL5xQaZ+ySzVh/s7pVydRrxA
        RMrZbSMUOOnKXBe9tn2ptWeQwWySYZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-cRPc9x22P8qbJuejvQOLfw-1; Sun, 13 Jun 2021 06:22:11 -0400
X-MC-Unique: cRPc9x22P8qbJuejvQOLfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BBA5107AD65;
        Sun, 13 Jun 2021 10:22:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-77.ams2.redhat.com [10.36.112.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6887560C0F;
        Sun, 13 Jun 2021 10:22:07 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH 2/3] Input: silead - add a settings module-parameter
Date:   Sun, 13 Jun 2021 12:21:57 +0200
Message-Id: <20210613102158.16886-3-hdegoede@redhat.com>
In-Reply-To: <20210613102158.16886-1-hdegoede@redhat.com>
References: <20210613102158.16886-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
index a6386b715b7b..269a0df16541 100644
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
@@ -96,13 +100,13 @@ static int silead_ts_request_input_dev(struct silead_ts_data *data)
 
 	input_set_abs_params(data->input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
 	input_set_abs_params(data->input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
-	touchscreen_parse_properties(data->input, true, &data->prop, NULL);
+	touchscreen_parse_properties(data->input, true, &data->prop, settings);
 
 	input_mt_init_slots(data->input, data->max_fingers,
 			    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED |
 			    INPUT_MT_TRACK);
 
-	if (device_property_read_bool(dev, "silead,home-button"))
+	if (touchscreen_property_read_bool(dev, "silead,home-button", settings))
 		input_set_capability(data->input, EV_KEY, KEY_LEFTMETA);
 
 	data->input->name = SILEAD_TS_NAME;
@@ -369,8 +373,8 @@ static int silead_ts_setup(struct i2c_client *client)
 	 * this.
 	 */
 
-	if (device_property_read_bool(&client->dev,
-				      "silead,stuck-controller-bug")) {
+	if (touchscreen_property_read_bool(&client->dev, "silead,stuck-controller-bug",
+					   settings)) {
 		pm_runtime_set_active(&client->dev);
 		pm_runtime_enable(&client->dev);
 		pm_runtime_allow(&client->dev);
@@ -437,8 +441,8 @@ static void silead_ts_read_props(struct i2c_client *client)
 	const char *str;
 	int error;
 
-	error = device_property_read_u32(dev, "silead,max-fingers",
-					 &data->max_fingers);
+	error = touchscreen_property_read_u32(dev, "silead,max-fingers", settings,
+					      &data->max_fingers);
 	if (error) {
 		dev_dbg(dev, "Max fingers read error %d\n", error);
 		data->max_fingers = 5; /* Most devices handle up-to 5 fingers */
-- 
2.31.1

