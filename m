Return-Path: <linux-input+bounces-12079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B0DAA3962
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 23:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 815219A5AAE
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 21:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A12B218EB0;
	Tue, 29 Apr 2025 21:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0ElhLYp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA758F77;
	Tue, 29 Apr 2025 21:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745962369; cv=none; b=AGgl4UdWkgtCoB+vcMAM5ViGM0Y3br8tC9PrxMVgFo7OMLyCfabna88eTYFpkJteaI8LNnArlnqCUvDQhSOMbr7SEqKxIXcgA1bidYXOs5tg1nLWQZhz0NwP6Q3nuaQLRhJ2/sVwn9JZO2Mm0xbFV/Qhtq3se4yxT7S1+DKYAAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745962369; c=relaxed/simple;
	bh=lMZ2Tk+2q+F753sscfQWAix9rB8GC0qIlFtPs0Pf3qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxDuAQkMKY+fPRKAELIXlD7ucC78jQioCppCfjzv4FzqDachUz+u/R+sT15UdrO07NniJ2Bj/YWsKLTFDi1e276ZYUVhS7n2iFBb7OredTrh4phSYOpLPQv+NuOIDQTlvvWN2Hgax5Uz4I+MHgX/6rlKqqT5X7q+pgOIK0M16Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0ElhLYp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223f4c06e9fso3189895ad.1;
        Tue, 29 Apr 2025 14:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745962367; x=1746567167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2tqAEYry6Jn2lNSI2wBXBIzsfGu6PX7wi9Y9zLju3A4=;
        b=h0ElhLYp+AkJ5/J6AXDYMDmH8xz2DdwVgSdOgzwUqrsIFv/nQDadcmQmAT1Tgzwpjv
         NPcW6YO7g3R9MehpWXUgbzxmE0oKgQlKqrwwr+XLgp5cTG1pM9ue7Dep4Y0/m3N8yt37
         eAWn92Qhdm1gxzUOcPn5X0mM7Fc8QYu8DSToZFIE7FM6N4Hjcrid4DyPfwTPtfGeA/Kg
         OvNSco/WD6fXZlGRA5mL0z22el+YSur2HTGxLvlULoaQQtBCTwVwCYFDEdyw1AGeHYDK
         TQFoSvG/QqqT+DphL/biKzEGRkU9Xc3qymm7Wgm6eNYcUEBs4dCtkHTTiXacZw+CY3D1
         ncdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745962367; x=1746567167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tqAEYry6Jn2lNSI2wBXBIzsfGu6PX7wi9Y9zLju3A4=;
        b=GjhcXUAxr+N7jxrl+rBawTc9yCfLqA8GHUGRg/ZDCg1Hzu/6gmwaMgN113UxZ2+tAC
         /j4dgbpIzaHDyKrda1IjaXGlBzCW8c7mWVsQknV8SfG1QdoMxGCJuYjt6QodO4DLkRew
         t5GOsD2BMN4dPN0Xx0pjlmM6yw6b7vOAmCdFCOstXnfzH+QNoyxiFObyrkGcI+VHGyjs
         mOHS0s67CVtTtRfDv40aTYrA/ZD33+tqjzPywKZNAcI2YWVQoYcLI9+9UmDr0BH//DxY
         lXm0DQaJOTUPH5f4vC5A4/I8N2RtyK10/OGyqBI27MYIMgGqLVhCO1UcAIE6HqsSdofH
         5omA==
X-Forwarded-Encrypted: i=1; AJvYcCVGViqsMVLC3tMvTGwfvPZi1YU18KlQx/K57ul5rBbQief/MmzAdVLf80i9+DMuK3vskXO7rNTo5+vTwV4x@vger.kernel.org, AJvYcCW0t8PcgWg3pUGkbt0JeBOGoLo+SDck5+ODDJtGHf/nKzTtS1txFq+2LeihYKBK8rVSFFpzF24SMeNp@vger.kernel.org, AJvYcCW88hLhn1osSvYQtNtRNUKapY15ILLEF9pvMWWesrOGfjaUD6IcAiNjeZ48/NFUkIhZj/FnH37EdWkc4VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsILc43LU+w4uNUqqYAl8LD0VIgdZ23uiqIQSzqxYLyMmqIWOQ
	/vPzqjWyhvOCQgxWyEuMEEYo7b0Nmh3HsKrxIv7xBEulyNk3nX30NFsF3w==
