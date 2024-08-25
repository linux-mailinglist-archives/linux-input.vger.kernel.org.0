Return-Path: <linux-input+bounces-5858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4540495E509
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 22:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C133DB20F3A
	for <lists+linux-input@lfdr.de>; Sun, 25 Aug 2024 20:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34713EA9A;
	Sun, 25 Aug 2024 20:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnVrTeAo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982214A85;
	Sun, 25 Aug 2024 20:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724616832; cv=none; b=ICm8md65YWCy3vSBKIJPGX3KQOdRG1Nq0hhaZfESRX03AlPECAni7cM5yUixyCm0EBsABaYdhQq9QmQQUaHFWDvii/JICODjn1PrpvstgjekxSC3QThAJaH7dXUw9LNRb2UOgLDNCJucVNGuwfaqQGEEaN/AXnLN0CktLBfHqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724616832; c=relaxed/simple;
	bh=wIOeSreSp6y4Bkfkum6UfCwLo5NOKD2g9dtMQYJoxOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAjL63xWQOoPOudNXFt7V9qEPFlqXEj4Y+SddE7hDOG4utVLF4R15UO7aGkMHE+0nCCy8DJBGAu++cEokFmhWzG7FzGiDfhIwdzOeyRV5+EIqG74agncxYrnK0zNi9Fg9rZ5jPdCQ3moGM1MhcDS2EJWcNagNMJdiBSNyo8fH/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnVrTeAo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE0DEC4AF13;
	Sun, 25 Aug 2024 20:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724616832;
	bh=wIOeSreSp6y4Bkfkum6UfCwLo5NOKD2g9dtMQYJoxOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnVrTeAo5bD4mg9+KRryv5DqjWO9iiY97IUNzjk16TDeGTfXyulfCfSgahKWvMZwg
	 56H1O0IjyFxBSg1Q7DUtnTAXtv1cHhiqANw0N3XD4SfhIVPD983emrNsrHIwkCJQwY
	 HVrEhjP3Kk+j++oRwV3GVVmwjUrIWM94yR85dHe9LhT7HXlBFy03nCsIT2SimBouqe
	 f2mG9fIrZns2rI+WtpVbh/FP4De5WZxCOYAChnBS2oxQyZq3AE79/CMa9NYys4FUDv
	 UFE7NUgaq7q+jkEtgZN6+fsoOWhKFNo86Kamz4HCi3k+p6uQEAaxj/uRHIZUVeULEI
	 nSYS+IVwtMhVQ==
Received: by pali.im (Postfix)
	id 345ED28C; Sun, 25 Aug 2024 22:13:47 +0200 (CEST)
Date: Sun, 25 Aug 2024 22:13:47 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: alps - use guard notation when acquiring mutex
Message-ID: <20240825201347.pdphq33cmng4ltds@pali>
References: <ZsrBkWIpyEqzClUG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsrBkWIpyEqzClUG@google.com>
User-Agent: NeoMutt/20180716

On Saturday 24 August 2024 22:30:57 Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that mutexes are released in all code paths when control
> leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/mouse/alps.c | 48 +++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index d5ef5a112d6f..4e37fc3f1a9e 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -1396,24 +1396,16 @@ static bool alps_is_valid_package_ss4_v2(struct psmouse *psmouse)
>  
>  static DEFINE_MUTEX(alps_mutex);
>  
> -static void alps_register_bare_ps2_mouse(struct work_struct *work)
> +static int alps_do_register_bare_ps2_mouse(struct alps_data *priv)
>  {
> -	struct alps_data *priv =
> -		container_of(work, struct alps_data, dev3_register_work.work);
>  	struct psmouse *psmouse = priv->psmouse;
>  	struct input_dev *dev3;
> -	int error = 0;
> -
> -	mutex_lock(&alps_mutex);
> -
> -	if (priv->dev3)
> -		goto out;
> +	int error;
>  
>  	dev3 = input_allocate_device();
>  	if (!dev3) {
>  		psmouse_err(psmouse, "failed to allocate secondary device\n");
> -		error = -ENOMEM;
> -		goto out;
> +		return -ENOMEM;
>  	}
>  
>  	snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
> @@ -1446,21 +1438,35 @@ static void alps_register_bare_ps2_mouse(struct work_struct *work)
>  		psmouse_err(psmouse,
>  			    "failed to register secondary device: %d\n",
>  			    error);
> -		input_free_device(dev3);
> -		goto out;
> +		goto err_free_input;
>  	}
>  
>  	priv->dev3 = dev3;
> +	return 0;
>  
> -out:
> -	/*
> -	 * Save the error code so that we can detect that we
> -	 * already tried to create the device.
> -	 */
> -	if (error)
> -		priv->dev3 = ERR_PTR(error);
> +err_free_input:
> +	input_free_device(dev3);
> +	return error;
> +}
>  
> -	mutex_unlock(&alps_mutex);
> +static void alps_register_bare_ps2_mouse(struct work_struct *work)
> +{
> +	struct alps_data *priv = container_of(work, struct alps_data,
> +					      dev3_register_work.work);
> +	int error;
> +
> +	guard(mutex)(&alps_mutex);
> +
> +	if (!priv->dev3) {
> +		error = alps_do_register_bare_ps2_mouse(priv);
> +		if (error) {
> +			/*
> +			 * Save the error code so that we can detect that we
> +			 * already tried to create the device.
> +			 */
> +			priv->dev3 = ERR_PTR(error);
> +		}
> +	}
>  }
>  
>  static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
> -- 
> 2.46.0.295.g3b9ea8a38a-goog
> 
> 
> -- 
> Dmitry

Hello, I'm not familiar with new guards and their usage. But if this is
a preferred way for handling mutexes then go ahead.

I just looked at the code and I do not see any obvious error neither in
old nor in new version.

