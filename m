Return-Path: <linux-input+bounces-8877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC819A00748
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D404A7A05C8
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 09:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE8F1CD1F6;
	Fri,  3 Jan 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="nuu6TpXQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DA433991
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735897959; cv=none; b=nLRTHXECpB5JJkIWGtbp6JyAlh1n3LecDlgnZPcdEH7rnOlU9Wnz1uiWXKGE76Xuq9WGMokvnXm+iwQFp1Fj3/1PoNN99ghKX90qRhAp5NHJwZG1Jz4erqfKT6MvHPG+MmEMCGLwtDOd9EWEikkSub8Wmr5Tcdm4UtVQfiPbySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735897959; c=relaxed/simple;
	bh=GAEFu1xWo+vq9A7a78naTFeqfSW00xJQU0a2ijC81L8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=fHj0nu+oT/upsmqrurRlf3H5L8hYL5aVRUSdrtO+6Qlwe896evhubNRChJ5wMufylg37MS3h3Oay9VIrZ059gEhwUIP7ZSoaj/8xFT/IsNfVJy/c0kWRJZkcypv2zpql1SCoYT0zH3nAffnS2GKXh1Sku8i3ULrRCBcDMP2hdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=nuu6TpXQ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso861132466b.1
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 01:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735897956; x=1736502756; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bkg7Flo+OpiEi1p9H/02JXt2rT+BbZkhOhMB9gCKV0=;
        b=nuu6TpXQZUWMaRptwZ9mlxpNZSRaNE04Vt163B8QXXPRGu33ihdRhguFfFCTWRz+vh
         dhNB3kOMmLJCa2LYpaJeqH8+3Xy/mquu9gzaHdCg6AT9TnzL4+BB4pJf8lOUoU0+N2XS
         8/SvIBeo07eB1UySICDSXHwDqUeHtpSfa00RKBYQSre8DPkZDT0ZoD8+pX0jbKjB+Hyh
         Abd7zY8rAiBT8YzHp5br6yNVAy/Sf+JTgVijdSl5Wtemjzm97mEeyJUMAoTHIpEZPwN9
         eX+xJvz6nHUcSl0nBanC6JmxSbHZyNdpNoqfa8aozOXdzBLe7fix+Jv8ZzvlM3V9Titb
         h56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735897956; x=1736502756;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Bkg7Flo+OpiEi1p9H/02JXt2rT+BbZkhOhMB9gCKV0=;
        b=CI29DMuhtmiitJHtmG0oliHjKdZ3MPN6JwGxE3WS/slkdvMYzreDpiS2fSTDQq0yM8
         Cq36xeDyr8UzdFfdfkbOGBSy9rRDGMOZ2CUqJA+f+ahkFO8vohUIhNlds/kxZLmDoOri
         FNNCw4p3kzCzsAMythio89lRXRaXvZagDJOHTLuiMt89RajvVdDphK2w9j1JZprHmb5p
         JTSvpIW3oRbVscwIhcjz1cOsgVLyM1B06BGk15vWsiDaV6gKR+I/ldSOjh0RBtaI4FhZ
         WIsO//OpBXw+7UWPEjKqb2uwzrBXzUOTm1aWpL2Iv771YBC6HRYDHIB+3aBY5Q///fWQ
         HbdA==
X-Forwarded-Encrypted: i=1; AJvYcCWgtTqKKaVP/U1LSBS5Dj8EnrvhDU5UwzoT/UHSSsaBlRvhy9+dcWwPnZ3NaGvazJSyKvXmnne1g4qPvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NPC451TMirwFTWJ7Jnh20eHkq4RNDm2AXYtwjqUoiHzG6mjd
	Zr66/4JP4yHkmJrroxiZZLHq6q+D/8CDCnk2S+mdQvWHqxljeqtU6MbvgAkARGA=
X-Gm-Gg: ASbGncuWtnAzfk2gK0JxLnS3hObAhnqx39PNPCAPUbvoMYinBG05hVespsugXfnbjqN
	8SAEQ4piOpvr5nFOsc6SnPFXNrV0P4zDT4MLVvp1s+7eTMLI8R14DKsNMMbnbtnblLxoWMzPncX
	OB/DnypTbaSxrPjpSGCrYjEKSqrMvOdGY/gEsmie/IpmwcjAb/QAiATLuqIth+8KbcAHVogMdWa
	hYK/velnfDi5wvcyr9ryOGYqf6JodrAtPMJBxEu09mZKMgvFqUWIk/yUhcXi35d13gwn8ouoRXW
	/BxJks6owBFQiew=
X-Google-Smtp-Source: AGHT+IG8YuxqFunIcm8OWjQjnqMCuQk4ESRUGe0Bz62boxuF4DFyE+YgKQ/UVpnkrUFDSFaE7ssBFw==
X-Received: by 2002:a17:907:724b:b0:aa6:7737:1991 with SMTP id a640c23a62f3a-aac2702ae51mr4867844966b.2.1735897955707;
        Fri, 03 Jan 2025 01:52:35 -0800 (PST)
