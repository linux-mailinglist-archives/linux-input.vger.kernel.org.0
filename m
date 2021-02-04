Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF1E30F9A7
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 18:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237893AbhBDR2k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 12:28:40 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:58248 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238556AbhBDR2d (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Feb 2021 12:28:33 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l7iQ1-00032K-10; Thu, 04 Feb 2021 17:27:49 +0000
From:   Colin King <colin.king@canonical.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: lg-g15: make a const array static, makes object smaller
Date:   Thu,  4 Feb 2021 17:27:48 +0000
Message-Id: <20210204172748.107406-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array led_names on the stack but instead make
it static. Makes the object code smaller by 79 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  19686	   7952	    256	  27894	   6cf6	drivers/hid/hid-lg-g15.o

After:
   text	   data	    bss	    dec	    hex	filename
  19543	   8016	    256	  27815	   6ca7	drivers/hid/hid-lg-g15.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-lg-g15.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index fcaf8466e627..bfbba0d41933 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -647,7 +647,7 @@ static void lg_g15_input_close(struct input_dev *dev)
 
 static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 {
-	const char * const led_names[] = {
+	static const char * const led_names[] = {
 		"g15::kbd_backlight",
 		"g15::lcd_backlight",
 		"g15::macro_preset1",
-- 
2.29.2

