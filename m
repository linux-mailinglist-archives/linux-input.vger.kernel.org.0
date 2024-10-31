Return-Path: <linux-input+bounces-7796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D84979B7511
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C73C285F1C
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222041487D1;
	Thu, 31 Oct 2024 07:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVp4vsf2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C91BD9D4;
	Thu, 31 Oct 2024 07:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730358706; cv=none; b=FAH4GnKV9Cg4kJMdZ5RkT3WbIAMu4FzMzU8eYooGJVBMaTI2m7sYY0Q5DlL9ye0lTmFPFt7Rf55sGhugdoA+VkhckHSb4rSE+wMKyuEPrnBEZ9/MwrrV3P0uaTnKl9tw0/ZdqDD2rf9ZQP9c/c+4T42g4K9lvVonCIi9dVV8vWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730358706; c=relaxed/simple;
	bh=KmEQQ1s6Mv96zNVsmm/PGUzclVUeYqkmH1f/zLli7+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8aaUHhe4Q9LrY+ykupbP5NX9PwTBl7uc+c6aj0Rcyuhr9XZ45lKXvzT1h8wqWO7T/EiAAr6zBPhcXO8YnYHsEL2gjJd4qK4n0UhI1SyamQ+nicjDZoBq+pVliSrb48CRPK1DgBUJWOkhyYCqmltfrQAQU5u6CfN0C0/9G/APlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVp4vsf2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so471877b3a.1;
        Thu, 31 Oct 2024 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730358703; x=1730963503; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F8kx/Q3WV6oV1a8lTuJyAF8FReeIGHyPGyomJSeRgH8=;
        b=hVp4vsf2j5/gE1N3eXEpns8BFu1t+25bP2UUC+i2c3/438BlwHl0PvP1QHbEkSKtry
         BTJ4H/6TO5VjG3DK2W2zI5pfr5c/r8vmc1har+NkQNQQz1B8b7KgGevx23oULOBB7EbK
         OC1jacEoRbFZ93S37L6+n3+I+whNZOK13ioQUNqMdyV7p9dA2sjGzo8upLkAIlHNqqJh
         ddGQZbNiw+oAeC5ywUo+s95Ua+Iwxpd5N3rxn+4eXcaopo4tF0MDnsN2nxgf5qKo1wmy
         2ijJKCYADiNL0qwYWD1SIEbGwnFHuyf95H0sFbwQZ6uMoWZr7fbnnUbEW8s3qfA3fjO2
         tdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730358703; x=1730963503;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8kx/Q3WV6oV1a8lTuJyAF8FReeIGHyPGyomJSeRgH8=;
        b=gDUdCtThA36G04lEE1GUOk0tzE9ed54P8b8jWOfgvv6rbuPEElQDOiUlpiQHnTrvvP
         8SYwJGqdhwRnuYNf1ZJj0mQloUH97zqqjqhywgdYQ5wwyTgCrfCp0xXAj6T/YnAkbaof
         bXYEuwMI+lpGBhkt++hqkW0ojUt3lYmwCx80N6Upox4J4yCyrl8FRFtCLSQewHpTA2Mu
         QowwQJOCQXs3VVw3MfAoSFXhT+ddIOtYPKprHVDDQWoW/R+p/QRPK5dQE9HqxxJYdp6F
         W65PVoHvq/oZAl3rdhlgrxunOGGM2yqRUPgLpWQ5y/gNrteqpl5KY+I0zEVNvb1fmAhV
         C4fg==
X-Forwarded-Encrypted: i=1; AJvYcCULq1vwP1faUN3Be/kyioKWDDD6Rpxitk82t4wOTPiA5GzMSUCU230YEYPJhQ6LELW6a8sJ6HIHIGCHVBg=@vger.kernel.org, AJvYcCUk7M5VsUBT/il00ccbd3i7x2I2TSPfAZeLLR/okTQvjRGO+G9Aloe9sXNMhhk37M0wGs1VEPj/4JVm@vger.kernel.org, AJvYcCWpJavMu9rs5XlOQ+pUi6nN9/+mNIpLXpTGcwnJ5qCj/PDfo+ftwpj9b9JgcxYQiLZuPy90QSRrpuf+4WS8@vger.kernel.org
X-Gm-Message-State: AOJu0YyvVRMBjIJTfo4QCJLwghvI1z3cII6Qkc57W5KXF4rkAlp6w3Au
	HOILTss2aD83HAnN/wJ7uQH/Bh3LjFJfRU5ahf/dcjTqiaRuBbsz
X-Google-Smtp-Source: AGHT+IHlT1ly2KZHCHWRKW2rHfaZSrWxzDKTGW1GCGmqFUlvEOGZPgfcDgXjuS+I6C3x4NVHtADn2Q==
X-Received: by 2002:a05:6a20:b30a:b0:1d9:c6c5:70c with SMTP id adf61e73a8af0-1d9c6c62035mr13190038637.5.1730358703112;
        Thu, 31 Oct 2024 00:11:43 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2ed8:ab06:94f5:966b:9066:6b36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3e08sm629364b3a.105.2024.10.31.00.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:11:42 -0700 (PDT)
