Return-Path: <linux-input+bounces-13813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E92B1AA2A
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 22:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94DE63AD5FF
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 20:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30D921ABB7;
	Mon,  4 Aug 2025 20:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDLK6fjp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7AB1514DC;
	Mon,  4 Aug 2025 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339675; cv=none; b=lVy/QX3gIPcIgJDscnYAO3/y+eQ3zeegD2lhsU5vMsPyjo3FC00xfgqtiTH/6tE48CA02Uw0hZUtWGRAo1VkO1TPQR7tSwRbmCkfK6QgadvyjHIle4WgJ4HHlSu8r76Fl/CFkWfSMsp35E9tPN2BpZHfQvRQLxueVbblG81mdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339675; c=relaxed/simple;
	bh=aFaOa2nGM5Q3uPPRO16YP0XF7Ypng7eIUNeMf++wgfs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t/hQJV+Oa0eomVNE9DAP+ZnSk+KPukG+bgseAFXSeMze9PPaqujuegLJYz/L2dU9u78e1yv26MLxdL3f7kgLp24GiKXBoI+jCF5wzcV3xITOTHsihUSK0/cautbkXP1ZvN5y+Q6CdaW1Y5uUwZaVxeCaiEPyxR0Nz+2nbHV6uhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDLK6fjp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af93d0b30b3so46980766b.3;
        Mon, 04 Aug 2025 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754339672; x=1754944472; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqD1ra2n4lZ3jZof4VftfRTNQj034wwtLZZ/lR+I1yo=;
        b=bDLK6fjpCdDqsfGcoh4KNfmumvLeawCpPyuFzd3gHNHgLPyN6G3MPmAC49HdI7E+WO
         cVy1zdAh041hl3VIC1seVB9h+OyFPmi7BTIJyA0MpmdDISwsz6GUJirUvXuNsn3fh13O
         opTuUp8zbNPl70MRWmY8Wmr+9h0LO5Yyf1exrPxq6wpKU34HttE2WlW8H14kuNF3A+ht
         ziZ/6ulyBA9KuhpkaT1IgTJGclUnUX1ij8ON6jziaZVG+37K/wm8ZMyJrsMmqbxuH8mR
         JKA7281P6oKP+SRu6jK9bjaCZ4NzOZNxLEyRUS7FKwvd/7hdr7KRweaA/Er4Y1RyErHO
         sHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754339672; x=1754944472;
        h=mime-version:user-agent:content-transfer-encoding
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqD1ra2n4lZ3jZof4VftfRTNQj034wwtLZZ/lR+I1yo=;
        b=ES07xd5PufocjPU7qnGKiZHLh8p9Wbg3QhVT0KpCl5sogJlg+VNAdwUllIORq92Irm
         kWpWQ9E3wiLL/bd8lZ5PaC1ZLFtvCWI6cBr0kJNF0PZ8z44o57ZwhqC5ZKVIbKTIyQ8y
         YWZzHBv5OAHL2sgO4AlM5xQljOg5GJ3bYxSNqGzKanX3oliJ9OGLXPwpDeLAnJ/OA8zQ
         DJ6FnJ//UVr4bJ9A2J7TB5nY2O4lu4X0Lj48VdoGQzenSkHhHQ3EQ+GQaT5VXccI/VQ1
         Tbgz4Vak2Z44PHesaVuNDeq1xfvPDZu0pUpt3oLTuTC8R9gt7o5aWWxy/puomBLojRV2
         Uo9w==
X-Forwarded-Encrypted: i=1; AJvYcCUZsUQ8dFx+3Fqq+DHn75FTbfgOqNfitJjsYPEx9bSrNKms0cvWnNpmtyzBOBu88okoJfZIq9ztR+A=@vger.kernel.org, AJvYcCXzsXVCFHH4lbBKVvOI6L/ZV2r41i2m4bdiGXAVoLi/71BTRv4BjAoLA/jJzoGYMKRHNcLrh+0AqLbHFr1b@vger.kernel.org
X-Gm-Message-State: AOJu0YzblPM9Um9Y8NckMAHiWvv+O5nS0nwHYHzqSZjtr7UnyHAJVjVm
	p+CeuDzjmvH99JeCTYYkyf8GRj/VfExVfKmRzWGaxdG5sIno6ZsaH561CB1YiLzA
X-Gm-Gg: ASbGncvyjkfgHxETMYWecM7IK/R7CHzUBNlTnB2cjHK5l0e56KcJHcOMDlFLfTfMRer
	0Pg57sDZkbntLAEBiUeFQVPgykn7nny/PIl51BCpg3NyglTFjJ7WY+FYzE1s7fAPXnrFJCOlaDf
	wj0RYmeV/flx7O8APFl4AwCM3Sh2mReyXBtBi8FY5uIXl9uKPTjkdOzzmkmEpG1FN7U8/T+R61j
	gQxOQJTnBcuuouepEyYBsUFlmHydFxrNmE8ZkTVy5uXGIZFyne7rfQiPTjb8o1tZuEDCvdb86PU
	XB7FPCSkrPIQ/Fz+iDJ1jRmwiA19mq4eGd/icBX6aEJ+ymg/atsGLQxKhJ9SlcGhGOzNYpIjiPs
	Gvh6nKEUGuPElhCOG+nSH5NVH2LxzIwBOypXdhvW95AzMV2fqmtwtl9xwgQ/FT4KkUPEBVMo+S9
	SUx6+HGQ==
