Return-Path: <linux-input+bounces-4466-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F363190E194
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 04:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 840E61F23755
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 02:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CEE2E859;
	Wed, 19 Jun 2024 02:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0JNrcEx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A11EA74;
	Wed, 19 Jun 2024 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763420; cv=none; b=kSDv5zNXrHSdoUnAMf7CoWx6L1gtx0JVVe0qApY5Ixg+qgI/nwPlhZ21Yhs77CrcXz0JNWxxFGg53eNYg7rGXw9wLxEGcHr7lUx44/4TDuvjtVMqJ7DAile1KcLONrQG1iappJGPla46fS/EukQBXUk2xmeTJZSPSZs564r+Gw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763420; c=relaxed/simple;
	bh=HASXpDjNd2RHtCSey6cb/9CA17Pw1n51jwiTRiMlFc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzWvepMhApy+P6W8ZI4AXD4F3MjraICZ4yeSFLmE+Wek/VaFGlGJkae06BVayGZI2VF1rDGVTBuLIcV8uSwSVgC889quqOeKnD838yQJltX6zHm6gjWv/mmmUloEfE766MdkTSPZ2f7dK0q1eykluTeIe8fsy2Pnh7xH4Fhvnc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0JNrcEx; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2547e1c7bbeso3207274fac.2;
        Tue, 18 Jun 2024 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718763418; x=1719368218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cRNKRw+EdEWM4sTuEjNXHCmouPWU72BgyGwGHxeoQQ8=;
        b=Y0JNrcEx51F1XiKHh+X5rpBpDzqpk46SrWvJo3VE7KgAqqxvqZiCBcySQegtBPf9ZH
         kEzTjrsEfsuEBvRojd+rKV7oSbnMKTesA9WK//RdxK24/L0yIYurW2MXx3Zz/tBAUsmr
         zHjmD8EHX+4S4b3m9Cj9Xi0VmBkPsxlYaJkDnBOE/j7E14MYKLKX1lP7pJ98FayAaU5P
         0aMRbB37iPcnSVy4s+af5bUTpFESBDl5P0G8mjwoSHQsAlk6zsXIfrL/P87bEVK6MUu4
         i/jLrf5yc+IBHUaSThGq/mgQka17965Q3b8craBkIMFzjQCMv/qybWcrqETLr0Ijog3q
         lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718763418; x=1719368218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRNKRw+EdEWM4sTuEjNXHCmouPWU72BgyGwGHxeoQQ8=;
        b=Flx/EqyiY48l6h8dj93A2XC8siuWepNFdftjIk/29M1Mm4Nf8O57lCHKiHtsPgO6zt
         2yeDhpE130IVjXfg/L/dpdpbEKDEaEwzZWmwcx0ZaFR0JR+40Dc22oqZnm4Lp5chsD8R
         ezBjknfZNb4fl4eQhNvGxlpZfCukoKdxSuMKnzl8hNsmGMwnx/RZufVVRuGLJQH9g+D+
         PhLLXJkVLr9pgebXzm31vJCMvwq/732cx1PbZpWe7InUGOTG1lIJFuYGxrxDbA2kXkWb
         vZTrvv6vrEzBt2R0uwuKkCimtJdrHpnZKUAFWFrqjwFwdKLqBnPS4MNgfYA84IMTXfMS
         qGtg==
X-Forwarded-Encrypted: i=1; AJvYcCUUktYOgdCut2pVy1YSD0ybzurma/Svw2qdth5gF6jFYPcjIdLI6bHTbdrQ4BH31SaezsvzS4xPMsaaJGzKqIW/OsRrhgzWxKe1tm/+UygS248Ko2AhqRxx5cPRIyX7SslnOCfoUYRNt5sD+aV4ShDx9w56NUgEaRi+V9mASOnB57qtM7yB
X-Gm-Message-State: AOJu0Yw2Hzjo0uiu8XP5kkIr0a2HTL7nBl3XxSe2l1XkK2DKMKygdXam
	ubPC9am+KEgm6SJ7PBCjOQIp2U6XSqftkjh/QX9P31KlvTGM45NI
X-Google-Smtp-Source: AGHT+IHpPhJ7zP7UN2BsY3unZsGUx9/U3vd2RdXQWiBk5jUZDOB6vaXOTsyuwUahSne82+LDr1KhGw==
X-Received: by 2002:a05:6870:45a4:b0:23f:eea9:ae74 with SMTP id 586e51a60fabf-25c94d02f34mr1527205fac.46.1718763417948;
        Tue, 18 Jun 2024 19:16:57 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70c5ddb7334sm2816499a12.33.2024.06.18.19.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 19:16:57 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:16:50 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org, robh@kernel.org,
	dianders@chromium.org, krzk+dt@kernel.org, jikos@kernel.org,
	bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZnI_kt3APuF6NWvR@ux-UP-WHL01>
References: <20240618084455.1451461-1-charles.goodix@gmail.com>
 <20240618084455.1451461-3-charles.goodix@gmail.com>
 <20240618-affluent-unroasted-e6d5d34d1ea2@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-affluent-unroasted-e6d5d34d1ea2@spud>

Hi Conor,

On Tue, Jun 18, 2024 at 06:43:18PM +0100, Conor Dooley wrote:
> On Tue, Jun 18, 2024 at 04:44:54PM +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 72 +++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > new file mode 100644
> > index 000000000..25a26b4ce
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > @@ -0,0 +1,72 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GOODIX GT7986U SPI HID Touchscreen
> > +
> > +maintainers:
> > +  - Charles Wang <charles.goodix@gmail.com>
> > +
> > +description: Supports the Goodix GT7986U touchscreen.
> > +  This touch controller reports data packaged according to the HID protocol,
> > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: reset gpio the chip is connected to.
> 
> The description here isn't needed, it's obvious :)
>

Ack.

> > +  goodix,hid-report-addr:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> 
> This | is not needed, there's no formatting to preserve.
> 
> Those are nits:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 

Thank you. If there is a next version, I will fix these.

Charles,

> 
> > +      The register address for retrieving HID report data.
> > +      This address is related to the device firmware and may
> > +      change after a firmware update.
> > +
> > +  spi-max-frequency: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - goodix,hid-report-addr
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
> > +        compatible = "goodix,gt7986u";
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



