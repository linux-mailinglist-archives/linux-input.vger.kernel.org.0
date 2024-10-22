Return-Path: <linux-input+bounces-7608-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE949A9ACB
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 09:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C51C1C22277
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 07:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443FF1494AB;
	Tue, 22 Oct 2024 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPAP34ri"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25413D882;
	Tue, 22 Oct 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581562; cv=none; b=RYfxG62lqzcSvop/Yra3BOvYmlH8+iNJ2NTHGKA0lKMB+YYBD6C3PRf9EiPKhf6I/5D5tqxseZK3rYu7xX6IcPtow071jhhudgvFeWY0/zQa3f7y+4iJGIjUWELfV5TDDzZW4oRgKflpxoepV9abdKrVMX+nEBWeDK/J9FsX2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581562; c=relaxed/simple;
	bh=ZijgXv2TM6YWiupi5TuKGeeesw3ZN88Ht0fCGQ0XX1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmqEcWUjuSZGOywZjwSsHrTwh2BGMXpOYJYKHopFLe9q9clhQzGre7odOOTpNnc4PzZOYYBrEIaZaEjlHOddsDGrlT8OB1znx9vKURyCtJa5gGZUQ9p5LRKa/W1kYZzBLBvCI9RHrwEQR6Hb+W9IgmgVmxBRU1hx4I1CJRIw5vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPAP34ri; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20e576dbc42so37436805ad.0;
        Tue, 22 Oct 2024 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729581560; x=1730186360; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XrY5a8w2eF5hqkiN1ay+aD3AseD3qSj3rX8OoR3oJKI=;
        b=ZPAP34rimC7nG1Ne6QXGz2vm9E/emcW3McWQ0v50ElRo82TtkBa6pFQyY3HoMBgMwN
         2Y8JX2QV+JLCQhO2B0BuBoTly47zbFY2vP8qK6bt8V5UBHHVp2/KN8rsPiMDuE7Z9hlL
         B1Rm23MhHek8o3gC5ptvpxrHtJDbyhOou2Fp/EdPP9HWTSut4hLmbFrSEkhvcYwG6LvB
         bJ7nyagCORjvz15CLcdQom7hVjQGcbVbG+/r6pzvBIwQ0ooI3QC2NyGL5AMAo9vziiwl
         KSYE99AgpTklsz1HXBjXsRRPf+Cw5GbCnqvNKfJ6BVAxijV6gPn+kNqPs17xyNEwUqq4
         Yonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581560; x=1730186360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrY5a8w2eF5hqkiN1ay+aD3AseD3qSj3rX8OoR3oJKI=;
        b=bqjXXtOm7kX61cIxuwyJxzEoQGRWdRzs25zMLIfFLLIkvXqtv4XyNo2XC4SMXWrnk4
         Vtw1/CnBPyx55Ql6Q7rs8V+ovNlUl0HO6UavUr3IvL/7etBwON+nwBVGKZwg5ckSywrc
         jnGPrpdL+sMLJKsLBnv9EL3I5qIgGp8r8dA/vyq360xJozv5GFX1mprjUu0oev3rg3wi
         UhAveDc16q7JtFcvI4qfITh2NyPs7HW3nIGVEy0M3Zu+nju+nYYmGl8lZMSGCswu+k3R
         URFcVmTaGAKouj4cEzyWfKlYBwnPjWID4IBEriXFdv/z3HTbLbSqoMMuWH+37qKN4Bz6
         6Itg==
X-Forwarded-Encrypted: i=1; AJvYcCVFpoaxItbXUsF21xl7vx5MravY8XGIML6e7ek/1LbPiw3U4F21yGGlb5qBqMCtbroW8JIsIunAvDKn@vger.kernel.org, AJvYcCXNl15X2/6gXOAu50qmJj6fegtdLqCwTipja9JFvOUVuCCejlsuM37n3TR/BXlE7Fqwp9dna5/lbegxU0dL@vger.kernel.org, AJvYcCXbZQAhug/lDK0L2CPXccjsF6kJYSUPkvxYnyAjlquyhLH0jBFJp/R/TCMmr0h2PALz9sVhabGgMn8qxNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztGI6HaWelij0flP+G0i8CoErEMErgZyvRmvXT3kQincAh4pOY
	xgun5mUkdSrdhfTQWJZGR6MOKqMxflWs9nziNz13Qi3mtNlRGs48
