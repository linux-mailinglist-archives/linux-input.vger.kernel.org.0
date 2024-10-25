Return-Path: <linux-input+bounces-7696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C09B0165
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 13:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753761C23696
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 11:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369341FDF8B;
	Fri, 25 Oct 2024 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+ayE1VE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4D1D63CF;
	Fri, 25 Oct 2024 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729856002; cv=none; b=Ii7LxTqcpSYmSXIMNhhAT6cUxPd7cPgL5dCRjuTIwkjcLXrUql63nxjG7mTsERpkud9mfcMZWZ+LspglDV2mj9gfVpgbAIPG+eBucSifhGaZW009iJ0Li2TL4QdyP6EaeBeI6bnT0U+LybyjNrbodlzPeggfyGjLPVPpuQdJfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729856002; c=relaxed/simple;
	bh=v1+FW3oZMBYtNOa3/rr01pkLhuHMELY1TEiarupmRwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+uZe8HJC0bmTL/CNq6rlp8DCGwkQ4QmQDw88O9Scj31lB/+l7H51ShZNpuBgfE+kHPJHPYhiC6xIQ5TRvAO6UUbrz9NlirAcRFaqzVK+5QlxYUS2ZqfgM7aGRIqmX2G3RD2JxpMdFQjoMN9vM81qkyFgA5pLi5aVnIvqrzgIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+ayE1VE; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so19729461fa.1;
        Fri, 25 Oct 2024 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855997; x=1730460797; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeufJuKT1ycrKumOhyeqb+AwbwE/ALTkAhfPv+A85Pw=;
        b=P+ayE1VEvsRw8sThl8oG4teyqfuJ9ibeGKmCTurzgkU08f1uSkpaMm6NzHxFgiLb+k
         nhUqR+wssthftm7Y2tPrS7XDDRtBolilD5CumApwxKFcDBygPb9Hj2XH2d8birhQfHPx
         JGmn1RLuTCnbjZgEAY/zzX7uAD6slN9+c29wTpArPQn2NcE9ifTLjePFus3k3xr/9xvI
         iA54bg5BB/Y6f+oL/Gf5rcJXIxsQKyfLOhtzkDGVQEoFkuPMTNY5qh5yxOrMzmq3fV8C
         43Fek2cijBXBy4ockrKrOUOthCEzT4PWR9KBRzyQ+eeLUPEFMNO5LM8Aaie8k3r4LiqP
         /uDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855997; x=1730460797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeufJuKT1ycrKumOhyeqb+AwbwE/ALTkAhfPv+A85Pw=;
        b=TcFcRtCiw48g2sq+zIrIHLmojfkMW+9iT6cy75TN2doN7oEP5Ya4/4A4wimYi7G9OD
         lPkLOg4bQPZUjZa3iH4786K6BxHk7PFrw2K7oyFp6kMXaEXoaEYSE1g9dn1TO3qBiSiH
         FQKup38nKb/lxm6Arzsvm06i+c4/bXAgWAzJ//noZF52S6ApzYhyIKzKOHI7bYfg8Uc6
         IuI0tO9lPDAP2JtpxqJcUTE26jI27n0gn2TD7hkYJ/+4j6ScxwMHYq5DxgEJC+79mSzO
         vfMMblon+xF7qNR0bg0SHprDJ6ua7LmhR58nI211Or1RRU9f99hvcmvlyHczm0IZmItt
         BRLA==
X-Forwarded-Encrypted: i=1; AJvYcCUzD7C038OytpMidAB0CYvDeXsvKoM67t7Yxbit3fzgCsOzcS4SB90saHukDdsVijzCTbyFNeHl1od3@vger.kernel.org, AJvYcCVOYB6FN28dlsXTlQOdX10TVMbfBUSUGme/0hBxsK3k5pFkaGKExXKl2NcFuHVDbLCcFz4sbdGY0WFCAV8=@vger.kernel.org, AJvYcCXsewj8rYmmwdqLOiQ114mFj/mYLbbEe00hphoaP4Lp7GHw/rcyvhZk4Qgzyxhk19iON/VDWQ4cGa2hVJ/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yz943bhET8pJxpHIMZYd/DWXOcw4CNjUC44tJzF5CTMbyTodB2O
	x2vYicjt0LfqdN4O3FnIO43NA1C/ZnY8tWuaHkPcBBJ0DakZdPnoU8K8Z8TP
X-Google-Smtp-Source: AGHT+IETBtTDPUFSRro6o1TK8GWYShNqhiQJljX9cMhs6N3C8qFJZLlf/P/lyPVZWXMjRgl0VocQog==
X-Received: by 2002:a05:651c:221d:b0:2fa:d345:18b9 with SMTP id 38308e7fff4ca-2fca827e963mr34668511fa.38.1729855996719;
        Fri, 25 Oct 2024 04:33:16 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631a242sm530113a12.76.2024.10.25.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:33:16 -0700 (PDT)
