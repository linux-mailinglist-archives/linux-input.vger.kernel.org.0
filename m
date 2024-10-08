Return-Path: <linux-input+bounces-7143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E749942A4
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4F51B2AF99
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FA81D31B3;
	Tue,  8 Oct 2024 08:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4+rD2Gy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF31D130F;
	Tue,  8 Oct 2024 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375550; cv=none; b=HXOtho3YgmA8K3lIPHb8kcF1CP7QwXza6jpDsHJ7Zw2KLNv5QGc+h/7odJUWnLH3urDYBSDKhzLozGMwAnAiz9k96lva9RHbGe05zFGembUvtMmnKZk/paIeu1JsulX6IlguJfVFCUPgqD5dNeglPnqeIkCCjX/kqA4Jr8aQF3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375550; c=relaxed/simple;
	bh=9P+JJVyKc7l2VDZOwZvaCkESmgV1GThjME8P4ME7/+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLXWbcYQcvXceeXFkjrqcb0h7TgjWCD2ylvnxC5l36X9HzZE7WJwiPE41voO4AyuSt5hrU9uPdEzN9HYc+NscwdBFYL36Ec18L57ITpaQ1DAmCX77a5z3jwPvRsqpk/TxhpYvHd+vU6M2X89j72eE6QPQ3pEunV3wfp/mgOYO28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4+rD2Gy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ba8d92af9so39871825ad.3;
        Tue, 08 Oct 2024 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728375548; x=1728980348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EijXXfuTPV2MC//h2OzTNQi/I7mW/HLUsjozVhYcObo=;
        b=L4+rD2GyTeTHp1v1bHdFM057r49+Krs/aqa4DRjoJxzCDLgHNUDUrs0BkD3ybtys5z
         857nOG51vkfzkbcrVglRnKCyi9cQdKuX/wzfn+E3EXIMeTOvueASlhDXP7+Wm680o60R
         zD+0NM2liRm+hqftDavNWHLS27tFaFN6hH0zj025DF7Yj45uCP+mzVRDLo+TyG2xrKLu
         DGDhULQyd2cJ98TTBcAtZy9gd4MvmRoXc94WSSGNMQdfCJNQjcLvs0F+cZT8DiQZ4B2/
         /z+8wcUo117DwhPSa8y5LEW0h7HVHxnFzIM7Uf/WhxdJKJFqTPoZzcjVKcUcX2LcsD1W
         3uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375548; x=1728980348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EijXXfuTPV2MC//h2OzTNQi/I7mW/HLUsjozVhYcObo=;
        b=hUxpHuHkFxSWygsv+HlK2aiUPvKNCulkQXIbiwQ39iicqMwqkb49hPcOVPmO22ORUN
         Un16FmzmqioZ9q8IzhNulG6aP2hQ5mCtQgV/t+PutL2ijm6r8aI+lgepgpp4cDdsKxET
         8DJTA7sC6ht/KAMgay2gV7+E1L4LdVmgzkXD1PTqyDqcwcoUxxmT0DwnCQNLkocuq1Y9
         t2UsoomkQv68fMAKfl/zH0juGXR/LIwKU3gEtTbytRUzrRFqVnt8iPs6ZHR40UtegIE+
         HYncW2AbSWKqpvhO3IvGtW489OZZywAjslSdpIsrHb46eFNp/BK+jDVpuu5WmyG5A7jh
         jYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV40q0MvWECPeyIPWk79kadFVeLTs0TlRBZqiIX6vR15xhRfenQBlDUlP1rxa2KMERky38yImQdPuniKFyU@vger.kernel.org, AJvYcCWC5IyuleYcZPPu5tDU8HNOSCaUQehkOc9DnZEETX7Yq5CrcgbEAFeys4chsCRJOlDpVu0Dp9rntINb@vger.kernel.org, AJvYcCWGnam7Jb2QzUcj2ghXXQ5+kITlQchQoYZYx2JrqWF6H1I7XPG3Iyy65qWQoRfPN1CL4jqeBx6tluLpU3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq6rjDPiYe5Q8Uyc9j9ojAfT1u3iWv4wQoA4QUjsGRwEMvTZHh
	h5dembGh0gXXcACm31nn7+HFlCB35BgO7CZEdI28Ir1lMutkKDo2
X-Google-Smtp-Source: AGHT+IHdB9zVV8+v/Nfg3WpRe0Ovlzf4BuSo99gjoRLqxU6wcM9gsa/Qs6Czroiar0n/FKsiqYAOZg==
X-Received: by 2002:a17:902:d2cc:b0:20b:99bb:c403 with SMTP id d9443c01a7336-20bfe497052mr221222705ad.39.1728375547718;
        Tue, 08 Oct 2024 01:19:07 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:38d8:444b:83fb:5691:d5bc:9ae4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c5ba27178sm1905015ad.171.2024.10.08.01.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:19:07 -0700 (PDT)
