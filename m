Return-Path: <linux-input+bounces-7552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 111919A4B00
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 04:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70F58B22597
	for <lists+linux-input@lfdr.de>; Sat, 19 Oct 2024 02:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBCA1CC898;
	Sat, 19 Oct 2024 02:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrgwoTSn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC270A47;
	Sat, 19 Oct 2024 02:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729305992; cv=none; b=KSVIgGkc6C83EgFdmTymSUR6cOuZRr2+LQFclQEhpWi3dahFKoSEHEQlTbHQ0sgOTBIV8qA6Cf/z7FtNNBdr636lG/YL1LP3Xeys0EkCHb2jVaS2iavMxxlCIBtDCrl4YQ2lr7HmQTgVhwkdrsLTJX+b8PJfbxv6I2bonyFKnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729305992; c=relaxed/simple;
	bh=jrwxkCuv2eNuxcX1z3pk+vMqR6y4+1kULUw14/5t3H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLtVKYc2Yo0OPAPn8wxevVg6gXBsXMYKkukg7JLNvSxxW3AbpA9/WP8oysVa1xirD6Q8oCVTd2R1XerRdPRM2qOVWDdme7ZKWojIuMwhn3slwMjhlCv4heQlyVqBJuBS3cdZb4wGltEYpu6FRrSsovVA3Bz2V7r7EmRCHWQvjGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrgwoTSn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2b549799eso2081566a91.3;
        Fri, 18 Oct 2024 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729305990; x=1729910790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=liiZ6/mTtCTwcggTEm/PxluGi984aAMQ8n44IAE9t88=;
        b=FrgwoTSnmZTcK4nWyphSICus1Ujlp2C/lmE3PTSy70I1la/ukZEdBOAQuLmQpWYJXu
         M/pbsT6xtQ0B8CRlnx78P1al3vtUVcmSOVwNwazWluyb+WtPOgtQzplfGBZ/d9imCDAr
         3be2nXemoKWzJsd45i9SEE5lzwb893G+Ak0f4bwhnChLyNSzWrRAjVKjF2icoC5D1WcP
         pM8+PTagOJSt1XRP9VAdR5rPPO3h+s9DBMQBK/woVNmMCBVuAdBhxsz8zXtpvpO/vwgm
         yCu4ONKqMzxr1X/uIGMsBLTjv4JYAMs9CSALe4SOY5dsmFIhR+ILmAz9pMPHCB+ycvNH
         Mbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729305990; x=1729910790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=liiZ6/mTtCTwcggTEm/PxluGi984aAMQ8n44IAE9t88=;
        b=usvoxZCGak1bNsYUeLU/Wy0vvKOK9hkw47hwTfqhx3sl2cpjdwddbAxoJOlhMFk70t
         9BPb8767LGCh2lZ45rG71I3gD2UesC0eGaGSQpnd2RzQLw1vJiDy//N9yfG+cyD1OgyV
         BVSgzNZbTufnG+vdylDoWRDUciAWxW5IASoIxSE8JeJEOUoVRgA0Zdmh0Ljc2JvkZI30
         bhmAle9cS/jcwzJAGINi3WiODBy9bXzuxyLVo9jrzp5UoVfHs2E0M1zSXiAzp0z7qJUr
         NYM1+sV34dZdXc9cy/rAt0TLXvnLMBu6HU8h6fKWyETCRY+ZqB+vNnWLbgJc1QK2se0j
         FKDg==
X-Forwarded-Encrypted: i=1; AJvYcCUCryY4pd4Cr4vr0GCQkoFPPFIAe9QpOj/q2htQANLPZnMJCZhRod8F7UN9Shlaa7S30kBJVgmem0zqUdk=@vger.kernel.org, AJvYcCUSZ6dkb+Vxw6NVbykjF37kTJgZSagfyV0xfhzNIOu7pkXbYITV9WslXEN5ECcbxuK6kyGcPbVuMu16@vger.kernel.org, AJvYcCVUjzLB9chXFhMuBxENMvI57qBLY8s8vL5ZnYbvUQdFHPfSjYGXFZR2Ev5xhb2xVaedX/Sw1dOLg4zWVXiG@vger.kernel.org
X-Gm-Message-State: AOJu0YxCA3+cwbTdUf8lep5oTXbZjAr+Dr1teU0Yu2JGGFC95YXtkeo1
	oLYGOy53QEaAx2dWck7p8Zz3zKS3ATPsdFfZXdPURcmDFc/2crTT
X-Google-Smtp-Source: AGHT+IEh8QEkrwts79kw1BLVJs6w0RO310+Kdn6szhuKm/F/iamDaKnvyDt4QqghRgPzSTls5Ue+2Q==
X-Received: by 2002:a17:90a:a615:b0:2cf:c9ab:e747 with SMTP id 98e67ed59e1d1-2e5616c4300mr5501245a91.1.1729305990004;
        Fri, 18 Oct 2024 19:46:30 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2e70:ca2:a7a2:d21d:dfaf:c0b3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5610b59c7sm2797513a91.3.2024.10.18.19.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 19:46:29 -0700 (PDT)
