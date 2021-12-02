Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B664662B0
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 12:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346555AbhLBLvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 06:51:49 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:50020 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346444AbhLBLvt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Dec 2021 06:51:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C7A9ACE2232
        for <linux-input@vger.kernel.org>; Thu,  2 Dec 2021 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C6FC00446;
        Thu,  2 Dec 2021 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638445704;
        bh=rlslT/OxsBxAdB/7rJzFYpCY+8upF3qYEhsVPDyP/3w=;
        h=From:To:Cc:Subject:Date:From;
        b=OiT0Qmh6cntPzrIDvcEGzkFfJc32Usn1p6j7hmCkU/RHhu5cfc6InUS5L4+/jjxl7
         rBDl66KEwgtcI7ZBlhr36hzBQGANJl+SFhrJN+9tQBhqUs0iEe6CT1OCWqZxAXKe0z
         UQIfQlCfb5WaBqRKRWBVzVubibN/fE0SMkls1WN0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: add USB_HID dependancy on some USB HID drivers
Date:   Thu,  2 Dec 2021 12:48:19 +0100
Message-Id: <20211202114819.2511954-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336; h=from:subject; bh=rlslT/OxsBxAdB/7rJzFYpCY+8upF3qYEhsVPDyP/3w=; b=owGbwMvMwCRo6H6F97bub03G02pJDIkrNjU2vniXGNvLkuwT6P5oe+5qH6uHd0/LHxYt5DHt8fXo 5DvcEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABP5osswP2mnaYp0qs4C0eW39zid4s m2rb1RzLBg1bITidk7Ff3mJlVtMXTYbqTwefEyAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some HID drivers are only for USB drivers, yet did not depend on
CONFIG_USB_HID.  This was hidden by the fact that the USB functions were
stubbed out in the past, but now that drivers are checking for USB
devices properly, build errors can occur with some random
configurations.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hid/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 9f5435b55949..828c2995ec34 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -214,7 +214,7 @@ config HID_CHICONY
 
 config HID_CORSAIR
 	tristate "Corsair devices"
-	depends on HID && USB && LEDS_CLASS
+	depends on USB_HID && LEDS_CLASS
 	help
 	Support for Corsair devices that are not fully compliant with the
 	HID standard.
@@ -560,7 +560,7 @@ config HID_LENOVO
 
 config HID_LOGITECH
 	tristate "Logitech devices"
-	depends on HID
+	depends on USB_HID
 	depends on LEDS_CLASS
 	default !EXPERT
 	help
@@ -951,7 +951,7 @@ config HID_SAITEK
 
 config HID_SAMSUNG
 	tristate "Samsung InfraRed remote control or keyboards"
-	depends on HID
+	depends on USB_HID
 	help
 	Support for Samsung InfraRed remote control or keyboards.
 
-- 
2.34.1

