Return-Path: <linux-input+bounces-7967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADDF9C1447
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 03:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3A61F23EE7
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 02:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CADF2033A;
	Fri,  8 Nov 2024 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xey+BlMf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560C51BD9F3;
	Fri,  8 Nov 2024 02:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731034270; cv=none; b=HjeRy1gexINZGpfb9oMcvPXT5miFWMC2hx/sB5Exb/fPoIyoE+gtsaXceB1+6QmIlWk3QSQtktl+kif1+RmrIXrCtuP718BiZrEJSHZpxOEUwpbDJEX7mOBiBDi7QUKjklbsqb/AryrwAnaLO1ER7eycMHlEbirt5/OXiDM1o8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731034270; c=relaxed/simple;
	bh=lSQEIgpKDv3f26NYR8QFCbDnNgVJHCatRuxO+lIMyyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB4GDIkvP+rlW15L8aC1IGqi74Tg3ecfTMyZHBXU0lUEvQ2v25ESb885ZFyVPWY7z15xexfGiLzKtb/WaFwWX1TiLJ9mD23f9hIH9/MaOnU0uH0gr0RRdE9NNVxqTNKXCSKQ+nOrK3ZJsCb31GSmu3izMP6VQiLJKBLL3MUiAPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xey+BlMf; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71808b6246bso1016879a34.2;
        Thu, 07 Nov 2024 18:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731034268; x=1731639068; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/EXjIMqHBmMIAGv5jp2hlycZHcXVd0mCL3d1IYu3e5U=;
        b=Xey+BlMfBVZh7gOCXVTIqEBANqz2+fhiGoRTbmrF3a2SUZsHYo4YGHN98z8jNvX2R4
         G2cGFPEMGgprE0rNQV0PbUk3c79R9mVij82OLWT0jSMx/dSbfa+YYjwFLkO4iPwLHBpQ
         zZ+qg7YwJ90Wtfy+uXKhPVvJkGKvgyxL0G7FwO42a78hqWywU6kT8oZlQKM4OLEjG1MU
         35Ztgy97v7EGM4AQBZ3UF/7YQvOjMjRRkqV8c62j4VTn4fNktYNZNjlAcQkEQr1lFBUf
         IQZABEizidyRdw3cbijqe/Xpe2QzSzHhMf3j8ZvMd1weGTsxoiRrWhNLVmL4dOicyD0O
         skvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731034268; x=1731639068;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EXjIMqHBmMIAGv5jp2hlycZHcXVd0mCL3d1IYu3e5U=;
        b=NEOXxBvgPFrQIYmaLwBHwxVbBsIvfFuUEeFXjx9lt/6j+Lixr8pEy8FQIduIKpq67D
         YjeVOp8pYRzwC8/1Wvk+Z5AXiGNZQOqr7DOMIvqzJAqjJsn6mJlnFl3MFLDnJBX6hZN3
         hfiRjgnPLI7RTRk8bfoS0gR9/2tvH4qOxXJohkNPYsdEMBWw075JnNM+IwrPKNN88Nsp
         w6aSWHXZMGa3Y+i8Vqh/OjhRgXs7nHOduDJaeTz6Py5ItjLvFqh8D0bYospwz0JQgbmg
         tNHuCWDsCZRtD5P9nRyA9BhmyBopz3bxFCFzQHSVj0os0kUjIidBW9hSVt+HCJMAV97Q
         VWWg==
