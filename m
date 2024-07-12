Return-Path: <linux-input+bounces-4994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDACE92F620
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C8F1F22096
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EE713CAA3;
	Fri, 12 Jul 2024 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rSzzModr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38BF1C2E;
	Fri, 12 Jul 2024 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769223; cv=none; b=ixoGYeNcUClIsrdO3eIrpqXQHaeQnWJJX3LpbTg6kBa1Q52IxCcOnjVrmtIpTX52S1SW7pSL1fDoCHHYeLTM5BbfNOzW1fZ25y3SWIwnUW1vdEEEOMGWB4qt9IBbSphQbqSTkOtc7IS86Nv9oIJ279WRSrd92fF71VpV7govXbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769223; c=relaxed/simple;
	bh=zfbcigIXQXot35d9I1tD3rTsDfZWGPP55UHdMP98rcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2kf3f/8P/+yiaTlcxy7723j25067gTP1RcxievCmyhadUUnSoMnkcVj+yR/DFuLExCNMvgwIPwJlPv3t8ROzj9CyEGTZaNr/vNIL9i4wyDm25YV2vA8MarDPmc6ylRelpI8wPQ9mnex6Ar+jlWbEj4qhYcJxdRs6sB013rE1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rSzzModr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AAEC3277B;
	Fri, 12 Jul 2024 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769223;
	bh=zfbcigIXQXot35d9I1tD3rTsDfZWGPP55UHdMP98rcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSzzModr+pK9P1DgB13eKvL7Dv+3wBAyPcfI4J9xPC5qDL2IKslvTxzq8qnWRAx7z
	 Mi+dFjyNQW9V8YiPp4i2j7N+wc/UFIvW1HLHzpYdykmZzIKX6tydl7CgbhNLC1Giiu
	 jnzOqnQmelh25eOEcmOI1cWO7UJd0Vdx45/hZblc=
Date: Fri, 12 Jul 2024 09:27:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] Input: usbtouchscreen - switch to using __free()
 cleanup facility
Message-ID: <2024071246-moaning-galore-7830@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-8-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-8-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:50PM -0700, Dmitry Torokhov wrote:
> Use __free(kfree) cleanup facility when allocating temporary buffers
> for USB transfers.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 90 ++++++++--------------
>  1 file changed, 33 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 0015f0a6de01..7567efabe014 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -167,9 +167,8 @@ static const struct usbtouch_device_info e2i_dev_info = {
>  
>  static int egalax_init(struct usbtouch_usb *usbtouch)
>  {
> -	int ret, i;
> -	unsigned char *buf;
>  	struct usb_device *udev = interface_to_usbdev(usbtouch->interface);
> +	int ret, i;
>  
>  	/*
>  	 * An eGalax diagnostic packet kicks the device into using the right
> @@ -177,7 +176,7 @@ static int egalax_init(struct usbtouch_usb *usbtouch)
>  	 * read later and ignored.
>  	 */
>  
> -	buf = kmalloc(3, GFP_KERNEL);
> +	u8 *buf __free(kfree) = kmalloc(3, GFP_KERNEL);
>  	if (!buf)
>  		return -ENOMEM;
>  
> @@ -191,17 +190,11 @@ static int egalax_init(struct usbtouch_usb *usbtouch)
>  				      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
>  				      0, 0, buf, 3,
>  				      USB_CTRL_SET_TIMEOUT);
> -		if (ret >= 0) {
> -			ret = 0;
> -			break;
> -		}
>  		if (ret != -EPIPE)
>  			break;
>  	}
>  
> -	kfree(buf);
> -
> -	return ret;
> +	return ret < 0 ? ret : 0;

Personally I hate ? : usage, but it's your subsystem and it's used
elsewhere in this file, so you have to live with it :)

>  }
>  
>  static int egalax_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
> @@ -358,10 +351,9 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
>  {
>  	struct usb_device *udev = interface_to_usbdev(usbtouch->interface);
>  	struct mtouch_priv *priv = usbtouch->priv;
> -	u8 *buf;
>  	int ret;
>  
> -	buf = kzalloc(MTOUCHUSB_REQ_CTRLLR_ID_LEN, GFP_NOIO);
> +	u8 *buf __free(kfree) = kzalloc(MTOUCHUSB_REQ_CTRLLR_ID_LEN, GFP_NOIO);
>  	if (!buf)
>  		return -ENOMEM;
>  
> @@ -373,18 +365,13 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
>  	if (ret != MTOUCHUSB_REQ_CTRLLR_ID_LEN) {
>  		dev_warn(&usbtouch->interface->dev,
>  			 "Failed to read FW rev: %d\n", ret);
> -		ret = ret < 0 ? ret : -EIO;
> -		goto free;
> +		return ret < 0 ? ret : -EIO;
>  	}
>  
>  	priv->fw_rev_major = buf[3];
>  	priv->fw_rev_minor = buf[4];
>  
> -	ret = 0;
> -
> -free:
> -	kfree(buf);
> -	return ret;
> +	return 0;
>  }
>  
>  static int mtouch_alloc(struct usbtouch_usb *usbtouch)
> @@ -636,24 +623,23 @@ static const struct usbtouch_device_info gunze_dev_info = {
>  static int dmc_tsc10_init(struct usbtouch_usb *usbtouch)
>  {
>  	struct usb_device *dev = interface_to_usbdev(usbtouch->interface);
> -	int ret = -ENOMEM;
> -	unsigned char *buf;
> +	int ret;
>  
> -	buf = kmalloc(2, GFP_NOIO);
> +	u8 *buf __free(kfree) = kmalloc(2, GFP_NOIO);
>  	if (!buf)
> -		goto err_nobuf;
> +		return -ENOMEM;
> +
>  	/* reset */
>  	buf[0] = buf[1] = 0xFF;
>  	ret = usb_control_msg(dev, usb_rcvctrlpipe (dev, 0),
> -	                      TSC10_CMD_RESET,
> -	                      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> -	                      0, 0, buf, 2, USB_CTRL_SET_TIMEOUT);
> +			      TSC10_CMD_RESET,
> +			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
> +			      0, 0, buf, 2, USB_CTRL_SET_TIMEOUT);

Unintentional whitespace change?

Anyway, not a big deal, cleanup looks good:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

