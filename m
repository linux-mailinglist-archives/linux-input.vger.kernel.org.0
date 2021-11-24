Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5C545C93C
	for <lists+linux-input@lfdr.de>; Wed, 24 Nov 2021 16:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346942AbhKXP5K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Nov 2021 10:57:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346910AbhKXP5K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Nov 2021 10:57:10 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 734D2C06173E
        for <linux-input@vger.kernel.org>; Wed, 24 Nov 2021 07:54:00 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so5891014wme.0
        for <linux-input@vger.kernel.org>; Wed, 24 Nov 2021 07:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eaC+aKUbi8/HkerX1h9TN1jJ5dyc1OgjJ03DE7ihVeE=;
        b=khsoD/AXPGheSlqw/XmU9zZUV9GQXZxsCxruLXYwF5XBfm62jw68XiEimtWYgix7Dm
         p8HTMKmjYGLF/VIpJusTlReo8X9Gg0ok12oBkYbgaf/738Dp4uRc1MwRuNH3bOy0FeAb
         cEv+ggEOfJdkrrkPhphgrMRhDf5EIzNd9HKl8N3Ai39D85tbT4KR7VH1FaWXvnx80eBu
         t97TilsBLPIwX8VGWox35oMmglF6yY3IueGZTxNNDZCjheEiQ8vm5/xkGfu2oOT50ECH
         J22fFpwR+3JQCx4Lbg3iLeQl/L+MplPZWaKuaAZLRsuU5LLdQ793A9lh7Y+DTfKz9f3t
         k31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eaC+aKUbi8/HkerX1h9TN1jJ5dyc1OgjJ03DE7ihVeE=;
        b=5qm6BTt92JrrvjJ679PMEUugh7LNlTqagrUHehW3wqXqGLWk9Ipc+MeMlE+o8WN5kr
         p/k1accOmLx0U92Ys36WS5Kj7rYgUIOCiDKUxlCAZsZuS9UJmeUGeg3pelbXncE5h/Y4
         jzy7nre5kUtolRMXynt28qIm5eeM2TBJIdZVzvmQrAfIG+C+TjRA2H6AGNkG4r0B9M/g
         m4UMEQpQX7UElC3xeiorKO9j02MiJ9JP0MVCTRgNIyYH4/3HJpv4sA5LMuL7tC+UyYX/
         vwlFy14uYCdYwYgLhDVAH7hWVbnhgcr5Ga7v0bBExvF00FVPcG82035QbFKzfUj0DOJa
         Sqyw==
X-Gm-Message-State: AOAM530LszJwboCQvwknnSKG7x99pjxNUeLaKyuk2mKRH5JpfNYcrR0F
        AuIriOHDyC+h123bw7RB2FXu3UhLJbPLBA==
X-Google-Smtp-Source: ABdhPJxZ7kfHnikIP8xAV2AYB9r4JSjXUZZ4mcZKkK0OwW7XCj1SGkLVIJ/75Ywqtv8Pa0s9H+55sw==
X-Received: by 2002:a05:600c:2246:: with SMTP id a6mr16169424wmm.5.1637769238950;
        Wed, 24 Nov 2021 07:53:58 -0800 (PST)
Received: from google.com ([2.31.167.61])
        by smtp.gmail.com with ESMTPSA id t8sm102076wmq.32.2021.11.24.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 07:53:58 -0800 (PST)
Date:   Wed, 24 Nov 2021 15:53:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RESEND PATCH 0/6] input: touchscreen: am335x: fix and
 improvements
Message-ID: <YZ5gCoaHv3Y/wHIk@google.com>
References: <20211107112236.7969-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 07 Nov 2021, Dario Binacchi wrote:

> 
> This series grew out of a touchscreen validation activity on a custom
> board. Oscilloscope measurements and driver source analysis led to these
> patches.
> 
> Added Rob Herring 'Acked-by' tag to commit "dt-bindings: input:
> ti-tsc-adc: fix tsc node example".
> 
> 
> 
> Dario Binacchi (6):
>   input: ti_am335x_tsc: set ADCREFM for X configuration
>   input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
>   input: ti_am335x_tsc: lower the X and Y sampling time
>   dt-bindings: input: ti-tsc-adc: fix tsc node example
>   mfd: ti_am335x_tscadc: fix reading a tsc property from DT
>   mfd: ti_am335x_tscadc: drop the CNTRLREG_8WIRE macro
> 
>  .../bindings/input/touchscreen/ti-tsc-adc.txt  |  2 +-
>  drivers/input/touchscreen/ti_am335x_tsc.c      | 18 +++++++++++++-----
>  drivers/mfd/ti_am335x_tscadc.c                 |  7 ++++++-
>  include/linux/mfd/ti_am335x_tscadc.h           |  1 -
>  4 files changed, 20 insertions(+), 8 deletions(-)

You're going to need to rebase this set onto v5.16-rc1.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
