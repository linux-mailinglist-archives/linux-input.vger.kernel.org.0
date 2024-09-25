Return-Path: <linux-input+bounces-6722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34641986876
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 23:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED531281531
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7E214D299;
	Wed, 25 Sep 2024 21:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ekzz1Ns1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DF4C91;
	Wed, 25 Sep 2024 21:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727300760; cv=none; b=NelnWWBjFlnS9ognBJQc7COo/O4XdsyFGHLbhee8xNn1SomhG1Z3unmelmqMbFgBRUinz/xZ+HSv5RJ0bCh0YAoDPZOWuVdTI6WiML5+yKF/EGEOihWZEHS/HzHDjwU+KTjEmNgV0CxzHZBzsZOu9ju01PgIyckxLX60ZAXmXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727300760; c=relaxed/simple;
	bh=mjSdvmDDeg5uGKVjHJ9VJUicVT2ZG8wk8GU45xLxz9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIJMFVAJ9mPqpwS04M6rzOTQ8k+TbgiklfdcQ6kT8ic6fCT/wBbIoRuaA8J32Wo3H3xQYIr4cMe35X7HhBlCBx8Nt2fwXk81SZ9l4eDbeBuYEub/GwPQukjCIjemyfQd5BpiTGxG6CHLaGktVL/0UmOHgXsBegnjUvmNWv2P2Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ekzz1Ns1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b0b2528d8so2689595ad.2;
        Wed, 25 Sep 2024 14:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727300758; x=1727905558; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8gIKllQESEXWDuVjffYCuPTY+jx2pXNh0YOpfxcs1cQ=;
        b=Ekzz1Ns1eni8riLsqwA5H5oac8OfJsk26uz1CjgFNOgrJn6cYKjoT6mwxICrgqcT18
         Ctm330VX3y7Ent0QY70dqt05oCrce6FUozYVdXgiAyKmTbRVyykTcdUyFrpvsGMeKmAt
         APTMzpm4SOrUrBpKDAcWC1Swuma5ZcoxzlzjwVhyiIGPWvRba5gORenQFHlihFL6EDlm
         5uMgs4cCTyCWhJ5LIOwJOfs8u1JyWJTSgGlxmdDsSywquB0LqPIB/c+9ppw/KPIENbEs
         wZo47jqUT8XIYQ3R+T8phZvnnvQ+FeXnZtHyuRnCBRr+M/jpT0x56Xg4rNt7YS4kwpXI
         sRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727300758; x=1727905558;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gIKllQESEXWDuVjffYCuPTY+jx2pXNh0YOpfxcs1cQ=;
        b=Jtglc3Mlq0zcN1hc23/ASHf5aQrnzJQJ2H+mlHgO7+e1pn9CODPupGqX0Gq7QPav6V
         6eri2nW5e8u2H6J36acb35sHkEc3f6QQB0Nz2l9Ct2xefpLuBqniAdI1dIUDf+OAaDtg
         squhKipmP/gqe/pDBYzdPKRHyx08boyFp3UKCJwvxk7XcC/g4LAW4mOGMjfiIPj7HnLh
         ZldpVCvD4wH2ggPQ7xfrFq9aUgXymh/XdwrWKfE8mcUdk6QXcMDNnyfS45/wlkdWuL5q
         3kuiwnZ7eG3X+f711/B9jgbdZ9cs86dc9vcKzxiI10ZZQ/2KvJO/o7CXuA0brX8EKUWj
         f9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU+AgDfg6XedpIevqSukXDyprLYXOEy6lTfgJSPCaD/nuV5x0gSUR+wOFTOmlreAq6FBk9WCINootWfH6E=@vger.kernel.org, AJvYcCVE7agKefnGEs0Lnjz4nWZJo52L+UfakZFkhpxyKvz5WZco5eP0BaOb0mBJLLKqhP8fSTRL7E9yZFbiudpk@vger.kernel.org, AJvYcCXbS6NU8Ss0+tYm1HQ+r4BXZHGm8StpsCeNSmPpXriHQJ3ET1JsY0uF8186Iq2lO+1yf+0fdCmZsTvS@vger.kernel.org
X-Gm-Message-State: AOJu0YytR6fLZAwp9uc4JkGB7YoEr79v0Lcpodc/CXyNduN61JBS1wkU
	wsYJdf6N2RAB+Hix4/igtXROHnNp5Oauj1YbqHaiGOisJ9dzSnKM
X-Google-Smtp-Source: AGHT+IETNqtMlQxZaFuOKl/wcIj7BhxFJ6AJJ0ayeTnmOUWK+IvW4zjNH8rpWKZeRfbNmjJT3ACqvw==
X-Received: by 2002:a17:902:f54e:b0:206:aac4:b844 with SMTP id d9443c01a7336-20afc400e57mr68105395ad.6.1727300757659;
        Wed, 25 Sep 2024 14:45:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dda4:383f:ca3a:82bb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1867938sm27957185ad.309.2024.09.25.14.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 14:45:57 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:45:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Charles Wang <charles.goodix@gmail.com>, dianders@chromium.org,
	dan.carpenter@linaro.org, conor@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvSEkn66qNziJV0M@google.com>
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com>
 <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
 <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>

On Wed, Sep 25, 2024 at 12:40:56PM -0500, Rob Herring wrote:
> On Tue, Sep 10, 2024 at 5:41 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Sep 6, 2024 at 3:28 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Aug 13, 2024 at 9:45 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > > >
> > > > The Goodix GT7986U touch controller report touch data according to the
> > > > HID protocol through the SPI bus. However, it is incompatible with
> > > > Microsoft's HID-over-SPI protocol.
> > > >
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > ---
> > > >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
> > > >  1 file changed, 71 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > new file mode 100644
> > > > index 000000000..a7d42a5d6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > @@ -0,0 +1,71 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: GOODIX GT7986U SPI HID Touchscreen
> > > > +
> > > > +maintainers:
> > > > +  - Charles Wang <charles.goodix@gmail.com>
> > > > +
> > > > +description: Supports the Goodix GT7986U touchscreen.
> > > > +  This touch controller reports data packaged according to the HID protocol,
> > > > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > > > +
> > > > +allOf:
> > > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - goodix,gt7986u
> > >
> > > This is already documented in goodix,gt7375p.yaml. Now linux-next has warnings:
> > >
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> > > fixed:
> > >         ['goodix,gt7986u'] is too short
> > >         'goodix,gt7375p' was expected
> > >         from schema $id:
> > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > touchscreen@0: reg:0:0: 0 is not one of [93, 20]
> > >         from schema $id:
> > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > touchscreen@0: 'vdd-supply' is a required property
> > >         from schema $id:
> > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
> > > match any of the regexes: 'pinctrl-[0-9]+'
> > >         from schema $id:
> > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > >
> > > Please sort this out and send a fix.
> >
> > I should add that it is intermittent whether you see this error or
> > not. The tools select a single schema based on the compatible string
> > and it is undefined which of the 2 schemas you will get.
> 
> Still an issue and no response. Please fix or revert the series.

I see that Krzysztof sent a revert, but what a proper fix would be?
Apparently Goodix is using the same product ID gt7986u for both I2C and
SPI parts, and covering them in one binding is not really easy (well, I
guess it is possible with a big ugly "if"). Do we just slap "-spi"
suffix on the compatible, so it becomes "goodix,gt7986u-spi" and go on
on our merry way? Is there a better option for such products that
support multiple interfaces/transports?

Thanks.

-- 
Dmitry

