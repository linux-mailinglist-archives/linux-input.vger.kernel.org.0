Return-Path: <linux-input+bounces-7632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2C9ABF14
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 08:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9285281AAB
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 06:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3646914A614;
	Wed, 23 Oct 2024 06:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXNQO7f3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA5481B7;
	Wed, 23 Oct 2024 06:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729665878; cv=none; b=HxYXWThKJSecvVc4U6RaPpq9scHOc4W4xT0dYyXY2ktV8TgnvOPzdHpoPg8dVs8tBAVwmqCNYQLbrc+8stT+4g6nZc+0CukqHYcNrGIct09r1hwGpEJkxUMWHWVZCdONod2xYOvvKXGAENccm0O2Cz5LKrT40JY4Luju5f65x2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729665878; c=relaxed/simple;
	bh=fOKFshdQzxgGUEGpFtjZ568FZYT4tRvvkIuNir9RK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4CSZktLQvHfATUapbI4VRUvRm6k5GPn2Qyye8YVMF+Xbq5CuQ0eUgbLmlL4xYNgmcWQFSfB/iujPtrb3NdowwYYymOLNZn6/VffGeqtnoXqGaPPkSSAzf8acmWFsZrdeGDQELnQHZ+PG93OcoJ/efMyYwzDcSDA+0KfpIeBYb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXNQO7f3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a156513a1so879396666b.0;
        Tue, 22 Oct 2024 23:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729665874; x=1730270674; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jsdVuQK0tqplZr5d1PpgO1JpvQuxio4Fj5Kb6xdlEIw=;
        b=cXNQO7f37w9PezUiDzxlIz+rPcMmLYMaefE9aiW9IOHCB4RiVp6AnPpnOne0G/VSTA
         IqrYvQ2y30zXb2nDmmLGNW5fXC9BmG/wQq+SFDI9wj3BsyOL8++cSFdIZYfPjqXBcZZv
         jfXZGKnrrxPDX49ap+7nIXAMonJNUePJn7dcfEA7PQLzP0V5TpdIP2c/t9JyRVILA2dO
         ax3tNvzal0nMOh4Qj2e6ZyatdLvIHfvTiUII6DIVP14d1lG5hEm7ikDhS3MWk5oew2wX
         jXnT+WxWjvjuXY7LeSUJDUcPbLJ/ln9I7ec+mMjen8EUm7IbzYvB3BPpQzm/R8EEfyzO
         pAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729665874; x=1730270674;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jsdVuQK0tqplZr5d1PpgO1JpvQuxio4Fj5Kb6xdlEIw=;
        b=Zxb0uLEewPabNfVdJ55j1zCc5UGRxG7EKnoHLZZ598hWEGu4sd4OwwBx32Nc6LpoQ7
         MU98e09sLqeEkptqj83chPk0mrUgUvLNAlMNHiMTUQzRwp/yW9a7rYeUKiEMkMZHorDA
         p+YRJPk04TalA1w40EFGz9tb3My3I/bHokC+LnipGJA84DX8epq/bGI6m0zOTmRbnjET
         9tW47gFoq3hvi1Ffl86g7nx/AloTn17oKsGSwKXnGUrsGB/xW5yuf72YwxpjfNsGoblX
         vs3TIChA/DB7O3cU8UatAhTFDEsFgQR1JfCPQ4FfmxX7INmYcSim2DcdYP3Ak2aM/5ge
         n5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW+mzzjNqtORzX+cqyIstvQDDR8sBMXNmmPrQu8fVqITKWQ61RfXqOj+2oy4IKpZwuhj8p3OLMHASBv5UEd@vger.kernel.org, AJvYcCW9ijrQq4N9ihDBgEm0pXLNs/daA9s0PGqliCyi/8IxQssRxB83GQKYHw5B2+6OKcszKWkVHaPL/T0G@vger.kernel.org, AJvYcCXOmLTL4nbiDr0Gd36uKmKITZc8CLH3UCninkUcVoe4K8ZID0wxxCeNnxeww5cti7FnAsYpftVZhKuUMP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkHQm5+rgUqoK2iTueFI8Vixd32fKqNxgFrPUV83D+IU4g9RT
	G+Sayw8ZevqGuTSfNi2iUoUkb/TnTYu/G5lEVc82Y5k8nB0WsaJFUs9towB1J84=
X-Google-Smtp-Source: AGHT+IHBPfa3kbMGCdAdDe5QU8hIr3I5hl7fBCe0GeJaGxy0b8pTP8y7QpFyoCU/+b6YeL3oJksWDw==
X-Received: by 2002:a17:906:c150:b0:a9a:2afc:e4e3 with SMTP id a640c23a62f3a-a9abf92d226mr131024166b.50.1729665874190;
        Tue, 22 Oct 2024 23:44:34 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91572c0dsm433914466b.177.2024.10.22.23.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 23:44:33 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:44:26 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxiZXeQzIaDYuu1F@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
 <ZxMfu4yxk961mZWB@ux-UP-WHL01>
 <fbde8a3a-3adc-4c1a-8529-fde0fa149c8e@kernel.org>
 <CAD=FV=VphXewyk_mpGHUZKw8_aK8HnH8T-YumwM70eyz22S+Aw@mail.gmail.com>
 <ZxdRaaCR7eTOCQkB@ux-UP-WHL01>
 <CAD=FV=UFonOVHUP5_9+BfJp71CFX7KKA1Gx=boN0=3_4cCKnZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UFonOVHUP5_9+BfJp71CFX7KKA1Gx=boN0=3_4cCKnZw@mail.gmail.com>

Hi,

