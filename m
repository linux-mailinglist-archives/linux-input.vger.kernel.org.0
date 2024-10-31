Return-Path: <linux-input+bounces-7787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15D9B728D
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 03:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAD51C23E66
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 02:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC2384A39;
	Thu, 31 Oct 2024 02:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZcn/0iH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC841C77;
	Thu, 31 Oct 2024 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730342255; cv=none; b=e4JPcjDQK3SgaM1Wua1E5qXsDw66kFwWHqacNTyYryNIsNTpuNFD4vMbx+ekOLQIXD1pcmDtKu1e/QmjktH++2Q7n926o3cAPtTeHre9H1p+k+bmgWFYTNHxfg8kkkhHLZr4pFiUdLs7oGR3rYpY1O6VZYn9Lyi6ccoU9NifFwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730342255; c=relaxed/simple;
	bh=6WoJs0UJsAhBNoAYHLkYca5haLTZkyySSvILawnyHxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvJY8OHTLyKy7ZMJgDd3gjsHpXiozvpmr0GhhfEqM2a8xcezgzLo5t0lKkSaOj74NSCkWz2UQu9rmI4y0nXr/G+X4hiCoAh6CjXeeWUeM21tzpcRgbpVqgJ+FMzEmuwAb3CkmZqA8wn3X9YCisP9z2UUTmejowzKYneYCw5JjKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZcn/0iH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cb6ca2a776so683570a12.0;
        Wed, 30 Oct 2024 19:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730342252; x=1730947052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=92sQTYv5i4LQSTbJovOBmWHa2LRRHPkJ1qfPMaZu1Ow=;
        b=EZcn/0iHtOOWeoFJGCt/aRFI/hu7LuIt4XQpgcj2nb2oWuepJ3dACd359puLrFTUlj
         hKXJ4DFtiVdY0ZF4yw0vlyjY7VzJaJJE+GDpA/GL5Hg3s42+KuQ5w0NMrfLzgneQdjmH
         027gnK1E/nIfNaoZaXZ7eJXy564oqqYeHklD9YmRpYQ5n53vMbgIdYEBTcsH2kzJhCqg
         8y1LhhTdjWA4NXLSEd54EnIle//SqY31qTbwf0SgBZVX3yDITgRqwuj7T+BQ/9yHn7rP
         rJNclRJJnxDkRSHdKLt66BuKkgEEy/2CHynGdFnlzE3l1ABPP6dUsT+P0eBz5ZIBbC9c
         zuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730342252; x=1730947052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92sQTYv5i4LQSTbJovOBmWHa2LRRHPkJ1qfPMaZu1Ow=;
        b=FaiTD11zLBLmTcwXUFPtbfpSL4oflv1hOV/1cwIPuPhIukBKHdEC/S0VJizSQNoRd9
         VIYzC2ZuHq9Z76dDrir7AiVjOy34VReYIbiGe3HtlS1hW1soxfHkX8KPH6fJ83Mv0AqF
         yief0NLx2gni9YSDRLD9PJzr8gP9DQontfdsjyDeJO1wKyMLvEPofZcnpMcFj2itDxRo
         /ThwHSmwHaV3n/GOyA/nOxOsfDmF9FWEOCnnTkNg2262zKv731bPLc75aU0BmF6+Re51
         /ZmCGhK+Gy5XIcH8PnEieqSm5X6msL8AUD2RgPFQTAOzpCveBoBA4QkkDL19aH4D8MXT
         zyvg==
X-Forwarded-Encrypted: i=1; AJvYcCU6cCFyRJRNFuvzuC2vcaNxc8tvP5maWVi92wJNjad+XIc65BJK7htgYacJhlQqcA+XX6soWOEyanjSEXg=@vger.kernel.org, AJvYcCXpJ8muGsmoP21Xa93TJLcV7zRNlyuzGdCHfq8Fu5YRmjzj2KOi65wHpONjB6cPTwfSMszZhESlaAnx@vger.kernel.org, AJvYcCXpfuZBKzKSwbAQQGfydAUVd7/5/4cBse0/OhHpv0vuWt/HllAHZtLPMJ1YvqgE8iHklGm8kEJpCOvlPNbW@vger.kernel.org
X-Gm-Message-State: AOJu0YyvbAzpFkocnZHLMEbvq1dBqcjpOMGDpUdZJhu0sueC3cSdWQ/O
	gtcaQULCxkwwYFxkg8Xzr3JslUetuc7Jp09IFpaO1oKqGqY8dwTV
X-Google-Smtp-Source: AGHT+IHpSBI+NErsfC6ze29bV+jJZIGs+3sTVrOv5Ytw26r+XzrCrrLEVjJ7y/jVNesWIRPZr3reKg==
X-Received: by 2002:a05:6402:350e:b0:5c9:55a8:7e86 with SMTP id 4fb4d7f45d1cf-5cd54a83551mr4217216a12.8.1730342251341;
        Wed, 30 Oct 2024 19:37:31 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac74cba4sm138799a12.6.2024.10.30.19.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 19:37:30 -0700 (PDT)
Date: Thu, 31 Oct 2024 10:37:21 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dianders@chromium.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org,
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <ZyLtYdwoJWx9FsdS@ux-UP-WHL01>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>

Hi,

On Fri, Oct 25, 2024 at 02:03:11PM +0200, Krzysztof Kozlowski wrote:
> On Fri, Oct 25, 2024 at 07:46:43PM +0800, Charles Wang wrote:
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> > 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
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
> 
> GOODIX or Goodix?

Thank you for catching this, the name should be Goodix.

>
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
> Compatible is already documented and nothing here explains why we should
> spi variant.
> 

Ack. I will modify the compatible name based on our discussion and include an
appropriate description.

>
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
> 
> I do not see this patch addressing previous review. Sending something
> like this as v1 after long discussions also does not help.
> 
> No, you keep sending the same and the same, without improvements.
>

I apologize for overlooking the discussions regarding this issue.

I would like to clarify that while the current boards use the same address,
but newly designed boards in the future may require different addresses.

Retaining this property would likely offer more flexibility.

>
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The register address for retrieving HID report data.
> > +      This address is related to the device firmware and may
> > +      change after a firmware update.
> > +
> > +  spi-max-frequency: true
> > +
> > +additionalProperties: false
> 
> Wasn't there a comment about this as well? This goes after required:
> block.
>

Ack, will change to unevaluatedProperties in the next version.

Best regards,
Charles

