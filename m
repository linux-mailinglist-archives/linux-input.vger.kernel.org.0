Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDFD9422F5B
	for <lists+linux-input@lfdr.de>; Tue,  5 Oct 2021 19:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhJERuv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Oct 2021 13:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233671AbhJERut (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Oct 2021 13:50:49 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD104C06174E
        for <linux-input@vger.kernel.org>; Tue,  5 Oct 2021 10:48:56 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id m21so30676pgu.13
        for <linux-input@vger.kernel.org>; Tue, 05 Oct 2021 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=aktO3MIuhcJHP+k3LRfRQCfAEj4yjVMHakhMwYPxUyc=;
        b=QvpDANPwTPG+RBR5Junq7lmP/VUC9TNjvFK3MNeIhkmx9v8aYVfLg+0EEdidHyjGjm
         CA29v46yb/d+Z0/WuM7d/qKnz9yKR/xHkvBt84vcdWoKCvYT9Et6z595FQ5OVP7fdn3X
         wQ9f7tjd75wn7N56/74i3RM0KkDl9wD2Do/eAgprwIjXAYqx3cUx5Tp5MzMnrrvvZv2d
         dR8eJ67Fub4aRUj/exIb18X2WOln+UEUUDm37uyYYTRe+uvxqKoOKtFFLUuqc90L7Amo
         +wL42QktO/JISeCqEbZcZWF8mnydqUKDuhGU3Gxy9PHI3t/m+v7D8CXHBYZ7vldCyrBh
         WyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=aktO3MIuhcJHP+k3LRfRQCfAEj4yjVMHakhMwYPxUyc=;
        b=3j77hsyRYrNhVnCcRwjksY2a4dEzo7Q97a93B8s8hz44Ec7nqh8/bD26FOewKDR656
         HPQYw2P0M1J8aPiG5M1rSBA0J7hMye9USNE0zAHS6hgmcL1TvZrWlv1HmeMp8/B9exJe
         ooaql0bJf6ovPxFFRJqq1yd3/P5/a50ofkF/+RGEdluJNYI6IzOZCcH6VzOm2KiKRWts
         jyok2Hws7n3HQVbXg94EbJF0IQmtWNT4tMw6J4Ji2iSoo7gLqOcM+G7UF5r0LZ+3p9n+
         Nj5/HqACUwe//MMDdvx2POLxhP1bS7KiE8LwfCpLt4KC3LldO5K0IXrBcKVDuq6IqhAs
         1AXQ==
X-Gm-Message-State: AOAM530vcNNwMusbIK59tc1VPgKtYcqDQGfpjb2sh3KbRrBFyI28hAWx
        kRXyfu+BvUMsSUP3C3PT5ratYg==
X-Google-Smtp-Source: ABdhPJz14fGlL05m3Fy56TnqEoOeVrCd12a7yJvSfZr0dfQS9I2/IAbCln5+fu3/sysX6iIiPHGIGw==
X-Received: by 2002:a65:6251:: with SMTP id q17mr16983553pgv.416.1633456136220;
        Tue, 05 Oct 2021 10:48:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id 12sm2150475pfz.133.2021.10.05.10.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 10:48:55 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
In-Reply-To: <7h4kan7ytq.fsf@baylibre.com>
References: <20210816100013.100412-1-mkorpershoek@baylibre.com>
 <7h4kan7ytq.fsf@baylibre.com>
Date:   Tue, 05 Oct 2021 10:48:55 -0700
Message-ID: <7hbl43fjlk.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry,

Kevin Hilman <khilman@baylibre.com> writes:

> Hi Dmitry,
>
> Mattijs Korpershoek <mkorpershoek@baylibre.com> writes:
>
>> The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.
>>
>> The interrupt logic is a little different than other PMICs from the
>> same family:
>> for MT6323 and MT6397, we have one interrupt source per button
>> * for MT6358, we have two interrupts lines per button: the press and
>> * release interrupts are distinct sources.
>>
>> Changes since original v2 at [1]:
>> * added 4th patch with device tree enable
>> * cover letter title prefixed with 'input'
>>
>> This has been tested with evtest on mt8183-pumpkin on 5.14-rc6
>
> Any feedback on this series?
>
> The related MFD patches were merged already, so there are no out-of-tree
> dependencies.

Gentle reminder ping.

Thanks,

Kevin

