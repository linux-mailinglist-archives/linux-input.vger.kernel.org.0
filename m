Return-Path: <linux-input+bounces-6286-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0A96FCC2
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 22:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE18B28C3BC
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 20:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966241D79A1;
	Fri,  6 Sep 2024 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8LhhbnL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E91D1F56;
	Fri,  6 Sep 2024 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725654539; cv=none; b=dkwtoH5g2Txn8zYHtcPEGhWGj5qxsrZpOAIuR4xw6/neotX9OjDmZ0S7aaYGzBW+C0PFwoVY5ZXrUykbeJBIo+0yvIlLmcNFOwW+8l7ZU6EJCww5fhnpI+Y3qalHs8s0FUKkKjHllIV1J2Z+GkXoU5H7nOXhdKXcrrEoAlhnLHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725654539; c=relaxed/simple;
	bh=hv0U7pa1nU9i8rSDEBlp42iO0ygFjbq5mj4CRdcsy1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhjDIVihzSZC1cS06CxLRHPtuzTjBr5Y8W7IgmJIswdNT1clz/uTGQw6q3idTWOuqgH9igmJDY6hrHUEcInHDoyYOO5b+soR/shDRpJQ2VJNiu8Zear5nOc05Vlks047B8exJvDnhIovd1bBCZte3ywsPdA7KIl8iYf9iegmYrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8LhhbnL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D117C4CEC7;
	Fri,  6 Sep 2024 20:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725654539;
	bh=hv0U7pa1nU9i8rSDEBlp42iO0ygFjbq5mj4CRdcsy1U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8LhhbnLg3lB/A1i92L1gUSdm0XfSu1r6zpSZoumrgIFPWmxehESyUWkRLeC7Udow
	 6oWCJp2VGzlcMotwz7lThZphM9NCeKB3tmisygjVU8dlneFy1toMKZDIettI6wW/gY
	 kwkPCNDtlcOKZEwHV/OzqZYccfK/YEGCI1mFUPCv1QvRzeH8lG4hOaDTYXc/ecGZ5v
	 4IUrCZrZfr9bRlpKJcXA8xav5v2A99dW7nFg/UXyVjZjEGzgL2TC9PUK5AN5MqGhuO
	 Xf8WyKF535LZCUAeWA/HI+oZr0CUfnFUtO9J92nQfXNnC+elKH6M157or5gzzn0f2A
	 +gBuV1YHYjoNA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53345dcd377so3087919e87.2;
        Fri, 06 Sep 2024 13:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZpJbjVxAY6M9Hs1dP4RKxGKamiotb8fhzq2j5sIv0W+rdBsZ0FIukJhP5bjVCmxYEzVZkQIPHYe3HmMc=@vger.kernel.org, AJvYcCVdve/0W2zq+Mo08vLpzj1scvaXKCNEXZU9qsVpvqtm5aG43rym5eInAONSbLN/qU9mgqeSMxVd0a38mNLr@vger.kernel.org, AJvYcCXPhcSH5X/PHNmyhHZcVMhPzEmUcsfLW8Sa1zEscgdjBke2GVb7lcT6NP+ufGRrNVLA5PJqoJyweHC8@vger.kernel.org
X-Gm-Message-State: AOJu0YxAQUhuXqq/FG8jVYCrtBXl3aMlWJfPMjk1LRUXLtQfEWSX75km
	D9qyFXJL0VFxsAWc43am1bybsE6XZi1qSurGRzSCT6aOi05u9FGArucEhHyNmkIza4Md80bB4Oy
	V0v5t7NeU/jg4mYQms5J8U9a8Xg==
X-Google-Smtp-Source: AGHT+IHnxC1JQal5GS+rIfcQcX86BozBZ492O7DlOM07zAmT8O+OHbAWtZsxF7m08rOoE+axZxM6xxK35KOwaUVI9CU=
X-Received: by 2002:a05:6512:10c6:b0:52e:e3c3:643f with SMTP id
 2adb3069b0e04-536587a418emr2416330e87.2.1725654537672; Fri, 06 Sep 2024
 13:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814024513.164199-1-charles.goodix@gmail.com> <20240814024513.164199-3-charles.goodix@gmail.com>
In-Reply-To: <20240814024513.164199-3-charles.goodix@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 6 Sep 2024 15:28:45 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
Message-ID: <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dianders@chromium.org, dan.carpenter@linaro.org, 
	conor@kernel.org, krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:45=E2=80=AFPM Charles Wang <charles.goodix@gmail.=
com> wrote:
>
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986=
u.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml =
b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> new file mode 100644
> index 000000000..a7d42a5d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GOODIX GT7986U SPI HID Touchscreen
> +
> +maintainers:
> +  - Charles Wang <charles.goodix@gmail.com>
> +
> +description: Supports the Goodix GT7986U touchscreen.
> +  This touch controller reports data packaged according to the HID proto=
col,
> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt7986u

This is already documented in goodix,gt7375p.yaml. Now linux-next has warni=
ngs:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,=
gt7986u.example.dtb:
touchscreen@0: compatible: 'oneOf' conditional failed, one must be
fixed:
        ['goodix,gt7986u'] is too short
        'goodix,gt7375p' was expected
        from schema $id:
http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,=
gt7986u.example.dtb:
touchscreen@0: reg:0:0: 0 is not one of [93, 20]
        from schema $id:
http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,=
gt7986u.example.dtb:
touchscreen@0: 'vdd-supply' is a required property
        from schema $id:
http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodix,=
gt7986u.example.dtb:
touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id:
http://devicetree.org/schemas/input/goodix,gt7375p.yaml#

Please sort this out and send a fix.

Rob

