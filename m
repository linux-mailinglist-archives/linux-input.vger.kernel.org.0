Return-Path: <linux-input+bounces-7774-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE29B6BEC
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 19:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 536F0B20D40
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 18:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE2961CB53E;
	Wed, 30 Oct 2024 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fPZ+HM9G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D331C3F01
	for <linux-input@vger.kernel.org>; Wed, 30 Oct 2024 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730312093; cv=none; b=uYE7yUVCEE24zWXTCIA3YmKb10d6vAQsbjt/gKkx9voEkmOiHB+nbSwmRasocY/PqQTLkVmQ5aM6ZTl66+7EHmol9V8+33CXimAKarr3L6Lr67DqI2iN6cnm6LikDORNPwlhw3AKF101ZeIrH5a3Z/PkxXvQQWzFojKjv9SUPrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730312093; c=relaxed/simple;
	bh=YSe3U/islx/1E277CWlGToGgYM9Ft9hfht8JqqNvJpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y222WvijsvHoH9g/BwbskT4oRqv0wDN0rSG5K7HloufoYTTBu94NyH814lAy9es9XaU6z+syYBnQteG3JUX9BXzB7e0VKuxVRkyobYn3rGfe83GrnFDQwEOPNN+22BbJHxiKeOKZgz7uJzqtDls+AtLtLRbP/+1ZOvODypWMxoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fPZ+HM9G; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso954201fa.1
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2024 11:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730312087; x=1730916887; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+U2OYjPXp1HVwKGheeUQjqD1Lkt2kZkOmbCmlNpJsuo=;
        b=fPZ+HM9Gh3bSxLPI6VGcfVBfmT5UFnjLOZQmOJ3GLw0IcuOtUgLrn9Xfm/uFzBxcCe
         8/CFvLVuH4vsN7kSpNIP6QdCygRS4R7+PIVL4sLDPCwU+4IFf9+Nlsv+t+m9JqorAxxU
         OuOl25H1NO+BbzSxYcBOtbdDXCGMLHyu/0xig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312087; x=1730916887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+U2OYjPXp1HVwKGheeUQjqD1Lkt2kZkOmbCmlNpJsuo=;
        b=vtK/cUez6ObVS5cHydUHjj1FKUxc/id4HEUkhXzY2fVREPD0YqiqAGQK0Cz16M+xLA
         JdB6CPITUgDg5jPemrt6x5MJstgNHUXWp1eimVuEhcKLnp4P6d/3ZcQGJp5rPltxE+qH
         PgnwfVO1GHVI+5u51zScGXGicaMh6Ff41B5eTS4E8EriKZoghmFeL2lSI7KtbtZrwQ0Q
         b6nGbkWNXAgKKiFrYyGBFLEYUkH+DyP+j1AT7G8053EKmfbdm0qB/HbbyHOipRgJZ7BE
         EzyJdkqTMg/FyZ7mCSQZ2yAh08tbVZPVYrHZySfLQUpW2GWpKfF2yQzDkCOYqfcPO0WW
         jJkg==
X-Forwarded-Encrypted: i=1; AJvYcCXjyl6+ig/xiB0+yKAZBBRKSZvFRUkjKKd9ObOhLol/bzI6XeZZGDl7rFgpo2ETg4nZTrvJeftIVpjVqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQor0XtA8eeutPhbE9hAakrfzW7OpcZBkdodIe/6wvneeyvr+2
	F8oUthq/z7kBGe+n9pc88PHCqARuLlAtjbrXhDaKHCn57Aqc7KJU8O9sHxIDlIKYLgwCmtlM+0y
	kow==
X-Google-Smtp-Source: AGHT+IFR100kuu+jc99KiZdjlyYXefa7Eyf+RV2nR58Ha4BqGgWl9Ace1zpNSfr+xqFm6/j2RtUJGQ==
X-Received: by 2002:a2e:a587:0:b0:2fb:5014:aad4 with SMTP id 38308e7fff4ca-2fcbdf612dfmr111215321fa.9.1730312085440;
        Wed, 30 Oct 2024 11:14:45 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fd4aec3825sm3382301fa.56.2024.10.30.11.14.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Oct 2024 11:14:44 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso952751fa.1
        for <linux-input@vger.kernel.org>; Wed, 30 Oct 2024 11:14:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVg6X/4/PyhU6628X+N5AfcCY4Luhp/pepT88BmJM7v8OBVKmd8wmacnDwEH2xbGsXToVnpdLAjFJDH9w==@vger.kernel.org
