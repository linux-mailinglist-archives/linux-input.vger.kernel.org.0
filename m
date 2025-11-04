Return-Path: <linux-input+bounces-15876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 169DEC2F83D
	for <lists+linux-input@lfdr.de>; Tue, 04 Nov 2025 07:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D88BD42126F
	for <lists+linux-input@lfdr.de>; Tue,  4 Nov 2025 06:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F18C2E11D1;
	Tue,  4 Nov 2025 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD5GxAfR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5832DFF3F
	for <linux-input@vger.kernel.org>; Tue,  4 Nov 2025 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762239160; cv=none; b=QtBvh8rOA2jkhpY5PuBjByJajtyHU2J95lZQatUcJEXa/QZkUW4jvN5CaniM2gHeROfWlwHO6lAH7ZTAcCWYq8FHbZrtfLSVkCLXnJRYQZDu36jNx+HewxXe6pgA3X759icT+oK/2ps78TRslVnTuetEKzlWvwCAXLExeMJJKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762239160; c=relaxed/simple;
	bh=FkVSx0brkAi3wM3etFadZQOnS2YT5u/trHUqyfpuF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBwc21FA+Ek9hqu3QYV01vudUeQNZHgHEp6VVxKo3eqy43Svd5hAIbRnxrgdhe8i9+e/pkWBeHuAVaPTz1B7R5KVvRPmL21U6+jzGIT3/r/fjiyUuUlXqkHK9uCHDKjvOegzqjhHmWzv6VKStbjcxu+Sjtiw4woKj/sJk6k065g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD5GxAfR; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso1019661a91.0
        for <linux-input@vger.kernel.org>; Mon, 03 Nov 2025 22:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762239158; x=1762843958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zIkdUqODfOw8gd3ff2/nv6ULtzZ+c6+F0JiAwTHIGtM=;
        b=QD5GxAfRrQ05/5Sly4QMUEeNsCNDLd4D39/1X7CBuKd0c0HVTyRU1/C7tPl23K8VDv
         +KT6wf6YtK0DHxcqZrhnzqgN6W2rrJYCrCSR4myAn7JLjGd+Wk0807IGFPVWZ4jLYb2d
         AsFf8B1r+MGp6n1bcogLTCeZok7VLGsGZKFi/vjdriTI3REdf4BJFQUbpGmtKS19TpnY
         UxCIYAuNkekw2rgaKrSuEbFIVlDFjdjVRpm+VQGsehoZRSGQjNFP0b20JzeIqs0dgLlP
         6YgNr44kNSXF8Xf+gfa6GTJb23gDT+2o7HUd2i/YJBhCtOcGbPn07jYkTgbsuM8P999l
         RMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762239158; x=1762843958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIkdUqODfOw8gd3ff2/nv6ULtzZ+c6+F0JiAwTHIGtM=;
        b=I2Pl28/zuLlmL5s+kDXb+IgMxt1Rkkc/yxiNvtNWBXysUNEgL+pQz8Pr6l9VSR5hA9
         bD5DYTLkdojDioZVq3XMEGpO7lsROdpIER+/iRSphtx8Dkwozsxo/o305HcynSWsGwQ0
         6EWcssP0uEFVgghKgZJJjpDmBFnhmjj7rh2HWsi9gy7VD7t6INbP8wFbldxVb7cMfKQd
         ziMjc4r/hsx5TOhgRmTAmXtupTaI41SMuYOF8ueoOTKqF30cfeBqreudGqD/RykNWrJg
         RQeF94j+qCTXv6m9CpukMd8l983F4nGwzb0wPpPU9FfEib75+63O66MrBijHITYnNBME
         ySvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWReE2KiVhHdl7ruEKUVMQGaeKgpuHuo6h3wbSp6tEs75jnRZ7YfEvWATP3nIuL6TE0oC7kwagHFMhziw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzNYWeKrJoKw+fK7y0sSjD9NSgLGrrrY/S+fdla9vtxmD+qYTV
	qrtFzG5XH68Pq8kTcfnS9dY1pDQt83qFfqc3+c0TmZhhckHPk9jks0M+
