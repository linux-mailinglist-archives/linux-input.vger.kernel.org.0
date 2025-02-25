Return-Path: <linux-input+bounces-10355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B8A448EB
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 18:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39913A62FF
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7074517BEBF;
	Tue, 25 Feb 2025 17:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWlbLCpn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973D2745E;
	Tue, 25 Feb 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740505407; cv=none; b=BEiUZqjqYq7OOzSYWBHITzWmvBjMloZMhFkS2tWUVM72qrtkgKLKLnpq0PJwGXrYqx6F/1flzzj+1eMEqpl67NOmf9//otxsgYz+stp/r7/lWMSUA8r7+Ku7+Rvbjfwpib2v+yBb6vkpVA1YgjF+Nhq8VzcTdUGMW1QguTMSY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740505407; c=relaxed/simple;
	bh=8SMUcbvWrgFIo6mzw0rWkV5ZNdmXUJdhiqyteRrtR1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c3NtKALKS3qAE9ZQeKVA5I5TQh0UDZ+XNxS1JC0o71M8A8F6Sk06WscuY+KGZTqCDmckaEnAPjTE66kCGIDpcVke3YNRzQxQn7PlGajUix9ncc9bIm3JHdft5TL3fVnOe0eHDGzB1/S5TSgujEnWzkKdQBn9pw6t8V+kwmnPAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWlbLCpn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22104c4de96so104095325ad.3;
        Tue, 25 Feb 2025 09:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740505405; x=1741110205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T3r5kbbTS1bAR/hyaPIYrOmPixuDOxwP0LFuexuXlwc=;
        b=dWlbLCpnmrfbZREv51tbf5q0TqHyTC6fO6LnEdoBW23Jp6wWuP6ADA5dbKtlpt/WYK
         QMQaM360cjUx/t/EVOFOo1alV4h85yj/lXXtNI38y/99TBW4ZbAL73hGIcaI9reopVIF
         FudrXC1bTJrq91G2CcyUCXAIZN6ZHpyKLC6iCZX5u5saL5h3Wa6KSkJEZQzgGs3sIyv5
         3pUsHitOYhWS8oTiwt538dXSMLINz1t2I/+k+2Klg+VkvctPcNfUl6WyR896KagFDTmD
         DCo7XkVKS2Ulk0YbVyIqYXqEYSKEpjVfmslUPr4igT9XAKX1zFWK8G+PiFnFBDhb534M
         xctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740505405; x=1741110205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3r5kbbTS1bAR/hyaPIYrOmPixuDOxwP0LFuexuXlwc=;
        b=HOox70K+1TYO8tEOGgHtYDUKz6yqA0x5dojUXvtHkslejc6tcvFiaDbdHcgEAOJx8J
         4vwpDOzLrIIliVWfHG6VpztExw7bJ5ph/IcP0ZaUgEd+laqp2xWMulvDYdBpMlgRGLyE
         CR9Ykxk18jcqrTNPm8EfkOdpjzlyz0BGPzmG5R1+Y41mJctsIdOpImq6YveWPP3BjXSE
         kdW3akfOnnwI6cPn7A6vf+CFjSpZ/UpJ9l6K5jAkkXKqEadY6yV2vKqKSPcOyYf53jMW
         wSEASeKGQ94QeIOQL2q7cxUuOwqr8vtyUuH7sx8MebWH4v7LzzCJhxk9+MOQIz1ysIsH
         aSbw==
X-Forwarded-Encrypted: i=1; AJvYcCU5b7eIWnT6FbbXkUiaJd3ezNFKJx+QYMHGJvkFbKuxzxuP3ZBCgl2Q5koXy/kwPDSZKOJDwCp+TPFHnPA=@vger.kernel.org, AJvYcCUly70ztJiAspyKmxITBjtPvwt35opn8zciXEzZR2hlJ+DiMzI2kN28tyggyJQ9GBeyMxvIh+ll2TmJ@vger.kernel.org, AJvYcCWHekSLw5G59HivYSpnyBwrRA4gMfCCiCTkO/oiypdAkne8bA/uiCOgEQSP5eWyGdPB66a30b9zNl7Gzl7V@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZKoP/6kZDvzUOLtTZzE4+9xtX/eVDFHKHh51mE+7wElNCiOE
	bpD2Rb18dTnHFY3l+IjOI6c4z+UM4BLmUFB469bjD+FsMPpLMR6i