X-Received: by 2002:a05:651c:507:b0:2f7:6653:8053 with SMTP id
 38308e7fff4ca-2fcbdfc5394mr135074691fa.18.1730312084050; Wed, 30 Oct 2024
 11:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com> <ZyHYw40duPrm0ZeF@ux-UP-WHL01>
In-Reply-To: <ZyHYw40duPrm0ZeF@ux-UP-WHL01>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Oct 2024 11:14:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtbBnCX6fcqBFYPO3C=zw8YhKmJ35hW920JWt0MvDqPw@mail.gmail.com>
Message-ID: <CAD=FV=WtbBnCX6fcqBFYPO3C=zw8YhKmJ35hW920JWt0MvDqPw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 29, 2024 at 11:57=E2=80=AFPM Charles Wang <charles.goodix@gmail=
.com> wrote:
>
> On Fri, Oct 25, 2024 at 09:19:14AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Oct 25, 2024 at 8:59=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Fri, Oct 25, 2024 at 10:29=E2=80=AFAM Doug Anderson <dianders@chro=
mium.org> wrote:
> > > >
> > > > Charles,
> > > >
> > > > On Fri, Oct 25, 2024 at 5:03=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > > >
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - goodix,gt7986u-spi
> > > > >
> > > > > Compatible is already documented and nothing here explains why we=
 should
> > > > > spi variant.
> > > > >
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  interrupts:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  reset-gpios:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  goodix,hid-report-addr:
> > > > >
> > > > > I do not see this patch addressing previous review. Sending somet=
hing
> > > > > like this as v1 after long discussions also does not help.
> > > >
> > > > Krzysztof is right that it's better to wait until we get consensus =
on
> > > > the previous discussion before sending a new patch. I know you were
> > > > just trying to help move things forward, but because of the way the
> > > > email workflow works, sending a new version tends to fork the
> > > > discussion into two threads and adds confusion.
> > > >
> > > > I know Krzysztof and Rob have been silent during our recent
> > > > discussion, but it's also a long discussion. I've been assuming tha=
t
> > > > they will take some time to digest and reply in a little bit. If th=
ey
> > > > didn't, IMO it would have been reasonable to explicitly ask them fo=
r
> > > > feedback in the other thread after giving a bit of time.
> > >
> > > If the firmware creates fundamentally different interfaces, then
> > > different compatibles makes sense. If the same driver handles both bu=
s
> > > interfaces, then 1 compatible should be fine. The addition of '-spi'
> > > to the compatible doesn't give any indication of a different
> > > programming model. I wouldn't care except for folks who will see it
> > > and just copy it when their only difference is the bus interface and
> > > we get to have the same discussion all over again. So if appending
> > > '-spi' is the only thing you can come up with, make it abundantly
> > > clear so that others don't blindly copy it. The commit msg is useful
> > > for convincing us, but not for that purpose.
> >
> > OK, makes sense. Charles: Can you think of any better description for
> > this interface than "goodix,gt7986u-spi"? I suppose you could make it
> > super obvious that it's running different firmware with
> > "goodix,gt7986u-spifw" and maybe that would be a little better.
> >
> > I think what Rob is asking for to make it super obvious is that in the
> > "description" of the binding you mention that in this case we're
> > running a substantially different firmware than GT7986U touchscreens
> > represented by the "goodix,gt7986u" binding and thus is considered a
> > distinct device.
> >
> > At this point, IMO you could wait until Monday in case Krzysztof wants
> > to add his $0.02 worth and then you could send a "v2" patch addressing
> > the comments so far, though of course you could continue to reply to
> > this thread if you have further questions / comments.
> >
>
> Thank you for your explanation, I understand your point. I want to clarif=
y
> that the gt7986u-spi and gt7986u indeed use two entirely different driver=
s
> and two distinct firmware.
>
> Using "goodix,gt7986u-spi" could indeed cause confusion. How about modify=
ing
> it to "goodix,gt7986u-losto" by adding a special code?

If "lotso" somehow means something real to people using this product
then that seems OK to me. If "lotso" is just a made up word because
you don't want to use "spi" or "spifw" then it's not great. In either
case you'll want to summarize our discussion here in your
"description" in the yaml and in the commit message.


> Additionally, I would like to confirm: when submitting the v2 patch, shou=
ld
> it be based on this thread or the previous discussion thread?

No, v2 should _not_ be In-Reply-To this thread. It'll start a new
thread. You can add a link (via lore.kernel.org/r/<message-id>) to the
old discussion in your cover letter and/or version history.

Said another way:
* New versions of patches create new threads.
* The fact that new versions of patches create new threads is why
people usually want open questions answered before the next version is
sent.

:-)

