Return-Path: <linux-input+bounces-6732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A5986BDF
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 06:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070241F2378F
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 04:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5792BD19;
	Thu, 26 Sep 2024 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb2lKybh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C3217C69;
	Thu, 26 Sep 2024 04:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727326538; cv=none; b=sXPBuwhaSG1l7sRQG5gnXjs/96FFm/r8QxYUZbd2xuS0wrA8BxWbbuwNmCem8eJMdy5H30CPDSOD3zld7kRMTd+PGek2MLiJEaWsmnCYJ/XOj48OIi524WhlBdMTigfezvm3SvIl3oEFYjT+L2WX1OIuWfpho9VCZ92lTEYA5vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727326538; c=relaxed/simple;
	bh=wrv2hTrsuihMpZyuSLMeW8l+X+1o+M/C/FITAIPx6og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+8P36QbAxd4Yb0E/voL+mjM1R8Lmp/lju8FjQvBwp43f8DZyZo9M69aUEZv/EVrO5PLkDkTW24MbQMbMK8oCfyTwrjWQTLkqDPFmrKCz9FJF2djHT/U4i4Z7/zMWBLq4ybH2VcyQ+Tm83/Cuyr5Gq3V1wZsDGucRcIr7sqn9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb2lKybh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20792913262so5218835ad.3;
        Wed, 25 Sep 2024 21:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727326536; x=1727931336; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y4hCTyd7fHdhQhZ39WO73/B3b20ahvldM1PgZuhq9tI=;
        b=Nb2lKybh61M2LsDfIduBdnwUS3JPvqErp6KIo3mkyzfh36IWXvgoUOfPKqNEUBd3Wk
         8t3QbsBSmjbRJa45VltGd9wqmblyeRpzCHc5dSJUPOoNskLUukyUqV2+cs5Flb7R9oJM
         qmxyg6BHp3ORxWexJKmj/TUQFSl7NVAo4lgAuz6hWx9rjjMR//E+o+LsUWvwJ0Cs3k1O
         37pa1wXsKaEJYv0vTwQRozlCzaXpwIB1L8esexIAu5v6uxS+0fz4YfWgMR/pGE69b1Lo
         iZR2yCdh755U1WDBgHWx9ABnzsHxonkD3F617kofgPOBp+ZpWGf51kCCNrdNxc7U1q6B
         UZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727326536; x=1727931336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y4hCTyd7fHdhQhZ39WO73/B3b20ahvldM1PgZuhq9tI=;
        b=EkuClIS+daXsZjj3igSSm38aglV85NY/miDHxuMNt2N/tV21wpFRyZEEzOFAbSnLSj
         YVtIR1h9ETCFA/0lFu9MptEHyGe11WA/I1Zmz1/ua/MGy+KKRoSDklq5Yv9s0Y4Bnfky
         H1j+zq+8uy7T0GuCUkk8fL26ImXLKMinskK/5xvEDSPFEFHRTPwog3JHBq2Cp9GzOMlr
         TyXkLBIkfYRQYh/69QNSfmUuUeieYbUh81V4t85Acswog8MbQ2T0evYKOvKdmJJQLnP9
         nP7ZSctjv+csujT2zrGcieOAikIiqqY0zT38pUOY8AIPpzdKJp7DDgTBA0c9M5nhs1vm
         VTyg==
X-Forwarded-Encrypted: i=1; AJvYcCV2RfJZtmhzMq0hWPrsBLbUd9TgsmqWBSSEIdPh5LACALxI/Ds0c5lYRBLrsoFs5lPzPMS51G3f8xIcKZhJ@vger.kernel.org, AJvYcCW9W5IpKh3HJ5v20s1r+eqaAGVZYrcGygoVzDa2dZ+YRaIjCKejGLOjmy7I7OQ1WvtNP7qvqpkcZuUaoXE=@vger.kernel.org, AJvYcCXY7zvElEhSoFKtp6Hl7LDQyhgYf7HoLBaTQtyDnnuA9lRtcp5LsLQhOg0eX8pA0TVcj06JMUCb+N/7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9BIvWnOh0UpCRxttic/WYUPWezCnNeZ4CqYa+80H70XlKW7V6
	xcgVpLJmLDqCu3Wi1i/Q8fSAP9+lXWy88nIq1RIkNv2XLShn7Uih/eiRJTLb
