Return-Path: <linux-input+bounces-10847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 257A3A61F9E
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 22:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF86F189667A
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 21:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370E8205AC2;
	Fri, 14 Mar 2025 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cR1BHCM5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2104B205AB1
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 21:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741989535; cv=none; b=i76LIhTrOZxAkGfAdzcHbsMWrNifOro1N6AIPeh2ZzrBS85zwYcm7ceEfc5xIJJ8bxw9CfeMFUZStZN5KxcRPHOsW0cS3Ya9McTURKP/KbJ6aV3zn4REq7pXcRkbEDX1/XAimog4NYSxVs5+CG5xfp029aG9VRcpdhtI/QhbQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741989535; c=relaxed/simple;
	bh=CKhlM71HHWzhYTD7pWKMXzC0UBFFhRub+4ucFciopmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAossDifYO4/k5jM8m43VssvEIuSlUxvEGLttBXUkbDC6opBoZ7ccLD8WG3dtGQSwrrOVuXg78cIsP6YbQy3wi/SXEYlCOgi1wtEzlpEy47EqEY8c1o96Pr02ylyi5Ghjww0VkbvLMCXvhozeYUMufi36QCQwf4tjr9sVVm6rps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cR1BHCM5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30761be8fcfso28250541fa.0
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 14:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741989530; x=1742594330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=cR1BHCM5qC+O5vX0WwLP9liQhyD+pqkPr6NJpQOq3zkvyTLdaItMY4tPJzTJxfCw1w
         md+8VViHWv0ycfTo+Zx3dsEfH+BpGnhOSMEfJpHSxsCeBiSbXqLtODUw+Gd9BJ8FS5bg
         q/j/CLSu85E15s1IV6g5bYT7a2IhoGVaGF0pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741989530; x=1742594330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+G1znUUY7rtTf9DzLNl5P+qD4jbuh64Bw3HveeQEA0=;
        b=mrJ9OcuZwSGNAphZcbdTBrUVfNpKUBXSxjxETyc/JWAqEXy27rIwLMzJ8H8T7zH2nI
         RqbE8wuVNYnx8SA8+kIZEulMv4TVCQecs8vrnKN0iBuUhDB64P1XIQ8kheF7IpEfKgyc
         STVACtYpuDZrhm+/sDdaRzbZp48Y51osby6CBLs+u/EPvxHrUt/zDGsVv9w6nTuDWZ6N
         Z2vxoJxy7SSR9SaALVbTrDFvY7MR2RfdwajZ+SG/Z+l4F3NX2iHPxYAI/uSe6ByVIy9t
         iGtoZ2IqCtI8RPa9r0Iip9FJ7bveMgiu3qCo4cJ77utd17R9jOygQdAfnwwHIbwFHxCa
         AqmA==
X-Forwarded-Encrypted: i=1; AJvYcCXe6FglVwEUS2ZyfPwJ1iLohlZkouF3CXAT6q1MBHimf8NAHKfTRfspzfIwZuC9ytGNIKQVzlCLpie4Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyjf4SfBi/TkhlBGQVyNQAtaB3WnJ6NJ4/jB3NEKHm0L0gDnbQ
	6pXTBrkNx1lr6eKVBr1VtpbZa7Wip9UCDCzz7bDez4Y1t0vyS7eee9l8eCQ53DTKZkYKI7KpdA+
	VXzXo
X-Gm-Gg: ASbGncvs0+lLxarv/4CdW6fnSCLDYv/53SPAiC7ZE567u1jEUoszEHIZ1AGTk0vtbJU
	yQkjkwEBR3jxlK2eVlQQV+GFBvRHF05+HkfVkHCr3rO3szKpYqcPoUQfnRwaBibYMT9nopkRKtv
	BVGUwdI+Jmu7CgJQlu6O/Ym1rvR7oP9JAfDpbiaY/J7g/kp0w51X8zaknKnO0Z+9sxJxfWuxygX
	IbsgGdlOdKhrQfuH76jra+c5spcrPQ8BeyDUN4cLjf+I5xjsyoKTgMW7MJORuwL39FBr9yOjZ+P
	5R1IMViA91Ee43Hv0c4I8Uzi2A20NYI/Oe2nNf3sOxkLm9XZZrH2m/OXmKtbnTZ37s3Q4s751ir
	x2xCqtbfi
X-Google-Smtp-Source: AGHT+IGLUmrYbnmQcxRdxsJCIIici9IjAjRvMlOS3eyA/+GPo90iyMCfcZSxxhNaRVTqDxwI8l560A==
X-Received: by 2002:a2e:bc0a:0:b0:30c:1aa6:552f with SMTP id 38308e7fff4ca-30c4a74d5c4mr17069141fa.1.1741989529835;
        Fri, 14 Mar 2025 14:58:49 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea756sm6997361fa.35.2025.03.14.14.58.48
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 14:58:49 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54943bb8006so2438129e87.0
        for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 14:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlFE5PhY1Yehy4AdMqyHGIwWYV1307uk7jhoj8ICNLKzDac5hpD1SQUGaoaa5wKoOAhtBeg9016GIpwA==@vger.kernel.org
X-Received: by 2002:a05:6512:3d02:b0:545:c7d:1784 with SMTP id
 2adb3069b0e04-549c3988b84mr1398468e87.43.1741989528244; Fri, 14 Mar 2025
 14:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250312104344.3084425-1-wenst@chromium.org> <20250312104344.3084425-2-wenst@chromium.org>
In-Reply-To: <20250312104344.3084425-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 14 Mar 2025 14:58:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
X-Gm-Features: AQ5f1Jqp4S31G39Rg1NsczcQY3Hb3QPTaquvIuzNNpiFQjs9eAjzZVdMi2mJRe0
Message-ID: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


On Wed, Mar 12, 2025 at 3:43=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration. Enumeration and subsequent operation follows the I2C HID
> standard. The eKTH6A12NAY requires longer times for both parts.

Somehow the last sentence above confused me. Can it just be dropped?
All you care about is that the new trackpad matches the timings for
"eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
"longer" timings.


> Add a compatible string for it with the ekth6a12nay one as a fallback.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b=
/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index cb3e1801b0d3..81c391952ccc 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Elan eKTH6915 touchscreen controller
> +title: Elan I2C-HID touchscreen controllers
>
>  maintainers:
>    - Douglas Anderson <dianders@chromium.org>
>
>  description:
> -  Supports the Elan eKTH6915 touchscreen controller.
> -  This touchscreen controller uses the i2c-hid protocol with a reset GPI=
O.
> +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> +  These touchscreen controller use the i2c-hid protocol with a reset GPI=
O.
>
>  allOf:
>    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> @@ -23,12 +23,18 @@ properties:
>            - enum:
>                - elan,ekth5015m
>            - const: elan,ekth6915
> +      - items:
> +          - enum:
> +              - elan,ekth8d18
> +          - const: elan,ekth6a12nay

The "enum" above is weird, but it matches what we did for
"elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
maintainers. I guess the assumption is that we might add additional
touchscreens to the list...


>    reg:
> -    const: 0x10
> +    enum:
> +      - 0x10
> +      - 0x16

Again happy to leave it to the bindings maintainers, but _maybe_ just
drop the "reg" parts here and below. It doesn't really have to be part
of the bindings.

