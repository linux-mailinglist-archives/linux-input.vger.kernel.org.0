Return-Path: <linux-input+bounces-8789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 849119FCA25
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158F116259E
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2024 09:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA601CEEB8;
	Thu, 26 Dec 2024 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTCL/Zrc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39F11E480
	for <linux-input@vger.kernel.org>; Thu, 26 Dec 2024 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735206877; cv=none; b=FllcItCwuvfVWbRoNtm3kCqk7FY4S2DlIxTgR266VIZWTlBHW0ESnbX///wgpAYsqsVLYb27RGv0qYSFqdD5dHsqYhHq02qRMO/UOS9A8MjjBQcKaKChWiIn/tGOlC8+v09mmVUh+04VBizPzrcIeVciAc1wXoJQVTW9U4mRckQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735206877; c=relaxed/simple;
	bh=qsCJMEMkFb41RIWlNIpHP0ObLyEIqqsA69/V/zRarF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pIocjf0ZIgF9QMoZocTwl/ZH0uWgc+r1YBcUqmZURrg96vY3Cvlch0/hNRM5rXgGEQRLHOM71VNO1MWbrA1dza0638S//kE8vzSeql+k9z/xnnD8GodX+689I7Fhm90nm1SppcUOYOLJyDsAJ6a0SsDgMLLAhysF3mfGyVOt4G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTCL/Zrc; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6d900c27af7so49616306d6.2
        for <linux-input@vger.kernel.org>; Thu, 26 Dec 2024 01:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735206875; x=1735811675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsCJMEMkFb41RIWlNIpHP0ObLyEIqqsA69/V/zRarF8=;
        b=fTCL/ZrcCl3/gJwyZZt6PsmDfCT/01KOlNlp8ES4zJp09K0lCiGDEcUgkJrLLK4/47
         guxGtGlAcKMbAaa+7KEZ2n2j6+5x4HmdrkgSgpsHV/XP83NeG8L1E4YV0n5W2iew0DkS
         8ol2uMgtCYxTzxZuXmdhz8mT2lN62Rv4w8jMhz1zcOcNmFzFSOrbL9wGyz93pSlJC+Fs
         20t9ZDynnJM8A+qYP4Gu4QTFFpaL5PnvysBvxZNgjP8lPXKFm4FpC39oKe5mRRnCuUi2
         i/1y+KZwIAa9ZwRgmwJNFNBToF7HLRvwfaDexBTOQQq3eqMyARz+Tp8J3X6BzTiC1RWA
         A63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735206875; x=1735811675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsCJMEMkFb41RIWlNIpHP0ObLyEIqqsA69/V/zRarF8=;
        b=TQ5HnMPSo68JnZNZQKlevt5AtRq+wdH1+NnSFdfEBWP/TtIJmv+uY+0m8XwzaXlO12
         P/hoiDWERuNXybauuICXkmJGQoEAYMPoS7Mge4KVh/XN08UHt8xVr9X4MM7aIJfFM0Z2
         ESKwWGrZSPSZqsyhUnonovjzb13EI3Jnp+fv32QPmy+w4KrNkC+ECvjfFjky98llejcd
         5nrFc/9KwzPuVXOQXHfUvZsYTXDpcXp2yOUBWdhu69cmn7t+4epAm+WJAr3AmYp8eW/H
         aSSfr6wefEV7pXl9+DJB4w/hsZbvd7aP4D3A1DSEeDf+uveSwzcqJe9UjrBdO9yiO80f
         rluQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhm691Qj/xtLgNS4i9fPjYzxOv2Rc8EIp/gwNSjdNxmNYYP1NtZEWzRbhdNRM0WunGD3pbsnR/eXWljw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCqmwP1PSCLp69Fur6Qr5A1i/XIM+YDeU1nJq0wO2Go3dLAliZ
	a47rzrnPvD0CcreQQbi/FRX3fUJU4WsmgK2Tka8K+dH1ejnOR4TpryMcV6udf1kCZrKuUAM5ThH
	4E3eXPCL4m9qW2ujQwdORTjlFmMg=
