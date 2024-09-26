Return-Path: <linux-input+bounces-6748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 756FB9870F0
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3527A2881F1
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2988218786D;
	Thu, 26 Sep 2024 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbVidDkJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55B1AC437;
	Thu, 26 Sep 2024 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344687; cv=none; b=W/TQczQFNfhIuG9gPai+ExNK5A2VlQO87Bg1/PuWMfH4/zt+0JNVzFztmCKmLPMyOqxY2kwZci47ZiFB2ptFYhVIcrbPwJOLBg7YA4fmM9IU+LmtER6Texrou/l8CsSqPWKQ+8RkzJbo7DisEsaoSdHrheJup1XsCf0P0fj5dGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344687; c=relaxed/simple;
	bh=2YTHF9vNURjthDWW+Z/u1oOBPkbwVQ9J/6WxdPcs1yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdiKq0yaYz2Imv3uqn3fF+WiU/wkAp+n8yudHeiVQJGpycePTbXt30HR3/GwVVy3jR3ybUic9a60kxhoiHPO1wBur/BrpKT03vqiIYARpUJOrdbJTjpSRsJpPYYvkGfVqylpS4w/RysnYODszn+o4McTPhdq2YVZsKAY+hJFPOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbVidDkJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2053616fa36so8851965ad.0;
        Thu, 26 Sep 2024 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727344685; x=1727949485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=73qu23XDMr/mkaN2wuC3OmyQ0upEf8+e7Xao1+qiQBs=;
        b=cbVidDkJ9p+hc2Z78BcLgjqjZjMlNH1DBa5Av4MSGYC7tLxDRF2Ggk336SHy9IMVhV
         qekG4FG5o8FkIf0XnIjO0gbrAHqjyqPCzp2fiFL8nfnu1ambf4fvz+4CqRXHu8JzCANB
         OGYKfP93I5scK1VhqBQmv3S/sUdnraedJy6q7e6pLkYVL9igHCbCjzh8ZcL8sP0QQqBI
         dH3G1yQnn8Nl93qVjngP7oE+PIB+NR2k0aS7jJYFUlu2W8f0tHhuWANKUtIiqjepG7DV
         FzNh1/e4vf+n9Dk0dhxxLVGOYYyFVmwvVaivy8+c21xb83IV2pGDkOstrpdPFkvb6lAs
         i38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344685; x=1727949485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73qu23XDMr/mkaN2wuC3OmyQ0upEf8+e7Xao1+qiQBs=;
        b=niUD2jnqRTzS3wJrUF3sdY85xiN2HCA51LgPozH9W17wk+B4QbYSPCF6wDSDhKU0ty
         b8XqzDajwXXgZjOfx6lyC+Tisq5gNMwbt30wC2nV3Y+gPUoFcETxU1JLvwVRSPamHM3E
         tyn8Iabpv0i3LX3akbPepEKy0mTovkYmo7Lh27P6vBssrYVZ6wd6ZdpeAfwj0eDvWDFq
         s3hRh5jqXy2ONZCQYAyaVXy5I8GbGSba/T2mhGOl3vL7K4ooofn1hw+SBgTxd/SdO2gE
         +hxPnJ59PGb/LZuJ9vL8Einxkc5gcPtDYjMt4qPl2RUTeTYsPWwhZC4Lj0tqKO02e0AA
         X6vA==
X-Forwarded-Encrypted: i=1; AJvYcCVQlbYHF2B9iUXrT/Hvn/56qD85lApJ97A73P9nNg11y7j6O0Br0vGhXVACGG7q0j1MmfiffvmNLxOS@vger.kernel.org, AJvYcCWUwZIzzBfjvTP/DSERV2fhGDRlGvYDprsETfv0jLjNv6O/U7Mc59p/Wuo8GBZ6SXe0dbI8fvgmLtDhh8Hq@vger.kernel.org, AJvYcCXk8tzV/uEkc9PsLTQRAngIn843Ac5UjPKMUM/yzCitSaXcPsyAVN8mgQ96yKbY7F10At4qzJoiL1BRU9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqVhAdLMqyPj6LBGR3y4i2K52XdmYGgIu5wlQjxb/zIqvNv2L
	WmRr3KgZUFA5LHNvO4yMSTDP5deIa8MgMb3q0piKghAuGPbk4jjx
X-Google-Smtp-Source: AGHT+IFNEGsBuTXULiMbuZ6J6HIlEN/tPWntgBUhJJ8YuU19srH46mmHqqDj/Dr37HfhV5dQ4mIwxA==
X-Received: by 2002:a17:902:ce06:b0:20b:3195:4922 with SMTP id d9443c01a7336-20b31954ba5mr354325ad.14.1727344684627;
        Thu, 26 Sep 2024 02:58:04 -0700 (PDT)
Received: from ux-UP-WHL01 ([240e:47e:2ee8:6648:b014:25e5:1824:b002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b0b245652sm18484225ad.187.2024.09.26.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 02:58:03 -0700 (PDT)
Date: Thu, 26 Sep 2024 17:57:42 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvUwFur1vWYteQMy@ux-UP-WHL01>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
 <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>

Hi Krzysztof,

On Thu, Sep 26, 2024 at 08:29:38AM +0200, Krzysztof Kozlowski wrote:
> On 26/09/2024 06:42, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> 
> Why do you send the same? The patches were applied three weeks ago! You
> were supposed to respond that time by fixing the issue with incremental
> patch.
> 
> Now, work on top of next branch, bring back removed OF support and add
> missing properties to existing binding.

Sorry again for this.

> 
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > new file mode 100644
> > index 000000000..849117639
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > @@ -0,0 +1,71 @@
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
> > +      - goodix,gt7986u-spi
> 
> NAK, you duplicate again the binding. You cannot have bus-flavors.
> Device is the same.
>

Could you provide some suggestions regarding this issue?

Regards!
Charles

