Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63AEA224AA5
	for <lists+linux-input@lfdr.de>; Sat, 18 Jul 2020 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgGRKdz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jul 2020 06:33:55 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:37736 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726490AbgGRKdy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jul 2020 06:33:54 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 8FF46BC06F;
        Sat, 18 Jul 2020 10:33:50 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     hadess@hadess.net, jikos@kernel.org, benjamin.tissoires@redhat.com,
        mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        linux-input@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] HID: udraw-ps3: Replace HTTP links with HTTPS ones
Date:   Sat, 18 Jul 2020 12:33:44 +0200
Message-Id: <20200718103344.3407-1-grandmaster@al2klimov.de>
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

 If there are any URLs to be removed completely
 or at least not (just) HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.


 drivers/hid/hid-udraw-ps3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-udraw-ps3.c b/drivers/hid/hid-udraw-ps3.c
index b0fbd11aa0fc..b2e17ef2ea27 100644
--- a/drivers/hid/hid-udraw-ps3.c
+++ b/drivers/hid/hid-udraw-ps3.c
@@ -16,7 +16,7 @@ MODULE_LICENSE("GPL");
 
 /*
  * Protocol information from:
- * http://brandonw.net/udraw/
+ * https://brandonw.net/udraw/
  * and the source code of:
  * https://vvvv.org/contribution/udraw-hid
  */
-- 
2.27.0

