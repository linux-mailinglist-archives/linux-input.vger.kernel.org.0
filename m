Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE425A29A2
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 16:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344580AbiHZOfi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 26 Aug 2022 10:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344524AbiHZOfS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Aug 2022 10:35:18 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB02C24BD9
        for <linux-input@vger.kernel.org>; Fri, 26 Aug 2022 07:35:06 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id D327240003;
        Fri, 26 Aug 2022 14:35:02 +0000 (UTC)
Message-ID: <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
From:   Bastien Nocera <hadess@hadess.net>
To:     "Peter F. Patel-Schneider" <pfpschneider@gmail.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Fri, 26 Aug 2022 16:35:02 +0200
In-Reply-To: <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
         <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
         <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
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

This would cause problems, but not any worse than adding the product
IDs individually, which is what we're trying to avoid.

> This results in non-conforming messages being sent to devices.  As
> devices are obligated to return this nibble intact they produce non-
> conforming responses as well.  (Their other option would be to reject
> the messages.) This confuses other software that correctly uses this
> nibble to distinguish between device response messages and device
> event
> messages.

I don't understand how this...

> In particular, the response to the unified battery command to get the
> capabilities comes back with a 0x00 function byte which is
> indistinguishable from a spontaneous notification message from the
> device for a battery status event.  Other software trying to
> communicate with the device (e.g., Solaar) sees a unified battery
> status notification and will generally end up with incorrect
> information about the device.  I suspect that this is actually
> happening and is the cause of the Solaar bug report
> https://github.com/pwr-Solaar/Solaar/issues/1718

...could cause this. Can you explain what the messages would look like
in both cases, and how they could be misinterpreted as a 15 vs. 85
percent battery level?

> There is also the possibility that the driver confuses a notification
> from the device as the response to a command that it sent.  When this
> happens it would be likely that the actual response would be treated
> as
> a notification.
> 
> 
> The fix is to modify all the CMD definitions in the code to have 1 in
> their low-order nibble.

All in all, I don't see those bugs as blocking the integration of the
patch discussed above, I see it as a way to expose those bugs and
possibly a way to make them more urgent.

Filipe, were those problems known/already reported?

Cheers
