Return-Path: <linux-input+bounces-7766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 505A29B5C42
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 08:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C96811F22DA6
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 07:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30241DC1A2;
	Wed, 30 Oct 2024 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3I5MJ1Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA40A1DB55C;
	Wed, 30 Oct 2024 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730271943; cv=none; b=rVxg0EsSZg1riYTGHqQFS0S0W6aQqGZLsRs4vnHY10vKy81cIYF7psjSRwsoU1OaoghWnj82rzBv1l/+05mkg5MSj1e4zPryhI183nn5XQ+60qUew2IOJge1raX/PryxbCT+iodJXeva+qRKJ917oiu432QqXaWVf/YVH1ALJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730271943; c=relaxed/simple;
	bh=FKvWML6egPeSPy565IJ4UiPLQrgY18N5I5wVQKj/WmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmCO0U36rYmpKQaoN2N1jg6TXF63PtgTuVszrLhMe5hU6DE5IEJ7aVA69e0XyZWOobSBagFTx5Qp5ch1VaXqK9m6ndtitKnRtFL4KmocTr+TTXPaP0seWRfllmkIvvfznd2Z6vcE555HVG7xfxiJwyaRCvKwuFwcoZQ4+Gq8BOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3I5MJ1Z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso12316640a12.3;
        Wed, 30 Oct 2024 00:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730271940; x=1730876740; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a94qWPo/eAj/4+7JSY/BQUfRtKOaj2dvP/UkphqzYiA=;
        b=W3I5MJ1ZrMjjwfMZ+mcR4g+2/NEJxH2cTQ+m4YAMcKLn4CpmjVEoeLP4KRbSRmBttU
         /Y0b4IvHMPXZKWcsuytUOZiBqbaDkaOUgk2jyTPzavlqaE3bHVJMb/XObLYdS7OAv1Oz
         t4CfCLaAprPsDuyBmkgHcO0DLQAGQl1uOD9fblfeerJ7qAsi0TISXeOWS0rXizd4gzIu
         c7WfMSh8zpY9LgNQOiIszobaDRNkAunJK8r4JQoBym0edB4CElZQToJrzwTv8bTLp1j6
         h3IY10LNg7MUje6EJhnLu94CUAEu0R4CzDMHJ1v5Er1oVJ64n0TMZUC07WpGeOlheRJm
         tcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271940; x=1730876740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a94qWPo/eAj/4+7JSY/BQUfRtKOaj2dvP/UkphqzYiA=;
        b=VMqvQ9fzxuqBcyO2aCxvem5Da40b1yyFf018j+rv2Ah9evUZj5rfhd9P4iU+m9nIAt
         cJortGDlWO4U2gK6lF8HC8jVNRwqNHYgZNqp7VuLT6GKcqd5iB5SpnBMKGtTavoGm4fY
         h0ogQ28K8g1jdtdHCOzinVBs+xyt/a1Aa0PL9wBh4xgnpgvpzRMUkLBDMNpSLEybWq/J
         d29hFjCt/iPBPRa5dIWaUls0q6a+8pm6VL7SZ/VqQKhdixe3iZrqJlbmQXtYoX7j2oF1
         01R2ouSxYGzfEsJv8wCJhTSnUKsS6dVeaEytKHIUFgOqZX+p9UBCZ/ahnP6oVDoNoORt
         bUFA==
X-Forwarded-Encrypted: i=1; AJvYcCU1oAZ/+qU4ztzfO/Rh+dJFNpxev90Do1JdKlIOBqVCj8NwuuMnTnAbVJkK5uwLR5xI/TCnaDeT3UFIgwc=@vger.kernel.org, AJvYcCUAq32B4+ylHJSqN3w6fmtYejN9PHgk+Ix8I0kFH9+Qh5yfTKeaRzbgt32kLgMsvSdTtBYZGPOzdsEV+uTv@vger.kernel.org, AJvYcCVdpLrPfdGmr8rwGG+GGIByR17z4MtIi1CGT2mfyVtYdL9laGAsrXzOwAjYuKqv90Us7cJGVM16p9gD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4em6UHj5+1BkHkfxImtmBm0a3PnsRnNsazRhp5uhQrHR+35kX
	SWoLwBLOjN3AIkTgT/yAVSv5P3HQxU+qeAXBAFPDaI0PFf+tKteXYEhhPORg
X-Google-Smtp-Source: AGHT+IFkKTzxTFviTyT3AvCyKj11fatcdAAE9wC0mDGf13f1RPqfDUGvrI6ZQ7KnPipMs8yS4CiOhg==
X-Received: by 2002:a17:906:c14a:b0:a9a:80bd:2920 with SMTP id a640c23a62f3a-a9de61990b1mr1400793566b.53.1730271939651;
        Wed, 30 Oct 2024 00:05:39 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08906dsm532838766b.209.2024.10.30.00.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:05:38 -0700 (PDT)
Date: Wed, 30 Oct 2024 15:05:30 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Charles Wang <charles.goodix@gmail.com>,
	hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyHaugCcAW8E10pG@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
 <ZxvSDJkBOozkp87d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxvSDJkBOozkp87d@google.com>

Hi Dmitry,

On Fri, Oct 25, 2024 at 10:14:52AM -0700, Dmitry Torokhov wrote:
> On Fri, Oct 25, 2024 at 09:19:14AM -0700, Doug Anderson wrote:
> > Hi,
> > 
> > On Fri, Oct 25, 2024 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Oct 25, 2024 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Charles,
> > > >
> > > > On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > >
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - goodix,gt7986u-spi
> > > > >
> > > > > Compatible is already documented and nothing here explains why we should
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
> > > > > I do not see this patch addressing previous review. Sending something
> > > > > like this as v1 after long discussions also does not help.
> > > >
> > > > Krzysztof is right that it's better to wait until we get consensus on
> > > > the previous discussion before sending a new patch. I know you were
> > > > just trying to help move things forward, but because of the way the
> > > > email workflow works, sending a new version tends to fork the
> > > > discussion into two threads and adds confusion.
> > > >
> > > > I know Krzysztof and Rob have been silent during our recent
> > > > discussion, but it's also a long discussion. I've been assuming that
> > > > they will take some time to digest and reply in a little bit. If they
> > > > didn't, IMO it would have been reasonable to explicitly ask them for
> > > > feedback in the other thread after giving a bit of time.
> > >
> > > If the firmware creates fundamentally different interfaces, then
> > > different compatibles makes sense. If the same driver handles both bus
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
> 
> Is there any chance for Microsoft-compatible HID-over-SPI versions of
> the firmware for this chip? Will this require new compatible string? Or
> it will be a different chip ID and the issue will be moot?
> 
No, the SPI hardware design of this chip does not meet the requirements for
the Microsoft HID-over-SPI protocol. A new chip with a new ID will be
developed to support the Microsoft HID-over-SPI protocol.

Thanks,
Charles

