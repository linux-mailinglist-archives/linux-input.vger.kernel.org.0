Return-Path: <linux-input+bounces-7886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6E9BDD88
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 04:20:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B98F1F23E8D
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 03:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951BC18FDC8;
	Wed,  6 Nov 2024 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rmzy5Nqk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD0164D;
	Wed,  6 Nov 2024 03:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730863221; cv=none; b=QRbEzLR1OkqZpmVwkqgs4zgSxByDMCxBS00AGVE4tceAkLYnH4zRH7ZQGLr2FPXkh3wLtADnhcjU/Iv6e9g9UKSLfNpJPqpCEfs0p+8+r5mRkhxV2stiAEX5NZqetT27jHaZxEYXwRdabVIBV+5RAF/jWWqvnqmPZlfPaXTb1x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730863221; c=relaxed/simple;
	bh=aN1o0QCqCd7y8dyIaGM9JyyzOA52GCKParbctBQgj2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/p50OM1PlyEbHVOzLUZC9jPrzWYplWOZ58X7aLRIjRxjZBC5wr9c40j+/RgOZAhIMueecwarenb3bxPcy4vvWQ4TEHkNnh9JYNMO9BBxPtjZ4ecCKJatpGnbeUiq6+rtnwpnRqPtp4TmHAMew16wAjMOtZy4iduFLoxTk5FeYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rmzy5Nqk; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so4670076a12.1;
        Tue, 05 Nov 2024 19:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730863218; x=1731468018; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=roLVpWUG2t/eOgCxvwMOi21FBZ2OwBsA2Wap379AGE8=;
        b=Rmzy5NqkmWYOL+5OMTmyETKjFl89Km/iOUotrf3Lo1Z1IPZ2DH8JP/9C6SPSYVNKkP
         Ce4TwNQXp50QYwjYLUND9yDjdP4YpTXjK/UwGLEs05jUeN/y5bxDeqY2LgOl22PyYoMr
         qOMwsptLex/t2fNevADXV/4MVJ49nfpfHn9u6mDkrw1IzpIOvWkQl+zioKEUMq/JkdlG
         NyIAI3s1J35Nh9YLWbNQNsIldObsSVTqOECQG6y+buZFa3R7WWMsWch1Ls1ijCgN9z5L
         XlgjP+q2lIIbUfvKvkryMpTt0t24GHgrYedWMhKKlvnHathfp3QSmambRcSAqZ6Guksc
         ahjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730863218; x=1731468018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roLVpWUG2t/eOgCxvwMOi21FBZ2OwBsA2Wap379AGE8=;
        b=BHJfYr83LowZ27zCy2C8lL7W+EZONjR/i4NmGGvr3A7sXWdJ3VFsy5GxDrZ5O66h/9
         WLCpnXrpyzQcwzPORtlt60wiDb/dIPJR3npDoeKVsyBAkuuTxUMWzPmt76+W3JpxjtbE
         ZDMyeriOPQKBhKluGRHrjQXD5xU6n6iibhk2XmuYILh+Fi1SaqNcjxVXvZPRhXuzmS+7
         GIEu85GIapNifTGF3oq9O8H/2zTHEICSl2rAF8SJGzBs5nOAkRbSCyCOF5rVzBURk6a1
         k6bCQIv2lNN7dqnDC9l8//v1p1Sstnsio7B89QuA6rBf/qGBHUYP1wPlrfmCM2Txh0Be
         t2oA==
X-Forwarded-Encrypted: i=1; AJvYcCX6cnvwg5wkiLvrrhWXewV6snHiTMUPhmHSLHQxqT7vRJruasYIpN32A6qW1m4VqZVZMYuDtg2Jmp2t@vger.kernel.org, AJvYcCXTdppU6YwEnAq7i9IkVd2Yf9jZKWPIKPS9rRjMtzXmcSoBN+9aMn7qKeWYycD9XZnxmIX6+hPhO76eMlUf@vger.kernel.org, AJvYcCXX3W/NIkAck8Ri9cxAlOmD8yB+VOx7HIcGlFGME/5NPs6M4BQRh7xsQcUuHUWMVxyGNC5bQVGHZHUktGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFg80eNZ0cYdWFVC1ctHS1ah/wKI59SkLR7KyTW89a68ZcUWXg
	An3rXGpNqaNKZN9VRE2I+EW8Z0c7tenHF1Y20cLH8AmshZSu6/e/X6hAxiytTB0=
