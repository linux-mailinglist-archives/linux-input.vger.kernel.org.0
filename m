Return-Path: <linux-input+bounces-7535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F032A9A3D2C
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 13:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB238281371
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 11:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D5720100B;
	Fri, 18 Oct 2024 11:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSZoXEtP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E5F15CD74;
	Fri, 18 Oct 2024 11:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250298; cv=none; b=czAoCDb1NFSB+Dl14OLemnLi3RwR80p1VEKv/fYOkb7sh8C1T7QVCRUwTW8tKJIFKPRIC8pCGWdvex8jT0aB4mZHJ7RiEdWRdreEC9kiaKrSyjX9vkK/Qez77Cz8FsWHIyMejiqbTkY+MXfc1LNZ/cAVOp01u9a2Z1bSR/Wchq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250298; c=relaxed/simple;
	bh=31wnohWQ+bxg27sQPxHsxxLO3o0/2om6sMnqboJXIo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgfPdTjGkH/Z/J29br9NSgHsCKSrbj54HhH9d0f3vuWiQ8UBtTHBHeqXWy05ha7c1nugaSylTa1Bp/yqlsfYA9SMzk2jwBLFkIBtYSjtntIj+OfR4SoxChFFgqQnZSQHv80RSv0nb4+2shilWuQrLfNxN1kv+1VFsCHP3pAV8UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSZoXEtP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cdb889222so20607395ad.3;
        Fri, 18 Oct 2024 04:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729250296; x=1729855096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AD9xrwy8AQVug5A4qhxj8S+oD2WPcuOf0xgjF6JZQiA=;
        b=JSZoXEtPwgGuwvRdxsYqF42o0YIwKwSgWXxz5qmxSAW3fKEitivRIt8iKXLgU026xE
         L9FTCJ72wjn6vl9KzkrFWjXPKwQkLd7ICUmM0tNXYA36dgopWrcdNotV7Foxji5u+vv6
         riHdV0smVNXroAsHuoNx1EEWXvIpDU84L94vQXLdR1FOqnwaS9HX0msfTMZVc8cqHWun
         ML7S+92OBgz4Z8+ZQv6Yv7FRFkdkVJm5tBVbvnN7I3/NX+q3VQzK5gWSL935co1asJFE
         fCVCvm30JZUje4ffRf/PDenN5XhyJka88PUoDD4kBTRcHvyxzUFwhaeebLoJ+X+WAkJu
         CEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729250296; x=1729855096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AD9xrwy8AQVug5A4qhxj8S+oD2WPcuOf0xgjF6JZQiA=;
        b=XF22xDsPt8cTAAdwwDy8Ddo3IZxmNo2rL7L4jwSukuF0u1rNHQr9pKvDKUQ1SY7hBG
         9FyCW4weMAfQuoYQF0xOrKGz1j2i3yye0Tdn5TkTcI/xLKacseOKQkoXtJFKCoGFE4dY
         9BJ9QnnZWI94Pkptv9DdunrnsSgS67z4a6xQEPPdAUYvSfcpVN8wF41beuufvT1pKxk8
         aThGo4ORE5DDSxZ1h8wLSbm1MB+a1/5rYIQnHTSbGZgplie2A/uh1ucr8Qa2WRcqvCwy
         Y8957bfvzzNOQ/6StI8laLCM4Z8oknu9w5bp9fir9S0a+GkEZxUUep7BQwsEQoMMOZd8
         4L4w==
X-Forwarded-Encrypted: i=1; AJvYcCVsHdL4UXQ5rLVNAHh5xRc21G8R+I7SEkijap39vPqlQ4XFSDfBFGIjsoes+RZa18P2x9TbUIibNJSlR16y@vger.kernel.org, AJvYcCVy9AznQ7ATfqw0r1PflqfNGo/e/9Ys3Fvj9ligVUpsM9LX77TF9KIhMW0n61ATx6GWzd44C+Ok4ZSSGkA=@vger.kernel.org, AJvYcCWF0yAUW2oseXAAFxIscFjTULzVlyYNyj+ZmauBSUYVj4TNHCeN/CgUPSv/iNM/u8kDHsyl88cOKe2v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxta6Y3qg05z72lMtxNHG5aokD0vq2NHLqgVWO5uOBkP5F7C5yB
	9vrqwOeAyqJS2Fk64M75lWVsCvqEQQ6gK5MikiWXYR5U21ck1PtI
