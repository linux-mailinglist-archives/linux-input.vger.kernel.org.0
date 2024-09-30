Return-Path: <linux-input+bounces-6891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A96C989C06
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F412B1F21DC7
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 07:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14E016A92E;
	Mon, 30 Sep 2024 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDMkKb5y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E161320;
	Mon, 30 Sep 2024 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682990; cv=none; b=lDfKUU3dGdmIbTnq1SD3lwgmU4OZVFEt61op+8J9wTx8YjeO9g5/LjK8FSY0+NEBqmHT4kRJcfocdahB/McNNsj9RKRJu0sJg0zqx4jk3kUDyYF8zt+85ZMN7sUarFstxfH3kYDsKBGp6pLKpB2x5S4h2rCJkc4f6PkM1iiolw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682990; c=relaxed/simple;
	bh=u4JH8D5dtD3N0oSRuGdOoyH7O73NTCKnKToc+8L1u5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1SaleM/pFM8zRFBIenH5tMHw7hgDpOyqR+nfpTq8AL+t4i8jitPDuhCUrMl+La5NgR0MfcjA0E3osjt1JdcKfas36cMUXg4nrbyZs97pC8Gcuyrfx6HdW0elIbUKExU7te4WlU3M6H8z1rrWOUrJHPczxsyI1M1CtBu/tDhkPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDMkKb5y; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7db90a28cf6so3558301a12.0;
        Mon, 30 Sep 2024 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727682988; x=1728287788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=at1PyvPs3ZXZENn3AS0ld/sSwCc/WMBOfkUpaTVePz8=;
        b=gDMkKb5y255MYPVZ5ExfRGgQWmHMrr7g+TbcaihP4vM1BoCCaBcO8gtyMt+REr5iMr
         IZ7xS5KFDcG2dFqDvVCCyerUsOGtKKvz7gH8Lye6/ixhHsEa31Y3oLkqu7HDiBSAlbSg
         +RW/IxoWkEYwYZNa9UYx2fO84iLk0a9vHtTFqkKgjMEFzWZVKCaKPCbYXWjn/tl7VeP1
         UqDw4hAO0ikvOUHkclnu0AzSXy5VqCnz+gToaV33Bfkbp30dPBV6wke0eZAmvOvKTnd6
         FaOVOo0w8UNMWHCypqsD7wcLGgSALplGIN/lzPXM+HCbH8FdW6qrnuby60phHslEG5Js
         p6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727682988; x=1728287788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=at1PyvPs3ZXZENn3AS0ld/sSwCc/WMBOfkUpaTVePz8=;
        b=u+6qYMzP77FKHsOe3L0Jw0bYorPxvqpy5FFrLBoROIWGfVE8ZZ7SSht3PHyUm1MO0p
         h/8MW39+tElxjjVXMLrplw9ltFj26DFDv+d/bcuPab4krBlLfO2cQZicWCE4KUMVrGwK
         bh3g6SzM4qI9cBzQkPMk4UWWdkmN263/vbSvEu/d3bBmb5vcnxnOFM4k+7aquiQrEYiH
         LVwNHf8wCj4LKQ7geVRu3/1r4Gb4zIj6xI3nkqMtiX08REjjPA5TeejdO0Cu9f8WuS1v
         H3i7lExxXTaLhwMdY8ZanacalY+a0c/TH3A+jj0yorcgc5RrIgK7tGC+rp2qr7Q6dZCg
         fgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa4v869vMCS2uDYjmyAbf2kRJJzFPbhh+dTrIL8Qgo0F4CJmx+3zXQGCyBHemWLgBvwkRPjr3egx0Z@vger.kernel.org, AJvYcCVqCdCUPYZXH906kPIXDMRJHcZge3nizZIBEWV7mDqy1sRfr9d8WnLC5yUJULlzWBBoDFrmJud/eN66bZo=@vger.kernel.org, AJvYcCVzHcxKquCBCzTQcoscuenYxqEyor+LyajBdQ/WlgcNs+Vr8gaCkmslQZWleeKSfnaNtmhwUSle9kSt4KHb@vger.kernel.org
X-Gm-Message-State: AOJu0YxCi41PYNNP6BmNZ141slgbvit1W06PF69oFbmR9oAPdEPR1vgt
	HPfw8IntyaMv4iiYYaLzyHNjRJyr7f1Eb0cDEd1VOjew2YSSvUEv
