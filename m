Return-Path: <linux-input+bounces-4307-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC650903768
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 11:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0EB91C21D9D
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 09:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F9017623E;
	Tue, 11 Jun 2024 09:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkXY18K0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F73175549;
	Tue, 11 Jun 2024 09:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096765; cv=none; b=EAWJygaE51JZ+SXZhw5l9QaEXV63TtaobVpMkhMozywdib/SKbbHErUh99h97NCuTqXWDXbxSzJ1jB0iUApnWNlJc1XQhL/vvaX81W4r5jGl8brXzPsLd6hT8JmE+i8WnSq1bOdwEgd7Vp5WCrvGpXP5BAakmRo5R29e49WB1tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096765; c=relaxed/simple;
	bh=piAJrOcXIYYPW9pHmXOaUNTaLQtXtpFBisM8r3zvbdM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FS2JZZpihOqm/1T6i8Y3tEoHRQDegpZx4sczyLok+FQ3ma16fOnigZLCUAvbAO395xb/BAgr8IdpXftSVt0TUowUfu7YHQUyJxQiky0GaI+7B0Efe74z1CJVEb851kabkDeh1c0W8rJ6Xj9uPQOnbNw3CPO9KWcGnmKXBiGDXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkXY18K0; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6efae34c83so348724166b.0;
        Tue, 11 Jun 2024 02:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718096762; x=1718701562; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ebpwQxeGyClOtYNYCmIQ0BQTouSpIGzVWgoERKcSuj0=;
        b=ZkXY18K0rIIJd8JgLe+/XOG2xMyRo1Ifa/WYiQ6inFasEph5coEXHRD4OmxE0lhPil
         o5n8aLzlv8JEtRLujDE1j9URa4V+WcwUyc8cXc2BGCy0jc8WxKR9Xf7+yghKHo+xSCZt
         T2CYBI0fNyn02G0bXmMDugxwUvnjIiOo8HawF3ZPXgHt/bABEO2PNlHsNykAz1nM6sUp
         EbKnf3EXMRv62wZP/vK0oo2VKR20ToosnSDeOL+EWtYdTIunlu5jCyV+YzOrJr+EnB5S
         kpjR/ylnn2Rh6/q7Tu4JYNYbuXDhs2CxT3f4i7FdgJRaJJ6i+LiCFD3cicdgNdewLF5r
         FWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718096762; x=1718701562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebpwQxeGyClOtYNYCmIQ0BQTouSpIGzVWgoERKcSuj0=;
        b=EWd9v1P2eb2euZ4ms/ZZG42vWGu5UbSxjRAx0IZuUU7WN3CVd6uc1030MiILS/T6k9
         x8UYCb76zl5xAZrRanzlbr4N4T4CMikbGCklKKHWvL8jZDGWJ8AoeHg2wQ5k++ooW0Fv
         C8iyFNlvDAhTMPyvjVGX/CxXt90On6+58Z2j8e2Ksky0cTrVBp3xPlGMNVF5OyKRDHdv
         2bvAZhwvhX7VHs+re7HBrBHGwF9vhDo6q4ewkgJi2i/PpmYe5M7K9FVGpn6JOhB4jvnY
         FJYXkN3vH19EdYTISm763l1hrOAKHHt2AKjqe3EkUwHQFqYlEVR1wZ9BrGEysN3NGDVm
         g9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnj92nTMyHZOYomnt8YvJx14sFd1qYYt4vG+W0RTSaEq0mbLy+iUik10E1B0L+8xifF3FUJteJWAKOk55KQSsHFhaKddEvhOicbJbPCU/j+AVZCz6k7J13SYeRh2wZpQP/XCcKgo2JvHs=
X-Gm-Message-State: AOJu0YwUawEliBc63cOdzCAi4WX7TaOfOFwWTKAswEPQrQ6K0obl4HUH
	uu/ReYzZzsq78IBmRhRrLSw9j28eY7NrTykiDLyCZR2fI1a7hoA9UslkRsgS4bY=
