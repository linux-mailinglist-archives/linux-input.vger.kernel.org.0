Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4963D31CF36
	for <lists+linux-input@lfdr.de>; Tue, 16 Feb 2021 18:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhBPRlK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 12:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhBPRlK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 12:41:10 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0E4C061574;
        Tue, 16 Feb 2021 09:40:29 -0800 (PST)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 4BBC7140BAA;
        Tue, 16 Feb 2021 18:40:27 +0100 (CET)
Date:   Tue, 16 Feb 2021 18:40:26 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        pobm@protonmail.com,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v6 2/4] HID: playstation: add microphone mute support
 for DualSense.
Message-ID: <20210216184026.30717c54@nic.cz>
In-Reply-To: <20210216182155.4caba859@nic.cz>
References: <20210215004549.135251-1-roderick@gaikai.com>
        <20210215004549.135251-3-roderick@gaikai.com>
        <20210215154045.4ac27ec0@nic.cz>
        <CANndSK=6TAzJJCvcgtRe_ASLbcqb73Y81gXPu3Qhg62Dxyvmuw@mail.gmail.com>
        <20210215191757.58992f44@nic.cz>
        <CANndSKmA4nh6FRv89vBwshUD7t0c7bBMcZcC7TbQOzU88j=+jA@mail.gmail.com>
        <20210216174129.78b2e9ab@nic.cz>
        <CAO-hwJLmO4Y7Q2gXHCobx6M3_9ixz+3xpZzp+yB-uQfDQ9fHWA@mail.gmail.com>
        <20210216182155.4caba859@nic.cz>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 16 Feb 2021 18:21:55 +0100
Marek Behun <marek.behun@nic.cz> wrote:

> > BTW, AFAICT, the only problem we have left (if we put that micmute
> > issue aside) is about the naming convention. If we fix the naming
> > shortly, would you have any concerns if we still push that code to
> > Linus in 5.12-rc0?  

So I had a call with Pavel Machek, who is maintainer of the LED
subsystem, and he thinks that you should wait with the LED patches
until they are acked/reviewed by others. So if you want to send a
pull-request to Linus, you probably should remove the LED patches for
now. They can be added later when they are reviewed.

> Yes, if naming is corrected I have no issue with this. LED triggers can
> be sent to 5.13.

By that I mean that in my opinion the best naming scheme here would be:
  hid%d:COLOR:micmute
for micmute LED (there is LED_FUNCTION_MICMUTE constant defined in
include/dt-bindings/leds/common.h)
and
  hid%d:COLOR:player-%d
for player LEDs.

This will need adding LED_FUNCTION_PLAYER constant, which will need
sending a patch that will need to be reviewed by LED people (and
applied by Pavel). I talked with Pavel and he thinks that if there are
other HID drivers (for joysticks) that also have this kind of LEDs
(identifiing players), than such a patch would be reasonable (and those
LEDs should use the constant). Otherwise LED_FUNCTION_INDICATOR should
be probably used.

Marek
