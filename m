Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03B3249D78
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 14:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgHSMJj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 08:09:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:46818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728200AbgHSMIe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 08:08:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9E36205CB;
        Wed, 19 Aug 2020 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597838914;
        bh=ds1bI2FNOetemI0iGOxjd//vmJ7FuX5vgPU2SVW5nOQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p/C6dXOhGr5YrrBD8slToXpFiWvIHbiPDOvXWigza0lxxRXRnLPlwHZI9paHkeb1N
         M4gl2HAbv84kIqey4gd+t1DIqIUOzNWzBwTs+HjZfQOz2ZzOHlBj8j0wQzyRs7DuNg
         Werlhf12WnCxzoLwZubGDmLmSuSP0vTLPYlyy/EY=
Date:   Wed, 19 Aug 2020 14:08:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     penghao <penghao@uniontech.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB HID: Add disabled wakeup from s3 by touchpad on byd
 zhaoxin notebook
Message-ID: <20200819120856.GA931936@kroah.com>
References: <20200819115101.22532-1-penghao@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819115101.22532-1-penghao@uniontech.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 19, 2020 at 07:51:01PM +0800, penghao wrote:
> BYD Notebook built-in touch pad, USB interface,so disabled,the touch pad
> device idVendor 0x0c45 idProduct 0x7056
> 
> Signed-off-by: penghao <penghao@uniontech.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 492dd641a25d..630a3cad211f 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1193,7 +1193,13 @@ static int usbhid_start(struct hid_device *hid)
>  			interface->desc.bInterfaceProtocol ==
>  				USB_INTERFACE_PROTOCOL_KEYBOARD) {
>  		usbhid_set_leds(hid);
> -		device_set_wakeup_enable(&dev->dev, 1);
> +		/*
> +		 * USB HID: Add disabled touchpad wakeup on byd zhaoxin notebook
> +		 */
> +		if ((hid->vendor == 0x0c45) && (hid->product == 0x7056))
> +			device_set_wakeup_enable(&dev->dev, 0);
> +		else
> +			device_set_wakeup_enable(&dev->dev, 1);

Shouldn't this be a quirk somewhere instead of this core check?

thanks,

greg k-h
