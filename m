Return-Path: <linux-input+bounces-7667-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D4F9AD4EB
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 21:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BA241C2292C
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 19:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052E01D9A68;
	Wed, 23 Oct 2024 19:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RrLkSy9e"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16311CDFD1
	for <linux-input@vger.kernel.org>; Wed, 23 Oct 2024 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729712134; cv=none; b=OSSfT70qPt5O50ZpZlOxtJv2uQgAa9XTtvYtho/o32ghB/YWKvXVZjeezZUt6lOebnfJ41R8nSpg4FCNDT2IMiXi5GFGQKdzWd0GA9El6sI/+yRCBaPtHnC6D5/d6O6Rlczw0XZHcghjOtxQJOIfCyvFOWZm/t7l7tAaRN8GIIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729712134; c=relaxed/simple;
	bh=wNYfSW+eYGJvx5KJp4suRILJhQZ0Ag7C+qU/GxQTLA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJB4U0Xt/+Rji1R4wERuENWrbpRcNzIeFHHCyR6t2zU8AaL/lAKED/iKfZvm2N3OJvnID9E1a7gSGQtH3mYrsYlxJy9VxrIvAe7ZMv4GS4N7aoAKlNSp+PO3hjIND86pvGf4R2s4VKFlVsMpNeoHv3gbMvN+sbzi+5ym2sPBPpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RrLkSy9e; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so138998e87.2
        for <linux-input@vger.kernel.org>; Wed, 23 Oct 2024 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729712129; x=1730316929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIcRJaC4tkNbBKQG9JrVDAOe7hOw1yVBfVB1/wPO5XQ=;
        b=RrLkSy9eZ7jCy+9b5ifUcS54Dn+CuUcQebuoXPDmDyj1bMOyuwT+K4BslRecg8FSiz
         bQxXJq4pOMCya8zcZ5El2UEWUIbMQr4MB0OMCHYS8cMVcm6aPK6G0vMPY7ET/VXOlJAn
         syNi8+Pio/9T8SCo2/58mG4psl0L1b5nd5xIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729712129; x=1730316929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIcRJaC4tkNbBKQG9JrVDAOe7hOw1yVBfVB1/wPO5XQ=;
        b=hlwrnp+6hsfltoyfbYxoXlbDWSNQs5eamTPig0XKEOV1QPNr5Nq4Vu15HUHETAj/iF
         pdzdZY+nXNl8eRMbOAzRRtxKHbNC+YJru9ejVmiJxnvGVCPgprcCc7pH0csNVzMuoNNy
         jCSkEmXGDnyEG+CSUYkFEYCBIW44WslAlsBng8PIM7FnGR+bUUrSmP7VR6OfbrcHBSZj
         Rp7bpBkz/ZWSO9VDTVPpoLbqAmXB+i8Nz2Wi12YPeAC1b7RnGVQNIEJ6kj/tiQDARB17
         NlIUPg4NcG0gK/Q30qDTBF3V/SqRiKUD3++OOKhoLt2e6wEpFjpdeAJam3LncI1YzDfY
         hZcA==
X-Forwarded-Encrypted: i=1; AJvYcCXg89HprGYSvdIEuhpN5J7BUiEn443lpEvZRpusFdVkNzOtlakIVnidaWAaTwF0KCh1ArrKeJc4EZssLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw75xok8ZYwr6TvTxol+1eiYf+Laggp0oRRX24aVRJtcg/+edam
	UgLTyPY8eUE5R23+ekQwGuyYVCLCy4Dbde4EErqPHXnKJcsEGA5ZgdXYisSHoZ0z23Hx276qjiD
	GAQ==
X-Google-Smtp-Source: AGHT+IG6FYTw7F0JTFXLdUOfkd8q9/pkcWEWVGZ2j1NukXE2dSa1fYk8/QM3bTlWeGdaGpUwzFmFUg==
X-Received: by 2002:a05:6512:3185:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-53b1a30505dmr2511799e87.22.1729712128638;
        Wed, 23 Oct 2024 12:35:28 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223f00ddsm1133002e87.114.2024.10.23.12.35.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:35:28 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so138930e87.2
        for <linux-input@vger.kernel.org>; Wed, 23 Oct 2024 12:35:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyW1od54RArGI9GyeR3jhWPiwrUoGEdLS8pqnb+jDfgp2Er/Hi3kMa0sVLsFCRRtMNxOBT+FJnU0xiqw==@vger.kernel.org
X-Received: by 2002:a05:6512:2355:b0:539:fa43:fc36 with SMTP id
 2adb3069b0e04-53b1a2f42abmr1785628e87.12.1729712126300; Wed, 23 Oct 2024
 12:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
 <ZxMfu4yxk961mZWB@ux-UP-WHL01> <fbde8a3a-3adc-4c1a-8529-fde0fa149c8e@kernel.org>
 <CAD=FV=VphXewyk_mpGHUZKw8_aK8HnH8T-YumwM70eyz22S+Aw@mail.gmail.com>
 <ZxdRaaCR7eTOCQkB@ux-UP-WHL01> <CAD=FV=UFonOVHUP5_9+BfJp71CFX7KKA1Gx=boN0=3_4cCKnZw@mail.gmail.com>
 <ZxiZXeQzIaDYuu1F@ux-UP-WHL01>
