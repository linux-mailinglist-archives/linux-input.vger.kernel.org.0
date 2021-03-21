Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4356343572
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbhCUWoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhCUWoK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:44:10 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E1FC061574;
        Sun, 21 Mar 2021 15:44:10 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so7147978pjb.4;
        Sun, 21 Mar 2021 15:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aDmREtek2RCEuRIQg1f2SGsm7stdLPdHLwdA98L+o6k=;
        b=JR6txh+5VOXFCxn8Xa9SalOmF1Hgwz/cQYjhSip9/JXliEunqCoBH9t5XeSXY2BtFn
         osmusNfmZYWXpRKo+nioXEXRv+aYcUIJBoNoJfUvA9SVArM/7s/1FUhXu/uRmjJqweYd
         oLFdL7Zvl+wC1ZEM9kELXudZUOUQw/IsbuUMYot/L6wq4jRmbcbyNPiDlPF/bsDuRoYM
         zr2seR0tknUdHs5qr5D6PwKvAvxJq0CSnA2djhy9uDfbYm4PHjCW2wUnSwnVhh8cLjM5
         43ZlZfVerf0Z8dIz2puDczrOkWrejWcTCaGjn//OoBbhCM7fXZFPM/CGmbwGGKto5/Rf
         1G0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aDmREtek2RCEuRIQg1f2SGsm7stdLPdHLwdA98L+o6k=;
        b=suwPeE1OmcnsVu0BgeeIaATyCqoyT0WGIehxRJ+EUy1dVTwO7VL78E/OZoJF6L4GpM
         CujQkQSfZbHBcpwbnRXUu0wdQYbsAysXRJWv3HCmck7ynBRWYd9sltLrm3bGSw6uAfib
         jIikAMJHFiiBnHqfcZjIygrBeA5Rarq7kMIw2+S6Wy9KufPJ3c9Gidt0qQ8sEPKxS72L
         n1ojBZLm0KuHvFhbV00/HiPhBdMm6JAa4+VjYZ8OrbCxhOWFhfvG73mPgmIbR/p9JZLm
         mKwtsk7PlUXeAPJ8QpVQ/SSAMGegLORgfZrCOm1YHhasGrbPOChc8Z9TFGqrQktFgTem
         I72g==
X-Gm-Message-State: AOAM531QQpBEK0XD2BHG1t0c08svwzHFUZHPSQrO4QvpnUJ+gc23vDnH
        Vl337ZXIdL2wlJ2KUfnlGDY=
X-Google-Smtp-Source: ABdhPJy1yoAQSryS255LfKkbMZGuKiMTqbBulev67cOsaFjRq4fpnfUZl3is8JApwqa2Yd5DhapGsA==
X-Received: by 2002:a17:902:9786:b029:e6:508a:7b8c with SMTP id q6-20020a1709029786b02900e6508a7b8cmr24094029plp.44.1616366649521;
        Sun, 21 Mar 2021 15:44:09 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id j10sm11361412pjs.11.2021.03.21.15.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:44:08 -0700 (PDT)
Date:   Sun, 21 Mar 2021 15:44:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] Support wakeup methods of Atmel maXTouch
 controllers
Message-ID: <YFfMNQPvaNOjUwBB@google.com>
References: <20210302102158.10533-1-digetx@gmail.com>
 <8c1280f6-b79f-9c62-a064-68b119d74c49@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c1280f6-b79f-9c62-a064-68b119d74c49@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sat, Mar 20, 2021 at 07:02:43PM +0300, Dmitry Osipenko wrote:
> 02.03.2021 13:21, Dmitry Osipenko пишет:
> > Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
> > have a WAKE line that needs to be asserted in order to wake controller
> > from a deep sleep, otherwise it will be unusable. This series implements
> > support for the wakeup methods in accordance to the mXT1386 datasheet [1],
> > see page 29 (chapter "5.8 WAKE Line").
> > 
> > The mXT1386 is a widely used controller found on many older Android tablet
> > devices. Touchscreen on Acer A500 tablet now works properly after this
> > series.
> > 
> > This patchset is a continuation of the work originally started by
> > Jiada Wang [2].
> > 
> > [1] https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
> > [2] https://patchwork.kernel.org/project/linux-input/list/?series=357875
> 
> Hi,
> 
> This series is very wanted by Android tablet devices from Acer, Asus and
> other vendors which use Maxtouch 1386 controller. Touchscreens don't
> work without the wakeup support, i.e. without this series. The wakeup
> support is implemented in accordance to the datasheet and touchscreens
> are working excellent using these patches.
> 
> Could you please take this series into v5.13?
> 
> Or could you please let me know what exactly needs to be improved?

Sorry, I was still slightly unhappy that we still are not tracking the
state of controller and opportunistically retrying failed I2C transfers,
but as I am failing to find time to come up with another solution I have
just applied your series.

Thanks.

-- 
Dmitry
