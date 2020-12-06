Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F222D06F0
	for <lists+linux-input@lfdr.de>; Sun,  6 Dec 2020 20:42:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgLFTl6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Dec 2020 14:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgLFTl6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Dec 2020 14:41:58 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCE7EC0613D0;
        Sun,  6 Dec 2020 11:41:17 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so14938359lfe.12;
        Sun, 06 Dec 2020 11:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rELKJVdGA4Pnbvbd/Y3Htd8wmAbTPijL/zJtE+b0KgY=;
        b=t3QCvQtUTPkrSoW6q16853R0F9PGy7RF8sVzY1cReUPAJMskr8YIM2D54aGYhXfZID
         Ak2cSJuKlJkyDGG5hHC6RR2xrLQtJpCJzmK5ljw9a7MTG1DZ6dawx4qqsn3hJp6miiCz
         cAyGWLOf6CBmDrQpjd8961s+FnAPcAoDY/lVMCU+GAIiO+WGmnGPUyzk0DlOF7rvpVEC
         64aucD2dQJgWTD3sVeVWtsTbkFZa7IhKKNlMBLxD7lfz7J4LmUeB7Ykm6BkTn0PmVIuS
         XL1mAl2tbXIni0idftv72g1bmx612glsWQYcX/TMp8PGoUC0olhelHOo19hpCthcg0lv
         L3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rELKJVdGA4Pnbvbd/Y3Htd8wmAbTPijL/zJtE+b0KgY=;
        b=r/g8M41Hs3OUAcqkOFAsCA0w0Xjwd21IzjGqn7dK8kmSykOvJQPl11TcuzaXNrdARH
         0gjKve7ohFVRYQHVpZ0+giHYj9eJBoyYwuI6ZGcEIXS3NZMHR24ku3dhCZMSbxU04ptb
         ruiMpwuCFf12c72vxm57xpIZ6WArwj9llzPT4vkD21js4id1DIHTOOUPK4aRSEk2rSvS
         veCEauo2dAs+o9oFBlQMkcYtjg0qQ1uCRC91DE2zazv00iSgjM0TTv5K37DEln8hO7zX
         OxaSg5UO1Xr/Wa2nBv0KwbNg9INQjsTXpmGluG6nON3qKElpD+KXvRn0TNPKl/ebcI65
         YnYw==
X-Gm-Message-State: AOAM5329d1/AjaMkE11G2ta9ghS85O43NbFnRXuVHTk1279AxLBdzByf
        avzGW7J4ALUgko5QSSXI+ONwJLXYP54=
X-Google-Smtp-Source: ABdhPJxDeyLHX05gUmZgeFFEhJLVCLf+xWYqGeTaTdAAdUKcgT3E6Unx28PCa0tIGilYETKcTuM0+g==
X-Received: by 2002:a05:6512:3f6:: with SMTP id n22mr6456520lfq.393.1607283676148;
        Sun, 06 Dec 2020 11:41:16 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-53.dynamic.spd-mgts.ru. [109.252.192.53])
        by smtp.googlemail.com with ESMTPSA id n22sm2669020lfe.130.2020.12.06.11.41.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 11:41:15 -0800 (PST)
Subject: Re: [PATCH v1 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and wake-GPIO
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jiada Wang <jiada_wang@mentor.com>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201205053328.9535-1-digetx@gmail.com>
 <20201205053328.9535-2-digetx@gmail.com>
 <CACRpkdY+fLhUD4cpM7X96Z7XjtXBkoVDRN6pDBUk+PjrQjTxcA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <19b625bc-1e01-468d-f0cf-647b892588b5@gmail.com>
Date:   Sun, 6 Dec 2020 22:41:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdY+fLhUD4cpM7X96Z7XjtXBkoVDRN6pDBUk+PjrQjTxcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Linus,

06.12.2020 18:13, Linus Walleij пишет:
> On Sat, Dec 5, 2020 at 6:34 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> Some Atmel touchscreen controllers have a WAKE line that needs to be
>> asserted low in order to wake up controller from a deep sleep. Document
>> the wakeup methods and the wake-GPIO properties.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Looks really useful!
> 
>> +  atmel,wakeup-method:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      The WAKE line is an active-low input that is used to wake up the touch
>> +      controller from deep-sleep mode before communication with the controller
>> +      could be started. This feature used to minimize current consumption
>> +      when the controller is in deep sleep mode.
>> +
>> +      The WAKE pin can be connected in one of the following ways:
>> +       1) left permanently low
>> +       2) connected to the I2C-compatible SCL pin
>> +       3) connected to a GPIO pin on the host
>> +    enum:
>> +      - 0 # ATMEL_MXT_WAKEUP_NONE
>> +      - 1 # ATMEL_MXT_WAKEUP_I2C_SCL
>> +      - 2 # ATMEL_MXT_WAKEUP_GPIO
> 
> So you can add:
> minimum: 0
> maximum: 2
> 
> I suppose?

The min/max ranges aren't needed for the enums because the min/max are
already implied.

I skimmed through a few yamls that use enums, just to be sure, nobody
sets the min/max for a enum.

I noticed that some bindings use "default: value" for enums, perhaps it
will be good to set default=0 for this property, I'll improve it in v3.

> With that:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thank you for taking a look at the patch!