X-Google-Smtp-Source: AGHT+IEjn94NbyosPPTRT4xOcmIf4mRf6UGR5Vdu96CGbRXIOQgyIu2962SYLutXVJmtvMzakip+Rw==
X-Received: by 2002:a17:90b:300b:b0:2d8:999a:bc37 with SMTP id 98e67ed59e1d1-2e091255254mr21400250a91.19.1727682988272;
        Mon, 30 Sep 2024 00:56:28 -0700 (PDT)
Received: from ux-UP-WHL01 ([2409:895a:2e50:1f2:8cfc:ea00:365f:7b04])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c4fcdbsm7211291a91.5.2024.09.30.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:56:27 -0700 (PDT)
Date: Mon, 30 Sep 2024 15:56:13 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvpZnYvJ-ejxe43Q@ux-UP-WHL01>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
 <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>
 <ZvUwFur1vWYteQMy@ux-UP-WHL01>
 <87d49032-cb94-4cf8-a5e0-44eb2ec37111@kernel.org>
 <ZvoZbWQx5BfMI_Cd@ux-UP-WHL01>
 <8d5ff5c7-1f66-4a1b-a235-868d13afe03e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d5ff5c7-1f66-4a1b-a235-868d13afe03e@kernel.org>

Hi Krzysztof,

On Mon, Sep 30, 2024 at 08:42:22AM +0200, Krzysztof Kozlowski wrote:
> On 30/09/2024 05:22, Charles Wang wrote:
> > Hi Krzysztof,
> > Thank you very much for your advice.
> > 
> > On Thu, Sep 26, 2024 at 02:32:05PM +0200, Krzysztof Kozlowski wrote:
> >> On 26/09/2024 11:57, Charles Wang wrote:
> >>>>>  1 file changed, 71 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000..849117639
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>>> @@ -0,0 +1,71 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: GOODIX GT7986U SPI HID Touchscreen
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Charles Wang <charles.goodix@gmail.com>
> >>>>> +
> >>>>> +description: Supports the Goodix GT7986U touchscreen.
> >>>>> +  This touch controller reports data packaged according to the HID protocol,
> >>>>> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> >>>>> +
> >>>>> +allOf:
> >>>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    enum:
> >>>>> +      - goodix,gt7986u-spi
> >>>>
> >>>> NAK, you duplicate again the binding. You cannot have bus-flavors.
> >>>> Device is the same.
> >>>>
> >>>
> >>> Could you provide some suggestions regarding this issue?
> >>
> >> What is exactly the question or problem? There is a binding for this
> >> device. Extend it with SPI parts, e.g.
> >> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml#L22
> >>
> > 
> > This seems a little different from the adxl313.yaml.
> 
> Hm? I am reading below:
> 
> > 
> > The issue we're encountering involves the chip model gt7986u,
> > which supports both I2C and SPI interfaces. For the I2C interface
> > (using the HID-over-I2C driver), it has already been declared in
> > the goodix,gt7375p.yaml file as follows:
> > 
> > i2c {
> >   #address-cells = <1>;
> >   #size-cells = <0>;
> > 
> >   ap_ts: touchscreen@5d {
> >     compatible = "goodix,gt7986u";
> >   }
> > }
> > 
> > Currently, our design requires utilizing the SPI interface with
> > a custom SPI driver. However, the declarations within the binding
> > file have led to conflicts, as shown here:
> > 
> > spi {
> >   #address-cells = <1>;
> >   #size-cells = <0>;
> > 
> >   touchscreen@0 {
> >     compatible = "goodix,gt7986u";
> >   }
> > }
> > 
> > Should I consider merging both YAML files into a single one to fix this?
> 
> And there is no difference. I don't understand the problem.
> 
I'm sorry for the confusion regarding your comment

"And there is no difference." 

Are you implying that the issue we are encountering is no different from
'adi,adxl313.yaml'? Or are you suggesting that the gt7986u device should
be treated as the same entity for both I2C and SPI interfaces?

Original error messages: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/

+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - goodix,gt7986u

This is already documented in goodix,gt7375p.yaml. Now linux-next has warnings:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
touchscreen@0: compatible: 'oneOf' conditional failed, one must be
fixed:
        ['goodix,gt7986u'] is too short
        'goodix,gt7375p' was expected
        from schema $id:

I understand this error message to mean the same chip model is redundantly declared
in two separate files.

Is my understanding incorrect? Could you provide more explicit guidance?

Note that the 'gt7986u' uses different drivers and has distinct device property
for its I2C and SPI interfaces.

Best regards,
Charles

