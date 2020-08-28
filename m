Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9AE255C89
	for <lists+linux-input@lfdr.de>; Fri, 28 Aug 2020 16:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgH1OcU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Aug 2020 10:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgH1OcP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Aug 2020 10:32:15 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8186EC061264
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i10so1569857ljn.2
        for <linux-input@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=IXeEjsjDMU8OHqYlJ0p8rDf4WgvfOfbeZYG1fmksYO7VBPareOmDTBDBpJfLu2f4Mo
         oc5Qx/kRjst3CdFtvOjdIsdvwAPlR01NAKq2ZLg9Cf9Jcr/yk4fT6QHA2POLXvJjElqK
         4rlzpaVgAadANBaLSYZqeuj1JdC/A2vnjVb+5nOK8cQN0Sptd2OUBdZK8CHIYtGh+PWj
         aWYjoQQuUTLUwr2wTHzH8etMU6LEC6XUu414lYInENZPAWDAWJtSMHLUvvwCiBxYDI5L
         +mJHbZIhZBpuwqrxyq0MBlWEdp+B+UtBmlAR7AAdUpkOXyQTTgO5odt6FNXZhOLQMs1A
         +Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=II0YGiBfXdNNuAxTtGq2NNtXTntdMSmtvfnXnq+PA6aldsppptT5hPKp4GZ1R2O1jM
         GN2dQR+dMGa+gLVN64kpepeYSh5yh818pQf4JO+7VT7N7bnm/2gWW2LLi2/IgfEBFMCN
         zUor1WXosJoDLibMoDNb/1XRiBUM4lYMFBHkhf+rswSOAJETTWJpwQ1fu9tfF8E7UW+2
         bjf5BWFam30fZyYRgehB+QXZ+MqOHz+cXVt/7VDqrsDHDE0CHrkUHCKsQm0EtWAu40bL
         sDprwcSHV2hmboxZ4Bec+G2OeuES+VoNB1q+yYzeQAnrdZPT94pKhU4UbGfJDR7dUZ1G
         gdzQ==
X-Gm-Message-State: AOAM532C2xA5oM5vLtIQv9KZUT+iafudyd/2Vb+mGRt3rciRF9DlA/RB
        PkeWYUMMm1R5FCGomCqgVR6ZN9QVmrL/f/c5lE56YQ==
X-Google-Smtp-Source: ABdhPJxyQbKAxlRRRvc2vRtyWbyMbMoH5z28IQ9c6tGUgZBDV3PTLB/tba5Nu2XqbmrEWhyYyf5fprRmxxYMiT4YEWI=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr1062954ljb.283.1598625133997;
 Fri, 28 Aug 2020 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-27-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-27-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:32:03 +0200
Message-ID: <CACRpkdZQZ+ANpMmwFUbTxQ9=EZEXZkr7Z3DLbica=Q09bmntBQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] Input: bu21013_ts - Use local 'client->dev'
 variable in probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> 'dev' is shorter and simpler than '&client->dev' and in few cases it
> allows to skip line wrapping. Probe function uses '&client->dev' a lot,
> so this improves readability slightly.
>
> Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
