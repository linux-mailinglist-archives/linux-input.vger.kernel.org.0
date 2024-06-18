Return-Path: <linux-input+bounces-4401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5948890C458
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 09:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FF2F282622
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 07:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74F535B1E5;
	Tue, 18 Jun 2024 07:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChJqoHjT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026587FF;
	Tue, 18 Jun 2024 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718694951; cv=none; b=rPWwfof0udFg3jfYHes40IyhhMgDbhWpmVBc47kWXWbCThXN4CLV+d2fkxl1fDc7jQmaqsuN3UwsydFyNvstMslUdrY9zxwGsSNDmjTYrB+xfmFSoWH4IVR3BoqmzRW0k+gziZ1saSwfpMk+2fo535Kmn/apRbk8SgjBWHpmsiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718694951; c=relaxed/simple;
	bh=GGBs79W8d8LOTgqVYIqrMjXnXdpOvQUNxud/BqlfZ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx5dK4kDzcNpNbHEa/I2Hs/ifmbyOHIPgKEqy9ldJNUWiysV5OklANvbPC6sZGrxyh1nFkgXZiR00syNN0pvHnRVa0FvXePwOCJE8mrWKauz1gmyNjRAHQ+yI9uHz0O6xVRhiKs7sJ+KZ9KeN1Or4Z1YkyC+oi6q2O1Z0RPuiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChJqoHjT; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7061365d2f3so921172b3a.3;
        Tue, 18 Jun 2024 00:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718694949; x=1719299749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UEUm0geCiGVa1QBcX4hoYb+IbfmLAlTDRkX497hZ/Gs=;
        b=ChJqoHjTGa66El4sbzzPa0w/Kax8NhrWfY60N/WROvxMpK0JsAMXCjU+wzlkWoUsn6
         ZgIHX2yC9HoR/fueqARO0Ky3y3vAh5qZjETzayLXVKIBsmqgixlC1jL3ChllLFI+vxcI
         yagvyvVlSZ3Nc8/77D1nwgywWUP3mHag07Zu/E0XXf3hmRPq6MVXKB//xHCkeDoQykhU
         iPCe3YK50bEG0pLFlVs7joxw93YTtc6w5vfIYIKwkB/WJQEIPwoLA30gA4kVl/jtYepG
         h8p2iy3CW/8BuV6eUBLi0HrDaJqpQETyo8zVRS0vuIm/A3K86iPrh8sf14zVbP0bRlkk
         OU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718694949; x=1719299749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEUm0geCiGVa1QBcX4hoYb+IbfmLAlTDRkX497hZ/Gs=;
        b=KgvUzDZKqujhIlFuzQP1VaHKeEgDaw07DjBA1HiGu+FsBU9iJH5Owpdjz26uRr3cku
         X4DOeRR9WVTcWccUy89UyPyJF1IOYKWS6TC7f0RHevVW44Yt/7dsVduCDyFHXqgALEpC
         fTnLj4Odxigy43kGmnJiemZCfgl/F/rFgIYPmTIrHoLq4wkNBaWfVn3ryWPNEn8JZPM3
         NWRKgHN3XLkHhyGRzgylRBkVdWHCw1RhYupnhzdNRT1lRKEi7NuXvXrPn0RTG1CyCwDI
         EsKHe3VANPPjpbuYE6v34SUGr8DnBijRWbvY3KFenj3v0NxbWOnFnCSge/W9E9RSxv9u
         2FZA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Uf44fEiw02eORCY5ZHT5WpJw5qgvC7nxQ2kUMGcgvKNSARHvypEG4bGcrj3bRkBX+zZfK/3cSK6jd0mCujqYYNApm8xCgNhzJ/iyB195DiItIWO6iVD9b17BpMAjPI1ABa/80jOxex/cvQL+NMmIECJp62+PysS1+yNEl0NfpnJbhuCV
X-Gm-Message-State: AOJu0YwkZvZd4FTFR4B6XUmtDGquPsdxg75NIToeHiQ/i8/e9HWrVeAs
	fwtqBCqpnYYIdZRdr/tD0fIiSdY2i9dQlt5duXS7dcS+XvYcu+ys6OOU+mfJ
X-Google-Smtp-Source: AGHT+IFKpxMJlHG8iCBjwuB/AQuqaga2oxTSYpSh8uNc7ourJabhchXg97VFbfWafHLY4C4t3DDSGQ==
X-Received: by 2002:a05:6a21:4603:b0:1b0:257b:a5da with SMTP id adf61e73a8af0-1bae822114fmr10727619637.45.1718694949158;
        Tue, 18 Jun 2024 00:15:49 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb99f4dsm8361504b3a.216.2024.06.18.00.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 00:15:48 -0700 (PDT)
Date: Tue, 18 Jun 2024 15:15:41 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org,
	dianders@chromium.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZnE0HRGtxMtf6oTj@ux-UP-WHL01>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
 <20240614121538.236727-3-charles.goodix@gmail.com>
 <20240614-renewably-snowless-861ca2ab9c93@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-renewably-snowless-861ca2ab9c93@spud>

On Fri, Jun 14, 2024 at 04:26:22PM +0100, Conor Dooley wrote:
> On Fri, Jun 14, 2024 at 08:15:38PM +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > new file mode 100644
> > index 000000000..1c518d03b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > @@ -0,0 +1,65 @@
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
> > +description:
> > +  Supports the Goodix GT7986U touchscreen.
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
> > +
> > +  goodix,hid-report-addr:
> > +    description: the register address for retrieving HID report data.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +additionalProperties: false
> 
> unevaluatedProperties: false.
> 
> Please test your binding w/ dt_binding_check.
> 

Ack. I have tested it using "make dt_binding_check" and there were no errors
or warnings output. :(

Additionally, I have already run "pip3 install dtschema --upgrade". 

> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - goodix,hid-report-addr
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    spi {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      num-cs = <1>;
> > +      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> 
> cs-gpios shouldn't be needed for a basic example.
> 
> Blank line here before the child node please.
> 
Ack

Charles

Thanks


