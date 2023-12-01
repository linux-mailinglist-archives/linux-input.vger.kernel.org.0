Return-Path: <linux-input+bounces-370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F399F800BF5
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 14:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADEA62815CA
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 13:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A58A2D63F;
	Fri,  1 Dec 2023 13:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMXOQXid"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F95C2554A
	for <linux-input@vger.kernel.org>; Fri,  1 Dec 2023 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438D0C433C7;
	Fri,  1 Dec 2023 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701437327;
	bh=Qpt/aNUBs3S/L2cKojCHHUwbYv5eELV0YcgOZU1TGKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMXOQXidhON+jm5+n6xuu+kOTqu4R0ycQTD2qewfdiBSBDFqVQQPKY+nyYMgirEof
	 3MKlC31acfD1/9i8FlBrXve9/GZ27NXryKzAPkZlcg5iII4wGMG2s8mQVDBvzM72dy
	 uAyMzPZerMy255H2xgLj3iplnZBMiUKOnOmZUVj/tGaL6+OFHft0IuAEnBMVu0/yGD
	 8Hp6Aq5J+hgDqUQ+ZmOSPaN5EGgV59xjkUPkklU2VUAp9Azk71TUX9UArFXew84o2q
	 qwFXJz4UppDfioAZQJXLU2V7HCAi3BTZER7PNdhRrfa88waMqDhmdzAf9kaQbm3X5i
	 UrhqiZVsOGflw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r93a6-0001z3-3B;
	Fri, 01 Dec 2023 14:29:23 +0100
Date: Fri, 1 Dec 2023 14:29:22 +0100
From: Johan Hovold <johan@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pxrc - simplify mutex handling with guard macro
Message-ID: <ZWnfsjIukIbAvQ-l@hovoldconsulting.com>
References: <20231201-pxrc-guard-v1-1-38937e657368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201-pxrc-guard-v1-1-38937e657368@gmail.com>

On Fri, Dec 01, 2023 at 01:08:45PM +0100, Marcus Folkesson wrote:
> Use the guard(mutex) macro for handle mutex lock/unlocks.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>

A couple of drive-by comments below.

> ---
>  drivers/input/joystick/pxrc.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/joystick/pxrc.c b/drivers/input/joystick/pxrc.c
> index ea2bf5951d67..3c3bf7179b46 100644
> --- a/drivers/input/joystick/pxrc.c
> +++ b/drivers/input/joystick/pxrc.c
> @@ -5,15 +5,17 @@
>   * Copyright (C) 2018 Marcus Folkesson <marcus.folkesson@gmail.com>
>   */
>  
> -#include <linux/kernel.h>
> +#include <linux/cleanup.h>
>  #include <linux/errno.h>
> -#include <linux/slab.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
>  #include <linux/uaccess.h>
> +
>  #include <linux/usb.h>
>  #include <linux/usb/input.h>
> -#include <linux/mutex.h>
> -#include <linux/input.h>

Looks like an unrelated change.
  
>  #define PXRC_VENDOR_ID		0x1781
>  #define PXRC_PRODUCT_ID		0x0898
> @@ -89,25 +91,20 @@ static int pxrc_open(struct input_dev *input)
>  		dev_err(&pxrc->intf->dev,
>  			"%s - usb_submit_urb failed, error: %d\n",
>  			__func__, retval);
> -		retval = -EIO;
> -		goto out;
> +		return -EIO;
>  	}
>  
>  	pxrc->is_open = true;
> -
> -out:
> -	mutex_unlock(&pxrc->pm_mutex);
> -	return retval;
> +	return 0;
>  }

Eh, this looks obviously broken. Did you not test this before
submitting? I assume lockdep would complain loudly too.

You're apparently the author of this driver and can test it, but I fear
the coming onslaught of untested guard conversions from the "cleanup"
crew. Not sure I find the result generally more readable either.

Johan

