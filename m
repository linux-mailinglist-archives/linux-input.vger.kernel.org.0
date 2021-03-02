Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B092932A58E
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444935AbhCBMuy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379939AbhCBKU0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:20:26 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC16C061756;
        Tue,  2 Mar 2021 02:19:45 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id v5so30389897lft.13;
        Tue, 02 Mar 2021 02:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XIDQ+4kd/LXbhSXCzL5ECgyTEsdEXu9h18StVgaqum4=;
        b=Pf5mOk+o5dy/vp4SpSQwj77UzCFy+8S4DEJRuT96Kcu83dmmPBijPpcEf2qTcZ7Dxa
         0j169SGa2OTvzmgVuskgXtXBENmWBQyRp5/It6ErXglDCAOvCH5JwJ+mM9X43ihzIanu
         S+hIfTD/RRCCeIvxtbUp4g1haBTXHv/AM2kKB3klTmogO8lS9yEF9rRozN9W/q3yJ1V/
         EJLWaplZcyoyFEgN1W6XZ0SKjkWCXPq54AkhCh+fHSOMxiW67BkQ34+5Qj/PbAj2Bud1
         DqQwAMvXQ/CxEGi3USAlkqQGjtBBu9GIckbsHgupMMdSgIJcWo6y9Rwul43+w3PenflF
         Knfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XIDQ+4kd/LXbhSXCzL5ECgyTEsdEXu9h18StVgaqum4=;
        b=Vh3+rCoXSE2aQM+FLmDgT88jsXjVCOa3HJJiMDnvaenb9h1tmUr+Ui29dlb8srxJ5z
         f7FXf/HU7cNb+v4hhYe3l30CnfLDyOB2HU6yf0MB4rk5uv99otqU0XK6f9cZJZPprCi7
         rhGx3mI7q/f+Q2I0CkaY1z8hDAAP6SOjcWQVDwX0ydXg+oPqf97WuFGrtcpHLcq6wmhD
         Z9sUviR6oY6jeuXojfztn9ROClTCh5v7pre469xtLff/KKz7wvFk2oGHxcX/gawLnF5D
         CkWK232VoSKKkVRbke5KYw9DAybpNUoSdrXsGdOfg6Rx0PeGqZgd9DQ7LSODYiAhwO8T
         /npw==
X-Gm-Message-State: AOAM5338eY1mxrBs9lUlj/BxlWQAhfEfOuO/nzmgfYTGNMni1U8Vw7HX
        DsW8QrjO+F852DBgZFtKoNGk0mAEvLU=
X-Google-Smtp-Source: ABdhPJwqxkVhyLw4kBU7lIs0HBZspIqPWScLLdQNWfQ7VwJReaESA/CRZGn7ylwvepdXc5DDPkRJXg==
X-Received: by 2002:a05:6512:328f:: with SMTP id p15mr11991157lfe.628.1614680383939;
        Tue, 02 Mar 2021 02:19:43 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id r12sm2497133lfc.79.2021.03.02.02.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 02:19:43 -0800 (PST)
Subject: Re: [PATCH v5 1/3] dt-bindings: input: atmel_mxt_ts: Document
 atmel,wakeup-method and WAKE line GPIO
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302101556.7150-1-digetx@gmail.com>
 <20210302101556.7150-2-digetx@gmail.com>
Message-ID: <5ea216b8-cff8-9731-2d63-3611ca977381@gmail.com>
Date:   Tue, 2 Mar 2021 13:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210302101556.7150-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

02.03.2021 13:15, Dmitry Osipenko пишет:
> Some Atmel touchscreen controllers have a WAKE line that needs to be
> asserted low in order to wake up controller from a deep sleep. Document
> the wakeup methods and the new GPIO properties.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

I'll send a v6 shortly because accidentally missed to add r-b from Rob
Herring to this patch that he gave to v4.
