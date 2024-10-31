Return-Path: <linux-input+bounces-7814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37D9B81F7
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 18:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D190FB233B8
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 17:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116B01BC069;
	Thu, 31 Oct 2024 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZA/UIs0C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6C013A868
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730397510; cv=none; b=bEqBfdmHsv5C6gptZY+D2oP9FwWbrb7XizyS2eyG+Q2JDcGHXSdYfW1JIAzYhYwFbWs3OsJTMR1zsVZxPKRF7Gl0uL/rRlOV5qXVisr/zeRMZB9c+ya8Igeuo6rytMTxHAls0hpPc9EWnry3518vn6jMIP0ewdRODiKaxL+YO2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730397510; c=relaxed/simple;
	bh=GprtLr3+fDuoA1kbr5iV1i1OWpC+hVzEb/dgPxI6zjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0n+ZwEfU4J7n7zSAluGKaz4C1eecZPABtmUmtqq+ZbbWcTKSfVjOAIq5aJEQIp82vgFGekpM4bnCiNrX555B5npx04neM36lr/8dGojxYy8Z0GXtkp46lWIz23yrNZ0LKnoZQ+s/VQbC8pLMY11IV1s7CW0CZwie80BekoEprk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZA/UIs0C; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso17708521fa.1
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730397505; x=1731002305; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lp+SkhbwfifV7k5hA8ZYEm0WPfNORR7rjsrxe7EFMug=;
        b=ZA/UIs0CJ75GwI1qVdNbiHQ+SlbD9/yNHnMSJS/l2Z3nuQH4xalqfFnWIlcbUHaTjL
         89Stwcu86JTvV7WwbIGapdgs/p2gnekFFZcZsGvxSPwiKyf6NWMVR76s0ZV7k6oslNhI
         hnxLddHxIW2HKsJtI3bPAMPc8q5A5CALWnX+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730397505; x=1731002305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lp+SkhbwfifV7k5hA8ZYEm0WPfNORR7rjsrxe7EFMug=;
        b=JIMZjHkhypIbb6zu0Y+rzdzPXuOsl010S8wnS746etNbiTHpoED1rLd/A+h5ZR5e9U
         hhZ64aqoIuAut6+ddfLDci1kvFwXfCg1U9YPclleYSkNy9M7J4RRmU0cXO1Gxyuedc7c
         h/gwMA5mePhPmar3liBDwP8JgoOtQzKIKBFruQqpRhWtJPmAGWEyN6mkjtbNVq0hy5o3
         XJrY+z55Zh+IL1Sq4sfK0tkGGgU6C2Qg/TRasLu1x+L7E8smKshmNZQAoGByV+xsebYl
         xrVYv8z7s/9iIvAJ5WRiEJXlFHsmcB+2XqEMIStnD6Z0itTwlpzY52eTsCNUi8vxw3l/
         MGEg==
X-Forwarded-Encrypted: i=1; AJvYcCUW45rC+r5zMQN0ro4pdXJYcBExeKgr5JYMvCBPyrMogPmeo04S7RYWDpNu/f99VV0pmKbC+Ht++Tid5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIFjb3m4l5IX4h/L3xFbHn3P8MD81nbtUVy+ax5JDVto4SsyaJ
	zAg29yxSUMk2e6vilhSsU1WcatTSDXtmXzNCzE3Ru8iyojOz1EeJoy2IWzoQWkR2VPf1bE9vZAe
	Vg9w8
X-Google-Smtp-Source: AGHT+IF6lFYop6nodRDlw/FjzptPhTqkrcqso160CdUZC1LbiWOCHKEKFTzXrq4m+/5aDAKmfZp0vA==
X-Received: by 2002:a2e:bd09:0:b0:2fa:d604:e522 with SMTP id 38308e7fff4ca-2fedb669b19mr9315041fa.0.1730397504827;
        Thu, 31 Oct 2024 10:58:24 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3b777fsm2856861fa.5.2024.10.31.10.58.23
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 10:58:23 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f58c68c5so2309927e87.3
        for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 10:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVedrz5myJ9syF3Fxwxvl17sp72LchnRRRfY6esZvzMSeHkbpUqX+gKOnL1PubhIRodlpeQyJdB0UnrOA==@vger.kernel.org
X-Received: by 2002:a05:6512:605:b0:53b:1508:468d with SMTP id
 2adb3069b0e04-53d65e1686bmr748585e87.54.1730397503175; Thu, 31 Oct 2024
 10:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3> <ZyLtYdwoJWx9FsdS@ux-UP-WHL01>
In-Reply-To: <ZyLtYdwoJWx9FsdS@ux-UP-WHL01>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Oct 2024 10:58:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>
Message-ID: <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 30, 2024 at 7:37=E2=80=AFPM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> > > +  goodix,hid-report-addr:
> >
> > I do not see this patch addressing previous review. Sending something
> > like this as v1 after long discussions also does not help.
> >
> > No, you keep sending the same and the same, without improvements.
> >
>
> I apologize for overlooking the discussions regarding this issue.
>
> I would like to clarify that while the current boards use the same addres=
s,
> but newly designed boards in the future may require different addresses.
>
> Retaining this property would likely offer more flexibility.

I don't feel very strongly about it, but maybe Krzysztof does?
Possibly the path of least resistance would be:

1. You drop the property from the bindings.

2. You hardcode it in the driver to be the normal value.

3. If/when someone actually needs a different value then we can add it
as an optional property in the bindings and fall back to the default
value if the property isn't present.

What do you think? If you feel strongly about keeping the
"hid-report-addr" then you can certainly keep making your case.
However, it's probably best to wait to get agreement from Krzysztof
(or one of the other DT maintainers) before sending your next version
unless you're going to take the "path of least resistance" that I talk
about above.

-Doug