In-Reply-To: <ZxiZXeQzIaDYuu1F@ux-UP-WHL01>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Oct 2024 12:35:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSUrjbEzG83kYt50FRQ-Bu+bQP17JY_wPAEBf_GxGTJg@mail.gmail.com>
Message-ID: <CAD=FV=WSUrjbEzG83kYt50FRQ-Bu+bQP17JY_wPAEBf_GxGTJg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 22, 2024 at 11:44=E2=80=AFPM Charles Wang <charles.goodix@gmail=
.com> wrote:
>
> Hi,
>
> On Tue, Oct 22, 2024 at 09:12:33AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Oct 22, 2024 at 12:19=E2=80=AFAM Charles Wang <charles.goodix@g=
mail.com> wrote:
> > >
> > > Hi Doug,
> > >
> > > On Mon, Oct 21, 2024 at 08:37:32AM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Mon, Oct 21, 2024 at 2:43=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > > >
> > > > > On 19/10/2024 04:55, Charles Wang wrote:
> > > > > > Hi Doug
> > > > > >
> > > > > > On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
> > > > > >>
> > > > > >> On Thu, Oct 17, 2024 at 7:09=E2=80=AFPM Charles Wang <charles.=
goodix@gmail.com> wrote:
> > > > > >>>
> > > > > >>> The Goodix GT7986U touch controller report touch data accordi=
ng to the
> > > > > >>> HID protocol through the SPI bus. However, it is incompatible=
 with
> > > > > >>> Microsoft's HID-over-SPI protocol.
> > > > > >>>
> > > > > >>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > > >>> ---
> > > > > >>>  .../bindings/input/goodix,gt7375p.yaml        | 68 +++++++++=
+++++++---
> > > > > >>>  1 file changed, 58 insertions(+), 10 deletions(-)
> > > > > >>
> > > > > >> I'm happy to let device tree folks make the call here, but IMO=
 it
> > > > > >> would be much cleaner to just consider the I2C-connected GT798=
6U and
> > > > > >> the SPI-connected GT7986U to be different things and just use =
a
> > > > >
> > > > > Same device, you cannot have different compatibles. The way how t=
he same
> > > > > (literally same chip) device sits on the bus is not part of the b=
inding,
> > > > > thus no different compatibles.
> > > >
> > > > I don't want to belabour the point too much, but this doesn't feel
> > > > completely black and white here.
> > > >
> > > > "Same chip": a whole lot of laptops and phones all use the "same ch=
ip"
> > > > (same SoC) yet are different products. ...or you can look at the fa=
ct
> > > > that many peripherals have the same STM32 or Nuvoton chip in them b=
ut
> > > > are wildly different peripherals.
> > > >
> > > > In this case, Goodix may have made an ASIC called "GT7986U" that ha=
s
> > > > some type of CPU on it that can run firmware that can talk as an I2=
C
> > > > device or a SPI device. This ASIC may be intended to be used as a
> > > > touchscreen controller, but fundamentally it doesn't feel that
> > > > different from an STM32. You can build different boards designs wit=
h
> > > > the "GT7986U" on it and those boards are intended to run different
> > > > firmware.
> > > >
> > > > People manufacturing touch controller boards presumably put this
> > > > "GT7986U" on their touch controller board, maybe set certain
> > > > strappings telling it that it's talking over SPI or I2C or maybe ju=
st
> > > > decide which pins they're going to wire out to the board-to-board
> > > > connector on the touch controller board. A touch controller board
> > > > intended to talk over SPI may look 98% the same as a touch controll=
er
> > > > board intended to talk over I2C, but what percentage of "sameness"
> > > > means that we need the same compatible string?
> > > >
> > > > Would things be different if Goodix decided to manufacture touch
> > > > controller boards themselves and sold two SKUs: a GT7986U-S and a
> > > > GT7986U-I?
> > > >
> > > > I would also note that (reading back in previous conversations) I
> > > > think Charles said that they run different firmware on the SPI vs. =
I2C
> > > > touch controllers. As I understand it, the firmware running on a
> > > > device can make it a different device from a device tree perspectiv=
e.
> > > > The device tree does its best to describe just the hardware but it =
can
> > > > get fuzzy. For instance the "VID/PID" of a USB device is usually
> > > > something programmable and could be updateable by a firmware change
> > > > but we still may need to encode the VID/PID of the firmware that is
> > > > intended to run on the device in the device tree.
> > > >
> > > > Anyway, I'm happy to be quiet about this and fine if folks want to
> > > > continue to work towards a "unified" binding. It makes me a little
> > > > uncomfortable that I'll still end up listed as a "maintainer" of th=
e
> > > > unified binding because I don't totally agree with it, but I'm also
> > > > pragmatic and I'd rather have something that can land.
> > > >
> > >
> > > Thank you very much for your attention. Your understanding of the GT7=
986U
> > > SPI and I2C devices is correct. There is no fundamental difference be=
tween
> > > them and the STM32, as they are all ASIC devices. The functionality o=
f the
> > > device is determined by the firmware that is loaded, although the GT7=
986U
> > > is an ASIC specifically designed for touchscreens.
> > >
> > > Additionally, the firmware and devices are generally bound to specifi=
c touch
> > > panels, meaning that firmware intended for SPI will not function prop=
erly on
> > > an I2C touch panel.
> >
> > Just to get clarity: how is GT7986U delivered? For instance:
> >
> > 1. Maybe Goodix produces touchscreen controller boards and ships them
> > to customers for use in their products. In this case, does Goodix ship
> > a single board with two connectors, or a separate board for SPI vs.
> > I2C? I would have to believe that maybe a "dev" board might have both
> > connectors and a bunch of jumpers/switches to choose which ones to
> > use, but it feels unlikely someone would ship that in any quantity.
> >
> > 2. Maybe Goodix provides schematics for customers to produce their own
> > touchscreen controller boards and they tell customers to either hook
> > up the SPI lines and load the SPI firmware or hook up the I2C lines
> > and load the I2C firmware. In this case the assumption is that
> > customers using the same communication method are following the
> > schematics closely enough that they all behave the same and thus we
> > don't need some extra distinction.
> >
> > In either case it seems like a touchscreen controller board that talks
> > over SPI and one that talks over I2C are two different products and
> > thus (to me) should have two distinct compatible strings. This is not
> > one device that merely has multiple interfaces.
> >
>
> Goodix's approach is similar to Method 2. First, Goodix provides the
> schematics and the chips (including initial firmware, no touch function)
> to customers, and customers design their touchscreen controller boards an=
d
> decide whether to use the I2C or SPI interface. Then, Goodix modifies and
> debugs the firmware based on the customer's design and provides the final
> firmware for customers to upgrade.

