Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350DC342E1D
	for <lists+linux-input@lfdr.de>; Sat, 20 Mar 2021 17:03:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbhCTQCu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Mar 2021 12:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhCTQCr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Mar 2021 12:02:47 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3BDC061574;
        Sat, 20 Mar 2021 09:02:47 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id f26so15675074ljp.8;
        Sat, 20 Mar 2021 09:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ckrcEbmff1iIMspLq9lx4bc/o3J3DdXAByPuLZNU9cg=;
        b=HzwIqhpBTZUgkPY3d5szguL4q6maumEY/kIcJ7ceQ5vMmlEic7jw/quc0RHxOxs0C3
         uILyid4u/gwzxEeKIPWVykAhGCEHaLPuTfqfgggE0gD694grWgrVFbcuYZ9gsdjBODQH
         HV2O2PgS9bu2u6FUKXEXyzTOwHRCW7nq9GixeI6HqEFwvT7AFu4BeOHxwivYVOaORCgg
         NnnOMumwtvUqYi8drtcJVf4Qb/byXz9KTTjaL6qvQ3Ojpif8iLWOlfFmDMHN8yA1nCpY
         X9LHEp/3LPY/FDMLjDs/HPCIFqMARvcPWpC7xvdxR9zAuWcig2f0t6C7IdNZKdMhUSgC
         LkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ckrcEbmff1iIMspLq9lx4bc/o3J3DdXAByPuLZNU9cg=;
        b=bauKiJpBFcpZEQqSLYChddlTZ+N5Bp8WSIM4PaSYVB9LGBLGNmLR3bkT5GvjNhutNU
         yT0V98nHoy3T3Da78qJQYKNmxbJU233x1Gi9tME92WdIKs7hMGaSztNQUzhHJCkazT+e
         uUfLyxcbpphrMxJqLHt0eOeeK/TIIdMDKFwD5I54zDntCDmYZAvqJ7iclURZW4PqsDn5
         3q4veHqQbRjmGqp1N6xia1E6SX+8TJQ4c6zQLnCFFh+KjPOGq8p2FcE3SF+S/TDmrUqW
         3aED0AVSOQoTu4BUueJQsy7knpO6hc0h4s/h7CsnaC6D97YwloP9qqN45PagpowqYsVq
         iIkA==
X-Gm-Message-State: AOAM533G/yXqZQ9ydpvyLItVDsZTwXJK5GwWdz3IqTnrSa+l7NRQ6OVn
        PZBUZN6NcWfPNHJAwg6+g81f24OzKi8=
X-Google-Smtp-Source: ABdhPJwfcJXcIHdsjEO62pMyNeYxKV4L0QkLYIMwtkeP29PwQ3/0ZdkIvd3fBIA8Iz+lgQ5CRgBubA==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr4408333ljk.140.1616256164712;
        Sat, 20 Mar 2021 09:02:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id q14sm964257lfd.214.2021.03.20.09.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 09:02:44 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Support wakeup methods of Atmel maXTouch
 controllers
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
References: <20210302102158.10533-1-digetx@gmail.com>
Message-ID: <8c1280f6-b79f-9c62-a064-68b119d74c49@gmail.com>
Date:   Sat, 20 Mar 2021 19:02:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210302102158.10533-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

02.03.2021 13:21, Dmitry Osipenko пишет:
> Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
> have a WAKE line that needs to be asserted in order to wake controller
> from a deep sleep, otherwise it will be unusable. This series implements
> support for the wakeup methods in accordance to the mXT1386 datasheet [1],
> see page 29 (chapter "5.8 WAKE Line").
> 
> The mXT1386 is a widely used controller found on many older Android tablet
> devices. Touchscreen on Acer A500 tablet now works properly after this
> series.
> 
> This patchset is a continuation of the work originally started by
> Jiada Wang [2].
> 
> [1] https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
> [2] https://patchwork.kernel.org/project/linux-input/list/?series=357875

Hi,

This series is very wanted by Android tablet devices from Acer, Asus and
other vendors which use Maxtouch 1386 controller. Touchscreens don't
work without the wakeup support, i.e. without this series. The wakeup
support is implemented in accordance to the datasheet and touchscreens
are working excellent using these patches.

Could you please take this series into v5.13?

Or could you please let me know what exactly needs to be improved?

Thanks in advance.
