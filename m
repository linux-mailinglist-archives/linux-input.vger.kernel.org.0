Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 992056DD00A
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 05:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjDKDRR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Apr 2023 23:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbjDKDRL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Apr 2023 23:17:11 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C8492D62
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 20:17:05 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 2BBC1A286;
        Mon, 10 Apr 2023 20:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1681183024; bh=Ttk2m5AvoSX9qu9WZHopMD6RQeOqeriupwHUH6TNIqQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W0kzwg5Rs/Z1b3jP469mM/3OE0SuW4mjCLNlrD8cOzfYKlACnIQyrJ1e5LIS3ZAo0
         t6FAYRYHHhyOjLIpaX68CMocRk1T6kzfGaAoPMGoKBXh8YXYAysJ0GGpiMd2sfoCP5
         rvqr0QNAcODBrJCp8AFiyCiZcONbaHWhBi4CmAQs2UjEzgHlwwuYnKU8Fx+FAA0fk0
         4sfAaTWxrD/DiUCVpRE0JtqBo3LOyOk4G7lI/HqLiWggaDAUpyHHqRuGCsnxRzWXMz
         47O12NhorVixZvRutMI041oTLdSriJq3130L4XDp+MOXXqMnYVaTAfHxUjxmS0j0IR
         H9xRvvtPLkPZA==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 2/2] Input: xpad - fix PowerA EnWired Controller guide button
Date:   Mon, 10 Apr 2023 20:16:50 -0700
Message-Id: <20230411031650.960322-3-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411031650.960322-1-vi@endrift.com>
References: <20230411031650.960322-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This commit explicitly disables the audio interface the same way the official
driver does. This is needed for some controllers, such as the PowerA Enhanced
Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 6ea9c10dfb8a..175fcba7f92d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1396,6 +1396,16 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
 	unsigned long flags;
 	int retval;
 
+	if (usb_ifnum_to_if(xpad->udev, GIP_WIRED_INTF_AUDIO)) {
+		/* Explicitly disable the audio interface. This is needed for some
+		 * controllers, such as the PowerA Enhanced Wired Controller
+		 * for Series X|S (0x20d6:0x200e) to report the guide button */
+		retval = usb_set_interface(xpad->udev, GIP_WIRED_INTF_AUDIO, 0);
+		if (retval)
+			dev_warn(&xpad->dev->dev,
+				 "unable to disable audio interface: %d\n", retval);
+	}
+
 	spin_lock_irqsave(&xpad->odata_lock, flags);
 
 	/*
-- 
2.40.0