X-Google-Smtp-Source: AGHT+IF971eN1XW/0cnJQ0Xzkjpk9q0IGwL5BsrxQpmOzncKIjssOO7/GR2M8uI66dtXtBMqphhnmA==
X-Received: by 2002:a17:902:f544:b0:20c:9821:6997 with SMTP id d9443c01a7336-20e983eff6bmr25662825ad.8.1729581559751;
        Tue, 22 Oct 2024 00:19:19 -0700 (PDT)
Received: from ux-UP-WHL01 ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0db9bfsm36666475ad.211.2024.10.22.00.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:19:19 -0700 (PDT)
Date: Tue, 22 Oct 2024 15:19:04 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxdRaaCR7eTOCQkB@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
 <ZxMfu4yxk961mZWB@ux-UP-WHL01>
 <fbde8a3a-3adc-4c1a-8529-fde0fa149c8e@kernel.org>
 <CAD=FV=VphXewyk_mpGHUZKw8_aK8HnH8T-YumwM70eyz22S+Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=VphXewyk_mpGHUZKw8_aK8HnH8T-YumwM70eyz22S+Aw@mail.gmail.com>

Hi Doug,

On Mon, Oct 21, 2024 at 08:37:32AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Mon, Oct 21, 2024 at 2:43 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 19/10/2024 04:55, Charles Wang wrote:
> > > Hi Doug
> > >
> > > On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
> > >>
> > >> On Thu, Oct 17, 2024 at 7:09 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > >>>
> > >>> The Goodix GT7986U touch controller report touch data according to the
> > >>> HID protocol through the SPI bus. However, it is incompatible with
> > >>> Microsoft's HID-over-SPI protocol.
> > >>>
> > >>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > >>> ---
> > >>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> > >>>  1 file changed, 58 insertions(+), 10 deletions(-)
> > >>
> > >> I'm happy to let device tree folks make the call here, but IMO it
> > >> would be much cleaner to just consider the I2C-connected GT7986U and
> > >> the SPI-connected GT7986U to be different things and just use a
> >
> > Same device, you cannot have different compatibles. The way how the same
> > (literally same chip) device sits on the bus is not part of the binding,
> > thus no different compatibles.
> 
> I don't want to belabour the point too much, but this doesn't feel
> completely black and white here.
> 
> "Same chip": a whole lot of laptops and phones all use the "same chip"
> (same SoC) yet are different products. ...or you can look at the fact
> that many peripherals have the same STM32 or Nuvoton chip in them but
> are wildly different peripherals.
> 
> In this case, Goodix may have made an ASIC called "GT7986U" that has
> some type of CPU on it that can run firmware that can talk as an I2C
> device or a SPI device. This ASIC may be intended to be used as a
> touchscreen controller, but fundamentally it doesn't feel that
> different from an STM32. You can build different boards designs with
> the "GT7986U" on it and those boards are intended to run different
> firmware.
> 
> People manufacturing touch controller boards presumably put this
> "GT7986U" on their touch controller board, maybe set certain
> strappings telling it that it's talking over SPI or I2C or maybe just
> decide which pins they're going to wire out to the board-to-board
> connector on the touch controller board. A touch controller board
> intended to talk over SPI may look 98% the same as a touch controller
> board intended to talk over I2C, but what percentage of "sameness"
> means that we need the same compatible string?
> 
> Would things be different if Goodix decided to manufacture touch
> controller boards themselves and sold two SKUs: a GT7986U-S and a
> GT7986U-I?
> 
> I would also note that (reading back in previous conversations) I
> think Charles said that they run different firmware on the SPI vs. I2C
> touch controllers. As I understand it, the firmware running on a
> device can make it a different device from a device tree perspective.
> The device tree does its best to describe just the hardware but it can
> get fuzzy. For instance the "VID/PID" of a USB device is usually
> something programmable and could be updateable by a firmware change
> but we still may need to encode the VID/PID of the firmware that is
> intended to run on the device in the device tree.
> 
> Anyway, I'm happy to be quiet about this and fine if folks want to
> continue to work towards a "unified" binding. It makes me a little
> uncomfortable that I'll still end up listed as a "maintainer" of the
> unified binding because I don't totally agree with it, but I'm also
> pragmatic and I'd rather have something that can land.
> 

Thank you very much for your attention. Your understanding of the GT7986U
SPI and I2C devices is correct. There is no fundamental difference between
them and the STM32, as they are all ASIC devices. The functionality of the
device is determined by the firmware that is loaded, although the GT7986U
is an ASIC specifically designed for touchscreens.

Additionally, the firmware and devices are generally bound to specific touch
panels, meaning that firmware intended for SPI will not function properly on
an I2C touch panel.

Best regards,
Charles

