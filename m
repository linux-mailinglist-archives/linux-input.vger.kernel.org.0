Return-Path: <linux-input+bounces-8002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4A89C36DC
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 04:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF0422821E4
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 03:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413C813DBBC;
	Mon, 11 Nov 2024 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSiZvqI1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA779CD;
	Mon, 11 Nov 2024 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731294446; cv=none; b=NIxKQPYz3+jsp5PrbcVm31Du6wxEMnZ+RPNxZ48ER4/1/29ON/y8IHmO43XsVfXogiEMYyU5WmHFQ1pd/RnCeHfw0WKbg0Xtfon80tw+OPpwH60axKZhY0N2j4H7/9//aRc6DZ0OX3dNkCcovkV4yoKUgdW8COVKA2uS/BLzw8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731294446; c=relaxed/simple;
	bh=kWilXyXifJn1BQi4sNgAQdeJAXJ92Ml4lyPvF77FQOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qid7pVrutIZK8VAATPwNnMYNaSPNS1ISI8TcjyGRaOqV53s4Vr7ZIOrrOW6o3j/1yx3QkIeJmc3d6zRZ52bJvkB608yVU6gEdNZAzCSO0qpAmeffQ5GqaH3ebGg/b4seFFGiaRXGr0jCr06UJrQ3jLzAvJlewRCCRNCoUHSVvBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSiZvqI1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c77459558so36915625ad.0;
        Sun, 10 Nov 2024 19:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731294444; x=1731899244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/yhBwdBkO3EvWnL2Gdzwejc6C9EEHECDVXg3hebesDM=;
        b=LSiZvqI1EqxEEHAdsI59K0ro6f5008Yjhqe9EU8DfzDJFrlryfMh1oaDQ4Ps9Rc7Xq
         xlu4/+M3Jnt4kESJIU3vb8SbwOkdv8LFOtOOJLySoHquEVQRpOBPYCUcj2iGLWdnWN/d
         cVnQSGxkY7+WdTk5xHO3W29wI/ewWfQmKhqG8Dk6s0Pqd5uhWMU1Dbm3ymZd0HJdL1Ct
         /G9uwy4RW3TX38Wt9vs1MMV4j4TjZlSInxU9rGvt2k/yfmhE2XFuj/GukVOx4K2G1DUF
         7g7QXTf7a+926WQQLz2bQfWQOtjwKMwPoILGruoqXO49uTtTRb7kQjzrVLI3ecsa5BFG
         hcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731294444; x=1731899244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yhBwdBkO3EvWnL2Gdzwejc6C9EEHECDVXg3hebesDM=;
        b=NjZCU3hCejGD9+ul112NAa+R8n1qqiffDUO+vlvOSbdNIAYhkQGYEATTd95BBAlOkq
         edJaILYrEzPSr4sgtrVjyrfdI+l9tVx96fK7T7ejdZYpsqQCW1SMqa+GgCqNejcmL8i2
         V3/o8B0enomkVI+KSoznAQZYHRtPxKqhUUN8pDRx0SburKx/L+TmCN7fu5rC3qrQa5Kf
         n6I+NRXOkXJfyGVaObGd8UU9iz9gwbePlVGmaeIjvC7dWvAJYE1UjTh2CdMHPlD4/wKT
         9mPXe972+DVAcMkSGf2SyqJeWBBsLzEP5WTeyiRNj7yO1gK5ygs9tNsqjf8mP4TmeW8p
         AcWA==
X-Forwarded-Encrypted: i=1; AJvYcCUz7gKdJxuCIhnDcHCcF/ICeIBt85WbIaBOljMURhHcH0gw6jzS9XivxPR30B6YeH50RtVnKYsgYJFo@vger.kernel.org, AJvYcCVkl1Kcj8Y320GdFXPo5aZP0APVtILTy+F1+ud+g+P1LM5jusabi9Muw/CDHd3re94VeoSUNhjCvYt+IhE=@vger.kernel.org, AJvYcCXTlB7Ka3xokbs+xF7TTwD78i+JAfE4eBkoar4kAwbm/+d4wnO+6dOObIuvcPi6jHbnLTETG8aiWGy8A8Fn@vger.kernel.org
X-Gm-Message-State: AOJu0YzHjcZnXA4Y0NiDqSud5x1dkKf9wnM4Von1vtgEsiobBE4MPYVe
	+ZLMNG23joydgrmsMbcDTBff92JgGRGS2/zudWuIHypHJswo9R7u
X-Google-Smtp-Source: AGHT+IHoiIf2XDcRmfnROELiYO2OcFzC2AC0fhNz1U8stAN5RC/2iK/N4fkcWg286lI644r7E/QTPw==
X-Received: by 2002:a17:903:41c4:b0:20c:c88b:511b with SMTP id d9443c01a7336-2118358a62emr154008835ad.33.1731294443909;
        Sun, 10 Nov 2024 19:07:23 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc8354sm66224865ad.4.2024.11.10.19.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:07:23 -0800 (PST)
Date: Mon, 11 Nov 2024 11:07:18 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: krzk@kernel.org, hbarnor@chromium.org, dianders@chromium.org,
	conor.dooley@microchip.com, dmitry.torokhov@gmail.com,
	jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <ZzF05nei_PJBnXRF@ux-UP-WHL01>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-2-charles.goodix@gmail.com>
 <20241108161000.GA2270872-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108161000.GA2270872-robh@kernel.org>

Hi Rob,

On Fri, Nov 08, 2024 at 10:10:00AM -0600, Rob Herring wrote:
> On Fri, Nov 08, 2024 at 08:03:10PM +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > NOTE: these bindings are distinct from the bindings used with the
> > GT7986U when the chip is running I2C firmware. For some background,
> > see discussion on the mailing lists in the thread:
> > 
> > https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > new file mode 100644
> > index 000000000..8105b9ce2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/goodix,gt7986u-spifw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Goodix GT7986U SPI HID Touchscreen
> > +
> > +maintainers:
> > +  - Charles Wang <charles.goodix@gmail.com>
> > +
> > +description: Supports the Goodix GT7986U touchscreen.
> 
> Move to next line.
> 

Ack,

>
> > +  This touch controller reports data packaged according to the HID protocol
> > +  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI protocol.
> > +
> 
> If you want to maintain paragraphs you need '>' or '|' after 
> 'description:'. IIRC, it has to be '|' due to the "NOTE: " here:
> 

Ack, using '|' works.

Best regars,
Charles

>
> > +  NOTE: these bindings are distinct from the bindings used with the
> > +  GT7986U when the chip is running I2C firmware. This is because there's
> > +  not a single device that talks over both I2C and SPI but rather
> > +  distinct touchscreens that happen to be built with the same ASIC but
> > +  that are distinct products running distinct firmware.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u-spifw
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  goodix,hid-report-addr:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The register address for retrieving HID report data.
> > +
> > +  spi-max-frequency: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - goodix,hid-report-addr
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      touchscreen@0 {
> > +        compatible = "goodix,gt7986u-spifw";
> > +        reg = <0>;
> > +        interrupt-parent = <&gpio>;
> > +        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> > +        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
> > +        spi-max-frequency = <10000000>;
> > +        goodix,hid-report-addr = <0x22c8c>;
> > +      };
> > +    };
> > +
> > +...
> > -- 
> > 2.43.0
> > 