OK, thanks!

From the above that means that if someone uses the "goodix,gt7986u"
compatible today (with what's landed in mainline) then by that they
mean "This is a touchscreen that's compatible with a Goodix-defined
standard way of talking to i2c-based touchscreens built atop a GT7986U
touchscreen controller". With what's landed in mainline that "standard
way" is the "i2c-hid" protocol plus a reset line (which IIRC is not
part of the i2c-hid standard) plus a defined power up/power down
sequence.

I suppose one conclusion one might make is that we never should have
used "goodix,gt7986u" as a compatible string in the first place and
should have instead added a new compatible string for every actual
instantiation of a touchscreen. So when Vendor1 made touchscreen 1234
based on GT7986U then we could have used the compatible
"vendor1,touchscreen1234" and then when Vendor2 made touchscreen 5678
based on GT7986U we could have used the compatible
"vendor2,touchscreen5678". Should we have done this / should we do it
in the future? I don't know. If everyone using GT7986U is adhering to
the same interface then it doesn't buy us a ton and adds lots more
bindings. I think I ended up originally adding the Goodix GT7375P
bindings because someone gave me a datasheet with all the power
sequencing and timings that came from Goodix and said it was for the
"Goodix GT7375P". Given the fact that Goodix provides such a datasheet
and it includes power sequencing is a strong indicator that there
truly is a standard and we can use that.

In any case, if we _had_ used a different compatible for each actual
touchscreen implementation then we wouldn't be having this discussion.
Those touchscreens that shipped with a controller board that had SPI
connections and SPI firmware would have had obviously different
compatible strings than the touchscreens that shipped with a
controller board designed for I2C.

If we _do_ want to keep using a compatible like "goodix,gt7986u" then,
IMO, it's beneficial to also have a SPI-variant compatible like
"goodix,gt7986u-spi". This is not a second interface to one device but
it's actually a distinct interface compared to the Goodix I2C
interface. Note: this assumes there isn't some hidden benefit to
having a combined "I2C/SPI" bindings file. I find having the combined
file buys me nothing and just makes it more confusing / adds
complexity. Is there some benefit I'm missing other than towing the
line of "one chip, one compatible"?


> It is important to note that the type of driver used by the final device
> is related not only to the bus type but also to the final firmware. Even
> when using the same I2C bus, different drivers may be needed, such as
> hid-i2c or a customer-specific driver.

Right. ...the firmware that's on the device matters and distinct
firmware can make a distinct device, and IMO a GT7986U loaded with I2C
firmware is a distinct device than a GT7986U loaded with SPI firmware.
They are not the same and thus don't need the same compatible.


-Doug

