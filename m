Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD6D65F6E75
	for <lists+linux-input@lfdr.de>; Thu,  6 Oct 2022 21:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiJFTxz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Oct 2022 15:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232116AbiJFTxv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Oct 2022 15:53:51 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9437EA879E
        for <linux-input@vger.kernel.org>; Thu,  6 Oct 2022 12:53:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id r17so6922557eja.7
        for <linux-input@vger.kernel.org>; Thu, 06 Oct 2022 12:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=unYkvJmsfR6dlOs+zRhOM60bKQNMvgN70UTbGzDFpNU=;
        b=XeRAWTD6REI3lmaLtlo7kvbRO5Y+EtS7cdn5tS9g95rBJG5rQqfSBch83/nVdYjZkI
         Z3H7ACRje5Os8DEpv8TmdNlDV9seyAAZlw8sjHyy04jQUv1y/T1Do2nlPr2GYG+B2/fk
         KBnLAtljSS4ih0sW8CXqu5SZSCAMRrdAlVv4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unYkvJmsfR6dlOs+zRhOM60bKQNMvgN70UTbGzDFpNU=;
        b=ToQWJhbjMkyNZ1bzKhDzgevhbkAbtFmzQFStRy4gCXfJaVUGdlQADCrX0h85e5H3cD
         TVyTNLS0hLSZFcucNnqIBpkDMf3rOINg4UVQI5afB68+Q9BFk/kTurWeGaVIfEdwSsnV
         g8+81jWgOLDt03JTWbPZdESlL5YRaANDhSNvwvS0Ze9OVPlkgNK7v4rMKpUAJF5B4P8D
         qwx5qRFMh3+8awdXl8eHIYokz4bP2Q/Pbs0RyupVicAn4azNrTwiXaOeEKJxMBsS9JS2
         le3Z9ltewdDtXpdy5UaWf7+XsF20nKB1fSf43LhZQRKpZUfu8M/QKVvWVzi/Dfk23job
         nWLQ==
X-Gm-Message-State: ACrzQf0vOafUFZn9/NZ2VdUqh0W9UaR+GQ9UcvlFpPvVqVzFBz40V+47
        zeDsO51LBWMWX7J3/zLKY4K0XmClwFJJKwP/
X-Google-Smtp-Source: AMsMyM4QFR0m13AUKT6WNVNu3sMvo1MfLeZcSSZXC44J+BUswRWUEuQeq85ZrrRNDd1AY86ZMMvQlQ==
X-Received: by 2002:a17:907:5c2:b0:77e:def7:65d8 with SMTP id wg2-20020a17090705c200b0077edef765d8mr1253255ejb.487.1665086026424;
        Thu, 06 Oct 2022 12:53:46 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id n2-20020aa7db42000000b0044e7862ab3fsm87844edt.7.2022.10.06.12.53.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 12:53:45 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u10so4279357wrq.2
        for <linux-input@vger.kernel.org>; Thu, 06 Oct 2022 12:53:44 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr997558wrr.583.1665086024696; Thu, 06
 Oct 2022 12:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221006105823.532336-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221006185333.v7.3.I52e4b4b20e2eb0ae20f2a9bb198aa6410f04cf16@changeid>
In-Reply-To: <20221006185333.v7.3.I52e4b4b20e2eb0ae20f2a9bb198aa6410f04cf16@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 6 Oct 2022 12:53:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xe0x6pQ+Uq5Vo7cqvS0+O8qpwUwO-e6fWhSyFvdF-_Fg@mail.gmail.com>
Message-ID: <CAD=FV=Xe0x6pQ+Uq5Vo7cqvS0+O8qpwUwO-e6fWhSyFvdF-_Fg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] dt-bindings: input: touchscreen: Add goodix
 GT7986U touchscreen chip
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Oct 6, 2022 at 3:58 AM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> Add an goodix touch screen chip GT7986U.

In theory you could beef up the commit message explaining that GT7986U
is expected to be fully compatible with a driver written for GT7375P,
but I wouldn't spin just for that.


> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
>
> Changes in v7:
> - goodix gt7986 dt bindings added in v7
>
>  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> index fe1c5016f7f31..1c191bc5a1782 100644
> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> @@ -16,8 +16,11 @@ description:
>
>  properties:
>    compatible:
> -    items:
> +    oneOf:
>        - const: goodix,gt7375p
> +      - items:
> +          - const: goodix,gt7986u
> +          - const: goodix,gt7375p

I haven't run this through schema validation, but from a visual
inspection it looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
