Return-Path: <linux-input+bounces-7964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 910D99C1161
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 22:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FADD1F20FD0
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 21:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8377218940;
	Thu,  7 Nov 2024 21:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dcMqVnjh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57B4218957
	for <linux-input@vger.kernel.org>; Thu,  7 Nov 2024 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016495; cv=none; b=VrfJHnUy5nBUDO2f37IjLyzKsnRehTGRa4rRgjulOOdOZRH76onv0VPXeO9lTPvQvFLdw897pGGHLX5HUMBq1LcX4d0Rk8W+Pg0vwjpm9kOox5sXQjiehWxxiKbNwVPN2vEKWC1SCq6KnA/KbCuHww02HD/gEqY/iuvaVdsrt9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016495; c=relaxed/simple;
	bh=jZ2w6qtCWGTKq+KsmMFcXlp9RX+AIWYwztbPZfJLwwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5lULfCNHn3RGTf5sn4MI/j/zu8u220JlsTFk7u4UGO7pxLgQBe8MT82xJkphBo1vdnIZLKMPncYjBOR4Z5pkMO3VmP3dHeXgZs2MuDj0vVsMBH1Qa0W7MPy/1RDkjP02Jw005RYXizROuZel97028pEbcBKF3aj1aNHmR+RkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dcMqVnjh; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb518014b9so13620601fa.3
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 13:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731016491; x=1731621291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaiaDeIPx1kjruXBuj52b+ZclV2Vhqc5U8qWhq/Gx0o=;
        b=dcMqVnjhNPHK0c+SLazIMwGTGKCDN/Zbr4u6tillybH6tDDfioH0QdAc3E8Pn+zZO5
         zgiqdpjOXfbf61/eAUOQS1b2QfjWCQ1Oy23p1ntaJoAG/K/HFcXDoCv65vSVNbodg8WD
         YhMINz+DpzB9QMo444ogou33k0m3xu0+m6nqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016491; x=1731621291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaiaDeIPx1kjruXBuj52b+ZclV2Vhqc5U8qWhq/Gx0o=;
        b=q3KhqK33KRBxMUmEgbMkf5Q/pAxFRt12GGXunzxLFjmNbJo+KJl+9ntGlIYiryX9/e
         u/XTj2mQrb7xtaKBrL/71SK4W4X10lQtbYkGXfd92unL6dJAvYLL3w5Tv5q8yG7zYzsk
         2E8EjLVuj80fkkRCsn7VIhWfyO5X4qJYVJimA94bJg4YW8lWVFCTX1GFRF6pDB8r1K3R
         sUJTZ6BRbZfj8V8iju7k8sK0CEBAdWSUjvpWri0TU1tod2jSrG3zVLd9Z3Sp0V5Dwv2c
         HA/73lg37kA16j0061zSsBlbEbq/r0T/zUDgYXWxK/WSKR/n/eMef2xEwOea/cFSrKOm
         sqKg==
X-Forwarded-Encrypted: i=1; AJvYcCUutGee1LZ74nU6cr2OdbQbEmWFrx29egE6jGwXnvCgDDJEyknmao9bP+E97ZvGWNGvvh0MIF65Gq5FJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzezmdHUs8ITHcl+Kc7S/LBaeqgT21O83O8chuAxXvNeLonp56o
	zlORafN2z4jsgwWR7Ly4nma2FxtZSjW6e8la3g7YJKR/TPu8up5AINIM1DOraRCTLqZuQuUZhE8
	MFg==
X-Google-Smtp-Source: AGHT+IFpmYsewglRtPLJAI3ngFNYpo6j709FGw7vp2tkIHPvAI8l9jEc1fNAiqw+5QejwAztlPdSCA==
X-Received: by 2002:a2e:b88e:0:b0:2fb:8774:4412 with SMTP id 38308e7fff4ca-2ff201b7ec1mr2261521fa.24.1731016490995;
        Thu, 07 Nov 2024 13:54:50 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178f2be6sm3776171fa.34.2024.11.07.13.54.49
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 13:54:49 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so1584013e87.1
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 13:54:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUd+g9Nb0vyrRLLYaLd3or8AFu/Iuv2jWDrT4AI3kQSfHj+HfktunMtzp4o9BeMgSVECkGrJ+7Vp2eKHQ==@vger.kernel.org
X-Received: by 2002:a05:6512:e88:b0:539:ee0d:2bb4 with SMTP id
 2adb3069b0e04-53d862e5c0bmr287074e87.45.1731016489173; Thu, 07 Nov 2024
 13:54:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107032313.64390-1-charles.goodix@gmail.com>
In-Reply-To: <20241107032313.64390-1-charles.goodix@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Nov 2024 13:54:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQr_6L_UhdCSr3cbxfGO2aEEYgTEpBh+gseYeapr-5iA@mail.gmail.com>
Message-ID: <CAD=FV=UQr_6L_UhdCSr3cbxfGO2aEEYgTEpBh+gseYeapr-5iA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: krzk@kernel.org, hbarnor@chromium.org, conor.dooley@microchip.com, 
	dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 6, 2024 at 7:23=E2=80=AFPM Charles Wang <charles.goodix@gmail.c=
om> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.

I think it was requested that both the yaml file and the commit
message mention why there are two different yaml file that both talk
about "gt7986u". In the commit message I think it would be valuable to
point to the previous discussion. AKA, maybe say:

NOTE: these bindings are distinct from the bindings used with the
GT7986U when the chip is running I2C firmware. For some background,
see discussion on the mailing lists in the thread:

https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com


> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
> Changes in v2:
> - Change compatible to 'goodix,gt7986u-spifw'.
> - Remove 'goodix,hid-report-addr' property.

Probably this should be a two-patch series now. The first is this
bindings file and the second changes the firmware (which never got
reverted) to default to a hid-report-addr of 1.


> - Change additionalProperties to unevaluatedProperties.
> - v1: https://lore.kernel.org/all/20241025114642.40793-2-charles.goodix@g=
mail.com/
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986=
u.yaml

The name of the file needs to match the primary compatible, so it
should include the "-spifw" part.


> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml =
b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> new file mode 100644
> index 000000000..b7afa21fb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Goodix GT7986U SPI HID Touchscreen
> +
> +maintainers:
> +  - Charles Wang <charles.goodix@gmail.com>
> +
> +description: Supports the Goodix GT7986U touchscreen.
> +  This touch controller reports data packaged according to the HID proto=
col
> +  over the SPI bus, but it is incompatible with Microsoft's HID-over-SPI=
 protocol.

I probably would have put the note about the compatible here instead
of below. Something like:

NOTE: these bindings are distinct from the bindings used with the
GT7986U when the chip is running I2C firmware. This is because there's
not a single device that talks over both I2C and SPI but rather
distinct touchscreens that happen to be built with the same ASIC but
that are distinct products running distinct firmware.


> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    description:
> +      Add the 'spifw' suffix to distinguish it from the general GT7986U =
I2C-HID
> +      touchscreen, as it runs a substantially different firmware than GT=
7986U
> +      I2C-HID touchscreens.

As per above, I'd remove the "description" here. It's not common for a
compatible to have a "description".


> +    enum:
> +      - goodix,gt7986u-spifw
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +unevaluatedProperties: false

I believe "unevaluatedProperties" is supposed to be moved down below
"required" according to previous comments on your patches.

