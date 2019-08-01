Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DF57DCCA
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 15:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbfHANro (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 09:47:44 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:40981 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725930AbfHANrn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 1 Aug 2019 09:47:43 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 95FA3405;
        Thu,  1 Aug 2019 09:47:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 01 Aug 2019 09:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=HxNgJJg2nhiPwmgNt7+DyzeN6pL
        3GbnAaqp3b9wUFk4=; b=AAy+jPnO/oVUFq4jUmE3x97NZJYdTPaqtNJUf7nwz4N
        9AdlhiaxrugfOl9/aL2MZs7a5ojdwqNJBpQH0b0pODxu8assB4upmc3K/8Uaw/7a
        EDWxkklm5A1xiZPR5HyyMFS6PRSDewL7cuYQk5IQTTKH6XQQJlKoW8uwT/Dm0wkK
        EQ5Gv3GqAC+FEP+DsPTI/HLHEDcR1yUggE6N/8h2cqoX13iis1jumIbzsuwyVJPC
        VLXLvL/H8KhCzg+LMPdFoj+QauZKEIoS+sUE5lPmMAkVS9iTgXBsZz7sXnUfSvpb
        28kUzRNUZ9nYc0sSiLK1x2bugmb3PhtsfbAcZjywTEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HxNgJJ
        g2nhiPwmgNt7+DyzeN6pL3GbnAaqp3b9wUFk4=; b=y/Aa/Y+NgfYU+fo/Tzn4oY
        /wi9dVZE9Kq3W/nJ+pqxkJu5IfqS4B+Ss6bCd2P6n1rO68+3BU4ECB1Y1mOxeBGv
        G1pgAwbDcWd3P//lrm+WoCFwdup3S0Olh4DlsR7+AAJkW7NceSFjgmNANP8B1KaM
        3yigh/KDCmim0/8IrRDrz02gG2T2WOJiiIw3+mqu5VbFVsKeQ63SUY4sc3MPNScK
        +X66uvIzYK8bMFLgwae6xxq+3hnkX/9uIh5MQJD5xgsmMpviTZsTn8yTwEqAoYLm
        wa2yo2tdK0/hNU0yhDe+vT6qAZo9t6NA3C50vzohep3sRMjxu9pvFHCnJnxk+CEg
        ==
X-ME-Sender: <xms:eu1CXTJ3D6noxacELy3qEukfzFIgpgQrciOUfXwoezAVSAHRNp9I3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleejgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
    ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
    lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:eu1CXWtDbL5upCIHa0CnQAqT6PjLHVEBLWCwg2-B7xze5oT-yiVWvA>
    <xmx:eu1CXSInz_iX1dsHVJz1vpEOr5jvLBIi1WVFzouU_xPVMxqfzrRuhA>
    <xmx:eu1CXb8DgB6HtttgXY1UTrLzVoyZPCts3AnGf_oV2CBqBtUQco9edg>
    <xmx:e-1CXfgEu_lo7EqH29CmOZdrWg_bpyYNjEOZrLF1dNJDHiZmpNhlyw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id B456A380079;
        Thu,  1 Aug 2019 09:47:37 -0400 (EDT)
Date:   Thu, 1 Aug 2019 15:47:33 +0200
From:   Greg KH <greg@kroah.com>
To:     walter harms <wharms@bfs.de>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: Use GFP_KERNEL instead of GFP_ATOMIC when
 applicable
Message-ID: <20190801134733.GA24791@kroah.com>
References: <20190801074759.32738-1-christophe.jaillet@wanadoo.fr>
 <5D42B98B.40900@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5D42B98B.40900@bfs.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 01, 2019 at 12:06:03PM +0200, walter harms wrote:
> 
> 
> Am 01.08.2019 09:47, schrieb Christophe JAILLET:
> > There is no need to use GFP_ATOMIC when calling 'usb_alloc_coherent()'
> > here. These calls are done from probe functions and using GFP_KERNEL should
> > be safe.
> > The memory itself is used within some interrupts, but it is not a
> > problem, once it has been allocated.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >  drivers/hid/usbhid/usbkbd.c   | 4 ++--
> >  drivers/hid/usbhid/usbmouse.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> > index d5b7a696a68c..63e8ef8beb45 100644
> > --- a/drivers/hid/usbhid/usbkbd.c
> > +++ b/drivers/hid/usbhid/usbkbd.c
> > @@ -239,11 +239,11 @@ static int usb_kbd_alloc_mem(struct usb_device *dev, struct usb_kbd *kbd)
> >  		return -1;
> >  	if (!(kbd->led = usb_alloc_urb(0, GFP_KERNEL)))
> >  		return -1;
> > -	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma)))
> > +	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_KERNEL, &kbd->new_dma)))
> >  		return -1;
> >  	if (!(kbd->cr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL)))
> >  		return -1;
> > -	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_ATOMIC, &kbd->leds_dma)))
> > +	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_KERNEL, &kbd->leds_dma)))
> >  		return -1;
> >  
> 
> the kernel style is usually:
>  kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma);
>  if (!kbd->new)
> 	return -1;
> 
> 
> in usbmouse.c this is done, any reason for the change here ?

If you want to be extra-correct, don't return -1, return -ENOMEM.

thanks,

greg k-h