On Tue, Oct 22, 2024 at 09:12:33AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 22, 2024 at 12:19 AM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > Hi Doug,
> >
> > On Mon, Oct 21, 2024 at 08:37:32AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Mon, Oct 21, 2024 at 2:43 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > >
> > > > On 19/10/2024 04:55, Charles Wang wrote:
> > > > > Hi Doug
> > > > >
> > > > > On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
> > > > >>
> > > > >> On Thu, Oct 17, 2024 at 7:09 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > > > >>>
> > > > >>> The Goodix GT7986U touch controller report touch data according to the
> > > > >>> HID protocol through the SPI bus. However, it is incompatible with
> > > > >>> Microsoft's HID-over-SPI protocol.
> > > > >>>
> > > > >>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > >>> ---
> > > > >>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> > > > >>>  1 file changed, 58 insertions(+), 10 deletions(-)
> > > > >>
> > > > >> I'm happy to let device tree folks make the call here, but IMO it
> > > > >> would be much cleaner to just consider the I2C-connected GT7986U and
> > > > >> the SPI-connected GT7986U to be different things and just use a
> > > >
> > > > Same device, you cannot have different compatibles. The way how the same
> > > > (literally same chip) device sits on the bus is not part of the binding,
> > > > thus no different compatibles.
> > >
> > > I don't want to belabour the point too much, but this doesn't feel
> > > completely black and white here.
> > >
> > > "Same chip": a whole lot of laptops and phones all use the "same chip"
> > > (same SoC) yet are different products. ...or you can look at the fact
> > > that many peripherals have the same STM32 or Nuvoton chip in them but
> > > are wildly different peripherals.
> > >
> > > In this case, Goodix may have made an ASIC called "GT7986U" that has
> > > some type of CPU on it that can run firmware that can talk as an I2C
> > > device or a SPI device. This ASIC may be intended to be used as a
> > > touchscreen controller, but fundamentally it doesn't feel that
> > > different from an STM32. You can build different boards designs with
> > > the "GT7986U" on it and those boards are intended to run different
> > > firmware.
> > >
> > > People manufacturing touch controller boards presumably put this
> > > "GT7986U" on their touch controller board, maybe set certain
> > > strappings telling it that it's talking over SPI or I2C or maybe just
> > > decide which pins they're going to wire out to the board-to-board
> > > connector on the touch controller board. A touch controller board
> > > intended to talk over SPI may look 98% the same as a touch controller
> > > board intended to talk over I2C, but what percentage of "sameness"
> > > means that we need the same compatible string?
> > >
> > > Would things be different if Goodix decided to manufacture touch
> > > controller boards themselves and sold two SKUs: a GT7986U-S and a
> > > GT7986U-I?
> > >
> > > I would also note that (reading back in previous conversations) I
> > > think Charles said that they run different firmware on the SPI vs. I2C
> > > touch controllers. As I understand it, the firmware running on a
> > > device can make it a different device from a device tree perspective.
> > > The device tree does its best to describe just the hardware but it can
> > > get fuzzy. For instance the "VID/PID" of a USB device is usually
> > > something programmable and could be updateable by a firmware change
> > > but we still may need to encode the VID/PID of the firmware that is
> > > intended to run on the device in the device tree.
> > >
> > > Anyway, I'm happy to be quiet about this and fine if folks want to
> > > continue to work towards a "unified" binding. It makes me a little
> > > uncomfortable that I'll still end up listed as a "maintainer" of the
> > > unified binding because I don't totally agree with it, but I'm also
> > > pragmatic and I'd rather have something that can land.
> > >
> >
> > Thank you very much for your attention. Your understanding of the GT7986U
> > SPI and I2C devices is correct. There is no fundamental difference between
> > them and the STM32, as they are all ASIC devices. The functionality of the
> > device is determined by the firmware that is loaded, although the GT7986U
> > is an ASIC specifically designed for touchscreens.
> >
> > Additionally, the firmware and devices are generally bound to specific touch
> > panels, meaning that firmware intended for SPI will not function properly on
> > an I2C touch panel.
> 
> Just to get clarity: how is GT7986U delivered? For instance:
> 
> 1. Maybe Goodix produces touchscreen controller boards and ships them
> to customers for use in their products. In this case, does Goodix ship
> a single board with two connectors, or a separate board for SPI vs.
> I2C? I would have to believe that maybe a "dev" board might have both
> connectors and a bunch of jumpers/switches to choose which ones to
> use, but it feels unlikely someone would ship that in any quantity.
> 
> 2. Maybe Goodix provides schematics for customers to produce their own
> touchscreen controller boards and they tell customers to either hook
> up the SPI lines and load the SPI firmware or hook up the I2C lines
> and load the I2C firmware. In this case the assumption is that
> customers using the same communication method are following the
> schematics closely enough that they all behave the same and thus we
> don't need some extra distinction.
> 
> In either case it seems like a touchscreen controller board that talks
> over SPI and one that talks over I2C are two different products and
> thus (to me) should have two distinct compatible strings. This is not
> one device that merely has multiple interfaces.
> 

Goodix's approach is similar to Method 2. First, Goodix provides the
schematics and the chips (including initial firmware, no touch function)
to customers, and customers design their touchscreen controller boards and
decide whether to use the I2C or SPI interface. Then, Goodix modifies and
debugs the firmware based on the customer's design and provides the final
firmware for customers to upgrade.

It is important to note that the type of driver used by the final device
is related not only to the bus type but also to the final firmware. Even
when using the same I2C bus, different drivers may be needed, such as
hid-i2c or a customer-specific driver.

Best regards,
Charles

