Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32AC5F7110
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 00:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231989AbiJFWVc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Oct 2022 18:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiJFWVb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Oct 2022 18:21:31 -0400
X-Greylist: delayed 506 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 06 Oct 2022 15:21:28 PDT
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE06914299C
        for <linux-input@vger.kernel.org>; Thu,  6 Oct 2022 15:21:28 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.106.20.54])
        by endrift.com (Postfix) with ESMTPSA id A1C7CA28C;
        Thu,  6 Oct 2022 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1665094381; bh=rBb1SqYi3cJdH+7HPP0CwzWdNK3t9msbBSeEayWvbug=;
        h=From:To:Cc:Subject:Date:From;
        b=BlFbbCUcoTWprDm4Q3WkymZAw03EgIv7YGgcYs5+vdpj7aH2EVIY53zQd32VGq426
         04jL/keVsaRSvBmkQRQmwtdra7uTXiHBBOjH3m6eEQfgk2nqE5GXDyoTVUFwAMOhmG
         Gp4Ap/1o/tFiS9acHPFRIUyNkwUSwra5XJfbkncotRZbAmBE7JOoRBzddaEMbD1q0Y
         pjZtmPwinYW/VbdLkR9veudHNQlTQ56PrRosGY2JRDfrC3VckgQ2opUO2bP5t7tvWw
         aXYHHhjEyiJVX/4SUrlwbbFnofj2DelOdT7WkN+8j5WcGmxyCAcTtbjBetbwaEPJnC
         IU1dGRmrmuuhw==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Cullen <michael@michaelcullen.name>,
        Marcos Alano <marcoshalano@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH] Input: xpad - fix PowerA EnWired Controller guide button
Date:   Thu,  6 Oct 2022 15:12:09 -0700
Message-Id: <20221006221209.2016372-1-vi@endrift.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Xbox One controllers require more complete versions of the controller
start-up sequence used in official software in order to function properly.
This patch adds a usb_set_interface call that matches official startup and
nominally disabled the audio interface, which isn't supported in the xpad
driver in the first place.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 18190b529bca..6449665d7b61 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1509,6 +1509,13 @@ static int xpad_start_input(struct usb_xpad *xpad)
 		return -EIO;
 
 	if (xpad->xtype == XTYPE_XBOXONE) {
+		/* Explicitly disable the audio interface. This is needed for some
+		 * controllers, such as the PowerA Enhanced Wired Controller
+		 * for Series X|S (0x20d6:0x200e) to report the guide button */
+		error = usb_set_interface(xpad->udev, 1, 0);
+		if (error)
+			return error;
+
 		error = xpad_start_xbox_one(xpad);
 		if (error) {
 			usb_kill_urb(xpad->irq_in);
-- 
2.38.0

