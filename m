Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2962E39B3E4
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 09:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhFDHcq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 03:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhFDHcq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Jun 2021 03:32:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C6FC06174A
        for <linux-input@vger.kernel.org>; Fri,  4 Jun 2021 00:30:46 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id d2so6200803ljj.11
        for <linux-input@vger.kernel.org>; Fri, 04 Jun 2021 00:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZr8jgm34p9ETGtBFysNOPM5B3RJwjxp8XPNUWrmeII=;
        b=asinqHupqJSk8yrmxWFMRFGpKhsAc5mL2dod9IeAxLAtYx3jBovWnObrHekW7WtZdz
         coKx84Y77Dje7MQgBMXYa+BtHxQFmxNiGvt8yHP1Q45DwuQqxF9ICgw5Pcz0TKELu8TS
         Jwo0vdRQIG1AuOg0jNylKyf3P0aanVkxF9OsKTv/qxo+L4LWPmxkbd14t22TgBgR0vMH
         GT7dS2QMt9g8lNx13nRP7JNDrm2mYRy7PvtObSCDFip8Qg2m2+bV8j4lgsQ5j8N8R8uh
         Ek3E0M+L2Stw1ELyLeLHYkvxypKj5X9iXzDEJg4W6SzOfdhTGVs23L2dBECT+0wcAmba
         wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZr8jgm34p9ETGtBFysNOPM5B3RJwjxp8XPNUWrmeII=;
        b=ryvzEvvCv/JG3w6nq/W1hwvvruj2UHwdQ82VghCWeLJ5wz/5XsOTbsFCFSZLP9dq2J
         zwZri+D2h2KOR/ZuV2/INHfLqK04LmmTmov+hW+K3cawXZEfnhnrwkfuYLOSXkYgnShj
         JEXBWRf8Ak51VwWo4I37ixxnbH3dYeby4+fntiASPlUgEYQLq3VUFFx2QpqXfLG5qbhi
         75N4ANFMZHAqlTNFqxYv4PvZqrJR85gEV9ncyXNz8gdVOvvFVEn39ewx9rhX9KyrEWFs
         Sldh3RAq0u+43Mvo7hftlOHLXq+RSOhk2NVOQNV+DY+cCb1559ZXDkFqf7BqeP5DxhcE
         xnYg==
X-Gm-Message-State: AOAM533LMWgVcSknoW6AIAQXgjoIBZ9g83pDl4TTD0j5T63JGqXDEjga
        5IRIUOB6bQI6XftgqnEuzvFPsCmSjrURXPZqEVDPgQ==
X-Google-Smtp-Source: ABdhPJwHbDhon5irujLUGv5DiJtxz7mkeuhyP2cA8YfJFvDCcowwNCw+Y4ZZ87a0DCRU9XDjW20ZMmxHd2w6fxUmcCU=
X-Received: by 2002:a05:651c:1501:: with SMTP id e1mr2617160ljf.74.1622791845014;
 Fri, 04 Jun 2021 00:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20210603043726.3793876-1-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:30:34 +0200
Message-ID: <CACRpkdZ=Ht-0aYaKR4MvZMGHVhQzS6034TQS7c1iZD1LbVPx7Q@mail.gmail.com>
Subject: Re: [PATCH 1/7] Input: cy8ctmg110_ts - rely on platform code to
 supply interrupt
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

I see you noticed that there is no upstream board defining
any cy8ctmg110_pdata, so I don't see any problem with
fixing this. Outoftree users can adopt.

On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Instead of using platform data to specify GPIO that is used as interrupt
> source, rely on the platform and I2C core to set it up properly.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> -       client->irq = gpio_to_irq(ts->irq_pin);

This looks like a violation of the struct anyway....

Yours,
Linus Walleij