X-Gm-Gg: ASbGncue9N1fGhWsMQlaNQhGbiCNph2sa0Fl6THOrYRXGtQZySjaamxUTVxnFGi9ZRM
	A/FpSR29HHgj99PRSWggBTv0HJKJdOEMbmVh3ff4ee0GEhVUfm0g2v7TWJWThx/ouGMD9s2VNUF
	SmzquQvKbnnJyCJdk3ZdXK1ku/gMDSvGmedrXbWu8VPqUTdi3OsTWFbwoIPd5+AI9f0XVYVw85G
	GclrAly7ChOMLZpWlEjBlEyGDd8ldtu0ghmR+tomaqBlBxaKU/75lTl9xw+Un37/SrjJidYSpmP
	JsqZcjyz97kZ2eSsoH4mqXc5h18=
X-Google-Smtp-Source: AGHT+IFWMKEcImNMeSU1SQDiPwNLY2ovr5xPyebh6qbVh87UAvoQNd5v8CnWMDD4g74lVRsC5Ykwzg==
X-Received: by 2002:a17:902:e885:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-22307b4c04cmr65827695ad.17.1740505404974;
        Tue, 25 Feb 2025 09:43:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a6f9ea7sm1860430b3a.65.2025.02.25.09.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 09:43:24 -0800 (PST)
Date: Tue, 25 Feb 2025 09:43:21 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Burri <markus.burri@mt.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z74BOePro-J4hSTD@google.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
 <Z7YJ2ENZ04Nktnwf@mt.com>
 <Z71nMdTvyIg5a85Y@google.com>
 <Z72YZwBuzW2D9q0b@Debian-VM-Markus.debian>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z72YZwBuzW2D9q0b@Debian-VM-Markus.debian>

On Tue, Feb 25, 2025 at 11:16:07AM +0100, Markus Burri wrote:
> On Mon, Feb 24, 2025 at 10:46:09PM -0800, Dmitry Torokhov wrote:
> > On Wed, Feb 19, 2025 at 05:42:00PM +0100, Manuel Traut wrote:
> > > On Fri, Jan 10, 2025 at 06:49:03AM +0100, Markus Burri wrote:
> > > > The property is implemented in the driver but not described in dt-bindings.
> > > > Add missing property 'gpio-activelow' to DT schema.
> > > > 
> > > > Signed-off-by: Markus Burri <markus.burri@mt.com>
> > > 
> > > Reviewed-by: Manuel Traut <manuel.traut@mt.com>
> > > 
> > > > ---
> > > >  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > index 0f348b9..9c91224 100644
> > > > --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> > > > @@ -40,6 +40,12 @@ properties:
> > > >      type: boolean
> > > >      description: Do not enable autorepeat feature.
> > > >  
> > > > +  gpio-activelow:
> > > > +    type: boolean
> > > > +    deprecated: true
> > > > +    description:
> > > > +      The GPIOs are low active (deprecated).
> > > > +      Use the GPIO-flags in gpio controller instead of this property.
> > 
> > No, we unfortunately can not rely on GPIO-flags. This is not how driver
> > works: current driver behavior is to force GPIOs as active high if the
> > property is missing and ignore polarity specified in GPIO property.
> 
> So you mean this property is still valid?
> Current implementation toggle the GPIO flags to low active if the property and the GPIO flags are different.
> So in case of missing property (false) the settings from GPIO flags will be used.
> In case of gpio-activelow (true) GPIO flags are set to low active.

The driver does:

	active_low = device_property_read_bool(&pdev->dev, "gpio-activelow");

	...

		if (active_low ^ gpiod_is_active_low(keypad->col_gpios[i]))
			gpiod_toggle_active_low(keypad->col_gpios[i]);

f the property is present active_low is true. If it is absent active_low
is false. And the code below, if GPIO polarity setting from DT disagree
with active_low value it will flip GPIO polarity.

You probably think that gpiod_toggle_active_low() sets line as active
low, when in fact it flips to opposite setting:

void gpiod_toggle_active_low(struct gpio_desc *desc)
{
	VALIDATE_DESC_VOID(desc);
	change_bit(FLAG_ACTIVE_LOW, &desc->flags);

	^^^ flip, not set or clear.

	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_CONFIG);
}

> 
> So I will remove the deprecated flag and change the description to:
> "Force GPIO flags to active low. Use GPIO flags if property is missing."
> OK?

No. It should say:

"Force GPIO polarity to active low. In the absence of this property
GPIOs are treated as active high."

Thanks.

-- 
Dmitry