X-Google-Smtp-Source: AGHT+IGhEVakH+iWTDhOh2VV8lFnhvJ5tkbv8WZG4yrCwFeKtTvCwHyWXx39vwP7tI+3OPnMcyoBfA==
X-Received: by 2002:a17:906:ae4c:b0:a6f:1662:3eb4 with SMTP id a640c23a62f3a-a6f16623fc3mr384731666b.26.1718096761643;
        Tue, 11 Jun 2024 02:06:01 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef1c:c500:994e:fbde:478:1ce1? (p200300f6ef1cc500994efbde04781ce1.dip0.t-ipconnect.de. [2003:f6:ef1c:c500:994e:fbde:478:1ce1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1f4ed5dfsm229599966b.130.2024.06.11.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 02:06:01 -0700 (PDT)
Message-ID: <a9d1a7771d78fdb0c5a165775645befe440af4ef.camel@gmail.com>
Subject: Re: [PATCH v2 2/4] Input: adxl34x - use input_set_capability()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org,  Nuno Sa <nuno.sa@analog.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	linux-kernel@vger.kernel.org
Date: Tue, 11 Jun 2024 11:09:49 +0200
In-Reply-To: <20240610164301.1048482-2-dmitry.torokhov@gmail.com>
References: <20240610164301.1048482-1-dmitry.torokhov@gmail.com>
	 <20240610164301.1048482-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-06-10 at 09:42 -0700, Dmitry Torokhov wrote:
> Switch to using input_set_capability() instead of using __set_bit() to
> make clear what exactly kinds of events (EV_KEY, EV_REL) are being
> declared.
>=20
> Also drop redundant calls setting EV_ABS and ABS_X|Y|Z bits as that is
> taken care by input_set_abs_params().
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---

Reviewed-by: Nuno Sa <nuno.sa@analog.com>

>=20
> v2: new patch, split out from devm conversion at Nino's request
>=20
> =C2=A0drivers/input/misc/adxl34x.c | 32 +++++++++++++-------------------
> =C2=A01 file changed, 13 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
> index fbe5a56c19d1..830acf29c32b 100644
> --- a/drivers/input/misc/adxl34x.c
> +++ b/drivers/input/misc/adxl34x.c
> @@ -769,18 +769,12 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0
> =C2=A0	input_set_drvdata(input_dev, ac);
> =C2=A0
> -	__set_bit(ac->pdata.ev_type, input_dev->evbit);
> -
> =C2=A0	if (ac->pdata.ev_type =3D=3D EV_REL) {
> -		__set_bit(REL_X, input_dev->relbit);
> -		__set_bit(REL_Y, input_dev->relbit);
> -		__set_bit(REL_Z, input_dev->relbit);
> +		input_set_capability(input_dev, EV_REL, REL_X);
> +		input_set_capability(input_dev, EV_REL, REL_Y);
> +		input_set_capability(input_dev, EV_REL, REL_Z);
> =C2=A0	} else {
> =C2=A0		/* EV_ABS */
> -		__set_bit(ABS_X, input_dev->absbit);
> -		__set_bit(ABS_Y, input_dev->absbit);
> -		__set_bit(ABS_Z, input_dev->absbit);
> -
> =C2=A0		if (pdata->data_range & FULL_RES)
> =C2=A0			range =3D ADXL_FULLRES_MAX_VAL;	/* Signed 13-bit */
> =C2=A0		else
> @@ -791,18 +785,18 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0		input_set_abs_params(input_dev, ABS_Z, -range, range, 3, 3);
> =C2=A0	}
> =C2=A0
> -	__set_bit(EV_KEY, input_dev->evbit);
> -	__set_bit(pdata->ev_code_tap[ADXL_X_AXIS], input_dev->keybit);
> -	__set_bit(pdata->ev_code_tap[ADXL_Y_AXIS], input_dev->keybit);
> -	__set_bit(pdata->ev_code_tap[ADXL_Z_AXIS], input_dev->keybit);
> +	input_set_capability(input_dev, EV_KEY, pdata-
> >ev_code_tap[ADXL_X_AXIS]);
> +	input_set_capability(input_dev, EV_KEY, pdata-
> >ev_code_tap[ADXL_Y_AXIS]);
> +	input_set_capability(input_dev, EV_KEY, pdata-
> >ev_code_tap[ADXL_Z_AXIS]);
> =C2=A0
> =C2=A0	if (pdata->ev_code_ff) {
> =C2=A0		ac->int_mask =3D FREE_FALL;
> -		__set_bit(pdata->ev_code_ff, input_dev->keybit);
> +		input_set_capability(input_dev, EV_KEY, pdata->ev_code_ff);
> =C2=A0	}
> =C2=A0
> =C2=A0	if (pdata->ev_code_act_inactivity)
> -		__set_bit(pdata->ev_code_act_inactivity, input_dev->keybit);
> +		input_set_capability(input_dev, EV_KEY,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 pdata->ev_code_act_inactivity);
> =C2=A0
> =C2=A0	ac->int_mask |=3D ACTIVITY | INACTIVITY;
> =C2=A0
> @@ -874,13 +868,13 @@ struct adxl34x *adxl34x_probe(struct device *dev, i=
nt
> irq,
> =C2=A0
> =C2=A0		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_3D)
> =C2=A0			for (i =3D 0; i < ARRAY_SIZE(pdata-
> >ev_codes_orient_3d); i++)
> -				__set_bit(pdata->ev_codes_orient_3d[i],
> -					=C2=A0 input_dev->keybit);
> +				input_set_capability(input_dev, EV_KEY,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 pdata-
> >ev_codes_orient_3d[i]);
> =C2=A0
> =C2=A0		if (pdata->orientation_enable & ADXL_EN_ORIENTATION_2D)
> =C2=A0			for (i =3D 0; i < ARRAY_SIZE(pdata-
> >ev_codes_orient_2d); i++)
> -				__set_bit(pdata->ev_codes_orient_2d[i],
> -					=C2=A0 input_dev->keybit);
> +				input_set_capability(input_dev, EV_KEY,
> +						=C2=A0=C2=A0=C2=A0=C2=A0 pdata-
> >ev_codes_orient_2d[i]);
> =C2=A0	} else {
> =C2=A0		ac->pdata.orientation_enable =3D 0;
> =C2=A0	}


