Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20D644641F
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 14:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232705AbhKENaA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 09:30:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:36822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232258AbhKEN37 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Nov 2021 09:29:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A9A6008E;
        Fri,  5 Nov 2021 13:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636118840;
        bh=MNPGUTGRk+SK3gvtiozT8wwNd3ywfLuyUdOvybUnQA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v/hpkmvcwomVhCy6YfxPxWo+VNrksT/7gZLTgRSWl+TpeuzpPRONL5M02+Ip3ZH2l
         LkR20Gsat+3hYkeAYB5kxR2SLveQlBwX8HBBSCb7Wf9aDvoDMHhT7KQS+66AMasRJU
         +JWewHOYIwOKGLzjUQ6Fzee9D4HJJMrCBJPO39uk=
Date:   Fri, 5 Nov 2021 14:27:17 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
Message-ID: <YYUxNaDG0DquQvke@kroah.com>
References: <20211103155438.11167-1-andrzej.p@collabora.com>
 <20211104120111.GB23122@duo.ucw.cz>
 <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
 <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
 <alpine.DEB.2.21.2111041311260.57165@angie.orcam.me.uk>
 <9fbe062a-2992-0361-e72a-f2b1523143dd@collabora.com>
 <b3a917ef-8a70-80b6-8c79-48ce4628b9e8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b3a917ef-8a70-80b6-8c79-48ce4628b9e8@collabora.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 05, 2021 at 02:01:23PM +0100, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> W dniu 04.11.2021 o 15:17, Andrzej Pietrasiewicz pisze:
> > Hi Maciej,
> > 
> > W dniu 04.11.2021 o 14:13, Maciej W. Rozycki pisze:
> > > On Thu, 4 Nov 2021, Maciej W. Rozycki wrote:
> > > 
> > > >   The reason for this is with their more recent laptops Lenovo in their
> > > > infinite wisdom have placed the <PrintScreen> key (which in a traditional
> > > > PS/2-keyboard manner produces <SysRq> when combined with <Alt>) in their
> > > > keyboards between the right <Alt> and <Ctrl> keys.  With thumbs not being
> > > > as accurate as other fingers (and the overall misdesign of the keyboard
> > > > and touchpad interface) you can imagine how often I have inadvertently hit
> > > > <SysRq> combined with a letter key, wreaking havoc to my system (and of
> > > > course I want to keep the key enabled for times when I do need it).
> > > 
> > >   On second thoughts this can be disabled with `setkeycodes 54 0' once we
> > > do have an alternative combination available.
> > > 
> > 
> > Doesn't `setkeycodes` affect only one keyboard? What if there are more
> > keyboards connected to a machine?
> > 
> >  From drivers/tty/vt/keyboard.c:
> > 
> > /*
> >   * Translation of scancodes to keycodes. We set them on only the first
> >   * keyboard in the list that accepts the scancode and keycode.
> >   * Explanation for not choosing the first attached keyboard anymore:
> >   *  USB keyboards for example have two event devices: one for all "normal"
> >   *  keys and one for extra function keys (like "volume up", "make coffee",
> >   *  etc.). So this means that scancodes for the extra function keys won't
> >   *  be valid for the first event device, but will be for the second.
> >   */
> > 
> 
> My second thoughts: if we run `setkeycodes` to map, say, F10 as SysRq,
> don't we lose F10?

The fact that this patch adds a "new" sysrq key no matter what is a
non-starter, please think through the consequences of such a change...

So no, as-is, this change is not acceptable at all, and I would be
amazed if anyone would ship such a thing.

thanks,

greg k-h
