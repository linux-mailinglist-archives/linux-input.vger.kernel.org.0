Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9AE2F70A8
	for <lists+linux-input@lfdr.de>; Fri, 15 Jan 2021 03:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732230AbhAOCix (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 21:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726848AbhAOCiw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 21:38:52 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6911C061575
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:38:06 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id m6so4563619pfm.6
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 18:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=IfkswvJ+WT98pmcPH/y83e9uI74Y39PRJ7kSQcG7VDE=;
        b=OLMKXlKGUaSp/DoMdWjeLPA8oKDvg/T0PB5ioM/AQpS5MuZjjQYk8OToEyig4x62Am
         g4/AWLBPxQdDsVHMEQEdUs2E94r0GLl0W81uaZTyuXgP1RP9LCiuIEhAOdBW54lrrgO2
         h0YppKIj0sFUg/0bMSMvOvUfdBiYbKlysWFXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=IfkswvJ+WT98pmcPH/y83e9uI74Y39PRJ7kSQcG7VDE=;
        b=JF4PdzWQDZWi+3HrIootaoQWY8bKR/LHn1+IJHZVrJIcYVomGf0UV42g9BydoQmptE
         snFoZs8ecC+BUbV8xiYhAi2MBWIwTcHjEjEX5YSorDN6ASPb6tfsC2YD4WsEIimxgZ9U
         UymsPX1xbc9HUlIkEOb3Lfe19XWf9suPAe/pm6l2wwr4Cm1tRm6X5KKa1u6ny8Wu0Ze7
         d1YkQQwPlAPZhLLOGPAXEAHiX0ZwqaE2gL5kuNJLdxQRC9/pyLSiT4Dm4MqT2DpEhm/i
         GmFqwmSnhsL6UNVViN5OEC4HYpIbHR2cbdirXXaGpF0ebVH1rRAAKJ2T3nj29Cn9AWnW
         SBSA==
X-Gm-Message-State: AOAM532fbGSQxI+2M36Xp3/RrOW1eYZ5f/6RiJdlxoLypHooWUBc3CbC
        gZW8LAQ1kq0YrvLtUeX/NtAcCw==
X-Google-Smtp-Source: ABdhPJxq3/PXGO4zHNtGU/8aBUboJyQEuN+jDyp8SClyYxh5r8aS7YFiBZMJIxc3mNMEl34NhzMjmQ==
X-Received: by 2002:a62:6845:0:b029:1ae:2731:8a89 with SMTP id d66-20020a6268450000b02901ae27318a89mr10641554pfc.73.1610678286400;
        Thu, 14 Jan 2021 18:38:06 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id d36sm6536270pgm.77.2021.01.14.18.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 18:38:05 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
References: <20210114183010.v6.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
Subject: Re: [PATCH v6 1/2] dt-bindings: input: cros-ec-keyb: Add a new property
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
Date:   Thu, 14 Jan 2021 18:38:04 -0800
Message-ID: <161067828422.3661239.16933057782247961610@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-14 18:30:30)
> Add a new property `function-row-physmap` to the
> device tree for the custom keyboard top row design.
>=20
> The property describes the rows/columns of the top row keys
> from left to right.
>=20
> Signed-off-by: Philip Chen <philipchen@chromium.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One nit below.

> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.=
yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index 8e50c14a9d778..a742b0777ee6d 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -43,6 +54,18 @@ examples:
>          keypad,num-rows =3D <8>;
>          keypad,num-columns =3D <13>;
>          google,needs-ghost-filter;
> +        function-row-physmap =3D <
> +                0x00020000      /* T1 */
> +                0x03020000      /* T2 */
> +                0x02020000      /* T3 */
> +                0x01020000      /* T4 */
> +                0x03040000      /* T5 */
> +                0x02040000      /* T6 */
> +                0x01040000      /* T7 */
> +                0x02090000      /* T8 */
> +                0x01090000      /* T9 */
> +                0x00040000      /* T10 */

Can we include the header file for MATRIX_KEY so we can use the macro
here?
