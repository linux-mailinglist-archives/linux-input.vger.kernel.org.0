Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4E434356E
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhCUWkt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhCUWkd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:40:33 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC15BC061574;
        Sun, 21 Mar 2021 15:40:32 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v186so7410477pgv.7;
        Sun, 21 Mar 2021 15:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kcVQnKMPrAVA83+GkD2fxL77wzY7stxZZy7JEffOnUM=;
        b=iYQD9AixIHTIFzlwhnC7Y1WQI6bE+fG8Z2QGrPuF3yQTbHAln166+YId22ZlUPxqCK
         oXNvhUexcbNsIhXl+dOUo3Zfomu9bSG678VidNoeIt5rZw5ZT4NC6wH3RDNi8NnApRLk
         0icQad4xiOn7zxfBCM/EV54YL8sYsQQTMlsYhvqlfmNwyd1o0galwtG+6kU4jleV257b
         yJ55xcMZpliCGixsBHQFd9P6XKolEj7dEtQZjSStalaoxv/t7PPMpSH6+NhTaSwGAmwq
         aHuiA18D8On2BbnYqzkzLXyy0JdW2twUzC1USI/2sWnMhaLBQGkRA1KzhwiD4yV1440E
         hLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kcVQnKMPrAVA83+GkD2fxL77wzY7stxZZy7JEffOnUM=;
        b=mGJi+YqFxSQtBrvTcBcnGAzCyzs+Ua2d+76bKMqdtWbkfakS9BfKI1eOjnj3IuPo65
         fLkfrCNDk77M/gmrHTkRty8CEB16K0ECQzJu2X02SSNH3Inm8UruoZ90OHJ0SN69VbJo
         8eUjZEom1Nu5giNonmXg02o5Vy3QVHFlkOFPAc2+hvk51kHJeYY7l5Q6nOOeRFf5PKO4
         jyxgAZZtMtYmBl2Q4L+H5dfz6Q7pJdqSOjQyfEIKapkkyXOaVPk/Ho/nh8jl9JyZ4pZ1
         doPUQnIZS3sSxU/AdrBeslLM6PfykJVJ/pTOxjOJG1pm0p0dyPoQn0ECB2JKmWVWnfVA
         wWsg==
X-Gm-Message-State: AOAM533O13nAvhK7v8R3I8NEEpCyUDw5LJuSjYLEvpQsYs9fis0uIV6b
        bQBw5JJxa/gCJ7o1uC/E8qs=
X-Google-Smtp-Source: ABdhPJzUerbZ3fsp5gfgJJaIy/8a0sEaKcwWON2XDPd+0ac9B3c63BRC8/mkfD/EWIOVwxU6M4VDXQ==
X-Received: by 2002:a63:fe56:: with SMTP id x22mr2250196pgj.329.1616366432244;
        Sun, 21 Mar 2021 15:40:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id o134sm11729132pfd.113.2021.03.21.15.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:40:31 -0700 (PDT)
Date:   Sun, 21 Mar 2021 15:40:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] ARM: tegra: acer-a500: Add atmel,wakeup-method
 property
Message-ID: <YFfLXLDIuRdj2bWs@google.com>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302102158.10533-4-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 02, 2021 at 01:21:58PM +0300, Dmitry Osipenko wrote:
> Acer A500 uses Atmel Maxtouch 1386 touchscreen controller. This controller
> has WAKE line which could be connected to I2C clock lane, dedicated GPIO
> or fixed to HIGH level. Controller wakes up from a deep sleep when WAKE
> line is asserted low. Acer A500 has WAKE line connected to I2C clock and
> Linux device driver doesn't work property without knowing what wakeup
> method is used by h/w.
> 
> Add atmel,wakeup-method property to the touchscreen node.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
