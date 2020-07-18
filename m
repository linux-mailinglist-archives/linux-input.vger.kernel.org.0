Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0D8224B04
	for <lists+linux-input@lfdr.de>; Sat, 18 Jul 2020 13:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgGRLr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jul 2020 07:47:59 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:53816 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726493AbgGRLr7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jul 2020 07:47:59 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 31814BC053;
        Sat, 18 Jul 2020 11:47:56 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] HID: Replace HTTP links with HTTPS ones
Date:   Sat, 18 Jul 2020 13:47:49 +0200
Message-Id: <20200718114749.19561-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 drivers/hid/Kconfig      | 2 +-
 drivers/hid/hid-cp2112.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 45e87dc59d4e..05315b434276 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -20,7 +20,7 @@ config HID
 	  removed from the HID bus by the transport-layer drivers, such as
 	  usbhid (USB_HID) and hidp (BT_HIDP).
 
-	  For docs and specs, see http://www.usb.org/developers/hidpage/
+	  For docs and specs, see https://www.usb.org/developers/hidpage/
 
 	  If unsure, say Y.
 
diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index db1b55df0d13..f64517bc33e2 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -11,7 +11,7 @@
  * host communicates with the CP2112 via raw HID reports.
  *
  * Data Sheet:
- *   http://www.silabs.com/Support%20Documents/TechnicalDocs/CP2112.pdf
+ *   https://www.silabs.com/Support%20Documents/TechnicalDocs/CP2112.pdf
  * Programming Interface Specification:
  *   https://www.silabs.com/documents/public/application-notes/an495-cp2112-interface-specification.pdf
  */
-- 
2.27.0

