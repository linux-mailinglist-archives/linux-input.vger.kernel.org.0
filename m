Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A7CC7A11F6
	for <lists+linux-input@lfdr.de>; Fri, 15 Sep 2023 01:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjINXnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Sep 2023 19:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjINXnJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Sep 2023 19:43:09 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772F8269D
        for <linux-input@vger.kernel.org>; Thu, 14 Sep 2023 16:43:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99bdcade7fbso196122366b.1
        for <linux-input@vger.kernel.org>; Thu, 14 Sep 2023 16:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694734981; x=1695339781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
        b=DjfdP2fDy33pXGkF8w8hzVoBxQ784Goq5gZH/8csHrwMP/lJzY0/rFVCkvz5P03Juu
         rLyh0gQmDE6O1Fn2Sqdgjnf+k1tqBy4tbKhedLL5ZfTzEMFmvlc1NY7y6CMtKG7VkZKX
         JbEK3g/UPh2MjAdXeypR3OAkkvLibsXgImDWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694734981; x=1695339781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ffsw5m1PXl5CYPaF5hVOzi1zPkWams0dilWKJC5stN8=;
        b=EZggA0O4xRu48BtdwOsoBcql3HyMANPag5mqXb3ZKN3oBfDAoJAYc5TgP//XvNnC+p
         /ghwsoHon6QwRGNW5Q6D2LtBQ003ztbilcYWbVziPt9gTo5+hTcP0anXonw3QCErAIYz
         4ubBEoq/lwtN5obkke9E/bK/bizvHuOuHslRfSv826VfaXd/MtC4IoEa6qtkIz5Ejn23
         yPG/2Tss903dLSeNsS9J9PhXa8eB2aiQZo8PqQj+TTyKkwJEoyO1tn30uSzL+aB40MIx
         2Zz4R0NMyAYJ3Jrv2ENw6wMwMmDEp9x49T/O5fq7LaOxxgiupr/18DSvJ8AErheHEDCY
         u4LA==
X-Gm-Message-State: AOJu0YwtaQuHO7IKYbvCYu4pkJ7mC+cgn77CHlaMzWLJKa0RXqJrT41h
        VqkcPlNGUFivd/keTTOyoJPD0oGJWc6hmpECaQEUYw==
X-Google-Smtp-Source: AGHT+IELCFTSV5BMicLrrCImkJpbREv/cyq6txE5ybDS+2iPUp3MQFdR6yD+HdHL6yoWkZx21WlB2w==
X-Received: by 2002:a17:906:51c2:b0:9a1:c659:7c62 with SMTP id v2-20020a17090651c200b009a1c6597c62mr6101398ejk.66.1694734981053;
        Thu, 14 Sep 2023 16:43:01 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id s14-20020a170906c30e00b009937e7c4e54sm1629658ejz.39.2023.09.14.16.42.59
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 16:43:00 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4047c6ec21dso1325e9.0
        for <linux-input@vger.kernel.org>; Thu, 14 Sep 2023 16:42:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1daa:b0:3fe:f32f:c57f with SMTP id
 p42-20020a05600c1daa00b003fef32fc57fmr70422wms.0.1694734979632; Thu, 14 Sep
 2023 16:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230727171750.633410-1-dianders@chromium.org> <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
In-Reply-To: <20230727101636.v4.11.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Sep 2023 16:42:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Message-ID: <CAD=FV=Ued9suf95ub1-rftO2Ffx_Rwv7XvAf7yX-s7djO889+Q@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sc7180: Link trogdor
 touchscreens to the panels
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     linux-arm-msm@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        hsinyi@google.com, Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jul 27, 2023 at 10:19=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> Let's provide the proper link from the touchscreen to the panel on
> trogdor devices where the touchscreen support it. This allows the OS
> to power sequence the touchscreen more properly.
>
> For the most part, this is just expected to marginally improve power
> consumption while the screen is off. However, in at least one trogdor
> model (wormdingler) it's suspected that this will fix some behavorial
> corner cases when the panel power cycles (like for a modeset) without
> the touchscreen power cycling.
>
> NOTE: some trogdor variants use touchscreens that don't (yet) support
> linking the touchscreen and the panel. Those variants are left alone.
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 1 +
>  6 files changed, 6 insertions(+)

FWIW, this old patch could land any time. All the earlier patches in
the series have landed.

-Doug
