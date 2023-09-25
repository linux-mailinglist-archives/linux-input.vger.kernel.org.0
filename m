Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E24E7ADCDB
	for <lists+linux-input@lfdr.de>; Mon, 25 Sep 2023 18:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbjIYQOT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Sep 2023 12:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbjIYQOT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Sep 2023 12:14:19 -0400
X-Greylist: delayed 516 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 25 Sep 2023 09:14:12 PDT
Received: from hypatia.ibka.org (hypatia.ibka.org [IPv6:2001:8d8:978:5900::90:ff9d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B1BC0
        for <linux-input@vger.kernel.org>; Mon, 25 Sep 2023 09:14:12 -0700 (PDT)
Received: from fedora.localnet (cgn-89-1-217-222.nc.de [89.1.217.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by hypatia.ibka.org (Postfix) with ESMTPSA id 1ABA88C0049;
        Mon, 25 Sep 2023 18:05:32 +0200 (CEST)
From:   Matthias Berndt <matthias_berndt@gmx.de>
To:     linux-input@vger.kernel.org,
        Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Subject: [PATCH] Input: xpad - add PXN V900 support
Date:   Mon, 25 Sep 2023 18:05:31 +0200
Message-ID: <5716243.DvuYhMxLoT@fedora>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart5977584.lOV4Wx5bFT"
Content-Transfer-Encoding: 7Bit
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL,SPOOFED_FREEMAIL
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart5977584.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ismael, Hi linux-input,

I recently got my hands on a used PXN V900 steering wheel which didn't work 
out of the box on Linux. I've attached a patch that makes it work for me, 
please consider merging it.

All the best,
Matthias

--nextPart5977584.lOV4Wx5bFT
Content-Disposition: attachment;
 filename="0001-Input-xpad-add-PXN-V900-support.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="x-UTF_8J";
 name="0001-Input-xpad-add-PXN-V900-support.patch"

From 9b0af40bc3c064be1c7c5ba36d7fb4b8d6535fc7 Mon Sep 17 00:00:00 2001
From: Matthias Berndt <matthias_berndt@gmx.de>
Date: Mon, 25 Sep 2023 17:54:13 +0200
Subject: [PATCH] Input: xpad - add PXN V900 support

Add VID and PID to the xpad_device table to allow driver
to use the PXN V900 steering wheel, which is
XTYPE_XBOX360 compatible in xinput mode.
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ede380551e55..478bf657efc2 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -272,6 +272,7 @@ static const struct xpad_device {
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
+	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0004, "Honey Bee Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
@@ -503,6 +504,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
 	{ }
 };
 
-- 
2.41.0


--nextPart5977584.lOV4Wx5bFT--



