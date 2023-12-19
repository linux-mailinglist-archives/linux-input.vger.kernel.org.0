Return-Path: <linux-input+bounces-862-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B581919F
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 21:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10774B250AB
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E750539AF7;
	Tue, 19 Dec 2023 20:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhDSV1Z4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC03B786;
	Tue, 19 Dec 2023 20:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35f56f06142so37763305ab.1;
        Tue, 19 Dec 2023 12:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703018094; x=1703622894; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zL69xIMbMycVeFoHKrHNreD8N+FPOGpJMjIQmWE4XFw=;
        b=RhDSV1Z4cWhK4kMbFF2Wmc3l/JW4ife+aHe+kG2rZ8nGiKnq/nGa/uzK3WwpSLsiF3
         lED5NYfxOTD/yrBlQu2DWteVsLgx6yEsQkYx3QyuLGwsL79byTVfLMh0du3cF0yGUDeJ
         /edh7qzL1EDLnElGK6/0MRWJKwikdM7fiDxSNRyUUb1pMt8q1AvA5mgCy5KpwSZ9Hrrg
         LKoIK063o9O4rpLTySznFKKWymiLwlUe6SX/1gmOwf91eBrubhTdF1SWk9X5IJJff2ji
         TwMAEXKWQ89ZSwuD7BAa5H6zN43xqMv2QiQT0k7d7ygxr6m5ZiiQ4xzVjiC7h0YSz2ct
         Yopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703018094; x=1703622894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zL69xIMbMycVeFoHKrHNreD8N+FPOGpJMjIQmWE4XFw=;
        b=s1jyblqXQ2Mam3RrweEndAZJu7Utd3B5h1ar5aSqyUqexmuL2nnFthnUe2gXoEegWY
         52U/faC+F8YUmK+mgKM/twiQc2W2j/RYf0dcgJP1oeyhqTDMS09C+RuBmLtlas/S+qF3
         w+Z9tPdMXvefEGkvUft/ENo/i5sB4kgMjAyDWFBbrd98mR7bWW98AA0xn95679ny70or
         BejI94KOUF4wJJBnlcIkHIYboBImSKu5W8ts3yH8FL9ScboqlVUPxp7YAUPvfcmrNlSF
         XoPj58sd5t6LJMNCq6yX1GYWrGypK6jE13Z+tnCsC4q3/pVVCrWDBbejPZWtTCVtjRlZ
         jWAg==
X-Gm-Message-State: AOJu0YzUXBXAz2JFsVDwSQ0H4j/8khLHWWPeH+hgPh/JSmSHxUKJu+b7
	KSw9GzxnC/MyKqSnnUuRefxhCiUfa5U=
X-Google-Smtp-Source: AGHT+IGsNIAdXTXtGlZ7FfdyzH2rpl95PaE9B//OvdoCeuMh0msNei7NYAsMeTuzgn0/HKBFNfcj8w==
X-Received: by 2002:a05:6e02:1a8b:b0:35f:a4b2:7018 with SMTP id k11-20020a056e021a8b00b0035fa4b27018mr8689212ilv.29.1703018094213;
        Tue, 19 Dec 2023 12:34:54 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b2ca:95aa:9761:8149])
        by smtp.gmail.com with ESMTPSA id u3-20020a631403000000b005c6aa4d4a0dsm19757941pgl.45.2023.12.19.12.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 12:34:53 -0800 (PST)
Date: Tue, 19 Dec 2023 12:34:51 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Artur Rojek <contact@artur-rojek.eu>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
Message-ID: <ZYH-a3TCBuJ00GvG@google.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
 <ZYH97KVDO4lFsbmi@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZYH97KVDO4lFsbmi@google.com>

Sorry, meant to add Peter Hutterer to the conversation, but forgot
before hitting send...

On Tue, Dec 19, 2023 at 12:32:44PM -0800, Dmitry Torokhov wrote:
> On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> > On 2023-12-15 03:40, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > uinput refuses to work with abs devices where the min value is greater
> > > than the max value. uinput_validate_absinfo() returns -EINVAL if this
> > > is the case and prevents using uinput on such a device. Since uinput
> > > has worked this way since at least kernel 2.6 (or prior) I presume that
> > > this is the correct way of doing things, and that this documentation
> > > needs to be clarified that min must always be less than max.
> > > 
> > > uinput is used in my use case to bind together adc-joystick devices
> > > with gpio-keys devices to create a single unified gamepad for
> > > userspace.
> > > 
> > > Note that there are several boards that will need to be corrected,
> > > all but a few of them I maintain. Submitting as an RFC for now to get
> > > comments from the input team and the original author in case there is
> > > something I am missing.
> > > 
> > > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > > joystick")
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > index 6c244d66f8ce..8f5cdd5ef190 100644
> > > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > @@ -73,8 +73,9 @@ patternProperties:
> > >          description: >
> > >            Minimum and maximum values produced by the axis.
> > >            For an ABS_X axis this will be the left-most and right-most
> > > -          inclination of the joystick. If min > max, it is left to
> > > userspace to
> > > -          treat the axis as inverted.
> > > +          inclination of the joystick. The axis must always be
> > > expressed as
> > > +          min < max, if the axis is inverted it is left to userspace to
> > > handle
> > > +          the inversion.
> > 
> > Hi Chris,
> > 
> > Device Tree is supposed to depict the actual state of the hardware.
> > I worded the adc-joytick's adc-range property specifically, so that it
> > covers a case of GCW Zero hardware [1], which has a joystick,  where the
> > ABS_X axis reports increasing values for the left-wards inclination of
> > the joystick, and decreasing values for the right-wards inclination. You
> > are saying that there are even more boards that need to be corrected -
> > those are all situations, where DT depicts the actual behavior of the
> > hardware.
> > What you are trying to do is change hardware description, because of how
> > a driver in an OS works. You should instead fix behavior of said driver,
> > even if nobody stumbled upon that issue since 2.6 :) We fixed libSDL [2]
> > for the same reason.
> 
> We have several places in the kernel (such as mousedev and joydev) where
> we expect that max is greater or equal to min if they are specified. I
> am sure that at least some userspace components also have this
> assumption. In general, we expect min to be a minimum value reported and
> max being maximum value reported, and orientation expressed via
> different properties (see [1]).
> 
> Since we codified min > max as inversion for adc-joystick devices in the
> bindings, I think we need to handle this *in that driver* and leave the
> rest alone.
> 
> [1] Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> 

-- 
Dmitry

