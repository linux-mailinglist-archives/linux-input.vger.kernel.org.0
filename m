Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C148607923
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 16:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231160AbiJUOD0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 10:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbiJUODY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 10:03:24 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FB52623CB
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 07:03:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g27so6187364edf.11
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e4/zlDCiFydUZhpt9gh0E4NhI6chAPmhTcosMEF+OzM=;
        b=EA/AzvaxWm14qHukoIs7XWKrP5UVXQt5Q30jRrBEdmRny4SLZkomO8kudk/2+8CXVQ
         O09q4ddxiaoi0gu1leAdIWFFI6AHKXYjSiZIT35xnImNKxtSs4vMDYoJcIN3IHriMxkK
         qmv0JdsybfoF4LB5St2MK7pec6+bNkrctt1H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4/zlDCiFydUZhpt9gh0E4NhI6chAPmhTcosMEF+OzM=;
        b=SZtoBNYbqIjd1h3fweQo9kOta1xS9PAgACXKer/OhR0YGSek8IlAzhq0uFideNcN5T
         ixAZNOfvqLBnKrUtm5/+G3gQKUeh3pms9cfSv70LkFbPuqBiik3WbwqjW33KBkxYUOOP
         u/uSEzpSl5KUtneu4EYbFC+PGy06LJQiq0TcI/35NI2UYJv19XYYw96eUe4ipK9ALc/M
         uVxV03+ox4dm4HtXalPcSMi1SZzvg9VcG8Wg7JaI/bpqM6BMeGpem9gOjsRVmzPS1yfY
         y6aJXauP5+Dsomoih+j+a5gb9ylQArxbwVlnEfliQm8HChvXNJO60KxhAG/gkI6NZWfx
         JMig==
X-Gm-Message-State: ACrzQf3W1N82C9evuph/MH0x9pAZs9FcYx8B7UnO5MW9EwUfdyl20snq
        XoaK3aCeWmSS1EHz7gqfJp1A/5LmbzbE6d71
X-Google-Smtp-Source: AMsMyM7OpKqupDR0Qc4zND9scB9vgwqIs2E4xEGQBgzuIJ1EsyJZay8MZukj1FHPvXNkGXacSIvJ3g==
X-Received: by 2002:a17:907:2bcf:b0:79d:e8e6:d579 with SMTP id gv15-20020a1709072bcf00b0079de8e6d579mr992154ejc.563.1666361001301;
        Fri, 21 Oct 2022 07:03:21 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906219100b0073d81b0882asm9980347eju.7.2022.10.21.07.03.20
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 07:03:20 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id a10so4497262wrm.12
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 07:03:20 -0700 (PDT)
X-Received: by 2002:a5d:6488:0:b0:22b:3b0b:5e72 with SMTP id
 o8-20020a5d6488000000b0022b3b0b5e72mr12746260wri.138.1666360989224; Fri, 21
 Oct 2022 07:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221021105623.3520859-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221021105623.3520859-2-sheng-liang.pan@quanta.corp-partner.google.com>
In-Reply-To: <20221021105623.3520859-2-sheng-liang.pan@quanta.corp-partner.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 21 Oct 2022 07:02:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-x9Z5+gX5JZVDXVo1ir6F-iO8OQX6ZQDQV-SsxTSeww@mail.gmail.com>
Message-ID: <CAD=FV=U-x9Z5+gX5JZVDXVo1ir6F-iO8OQX6ZQDQV-SsxTSeww@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] dt-bindings: input: touchscreen: Add goodix
 GT7986U touchscreen chip
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Oct 21, 2022 at 3:56 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Add an goodix touch screen chip GT7986U.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v7:
> - goodix gt7986 dt bindings added in v7
>
>  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Dmitry already landed this as commit a01aca4b0517 ("dt-bindings:
input: touchscreen: Add compatible for Goodix GT7986U chip").

No need to re-send your series, but if you happen to need a v9 you
should drop this patch from the series.

-Doug
