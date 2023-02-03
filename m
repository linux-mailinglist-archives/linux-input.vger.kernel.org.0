Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B69688D11
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 03:28:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjBCC2q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Feb 2023 21:28:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbjBCC2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Feb 2023 21:28:44 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAB72278F
        for <linux-input@vger.kernel.org>; Thu,  2 Feb 2023 18:28:43 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id C5A7EA29A;
        Thu,  2 Feb 2023 18:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1675391323; bh=+gITOjPgsU8iMWovncH/ffEsr04VsUNBAvbzm6qK918=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dSjktX6y1SF9MxZh/0bhi9IferWdLmcPie57IBYE0JG8NJVshTQ/+WYJEXNUPhG46
         LfxFLOEFYWzg6LLbWn8Uqm9TUOH+8wbQcsu7OOO5QLhit+1Dkd2X7S/WzoxCELjHdE
         tJE/rdwbBbFN1Hoz+9dUr/1BIrctrSzam2WgUSz+SlxcRN+wX13nGI1RDUqNfw/Rfi
         Z1GhXNBCLdJrpvWADx1PrukLd3k7lRL5d1xwx2nput18Q1xvUfM+18jiBZYUlvgq2Z
         OUrX1ghXBgro+HSNmE6yvd7mvLlfMieB2bCDwfCYT3al5/aStvFfy7pWqY04YoXMm+
         qM0zaHFVS+pHg==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>,
        Josh Cotton <jcotton42@outlook.com>
Subject: [PATCH 3/3] Input: xpad - add support for 8BitDo Ultimate Wireless controller dongle
Date:   Thu,  2 Feb 2023 18:27:58 -0800
Message-Id: <20230203022758.3982393-3-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203022758.3982393-1-vi@endrift.com>
References: <20230203022758.3982393-1-vi@endrift.com>
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

Add the VID and PID of the 8BitDo Ultimate Wireless controller dongle

Signed-off-by: Josh Cotton <jcotton42@outlook.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 16bc3cd4c2b7..403b57e8176b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -359,6 +359,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
 	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
+	{ 0x2dc8, 0x3106, "8BitDo Ultimate Wireless Controller", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1100, "Wooting One", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1200, "Wooting Two", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1210, "Wooting Lekker", 0, XTYPE_XBOX360 },
@@ -494,6 +495,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x260d),		/* Dareu H101 */
 	XPAD_XBOX360_VENDOR(0x2c22),		/* Qanba Controllers */
 	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
+	XPAD_XBOX360_VENDOR(0x2dc8),		/* 8BitDo Ultimate Wireless Controller */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
-- 
2.39.1

