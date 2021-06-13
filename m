Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F9C3A579B
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 12:22:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbhFMKYR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 06:24:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55050 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231612AbhFMKYQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 06:24:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623579734;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=up93ecV2cVAi1qFfLihLHrOVtOyd90LSGEbKHzvhL+k=;
        b=T7EikkJ2c5gRgHkwA6XsyybG2zi+gm08z5hLydH122lANWFDKS+F6r87jbenpmBcT/J0TQ
        +Qe0nui5Iy6ZZ6T+MiKulEeFD63UN8JqTvhv5/Ciah+j7EvncHC8e0weCGjshYfGKWPUNM
        OWEqBIhN4SH2JZrCdvvwNX2OsVDFEtc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-KJm153l1MouMcanUPDK3kA-1; Sun, 13 Jun 2021 06:22:12 -0400
X-MC-Unique: KJm153l1MouMcanUPDK3kA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E39EB801ADF;
        Sun, 13 Jun 2021 10:22:11 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-77.ams2.redhat.com [10.36.112.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D425260C0F;
        Sun, 13 Jun 2021 10:22:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH 3/3] Input: goodix - add a settings module-parameter
Date:   Sun, 13 Jun 2021 12:21:58 +0200
Message-Id: <20210613102158.16886-4-hdegoede@redhat.com>
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

Usuually Goodix touchscreens on x86 devices (where there is no devicetree
to specify the properties) just work. But in some cases the touchscreen is
mounted 90 or 180 degrees rotated vs the display, requiring setting the
touchscreen-x/y-inverted or touchscreen-swapped-x-y properties.

Being able to specify the necessary properties through a module parameter,
allows users of new device-models to help us with bringing up support for
new devices without them needing to do a local kernel-build just to modify
these settings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 2efb82977115..1bc94c5597ca 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -52,6 +52,10 @@
 #define ACPI_GPIO_SUPPORT
 #endif
 
+static char *settings;
+module_param(settings, charp, 0444);
+MODULE_PARM_DESC(settings, "Override touchscreen settings using a ; separated key=value list, e.g. \"touchscreen-fuzz-x=5;touchscreen-fuzz-y=5;touchscreen-swapped-x-y\"");
+
 struct goodix_chip_id {
 	const char *id;
 	const struct goodix_chip_data *data;
@@ -1026,7 +1030,7 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
 	goodix_read_config(ts);
 
 	/* Try overriding touchscreen parameters via device properties */
-	touchscreen_parse_properties(ts->input_dev, true, &ts->prop, NULL);
+	touchscreen_parse_properties(ts->input_dev, true, &ts->prop, settings);
 
 	if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num) {
 		dev_err(&ts->client->dev,
-- 
2.31.1

