Return-Path: <linux-input+bounces-14474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA3EB43AE0
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 13:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDEF51C272BB
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 11:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C452B2FCBFF;
	Thu,  4 Sep 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij9mIURC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CA42F9C2C;
	Thu,  4 Sep 2025 11:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756987090; cv=none; b=aaatqv/LbUG1Szm1sKkrRzsUZKxKM+6bl2MHTFFJMk+9eYN3a06QlgvGKwxumJPSDEOZMPffSRtEs1TlbQGt8Yhy0EDuKHewDmAeJ+eUbUc+qOtJpVDsRA4THqmQYRstXTKkuePmfgM7LTRm3Wjnwlc4GFKXGLP8Vj0hvYGvadM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756987090; c=relaxed/simple;
	bh=tATAdd7QzloSVi9rWZgMv3zaCJnGVv99/EXyM7XWqZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYVAvLaJz+VDDA32c6hS5iFJfvsub0b86erC7L2nV1YUxQM1+dY58fPlVqmVLO1qH3IJvOdky9uKjI16x65OQw+HQMN9SrFizsqLwAI7ZWOOryjIYjh027LYBBmzrJ9FrJ1VTr3VbVHRTrUQqlqdV+++tXeCva1nPfA2M735so0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij9mIURC; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24cd340377dso2245195ad.1;
        Thu, 04 Sep 2025 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756987088; x=1757591888; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Pj9Rbb/L1TaHYcKBCDlyOBLhhs01TGFvbTqDDZZhC4=;
        b=Ij9mIURCnDNbl9PlkZSEFe5Hx13d0fGoBEggh8cFMk2Ya3HSlf+xo2OBlsDl8EZZJZ
         i4vmTdGKj/jDOb0s2G4h0bUL6Wk19ov8EOpqbvOCgipdRJN6v5zDqBtiQIUTjlcLq7zp
         RCL5N5uDbE19Mi1OVjkW+p/Q0hgsobksG1Qm5T27zQ5lznlZgvXJAzVtM3kMXc6AUlWE
         zORHjdVACxXcup+eIn5eArEmheGnp1OVyftTaNv22KBkAxA38r4NdqxHp0c1JAZ9sD85
         8exC8ijJDCNg/cJbxw++zcj0C4VZERQgO9B4x0ivRtTvO3PFxvVRtdM2TvEOI+JMxh57
         EPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987088; x=1757591888;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Pj9Rbb/L1TaHYcKBCDlyOBLhhs01TGFvbTqDDZZhC4=;
        b=Gg+Skln9AqRC/UlgB4L/Tm1xXXQSx51onaSG7IzjfFXC5ihCxjaKDGsPUBZGhefsRW
         bBEi+WebYG57G3dwN3Fe7NfVNTW/rI1GxIo69cRnlbUjNNNM41YbwrJK1WC7wRQWj0ym
         6MdagDSLp3DFX3BUd1Qztye1BejUSJO/6vpnogNepUaf9/nDsD3CBBfwZgR3sPjYXrCh
         tIe5fTdLxO2v5PgnX7AcKkIY6n4RHvpJN4zASwX0hgYo/5wmWWiYJnLRZ3+6hLjiBrS0
         tYFiCAz6g1nGLqd2AkxmhhZsJcTjJsKVzoFETGUFurJUSIHmCXrsU4b45iI0ga67JyOm
         GZSw==
X-Forwarded-Encrypted: i=1; AJvYcCUtQRaBC2T44Y6DmLYCyqC4mA7t3ofVM5JH46T4O7q6TIKqwBCY8Z/UAbilnsgTX2mkkhk8qrzdC1LAKMJ3@vger.kernel.org, AJvYcCV2cXNY+TYJeSnS8PPan2RSOuekB1CHYbFY61nlEb9qF+pcGp2Wz+VKmxv+ZSsPLCwUykPWydO4SbpP@vger.kernel.org, AJvYcCVJS1ec2Gr3YyvG6q6XQXrm2QTcFhba0YufGMHXdpLVzVN+AHuSF9poKjtHqC64ssjHlZMxh6eAM1vu73s=@vger.kernel.org, AJvYcCWNaxt0cu7odmz5m3zDdfFyBKH4WVu4JfHajv6V1pm2orcxDs9KYEjO6h0+ZaPxldV9GVoCUHXv/V/eQ3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMW97ZVfHenRqMm0UC/TLJIEs7TtH6WEoGqpCAJKXz7wpIY8C
	+0kLR+4GLzj4FXPpIwcsTdN3/63FUtO4jLgqrl7nCRls5cMNcB6TRcCA
