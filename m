Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25DB97D8FF
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2019 12:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728065AbfHAKGN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Aug 2019 06:06:13 -0400
Received: from mx01-fr.bfs.de ([193.174.231.67]:19567 "EHLO mx01-fr.bfs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbfHAKGN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 1 Aug 2019 06:06:13 -0400
Received: from mail-fr.bfs.de (mail-fr.bfs.de [10.177.18.200])
        by mx01-fr.bfs.de (Postfix) with ESMTPS id 609B02035E;
        Thu,  1 Aug 2019 12:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bfs.de; s=dkim201901;
        t=1564653965; h=from:from:sender:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dq2P+/tLnoednMG8zhzVQMUzH/VeX5hFM/9G4yMQw70=;
        b=B5kLBbIBcuuJ7Me4hRA6QS7biC+bydX+j1MCtN42RX31i4l96jV3gUe2J0jNm0Xu3NlJ8t
        Cu9ARd5Q9MM1Pm8ZIpqRxBnOXM3BJBH65g6eeeLZd5meQZd0nu7Q/ZsihW9MUvFskcdZRL
        JayzNzB6180FxxzR+AYV44nBPm1s6KC96bn+snss045nfDYw2468AIB2VxSKPQnfyohoDW
        WNVNRrBwZpFJ9Klp6JSd9p+T+4A9HtgItNQujd/VXqZNOOaC0FQzCGbdAKOFqHCbq6e53e
        Zchxsv9Pqqh4peaYxfowuXM2/7ZV6YAVxKzOz65EriJkcX02k00Vj3kTKyo1dg==
Received: from [134.92.181.33] (unknown [134.92.181.33])
        by mail-fr.bfs.de (Postfix) with ESMTPS id E1D87BEEBD;
        Thu,  1 Aug 2019 12:06:04 +0200 (CEST)
Message-ID: <5D42B98B.40900@bfs.de>
Date:   Thu, 01 Aug 2019 12:06:03 +0200
From:   walter harms <wharms@bfs.de>
Reply-To: wharms@bfs.de
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; de; rv:1.9.1.16) Gecko/20101125 SUSE/3.0.11 Thunderbird/3.0.11
MIME-Version: 1.0
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: Use GFP_KERNEL instead of GFP_ATOMIC when
 applicable
References: <20190801074759.32738-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190801074759.32738-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.10
Authentication-Results: mx01-fr.bfs.de
X-Spamd-Result: default: False [-3.10 / 7.00];
         ARC_NA(0.00)[];
         HAS_REPLYTO(0.00)[wharms@bfs.de];
         BAYES_HAM(-3.00)[100.00%];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
         MIME_GOOD(-0.10)[text/plain];
         REPLYTO_ADDR_EQ_FROM(0.00)[];
         DKIM_SIGNED(0.00)[];
         RCPT_COUNT_SEVEN(0.00)[7];
         FREEMAIL_TO(0.00)[wanadoo.fr];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_TLS_ALL(0.00)[]
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Am 01.08.2019 09:47, schrieb Christophe JAILLET:
> There is no need to use GFP_ATOMIC when calling 'usb_alloc_coherent()'
> here. These calls are done from probe functions and using GFP_KERNEL should
> be safe.
> The memory itself is used within some interrupts, but it is not a
> problem, once it has been allocated.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/usbhid/usbkbd.c   | 4 ++--
>  drivers/hid/usbhid/usbmouse.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> index d5b7a696a68c..63e8ef8beb45 100644
> --- a/drivers/hid/usbhid/usbkbd.c
> +++ b/drivers/hid/usbhid/usbkbd.c
> @@ -239,11 +239,11 @@ static int usb_kbd_alloc_mem(struct usb_device *dev, struct usb_kbd *kbd)
>  		return -1;
>  	if (!(kbd->led = usb_alloc_urb(0, GFP_KERNEL)))
>  		return -1;
> -	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma)))
> +	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_KERNEL, &kbd->new_dma)))
>  		return -1;
>  	if (!(kbd->cr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL)))
>  		return -1;
> -	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_ATOMIC, &kbd->leds_dma)))
> +	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_KERNEL, &kbd->leds_dma)))
>  		return -1;
>  

the kernel style is usually:
 kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma);
 if (!kbd->new)
	return -1;


in usbmouse.c this is done, any reason for the change here ?

re,
 wh

>  	return 0;
> diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
> index 073127e65ac1..c89332017d5d 100644
> --- a/drivers/hid/usbhid/usbmouse.c
> +++ b/drivers/hid/usbhid/usbmouse.c
> @@ -130,7 +130,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
>  	if (!mouse || !input_dev)
>  		goto fail1;
>  
> -	mouse->data = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &mouse->data_dma);
> +	mouse->data = usb_alloc_coherent(dev, 8, GFP_KERNEL, &mouse->data_dma);
>  	if (!mouse->data)
>  		goto fail1;
>  