Received: from localhost (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf697b1c27sm470866666b.122.2025.01.03.01.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:52:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jan 2025 10:52:34 +0100
Message-Id: <D6SCGVFPV04C.1K6MEAYA72ETY@fairphone.com>
Subject: Re: [PATCH 2/2] Input: goodix-berlin - fix vddio regulator
 references
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <neil.armstrong@linaro.org>, "Bastien Nocera" <hadess@hadess.net>, "Hans
 de Goede" <hdegoede@redhat.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Jeff LaBundy" <jeff@labundy.com>, "Charles
 Wang" <charles.goodix@gmail.com>, "Jens Reidel" <adrian@travitia.xyz>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
 <0233a087-67c4-482e-8ef1-9c8dc610f9fb@linaro.org>
In-Reply-To: <0233a087-67c4-482e-8ef1-9c8dc610f9fb@linaro.org>

On Fri Jan 3, 2025 at 10:27 AM CET, Neil Armstrong wrote:
> Hi,
>
> On 03/01/2025 10:21, Luca Weiss wrote:
> > As per dt-bindings the property is called vddio-supply, so use the
> > correct name in the driver instead of iovdd. The datasheet also calls
> > the supply 'VDDIO'.
>
> This is duplicate of https://lore.kernel.org/all/20240805155806.16203-1-d=
anila@jiaxyga.com/

Oh, any idea why it wasn't picked up since August?

>
> But it's still valid:
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks!

Regards
Luca

>
> >=20
> > Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchsc=
reen IC")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >   drivers/input/touchscreen/goodix_berlin_core.c | 24 ++++++++++++-----=
-------
> >   1 file changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/i=
nput/touchscreen/goodix_berlin_core.c
> > index e273fb8edc6b92bcbad0fd35223a841d7da7d671..7f8cfdd106fae03a6b19758=
2bca4eb61f80182c6 100644
> > --- a/drivers/input/touchscreen/goodix_berlin_core.c
> > +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> > @@ -165,7 +165,7 @@ struct goodix_berlin_core {
> >   	struct device *dev;
> >   	struct regmap *regmap;
> >   	struct regulator *avdd;
> > -	struct regulator *iovdd;
> > +	struct regulator *vddio;
> >   	struct gpio_desc *reset_gpio;
> >   	struct touchscreen_properties props;
> >   	struct goodix_berlin_fw_version fw_version;
> > @@ -248,19 +248,19 @@ static int goodix_berlin_power_on(struct goodix_b=
erlin_core *cd)
> >   {
> >   	int error;
> >  =20
> > -	error =3D regulator_enable(cd->iovdd);
> > +	error =3D regulator_enable(cd->vddio);
> >   	if (error) {
> > -		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
> > +		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
> >   		return error;
> >   	}
> >  =20
> > -	/* Vendor waits 3ms for IOVDD to settle */
> > +	/* Vendor waits 3ms for VDDIO to settle */
> >   	usleep_range(3000, 3100);
> >  =20
> >   	error =3D regulator_enable(cd->avdd);
> >   	if (error) {
> >   		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
> > -		goto err_iovdd_disable;
> > +		goto err_vddio_disable;
> >   	}
> >  =20
> >   	/* Vendor waits 15ms for AVDD to settle */
> > @@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_ber=
lin_core *cd)
> >   err_dev_reset:
> >   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
> >   	regulator_disable(cd->avdd);
> > -err_iovdd_disable:
> > -	regulator_disable(cd->iovdd);
> > +err_vddio_disable:
> > +	regulator_disable(cd->vddio);
> >   	return error;
> >   }
> >  =20
> > @@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_b=
erlin_core *cd)
> >   {
> >   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
> >   	regulator_disable(cd->avdd);
> > -	regulator_disable(cd->iovdd);
> > +	regulator_disable(cd->vddio);
> >   }
> >  =20
> >   static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
> > @@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int i=
rq, const struct input_id *id,
> >   		return dev_err_probe(dev, PTR_ERR(cd->avdd),
> >   				     "Failed to request avdd regulator\n");
> >  =20
> > -	cd->iovdd =3D devm_regulator_get(dev, "iovdd");
> > -	if (IS_ERR(cd->iovdd))
> > -		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
> > -				     "Failed to request iovdd regulator\n");
> > +	cd->vddio =3D devm_regulator_get(dev, "vddio");
> > +	if (IS_ERR(cd->vddio))
> > +		return dev_err_probe(dev, PTR_ERR(cd->vddio),
> > +				     "Failed to request vddio regulator\n");
> >  =20
> >   	error =3D goodix_berlin_power_on(cd);
> >   	if (error) {
> >=20


