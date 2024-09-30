Return-Path: <linux-input+bounces-6886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178098996C
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 05:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FB98B221D9
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 03:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD23C2BD1D;
	Mon, 30 Sep 2024 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzCvvnmX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1901C68F;
	Mon, 30 Sep 2024 03:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727666550; cv=none; b=DRgB+17FlVH9wPpU3V+VxAkCK53v8u8eLFsImUiCLCdrJEbMuBb2zVSS5eOfAKpuMBkFr0sQv0x0opHemx1uE6lQzTsKfw+kWr+0XP9RDqi5LqFbXYp4iGsNS83yd0r91Gm8LWZCO3pcncKj5kWiXX4lQ36kDiTB4hSGQlLql28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727666550; c=relaxed/simple;
	bh=wunCW7tdfLxAt+SoXrm9RnR0DgEHQWzvPFkXOxH2iKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJN+lNj9zwf/5ZvpKGBeSYxamAihVZDEonV4TxcrieAIelFF7PxQLluUj2FuCF27JrW1pBj3CMn3BZnQvKAppGArjTtJ1zPRkkI9reC2BJJFJ8mVNFo5agYzXIvmu1AW9vf2R5uPaKfl5eY6nGZg5/+OK8xNqsOM4nw4aAuVCac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzCvvnmX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e0c7eaf159so2195835a91.1;
        Sun, 29 Sep 2024 20:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727666548; x=1728271348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SL2ek4w7Bp7qyS2P5V/apIeObx+V25aFPVgE37oM0Ao=;
        b=VzCvvnmXjq2W5mi8sz8vvojaAU0Ps4hGQPiXwnUm3zOokvqVlDG2IABrfMgwik/KQ2
         iBln93LeYLghMhg76Lt2y8D0AprixXjG3RmVrPqqEAeU8HyZMFiwxju8EW3objdLMZDf
         QwVrW/A9r3JqYXog60r0vMV04DSf2FeZxQ0kPs9yLxJtyERibTtuc5VEgftT+gS5FS8d
         F4VLsy5vZl169KiNjDgNlojde4zx7nesut9VDP27LpmreiLHp1jqEIiCzCKTwl/+etCq
         8iOdh2rG2rjUqmRUVPDWPODM7cQOpR2LQ//UWp8cV4TIoGRqRHVhNDsz6lM5nioRRM0M
         MBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727666548; x=1728271348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL2ek4w7Bp7qyS2P5V/apIeObx+V25aFPVgE37oM0Ao=;
        b=iqSlfbPsemdlwwBWK6NccOp9caSNNhf5Pc7ppPqQo4hDz1bJ7HMU4SoLYd1Spfi7Mn
         PVYrWl5w3VdNZU9NC7RwNPPCGlUq8piM1rCTmPZYr8pVcyyPj/qptjtJLOiS/srBh6zl
         F2c0sPSjBNcTWgcSASgrJAVSivrgefo0j3Sn0L0V6tdG4mcP8IwytFdigJYe0VKanH4O
         i3iFGKVwuAvPkJdsQTb1WtdeS0lJuLgPLI2XowfXWeRkL6krwwJGa/3yQohMEaHfvx6Z
         KiMoUXk+F0868Pcohty7uArazo3kXIoaZnwDgQIvT/AbTpP00cebcZwImLW2TybZegJN
         Gibw==
X-Forwarded-Encrypted: i=1; AJvYcCUGHLH4BU45NFpEbw7bUVdOqH9o/qWOQCuJSQ3XMT0wBUCm/jUqX7pdnEowCbmowK2SWBf11tmgEP/1YJu8@vger.kernel.org, AJvYcCVpYzsEUxGqj9kvwuuIla7p+Ttdt1oSyv6NlKXkMpJE5WYg0k/sDV7NnK0dtd1O1HwnvmputKcgLp53@vger.kernel.org, AJvYcCWkpkiIh6pqbm6i32gvJUVHhV7bCbAC8TPMjtDxpeXWLOitJGyAjG53E7aw59Hk04jz4PeNVBI4SEopWh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRW5kyf92nqQIX2k22UaU3+wFgvtw7jOFUTw2x4j3W5+Y9bUwa
	Yq0rUTeSmnQEAvyttZloH0EgyiDb9Bv3s9YY8DEnU1MYZEj3aP6Y
X-Google-Smtp-Source: AGHT+IHIhb8WKTkCfhUYqURi6R0pYFzz6/ieJCbTpavZPrmuRoK89z3Hczeg9dX67fCenpTDGIKM/Q==
X-Received: by 2002:a17:90a:f2d2:b0:2dd:6969:2096 with SMTP id 98e67ed59e1d1-2e0b8ee06d0mr12376488a91.38.1727666548243;
        Sun, 29 Sep 2024 20:22:28 -0700 (PDT)
Received: from ux-UP-WHL01 ([240a:42c6:7000:63ad:1245:aaa9:5661:7dd8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6c50e09sm6608219a91.9.2024.09.29.20.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:22:27 -0700 (PDT)
Date: Mon, 30 Sep 2024 11:22:21 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZvoZbWQx5BfMI_Cd@ux-UP-WHL01>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
 <998ccefa-8d4a-40c1-aacd-0897070190ce@kernel.org>
 <ZvUwFur1vWYteQMy@ux-UP-WHL01>
 <87d49032-cb94-4cf8-a5e0-44eb2ec37111@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d49032-cb94-4cf8-a5e0-44eb2ec37111@kernel.org>

Hi Krzysztof,
Thank you very much for your advice.

On Thu, Sep 26, 2024 at 02:32:05PM +0200, Krzysztof Kozlowski wrote:
> On 26/09/2024 11:57, Charles Wang wrote:
> >>>  1 file changed, 71 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>> new file mode 100644
> >>> index 000000000..849117639
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> >>> @@ -0,0 +1,71 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: GOODIX GT7986U SPI HID Touchscreen
> >>> +
> >>> +maintainers:
> >>> +  - Charles Wang <charles.goodix@gmail.com>
> >>> +
> >>> +description: Supports the Goodix GT7986U touchscreen.
> >>> +  This touch controller reports data packaged according to the HID protocol,
> >>> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> >>> +
> >>> +allOf:
> >>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - goodix,gt7986u-spi
> >>
> >> NAK, you duplicate again the binding. You cannot have bus-flavors.
> >> Device is the same.
> >>
> > 
> > Could you provide some suggestions regarding this issue?
> 
> What is exactly the question or problem? There is a binding for this
> device. Extend it with SPI parts, e.g.
> https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/iio/accel/adi,adxl313.yaml#L22
> 

This seems a little different from the adxl313.yaml.

The issue we're encountering involves the chip model gt7986u,
which supports both I2C and SPI interfaces. For the I2C interface
(using the HID-over-I2C driver), it has already been declared in
the goodix,gt7375p.yaml file as follows:

i2c {
  #address-cells = <1>;
  #size-cells = <0>;

  ap_ts: touchscreen@5d {
    compatible = "goodix,gt7986u";
  }
}

Currently, our design requires utilizing the SPI interface with
a custom SPI driver. However, the declarations within the binding
file have led to conflicts, as shown here:

spi {
  #address-cells = <1>;
  #size-cells = <0>;

  touchscreen@0 {
    compatible = "goodix,gt7986u";
  }
}

Should I consider merging both YAML files into a single one to fix this?

Best regards!
Charles

