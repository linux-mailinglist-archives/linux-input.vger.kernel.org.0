Return-Path: <linux-input+bounces-1108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5968247E0
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 18:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D891C2420B
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 17:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355A528DA9;
	Thu,  4 Jan 2024 17:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK2X7Ewo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1ED28DA5
	for <linux-input@vger.kernel.org>; Thu,  4 Jan 2024 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d4ba539f6cso5526785ad.3
        for <linux-input@vger.kernel.org>; Thu, 04 Jan 2024 09:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704391168; x=1704995968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaQqr/ZuxLy4llS4Tns9gylHZs2nq5CTOPtyFPRDWK4=;
        b=aK2X7Ewo3pfYyLJ6jH60XtrOH1yv44vnWCUmlIMe0tA8yNfXp9BpsBA53so42ef1F6
         eHFDKjXpPekaWUWQ/UIqzUiGt1NlCvYAG+W6tYpKAerK9KeRbl694xKL/dTtx1kpEbEX
         7pP5TaRMPVPpbWHnma7OyAMsFX+hmAHCSO6+sXb1ub8o1ZSWZZubc58aJK57NYix7CjJ
         jh7cgkXQK4vND1AqKiNs6wmFnlQDWy60aMrCDklcOrc4hCMuMmiHQ8s/c4GEJkNh7cay
         du2lnn8Upd3Fwb2rdDdcSb6ugNZ9aV9DdhEmXOmNcddBwRieoaHj8dCgB0qRNBBwDjdq
         RukA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704391168; x=1704995968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaQqr/ZuxLy4llS4Tns9gylHZs2nq5CTOPtyFPRDWK4=;
        b=PYmgzju44Kx+rOCrhmf4aHdZzso6NdeM/GYv78ldLNGRpepHVStpmXSFuI/EPqp0hy
         9fHTZQIr30D0MC5ACaxhRdyArEMGj12HmF+iUV5CvaGgj8VmLbfXOt2nrOq+iJ+qdq2D
         8NEkHqs7uOR6nzADEjxozb+f1tDmtG7VFrMe/S5eSWA+irqiZhpLvMJpJpQqkZsh7wxk
         AZOOyU/IpL/Jwp7e5Wh+PhjDAue+8fpOhfcu8eqYejk/WTvdrJ/QjMG3N+9ozUr6GxMP
         +/ZdaTHrHNlvIseeEkBzZfytRzUhgE4ciEZ4evQlTaEQHm2MqX0baWX4SMYnhkPMgkbz
         iYXw==
X-Gm-Message-State: AOJu0YzGx//rQuTpP1LcIvNqQFvyiWnCS7xM2Jf0rho1d6s/8qZbCopI
	K3imybzL+28B8IxPAt4xQ/I=
X-Google-Smtp-Source: AGHT+IH9PdIVJxvFVEZV0SZdtwt868+pPV00FbK1SjcDTbTtjpUMYwtZbXKNtcrfwHXmHId3wTcSHw==
X-Received: by 2002:a17:902:ab97:b0:1d0:6ffd:e2eb with SMTP id f23-20020a170902ab9700b001d06ffde2ebmr823279plr.133.1704391168052;
        Thu, 04 Jan 2024 09:59:28 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1f9:ed78:2bc9:6dbd])
        by smtp.gmail.com with ESMTPSA id b22-20020a170902d89600b001d4b46d8c10sm8176282plz.66.2024.01.04.09.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 09:59:27 -0800 (PST)
Date: Thu, 4 Jan 2024 09:59:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, hdegoede@redhat.com, paul@crapouillou.net,
	peter.hutterer@who-t.net, svv@google.com, biswarupp@google.com,
	contact@artur-rojek.eu, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 1/2] Input: add input_invert_abs()
Message-ID: <ZZbx_Lv4kt5jvcpz@google.com>
References: <20231231205643.129435-1-macroalpha82@gmail.com>
 <20231231205643.129435-2-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231231205643.129435-2-macroalpha82@gmail.com>

Hi Chris,

On Sun, Dec 31, 2023 at 02:56:42PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add a helper function to make it easier for a driver to invert abs
> values when needed. It is up to the driver itself to track axes that
> need to be inverted and normalize the data before it is passed on.
> 
> This function assumes that drivers will set the min and max values
> so that min < max and then will simply call this function each time
> the values need to be inverted.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/input.c | 19 +++++++++++++++++++
>  include/linux/input.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 8c5fdb0f858a..f135aed165a1 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -552,6 +552,25 @@ void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
>  }
>  EXPORT_SYMBOL(input_copy_abs);
>  
> +/**
> + * input_invert_abs - Invert the abs value for an inverted axis.
> + * @dev: Input device with absolute events
> + * @axis: ABS_* value selecting the destination axis for the event to
> + *	  invert.
> + * @val: Value to be inverted based on min and max values of the axis.
> + *
> + * Return an inverted value for a given ABS axis based on its min and
> + * max values.
> + */
> +int input_invert_abs(struct input_dev *dev, unsigned int axis, int val)
> +{
> +	int min = dev->absinfo[axis].minimum;
> +	int max = dev->absinfo[axis].maximum;
> +
> +	return (max + min) - val;

I do not think this is generic enough (i.e. sometimes you have a
theoretical range in which you want to invert that is bigger than the
normal min/max - see synaptics_invert_y()), so I would prefer this be
lolcal to the ADC joystick driver, at least for now.

Thanks.

-- 
Dmitry

