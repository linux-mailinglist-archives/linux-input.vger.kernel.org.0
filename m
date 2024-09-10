Return-Path: <linux-input+bounces-6381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EBB97364F
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 13:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9164EB27172
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 11:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F01218DF8F;
	Tue, 10 Sep 2024 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKZsUSVr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA017BB08;
	Tue, 10 Sep 2024 11:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725968105; cv=none; b=JE+hNzgQpjCQyjYj1UNvJi9wQWo63xm0RGowuO8STrevDoM8ljuTWW8WBDX80pg+pv1WGOVKsyiGebkp+R0XWNJAxXgZYfsLUtNKCIIC73EJc/9cOXVpWtqpDbU2xL41pymXl8RrJrsz+UxhAJOjieL0C5mQgFp2AQyWZqcaBls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725968105; c=relaxed/simple;
	bh=Rg5PN2PkV2Um3WGF1tS0FkDKm4Jao3qaAGmi5tBMgY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQgZHx3i80Gvvuhiz4dcfJNnzNdiN8DCrwgtrMDkaY1CNE78iLTANLRpR2u4Z+jnxG0Nz88/XcCKC9dvY3cEgY8IqG4CxBSeAH+m3clWDhSnXDCrVvA21t34nvRj9E7Y1Lw39UBTlIjkpAoeelP2KT5aPtDn65LA+qx/Wg39+tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKZsUSVr; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-45832b2784bso5973201cf.3;
        Tue, 10 Sep 2024 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725968103; x=1726572903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4SZ8rld03euXTwsLUYIcEQpPdlukkUlkqr7Bv4R1+s=;
        b=fKZsUSVr9i1uLAwuxne4EvRX49jPt3ZAe/ckca/Q07YKfZgQb0dHnqpGwoHQgBGcq6
         A8cqGgmBCSPbxjVD99mTX4htZk/A8tA3bbkRSxghcdacPsyDeyLJeG/6xIngUuYrBSFj
         /ex/8oVONFkn0Ot2JHJz2RJOMTAUguxzyatStBKR4Mis7IVwcCPYu19DYU1pgmCzF/5s
         WOEp/KWPGBM24TkrgDha2xR/wgp/JckF8koH1GpjZq55kYb3dnKvBnVE5KcXZuI1i7Qk
         VfnEO9UZq45HJrE9QyMe/27et6eGosd3HGp9drUrxfm9nIo9RSyuJSb1n+w4pp51M7ZA
         1P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725968103; x=1726572903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4SZ8rld03euXTwsLUYIcEQpPdlukkUlkqr7Bv4R1+s=;
        b=IR0CRGdGdfFpvJJdRSj09nEYKs3llBoDxmzJtCi7J3xnHYc4Kh621rRdOXmjCsSdG+
         UjuUBlRtUIaXO/E6n+rkrN5mpCcYY4Fhk075/b2Uwn3YmXBKVixKDSHjg8/lTts5nsLm
         XtAQqInY3dEatxX2I0rkfyo1bnP18UFZorwbMv5KhJ/NUvDI2CkLvMPhpD4D85YYNHYw
         FxdRAKeIIEBh/qDfn6/jSOE9g8e/p7UZofiDkGHhx457ipxbKNI+pxr+HCAdFVFUWfWA
         hAU9ksNSKsmBKrf1YTdlKa5hNi+kG5DTuIO0msDNE6nZekRcTSfHUTcnN6Vk3ekO0TT4
         9P6w==
X-Forwarded-Encrypted: i=1; AJvYcCW57SMWc7xHzMpgyFRtpy8/v+apEzOLHx8Qtq8Nktbu9CTQ1Lyy6iNJbanoIYyHG4a9ImU62mlsAJFXN2k=@vger.kernel.org, AJvYcCWGZ9eTrAzuUzvd0tDsdyQUwXclLNeelFOsMbQxZhHp6sLQVew/DBakPkWSqi2TJsGvvkv6lIYt2lL3@vger.kernel.org, AJvYcCWgbgToYBHAlcR30vzDcChSES0QYCAOarfbHMeS6eJtUgRQAh96cddglnOJ/s8o1Q0cfrxpJcfIaocdFDnb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lreQimU/9tjrS3TyH7RaetMMSYCEJL+gVrUJMYDi8WinAXTw
	PTA6uC8GsQnb+pyIHFV5hvZkuVopEpGdSLq+0YPpibZlvpLcohqBk4OqFhDKDBLct6Z8uXm3lUj
	4eC/TrT1Ldr6g+URViWte1hZ5IJY=
X-Google-Smtp-Source: AGHT+IHWVIW11vGept4eUOpnLCpX6Ts6tf++sRjP2wV6wU9eTwvRnbvwKXwKawRbLo4KHZrBWFC0ZynTgBiV1Om/KXU=
X-Received: by 2002:a05:622a:6f0f:b0:458:23e5:1342 with SMTP id
 d75a77b69052e-45823e5172bmr110385861cf.56.1725968102360; Tue, 10 Sep 2024
 04:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240908113027.69471-1-kuzhylol@gmail.com> <dcbpkytpp56vqewjjqagdj7zful7l4kprhc5bjnu656pwgy4bn@3op2dcj6o3e3>
In-Reply-To: <dcbpkytpp56vqewjjqagdj7zful7l4kprhc5bjnu656pwgy4bn@3op2dcj6o3e3>
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Date: Tue, 10 Sep 2024 13:34:52 +0200
Message-ID: <CA+4v9GtB9_fnLXFcSUmpPdiSZOYfZB3OXq=ai6nUuwqmgw3FzA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jeff LaBundy <jeff@labundy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 8:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Sun, Sep 08, 2024 at 01:30:26PM +0200, Oleh Kuzhylnyi wrote:
> > Add documentation for the Hynitron CST816X touchscreen bindings.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> > ---
> >  .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/hynitron,cst816s.yaml
> >
>
> I asked to do some minor tweak if new version was going to be send...
> eh...
Wow, I just saw that. Thank you for bringing it to my attention.
>
> Best regards,
> Krzysztof
>

