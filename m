Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CED23827A2
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 10:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235814AbhEQI7c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 04:59:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:38150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235544AbhEQI7a (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 04:59:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58EB561184;
        Mon, 17 May 2021 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621241893;
        bh=hc8A8D9fFnzto48SzMasRY0xBuoa+Ue7uGSpDnxppJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ifNid6jnHCdc7IjlazvZQRUXtKDcah37RAUUZ9cCj2owKZHjRNDYPN8bu0/MPwbVd
         RCcY+QQIdt3+XvjRdk8qYmpBhWMOaFU5V8LbOkF1k4dzo95o8rk5h/gl0xJ9Ptfqcs
         2ZZgMekRAH7ScOYh/J/u4R4TOCjpSiFoEY++LBrY=
Date:   Mon, 17 May 2021 10:58:11 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Qiang Ma <maqianga@uniontech.com>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
Message-ID: <YKIwIwx+nLyX/9LG@kroah.com>
References: <20210517060145.32359-1-maqianga@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517060145.32359-1-maqianga@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 17, 2021 at 02:01:45PM +0800, Qiang Ma wrote:
> This patch enables remote wakeup by default for USB mouse
> devices.  Mouse in general are supposed to be wakeup devices, but
> the correct place to enable it depends on the device's bus; no single
> approach will work for all mouse devices.  In particular, this
> covers only USB mouse (and then only those supporting the boot
> protocol).
> 
> Signed-off-by: Qiang Ma <maqianga@uniontech.com>

Based on hardware testing, I do not think we can do this as no other
operating system does this, right?  It's not a requirement of the USB
specification to support this, so we can not enforce it either.


> ---
>  drivers/hid/usbhid/hid-core.c | 12 +++++++-----
>  drivers/hid/usbhid/usbmouse.c |  1 +
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 86257ce6d619..592aa57a97f5 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1186,11 +1186,13 @@ static int usbhid_start(struct hid_device *hid)
>  	 * In addition, enable remote wakeup by default for all keyboard
>  	 * devices supporting the boot protocol.
>  	 */
> -	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT &&
> -			interface->desc.bInterfaceProtocol ==
> -				USB_INTERFACE_PROTOCOL_KEYBOARD) {
> -		usbhid_set_leds(hid);
> -		device_set_wakeup_enable(&dev->dev, 1);
> +	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT) {
> +		if (interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_KEYBOARD ||
> +			interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_MOUSE) {
> +			if (interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_KEYBOARD)
> +				usbhid_set_leds(hid);
> +			device_set_wakeup_enable(&dev->dev, 1);
> +		}
>  	}
>  
>  	mutex_unlock(&usbhid->mutex);
> diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
> index 073127e65ac1..cf785369a5ed 100644
> --- a/drivers/hid/usbhid/usbmouse.c
> +++ b/drivers/hid/usbhid/usbmouse.c
> @@ -188,6 +188,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
>  		goto fail3;
>  
>  	usb_set_intfdata(intf, mouse);
> +	device_set_wakeup_enable(&dev->dev, 1);
>  	return 0;
>  
>  fail3:	
> -- 
> 2.20.1

How many different devices did you test this on?

thanks,

greg k-h