Date: Thu, 31 Oct 2024 15:11:15 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyMtk4_z0gvF4Fhj@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
 <ZyHYw40duPrm0ZeF@ux-UP-WHL01>
 <CAD=FV=WtbBnCX6fcqBFYPO3C=zw8YhKmJ35hW920JWt0MvDqPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WtbBnCX6fcqBFYPO3C=zw8YhKmJ35hW920JWt0MvDqPw@mail.gmail.com>

On Wed, Oct 30, 2024 at 11:14:26AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 29, 2024 at 11:57 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > On Fri, Oct 25, 2024 at 09:19:14AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Fri, Oct 25, 2024 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Oct 25, 2024 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > Charles,
> > > > >
> > > > > On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > >
> > > > > > > +properties:
> > > > > > > +  compatible:
> > > > > > > +    enum:
> > > > > > > +      - goodix,gt7986u-spi
> > > > > >
> > > > > > Compatible is already documented and nothing here explains why we should
> > > > > > spi variant.
> > > > > >
> > > > > > > +
> > > > > > > +  reg:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  interrupts:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  reset-gpios:
> > > > > > > +    maxItems: 1
> > > > > > > +
> > > > > > > +  goodix,hid-report-addr:
> > > > > >
> > > > > > I do not see this patch addressing previous review. Sending something
> > > > > > like this as v1 after long discussions also does not help.
> > > > >
> > > > > Krzysztof is right that it's better to wait until we get consensus on
> > > > > the previous discussion before sending a new patch. I know you were
> > > > > just trying to help move things forward, but because of the way the
> > > > > email workflow works, sending a new version tends to fork the
> > > > > discussion into two threads and adds confusion.
> > > > >
> > > > > I know Krzysztof and Rob have been silent during our recent
> > > > > discussion, but it's also a long discussion. I've been assuming that
> > > > > they will take some time to digest and reply in a little bit. If they
> > > > > didn't, IMO it would have been reasonable to explicitly ask them for
> > > > > feedback in the other thread after giving a bit of time.
> > > >
> > > > If the firmware creates fundamentally different interfaces, then
> > > > different compatibles makes sense. If the same driver handles both bus
> > > > interfaces, then 1 compatible should be fine. The addition of '-spi'
> > > > to the compatible doesn't give any indication of a different
> > > > programming model. I wouldn't care except for folks who will see it
> > > > and just copy it when their only difference is the bus interface and
> > > > we get to have the same discussion all over again. So if appending
> > > > '-spi' is the only thing you can come up with, make it abundantly
> > > > clear so that others don't blindly copy it. The commit msg is useful
> > > > for convincing us, but not for that purpose.
> > >
> > > OK, makes sense. Charles: Can you think of any better description for
> > > this interface than "goodix,gt7986u-spi"? I suppose you could make it
> > > super obvious that it's running different firmware with
> > > "goodix,gt7986u-spifw" and maybe that would be a little better.
> > >
> > > I think what Rob is asking for to make it super obvious is that in the
> > > "description" of the binding you mention that in this case we're
> > > running a substantially different firmware than GT7986U touchscreens
> > > represented by the "goodix,gt7986u" binding and thus is considered a
> > > distinct device.
> > >
> > > At this point, IMO you could wait until Monday in case Krzysztof wants
> > > to add his $0.02 worth and then you could send a "v2" patch addressing
> > > the comments so far, though of course you could continue to reply to
> > > this thread if you have further questions / comments.
> > >
> >
> > Thank you for your explanation, I understand your point. I want to clarify
> > that the gt7986u-spi and gt7986u indeed use two entirely different drivers
> > and two distinct firmware.
> >
> > Using "goodix,gt7986u-spi" could indeed cause confusion. How about modifying
> > it to "goodix,gt7986u-losto" by adding a special code?
> 
> If "lotso" somehow means something real to people using this product
> then that seems OK to me. If "lotso" is just a made up word because
> you don't want to use "spi" or "spifw" then it's not great. In either
> case you'll want to summarize our discussion here in your
> "description" in the yaml and in the commit message.
> 

Okay, got it.

> 
> > Additionally, I would like to confirm: when submitting the v2 patch, should
> > it be based on this thread or the previous discussion thread?
> 
> No, v2 should _not_ be In-Reply-To this thread. It'll start a new
> thread. You can add a link (via lore.kernel.org/r/<message-id>) to the
> old discussion in your cover letter and/or version history.
> 
> Said another way:
> * New versions of patches create new threads.
> * The fact that new versions of patches create new threads is why
> people usually want open questions answered before the next version is
> sent.
> 

Okay, thank you very much for your patient explanation.

Best regards,
Charles

