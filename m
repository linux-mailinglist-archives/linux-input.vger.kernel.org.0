Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BB8287352
	for <lists+linux-input@lfdr.de>; Thu,  8 Oct 2020 13:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726517AbgJHL0g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Oct 2020 07:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58773 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726065AbgJHL0g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Oct 2020 07:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602156394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4tIWuRI0CI9BjMSRluT5gYGTUqtjzTGhEGG4awnur2Q=;
        b=W90r+KaRZuPyxmX1itn+mcxJxDHEcT2vyMHwEIUUE8OT2kXZllY5sUaWIsX4TicVCpE1pQ
        2IfDsvGcSy7NdUdbzSb+b9XMddMYBDTLSPOhrFesZdXYV7qzCDmUcWFmylgX9/L7vZ2TdS
        VXV9ewDw/4zOrsv3AbyCkC7tOPo3PMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-doVACijGMgebMbPYhYI6cQ-1; Thu, 08 Oct 2020 07:26:33 -0400
X-MC-Unique: doVACijGMgebMbPYhYI6cQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FEA287950C;
        Thu,  8 Oct 2020 11:26:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-134.ams2.redhat.com [10.36.112.134])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 75F2C5C1C4;
        Thu,  8 Oct 2020 11:26:30 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Marius Iacob <themariusus@gmail.com>
Subject: [PATCH resend] Input: i8042 - Allow insmod to succeed on devices without an i8042 controller
Date:   Thu,  8 Oct 2020 13:26:28 +0200
Message-Id: <20201008112628.3979-2-hdegoede@redhat.com>
In-Reply-To: <20201008112628.3979-1-hdegoede@redhat.com>
References: <20201008112628.3979-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The i8042 module exports several symbols which may be used by other
modules.

Before this commit it would refuse to load (when built as a module itself)
on systems without an i8042 controller.

This is a problem specifically for the asus-nb-wmi module. Many Asus
laptops support the Asus WMI interface. Some of them have an i8042
controller and need to use i8042_install_filter() to filter some kbd
events. Other models do not have an i8042 controller (e.g. they use an
USB attached kbd).

Before this commit the asus-nb-wmi driver could not be loaded on Asus
models without an i8042 controller, when the i8042 code was built as
a module (as Arch Linux does) because the module_init function of the
i8042 module would fail with -ENODEV and thus the i8042_install_filter
symbol could not be loaded.

This commit fixes this by exiting from module_init with a return code
of 0 if no controller is found.  It also adds a i8042_present bool to
make the module_exit function a no-op in this case and also adds a
check for i8042_present to the exported i8042_command function.

The latter i8042_present check should not really be necessary because
when builtin that function can already be used on systems without
an i8042 controller, but better safe then sorry.

Reported-and-tested-by: Marius Iacob <themariusus@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/serio/i8042.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index d3eda48032e3..944cbb519c6d 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -122,6 +122,7 @@ module_param_named(unmask_kbd_data, i8042_unmask_kbd_data, bool, 0600);
 MODULE_PARM_DESC(unmask_kbd_data, "Unconditional enable (may reveal sensitive data) of normally sanitize-filtered kbd data traffic debug log [pre-condition: i8042.debug=1 enabled]");
 #endif
 
+static bool i8042_present;
 static bool i8042_bypass_aux_irq_test;
 static char i8042_kbd_firmware_id[128];
 static char i8042_aux_firmware_id[128];
@@ -343,6 +344,9 @@ int i8042_command(unsigned char *param, int command)
 	unsigned long flags;
 	int retval;
 
+	if (!i8042_present)
+		return -1;
+
 	spin_lock_irqsave(&i8042_lock, flags);
 	retval = __i8042_command(param, command);
 	spin_unlock_irqrestore(&i8042_lock, flags);
@@ -1612,12 +1616,15 @@ static int __init i8042_init(void)
 
 	err = i8042_platform_init();
 	if (err)
-		return err;
+		return (err == -ENODEV) ? 0 : err;
 
 	err = i8042_controller_check();
 	if (err)
 		goto err_platform_exit;
 
+	/* Set this before creating the dev to allow i8042_command to work right away */
+	i8042_present = true;
+
 	pdev = platform_create_bundle(&i8042_driver, i8042_probe, NULL, 0, NULL, 0);
 	if (IS_ERR(pdev)) {
 		err = PTR_ERR(pdev);
@@ -1636,6 +1643,9 @@ static int __init i8042_init(void)
 
 static void __exit i8042_exit(void)
 {
+	if (!i8042_present)
+		return;
+
 	platform_device_unregister(i8042_platform_device);
 	platform_driver_unregister(&i8042_driver);
 	i8042_platform_exit();
-- 
2.28.0

