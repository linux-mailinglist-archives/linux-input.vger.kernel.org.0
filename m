Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B90615A4C0B
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 14:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiH2Mia convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 29 Aug 2022 08:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiH2MiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 08:38:15 -0400
X-Greylist: delayed 1142 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 29 Aug 2022 05:22:09 PDT
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C6026AD6
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 05:22:06 -0700 (PDT)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id F0763C2D88
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 11:54:32 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 963DDE0002;
        Mon, 29 Aug 2022 11:52:22 +0000 (UTC)
Message-ID: <cba8c6664c1fc91b784f4b9e21fe1a2165c82dd1.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
From:   Bastien Nocera <hadess@hadess.net>
To:     "Peter F. Patel-Schneider" <pfpschneider@gmail.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Mon, 29 Aug 2022 13:52:22 +0200
In-Reply-To: <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
         <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
         <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2022-08-25 at 16:47 -0400, Peter F. Patel-Schneider wrote:
> This patch will cause more use of a part of the driver that
> constructs
> messages that do not conform to the HID++ 2.0 specification.  This
> makes now a good time to fix the parts of the driver that construct
> non-conforming messages.  More information follows.
> 
> 
> The Logitech HID++2.0 Draft Specification at
> https://lekensteyn.nl/files/logitech/logitech_hidpp_2.0_specification_draft_2012-06-04.pdf
> specifies (on pages 2 and 3) that the low-order nibble of the
> function
> (command) byte is non-zero.
> 
> The HID++ driver at
> https://github.com/torvalds/linux/blob/master/drivers/hid/hid-logitech-hidpp.c
> has 1 in that nibble for some commands, 
> 
> #define CMD_ROOT_GET_FEATURE                            0x01
> #define CMD_ROOT_GET_PROTOCOL_VERSION                   0x11
> 
> #define CMD_GET_DEVICE_NAME_TYPE_GET_COUNT              0x01
> #define CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME        0x11
> #define CMD_GET_DEVICE_NAME_TYPE_GET_TYPE               0x21
> 
> But other commands have zero in that nibble, namely
> 
> #define CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_LEVEL_STATUS       0x00
> #define CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_CAPABILITY         0x10
> 
> #define CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE 0x00
> 
> #define CMD_UNIFIED_BATTERY_GET_CAPABILITIES                    0x00
> #define CMD_UNIFIED_BATTERY_GET_STATUS                          0x10
> 
> #define CMD_HI_RESOLUTION_SCROLLING_SET_HIGHRES_SCROLLING_MODE  0x10
> 
> #define CMD_HIRES_WHEEL_GET_WHEEL_CAPABILITY    0x00
> #define CMD_HIRES_WHEEL_SET_WHEEL_MODE          0x20
> 
> #define CMD_SOLAR_SET_LIGHT_MEASURE                     0x00
> 
> #define CMD_TOUCHPAD_FW_ITEMS_SET                       0x10

Sounds like none of those commands should have anything set in that
lower nibble, but this patch should be enough to take care of either
case. I don't know whether the "rap" commands are used at all for HID++
2.0 commands, or just for HID++ 1.0.

Is the software ID something random that the software in question
chooses? I chose 0x06 as we're at Linux version 6.0...

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 86e7a38d8a9a..4c430b24b6bc 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -41,6 +41,9 @@ module_param(disable_tap_to_click, bool, 0644);
 MODULE_PARM_DESC(disable_tap_to_click,
        "Disable Tap-To-Click mode reporting for touchpads (only on the K400 currently).");
 
+/* Define a non-zero software ID to identify our own responses */
+#define LINUX_KERNEL_SW_ID                     0x06
+
 #define REPORT_ID_HIDPP_SHORT                  0x10
 #define REPORT_ID_HIDPP_LONG                   0x11
 #define REPORT_ID_HIDPP_VERY_LONG              0x12
@@ -343,7 +346,7 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
        else
                message->report_id = REPORT_ID_HIDPP_LONG;
        message->fap.feature_index = feat_index;
-       message->fap.funcindex_clientid = funcindex_clientid;
+       message->fap.funcindex_clientid = funcindex_clientid | LINUX_KERNEL_SW_ID;
        memcpy(&message->fap.params, params, param_count);
 
        ret = hidpp_send_message_sync(hidpp, message, response);

