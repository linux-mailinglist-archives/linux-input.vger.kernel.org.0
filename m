Return-Path: <linux-input+bounces-6157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D741D96B9EF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 13:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD44B2353C
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 11:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5AC1D0DF7;
	Wed,  4 Sep 2024 11:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL9cQWAy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181F61D7E3E;
	Wed,  4 Sep 2024 11:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448388; cv=none; b=JIz8ZBg+7MfFNwbGHVyd2BeqAjDuPppRKlMOSXHAUfdWszZu8vUe0nmtJYJFohKu6IjPClgKqGlB7+xtI6BvKh8UKwd07afOpfbsBVTiGYFWl5vOIH1vYdk2HiQ01kuE5L0BnV77+Udqw1hx3gB5gpuolGaaxOJWunu1WLaKT1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448388; c=relaxed/simple;
	bh=VLtRRPTL2Phb9vOm1lntBLpl984KB29zNPSI3XKt2nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K83dJ+COUoyV2WMZHi7rmCYMpijBcITZjuBf+624q+2u9zQ4m+ohqtS0wfPjLv1EwlThyGvOQSymSXcHBliUOHPjqjaU29hG0xz5cwUl/k1CLF6pSdohpK4d2BQtPZRlVg8ScE/jND1Qkm+ikO1MyzHqM/E1VVFcLlkhhBTMouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL9cQWAy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c241feb80dso1209283a12.0;
        Wed, 04 Sep 2024 04:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725448385; x=1726053185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgn9tsw+zmIPTpPKLRkNd2q7cPvl5aPtaDufFCCkl+4=;
        b=CL9cQWAyrMJfpNTjVRW5IdpgJigujEXXKzPtE5RQA9H4ewSSF2RXQlRO3bj2N421R3
         nT0Ei8aAZe1h8KuwuSy3RL9TCyfAndKtPkNjK4pmbRLo3GbI6/SYU4t05rjfB0URcL2x
         s1DR7bieG27TJWbAbslBulUdvgMPFsOnN3Oed0xcR5jOYRNfxyrCo25gfjLqB9KjEBHT
         tx/0M3FTljtpLrCIJKZvHjY9B1vz6MLswRdkN4KP6PKgtEGojhNuasxB1v+9aFdYWIvE
         p4x7VxY857WrHqg3AppmuJftlzdMx1lkulLM1m27uNA2rjEl5TwR1E/yrmyspCeIq+WO
         oF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448385; x=1726053185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fgn9tsw+zmIPTpPKLRkNd2q7cPvl5aPtaDufFCCkl+4=;
        b=aZS9Dx2r5Z7JbVoEmJ+TAVd40CddZMn3S0m9v/UZ7ZCUS30MMHqLGcq3h2ZkF/AyTG
         MXyOt7Yjcp6sKmvDHZYeqDgmOHffBIKarSuOVorql8ziE20/oMhU4Zs9Ip7W4zOsKiw8
         qyWy0RrHUAPWDy3Hwv0G5nkISu9vhwA2RKhGYSXI+GA/vbyzjwwwrdDu88VCFwGYyhsy
         st1gpNNmhSjrKy6dYhBfQ41DV1fOyAf+kf39EHAJ2TmGFTnsWh4gqtJ6Bpzz1JORha9b
         j3VOqiVN9OvLJ9yapUk6ZlcE26MjQY+Q2F21fLQUqpg5UDQ4Lyq+Kz51Tfvoyac7zT7Y
         Yayg==
X-Forwarded-Encrypted: i=1; AJvYcCUw7gPDbRX7XFba3ZdjUxOxLGtYVgxb/HfW2PJOE1HJmTxMI8U47/1BPw0peAgpFNMVNRdebLjdETrbpg==@vger.kernel.org, AJvYcCW+DKkmeZ+GG9tBw1SHe7v29826IVZbdtuWkQWK6PW6j+RXpQamZisL0Gyvu71TSmBy1+j7voXMPpZu/Z/8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fmYBs8jKax+AV5iOTEh3OX2NgEHZa6GevHwyCk8EfrOwym/3
	CoPITDiJ38vOGyTIjX+/E6HGb5AXv4ktw5WCbvkc9q4nRmYTsgDN
X-Google-Smtp-Source: AGHT+IH794gMr79so4fc/Of8fjqB4BrZCCpHEEFFd2FCnN/4mOB1cQ2pLFfAGRtx4I6WGIDOkTMXEA==
X-Received: by 2002:a17:907:96a9:b0:a86:6a9a:d719 with SMTP id a640c23a62f3a-a8a431998edmr147938566b.29.1725448385072;
        Wed, 04 Sep 2024 04:13:05 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989233403sm791596466b.212.2024.09.04.04.13.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 04:13:04 -0700 (PDT)
Message-ID: <a99d6ec3-b7e0-4e40-aa18-68f6eeded113@gmail.com>
Date: Wed, 4 Sep 2024 13:13:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] Input: iqs269a - use cleanup facility for fwnodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044806.1047847-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044806.1047847-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:48, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs269a.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index c34d847fa4af..1851848e2cd3 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -550,7 +550,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  			     const struct fwnode_handle *ch_node)
>  {
>  	struct i2c_client *client = iqs269->client;
> -	struct fwnode_handle *ev_node;
>  	struct iqs269_ch_reg *ch_reg;
>  	u16 engine_a, engine_b;
>  	unsigned int reg, val;
> @@ -727,8 +726,9 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs269_events); i++) {
> -		ev_node = fwnode_get_named_child_node(ch_node,
> -						      iqs269_events[i].name);
> +		struct fwnode_handle *ev_node __free(fwnode_handle) =
> +			fwnode_get_named_child_node(ch_node,
> +						    iqs269_events[i].name);
>  		if (!ev_node)
>  			continue;
>  
> @@ -737,7 +737,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u threshold: %u\n",
>  					reg, val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -751,7 +750,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u hysteresis: %u\n",
>  					reg, val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -767,7 +765,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  		}
>  
>  		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
> -		fwnode_handle_put(ev_node);
>  		if (error == -EINVAL) {
>  			continue;
>  		} else if (error) {

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

