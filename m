Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61B0B44A5E2
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 05:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242832AbhKIEsH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 23:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242827AbhKIEsG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 23:48:06 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CA2C061764
        for <linux-input@vger.kernel.org>; Mon,  8 Nov 2021 20:45:21 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id u74so10420765oie.8
        for <linux-input@vger.kernel.org>; Mon, 08 Nov 2021 20:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrUXzO/SXSYvsB+cqJXI4sWsKIikjeXfqc6uXfkQ7dU=;
        b=fZx8eeRzFjoenMcmcYQTn6ymcMuoGaZwU682S15i1IwsNsJ4Kc7YMsYbYqlUDBzoQ5
         0xutz+Ylapgh8ApsABzt7BASgYb9+0tqZWeSLQ+QBcOAHyO41nUuhrxzUqJ55yKN3ShG
         PjER1WHqs+kZ2b17N7OkIFVVdE/wIczhKNcEBHi4iC08o0Hb+bbprn5ZTTYey8I3vTIy
         YfqfkZhhtp7fwANa9X2q6iidrjyXiF9kWBiJTjOY1s2iGCtrUC0Kf3F4zCklQfrTlnCV
         xaC+8xmw3CLcy1CH4mLOtU6tMW/fTnnxIxj+iXTH3c+HRWEL0fTGFt5Bt8M/UvZSaKjM
         3ttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrUXzO/SXSYvsB+cqJXI4sWsKIikjeXfqc6uXfkQ7dU=;
        b=IU0/YbiCFz1xlvLIlrWQ6gB3h7jT4J0Vy94UwLhsNH1wFOIWnKkqfg8i3O2ZfKkExc
         /THUqYl5OBOFn/Wrw3knv9c10kkXRf+uiAbQnIvysYyq2oaOwIlTNty90J9ClbabUaB6
         Ou/kMu2yw5n1JB8XviEEXoRyGjLwUR51LQw9VlQbyZySAcSdi6HKV8TYukT1taKC3ViQ
         8OGkkLNh/2R+lfPxkwPwvUfZwM8N5lQrFfkMa+5tepm4KN8JxJBXNqd18bRMcCfEJDVh
         D/lARb43SdZdos1k+X8qwL/uAzlxgkoFH5aHpg7KxsUFougw03b7SwBfkX9ZmIArBzre
         ePwg==
X-Gm-Message-State: AOAM532se6puJCsqmFkmsLE3+IeHdGxuaIEOtT7j+hg9GoQdSf9JnAa5
        p6k9lh7fISuSRaLXKB8F1f07VTl7pBQSObT13c4F6A==
X-Google-Smtp-Source: ABdhPJxB/Y/jjWaY9guY61DEGMDSZKf3Q4w5/NgwO5gdErp/7ZQwieYv6LRgOffm7IVuHcgnSYnEQbM++u3iJSxmJ5s=
X-Received: by 2002:aca:120f:: with SMTP id 15mr3127795ois.132.1636433120520;
 Mon, 08 Nov 2021 20:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:45:09 +0100
Message-ID: <CACRpkda_EM9mXuJdrZcpFaJCKF1UDgXkfdxkaniyXFHFd_7+Pw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nikita,

On Wed, Oct 27, 2021 at 8:15 PM Nikita Travkin <nikita@trvn.ru> wrote:

> This series adds support for the touch-keys that can be present on some
> touchscreen configurations, adds the compatible for bt532 and fixes a
> small race condition bug in the driver probe function.
>
> I also pick up the series that converts the dt bindings to yaml
> initially submitted by Linus Walleij in [1].
> I made some minor changes to those patches:
>  - Fixed dt_schema_check error
>  - Adressed the review comments from Dmitry on the original series

Thanks for picking this up!

Have you notices some behaviour like surplus touch events
(like many press/release events fall through to the UI)
when using this driver? I think it might need some z fuzzing
but I am not sure.

Yours,
Linus Walleij
