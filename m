Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4194036195D
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 07:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236893AbhDPFiK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 01:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhDPFiJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 01:38:09 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4D7C061574;
        Thu, 15 Apr 2021 22:37:45 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id k18so21818890oik.1;
        Thu, 15 Apr 2021 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T/IW+M3bZXs+TidV7rj8NDJLHs9tA2SQf7kB4PctnB8=;
        b=u1XcTRAQSCYZMFFdJoZAgxCpueQIkybF5upn5JS7bciBx066PS/niKBAknL/+AZWsn
         lyjhRluVLFodzDicNZ6q2nMyfdAwhNIAvaHZavphYt1FFjdETjPtXb74pIXAg0hhG/9T
         LyZBU12TNfu21sVaCuIr4lbDxb5GMpSpsmPpigj6nwbgT6mxb9OvqFeLPbSi++OvFXcm
         BfGZRn9uDMJZJNcbPwOFKLTZAX/OfxJnHCWIRDcydxXZKEuYj92NT12IU/tEgMA4P/Mp
         lLcp908DoxyM3/wfKcxM4XQhbqMtgZM2/t1pA1vGm+vuanrPaU06DRVMIVCCxwHxhcmB
         rkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T/IW+M3bZXs+TidV7rj8NDJLHs9tA2SQf7kB4PctnB8=;
        b=rfNSazw03KWZifJB06CcoPU6o0g9P8id0EH8I9K79Iqorv3ICSv+mW58cYMpYpn3S5
         rOWTk+3fiShEUQguJzbRScdnl+sao8JlYI9y/+qd5G5SO+xsSHo+HZX3JZw7j0FOwhve
         17rcv8HJ8gK1hnh0gTGh1vNPN2n8z4WgcIhu7XPChPXOfzHQiFA9BtU8z+E3ChgvNcJS
         QWg3+LMUHN5Le66vumgu1k/q8eSKlE2lGXRnMtPL28IIkNnYLbs8+VrxhpQiAZ/mkb9F
         JOjKCYuiC8fU7DqJ+0g7wWL64A1dBQEL5OvvllfYA+ZLedtSpE7Zq8IotGNy4BkIVo3z
         QYOg==
X-Gm-Message-State: AOAM532IC8xPHBEUctDSOr8KGWGqG7fbykt3YxRHUlofxXo97QxKgjTs
        QpG4lGsco5k4jZpqRnIrs3aDNQWXCZsX2C4/jJE=
X-Google-Smtp-Source: ABdhPJzVVY8o2g1JY7ImbyMuNJEWh+ukSW598cUYKC5UHZjiTU7TXwWRbqaRryxNjJrLI/8oc2QpZPUbmGLfypCx2qw=
X-Received: by 2002:aca:b408:: with SMTP id d8mr5275217oif.47.1618551464901;
 Thu, 15 Apr 2021 22:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210415032958.740233-1-ikjn@chromium.org> <20210415032958.740233-2-ikjn@chromium.org>
In-Reply-To: <20210415032958.740233-2-ikjn@chromium.org>
From:   Enric Balletbo Serra <eballetbo@gmail.com>
Date:   Fri, 16 Apr 2021 07:37:35 +0200
Message-ID: <CAFqH_53GXdCfPCke_UN3fqrDxHZ_scd21ZekVzrYoVWbmLUmrw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] mfd: google,cros-ec: add DT bindings for a
 baseboard's switch device
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

Thank you for your patch.

Missatge de Ikjoon Jang <ikjn@chromium.org> del dia dj., 15 d=E2=80=99abr.
2021 a les 5:32:
>
> This is for ChromeOS tablets which have a 'cros_cbas' switch device
> in the "Whiskers" base board. This device can be instantiated only by
> device tree on ARM platforms. ChromeOS EC doesn't provide a way to
> probe the device.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> ---
>
> Changes in v5:
>  - Add missing blank lines and change the description property's position=
.
>  - Add a note to description: "this device cannot be detected at runtime.=
"
>
> Changes in v4:
> Define cros-cbase bindings inside google,cros-ec.yaml instead of
> a separated binding document.
>
>  .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/=
Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index 76bf16ee27ec..8dcce176b72e 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -114,6 +114,22 @@ properties:
>        - "#address-cells"
>        - "#size-cells"
>
> +  cbas:
> +    type: object
> +
> +    description:
> +      This device is used to signal when a detachable base is attached
> +      to a Chrome OS tablet. This device cannot be detected at runtime.
> +
> +    properties:
> +      compatible:
> +        const: google,cros-cbas
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
>  patternProperties:
>    "^i2c-tunnel[0-9]*$":
>      type: object
> @@ -180,6 +196,10 @@ examples:
>              interrupts =3D <99 0>;
>              interrupt-parent =3D <&gpio7>;
>              spi-max-frequency =3D <5000000>;
> +
> +            base_detection: cbas {

nit: Rob, shouldn't this be just cbas?

> +                compatible =3D "google,cros-cbas";
> +            };
>          };
>      };
>
> --
> 2.31.1.295.g9ea45b61b8-goog
>

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
