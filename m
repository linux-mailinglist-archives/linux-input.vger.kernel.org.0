Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 129676CF93F
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 04:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjC3CsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Mar 2023 22:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjC3CsL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Mar 2023 22:48:11 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F7C84EE4
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 19:48:09 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 6679EA276;
        Wed, 29 Mar 2023 19:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1680144488; bh=Y88uDpOFZ1q6410w736n3wXwIl0G+4VQrfHC0yZB+X4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MYgHp3XXmFtjzCOzjeOF94W5HkACXI/ufj4EGAbAcZl5QloI3uktyN/qZGcLeaile
         GJ34UnHrbkGbXtRqN8wBbXqnpN1EmooPMq5ZMSF5UaQLxwjIzrkfVmZxgF8Ee6gxS3
         wptwlQyET2qFhYbqSIMtCWLCFMxfc5ahSZ/shtCSmnBzYFv779h+viQd2EGQhgaIQU
         Na1c1cYQ/hxsFpd+6r2fgMWDTSqPlEudyp6XjItjZmNYN4IeHm4LkWgVbJzi8yMYfH
         OzF+ASTXhyxuzVx06eLUbUTORgq7Z1dFQFOarAad3lSYtAncaeYHEaKlY9pn2EEPMs
         VApH9LXaVZEWg==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 1/2] Input: xpad - Add constants for GIP interface numbers
Date:   Wed, 29 Mar 2023 19:47:51 -0700
Message-Id: <20230330024752.2405603-2-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330024752.2405603-1-vi@endrift.com>
References: <20230330024752.2405603-1-vi@endrift.com>
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

Wired GIP devices present multiple interfaces with the same USB identification
other than the interface number. This adds constants for differentiating two of
them and uses them where appropriate

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2d86ca0c1ace..698224e1948f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -561,6 +561,9 @@ struct xboxone_init_packet {
 #define GIP_MOTOR_LT BIT(3)
 #define GIP_MOTOR_ALL (GIP_MOTOR_R | GIP_MOTOR_L | GIP_MOTOR_RT | GIP_MOTOR_LT)
 
+#define GIP_WIRED_INTF_DATA 0
+#define GIP_WIRED_INTF_AUDIO 1
+
 /*
  * This packet is required for all Xbox One pads with 2015
  * or later firmware installed (or present from the factory).
@@ -2004,7 +2007,7 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 	}
 
 	if (xpad->xtype == XTYPE_XBOXONE &&
-	    intf->cur_altsetting->desc.bInterfaceNumber != 0) {
+	    intf->cur_altsetting->desc.bInterfaceNumber != GIP_WIRED_INTF_DATA) {
 		/*
 		 * The Xbox One controller lists three interfaces all with the
 		 * same interface class, subclass and protocol. Differentiate by
-- 
2.40.0