X-Google-Smtp-Source: AGHT+IHMH38Cl5sTZtOnlsN2ZJ9a33Kvxdu8AHtih1m8hkeawDITg2cZNbdAyX8LKcjZejuTtRYJcQ==
X-Received: by 2002:a05:6a20:9144:b0:1db:de89:5d18 with SMTP id adf61e73a8af0-1dbde8961d7mr12162908637.1.1730863218219;
        Tue, 05 Nov 2024 19:20:18 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c47e6sm10417051b3a.139.2024.11.05.19.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 19:20:17 -0800 (PST)
Date: Wed, 6 Nov 2024 11:20:12 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org, jikos@kernel.org,
	bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyrgbC5SPe_YXoMt@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <ZyLtYdwoJWx9FsdS@ux-UP-WHL01>
 <CAD=FV=UNKECLn=3VrjsJfA+HTNa9Gag1qw5jOcBvw7=ZtkZEnw@mail.gmail.com>
 <ZyQvxKi8dYOv1AOg@ux-UP-WHL01>
 <CAD=FV=WD5=2SBLD2rDtXXt0dbn-KUvnE0kPsbnyEAkSA_4w-tA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WD5=2SBLD2rDtXXt0dbn-KUvnE0kPsbnyEAkSA_4w-tA@mail.gmail.com>

On Mon, Nov 04, 2024 at 11:36:50AM -0800, Doug Anderson wrote:
> Charles,
> 
> On Thu, Oct 31, 2024 at 6:33 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > Hi Doug,
> >
> > On Thu, Oct 31, 2024 at 10:58:07AM -0700, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Oct 30, 2024 at 7:37 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > > >
> > > > > > +  goodix,hid-report-addr:
> > > > >
> > > > > I do not see this patch addressing previous review. Sending something
> > > > > like this as v1 after long discussions also does not help.
> > > > >
> > > > > No, you keep sending the same and the same, without improvements.
> > > > >
> > > >
> > > > I apologize for overlooking the discussions regarding this issue.
> > > >
> > > > I would like to clarify that while the current boards use the same address,
> > > > but newly designed boards in the future may require different addresses.
> > > >
> > > > Retaining this property would likely offer more flexibility.
> > >
> > > I don't feel very strongly about it, but maybe Krzysztof does?
> > > Possibly the path of least resistance would be:
> > >
> > > 1. You drop the property from the bindings.
> > >
> > > 2. You hardcode it in the driver to be the normal value.
> > >
> > > 3. If/when someone actually needs a different value then we can add it
> > > as an optional property in the bindings and fall back to the default
> > > value if the property isn't present.
> > >
> > > What do you think? If you feel strongly about keeping the
> > > "hid-report-addr" then you can certainly keep making your case.
> > > However, it's probably best to wait to get agreement from Krzysztof
> > > (or one of the other DT maintainers) before sending your next version
> > > unless you're going to take the "path of least resistance" that I talk
> > > about above.
> > >
> >
> > Agreed, let's wait and see the opinions of Krzysztof (or the other DT
> > maintainers).
> 
> As I went back and looked at this again, I'm curious: I don't know
> much about how your protocol works, but is there any reason why your
> driver can't figure out this "hid-report-addr" dynamically? Is there
> some reason you can't talk to the device and ask it what the
> "hid-report-addr" should be? From skimming through your driver there
> appear to already be a few hardcoded addresses. Can one of those
> provide you the info you need?
> 

Similar to a standard i2c-hid driver, which requires configuring the
address for hid-descr-addr in the DTS, other address information is
obtained using this address.

In theory, we can dynamically obtain most of the addresses from the chip.
However, for this chip, there always needs to be a known address for the
driver to communicate with, whether this address is 0x0000 or 0x0001,
and this address is related to the firmware.

Regarding this issue, since no further review comments received.
I think I can first remove the address as your previous suggestion
and use a default address for communication in the driver. In the
future, we can upgrade the firmware and driver to achieve dynamic
address acquisition.

Thanks,
Charles


