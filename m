Return-Path: <linux-input+bounces-10752-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59805A5F01E
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 11:01:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361FE18917D4
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 10:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6061EE028;
	Thu, 13 Mar 2025 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FXB3tNTA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711041D5175;
	Thu, 13 Mar 2025 10:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741860069; cv=none; b=Mt4zTKRCysWS/2FLAXesLEA+QuFz06FwzCswTtqCZ/EenU2xKXO9VlINE8Ol0SaIP6j4kaKGW6wUigrqZ/wofIBOhrl7hi5wBJpJ9CSSmaAkgMjRO88191QWn7sB58E8IBSdW84rKF08NMaN4IXwi1F7OGY2Gl347+6XMUmVuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741860069; c=relaxed/simple;
	bh=16WhtlFUHkoIkrsFEIZFleNHV7u2hxufNBAPqiGf4+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDLTZdAkYR1Tp4zFBjWueojZGBuWlrkRpjglFSZgspH/PQAC1HPbUG7kgwfp91KAFPBd/NCZ5FRvgcpRo2lNyV06hNZHB0NmTqADeNqAfzC0SM8mGL7+t4RGo7furdCOsN6qsXJaraY9Rewww9ta2RqxfgpSnXnEZ92ZXoq8Kgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FXB3tNTA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C5FC4CEDD;
	Thu, 13 Mar 2025 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741860068;
	bh=16WhtlFUHkoIkrsFEIZFleNHV7u2hxufNBAPqiGf4+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXB3tNTA4HeQ6FgVgsaZwb2fBUweUu3n7bpy37g+AXPGInkeyEicYrYgk4V/ivmVN
	 iMSqdh73i1Gr/lr4AXk2OZbiSRWRLaOltt4riPiRSx3Nw35BmCZkhrgUb6b1w3ZS2K
	 6Yxp4LqfLqjrg+UtU0M+g6CO9x+c1FsvsSL5e32E=
Date: Thu, 13 Mar 2025 11:01:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: dmitry.torokhov@gmail.com, bentiss@kernel.org, jeff@labundy.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, stable@vger.kernel.org
Subject: Re: [PATCH] Input: fix error handling in input_register_device()
Message-ID: <2025031350-nutty-gatherer-3e69@gregkh>
References: <20250313083803.307646-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313083803.307646-1-make24@iscas.ac.cn>

On Thu, Mar 13, 2025 at 04:38:03PM +0800, Ma Ke wrote:
> Once device_add() failed, we should call put_device() to decrement
> reference count for cleanup. Or it could cause memory leak.
> 
> As comment of device_add() says, 'if device_add() succeeds, you should
> call device_del() when you want to get rid of it. If device_add() has
> not succeeded, use only put_device() to drop the reference count'.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0cd587735205 ("Input: preallocate memory to hold event values")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/input/input.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index c9e3ac64bcd0..2e70f346dadc 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2424,6 +2424,7 @@ int input_register_device(struct input_dev *dev)
>  err_device_del:
>  	device_del(&dev->dev);
>  err_devres_free:
> +	put_device(&dev->dev);

Did you test this?  This is not going to work properly for all places
that call this label.

While these types of fixes are nice to have, PLEASE TEST THEM!!!!

Stop doing these and verify, by actual tests, that they do what you
think they are doing before sending any more of them.  As it is, this
stream of "fixes" is just too full of bugs for any of us to trust them
at all.

thanks,

greg k-h

