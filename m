Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A8B393457
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 18:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236503AbhE0Qzo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 12:55:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:47220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236661AbhE0Qzn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 12:55:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C1C6613B6;
        Thu, 27 May 2021 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622134449;
        bh=sZLWaISTsJ//42CHwenwNlSj6laAVOW8hNFDdz+z+tU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DHDLO/JoKhYFOP7Kz3elb/c37u9khtQidp7WaaY2U6BZUURPF+QkxK3brY2ombUJ+
         PuVFBSTwwn6egkEvODjRtx3+Ejcm049f0j2Qt9TwM+oCMN+ZR7aVoVAEeaYfFtGE4u
         p2boVTWXyirhv3LaMgViJhHYYj6aGg5Fd53JTleA=
Date:   Thu, 27 May 2021 18:54:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
Message-ID: <YK/Or91JIpbpwWjL@kroah.com>
References: <20210524145743.GA92203@hyeyoo>
 <20210527164517.GA143281@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527164517.GA143281@hyeyoo>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 01:45:17AM +0900, Hyeonggon Yoo wrote:
> On Mon, May 24, 2021 at 11:57:43PM +0900, Hyeonggon Yoo wrote:
> > probe in usb don't need to be atomic. So GFP_KERNEL can be used here,
> > instead of GFP_ATOMIC.
> > 
> > Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > ---
> >  drivers/hid/usbhid/usbmouse.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
> > index 073127e65ac1..c89332017d5d 100644
> > --- a/drivers/hid/usbhid/usbmouse.c
> > +++ b/drivers/hid/usbhid/usbmouse.c
> > @@ -130,7 +130,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
> >  	if (!mouse || !input_dev)
> >  		goto fail1;
> >  
> > -	mouse->data = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &mouse->data_dma);
> > +	mouse->data = usb_alloc_coherent(dev, 8, GFP_KERNEL, &mouse->data_dma);
> >  	if (!mouse->data)
> >  		goto fail1;
> >  
> > -- 
> > 2.25.1
> > 
> 
> Hello for me it was simple and obvious patch.
> Is there something wrong about it?

It has been only 4 days.  For a non-bugfix and for something that is
only a "cleanup" change, give it at least 2 weeks please.

Relax, there is no rush for stuff like this.

thanks,

greg k-h
