Return-Path: <linux-input+bounces-8001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FA9C36D4
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 04:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8132728230E
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 03:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE48113D62B;
	Mon, 11 Nov 2024 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSwGrdAD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC9D79CD;
	Mon, 11 Nov 2024 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731294231; cv=none; b=EgUF1El4Qr77jurp6eW2BXlWyTK6QtpWJibta4gbiJgcSIzYCyIhg4AfK5Q+/vLrLR6hzQxvXAG8gyNQUM4MJxiVEtGMpuOw/x+ktLoH/gWEu/JCSujaAR5/8bi9SvxqqQoYBgARjageusBDgbYD1bry8tWk8zWP3Q0r5tvM31A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731294231; c=relaxed/simple;
	bh=jkY9glnqn7aMQy7E/6uWBEg5UDflK9CMP2fRr2R/CHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWjivimfnCZLCoH2nBTgdlwKL+f3N9iGdxe+BOfmyKrn2fTOaUfkOwVEpPFPFf400xZvYHrsYYdMoCudDRB6H65Ki6LZMvEX4oTzDK5Rn6TnrfUwcSxYoVuVvUNcDVaJxyGgmbl6Q5c4N4eunSSCfadN1dhynb9acCFKiFIA0RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSwGrdAD; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e5f6e44727so2608913b6e.0;
        Sun, 10 Nov 2024 19:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731294229; x=1731899029; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUCHZ2quK2eqm530Qwagq9DCK2Xj6nLH/mkJCGkZHjs=;
        b=BSwGrdADw0JU4DBDwkBisYxBZilKK/LUdGUS80a7tqTA0B4DcGrZBlXWWFHnOfw5iG
         VHHfIJFc2iYi3pnU5cgB8ozSf8GnbiRWVR057W6PV0qeEqJlY2raMV9Fpm4ehwRH0wLa
         D/OJStfLYOxfPY875Wz9kIxSukOq+rSwaS1NuL8hEfkqz3NwCIDzB2+kKbJqL3qfh27X
         TTMrRMNcQcXIrFTKUn7cHhtCEvM5JnqTWiNLqSswDV4pBkRCw7+YcKHrrMd+inBh2mRh
         A1S2KIPsjU6aD1MBj1VFN2qgTbq7AhGoC/B5dFhxnnU4gkb5bqfdsIH3MmURmnSpa0Fa
         gNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731294229; x=1731899029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cUCHZ2quK2eqm530Qwagq9DCK2Xj6nLH/mkJCGkZHjs=;
        b=tF4WLAPu5tzyQ+7sFCkKqNO6xETyJj7JwT3G0XATtJXZSd8APE+CtYLW1oZxosQKfA
         oz67FYwjuk6s5ncEGjLrMlv8Vp/s0tSSlwsPljt4iNEIu22TLtwzt8/l6KnCMLfxs0PY
         q7YvhzLBqcQ6+crQcSIxgsASmcyup9a5+BNwfBAhT63r5sAPr8La4XZd5JD2ueJI7CpC
         swuPQtP4+TnmmSvG/S1Qxjbb5WLgFC5IFeJjZ+25bq5ps+A0/P1/Q9TpUTFUhAzWSVhL
         eZafRuLt1W5JGLfVQ+g9+R4Yl1J+kalkXLYEGmEkAqO8ZOdGgxt4JBOixf9zUPDdug+q
         17ag==
X-Forwarded-Encrypted: i=1; AJvYcCUgqpmVXSkwR0C1Oy2MyxNFGwb7Xc4DmPvgiA8419LsHvBnU7YBQHoFEqerXDtPps4FJhyPoPrNf9hz@vger.kernel.org, AJvYcCXWfRi0lMcPxOMWpyVT1Q6U+vEli+R+OFKonr9zDkCtYlhyGzzHlETqWqT+CGwrfcTmSMdTYs8/ZzZ2gcPX@vger.kernel.org, AJvYcCXbiuKt4WGUN6u+I7vjjG6uSlb9E8tStCtBakNaApgf4Z/Bf9fsDFfwEOxkIvN6yW7PAVw1rQGslODfv80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtS1toXOO94ic2lG/QpObW8ROCnFsHnLD2E8pxLjPHoM88oXz8
	k78g341D5/U8IBnAspZ9XPbUED7ur+x0Ow/7hj8foRFpJzSW0Qwa
X-Google-Smtp-Source: AGHT+IH31TljxYsV3iuZ25pg+obMhinwcJcwvt/ibfs9wPpfmmaLnouYEbbsDO1jooiqgGdDM6uoPQ==
X-Received: by 2002:a05:6808:1b21:b0:3e7:5b07:6a with SMTP id 5614622812f47-3e7946a3a2amr9862805b6e.22.1731294229449;
        Sun, 10 Nov 2024 19:03:49 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f65bfbdsm7462155a12.75.2024.11.10.19.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:03:48 -0800 (PST)
Date: Mon, 11 Nov 2024 11:03:43 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Charles Wang <charles.goodix@gmail.com>, conor.dooley@microchip.com,
	linux-input@vger.kernel.org, bentiss@kernel.org,
	linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, devicetree@vger.kernel.org, jikos@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <ZzF0D4LAC-Lka53D@ux-UP-WHL01>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-2-charles.goodix@gmail.com>
 <173107281349.1752060.15353696141928017835.robh@kernel.org>
 <CAD=FV=Uc0PZZp-rupazy9tGfZMssGET=904cdUJXbhS=fMCUvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Uc0PZZp-rupazy9tGfZMssGET=904cdUJXbhS=fMCUvg@mail.gmail.com>

Hi Doug,

On Fri, Nov 08, 2024 at 07:13:53AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Nov 8, 2024 at 5:33 AM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Fri, 08 Nov 2024 20:03:10 +0800, Charles Wang wrote:
> > > The Goodix GT7986U touch controller report touch data according to the
> > > HID protocol through the SPI bus. However, it is incompatible with
> > > Microsoft's HID-over-SPI protocol.
> > >
> > > NOTE: these bindings are distinct from the bindings used with the
> > > GT7986U when the chip is running I2C firmware. For some background,
> > > see discussion on the mailing lists in the thread:
> > >
> > > https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> > >
> > > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > ---
> > >  .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
> > >  1 file changed, 75 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> > ./Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml:16:7: [error] syntax error: mapping values are not allowed here (syntax)
> 
> FWIW, I think it's objecting to the "NOTE: " in the description
> looking like yaml. Maybe just change it to "Note that". It's also a
> good idea to get yourself setup to validate your bindings _before_
> posting them to the list.
> 

Change to 'description: |' fixed the issue.

Thanks,
Charles

