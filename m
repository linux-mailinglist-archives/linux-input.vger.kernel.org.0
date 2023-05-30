Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9592C716726
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 17:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbjE3PfE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 11:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjE3Pey (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 11:34:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704A7C7
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 08:34:52 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5078473e87.2
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 08:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685460891; x=1688052891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2URTcYLzfS3uayG6hfWA3AHqGO0fmjAhKx1B1Sb2rM=;
        b=mWVVzeJOqvdZKotjn24LlOTsbVHuks3mjQrNCBTgVMi6WHDE+eBCxalJiaLICMS3WO
         sZ7dw3d0s6b7D8JxZnJLTSC7RsSFo149WVQXN6zHPAmWxqnyHFX1WVy0p9httXIJyHrb
         vtj+4z5S4m3vES9aWTzOcrUQdTmRK4Nn2MovEafL9mJ9gtou5LjtN4XeDWyA1O+P86xR
         5ug8pdlnpq5mggZ2ME2n3og6rrJFuXI1iZqry0NUMkn99l4IBterbAINmOmjVlAevt9B
         HpS5VJ7z86yvYxTW6s1lchneiwb6q2cjFQTzvPTJrdr2jKd05lSQ8YKP/0QyMpWWjrm1
         1yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685460891; x=1688052891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2URTcYLzfS3uayG6hfWA3AHqGO0fmjAhKx1B1Sb2rM=;
        b=FaWb088DP+VEXKMqCDGK0VKgLz5h8OTol6tDa5c+74Ra46XX+4oypzp4ytC54Xkkfr
         6UplqYloGYZWBhMqAc+pkdC1Qe2E8iL398FrOK9tzg1TiZHGHbiJujZPP5havx/01pn6
         3Ke6FMJBUfivOVfF15PgC6mmia6SOigclSCZiQoQS/l1QmiRFvAYRYJuUi45+SZJ1Okd
         guVMlAfYT1VnLzvQs5/FDTDhjrguT+4Ycz3BdZXCcA1Gmp9ECZlrmBb2TQxxQvCuStyG
         nq5wIiETRdr5R5K5/LwLDfD82DRRplQh0L/tabR8dv2k4DIiyN6HM88bcCIxaU3h2DWe
         svbw==
X-Gm-Message-State: AC+VfDxHyMaYW1QJVfJ2tH0QWf8aK2TQOo80xHmcswpotAf5d+pRsXRX
        7l6uIIYySCxZ4U4W0GaGsI3h9w==
X-Google-Smtp-Source: ACHHUZ4FyrPbuO3w8Yz55IQ8tPNl8p1FQbjxB/VnRrEwPytlMXkKP4diVJeC1A4YfCKLd8PG92PMzQ==
X-Received: by 2002:a05:6512:150:b0:4ed:b842:3a99 with SMTP id m16-20020a056512015000b004edb8423a99mr1137818lfo.59.1685460890667;
        Tue, 30 May 2023 08:34:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id s2-20020aa7cb02000000b005105f002fd1sm4554734edt.66.2023.05.30.08.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 08:34:50 -0700 (PDT)
Message-ID: <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
Date:   Tue, 30 May 2023 17:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed panels
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
 <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23/05/2023 21:27, Douglas Anderson wrote:
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), touchscreens that are connected to panels are
> generally expected to be power sequenced together with the panel
> they're attached to. Today, nothing provides information allowing you
> to find out that a touchscreen is connected to a panel. Let's add a
> phandle for this.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
>  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> index 05e6f2df604c..d55b03bd3ec4 100644
> --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> @@ -24,6 +24,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  panel:
> +    description: If this is a touchscreen, the panel it's connected to. This

Hm, can there be different setup? Touchscreen without panel? What would
it be then?

Why only these touchscreens? This looks generic, so maybe in
touchscreen.yaml?

Best regards,
Krzysztof