X-Gm-Gg: ASbGncs7QGJPaPq7nuVxynsXaSHcoQDZijqz2pPoBaw2Ng5TvoHF6onV06FJqsQKN6J
	qzLVftsS3uPSMzuC7snxsoAUv+zXCG0EBXxGdSgaB7+b7WtG7vU6URBf50Vwa3BWxZFjhylAdUV
	tNWQ5iy46aAhFRZr3/d1QWYPmPpE+mpCmL1PO7Sz6j6MYNFeLf7kAVCl9BC/zhsIjydKo9cF2JX
	fb6OIbejqxY9szRq1v0/bLRR9SkjiyVNZifUhahYce7cKlk4XAgiI4VJE0acpatzUhT1JRtbAU7
	SYYQHYZHV0z+rlyPKWPPM/GK+IuFRXw20AZE2Gd/vA==
X-Google-Smtp-Source: AGHT+IEsAVOUrCNRxWju86fwf1wlZ6snx2W6BAeSl2Thze4mgkosExWHB6QgnHCot4ZCWR3fV6Itgg==
X-Received: by 2002:a17:902:f611:b0:22d:e57a:27b0 with SMTP id d9443c01a7336-22df4747b9cmr5160705ad.2.1745962366822;
        Tue, 29 Apr 2025 14:32:46 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d77e66sm108370195ad.20.2025.04.29.14.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:32:46 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:32:43 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Esben Haabendal <esben@geanix.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <w65v3filerdiuimbnrcmislknzeug2f6nont2r4atzq2p2w2nv@7iskwi7g2u2e>
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
 <20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
 <qql72NifdMmJKSRJmT2927URaXnbRAbz9Yjzn9lBrOwjka7NxVvy5YKJUSLmBp435aYJiTkPqeuW1hMDcKKC4g==@protonmail.internalid>
 <20250429-effects-subscript-58eb41737816@spud>
 <87selrt1vl.fsf@geanix.com>
 <Pvo1P0DaSIUd2X7OfO-NXvz2UcLtNfnyMTRBLEBRS3Zokk9Ww0TB4_ce3jobYuWRsvIbUd_E3OF2kzPx0xZbGw==@protonmail.internalid>
 <2qwfe6yw3pil5tumibiagikqhgwct27vevi674fklfieabzozc@hzjwatn3vjss>
 <87o6weu6yx.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6weu6yx.fsf@geanix.com>

On Tue, Apr 29, 2025 at 09:02:14PM +0200, Esben Haabendal wrote:
> "Dmitry Torokhov" <dmitry.torokhov@gmail.com> writes:
> 
> > On Tue, Apr 29, 2025 at 05:37:34PM +0200, Esben Haabendal wrote:
> >> "Conor Dooley" <conor@kernel.org> writes:
> >>
> >> > On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
> >> >> This should be added for boards where there is no pull-up on the reset pin,
> >> >> as the driver will otherwise switch the reset signal to high-impedance to
> >> >> save power, which obviously not safe without pull-up.
> >> >>
> >> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> >> ---
> >> >>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
> >> >>  1 file changed, 4 insertions(+)
> >> >>
> >> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> >> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
> >> >> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> >> >> @@ -45,6 +45,10 @@ properties:
> >> >>    reset-gpios:
> >> >>      maxItems: 1
> >> >>
> >> >> +  goodix,no-reset-pull-up:
> >> >> +    type: boolean
> >> >> +    description: There is no pull-up on reset pin
> >> >
> >> > I have to wonder, why are these system using the reset property if the
> >> > reset is not usable? Shouldn't the property be omitted?
> >>
> >> The reset are fully functional. It just have to be controlled in
> >> push-pull mode.
> >>
> >> Because of the lack of external pull-up, configuring the reset gpio as
> >> input (to save power) puts the reset pin in an unknown state.
> >
> > How much power do we save by doing this? I don't recall other drivers
> > trying to switch reset GPIO into input mode after performing reset...
> 
> I don't know.  I also don't recall seeing this in other drivers.  But as
> not knowing how much power it is, I did not feel comofortable proposing
> to remove it.

Hmm, setting RESET line to "input" was supposed to be removed in 2015:

https://lore.kernel.org/all/1473530257-7495-5-git-send-email-irina.tirdea@intel.com/

And I even said that I applied that patch, but I can't find it. And
it's been 10 years so I have no idea... The wording about power savings
seem to have come from Hans, maybe he knows/remembers more?

But I really wonder if we are not better off keeping reset line in
"inactive" output state, like every other driver does.

Thanks.

-- 
Dmitry

