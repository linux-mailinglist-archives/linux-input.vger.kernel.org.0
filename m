Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2209E712D78
	for <lists+linux-input@lfdr.de>; Fri, 26 May 2023 21:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243254AbjEZT3x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 May 2023 15:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243968AbjEZT3v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 May 2023 15:29:51 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40781B1
        for <linux-input@vger.kernel.org>; Fri, 26 May 2023 12:29:48 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2af29e51722so11727601fa.1
        for <linux-input@vger.kernel.org>; Fri, 26 May 2023 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685129387; x=1687721387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ynDYbGdsZF04vCXi/fdD62cVu/XTnLlDnsDcsQE+gU=;
        b=tDYpQbK97CNlp93ZtO102/5etvWLI+iwenW470Z0lkqaexV58qGOY4pSVIglOWqyTB
         8TyAzZMNP+h4ImdIg2nqsAaUCgEVihijTgZv0yMBb7qBO2/yG6MKKcdA1zgWzvaF1yAe
         6IE5ViHJkjV9sbrEmwYMF2aiwc/8rYpbyC260bHb9ezMHRxrF2IzyuvLf89PArkNh6K0
         OP938Mv/CoAX3H3HoE76DG01Z0DhbPmpmtsZmXn/SNLXbvoBRPILmq+jWAhNM5skk0uA
         PeYTM4idJcy/BaMqsx5GzewZK/SxbC3z8aSDltvjU0W3O/yeywDX3PsHnqWjBNIT/QSW
         40jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685129387; x=1687721387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ynDYbGdsZF04vCXi/fdD62cVu/XTnLlDnsDcsQE+gU=;
        b=lHlO7uhfbWANqap4LGgrGS+uuTbIHTqbf6PFdHI1EkgYTMNvW/8Zx3NHeT/Zp9SwDC
         Rz5YQ9L6siOEj7/O2WDskWfzDxhRhERHdnTblUclvpD2hbQqo2ZO5zs34KBfFvVOW3WQ
         nSgk9NkzNaruuIy0HrDY0LsYnipDj6dMlMz3/5JPpoKzsNJIWSj5IsDc36AjS5JRDFr3
         VrqJSOewPAV3uuWDNEOj+H9s6v5Bm7e/F6KcbleMY3qS2jhFeJvzXUGLEJU4azThW7w6
         T1XQUQt6pkRuaz4z3OBC10AxLS8HNarmWGdQvBhf7y3lkryw86ZIh+1srs1G/wAO6D0x
         c6rw==
X-Gm-Message-State: AC+VfDyVhGg4EdNl65CAuF0taY+b4rVAcAnQNmmKNXg3XTJSrQiZJAcn
        80j4WLRptWpPKnWhCCgy8PP5iA==
X-Google-Smtp-Source: ACHHUZ5oiBIQA7Cc8vvOrtzZxw/Y5yQgzUfNrym68GiY4GckllJgnoA3zmZ8t8cNnVOcuy+UbltYaw==
X-Received: by 2002:a2e:884a:0:b0:2ad:d9bd:1d2 with SMTP id z10-20020a2e884a000000b002add9bd01d2mr1012719ljj.16.1685129386991;
        Fri, 26 May 2023 12:29:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id u4-20020a2ea164000000b002a929484fa0sm862756ljl.68.2023.05.26.12.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:29:46 -0700 (PDT)
Message-ID: <0837856f-bdd5-e8b7-3a08-01244843dbd8@linaro.org>
Date:   Fri, 26 May 2023 21:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/9] drm/panel and i2c-hid: Allow panels and touchscreens
 to power sequence together
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
References: <20230523193017.4109557-1-dianders@chromium.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 23.05.2023 21:27, Douglas Anderson wrote:
> 
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
> new need, but so far we've managed to get by through a combination of
> inefficiency, added costs, or perhaps just a little bit of brokenness.
> It's time to do better. This patch series allows us to do better.
Panels with integrated touchscreens have been shipping in mainstream devices
since at least 2016. Thanks a lot for looking into this!

Konrad
> 
> Assuming that people think this patch series looks OK, we'll have to
> figure out the right way to land it. The panel patches and i2c-hid
> patches will go through very different trees and so either we'll need
> an Ack from one side or the other or someone to create a tag for the
> other tree to pull in. This will _probably_ require the true drm-misc
> maintainers to get involved, not a lowly committer. ;-)
> 
> 
> Douglas Anderson (9):
>   dt-bindings: HID: i2c-hid: Add "panel" property to i2c-hid backed
>     panels
>   drm/panel: Check for already prepared/enabled in drm_panel
>   drm/panel: Add a way for other devices to follow panel state
>   HID: i2c-hid: Switch to SYSTEM_SLEEP_PM_OPS()
>   HID: i2c-hid: Rearrange probe() to power things up later
>   HID: i2c-hid: Make suspend and resume into helper functions
>   HID: i2c-hid: Support being a panel follower
>   HID: i2c-hid: Do panel follower work on the system_wq
>   arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels
> 
>  .../bindings/input/elan,ekth6915.yaml         |   6 +
>  .../bindings/input/goodix,gt7375p.yaml        |   6 +
>  .../bindings/input/hid-over-i2c.yaml          |   6 +
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   1 +
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     |   1 +
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   1 +
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   1 +
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    |   1 +
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   1 +
>  drivers/gpu/drm/drm_panel.c                   | 194 +++++++++-
>  drivers/hid/i2c-hid/i2c-hid-core.c            | 330 +++++++++++++-----
>  include/drm/drm_panel.h                       |  89 +++++
>  12 files changed, 542 insertions(+), 95 deletions(-)
> 
