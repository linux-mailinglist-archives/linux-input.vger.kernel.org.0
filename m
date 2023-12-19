Return-Path: <linux-input+bounces-861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E0819187
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5603B1C2436B
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 20:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E26C1DA20;
	Tue, 19 Dec 2023 20:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfYECwzN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182F839AC5;
	Tue, 19 Dec 2023 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28bc0c0375fso625277a91.0;
        Tue, 19 Dec 2023 12:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703017968; x=1703622768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g+erQkeU3/ZmER/FL6eTW1tj0IowSHqiHIBtBRkAxJA=;
        b=AfYECwzNiNYuuNUcMGeuifNgvXqufjcr8MYvWlYg3ZYHvgRVd9aDv8rV54BKl2l7rw
         tkznHgFIBuVGZBJ18IA607foOIqDaQ/bGFGhiLG68UI4ISMDpCQHInt0oJhjsE9Hd4Sb
         wQGvqod9dusqyE9Vpo1XDW9ayZTrU1xx/shIXVzzqVNR+8/+nMOfRuFvNyO4yHAv1R5W
         tGI0eNCgX0OHcfpO5dzSmQNKc4E84f/tDFUS5nDyQg1gKcxhqsfbMeZTPRV0uoflxrUq
         YfqEZCmpq3jFqwOwyksp7rU4J7IoEZWUKkbs5e3yqDWh4M3D/+klA8a04hjQGh7OxLhV
         gsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703017968; x=1703622768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+erQkeU3/ZmER/FL6eTW1tj0IowSHqiHIBtBRkAxJA=;
        b=uTaTa1H9R+XvK84F03zkKG3544FcVQB5uMDB6XfzyndLJqJV3/tPDt3S9dSLurbBP7
         10ngR+S6JLgnuV9tISljpJe9zVooQKI+RjiYC1G+24pivBPSJThRaog3eTd8V2Vn8tEk
         zpKogGplRD4lgcxQWgVQm77/0R0CCpVALM/Jt+baJdQoWrSg+vn42ycdegl1MMtxdwSs
         6JAKSspeCl11+eaUXeFwVMYUf1uDcfOYdFLJaowQuh1HdkJdUB4TJ2iyLN5bi9ZfafHc
         XV8MajyKefrMXGz3Qah+M3I2fFPQ9FKrevmOI/K0AM5LuYsqY7v7jexz/c6KNEKqmJH/
         qrOg==
X-Gm-Message-State: AOJu0Yy38oI8LsQvtQ7esEltISvJZXSZXNmYZRnmJQxx6VZDyHxfEb9W
	6nCWrQhWExF4gNwWkFKX9l4jm4NsNFU=
X-Google-Smtp-Source: AGHT+IFocSOR/Btdr6ZJyiP1aH3hemOX/xDB90YtfOKglBHSLrI0SecRzbvZnCjO1nSdtWZ/+RqsFw==
X-Received: by 2002:a17:90a:8c0a:b0:28b:83de:c6c7 with SMTP id a10-20020a17090a8c0a00b0028b83dec6c7mr2070846pjo.87.1703017968049;
        Tue, 19 Dec 2023 12:32:48 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b2ca:95aa:9761:8149])
        by smtp.gmail.com with ESMTPSA id pd8-20020a17090b1dc800b0028b470be8b6sm2089343pjb.8.2023.12.19.12.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 12:32:47 -0800 (PST)
Date: Tue, 19 Dec 2023 12:32:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Artur Rojek <contact@artur-rojek.eu>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
Message-ID: <ZYH97KVDO4lFsbmi@google.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>

On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> On 2023-12-15 03:40, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > uinput refuses to work with abs devices where the min value is greater
> > than the max value. uinput_validate_absinfo() returns -EINVAL if this
> > is the case and prevents using uinput on such a device. Since uinput
> > has worked this way since at least kernel 2.6 (or prior) I presume that
> > this is the correct way of doing things, and that this documentation
> > needs to be clarified that min must always be less than max.
> > 
> > uinput is used in my use case to bind together adc-joystick devices
> > with gpio-keys devices to create a single unified gamepad for
> > userspace.
> > 
> > Note that there are several boards that will need to be corrected,
> > all but a few of them I maintain. Submitting as an RFC for now to get
> > comments from the input team and the original author in case there is
> > something I am missing.
> > 
> > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > joystick")
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > index 6c244d66f8ce..8f5cdd5ef190 100644
> > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > @@ -73,8 +73,9 @@ patternProperties:
> >          description: >
> >            Minimum and maximum values produced by the axis.
> >            For an ABS_X axis this will be the left-most and right-most
> > -          inclination of the joystick. If min > max, it is left to
> > userspace to
> > -          treat the axis as inverted.
> > +          inclination of the joystick. The axis must always be
> > expressed as
> > +          min < max, if the axis is inverted it is left to userspace to
> > handle
> > +          the inversion.
> 
> Hi Chris,
> 
> Device Tree is supposed to depict the actual state of the hardware.
> I worded the adc-joytick's adc-range property specifically, so that it
> covers a case of GCW Zero hardware [1], which has a joystick,  where the
> ABS_X axis reports increasing values for the left-wards inclination of
> the joystick, and decreasing values for the right-wards inclination. You
> are saying that there are even more boards that need to be corrected -
> those are all situations, where DT depicts the actual behavior of the
> hardware.
> What you are trying to do is change hardware description, because of how
> a driver in an OS works. You should instead fix behavior of said driver,
> even if nobody stumbled upon that issue since 2.6 :) We fixed libSDL [2]
> for the same reason.

We have several places in the kernel (such as mousedev and joydev) where
we expect that max is greater or equal to min if they are specified. I
am sure that at least some userspace components also have this
assumption. In general, we expect min to be a minimum value reported and
max being maximum value reported, and orientation expressed via
different properties (see [1]).

Since we codified min > max as inversion for adc-joystick devices in the
bindings, I think we need to handle this *in that driver* and leave the
rest alone.

[1] Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml

Thanks.

-- 
Dmitry

