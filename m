Return-Path: <linux-input+bounces-7704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C29279B09AA
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 18:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A86284BA9
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 16:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF0F502BE;
	Fri, 25 Oct 2024 16:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bVMlL5VC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592321A4CE
	for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729873176; cv=none; b=FbiwsVdD9r/uYgqroGSCk4yZZvYYz9tRyyPTpye/t9AagmpfzAaQFN3BTY9X+vy6M4NGJFKRCKZxEGQ9wmeMGGHbx8FGbojML/8jz3bFMxdtDwxptl/m25qm1CmCQ6I7vaX9QyK57BtMSml6ZljTI+yZancxFl19ByKaXEeHnGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729873176; c=relaxed/simple;
	bh=20kvON+allBWG+dOYdEwydFA2kFbEWyepoiWZBEaUn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLGPTjyYAmxPsWF5jGz9tNwjvEtlWkzyhu0uFVOD6DEpc86zFKFVcKjrAIsaxGO4J1HNGMZtvY+xjKTtPEXDoyTlVMef6NKbn19PiulMIteJwNJ8Xs8EBJKLIVdrpHlvo2dizJiBRmFL+0qqFXYBJdP2dhyGl7Ffej5hiKVqhE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bVMlL5VC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539983beb19so2863407e87.3
        for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 09:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729873171; x=1730477971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvhVvwnQMETeLbhAdwS48ux8c3HSfVAk89SUO2m7NmQ=;
        b=bVMlL5VC93hfDT3puZt6pgycktA2aLOV72KGx51e+txRDxX2BZv342ajDx6NXWwE9e
         W4wMMYZ+nyEInJk6dXssLoMazwfKKgiVwwMG1ENhFL9ywergm+YMawWN4/vZfEDkpIH6
         nrihYZ8xFpdij6tVnBkyy/d3TXs5JSW9j8yVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729873171; x=1730477971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvhVvwnQMETeLbhAdwS48ux8c3HSfVAk89SUO2m7NmQ=;
        b=cw8G3JHMChhR1iN9WBryA289oPb5S1yQzoFhFOEQ+JzV0vCXAo+fvMUPZQWU+X9k+p
         RRWJegWSuUQIOZRDVMBsleSiTvr8vVgpznlEnUomvjdnJL2+6TGVFu4MWtscAiJnb6jH
         QrAroSOBRcXNVCI9RUTKD80qPhXlJo6KE+MOabH3jF24ftvroDDZotb2CJ57j9QIlm7q
         qbkrUfVYad3PiXz64cFADWEBLjSjFEdq8ee3GmnWzEGlHivwTw9xjZIUBmOakXBGOYqp
         IOpmbmvCxTTbRgNpqoxcqivaVqB5qFv14GgG+o44Bo70wl/lVen0YRk1wSXeclAVrRgL
         4KEA==
X-Forwarded-Encrypted: i=1; AJvYcCXOqACHwllivsNek5MHPoAA246f0SOVexo+89Q1H/V5hMnFNv6EiKdx2uYVmvc1KhYG12kHTkEef7w8yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypfZL59zBbRIRgR9cuLCtKSJ4HjzCAaygk9SIZcgxkRF2dqHEF
	1CTU7FJN0IORfUoecQ97R60PyxWJWBxyurdB+ufSf1/d3QgipdLtSMw8igmK3tj4JDNXEZE8JPI
	7W7NS
X-Google-Smtp-Source: AGHT+IHoPFoNm1UtYx0D/jJVWshXE6MQd/860uN2QninHZkBkNY5sluOqV2F1mvQUr66IhwYkneccg==
X-Received: by 2002:a05:6512:15a3:b0:539:e817:967f with SMTP id 2adb3069b0e04-53b1a3083fbmr6319304e87.19.1729873171328;
        Fri, 25 Oct 2024 09:19:31 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1d5a62sm231031e87.233.2024.10.25.09.19.30
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 09:19:30 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb49510250so23881931fa.0
        for <linux-input@vger.kernel.org>; Fri, 25 Oct 2024 09:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR5pz4bE9HDNncdc3w0vMTGum7tN/kNd9QV01SMRMK5UVsjbzbG2VUZIXJMXxAjyMBxrufcr7DWnaVLQ==@vger.kernel.org
X-Received: by 2002:a2e:802:0:b0:2fb:587d:310 with SMTP id 38308e7fff4ca-2fc9d59ef65mr49259721fa.30.1729873169955;
 Fri, 25 Oct 2024 09:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com> <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
In-Reply-To: <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 25 Oct 2024 09:19:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
Message-ID: <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Rob Herring <robh@kernel.org>
Cc: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com, 
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org, 
	bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 25, 2024 at 8:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Oct 25, 2024 at 10:29=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
> >
> > Charles,
> >
> > On Fri, Oct 25, 2024 at 5:03=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - goodix,gt7986u-spi
> > >
> > > Compatible is already documented and nothing here explains why we sho=
uld
> > > spi variant.
> > >
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > > > +    maxItems: 1
> > > > +
> > > > +  goodix,hid-report-addr:
> > >
> > > I do not see this patch addressing previous review. Sending something
> > > like this as v1 after long discussions also does not help.
> >
> > Krzysztof is right that it's better to wait until we get consensus on
> > the previous discussion before sending a new patch. I know you were
> > just trying to help move things forward, but because of the way the
> > email workflow works, sending a new version tends to fork the
> > discussion into two threads and adds confusion.
> >
> > I know Krzysztof and Rob have been silent during our recent
> > discussion, but it's also a long discussion. I've been assuming that
> > they will take some time to digest and reply in a little bit. If they
> > didn't, IMO it would have been reasonable to explicitly ask them for
> > feedback in the other thread after giving a bit of time.
>
> If the firmware creates fundamentally different interfaces, then
> different compatibles makes sense. If the same driver handles both bus
> interfaces, then 1 compatible should be fine. The addition of '-spi'
> to the compatible doesn't give any indication of a different
> programming model. I wouldn't care except for folks who will see it
> and just copy it when their only difference is the bus interface and
> we get to have the same discussion all over again. So if appending
> '-spi' is the only thing you can come up with, make it abundantly
> clear so that others don't blindly copy it. The commit msg is useful
> for convincing us, but not for that purpose.

OK, makes sense. Charles: Can you think of any better description for
this interface than "goodix,gt7986u-spi"? I suppose you could make it
super obvious that it's running different firmware with
"goodix,gt7986u-spifw" and maybe that would be a little better.

I think what Rob is asking for to make it super obvious is that in the
"description" of the binding you mention that in this case we're
running a substantially different firmware than GT7986U touchscreens
represented by the "goodix,gt7986u" binding and thus is considered a
distinct device.

At this point, IMO you could wait until Monday in case Krzysztof wants
to add his $0.02 worth and then you could send a "v2" patch addressing
the comments so far, though of course you could continue to reply to
this thread if you have further questions / comments.

-Doug