Date: Sat, 19 Oct 2024 10:46:21 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, dmitry.torokhov@gmail.com,
	hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZxMc-HP8o_qHKhKI@ux-UP-WHL01>
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <06151891-a260-450c-b688-fff18638e627@kernel.org>
 <ZxJCvwxwamvRZ3m9@ux-UP-WHL01>
 <f8ffc231-6961-44f8-ad61-3a07ab22e849@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8ffc231-6961-44f8-ad61-3a07ab22e849@kernel.org>

Hi Krzysztof,

On Fri, Oct 18, 2024 at 01:41:41PM +0200, Krzysztof Kozlowski wrote:
> On 18/10/2024 13:18, Charles Wang wrote:
> > 
> > On Fri, Oct 18, 2024 at 07:59:46AM +0200, Krzysztof Kozlowski wrote:
> >> On 18/10/2024 04:08, Charles Wang wrote:
> >>> The Goodix GT7986U touch controller report touch data according to the
> >>> HID protocol through the SPI bus. However, it is incompatible with
> >>> Microsoft's HID-over-SPI protocol.
> >>>
> >>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> >>> ---
> >>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
> >>>  1 file changed, 58 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> >>> index 358cb8275..184d9c320 100644
> >>> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> >>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> >>> @@ -8,27 +8,27 @@ title: Goodix GT7375P touchscreen
> >>>  
> >>>  maintainers:
> >>>    - Douglas Anderson <dianders@chromium.org>
> >>> +  - Charles Wang <charles.goodix@gmail.com>
> >>>  
> >>>  description:
> >>> -  Supports the Goodix GT7375P touchscreen.
> >>> -  This touchscreen uses the i2c-hid protocol but has some non-standard
> >>> -  power sequencing required.
> >>> -
> >>> -allOf:
> >>> -  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> >>> +  The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C interfaces.
> >>> +  With the I2C interface, they use the i2c-hid protocol but require non-standard
> >>> +  power sequencing. With the SPI interface, they use a custom HID protocol that
> >>> +  is incompatible with Microsoft's HID-over-SPI protocol.
> >>>  
> >>>  properties:
> >>>    compatible:
> >>>      oneOf:
> >>> -      - const: goodix,gt7375p
> >>> +      - items:
> >>> +          - const: goodix,gt7375p
> >>
> >> That's not a necessary change. Keep old code here.
> >>
> > 
> > Ack,
> > 
> >>>        - items:
> >>>            - const: goodix,gt7986u
> >>>            - const: goodix,gt7375p
> >>> +      - items:
> >>> +          - const: goodix,gt7986u
> >>
> >> Hm? This does not make much sense. Device either is or is not compatible
> >> with gt7375p. Cannot be both.
> >>
> > 
> > Ack,
> > 
> >>>  
> >>>    reg:
> >>> -    enum:
> >>> -      - 0x5d
> >>> -      - 0x14
> >>> +    maxItems: 1
> >>>  
> >>>    interrupts:
> >>>      maxItems: 1
> >>> @@ -57,6 +57,15 @@ properties:
> >>>        This property is used to avoid the back-powering issue.
> >>>      type: boolean
> >>>  
> >>> +  goodix,hid-report-addr:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    description:
> >>> +      The register address for retrieving HID report data.
> >>> +      This address is related to the device firmware and may
> >>> +      change after a firmware update.
> >>

> How is this supposed to work? DTS will stay fixed, you cannot change it
> just because firmware changed. User loads new firmware with different
> address, but DTS will have to use old address - so broken property.
>

Sorry for missing this issue in my previous response.
Honestly, although the likelihood of this address changing is low, it is
indeed possible for it to change due to a firmware update during the factory
debugging phase. However, for machines that users have, we will ensure that
this address will not be altered as a result of a firmware upgrade.

> >>> +
> >>> +  spi-max-frequency: true
> >>
> >> Drop
> >>
> > 
> > Ack,
> > 
> >>> +
> >>>  required:
> >>>    - compatible
> >>>    - reg
> >>> @@ -64,6 +73,25 @@ required:
> >>>    - reset-gpios
> >>>    - vdd-supply
> >>>  
> >>> +allOf:
> >>> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> >>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          items:
> >>> +            - const: goodix,gt7986u
> >>> +    then:
> >>> +      required:
> >>> +        - goodix,hid-report-addr
> >>> +    else:
> >>> +      properties:
> >>> +        goodix,hid-report-addr: false
> >>> +        spi-max-frequency: false
> >>
> >> Why? GT7375P also supports SPI.
> >>
> > 
> > No, only GT7986U support SPI. What I'm trying to express here is that
> 
> Description earlier said:
> "The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C
> interfaces."
> 
> so both support?
> 

Sorry, there is an error in the description. Currently, only the GT7986U
supports SPI, I will change the description.

>
> > the GT7375P does not support the properties 'goodix,hid-report-addr'
> > and 'spi-max-frequency. Is there any issue with writing it this way?
> 
> spi-max-frequency could stay, assuming device does not support SPI.
> 

Ack,

Best regards,
Charles

