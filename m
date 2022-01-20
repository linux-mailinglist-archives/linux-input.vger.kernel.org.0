Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58007494C13
	for <lists+linux-input@lfdr.de>; Thu, 20 Jan 2022 11:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbiATKus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jan 2022 05:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376403AbiATKsa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jan 2022 05:48:30 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3D1C061746
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 02:48:29 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id a21so5843264qkn.0
        for <linux-input@vger.kernel.org>; Thu, 20 Jan 2022 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Drofg5bZM2qwAB7ATZ/cfW3+3FZXwgKGVP69ItIqA10=;
        b=lSFrpwW1wuAfDYgH03cW7I7OjP1WbLut0KjRhMrnTuGvNcnMybeWIQyMH1JIx00use
         yizqAk+va/sg/eFSjqoeYOXH0HLzvW3eaS930YNZ7e5h9ip0eD9d1p3WN/CjBKya/85l
         mcfYW4HK49fyHi+z6g7gsttn0/XTRnkA0JrcbZ8vAEFMc99HRXqRBh9g54gh8kCdMIHP
         Uy/leO8tXeu8VOapVIT9ExqJ1h2JsDwxr8R0jV4kFsVzHWQZ4duKK2h5zTEq+mJc5xwY
         pwglT+eOqfCVyz7nHNeUkkpmHVf/KXR4zpWZ1F4jD8ezJL5uWmGaPXIaZhEiHCZrb0Nw
         P/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Drofg5bZM2qwAB7ATZ/cfW3+3FZXwgKGVP69ItIqA10=;
        b=CeDLRC6IHOciXL69ATtePg9BEfXcyiKvJOBVPf5E8Rt1uHnY0Luqqre2vfTCaCTM3X
         dwPrGdEvvrfwo7xXM6lVXsA3pPjJBoXyVmE2r5ScjtmEbH05aOMmTe//TDkeXaeiAALw
         bvKiEkhR/uCx+FXptHVOamupJ7nfL9JpHtH8M+YmcbH4TL5jusuTXdgTleDpL8k5rVR2
         +7Ol+wylBfbF3HCfj+XxHrfX2SCu0kOZfpnCwuaLBahXgyk7VjGNSkfhDHyQEch7e7IF
         bJaImNR8EdEyg9SH5xZR7Pk+OO4cufs7UrkZnWlkYIfaly2wK33rxUrIv3RcQ/3I+X0/
         wWTw==
X-Gm-Message-State: AOAM533+bb0h2/qFMYMdJDm92RpjreB7P73u/28Fmwu3qxMJ6GsnM91y
        TNQ/Su1TchK/D6KiAtVjfUyw2/0e7MNx8kaOLrb5EA==
X-Google-Smtp-Source: ABdhPJytHAAGxtq/qSZOpc+YupHixT4TRIrIOSLNgZfB6xUrCUXkckzmPRmlM/mOoCMvKsJgp3kOntmGDDsXWw0Jxwk=
X-Received: by 2002:a05:620a:1382:: with SMTP id k2mr18319057qki.447.1642675708891;
 Thu, 20 Jan 2022 02:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Thu, 20 Jan 2022 11:48:18 +0100
Message-ID: <CABxcv==EkNd9MrpJuyECzY1EdnWiZ_ffz8OXoTy8X76R_Ty4Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Simon Glass <sjg@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        linux-input@vger.kernel.org,
        =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[adding Enric's personal email address to Cc list]

Hello Krzysztof,

On Thu, Jan 20, 2022 at 11:40 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Enric Balletbo i Serra emails bounce:
>
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
>
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> bridge maintainers to Analogix ANX7814.
>

I'm adding Enric in case he is still interested in maintaining these
and prefers to update his email address instead.

Another option is to add an entry to the .mailmap file.

Best regards,
Javier
