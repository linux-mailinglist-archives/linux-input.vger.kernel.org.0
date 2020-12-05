Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97DE92CFFA4
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 00:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgLEXKn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Dec 2020 18:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgLEXKn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Dec 2020 18:10:43 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D737EC0613D1
        for <linux-input@vger.kernel.org>; Sat,  5 Dec 2020 15:10:02 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v14so12788920lfo.3
        for <linux-input@vger.kernel.org>; Sat, 05 Dec 2020 15:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4dh8REGOcY3mSsdjWtW61gFhpeRq7e/rh4UNS/HtWs=;
        b=kWFaTEtG7vzSIUnVscs0yrMiGM74TzDtNz5KZB8Zp8eMiW38SCyLlPXQC0Yz/Mn8DJ
         YwLmcUu2VRDStp5VnkBJQFfO3+hgJkzJc3LBxV49djXdfPPvXAcbtUfl8kYNd4UK1Zs6
         P4x2bIuLbYrAEQ/1rSeAPVa5qHwVDqIiuo1FBET6sIU53NEisWFOlSdzDIWESRlKjkg0
         eFcj3RiDttwq/oqovE0VH6EJ7zVDEgjZDAhx63oD6GSe8KBDYrYndVWy3eUQ+omCXqSl
         9kd9/XeyxCYbw2TQ3yi2PiR5WYbie5eE43LqaeduKWitriLH0FSeWF0rxEwM+l3V+08K
         P6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4dh8REGOcY3mSsdjWtW61gFhpeRq7e/rh4UNS/HtWs=;
        b=hxDkiYbHrjhGJSLxvl1atR4vfkCRu7LphxwR9kOZi520bBb5EoEXK0tEsjh7kmP5T9
         1vRapEYjlgNl+H/8yxjvZ5tRNrORwSQJEYwq9ns7jcGKJhGJ109aVpyHBVCqqqAlHVY9
         bzzKWUde6m3LHfxqP5jHuFHCok4jtIZemEcCEOOcEOkR3yGwe/1bDJlo4o1uKM2vtkR2
         j/PZe1LimiQsREsyH9gykCoWI8Tg7DWVDq2XzoBZADrVoorzHOFaFEgKYubZgWqdpy4n
         LkPcm05um/ap4C8k+ydDC2wFU/URu1OlRrhsL1xUNSAH/mjUe1JosfPWnqypCRcmcTPM
         OA+Q==
X-Gm-Message-State: AOAM531mS3SRquNUgS3lbPbzgSmOJ42oZVRXPAfazMqQ+xzCzqCbz4PB
        8veKgnCSn0/5CJ+42d4Ygrvn0p9MOYid31jJ1/h1OA==
X-Google-Smtp-Source: ABdhPJy233SEVPqebAfOtTTGE/Erqfl6WucP3n7epmMvF3mdGMv8xEZT98JCM2Pf4IlavisqYdqQ5QYbqRr47p+yhB8=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr5417111lfq.585.1607209801250;
 Sat, 05 Dec 2020 15:10:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203131242.44397-1-stephan@gerhold.net> <20201203131242.44397-2-stephan@gerhold.net>
In-Reply-To: <20201203131242.44397-2-stephan@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 6 Dec 2020 00:09:50 +0100
Message-ID: <CACRpkdadiyYK5i8+TaLqxjmp4mUJ8eTiyZkgPXp-Qa2+CD8DrA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: Input: tm2-touchkey - document vddio-supply
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 3, 2020 at 2:13 PM Stephan Gerhold <stephan@gerhold.net> wrote:

> The Samsung touchkey controllers are often used with external pull-up
> for the interrupt line and the I2C lines, so we might need to enable
> a regulator to bring the lines into usable state. Otherwise, this might
> cause spurious interrupts and reading from I2C will fail.
>
> Document support for a "vddio-supply" that is enabled by the tm2-touchkey
> driver so that the regulator gets enabled when needed.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +  vddio-supply:
> +    description: |
> +      Optional regulator that provides digital I/O voltage,
> +      e.g. for pulling up the interrupt line or the I2C pins.

I think the funny pipe | us only needed when you want something to be
fixed-width like ASCII art or ASCII tables. But no big deal I suppose.

Yours,
Linus Walleij
