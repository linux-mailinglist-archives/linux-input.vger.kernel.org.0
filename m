Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6102B64875E
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 18:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbiLIRKW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Dec 2022 12:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiLIRJ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Dec 2022 12:09:56 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C3E29CA8
        for <linux-input@vger.kernel.org>; Fri,  9 Dec 2022 09:09:35 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id kw15so12949009ejc.10
        for <linux-input@vger.kernel.org>; Fri, 09 Dec 2022 09:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NXbFEB1xKk4N48FcslTMhY6JVh3nMLyk4J4qoIMRvnE=;
        b=nUmD78MQ7NnK3IqCVJDUrdNthqq8xbLAX87n4IQsS384SzBm/UB+io7PLK0DDRodk5
         z7o04SMoI/orbl8rDMTFvF6SuE574vHt4H2xj02QeYta2t/AzsrIeRZ8UKjyXS2DKdsQ
         ANcCzBzXauN0otQHC6aH2BnFLuAGVKDZpXmAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXbFEB1xKk4N48FcslTMhY6JVh3nMLyk4J4qoIMRvnE=;
        b=X00zTmM4jTrmNGWIr7ckb5idIsggmOiQIptdzaKmeDPt6fZrL78Kr8l1D/zm6wLNv7
         XaPzkD4YPwVTl9YvnQYPy3DVraZarMsNONp02Nt4ld1ZheijZB5nO3lA7jg1g5DqtNQx
         1C59wSijIy0opSKJptqqnHYfVEfJPzdk/0bALwRQBS5ym8nWwCjyaKA0XkXb2p1V1X3G
         L9/SYMu/KvAJlfD2ZcjYsWV6O308w6ggWQJY7IjosEhv7rLbYII9Yr4MUtc2TLUxM76k
         B77Y2NSgAGQpb/Cq4TuWEkDsdEynGoSU9M86oi8/n/ZtXcdVjctKE5KPL6zFzSvyo0fk
         iZeA==
X-Gm-Message-State: ANoB5pkzsuMAba29lk0bA/nv7u4LXLgs1pTdnQoO7kekq093YWeA39wo
        naK00EHJB++G2y6ANyRHnjMyxRmqosEoC13QQwQ=
X-Google-Smtp-Source: AA0mqf52c4QpFebkWjSeAv6fp2LdlHftyBbGcIC1RTQGYMqnnajS3zYelGDbh4bACsr9tvt3QDbLbg==
X-Received: by 2002:a17:906:a3c1:b0:78d:f454:3889 with SMTP id ca1-20020a170906a3c100b0078df4543889mr5814166ejb.70.1670605774069;
        Fri, 09 Dec 2022 09:09:34 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id kv4-20020a17090778c400b007c0b530f3cfsm132463ejc.72.2022.12.09.09.09.31
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 09:09:32 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id d1so5818533wrs.12
        for <linux-input@vger.kernel.org>; Fri, 09 Dec 2022 09:09:31 -0800 (PST)
X-Received: by 2002:a5d:4943:0:b0:242:3ca3:b7bd with SMTP id
 r3-20020a5d4943000000b002423ca3b7bdmr18075619wrs.583.1670605771352; Fri, 09
 Dec 2022 09:09:31 -0800 (PST)
MIME-Version: 1.0
References: <20221209020612.1303267-1-dianders@chromium.org> <20221208180603.v2.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
In-Reply-To: <20221208180603.v2.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Dec 2022 09:09:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WnjpOSvQ88gQJDJ5HFipBU5K5JRApRjZ0QYhi9AkYOTQ@mail.gmail.com>
Message-ID: <CAD=FV=WnjpOSvQ88gQJDJ5HFipBU5K5JRApRjZ0QYhi9AkYOTQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sc7180: Add pazquel360 touschreen
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, mka@chromium.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Dec 8, 2022 at 6:06 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The touchscreen was supposed to have been added when pazquel360 first
> was added upstream but was missed. Add it now.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> (no changes since v1)
>
>  .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> index 5702325d0c7b..54b89def8402 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
> @@ -14,6 +14,27 @@ &alc5682 {
>         realtek,dmic-clk-rate-hz = <2048000>;
>  };
>
> +ap_ts_pen_1v8: &i2c4 {
> +       status = "okay";
> +       clock-frequency = <400000>;
> +
> +       ap_ts: touchscreen@10 {
> +               compatible = "elan,ekth3915", "elan,ekth3500";
> +               reg = <0x10>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
> +
> +               interrupt-parent = <&tlmm>;
> +               interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
> +
> +               hid-descr-addr = <0x0001>;

I happened to re-read this and did a facepalm here. The
'hid-descr-addr' doesn't belong here at all (it's for a totally
different type of touchscreen), but it was there in our downstream
branch (incorrectly) and I just copied it over. I even had noticed it
before, but forgot it yesterday when posting this series.

Just to get things out of the way, I'll post a v3 now. Sorry for the noise.

-Doug
