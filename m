Return-Path: <linux-input+bounces-7706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C83969B0AE2
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 19:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F4E285F56
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 17:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47D021746B;
	Fri, 25 Oct 2024 17:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fy8UPvFC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1CB20BB35;
	Fri, 25 Oct 2024 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876498; cv=none; b=DlvCjGKOKflY3Fh1i4TT8hyJUlM+Et4F6KReG3tYGHINTBo6K3ukHVIgAbmE0d4IxqF4Wy9ltmBVyjoFhMEllsHzZO53vCmqTRyP+dA8suqo9wptTieYAx3No7QvRnFacVin97SRy/As1xFsDmmOmfZguU3uLBK2U+6KJhVCG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876498; c=relaxed/simple;
	bh=xiHHHj84vElRROpq2ASA7tSH2jTcWli8med+tCy2Wuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ukq2lYZzE5Yt6ncu94JOrGwc72+1GdVdpbc3y80yP6+ljICvO0lew4o5QkezkZevTjf07P3jW4hiBImNCW+9SaeeqB55OydKrArACaFKaT18R5RMHCvmoNU7NN3GXuPRreUtc/AjUbUmB5Q+Ygw+JwkW+2bxhObojLR4mUXy3Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fy8UPvFC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7206304f93aso67119b3a.0;
        Fri, 25 Oct 2024 10:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729876496; x=1730481296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=diCIplgfUyt+AugpCVVsGKJbNoYDMJcJ+hmuHjkI7LY=;
        b=fy8UPvFCcSD4GeEXfUK29Vo4KDFvZnQwzkJzlH8l+mjuTaG9lA80YZlcDZk1VJeTTx
         yCTkltrxBrKe4pHJP7bOg1LDjA/BNFf9bokaodTM9P3SbPEiXytb6Iubu/Ieg88+boXB
         H0aOZ42qCbwrmODPek4SaW3BRABuu4P52wuijjK4qZF0F6fIvZGSHjblTEmdt5LjJtdt
         8PLHyKzmXT8+qlD9B+kA8+e4srHtRXmes8VEa8SqtuJCRKIyAWGnOw1PVZMdoDyUgtKV
         dqq8MhVxo9OP08QsHpqudCNtvxH36sJquBxHedE2Bt0aPg8r9qCRKJB+Jb5Yf23YHSSq
         z8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876496; x=1730481296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=diCIplgfUyt+AugpCVVsGKJbNoYDMJcJ+hmuHjkI7LY=;
        b=aV+mMVCVvL1lvJgxHPme+Z1koxCyM+b+oIUIiQWUvGmz4gEkQ/77SAIkuivlMEVJYj
         PuOklu67fCzZaDBFo2x9UTIURm36r85dKwotds/kJu4LQ2bJpdR3Oq7PAWK2tiiggOos
         0lwQVSG4qZcFIzhnwRXnmst4+7EeEnoFzdOyei1EosfxRcn7kFneax7D0J0NklYyjhHj
         Md34wJvsN14IDwacqNyuLOfz+/GThXlPT/BBXuReYoqnt4vsn6k1lFmt6yEJvAvfPzkH
         dqxnLWBP5SF5eMuL83gluWD72heHjMNgBDuQYn1NIfJEDortdmSpa8KOagQSdg693YeV
         76tg==
X-Forwarded-Encrypted: i=1; AJvYcCVd7eYB7skDLpPSG80L+2sGytP1hLzBXhvAS+TFtRrGqJDZcjd8/iROeQZSCIzaOI59mfG9KJoMylbn/GEG@vger.kernel.org, AJvYcCWBAzBn1WO/IDKwc9k8we1vHawy2njXXYjX276V3jj+sRP5urnwRhji5Q+GV+mmPEKcizTlvfF2d6RfXQ8=@vger.kernel.org, AJvYcCWiDWiiUD9pvvBeNFS+RLfi910+/OEAUTYNoSqaTxjlhSIdHUlahnDKqKd+Z/UBWjiHQKpz0ruiEYMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEi7ADkupuXpGL/6OSvYsoSJW6BXRtUTFu2V3oFzr1oOUJ04W
	zkKOPUnR8HX+wYKJCYOWskYuG3BZDpZH3VtGFOTVTJ/+LPWYZXk0ScaLWA==
X-Google-Smtp-Source: AGHT+IGE6D8aXkxUnzwf6UZbayYgO2wOlwrY8JndIwdGjerZuaBFzwbkDmJQJaU1TMNVkDLM+5gx5A==
X-Received: by 2002:a05:6a00:b83:b0:710:9d5d:f532 with SMTP id d2e1a72fcca58-7206306d438mr328422b3a.19.1729876495785;
        Fri, 25 Oct 2024 10:14:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1691:2dbd:7c00:4e03])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205794fb6fsm1333606b3a.91.2024.10.25.10.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:14:55 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:14:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Charles Wang <charles.goodix@gmail.com>,
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxvSDJkBOozkp87d@google.com>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>

On Fri, Oct 25, 2024 at 09:19:14AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 25, 2024 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Oct 25, 2024 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Charles,
> > >
> > > On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - goodix,gt7986u-spi
> > > >
> > > > Compatible is already documented and nothing here explains why we should
> > > > spi variant.
> > > >
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  interrupts:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  reset-gpios:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  goodix,hid-report-addr:
> > > >
> > > > I do not see this patch addressing previous review. Sending something
> > > > like this as v1 after long discussions also does not help.
> > >
> > > Krzysztof is right that it's better to wait until we get consensus on
> > > the previous discussion before sending a new patch. I know you were
> > > just trying to help move things forward, but because of the way the
> > > email workflow works, sending a new version tends to fork the
> > > discussion into two threads and adds confusion.
> > >
> > > I know Krzysztof and Rob have been silent during our recent
> > > discussion, but it's also a long discussion. I've been assuming that
> > > they will take some time to digest and reply in a little bit. If they
> > > didn't, IMO it would have been reasonable to explicitly ask them for
> > > feedback in the other thread after giving a bit of time.
> >
> > If the firmware creates fundamentally different interfaces, then
> > different compatibles makes sense. If the same driver handles both bus
> > interfaces, then 1 compatible should be fine. The addition of '-spi'
> > to the compatible doesn't give any indication of a different
> > programming model. I wouldn't care except for folks who will see it
> > and just copy it when their only difference is the bus interface and
> > we get to have the same discussion all over again. So if appending
> > '-spi' is the only thing you can come up with, make it abundantly
> > clear so that others don't blindly copy it. The commit msg is useful
> > for convincing us, but not for that purpose.
> 
> OK, makes sense. Charles: Can you think of any better description for
> this interface than "goodix,gt7986u-spi"? I suppose you could make it
> super obvious that it's running different firmware with
> "goodix,gt7986u-spifw" and maybe that would be a little better.

Is there any chance for Microsoft-compatible HID-over-SPI versions of
the firmware for this chip? Will this require new compatible string? Or
it will be a different chip ID and the issue will be moot?

Thanks.

-- 
Dmitry