X-Google-Smtp-Source: AGHT+IEVZI9VguOIUy++m8V3bQDBofvSkPkutmCkt1I/ydjuQsi5ZfdokTvb+4cXSXZT7hmIlQiAog==
X-Received: by 2002:a17:903:1104:b0:20b:7be8:8eb9 with SMTP id d9443c01a7336-20e5a93d705mr20019655ad.54.1729250295855;
        Fri, 18 Oct 2024 04:18:15 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2ed0:f711:83b7:17b8:5fad:d135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f04f2sm10524545ad.185.2024.10.18.04.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:18:15 -0700 (PDT)
Date: Fri, 18 Oct 2024 19:18:05 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxJCvwxwamvRZ3m9@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <06151891-a260-450c-b688-fff18638e627@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06151891-a260-450c-b688-fff18638e627@kernel.org>

Hi Krzysztof,

On Fri, Oct 18, 2024 at 07:59:46AM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2024 04:08, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> >  1 file changed, 58 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > index 358cb8275..184d9c320 100644
> > --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > @@ -8,27 +8,27 @@ title: Goodix GT7375P touchscreen
> >  
> >  maintainers:
> >    - Douglas Anderson <dianders@chromium.org>
> > +  - Charles Wang <charles.goodix@gmail.com>
> >  
> >  description:
> > -  Supports the Goodix GT7375P touchscreen.
> > -  This touchscreen uses the i2c-hid protocol but has some non-standard
> > -  power sequencing required.
> > -
> > -allOf:
> > -  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C interfaces.
> > +  With the I2C interface, they use the i2c-hid protocol but require non-standard
> > +  power sequencing. With the SPI interface, they use a custom HID protocol that
> > +  is incompatible with Microsoft's HID-over-SPI protocol.
> >  
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - const: goodix,gt7375p
> > +      - items:
> > +          - const: goodix,gt7375p
> 
> That's not a necessary change. Keep old code here.
>

Ack,

> >        - items:
> >            - const: goodix,gt7986u
> >            - const: goodix,gt7375p
> > +      - items:
> > +          - const: goodix,gt7986u
> 
> Hm? This does not make much sense. Device either is or is not compatible
> with gt7375p. Cannot be both.
>

Ack,

> >  
> >    reg:
> > -    enum:
> > -      - 0x5d
> > -      - 0x14
> > +    maxItems: 1
> >  
> >    interrupts:
> >      maxItems: 1
> > @@ -57,6 +57,15 @@ properties:
> >        This property is used to avoid the back-powering issue.
> >      type: boolean
> >  
> > +  goodix,hid-report-addr:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The register address for retrieving HID report data.
> > +      This address is related to the device firmware and may
> > +      change after a firmware update.
> 
> How is this supposed to work? DTS will stay fixed, you cannot change it
> just because firmware changed. User loads new firmware with different
> address, but DTS will have to use old address - so broken property.
> 
> > +
> > +  spi-max-frequency: true
> 
> Drop
>

Ack,

> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -64,6 +73,25 @@ required:
> >    - reset-gpios
> >    - vdd-supply
> >  
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          items:
> > +            - const: goodix,gt7986u
> > +    then:
> > +      required:
> > +        - goodix,hid-report-addr
> > +    else:
> > +      properties:
> > +        goodix,hid-report-addr: false
> > +        spi-max-frequency: false
> 
> Why? GT7375P also supports SPI.
>

No, only GT7986U support SPI. What I'm trying to express here is that
the GT7375P does not support the properties 'goodix,hid-report-addr'
and 'spi-max-frequency. Is there any issue with writing it this way?

> > +        reg:
> > +          enum: [0x5d, 0x14]
> > +
> >  additionalProperties: false
> 
> This becomes now: unevaluatedProperties: false
>

Ack,

> >  
> >  examples:
> > @@ -87,3 +115,23 @@ examples:
> >          vdd-supply = <&pp3300_ts>;
> >        };
> >      };
> > +
>

Best regards,
Charles


