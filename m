Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B273D4C64
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 08:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhGYFv3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jul 2021 01:51:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229460AbhGYFvU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jul 2021 01:51:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C3C9606A5;
        Sun, 25 Jul 2021 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627194711;
        bh=z8A61fpG10Pxn3NAU3x0FR0SgdZ2yY3pLNSvKShSQfE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ArE/gUCUU1jIeZ5Ohfz+FYcURtlnlCUl7hKyPYQEZo6miCsyYSw60jVGoSjjrRjGf
         AbwWVZd214edmKIiiIh11jZC/1Kk1c6i0AlwIowra1MkkD+wlTr0wkHMzAL45FZDw/
         bUs/O1/yOOHKs3dtgvC0URZrdDihdO28bZeE4AdI=
Date:   Sun, 25 Jul 2021 08:31:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Salah Triki <salah.triki@gmail.com>
Cc:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: joystick: pxrc: use usb_get_intf()
Message-ID: <YP0FU1jMuhcy6wLu@kroah.com>
References: <20210724213617.GA586795@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724213617.GA586795@pc>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 24, 2021 at 10:36:17PM +0100, Salah Triki wrote:
> Use usb_get_intf() in order to increment reference count of the usb
> interface structure.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/input/joystick/pxrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> index ea2bf5951d67..59304352548b 100644
> --- a/drivers/input/joystick/pxrc.c
> +++ b/drivers/input/joystick/pxrc.c
> @@ -143,7 +143,7 @@ static int pxrc_probe(struct usb_interface *intf,
>  		return -ENOMEM;
>  
>  	mutex_init(&pxrc->pm_mutex);
> -	pxrc->intf = intf;
> +	pxrc->intf = usb_get_intf(intf);
>  
>  	usb_set_intfdata(pxrc->intf, pxrc);
>  
> -- 

You can not add a reference and never drop it :(
