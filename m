Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEED75A4E5F
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 15:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiH2NlR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Mon, 29 Aug 2022 09:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbiH2NlK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 09:41:10 -0400
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DC68E0F3
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 06:41:06 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 04650240009;
        Mon, 29 Aug 2022 13:41:02 +0000 (UTC)
Message-ID: <10a9cd5638ad43f06ab2bc78aef1979c98b27e99.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
From:   Bastien Nocera <hadess@hadess.net>
To:     "Peter F. Patel-Schneider" <pfpschneider@gmail.com>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Date:   Mon, 29 Aug 2022 15:41:02 +0200
In-Reply-To: <a1421662-18ef-dea1-6adb-a18390831aca@gmail.com>
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
         <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
         <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
         <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
         <a1421662-18ef-dea1-6adb-a18390831aca@gmail.com>
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

On Fri, 2022-08-26 at 11:37 -0400, Peter F. Patel-Schneider wrote:
> Looking at
> https://bugzilla.kernel.org/show_bug.cgi?id=215699 reminded me of 
> another problem with the driver code.   Several HID++ 2.0 features,
> including 
> the HiRes Wheel, have commands with bit fields in them and set all
> the bits in 
> the bit field at once. But when the driver code sets the high-
> resolution bit 
> for this feature it also sets two other bits, ignoring their current
> setting.  
> This prevents other software from reliably using these two other
> bits, one of 
> which is for reporting wheel movement in the opposite direction, a.
> k. a. 
> natural scrolling.
> 
> It would be useful for the driver code to first get the other bits
> and set 
> them to their retrieved values.

Do you have any other examples of this? For the classic Linux desktop,
this particular bug isn't something we'd hit, as natural scrolling is
implemented at the higher levels (libinput) rather than something we
expect the driver to support.
