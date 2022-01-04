Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED3E484037
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 11:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbiADK4w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jan 2022 05:56:52 -0500
Received: from soltyk.jannau.net ([144.76.91.90]:54550 "EHLO soltyk.jannau.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230284AbiADK4w (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Jan 2022 05:56:52 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jan 2022 05:56:52 EST
Received: by soltyk.jannau.net (Postfix, from userid 1000)
        id C600D26E164; Tue,  4 Jan 2022 11:51:37 +0100 (CET)
Date:   Tue, 4 Jan 2022 11:51:37 +0100
From:   Janne Grunau <j@jannau.net>
To:     =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc:     benjamin@sipsolutions.net, alexhenrie24@gmail.com,
        bberg@redhat.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Add 2021 magic keyboard FN key mapping
Message-ID: <20220104105137.GE28130@jannau.net>
References: <20211108125038.125579-1-benjamin@sipsolutions.net>
 <20220102175438.175359-1-jose.exposito89@gmail.com>
 <20220103180418.GA17596@elementary>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220103180418.GA17596@elementary>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hej,

On 2022-01-03 19:04:18 +0100, José Expósito wrote:
> On Sun, Jan 02, 2022 at 06:54:39PM +0100, José Expósito wrote: 
> > Works as expected a code looks good to me.
> 
> Actually, just a little comment on the code, sorry for the extra email:
> 
> > diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> > index 2c9c5faa74a9..61dfe983828f 100644
> > --- a/drivers/hid/hid-apple.c
> > +++ b/drivers/hid/hid-apple.c
> > @@ -70,6 +70,28 @@ struct apple_key_translation {
> >  	u8 flags;
> > };
> >
> > +static const struct apple_key_translation apple2021_fn_keys[] = {
> 
> Since this driver handles many devices, I think that renaming this
> struct to "magic_keyboard_2021_fn_keys" would help to quickly
> understand which is the target device.

A more generic name will make sense in the future since the Apple 
silicon based MacBooks (except for the 2020 13-inch MacBook Pro) use the 
same mapping. Keyboard and trackpad on those devices use HID over SPI 
and identify themself as "Apple Internal Keyboard / Trackpad".

The HID over SPI low level transport is still work in progress but the 
keyboard works as expected with minimal changes to hid-apple.c.

I can of course just rename the struct in the commit adding support for 
the MacBooks.

best regards

Janne
