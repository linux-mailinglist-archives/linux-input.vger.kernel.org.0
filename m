Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED47467324
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 09:12:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350577AbhLCIQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Dec 2021 03:16:02 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:41266 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238936AbhLCIQB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Dec 2021 03:16:01 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C141B82025
        for <linux-input@vger.kernel.org>; Fri,  3 Dec 2021 08:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F6FC53FD2;
        Fri,  3 Dec 2021 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638519155;
        bh=8msubwmGazu8NiWYKjZQvrk0Gt/paic3VZlvvSXTBVU=;
        h=From:To:Cc:Subject:Date:From;
        b=TUqHzBuwduqkLeyoM8HfZfmRI4IwYmC6uZFz4PAOVI5+lQAR4RB0z84rx+F6FOgsQ
         DgcvVF4zqBxm2vWcfXV7KLzi4DLZlRPB3diygfyDWdVL9ZKifLKcVUIdolP5tBmzXw
         WPUF+qLxZkZI6EorfwLw1f9+5AOYl5ko5ZXI9aBo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: add USB_HID dependancy to hid-prodikeys
Date:   Fri,  3 Dec 2021 09:12:31 +0100
Message-Id: <20211203081231.2856936-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; h=from:subject; bh=8msubwmGazu8NiWYKjZQvrk0Gt/paic3VZlvvSXTBVU=; b=owGbwMvMwCRo6H6F97bub03G02pJDIkrL2Y139G1ur48crdWgj7HtOZNbVMKIgPDMpZ1xLc8bSiU 27y9I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZi1saw4NR+xquuJ3iYN19f9+HO27 oJnw6/bWZYcOjKgReiM5c+PdN4vctB6er7BYk3LAE=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The prodikeys HID driver only controls USB devices, yet did not have a
dependancy on USB_HID.  This causes build errors on some configurations
like nios2 when building due to new changes to the prodikeys driver.

Reported-by: kernel test robot <lkp@intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index e9bc8efed5a1..a7c78ac96270 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -245,7 +245,7 @@ config HID_MACALLY
 
 config HID_PRODIKEYS
 	tristate "Prodikeys PC-MIDI Keyboard support"
-	depends on HID && SND
+	depends on USB_HID && SND
 	select SND_RAWMIDI
 	help
 	Support for Prodikeys PC-MIDI Keyboard device support.
-- 
2.34.1