Date: Fri, 25 Oct 2024 19:33:07 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxuB8xDebT8DwIqq@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
 <ZxMfu4yxk961mZWB@ux-UP-WHL01>
 <fbde8a3a-3adc-4c1a-8529-fde0fa149c8e@kernel.org>
 <CAD=FV=VphXewyk_mpGHUZKw8_aK8HnH8T-YumwM70eyz22S+Aw@mail.gmail.com>
 <ZxdRaaCR7eTOCQkB@ux-UP-WHL01>
 <CAD=FV=UFonOVHUP5_9+BfJp71CFX7KKA1Gx=boN0=3_4cCKnZw@mail.gmail.com>
 <ZxiZXeQzIaDYuu1F@ux-UP-WHL01>
 <CAD=FV=WSUrjbEzG83kYt50FRQ-Bu+bQP17JY_wPAEBf_GxGTJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WSUrjbEzG83kYt50FRQ-Bu+bQP17JY_wPAEBf_GxGTJg@mail.gmail.com>

Hi,

On Wed, Oct 23, 2024 at 12:35:09PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 22, 2024 at 11:44 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > Hi,
> >
> > On Tue, Oct 22, 2024 at 09:12:33AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Tue, Oct 22, 2024 at 12:19 AM Charles Wang <charles.goodix@gmail.com> wrote:
> > > >
> > > > Hi Doug,
> > > >
> > > > On Mon, Oct 21, 2024 at 08:37:32AM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Oct 21, 2024 at 2:43 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > > > >
> > > > > > On 19/10/2024 04:55, Charles Wang wrote:
> > > > > > > Hi Doug
> > > > > > >
> > > > > > > On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
> > > > > > >>
> > > > > > >> On Thu, Oct 17, 2024 at 7:09 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > > > > > >>>
> > > > > > >>> The Goodix GT7986U touch controller report touch data according to the
> > > > > > >>> HID protocol through the SPI bus. However, it is incompatible with
> > > > > > >>> Microsoft's HID-over-SPI protocol.
> > > > > > >>>
> > > > > > >>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > > > >>> ---
> > > > > > >>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> > > > > > >>>  1 file changed, 58 insertions(+), 10 deletions(-)
> > > > > > >>
> > > > > > >> I'm happy to let device tree folks make the call here, but IMO it
> > > > > > >> would be much cleaner to just consider the I2C-connected GT7986U and
> > > > > > >> the SPI-connected GT7986U to be different things and just use a
> > > > > >
> > > > > > Same device, you cannot have different compatibles. The way how the same
> > > > > > (literally same chip) device sits on the bus is not part of the binding,
> > > > > > thus no different compatibles.
> > > > >
> > > > > I don't want to belabour the point too much, but this doesn't feel
> > > > > completely black and white here.
> > > > >
> > > > > "Same chip": a whole lot of laptops and phones all use the "same chip"
> > > > > (same SoC) yet are different products. ...or you can look at the fact
> > > > > that many peripherals have the same STM32 or Nuvoton chip in them but
> > > > > are wildly different peripherals.
> > > > >
> > > > > In this case, Goodix may have made an ASIC called "GT7986U" that has
> > > > > some type of CPU on it that can run firmware that can talk as an I2C
> > > > > device or a SPI device. This ASIC may be intended to be used as a
> > > > > touchscreen controller, but fundamentally it doesn't feel that
> > > > > different from an STM32. You can build different boards designs with
> > > > > the "GT7986U" on it and those boards are intended to run different
> > > > > firmware.
> > > > >
> > > > > People manufacturing touch controller boards presumably put this
> > > > > "GT7986U" on their touch controller board, maybe set certain
> > > > > strappings telling it that it's talking over SPI or I2C or maybe just
> > > > > decide which pins they're going to wire out to the board-to-board
> > > > > connector on the touch controller board. A touch controller board
> > > > > intended to talk over SPI may look 98% the same as a touch controller
> > > > > board intended to talk over I2C, but what percentage of "sameness"
> > > > > means that we need the same compatible string?
> > > > >
> > > > > Would things be different if Goodix decided to manufacture touch
> > > > > controller boards themselves and sold two SKUs: a GT7986U-S and a
> > > > > GT7986U-I?
> > > > >
> > > > > I would also note that (reading back in previous conversations) I
> > > > > think Charles said that they run different firmware on the SPI vs. I2C
> > > > > touch controllers. As I understand it, the firmware running on a
> > > > > device can make it a different device from a device tree perspective.
> > > > > The device tree does its best to describe just the hardware but it can
> > > > > get fuzzy. For instance the "VID/PID" of a USB device is usually
> > > > > something programmable and could be updateable by a firmware change
> > > > > but we still may need to encode the VID/PID of the firmware that is
> > > > > intended to run on the device in the device tree.
> > > > >
> > > > > Anyway, I'm happy to be quiet about this and fine if folks want to
> > > > > continue to work towards a "unified" binding. It makes me a little
> > > > > uncomfortable that I'll still end up listed as a "maintainer" of the
> > > > > unified binding because I don't totally agree with it, but I'm also
> > > > > pragmatic and I'd rather have something that can land.
> > > > >
> > > >
> > > > Thank you very much for your attention. Your understanding of the GT7986U
> > > > SPI and I2C devices is correct. There is no fundamental difference between
> > > > them and the STM32, as they are all ASIC devices. The functionality of the
> > > > device is determined by the firmware that is loaded, although the GT7986U
> > > > is an ASIC specifically designed for touchscreens.
> > > >
> > > > Additionally, the firmware and devices are generally bound to specific touch
> > > > panels, meaning that firmware intended for SPI will not function properly on
> > > > an I2C touch panel.
> > >
> > > Just to get clarity: how is GT7986U delivered? For instance:
> > >
> > > 1. Maybe Goodix produces touchscreen controller boards and ships them
> > > to customers for use in their products. In this case, does Goodix ship
> > > a single board with two connectors, or a separate board for SPI vs.
> > > I2C? I would have to believe that maybe a "dev" board might have both
> > > connectors and a bunch of jumpers/switches to choose which ones to
> > > use, but it feels unlikely someone would ship that in any quantity.
> > >
> > > 2. Maybe Goodix provides schematics for customers to produce their own
> > > touchscreen controller boards and they tell customers to either hook
> > > up the SPI lines and load the SPI firmware or hook up the I2C lines
> > > and load the I2C firmware. In this case the assumption is that
> > > customers using the same communication method are following the
> > > schematics closely enough that they all behave the same and thus we
> > > don't need some extra distinction.
> > >
> > > In either case it seems like a touchscreen controller board that talks
> > > over SPI and one that talks over I2C are two different products and
> > > thus (to me) should have two distinct compatible strings. This is not
> > > one device that merely has multiple interfaces.
> > >
> >
> > Goodix's approach is similar to Method 2. First, Goodix provides the
> > schematics and the chips (including initial firmware, no touch function)
> > to customers, and customers design their touchscreen controller boards and
> > decide whether to use the I2C or SPI interface. Then, Goodix modifies and
> > debugs the firmware based on the customer's design and provides the final
> > firmware for customers to upgrade.
> 
> OK, thanks!
> 
> From the above that means that if someone uses the "goodix,gt7986u"
> compatible today (with what's landed in mainline) then by that they
> mean "This is a touchscreen that's compatible with a Goodix-defined
> standard way of talking to i2c-based touchscreens built atop a GT7986U
> touchscreen controller". With what's landed in mainline that "standard
> way" is the "i2c-hid" protocol plus a reset line (which IIRC is not
> part of the i2c-hid standard) plus a defined power up/power down
> sequence.
> 
> I suppose one conclusion one might make is that we never should have
> used "goodix,gt7986u" as a compatible string in the first place and
> should have instead added a new compatible string for every actual
> instantiation of a touchscreen. So when Vendor1 made touchscreen 1234
> based on GT7986U then we could have used the compatible
> "vendor1,touchscreen1234" and then when Vendor2 made touchscreen 5678
> based on GT7986U we could have used the compatible
> "vendor2,touchscreen5678". Should we have done this / should we do it
> in the future? I don't know. If everyone using GT7986U is adhering to
> the same interface then it doesn't buy us a ton and adds lots more
> bindings. I think I ended up originally adding the Goodix GT7375P
> bindings because someone gave me a datasheet with all the power
> sequencing and timings that came from Goodix and said it was for the
> "Goodix GT7375P". Given the fact that Goodix provides such a datasheet
> and it includes power sequencing is a strong indicator that there
> truly is a standard and we can use that.
> 
> In any case, if we _had_ used a different compatible for each actual
> touchscreen implementation then we wouldn't be having this discussion.
> Those touchscreens that shipped with a controller board that had SPI
> connections and SPI firmware would have had obviously different
> compatible strings than the touchscreens that shipped with a
> controller board designed for I2C.
> 
> If we _do_ want to keep using a compatible like "goodix,gt7986u" then,
> IMO, it's beneficial to also have a SPI-variant compatible like
> "goodix,gt7986u-spi". This is not a second interface to one device but
> it's actually a distinct interface compared to the Goodix I2C
> interface. Note: this assumes there isn't some hidden benefit to
> having a combined "I2C/SPI" bindings file. I find having the combined
> file buys me nothing and just makes it more confusing / adds
> complexity. Is there some benefit I'm missing other than towing the
> line of "one chip, one compatible"?
> 
> 

Yes, adding compatible entries in the format of "vendor1,touchscreen1234"
could indeed address these issues. However, as you pointed out, this
approach would significantly increase the number of bindings, and making
it quite challenging for Linux users to locate the corresponding binding
information using only the SKU ID on the chip.

> > It is important to note that the type of driver used by the final device
> > is related not only to the bus type but also to the final firmware. Even
> > when using the same I2C bus, different drivers may be needed, such as
> > hid-i2c or a customer-specific driver.
> 
> Right. ...the firmware that's on the device matters and distinct
> firmware can make a distinct device, and IMO a GT7986U loaded with I2C
> firmware is a distinct device than a GT7986U loaded with SPI firmware.
> They are not the same and thus don't need the same compatible.
> 

Ack. But before we find a perfect solution, I will modify the compatible
entry to "goodix,gt7986u-spi" so that this matter can move forward.

Best regards,
Charles