Date: Tue, 8 Oct 2024 16:18:53 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZwTq7b8GOinArYeh@ux-UP-WHL01>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
 <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>
 <ZvUwFur1vWYteQMy@ux-UP-WHL01>
 <87d49032-cb94-4cf8-a5e0-44eb2ec37111@kernel.org>
 <ZvoZbWQx5BfMI_Cd@ux-UP-WHL01>
 <8d5ff5c7-1f66-4a1b-a235-868d13afe03e@kernel.org>
 <ZvpZnYvJ-ejxe43Q@ux-UP-WHL01>
 <dcb7a9de-a7c7-4d04-bc36-22f66ef17a38@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcb7a9de-a7c7-4d04-bc36-22f66ef17a38@kernel.org>

On Mon, Sep 30, 2024 at 10:08:52AM +0200, Krzysztof Kozlowski wrote:
> On 30/09/2024 09:56, Charles Wang wrote:
> > Hi Krzysztof,
> > 
> > On Mon, Sep 30, 2024 at 08:42:22AM +0200, Krzysztof Kozlowski wrote:
> >> On 30/09/2024 05:22, Charles Wang wrote:
> >>> Hi Krzysztof,
> >>> Thank you very much for your advice.
> >>>
> >>> On Thu, Sep 26, 2024 at 02:32:05PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 26/09/2024 11:57, Charles Wang wrote:
> >>>>>>>  1 file changed, 71 insertions(+)
> >>>>>>>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>>>>
> >>>>>>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000..849117639
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>>>> @@ -0,0 +1,71 @@
> >>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>> +%YAML 1.2
> >>>>>>> +---
> >>>>>>> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> >>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>> +
> >>>>>>> +title: GOODIX GT7986U SPI HID Touchscreen
> >>>>>>> +
> >>>>>>> +maintainers:
> >>>>>>> +  - Charles Wang <charles.goodix@gmail.com>
> >>>>>>> +
> >>>>>>> +description: Supports the Goodix GT7986U touchscreen.
> >>>>>>> +  This touch controller reports data packaged according to the HID protocol,
> >>>>>>> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> >>>>>>> +
> >>>>>>> +allOf:
> >>>>>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >>>>>>> +
> >>>>>>> +properties:
> >>>>>>> +  compatible:
> >>>>>>> +    enum:
> >>>>>>> +      - goodix,gt7986u-spi
> >>>>>>
> >>>>>> NAK, you duplicate again the binding. You cannot have bus-flavors.
> >>>>>> Device is the same.
> >>>>>>
> >>>>>
> >>>>> Could you provide some suggestions regarding this issue?
> >>>>
> >>>> What is exactly the question or problem? There is a binding for this
> >>>> device. Extend it with SPI parts, e.g.
> >>>> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml#L22
> >>>>
> >>>
> >>> This seems a little different from the adxl313.yaml.
> >>
> >> Hm? I am reading below:
> >>
> >>>
> >>> The issue we're encountering involves the chip model gt7986u,
> >>> which supports both I2C and SPI interfaces. For the I2C interface
> >>> (using the HID-over-I2C driver), it has already been declared in
> >>> the goodix,gt7375p.yaml file as follows:
> >>>
> >>> i2c {
> >>>   #address-cells = <1>;
> >>>   #size-cells = <0>;
> >>>
> >>>   ap_ts: touchscreen@5d {
> >>>     compatible = "goodix,gt7986u";
> >>>   }
> >>> }
> >>>
> >>> Currently, our design requires utilizing the SPI interface with
> >>> a custom SPI driver. However, the declarations within the binding
> >>> file have led to conflicts, as shown here:
> >>>
> >>> spi {
> >>>   #address-cells = <1>;
> >>>   #size-cells = <0>;
> >>>
> >>>   touchscreen@0 {
> >>>     compatible = "goodix,gt7986u";
> >>>   }
> >>> }
> >>>
> >>> Should I consider merging both YAML files into a single one to fix this?
> >>
> >> And there is no difference. I don't understand the problem.
> >>
> > I'm sorry for the confusion regarding your comment
> > 
> > "And there is no difference." 
> > 
> > Are you implying that the issue we are encountering is no different from
> 
> I don't understand the issue.
> 

Sorry for my poor English expression.

> > 'adi,adxl313.yaml'? Or are you suggesting that the gt7986u device should
> > be treated as the same entity for both I2C and SPI interfaces?
> 
> I told you what to do - extend existing binding. I gave you example how
> one binding is for both I2C and SPI devices.
> 

Ack, thank you for the clarification and the example provided.

> > 
> > Original error messages: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/
> > 
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u
> > 
> > This is already documented in goodix,gt7375p.yaml. Now linux-next has warnings:
> > 
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> > fixed:
> >         ['goodix,gt7986u'] is too short
> >         'goodix,gt7375p' was expected
> >         from schema $id:
> > 
> > I understand this error message to mean the same chip model is redundantly declared
> > in two separate files.
> 
> That was old error, which I fixed by reverting your patches.
>
> > 
> > Is my understanding incorrect? Could you provide more explicit guidance?
> > 
> > Note that the 'gt7986u' uses different drivers and has distinct device property
> > for its I2C and SPI interfaces.
> 
> Drivers don't matter. We talk about bindings here. One device, one
> binding, one compatible. Regardless of the bus.
> 

Okay, really appreciate your guidance.

Best regards,
Charles 

