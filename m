Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6926479E5
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 00:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiLHXYB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 18:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiLHXXR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 18:23:17 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25646ACC9
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 15:22:08 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id n188so1192039iof.8
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 15:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbpMQ63Zd0ddTl917YQAEJDL2fT9g2XYtpQwPSl/m6E=;
        b=oZjo3h0jiJm+5LuEJLHVzKLTtbsfV4Yuzhhxd/0ah+FUxmwHzdKXsVKAZkW+Pt1cP7
         bZJht87h69mLBsd1Tr8S5xNbfe5pJ8QSZtXBGHnH6b9s6QFQmWTOdTfyGBDZxslciDBi
         xOg+nIOw+X5W+tU+P2FkZ0ukmTYoQuwun0OgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbpMQ63Zd0ddTl917YQAEJDL2fT9g2XYtpQwPSl/m6E=;
        b=RkU15yVhK/JiAjag045v4OLehNjmdC4FCleBw7F4vpwJlQMVOgfa4UOtrwh48BGx27
         036v+lbuSGX1PLytk59sjQigk2knjAe0Pp6deSWDgpkl9qUzs8JWe9B2/eyajiMuwClp
         e7GXoOdd6qnJJYHpL4X9PFKOim2Q6LwDIODV5WTV4+OI28GgkGYZNF8TrqlcC1sPmnTd
         yluZSm+vWFi55riHZzF53FFXWkJaGPBievyzV51yujeCFfs1UEAUTfcrDaPuzgmu6jr6
         3NJ2adtrG0HKE+oHVmSs8YN31ZCJ0paJD4iWtLa1JppRpvoCtFVZ1zn8WHVhf7Hu44Du
         gUxg==
X-Gm-Message-State: ANoB5plUdjX/r3QQyUyJ4P3Xo3e7NjdPfLYNfaIPlBLqjFqnN9mQvXIX
        4iOSkxXHBCtWV3wjaIprDwfiKQ==
X-Google-Smtp-Source: AA0mqf7R4a0/39caWEYz1Aqubo3foxnMQIfA4QfNcQ9VQeaAtG5do3746c/qrqrZlXYDXMfVE8x12A==
X-Received: by 2002:a5d:8593:0:b0:6bc:d712:8bbc with SMTP id f19-20020a5d8593000000b006bcd7128bbcmr2168029ioj.4.1670541728078;
        Thu, 08 Dec 2022 15:22:08 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id o7-20020a0566022e0700b006a49722dc6dsm7371iow.11.2022.12.08.15.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 15:22:07 -0800 (PST)
Date:   Thu, 8 Dec 2022 23:22:07 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sc7180: Bump up trogdor ts_reset_l
 drive strength
Message-ID: <Y5Jxn01EzEZ8fE1G@google.com>
References: <20221208192006.1070898-1-dianders@chromium.org>
 <20221208111910.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208111910.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 08, 2022 at 11:20:02AM -0800, Douglas Anderson wrote:
> On at least one board (pazquel360) the reset line for the touchscreen
> was scoped and found to take almost 2 ms to fall when we drove it
> low. This wasn't great because the Linux driver for the touchscreen
> (the elants_i2c driver) thinks it can do a 500 us reset pulse. If we
> bump the drive strength to 8 mA then the reset line went down in ~421
> us.
> 
> NOTE: we could apply this fix just for pazquel360, but:
> * Probably other trogdor devices have similar timings and it's just
>   that nobody has noticed it before.
> * There are other trogdor boards using the same elan driver that tries
>   to do 500 us reset pulses.
> * Bumping the drive strength to 8mA across the board won't hurt. This
>   isn't a high speed signal or anything.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