X-Gm-Gg: ASbGnctQiu6I5fEKD7oyLIO41Cdbne4coViKo0tdjN9+TiuNm+8KbadtL+FtFFR64YR
	C/cJhDHebDqV1uzyX9k/+nNUHrmFL+Jv8XSdAMYA57a+5M2w+VjjD4kNwe2J39/tcWMRjxID7oP
	b7l3sylBm3pj7a+sOIOuSAM2fKYrGhmVlyTP1h7xAftSixvukXSXWXDXdGqezaBSA8pHXdF/IOR
	Ejuo95Yl3Z6PZBcnrSL/GHCEFqs9hfgUJktsXJWtn7q6PMFedu7ZzG/B//blw1w4ZjrRiB7BSxz
	Js0lYZRzsYsppqLx65K+NN3Yj8xoOEv8hwxJJxx5b+sd8lV8PoTfIIlKly4wjbgmCndBKuPds2c
	7L9aQh7rf3rHIeaR8ZxdPp70=
X-Google-Smtp-Source: AGHT+IEywwoOozpv7rN+XI2LuxYw5YAulyQKJc60fWfypt28B7vos4U96NKKRXKORY1kAm/Eb5L6qg==
X-Received: by 2002:a17:902:db03:b0:249:c66:199e with SMTP id d9443c01a7336-24944a177fbmr249151225ad.26.1756987088248;
        Thu, 04 Sep 2025 04:58:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249037223d7sm182682615ad.32.2025.09.04.04.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:58:07 -0700 (PDT)
Date: Thu, 4 Sep 2025 04:58:05 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v1 1/2] input: rmi4: fix RMI_2D clipping
Message-ID: <75wc4lutipb7uszkqfuakjl7iqsygjif4df5phosifkgi3serc@t75jpefbbbcs>
References: <20250903161947.109328-1-clamor95@gmail.com>
 <20250903161947.109328-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903161947.109328-2-clamor95@gmail.com>

Hi Svyatoslav,

On Wed, Sep 03, 2025 at 07:19:45PM +0300, Svyatoslav Ryhel wrote:
> From: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> 
> The physical max_y value was overridden with a clip_y_max value. This
> caused problems when inverting/flipping the screen. Further it messed up
> calculation of resolution.
> 
> Signed-off-by: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/rmi4/rmi_2d_sensor.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_2d_sensor.c b/drivers/input/rmi4/rmi_2d_sensor.c
> index b7fe6eb35a4e..b4762b3c8b24 100644
> --- a/drivers/input/rmi4/rmi_2d_sensor.c
> +++ b/drivers/input/rmi4/rmi_2d_sensor.c
> @@ -56,7 +56,7 @@ void rmi_2d_sensor_abs_process(struct rmi_2d_sensor *sensor,
>  		obj->x = min(sensor->max_x, obj->x);
>  
>  	if (axis_align->clip_y_high)
> -		obj->y =  min(sensor->max_y, obj->y);
> +		obj->y =  min(axis_align->clip_y_high, obj->y);
>  
>  	sensor->tracking_pos[slot].x = obj->x;
>  	sensor->tracking_pos[slot].y = obj->y;
> @@ -149,13 +149,12 @@ static void rmi_2d_sensor_set_input_params(struct rmi_2d_sensor *sensor)
>  
>  		sensor->min_y = sensor->axis_align.clip_y_low;
>  		if (sensor->axis_align.clip_y_high)
> -			sensor->max_y = min(sensor->max_y,
> +			max_y = min(sensor->max_y,

I see that you want to have sensor->max_y to carry maximum coordinate
the sensor is capable of reporting, so that flipping works properly. If
this is the case you should also be deleting sensor->min_y and always
use 0 in its place, otherwise there is inconsistency.

You also need to deal with X coordinate in the similar fashion.

>  				sensor->axis_align.clip_y_high);
>  
>  		set_bit(EV_ABS, input->evbit);
>  
>  		max_x = sensor->max_x;
> -		max_y = sensor->max_y;

This makes max_y potentially uninitialized.

>  		if (sensor->axis_align.swap_axes)
>  			swap(max_x, max_y);
>  		input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_x, 0, 0);

I am unconvinced that using raw sensor coordinates to calculate
resolution is a good idea. It has potential to regress existing users. 

Thanks.

-- 
Dmitry

