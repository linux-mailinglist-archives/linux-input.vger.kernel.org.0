Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A0366E0A5C
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 11:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjDMJhW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 05:37:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjDMJhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 05:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC7894EF2
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681378593;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZqvPZJAfawDAQ9NHo9T3b1Jmr1jDjUSR0TnjxNywKX0=;
        b=BGZb7/BSULk5PnEsdUpeeo/i51pCVGJTeJ+GdDbwgRrRUEIcz30j8+9wjKYVA6ndC06rcZ
        sAdrJQxSTy8U6AO/ifYKJ1AJXc0airYDfW4n/3ijgQAVnTSAOm57I25jviknNr7UPkDYSa
        po/KGceKGsfFeZV9VdPk7MoyJw6z5vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-5UvQoKvWOYKTNMttNPfCEg-1; Thu, 13 Apr 2023 05:36:29 -0400
X-MC-Unique: 5UvQoKvWOYKTNMttNPfCEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 504FD101A54F;
        Thu, 13 Apr 2023 09:36:29 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6DC69C1602A;
        Thu, 13 Apr 2023 09:36:28 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 2/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
Date:   Thu, 13 Apr 2023 11:36:24 +0200
Message-Id: <20230413093625.71146-3-hdegoede@redhat.com>
In-Reply-To: <20230413093625.71146-1-hdegoede@redhat.com>
References: <20230413093625.71146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are some x86 tablets / 2-in-1s which ship with Android as their
factory OS image. These have pretty broken ACPI tables, relying on
everything being hardcoded in the factory kernel image.

platform/x86/x86-android-tablets.c manually instantiates i2c-clients for
i2c devices on these tablets to make them work with the mainline kernel.

The Lenovo Yoga Book 1 (yb1-x90f/l) is such a 2-in-1. It has 2 I2C-HID
devices its main touchscreen and a Wacom digitizer. Its main touchscreen
can alternatively also be used in HiDeep's native protocol mode but
for the Wacom digitizer we really need I2C-HID.

This patch allows using i2c-hid-of on non OF platforms so that it can
bind to a non ACPI instantiated i2c_client on x86 for the Wacom digitizer.
Note the driver already has an "i2c-over-hid" i2c_device_id (rather then
an of_device_id).

Besides enabling building on non-OF platforms this also replaces
the only of_property_read_u32() call with device_property_read_u32() note
that other properties where already read using device_property_read_...().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/Kconfig      | 6 ++++--
 drivers/hid/i2c-hid/i2c-hid-of.c | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
index 4439be7fa74d..3be17109301a 100644
--- a/drivers/hid/i2c-hid/Kconfig
+++ b/drivers/hid/i2c-hid/Kconfig
@@ -23,12 +23,14 @@ config I2C_HID_ACPI
 
 config I2C_HID_OF
 	tristate "HID over I2C transport layer Open Firmware driver"
-	depends on OF
+	# No "depends on OF" because this can also be used for manually
+	# (board-file) instantiated "hid-over-i2c" type i2c-clients.
 	select I2C_HID_CORE
 	help
 	  Say Y here if you use a keyboard, a touchpad, a touchscreen, or any
 	  other HID based devices which is connected to your computer via I2C.
-	  This driver supports Open Firmware (Device Tree)-based systems.
+	  This driver supports Open Firmware (Device Tree)-based systems as
+	  well as binding to manually (board-file) instantiated i2c-hid-clients.
 
 	  If unsure, say N.
 
diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index c82a5a54c3e6..385f7460e03c 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -82,7 +82,7 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 	ihid_of->ops.power_up = i2c_hid_of_power_up;
 	ihid_of->ops.power_down = i2c_hid_of_power_down;
 
-	ret = of_property_read_u32(dev->of_node, "hid-descr-addr", &val);
+	ret = device_property_read_u32(dev, "hid-descr-addr", &val);
 	if (ret) {
 		dev_err(dev, "HID register address not provided\n");
 		return -ENODEV;
@@ -113,11 +113,13 @@ static int i2c_hid_of_probe(struct i2c_client *client)
 				  hid_descriptor_address, quirks);
 }
 
+#ifdef CONFIG_OF
 static const struct of_device_id i2c_hid_of_match[] = {
 	{ .compatible = "hid-over-i2c" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, i2c_hid_of_match);
+#endif
 
 static const struct i2c_device_id i2c_hid_of_id_table[] = {
 	{ "hid", 0 },
-- 
2.39.1

