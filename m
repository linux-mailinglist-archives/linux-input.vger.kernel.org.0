Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2625FCB517
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2019 09:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730520AbfJDHh0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Oct 2019 03:37:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38694 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbfJDHh0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 4 Oct 2019 03:37:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 1E3F13090FDE;
        Fri,  4 Oct 2019 07:37:26 +0000 (UTC)
Received: from dhcp-44-196.space.revspace.nl (ovpn-112-43.ams2.redhat.com [10.36.112.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E91AD60BE1;
        Fri,  4 Oct 2019 07:37:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: [PATCH] HID: logitech: Add depends on LEDS_CLASS to Logitech Kconfig entry
Date:   Fri,  4 Oct 2019 09:37:15 +0200
Message-Id: <20191004073715.6075-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 04 Oct 2019 07:37:26 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
makes the hid-lg15 kernel module, which gets configured through config
HID_LOGITECH depends on symbols from the led class. Add a depends on
LEDS_CLASS to HID_LOGITECH to avoid undefined reference errors on the
led class symbols.

Fixes: 97b741aba918 ("HID: lg-g15: Add keyboard and LCD backlight control")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 1ecb5124421c..494a39e74939 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -525,6 +525,7 @@ config HID_LENOVO
 config HID_LOGITECH
 	tristate "Logitech devices"
 	depends on HID
+	depends on LEDS_CLASS
 	default !EXPERT
 	---help---
 	Support for Logitech devices that are not fully compliant with HID standard.
-- 
2.23.0

