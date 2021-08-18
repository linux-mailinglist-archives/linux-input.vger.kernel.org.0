Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D2F3F009A
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 11:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbhHRJgK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 05:36:10 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.221]:19675 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhHRJcu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 05:32:50 -0400
X-Greylist: delayed 369 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Aug 2021 05:32:50 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1629278756;
    s=strato-dkim-0002; d=inhub.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KgwfJJW2Vg9oMAPFi5jTrfPc7JwC+CZIStUXfqIF6oQ=;
    b=liQ15IgV9KKazZ2ljKr6FtHaCX8bB+hwZH4vBaQYpPatJSSWIfPxRjXJcfApXZ9/1v
    +mmIquwOc1vObov+AG20UKGnH2mYfXjD6HP38wvRM7lWq7HHOSlZEb98oAjCYco4h//b
    8sr06+jPIwk8sS5yLv5J5JnKoTDDBh9mdcfYSExT3hbP9absWHTDPXcgZ201UV79Cqi8
    dVksl0Ghb3Wy0l8BA7eXK5v0BPJP1UvK7n2jxcgOOZ0GFQdcHyMXXh/JTmajYFvNQVK9
    YP9U72NqSYaMv33w9aEXUPRuAR3AU7JDO33eEJJ1QoKsTCWgmKZICnZzFJFGcV1FT8Nm
    Sw9Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":OGMGfEG7NfU1WQAxQKSndOy9b62IXRUXP1G+n0e9SfNgfKKxghMZpWooHBd6LckRo6Cg2ToZyvlfQhM6"
X-RZG-CLASS-ID: mo00
Received: from crypto.lan.inhub.de
    by smtp.strato.de (RZmta 47.31.0 AUTH)
    with ESMTPSA id k00d02x7I9Puo6T
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 18 Aug 2021 11:25:56 +0200 (CEST)
From:   Tobias Junghans <tobias.junghans@inhub.de>
To:     linux-input@vger.kernel.org, Rishi Gupta <gupt21@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     trivial@kernel.org, Tobias Junghans <tobias.junghans@inhub.de>
Subject: [PATCH] HID: add missing dependencies on HIDRAW
Date:   Wed, 18 Aug 2021 11:25:03 +0200
Message-Id: <20210818092503.16653-1-tobias.junghans@inhub.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hid-led, hid-u2fzero and hid-mcp2221 unconditionally access the hidraw
member of the hid_device structure to obtain the hidraw minor number.
Building without HIDRAW causes a NULL pointer dereference in the
corresponding probe handlers.

Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
---
 drivers/hid/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 160554903ef9..00416b3091e7 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -522,6 +522,7 @@ config HID_LCPOWER
 config HID_LED
 	tristate "Simple RGB LED support"
 	depends on HID
+	depends on HIDRAW
 	depends on LEDS_CLASS
 	help
 	Support for simple RGB LED devices. Currently supported are:
@@ -1093,6 +1094,7 @@ config HID_UDRAW_PS3
 config HID_U2FZERO
 	tristate "U2F Zero LED and RNG support"
 	depends on USB_HID
+	depends on HIDRAW
 	depends on LEDS_CLASS
 	depends on HW_RANDOM
 	help
@@ -1213,6 +1215,7 @@ config HID_ALPS
 config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
+	depends on HIDRAW
 	depends on GPIOLIB
 	help
 	Provides I2C and SMBUS host adapter functionality over USB-HID
-- 
2.25.1

