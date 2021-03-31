Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D2E34F950
	for <lists+linux-input@lfdr.de>; Wed, 31 Mar 2021 08:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhCaGyv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Mar 2021 02:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233921AbhCaGyj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Mar 2021 02:54:39 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890FEC06174A
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 23:54:39 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id 19so16326332ilj.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 23:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yeKrckTzHOO3yQ+srrac1qUI6RSAohkfWzlajj4UYbQ=;
        b=cHobDHKUjuFxHIO9jjERbjqLRw3xGZtcVB2aoXcINXsrpF0TNju02vSTfblqB49Ejn
         N0zXufwFdtbmyl7ALidZIquN3zVl9/OxwcwOD05njV3HBCog9BADxoVFY0M6evOoPPVI
         +E6roi4QcgD6Hd25LztbBjy1fSe8N1DA+ZOIP8V4zW/akVwpPeFy4ha+Zvvq9x1gDHJa
         q0RCd8xhs7z/U4IdkUtkMkT8t6TbRwyUpxzhIsbJpVuqS/6ohErqnzGRrGYHaLzqTE48
         PhEy1G3YCO45/myy/XNhuUNaRpix04M+XTnrXuQqKasiSzHyGEjnYnIAKcAI9AdFxXUS
         oMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yeKrckTzHOO3yQ+srrac1qUI6RSAohkfWzlajj4UYbQ=;
        b=LWF+a1k3IU5cS9Dny17EgCamycrqp1ww+cawrbDSHt49k28oN5DEjuNO2WZz0/VOgA
         JTa5M67Ok/t/FiD/XqnXbOXhQKgFyIyzBRXNWGdXfR+G1EJLIbe1PtPc2OjHS3zCeMZJ
         Op0UK2RbfFYumYo7mnI3Xtq/84ZbTXWKBhPz//3Vl742FQsjSoa5dXBedxJ6NXIS287A
         sUFKZfclUbZXFni7f0edqzwJ5fXh/tZcZndcLBvROx+OmgSTorUjPCQ+jBpaqsr7qFQv
         PuQv++NfoKq1hdgr5fO9bq2A1lD0MiLO7yfHG3ia/7uMICWdeBUg0DZytB0p3dMTiVjL
         d3Ag==
X-Gm-Message-State: AOAM530hlM8d3WUwgczS/sLrDN1UQChdz4c4tlt4QQ/7WzaDIpuGWSu3
        uNpeo/smPr27bnTbXKMV4/tWQFzs5ZwcFfDxwuZWgQ==
X-Google-Smtp-Source: ABdhPJwhCRglchkn4NnWjXE76ksZYfjiieBsmJxN+mfE6AXkvh8KBedq8bJ2IVY67TJj0Z5ViQ+UDxzTrvUmG7b8lew=
X-Received: by 2002:a05:6e02:12cc:: with SMTP id i12mr1633195ilm.10.1617173678970;
 Tue, 30 Mar 2021 23:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210329130758.2082126-1-linus.walleij@linaro.org>
In-Reply-To: <20210329130758.2082126-1-linus.walleij@linaro.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Wed, 31 Mar 2021 08:54:28 +0200
Message-ID: <CABxcv==Dv6Z8QVzE+unbUTfS2DhE7xp6UTVnifDs9eVHM3UBsg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: cyttsp - Convert bindings to YAML and extend
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Ferruh Yigit <fery@cypress.com>,
        Javier Martinez Canillas <javier@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 29, 2021 at 3:09 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> This converts the CYTTSP "Cypress TrueTouch Standard Product"
> to YAML bindings and fixes and adds some things in the process:
>
> - Rename the bindings file to cypress,cy8ctma340 after the main
>   product in the series.
> - Add proper compatibles for the two known products:
>   CY8CTMA340 and CY8CTST341.
> - Deprecate "cypress,cyttsp-spi" and "cypress,cyttsp-i2c"
>   because device compatibles should be named after the
>   hardware and not after which bus they are connected to.
>   The topology implicitly tells us which bus it is and what
>   interface to used.
> - Add VCPIN and VDD supplies, these are present just like
>   on the CY8CTMA140.
>
> Cc: devicetree@vger.kernel.org
> Cc: Ferruh Yigit <fery@cypress.com>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
