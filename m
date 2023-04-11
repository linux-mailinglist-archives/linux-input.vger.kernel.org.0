Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9E66DD007
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 05:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjDKDRO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Apr 2023 23:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjDKDRL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Apr 2023 23:17:11 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B104F2D5A
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 20:17:04 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 96F06A282;
        Mon, 10 Apr 2023 20:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1681183024; bh=UDI5JU/S6ZbGF6XM6UJU1TNOgPF0Mku6CnHDJBsRTt8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fRgAgNjyoRtI/oJVgj2IlAGv+D/V7SPQ6GdUV5xWIg6zN+DRlQ11yTnqpOx7q03Lu
         zZoktovF7UEhRvIpAfBL8uFhT20DV5CIbW3cLcp9TrLyHIkxiqdVzKa6LLBjYHmTQU
         qP1Hkw8CmYwwchJFGCXDoEc0ln2tYqN0GnT2EVdSBYVNxxZIrAKa2AoFnp/Nh/2oLM
         BBm6jNgitGJXUw1lAeZwy0IdB4ZFr3A6b+g0ffbZ9BfQnzhvBKE6lKEHqvIAFCUxK7
         QqIW8gLK/YrhA4of5Qd5RCECvaZNQF1ARfdpVZV/0iQAzxXkw0cpXoDbzVvLlmamMG
         ftYULSsRBu32g==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 1/2] Input: xpad - Add constants for GIP interface numbers
Date:   Mon, 10 Apr 2023 20:16:49 -0700
Message-Id: <20230411031650.960322-2-vi@endrift.com>
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

Wired GIP devices present multiple interfaces with the same USB identification
other than the interface number. This adds constants for differentiating two of
them and uses them where appropriate

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 260f91fef427..6ea9c10dfb8a 100644
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

