Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E20F2AE416
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 00:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731558AbgKJXal (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 18:30:41 -0500
Received: from emkei.cz ([93.99.104.210]:35199 "EHLO localhost"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731234AbgKJXak (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 18:30:40 -0500
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 18:30:40 EST
Received: by localhost (Postfix, from userid 33)
        id ABA6827BEF; Tue, 10 Nov 2020 18:21:45 -0500 (EST)
To:     linux-input@vger.kernel.org
Subject: [PATCH RESEND] Input: goodix - Add upside-down quirk for Teclast X98 Pro
 tablet
From:   "Simon Beginn" <linux@simonmicro.de>
X-Priority: 3 (Normal)
Importance: Normal
Reply-To: linux@simonmicro.de
Content-Type: text/plain; charset=utf-8
Message-Id: <20201110232145.ABA6827BEF@localhost>
Date:   Tue, 10 Nov 2020 18:21:45 -0500 (EST)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchscreen on the Teclast x98 Pro is also mounted upside-down in relation to the display orientation. I added it also to the list of those devices. Verified it works on my device - this has not been tested with more users than myself...

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index f8dd416c89b2..7668174b62ed 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -136,6 +136,16 @@ static const struct dmi_system_id rotated_screen[] = {
                        DMI_MATCH(DMI_BIOS_DATE, "12/19/2014"),
                },
        },
+       {
+               .ident = "Teclast X98 Pro",
+               .matches = {
+                       /* Only match bios date, because the manufacturers bios
+                        * does not report the board name at all (sometimes)...
+                        */
+                       DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
+                       DMI_MATCH(DMI_BIOS_DATE, "10/28/2015"),
+               },
+       },
        {
                .ident = "WinBook TW100",
                .matches = {