X-Google-Smtp-Source: AGHT+IEyala1oZxrXtHLp4DcUxW5HDraMyUKCfQrBo5RXA0qq02KohwchEIvGDkScQ6HGhI0d9Pg9Q==
X-Received: by 2002:a17:907:3dab:b0:ade:902e:7b4b with SMTP id a640c23a62f3a-af940069eecmr415357766b.7.1754339672189;
        Mon, 04 Aug 2025 13:34:32 -0700 (PDT)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07670bsm793628766b.8.2025.08.04.13.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 13:34:31 -0700 (PDT)
Message-ID: <c7e398e92ecc75f05b575581e79d4cebfa8efb47.camel@gmail.com>
Subject: Re: [PATCH v2 02/11] Input: add FF_HID effect type
From: tomasz.pakula.oficjalny@gmail.com
To: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires	 <bentiss@kernel.org>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Henrik
 Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, Sean O'Brien
	 <seobrien@google.com>
Date: Mon, 04 Aug 2025 22:34:29 +0200
In-Reply-To: <20250804-support-forcepads-v2-2-138ca980261d@google.com>
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
	 <20250804-support-forcepads-v2-2-138ca980261d@google.com>
Disposition-Notification-To: tomasz.pakula.oficjalny@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-08-04 at 14:11 +0000, Jonathan Denose wrote:
> From: Angela Czubak <aczubak@google.com>
>=20
> FF_HID effect type can be used to trigger haptic feedback with HID simple
> haptic usages.
>=20
> Signed-off-by: Angela Czubak <aczubak@google.com>
> Co-developed-by: Jonathan Denose <jdenose@google.com>
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  include/uapi/linux/input.h | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> index 2557eb7b056178b2b8be98d9cea855eba1bd5aaf..3ea7c826c6fb2034e46f95cb9=
5b84ef6f5b866df 100644
> --- a/include/uapi/linux/input.h
> +++ b/include/uapi/linux/input.h
> @@ -428,6 +428,24 @@ struct ff_rumble_effect {
>  	__u16 weak_magnitude;
>  };
> =20
> +/**
> + * struct ff_hid_effect
> + * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.=
)
> + * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defi=
ned range
> + * @vendor_waveform_page: the vendor waveform page if hid_usage is in th=
e vendor-defined range
> + * @intensity: strength of the effect as percentage
> + * @repeat_count: number of times to retrigger effect
> + * @retrigger_period: time before effect is retriggered (in ms)
> + */
> +struct ff_hid_effect {
> +	__u16 hid_usage;
> +	__u16 vendor_id;
> +	__u8  vendor_waveform_page;
> +	__u16 intensity;
> +	__u16 repeat_count;
> +	__u16 retrigger_period;
> +};

Wouldn't it make more sense to call this new effect ff_haptic_effect?
hid_effect sound generic, too generic. One could say, all ff effect are
hid effects because most ff apis (linux' included) are based on USB PID
spec.

> +
>  /**
>   * struct ff_effect - defines force feedback effect
>   * @type: type of the effect (FF_CONSTANT, FF_PERIODIC, FF_RAMP, FF_SPRI=
NG,
> @@ -464,6 +482,7 @@ struct ff_effect {
>  		struct ff_periodic_effect periodic;
>  		struct ff_condition_effect condition[2]; /* One for each axis */
>  		struct ff_rumble_effect rumble;
> +		struct ff_hid_effect hid;
>  	} u;
>  };
> =20
> @@ -471,6 +490,7 @@ struct ff_effect {
>   * Force feedback effect types
>   */
> =20
> +#define FF_HID		0x4f

Again here, FF_HID sounds confusing without having the broader context.
Constant, Sine, Inertia, Spring are way more descriptive. FF_HAPTIC
would be a great name to distinguish such an effect. Or maybe FF_TACTILE
with ff_tactile_effect?

>  #define FF_RUMBLE	0x50
>  #define FF_PERIODIC	0x51
>  #define FF_CONSTANT	0x52
> @@ -480,7 +500,7 @@ struct ff_effect {
>  #define FF_INERTIA	0x56
>  #define FF_RAMP		0x57
> =20
> -#define FF_EFFECT_MIN	FF_RUMBLE
> +#define FF_EFFECT_MIN	FF_HID
>  #define FF_EFFECT_MAX	FF_RAMP
> =20
>  /*

Overall, I'll keep an eye on this as I'm slowly working towards a
proposal for a revamped and extended ff api on Linux that would make it
fully featured (we're lacking things like device control and querying
effects and their status, arbitrary number of axes and arbitrary axes
themselves).

