Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24F33A796A
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 10:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhFOIxM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 04:53:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:44210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231281AbhFOIxF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 04:53:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6136961420;
        Tue, 15 Jun 2021 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623747061;
        bh=9ltkYt84XHRCjiFpqpJbCWEVaJ+GIPrMxTP71kRt3X0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=hQF8aVQc38/+jJr0BhRdoXZadH20RoSWGiEnAJyqz54m24IN+JXfMsAPyb/hJLTwL
         sukira08UzgF4THnSI9qHsAw40DyMvObCdXOcfWQXu0eq7Nd+6KMaWFlazHo3sYsSc
         gnk/ny/AI/p31G5laIzsXLw0SikV++zaJxYqNl5hpdVyx6AMlntqkfZAt7+gfuFnE+
         XDuneRi7wTFcYOe13GMoPRz3CQxSKSU6rmH+JaVCzqeq4TvQfNtv2S05dRzgSvACKk
         Ww5lyYsb7CWZLgIyyvrK4iM/0osfj9e2gCcnZhQQf8x9Fw/A9FfyZ/ccVA/e4ZlVO5
         vrmJZDW7XB7VQ==
Date:   Tue, 15 Jun 2021 10:50:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbkbd: Avoid GFP_ATOMIC when GFP_KERNEL is
 possible
In-Reply-To: <20210529100357.GA46765@hyeyoo>
Message-ID: <nycvar.YFH.7.76.2106151050520.18969@cbobk.fhfr.pm>
References: <20210529100357.GA46765@hyeyoo>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 29 May 2021, Hyeonggon Yoo wrote:

> usb_kbd_alloc_mem is called in usb_kbd_probe, which is
> not in atomic context. So constraints can be relaxed here.
> 
> Use GFP_KERNEL instead of GFP_ATOMIC.
> 
> Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> ---
>  drivers/hid/usbhid/usbkbd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> index e22434dfc9ef..df02002066ce 100644
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
>  	return 0;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

