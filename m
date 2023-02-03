Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AEFA688D0F
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 03:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbjBCC2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Feb 2023 21:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjBCC2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Feb 2023 21:28:43 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BEE23100
        for <linux-input@vger.kernel.org>; Thu,  2 Feb 2023 18:28:42 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 9CAC2A264;
        Thu,  2 Feb 2023 18:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1675391322; bh=qeP0TaAqRTLFzJZr4cKi3LGKbofYpdAHzSlvZ6+Mc34=;
        h=From:To:Cc:Subject:Date:From;
        b=UWgsIiLVcjS9Id9G+tTMTKoEVKAcEIJEEDXmMI8Mr64Zi6GaNvHxAT6WL1eZ42glt
         ffqIV/AGBtTo2+5eul/PkTJVWdKM//wUWEzZFBviB+jM2/9064f5kTsevsgEs0L3M2
         zJkJPK/X8equOm7Fp1D7FH9xWviZZAGdCsNTHKziVPyx1xp9wus/VeFMAspZVdzduw
         StxUbL167H6ts+2TqqKEqX/SfKomy1wbuJl5zmCZEDw++f6gIpwiWjwlqZ2h1GD6oR
         qStiz2mWFPQV1T8C2JBRHXjaIo2l7Idd4h0RJmlSjz11vdR9nRGheFbuMbOhUBFc+U
         /o8j0ekMabgaQ==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 1/3] Input: xpad - Treat Qanba controllers as Xbox360 controllers
Date:   Thu,  2 Feb 2023 18:27:56 -0800
Message-Id: <20230203022758.3982393-1-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
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

From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>

They act that way in PC mode.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/input/joystick/xpad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2959d80f7fdb..bb65c8268963 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -492,6 +492,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
+	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
-- 
2.39.1

