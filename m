Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39946D85A4
	for <lists+linux-input@lfdr.de>; Wed,  5 Apr 2023 20:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbjDESFW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 5 Apr 2023 14:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233855AbjDESFT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Apr 2023 14:05:19 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E813E6E9F;
        Wed,  5 Apr 2023 11:04:49 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id D5E5360004;
        Wed,  5 Apr 2023 18:03:16 +0000 (UTC)
Message-ID: <8ee84f3383fb074f031b88c4f030757667635d96.camel@hadess.net>
Subject: Re: [PATCH v2] USB: core: Fix docs warning caused by
 wireless_status feature
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 05 Apr 2023 20:03:16 +0200
In-Reply-To: <2023040554-obscurity-latter-b12b@gregkh>
References: <20230405092754.36579-1-hadess@hadess.net>
         <2023040554-obscurity-latter-b12b@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2023-04-05 at 19:13 +0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 05, 2023 at 11:27:54AM +0200, Bastien Nocera wrote:
> > Fix wrongly named 'dev' parameter in doc block, should have been
> > iface:
> > drivers/usb/core/message.c:1939: warning: Function parameter or
> > member 'iface' not described in 'usb_set_wireless_status'
> > drivers/usb/core/message.c:1939: warning: Excess function parameter
> > 'dev' description in 'usb_set_wireless_status'
> > 
> > And fix missing struct member doc in kernel API, and reorder to
> > match struct:
> > include/linux/usb.h:270: warning: Function parameter or member
> > 'wireless_status_work' not described in 'usb_interface'
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Link:
> > https://lore.kernel.org/linux-next/20230405114807.5a57bf46@canb.auug.org.au/T/#t
> > Fixes: 0a4db185f078 ("USB: core: Add API to change the
> > wireless_status")
> 
> I do not see that git commit id anywhere, where is it from?  What
> tree?
> 
> Ah, input tree, not much I can do there...

Yes, it's from the hid tree.

Benjamin is waiting on either Alan or yourself ack'ing the changes
before pushing it through the hid tree, to avoid stepping on somebody
else's toes.

The patch seems to fix the warnings in my local tests, let me know if
you have any comments about the wording.

Cheers
