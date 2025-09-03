Return-Path: <linux-input+bounces-14443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB0B41470
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70293A2EDD
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 05:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93D62D6604;
	Wed,  3 Sep 2025 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HnsZhvlX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D8A28DC4;
	Wed,  3 Sep 2025 05:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756878296; cv=none; b=K2Ny7hwtqLreFZ10J6QtaVZB2L0dFFQpTAiR+RrCsjV2CfT/6kiMkOWb+t/o6OhFgFLtC79vxkA4ZE/RlUG6/wvuSZQRgEfSgOgpcM9MX7XcYoY4Of1qeibTfsbGkkzbf+4H9VPB23IRD5/Q7p52Xwa4y9KyZUzuouxXk5V+2cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756878296; c=relaxed/simple;
	bh=dnt2MEmrIvJF7XGPO77ZR3yS3QcXQoAMCyOD6LOtEyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LirpdeFDmp992EQM2XcjZMVhDJwQU3L/U0Byq3SR1GIois8Msx8lRFxv48g1D8n5uKZQE2m3mDFZqBaW/o3XUCT6XyaVj0jsGuzREU9zxnhPYQ08/nHiMmOxZW7GbZiK3L6+CyMsvypxnIhGihtqdYB6C8c0zGjHDZAwXPrptn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HnsZhvlX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9116C4CEF0;
	Wed,  3 Sep 2025 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756878296;
	bh=dnt2MEmrIvJF7XGPO77ZR3yS3QcXQoAMCyOD6LOtEyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnsZhvlXjEUg/xA8oKDrQ2oXrPsjRPW02FH4w7k2teyUJYQnHLYmmkBMxVJDtZWuZ
	 LKfMqoV4fmonLDmBJ2n6dJm4QCebGCPLC1z5Vx538TBZ2/LloTAyu0fS2VUjO2ewgw
	 mWFAvkqkBaD4bY8KedRTDK2ecpNNA6ymTcJQiKqU=
Date: Wed, 3 Sep 2025 07:44:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bhanuseshukumar <bhanuseshukumar@gmail.com>
Cc: rydberg@bitmath.org, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
Message-ID: <2025090307-oversight-amaretto-4adc@gregkh>
References: <20250902164351.36828-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902164351.36828-1-bhanuseshukumar@gmail.com>

On Tue, Sep 02, 2025 at 10:13:51PM +0530, bhanuseshukumar wrote:
> 	Debug printk messages are converted to dev_dbg based logs
> 	for better control over debug messages using dynamic logging.

Why is this indented?

> Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>

Please use your name, not your email alias.

> ---
>  drivers/input/mouse/bcm5974.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
> index dfdfb59cc8b5..2791fe0c1932 100644
> --- a/drivers/input/mouse/bcm5974.c
> +++ b/drivers/input/mouse/bcm5974.c
> @@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
>  MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
>  MODULE_LICENSE("GPL");
>  
> -#define dprintk(level, format, a...)\
> -	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
> -
> -static int debug = 1;
> -module_param(debug, int, 0644);
> -MODULE_PARM_DESC(debug, "Activate debugging output");
> -
>  /* button data structure */
>  struct bt_data {
>  	u8 unknown1;		/* constant */
> @@ -547,11 +540,12 @@ static void setup_events_to_report(struct input_dev *input_dev,
>  /* report button data as logical button state */
>  static int report_bt_state(struct bcm5974 *dev, int size)
>  {
> +	struct usb_interface *intf = dev->intf;

No need for this variable.

> +
>  	if (size != sizeof(struct bt_data))
>  		return -EIO;
>  
> -	dprintk(7,
> -		"bcm5974: button data: %x %x %x %x\n",
> +	dev_dbg(&intf->dev, "bcm5974: button data: %x %x %x %x\n",

As you are using dev_dbg(), the prefix "bcm5974:" everywhere is not
needed at all.  Just get rid of that.

As proof, look in the kernel log, now you have much more information
than before, right?

Same for the other changes in this patch, drop the prefix.

thanks,

greg k-h

