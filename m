Return-Path: <linux-input+bounces-7858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5669BBE15
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 20:37:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C441F22946
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 19:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6642D1CB533;
	Mon,  4 Nov 2024 19:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Aw/bn44b"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751761C3054
	for <linux-input@vger.kernel.org>; Mon,  4 Nov 2024 19:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749031; cv=none; b=rHBzv4jrJA+p6IvR05SFgcvquEEDoPoOrf0TeAC0ANuAYwvfSACRVSzt67IHiW0vnaUGlkxsAXqHmJe/4tzHiCgP68GkH+ij+KS+1EB80DSCclywTGd5wL7rLmDkiCYGnas1IwPHyXrEedeVJZShf37+RaqN1j1JPqA4A6ZqDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749031; c=relaxed/simple;
	bh=1lBbc+n+/nnQbLbO5BWXZXN0GtOR8CMewX+RwC3SYdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NdQ7sGR6UTJyPonCm8OBvBG1RZ4bjPp++jkLnR182pmuJe9g8cHL/4wTciN7crmOWTfdlclsR29eyfofYKYzyBO6PZQBMDrqSZfSIbBsmPcWlWCq3Cl3prqnXD7dBQWZGRRpdl+iYzCeGLZfFL1PvSF1rp6XIHaIi4yzQsJNNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Aw/bn44b; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f2b95775so5182030e87.1
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2024 11:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730749027; x=1731353827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H3MOSyfVCTn2aBJJHJZEtjM6no8KhD2xeVxlGCW/Rw=;
        b=Aw/bn44bYAEjYfMPLiglM1ic+wx1xqahjF0aJzcdj299sa6jmq8sMFHwTlVvmxZ0OX
         yYxapyjdARqe5TvIot2eAcEoi+W6a1Ta+EcF7y+MfQC+k4JNbRrusMkeAXITUlXXPUw5
         /hM7nUJ0p5cQ3mv4eDkZZ7T5dHKOjqU9Gvgo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730749027; x=1731353827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4H3MOSyfVCTn2aBJJHJZEtjM6no8KhD2xeVxlGCW/Rw=;
        b=KV7IYV7nBi0B5RZajP/D0eolaFH/p6+CecyRCjINyMnDiCCmwoHx10RSXuRydPeXy3
         Ak3dVPKuEZv3N8+zOF4x/4/7Dfiydx/4R87ovDbaVx6yTuC9OD/TdTrRYjskB/9nJcHI
         mlHobSpEQSrCaL9PdVkrDpvISsNFSCgI6Xp4fmdPT2GubPZuAFGRTols6LIx0BU3OuJV
         KbhVb8fNaSNjKU7bJB1si4vx6pbsH1Og8tmvz8txJ3+f8Rq67xCnEHHebEiRU5FUd/pZ
         7mN35W+atdzqf/Q4hVL9/Ox1K0XlupfyTAWf3LzD02ovg1bOtTyAxnrzPEWw83lHeafR
         apRw==
X-Forwarded-Encrypted: i=1; AJvYcCUqEbR1TfQnNZ0jbSKc9ibqb9gNAU8BW3uv64xgTozU1lc1Isa5aDN+Jrd6fLDGLJ0GUkuQxLMZuyomVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH5Dlqm6suCQQujMT03W3Syx8rp10gP5AP1m8yCYMax4yg52qm
	9Zu0Jw/E6NjWDg0tOW9siSdJ6H5xoV+yG4gW0t2cWfAirYhOuIPqVpOtDmgrn6yNaUNecAGQ1F+
	qSg==
X-Google-Smtp-Source: AGHT+IFQwlsZSea3Dfv2XQeEMcFRc+uNfOzCrLY1VkMqdTCRUdYx4nSWZbRbvzbDtdhVeLYRlMRJXg==
X-Received: by 2002:a05:6512:2382:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-53d65dca630mr9635234e87.2.1730749026955;
        Mon, 04 Nov 2024 11:37:06 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde09b8sm1822253e87.257.2024.11.04.11.37.05
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 11:37:05 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso69676321fa.3
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2024 11:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUJeTKViFMxFv/l/XS98qOifHIBo15PxvG5VXXjVPMXnftVh/Hd10y8kIuTw9EVdNaGWiCmPyJ3EQPXgA==@vger.kernel.org
X-Received: by 2002:a05:651c:550:b0:2fb:3881:35d5 with SMTP id
 38308e7fff4ca-2fedb813966mr95709131fa.35.1730749025443; Mon, 04 Nov 2024
 11:37:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <ZyLtYdwoJWx9FsdS@ux-UP-WHL01> <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>
 <ZyQvxKi8dYOv1AOg@ux-UP-WHL01>
In-Reply-To: <ZyQvxKi8dYOv1AOg@ux-UP-WHL01>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Nov 2024 11:36:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WD5=2SBLD2rDtXXt0dbn-KUvnE0kPsbnyEAkSA_4w-tA@mail.gmail.com>
Message-ID: <CAD=FV=WD5=2SBLD2rDtXXt0dbn-KUvnE0kPsbnyEAkSA_4w-tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, conor.dooley@microchip.com, 
	Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Charles,

On Thu, Oct 31, 2024 at 6:33=E2=80=AFPM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> Hi Doug,
>
> On Thu, Oct 31, 2024 at 10:58:07AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Oct 30, 2024 at 7:37=E2=80=AFPM Charles Wang <charles.goodix@gm=
ail.com> wrote:
> > >
> > > > > +  goodix,hid-report-addr:
> > > >
> > > > I do not see this patch addressing previous review. Sending somethi=
ng
> > > > like this as v1 after long discussions also does not help.
> > > >
> > > > No, you keep sending the same and the same, without improvements.
> > > >
> > >
> > > I apologize for overlooking the discussions regarding this issue.
> > >
> > > I would like to clarify that while the current boards use the same ad=
dress,
> > > but newly designed boards in the future may require different address=
es.
> > >
> > > Retaining this property would likely offer more flexibility.
> >
> > I don't feel very strongly about it, but maybe Krzysztof does?
> > Possibly the path of least resistance would be:
> >
> > 1. You drop the property from the bindings.
> >
> > 2. You hardcode it in the driver to be the normal value.
> >
> > 3. If/when someone actually needs a different value then we can add it
> > as an optional property in the bindings and fall back to the default
> > value if the property isn't present.
> >
> > What do you think? If you feel strongly about keeping the
> > "hid-report-addr" then you can certainly keep making your case.
> > However, it's probably best to wait to get agreement from Krzysztof
> > (or one of the other DT maintainers) before sending your next version
> > unless you're going to take the "path of least resistance" that I talk
> > about above.
> >
>
> Agreed, let's wait and see the opinions of Krzysztof (or the other DT
> maintainers).

As I went back and looked at this again, I'm curious: I don't know
much about how your protocol works, but is there any reason why your
driver can't figure out this "hid-report-addr" dynamically? Is there
some reason you can't talk to the device and ask it what the
"hid-report-addr" should be? From skimming through your driver there
appear to already be a few hardcoded addresses. Can one of those
provide you the info you need?


-Doug

