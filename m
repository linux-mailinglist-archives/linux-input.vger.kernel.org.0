Return-Path: <linux-input+bounces-4973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 586D092EC7A
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 18:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C6AD1C21161
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 16:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C8415FCED;
	Thu, 11 Jul 2024 16:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sci.fi header.i=@sci.fi header.b="PU8kL0jB"
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-4.mail.saunalahti.fi (fgw21-4.mail.saunalahti.fi [62.142.5.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B18BFD
	for <linux-input@vger.kernel.org>; Thu, 11 Jul 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720714746; cv=none; b=kcANWBroLt/pNlOh/dgXWciUJ3G4QJOec4PUXn3B0nokmGXrHR/nhdnYTE1GR/FXpR97GH6WXK/jfFnc9tejYefpERkILrydO4ZmENhaZVQFJqA34oIt8gH/gYHR9FyYwDeYTmIPe1KmIlqFV6JJMiLU69E3yvR4VL9zAkvolGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720714746; c=relaxed/simple;
	bh=zCAjZ21UoUMwBBB1qyvpP4jCRL8vy3sea2sCKrtiIH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMcnTDMvPCo/9v8Cuis7fUPzajMA+pxrYF5+lmpy5ZH8aKjY6PPx6y5AviO7lKryoHn91gWPWMWuQG1Wu070PNlvnCRAhQF12jEjm8POrf86UsoJOI8pR/EziWYBfT4RedL0lgX6s0WLPP1es60Likcrde4b9WOc8nPBzfoNnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sci.fi; spf=pass smtp.mailfrom=sci.fi; dkim=pass (2048-bit key) header.d=sci.fi header.i=@sci.fi header.b=PU8kL0jB; arc=none smtp.client-ip=62.142.5.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sci.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sci.fi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sci.fi; s=elisa1;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:feedback-id:from:to:cc:reply-to:subject:
	 date:in-reply-to:references:list-archive:list-subscribe:list-unsubscribe:
	 content-type:content-transfer-encoding:message-id;
	bh=QLwqgHRZ6lSOojwMebwwsVWAh74G0Lu0nm5wRXcRVSI=;
	b=PU8kL0jBK8cZIcMZFYjysq11i8gTTRmK+OaD5MQ5ojwXdHGIxiqM+mzN7t9y6ADyZU0q/VsJ9ia5j
	 VImah3lSvSFSXoKGGmHA2EyGWAcQzNj89Lxvr9YVCo0NBmeMKaEkT5Paif0HbDY4Lmyk4kv/UIhgb1
	 kV6tTwPfXwJ8xIaKdcRG8Y+Bl8pVvd1Zj+JB5RV1Fc8EYGkIu/PKjU+MQdsOFKAR5Ij+KxYaGKn7y4
	 uvXXHkPhdeKwm8wIE/XY7s6pojAh0QLHrTO5oaCi7E8C3AobFlKn2vjjfzUY6IfUKG6QuFVsrE3tBR
	 1SyqVnUE+H7MUJrA3q2p0kLOiVXtn2Q==
Feedback-ID: 91b3a81a:25bf58:smtpa:elisa
Received: from sci.fi (89-27-49-32.bb.dnainternet.fi [89.27.49.32])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTPSA
	id 44a41fc4-3fa1-11ef-8dbd-005056bd6ce9;
	Thu, 11 Jul 2024 19:18:55 +0300 (EEST)
Date: Thu, 11 Jul 2024 19:18:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Input: ati-remote2 - use driver core to instantiate
 device attributes
Message-ID: <ZpAF7gqeF589IkTA@sci.fi>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <Zo8gaF_lKPAfcye1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo8gaF_lKPAfcye1@google.com>

On Wed, Jul 10, 2024 at 04:59:36PM -0700, Dmitry Torokhov wrote:
> Instead of manually creating driver-specific device attributes
> set struct usb_driver->dev_groups pointer to have the driver core
> do it.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/ati_remote2.c | 50 +++++++++++---------------------
>  1 file changed, 17 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
> index 946bf75aa106..795f69edb4b2 100644
> --- a/drivers/input/misc/ati_remote2.c
> +++ b/drivers/input/misc/ati_remote2.c
> @@ -204,26 +204,7 @@ struct ati_remote2 {
>  	unsigned int mode_mask;
>  };
>  
> -static int ati_remote2_probe(struct usb_interface *interface, const struct usb_device_id *id);
> -static void ati_remote2_disconnect(struct usb_interface *interface);
> -static int ati_remote2_suspend(struct usb_interface *interface, pm_message_t message);
> -static int ati_remote2_resume(struct usb_interface *interface);
> -static int ati_remote2_reset_resume(struct usb_interface *interface);
> -static int ati_remote2_pre_reset(struct usb_interface *interface);
> -static int ati_remote2_post_reset(struct usb_interface *interface);
> -
> -static struct usb_driver ati_remote2_driver = {
> -	.name       = "ati_remote2",
> -	.probe      = ati_remote2_probe,
> -	.disconnect = ati_remote2_disconnect,
> -	.id_table   = ati_remote2_id_table,
> -	.suspend    = ati_remote2_suspend,
> -	.resume     = ati_remote2_resume,
> -	.reset_resume = ati_remote2_reset_resume,
> -	.pre_reset  = ati_remote2_pre_reset,
> -	.post_reset = ati_remote2_post_reset,
> -	.supports_autosuspend = 1,
> -};
> +static struct usb_driver ati_remote2_driver;

Would be easier to see what's actually happening if
the rearrangement of the forward declarations was a
separate patch.

Otherwise lgtm
Reviewed-by: Ville Syrjälä <syrjala@sci.fi>

>  
>  static int ati_remote2_submit_urbs(struct ati_remote2 *ar2)
>  {
> @@ -791,10 +772,7 @@ static struct attribute *ati_remote2_attrs[] = {
>  	&dev_attr_mode_mask.attr,
>  	NULL,
>  };
> -
> -static struct attribute_group ati_remote2_attr_group = {
> -	.attrs = ati_remote2_attrs,
> -};
> +ATTRIBUTE_GROUPS(ati_remote2);
>  
>  static int ati_remote2_probe(struct usb_interface *interface, const struct usb_device_id *id)
>  {
> @@ -861,13 +839,9 @@ static int ati_remote2_probe(struct usb_interface *interface, const struct usb_d
>  
>  	strlcat(ar2->name, "ATI Remote Wonder II", sizeof(ar2->name));
>  
> -	r = sysfs_create_group(&udev->dev.kobj, &ati_remote2_attr_group);
> -	if (r)
> -		goto fail3;
> -
>  	r = ati_remote2_input_init(ar2);
>  	if (r)
> -		goto fail4;
> +		goto fail3;
>  
>  	usb_set_intfdata(interface, ar2);
>  
> @@ -875,8 +849,6 @@ static int ati_remote2_probe(struct usb_interface *interface, const struct usb_d
>  
>  	return 0;
>  
> - fail4:
> -	sysfs_remove_group(&udev->dev.kobj, &ati_remote2_attr_group);
>   fail3:
>  	ati_remote2_urb_cleanup(ar2);
>   fail2:
> @@ -900,8 +872,6 @@ static void ati_remote2_disconnect(struct usb_interface *interface)
>  
>  	input_unregister_device(ar2->idev);
>  
> -	sysfs_remove_group(&ar2->udev->dev.kobj, &ati_remote2_attr_group);
> -
>  	ati_remote2_urb_cleanup(ar2);
>  
>  	usb_driver_release_interface(&ati_remote2_driver, ar2->intf[1]);
> @@ -1032,4 +1002,18 @@ static int ati_remote2_post_reset(struct usb_interface *interface)
>  	return r;
>  }
>  
> +static struct usb_driver ati_remote2_driver = {
> +	.name       = "ati_remote2",
> +	.probe      = ati_remote2_probe,
> +	.disconnect = ati_remote2_disconnect,
> +	.dev_groups = ati_remote2_groups,
> +	.id_table   = ati_remote2_id_table,
> +	.suspend    = ati_remote2_suspend,
> +	.resume     = ati_remote2_resume,
> +	.reset_resume = ati_remote2_reset_resume,
> +	.pre_reset  = ati_remote2_pre_reset,
> +	.post_reset = ati_remote2_post_reset,
> +	.supports_autosuspend = 1,
> +};
> +
>  module_usb_driver(ati_remote2_driver);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 
> 
> -- 
> Dmitry

-- 
Ville Syrjälä
syrjala@sci.fi
http://www.sci.fi/~syrjala/