X-Gm-Gg: ASbGncuhdu6zImBLi7ZUYQqzX3nXOVcy4b3GfYo8U6I7kmnbHRUYp49cGT2zNa9OSUT
	D0xglnFCztXr5kPtH6+tJ3DFnhN+ipAFZ9MHx1vG4j45dg9ETelWz5rICC56ib9FMxhL1XIA=
X-Google-Smtp-Source: AGHT+IEpZpuS3VQiDA9rhT+XZJ1idGYdk2oqf0bnUPygLm6EEK50VS4SdgOvh0wyM28P54UVm5jxJiVjTghhcgPNsIs=
X-Received: by 2002:a05:6214:2b82:b0:6d4:2fee:c27b with SMTP id
 6a1803df08f44-6dd2334e4efmr383584616d6.27.1735206874759; Thu, 26 Dec 2024
 01:54:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725004934.301342-1-iam@valdikss.org.ru> <nycvar.YFH.7.76.2408131128230.12664@cbobk.fhfr.pm>
 <d3d71c5b-da20-4358-84e9-59295da2863f@valdikss.org.ru> <222f1501-70fe-43f1-8bce-81a7667a5927@valdikss.org.ru>
In-Reply-To: <222f1501-70fe-43f1-8bce-81a7667a5927@valdikss.org.ru>
From: Rodrigo Aguilera <rodrigoaguileraparraga@gmail.com>
Date: Thu, 26 Dec 2024 10:54:24 +0100
Message-ID: <CACSVgajrQo+p2oMR9+y5KnmiM0Xi5QosDf93hgQaCnr-Aev6WA@mail.gmail.com>
Subject: Re: [PATCH RESEND] HID: lenovo: fix Fn-Lock on Lenovo TrackPoint
 Keyboard II in USB mode
To: ValdikSS <iam@valdikss.org.ru>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello

Anything I can do to help? I did test ValdikSS' patch and it works. It
would be great to have it in the mainline kernel so I don't have to
recompile it everytime

Thanks


On Sun, Oct 6, 2024 at 3:44=E2=80=AFPM ValdikSS <iam@valdikss.org.ru> wrote=
:
>
> On 13.08.2024 12:38, ValdikSS wrote:
> > On 13.08.2024 12:28, Jiri Kosina wrote:
> >>> When Fn-Lock is pressed on Lenovo TrackPoint Keyboard II in USB mode,
> >>> the keyboard only sends the scancode to the host and does not toggle
> >>> the mode by itself, contrary to Bluetooth mode.
> >>>
> >>> This results in non-working Fn-Lock switching.
> >>>
> >>> Fix this issue by sending switching command upon receiving Fn-Lock
> >>> scancode.
> >>>
> >>> Signed-off-by: ValdikSS <iam@valdikss.org.ru>
> >>
> >> Could you please contribute using your real name?
> >
> > I prefer to use my nickname on the internet, and as far as I know, the
> > patch accepting policy has been lifted to allow nicknames (pseudonyms)
> > since my last contribution.
> >
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html#=
developer-s-certificate-of-origin-1-1
> >
> >> then you just add a line saying [...] using a _known identity_ (sorry,
> >> no anonymous contributions.)
> >
> > It used to be:
> >
> >> using your real name (sorry, no pseudonyms or anonymous contributions.=
)
> >
> > If I'm reading this wrong, please feel free to resubmit it under your
> > name, as has been done with my previous patch.
>
> Checked the commit which have changed the kernel policy regarding
> identities:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dd4563201f33a022fc0353033d9dfeb1606a88330
>
> And CNCF clarification linked in the commit:
> https://github.com/cncf/foundation/blob/659fd32c86dc/dco-guidelines.md
>
> > A real name does not require a legal name, nor a birth name, nor any na=
me that appears on an official ID (e.g. a passport). Your real name is the =
name you convey to people in the community for them to use to identify you =
as you. The key concern is that your identification is sufficient enough to=
 contact you if an issue were to arise in the future about your contributio=
n.
>
> Humbly asking to review the patch when the time allows, Ji=C5=99=C3=AD.

