Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82312F2617
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 03:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbhALCKz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 21:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbhALCKy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 21:10:54 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65996C061575
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 18:10:14 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id c22so382340pgg.13
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 18:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=TAJh0CkOrXTXuHNR+ubOQwQXwNopqM57rV369+EEx9I=;
        b=H0BN8Do4ZOVCh0kCJo4fmcVJyxFptlqv/+SoSFu0R0fIYGkg9268aT+PCfdeNGQkzT
         mc6dKyPiyUW2lr+LqtaDcBb51Ei0nUnS1Y5YU3zKv5/TG9XUCnuwHxQ2lhlggEUr55iQ
         245R4Hn6TY7JOIbl5Cx3gA1YSIxH8atOA31C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=TAJh0CkOrXTXuHNR+ubOQwQXwNopqM57rV369+EEx9I=;
        b=pv196KsZijm53BQx+jN06T72YrURjoUaFpPeGhRQqOuMb6InFG1pBVDfC34xqC0jOB
         2rC0S4Q9N/R/OtdqFjj2EOJDEpDuwzi0wnvEWyU+K+dXaaeqEtPNa7Q5W65ezm3dUOgm
         W2wRWGgdCwaR0922WZL575wAl5QlnfEEA1X5e6XykcFwVFlBgJwK4tyZolY+9o+TnQ25
         MoELZT1U995Sz8C60iF2QFkCRjcrS/Oj0FJzXFVldJVAto65xRJ0qZZHWmXRtN0LUy52
         sDz4bnj5faaOxrgat/r+a93cwN9O+sl4sZDxejNgCZ0AoJU96XzD9JPWPc0AMEUOClws
         41CA==
X-Gm-Message-State: AOAM530Wc4rkSlBSAVAEI0U3wlLxILpYyVCRbeAARO/3yH3aVV7HAYIL
        j/MNiKzlgV/NjLeLCmIuBLGSGg==
X-Google-Smtp-Source: ABdhPJy6riOnrTb3lEU4Mio4h9HV53BnD1tKRzK4N1IjCjvt4GdjfeyJeipmC5FWCwkCLczZ1Nq8+A==
X-Received: by 2002:a62:c1c4:0:b029:1a7:efe9:163c with SMTP id i187-20020a62c1c40000b02901a7efe9163cmr2216781pfg.47.1610417413913;
        Mon, 11 Jan 2021 18:10:13 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id f29sm1110404pgm.76.2021.01.11.18.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 18:10:13 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210107154200.v4.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Glass <sjg@chromium.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        dmitry.torokhov@gmail.com
Date:   Mon, 11 Jan 2021 18:10:11 -0800
Message-ID: <161041741167.3661239.13546059654424804588@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-07 15:42:08)
> This patch adds a new property `function-row-physmap` to the

From Documentation/process/submitting-patches.rst

Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
to do frotz", as if you are giving orders to the codebase to change
its behaviour.

> device tree for the custom keyboard top row design.
>=20
> The property describes the rows/columns of the top row keys
> from left to right.
>=20
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.=
yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index 8e50c14a9d778..7acdb33781d30 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -31,6 +31,16 @@ properties:
>        if the EC does not have its own logic or hardware for this.
>      type: boolean
> =20
> +  function-row-physmap:

Is there any minimum/maximum number of elements possible?

> +    $ref: '/schemas/types.yaml#/definitions/uint32-array'
> +    description: |
> +      An ordered u32 array describing the rows/columns (in the scan matr=
ix)
> +      of top row keys from physical left (KEY_F1) to right. Each entry
> +      encodes the row/column as:
> +      (((row) & 0xFF) << 24) | (((column) & 0xFF) << 16)
> +      where the lower 16 bits are reserved. This property is specified o=
nly
> +      when the keyboard has a custom design for the top row keys.
> +