X-Google-Smtp-Source: AGHT+IHGSKkd2bXfKl1DXRx+DljOaFnwuucFANq9nw+cKvUGbpTJ7iv/93P8t1Nh8ya7Tw0LiCUO3w==
X-Received: by 2002:a17:903:2441:b0:207:20c5:42c with SMTP id d9443c01a7336-20afc4c79ecmr75597375ad.45.1727326535706;
        Wed, 25 Sep 2024 21:55:35 -0700 (PDT)
Received: from ux-UP-WHL01 ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af1723f23sm30995005ad.95.2024.09.25.21.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 21:55:35 -0700 (PDT)
Date: Thu, 26 Sep 2024 12:54:51 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: dmitry.torokhov@gmail.com, dianders@chromium.org,
	dan.carpenter@linaro.org, conor@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvTpG1cTWM3gY_vk@ux-UP-WHL01>
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com>
 <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
 <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
 <ZvSEkn66qNziJV0M@google.com>
 <CAL_JsqJhchCn8QbT2kV7hPfgtYP=-32YE4WT51fy_5iSOLMZ=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqJhchCn8QbT2kV7hPfgtYP=-32YE4WT51fy_5iSOLMZ=g@mail.gmail.com>

Hi Rob,

Very sorry for the late response. A fiexd version with compatible
"goodix,gt7986u-spi" has been submitted.

On Wed, Sep 25, 2024 at 08:51:14PM -0500, Rob Herring wrote:
> On Wed, Sep 25, 2024 at 4:46 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 12:40:56PM -0500, Rob Herring wrote:
> > > On Tue, Sep 10, 2024 at 5:41 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Fri, Sep 6, 2024 at 3:28 PM Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Aug 13, 2024 at 9:45 PM Charles Wang <charles.goodix@gmail.com> wrote:
> > > > > >
> > > > > > The Goodix GT7986U touch controller report touch data according to the
> > > > > > HID protocol through the SPI bus. However, it is incompatible with
> > > > > > Microsoft's HID-over-SPI protocol.
> > > > > >
> > > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > > > ---
> > > > > >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
> > > > > >  1 file changed, 71 insertions(+)
> > > > > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > > > new file mode 100644
> > > > > > index 000000000..a7d42a5d6
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > > > @@ -0,0 +1,71 @@
> > > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > > +%YAML 1.2
> > > > > > +---
> > > > > > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > > +
> > > > > > +title: GOODIX GT7986U SPI HID Touchscreen
> > > > > > +
> > > > > > +maintainers:
> > > > > > +  - Charles Wang <charles.goodix@gmail.com>
> > > > > > +
> > > > > > +description: Supports the Goodix GT7986U touchscreen.
> > > > > > +  This touch controller reports data packaged according to the HID protocol,
> > > > > > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > > > > > +
> > > > > > +allOf:
> > > > > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    enum:
> > > > > > +      - goodix,gt7986u
> > > > >
> > > > > This is already documented in goodix,gt7375p.yaml. Now linux-next has warnings:
> > > > >
> > > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > > > touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> > > > > fixed:
> > > > >         ['goodix,gt7986u'] is too short
> > > > >         'goodix,gt7375p' was expected
> > > > >         from schema $id:
> > > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > > > touchscreen@0: reg:0:0: 0 is not one of [93, 20]
> > > > >         from schema $id:
> > > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > > > touchscreen@0: 'vdd-supply' is a required property
> > > > >         from schema $id:
> > > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb:
> > > > > touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
> > > > > match any of the regexes: 'pinctrl-[0-9]+'
> > > > >         from schema $id:
> > > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > >
> > > > > Please sort this out and send a fix.
> > > >
> > > > I should add that it is intermittent whether you see this error or
> > > > not. The tools select a single schema based on the compatible string
> > > > and it is undefined which of the 2 schemas you will get.
> > >
> > > Still an issue and no response. Please fix or revert the series.
> >
> > I see that Krzysztof sent a revert, but what a proper fix would be?
> > Apparently Goodix is using the same product ID gt7986u for both I2C and
> > SPI parts, and covering them in one binding is not really easy (well, I
> > guess it is possible with a big ugly "if"). Do we just slap "-spi"
> > suffix on the compatible, so it becomes "goodix,gt7986u-spi" and go on
> > on our merry way? Is there a better option for such products that
> > support multiple interfaces/transports?
> 
> Generally we just have 1 compatible and 1 schema for both. The schema
> can reference spi-peripheral-props.yaml unconditionally. If someone
> wants to put SPI properties in a node for I2C connected device, then
> that would be allowed, but who cares.
> 
> There's been some discussion about having some sort of pseudo property
> similar to $nodename to define the bus for a node and then we could
> use that.
> 

Charles