X-Gm-Gg: ASbGncuKUfZD9CHWsLwk6GDu4ilh3d2d+TX790Kt+aHBTEkfYsrNoZ0hESTbNWM54b9
	RN2ZIH/AjiJ0drZzfrBKUADynO7ozCxL7EzN5lOAWRdHShxzUOPy7V2/xnJXqoYeqvnbIIo+5LU
	AnbRILBVrhX82L34Dq/sTzE9x2wWnPLOr15TWkKu6WbtD3YYctJu0Uqe8zg1U6GudZ1kHzIUOFN
	Jv1tpsEmJ7NchUIPDs9GbE27AWPneWebS7Yq0cL8UqVSAJtShGZ5agYoQ6ah9VgcycK7HzW7gKq
	SE4Kn0PYD6LCjcpFSq6lLk7djDFta7hNq6x+vcXXOxNLVRpNhWZ0ewBl0y9xFgEqO6qPUvsolhp
	u42H+iP8tQbm2k2b+06jYoqYsx37taACVxsHy6bGmtDQ9dJiJVmTiy1J0k2xMEmGn/nRR7Uaxk+
	lFuJKGjx0CiKM5jpXET+ecBVyC3WXtdz/eKmL8HeI1qg==
X-Google-Smtp-Source: AGHT+IFSmco6HSPi6m1DVchdg1bmfnqGjZC8lXy+DIksGsNr3zNzYPNb2jyRRf1A92QFgeFIXwfAjQ==
X-Received: by 2002:a17:902:ce83:b0:295:24ab:fb08 with SMTP id d9443c01a7336-29524abfc65mr187010795ad.47.1762239158395;
        Mon, 03 Nov 2025 22:52:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:1f2a:f7de:951a:621a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a3a80esm14183105ad.73.2025.11.03.22.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 22:52:37 -0800 (PST)
Date: Mon, 3 Nov 2025 22:52:35 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] Input: cros_ec_keyb - Fix an invalid memory access
Message-ID: <54pq37etkmtdwuckfxuprfikhmmoy2fzxjulas7uywqdbfiw2z@qquunvgrcqyw>
References: <20251104064353.3072727-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104064353.3072727-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Tue, Nov 04, 2025 at 06:43:53AM +0000, Tzung-Bi Shih wrote:
> If cros_ec_keyb_register_matrix() isn't called (due to
> `buttons_switches_only`) in cros_ec_keyb_probe(), `ckdev->idev` remains
> NULL.  An invalid memory access is observed in cros_ec_keyb_process()
> when receiving an EC_MKBP_EVENT_KEY_MATRIX event in cros_ec_keyb_work()
> in such case.
> 
>   Unable to handle kernel read from unreadable memory at virtual address 0000000000000028
>   ...
>   x3 : 0000000000000000 x2 : 0000000000000000
>   x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>   input_event
>   cros_ec_keyb_work
>   blocking_notifier_call_chain
>   ec_irq_thread
> 
> It's still unknown about why the kernel receives such malformed event,
> in any cases, the kernel shouldn't access `ckdev->idev` and friends if
> the driver doesn't intend to initialize them.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index f7209c8ebbcc..635ee99fe0bd 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -261,6 +261,11 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  	case EC_MKBP_EVENT_KEY_MATRIX:
>  		pm_wakeup_event(ckdev->dev, 0);
>  
> +		if (!ckdev->idev) {
> +			dev_info(ckdev->dev, "No key matrix\n");

I think this should be dev_warn_once().

> +			return NOTIFY_OK;
> +		}
> +
>  		if (ckdev->ec->event_size != ckdev->cols) {
>  			dev_err(ckdev->dev,
>  				"Discarded incomplete key matrix event.\n");


Thanks.

-- 
Dmitry