X-Forwarded-Encrypted: i=1; AJvYcCXVfNE2a7vrBnZqJogsFCGdbvmJJLgBo7KJJg5XeSMYB3qX8qj7xgX9/cGbd18pMrdtae8JT6eo61A0YVg=@vger.kernel.org, AJvYcCXbeWyoL74OcNmnEA9Di393XetL24p9rzhJpLAf5HE1c7NXPHtX9M4BH5EKi4YBDhgEkkLTjnUMoGn070c9@vger.kernel.org, AJvYcCXfeWQDWRZxmRgyPiDaWK9CV/m1GmpAassSLmvwgLUOHBYs9xzkO5omVGBWQb1aFrnJ4IB3mqCVFYZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yywhas2+/Jx8iCpEiBtB2xMy/qo+BLYU5mRja+JVPr3b/vx+XA5
	TzchLX8oqBU2kpopDvumkHVlRs2ENclZOgGPoLwg9bgCClLc52Dn
X-Google-Smtp-Source: AGHT+IEElLZEABRWyjEIWGCuNoaAThPE7ptq0c3Gr/sJWPeAj85WKpXmwxpGDHpsPfsBPn6ESYu5rg==
X-Received: by 2002:a05:6870:7d07:b0:291:467:ee42 with SMTP id 586e51a60fabf-2955ffecf54mr1450360fac.8.1731034268248;
        Thu, 07 Nov 2024 18:51:08 -0800 (PST)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f423414bcesm2047171a12.4.2024.11.07.18.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 18:51:07 -0800 (PST)
Date: Fri, 8 Nov 2024 10:51:02 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: krzk@kernel.org, hbarnor@chromium.org, conor.dooley@microchip.com,
	dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <Zy18ljw66z53C2Yv@ux-UP-WHL01>
References: <20241107032313.64390-1-charles.goodix@gmail.com>
 <CAD=FV=UQr_6L_UhdCSr3cbxfGO2aEEYgTEpBh+gseYeapr-5iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UQr_6L_UhdCSr3cbxfGO2aEEYgTEpBh+gseYeapr-5iA@mail.gmail.com>

On Thu, Nov 07, 2024 at 01:54:33PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 6, 2024 at 7:23 PM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> 
> I think it was requested that both the yaml file and the commit
> message mention why there are two different yaml file that both talk
> about "gt7986u". In the commit message I think it would be valuable to
> point to the previous discussion. AKA, maybe say:
> 
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. For some background,
> see discussion on the mailing lists in the thread:
> 
> https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> 

Ack,

> 
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> > Changes in v2:
> > - Change compatible to 'goodix,gt7986u-spifw'.
> > - Remove 'goodix,hid-report-addr' property.
> 
> Probably this should be a two-patch series now. The first is this
> bindings file and the second changes the firmware (which never got
> reverted) to default to a hid-report-addr of 1.
> 

Ack,

> 
> > - Change additionalProperties to unevaluatedProperties.
> > - v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@gmail.com/
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> 
> The name of the file needs to match the primary compatible, so it
> should include the "-spifw" part.
> 

Ack,

> 
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > new file mode 100644
> > index 000000000..b7afa21fb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Goodix GT7986U SPI HID Touchscreen
> > +
> > +maintainers:
> > +  - Charles Wang <charles.goodix@gmail.com>
> > +
> > +description: Supports the Goodix GT7986U touchscreen.
> > +  This touch controller reports data packaged according to the HID protocol
> > +  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI protocol.
> 
> I probably would have put the note about the compatible here instead
> of below. Something like:
> 
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. This is because there's
> not a single device that talks over both I2C and SPI but rather
> distinct touchscreens that happen to be built with the same ASIC but
> that are distinct products running distinct firmware.
>

Ack,

> 
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    description:
> > +      Add the 'spifw' suffix to distinguish it from the general GT7986U I2C-HID
> > +      touchscreen, as it runs a substantially different firmware than GT7986U
> > +      I2C-HID touchscreens.
> 
> As per above, I'd remove the "description" here. It's not common for a
> compatible to have a "description".
>

Ack,

> 
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
> > +  spi-max-frequency: true
> > +
> > +unevaluatedProperties: false
> 
> I believe "unevaluatedProperties" is supposed to be moved down below
> "required" according to previous comments on your patches.

Ack,

Thank you very much,
Charles


