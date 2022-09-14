Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6A45B8C64
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 18:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiINQDP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 12:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiINQDL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 12:03:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB11B6A490
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 09:03:09 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id bo13so9938375wrb.1
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=aqzQjvp4t41Jz7jUGp3ZAp2nDn4twAnuhFEkrXjTvyg=;
        b=bv4jcSOrYQdmAw5tIXiM4fFo8rXknewxV2tDaI3ZCqDkGeXZhaQ/HJVrJnoNRahM/S
         BhS5tlXvmz5H/+q8hnohv03K4JeHvPGtooXP2ebNjn83UkN2Rzn6bqDYFbSmzO40hUjj
         Bwu4AHdUIdPh8CMnpsGPBS0ejYA7KPdGonfD7O+S7+cV2lR1Ezal47i8MjdhVqiBqwzN
         fsHNnnbtqX08piKeLsl0LrodwLEmVvJTyK2EfUmON0jVJQeFL0ky1kHOTkJUH4ZXr8dB
         eedJ95XKJSZWAk8MTUCo6MEXswJb8IKj0lPbUzgy+3gzc3uaF4PZpcZTzUV6Ml+HFY02
         6mXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=aqzQjvp4t41Jz7jUGp3ZAp2nDn4twAnuhFEkrXjTvyg=;
        b=DRFe+Z2yhkzsXf7/Z1omXvnFJ7PZ9pQY/VHt1/hgMAHyArm35G4hijozAoWdh7sm2P
         TSQ/FvlZ2rALB7TCHI+CxtHXlnG191wwXdhYB93BWrszAzw3M5c4K92BkK6saFukB1WN
         Y8HD5Ez5kLg+KJnEr8pF1/A9K8bplFBiduj+P835ihAWv4ncJD/SFMjAMC+w5xFBR9ho
         Ud4IpkKGpubGhisLsmu9Ydw1Jta5/3rgEhMw2GAVYuNmKB7c1J1bYMPDDIj+55urqJgI
         gj7q0913ManpVRtsTyWn5ODWBckLz8odQU1j45j5w2PWXmngSKabMCvfXeMHDWiek/iv
         khUw==
X-Gm-Message-State: ACgBeo2ZvPxybXD0p6I3aBMF12iEbSZPLW5qt2sIO8ZywGnzsJyA053u
        AV0K0vpDOLvs3WOER4JuBnGTmg==
X-Google-Smtp-Source: AA6agR4lKuES9242SuLhAy9XPb7I73BC3tyhkmK9vHGMmgkz0UiKbcrDvRouOntt44xvARa+AAMRKw==
X-Received: by 2002:a05:6000:16ce:b0:228:62e0:37a6 with SMTP id h14-20020a05600016ce00b0022862e037a6mr21764430wrf.563.1663171388351;
        Wed, 14 Sep 2022 09:03:08 -0700 (PDT)
Received: from localhost ([185.122.133.20])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c12c800b003a844885f88sm16585749wmd.22.2022.09.14.09.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 09:03:07 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        matthias.bgg@gmail.com, chen.zhong@mediatek.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: input: mediatek,pmic-keys: Add
 compatible for MT6331 keys
In-Reply-To: <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
 <20220914103021.43593-3-angelogioacchino.delregno@collabora.com>
Date:   Wed, 14 Sep 2022 17:03:07 +0100
Message-ID: <87illqt03o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 14, 2022 at 12:30, AngeloGioacchino Del Regno         <angelogioacchino.delregno@collabora.com> wrote:

> Add a compatible for the keys found on MT6331 PMIC.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index 9d8a0c3aebca..2f72ec418415 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -25,6 +25,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt6323-keys
> +      - mediatek,mt6331-keys
>        - mediatek,mt6358-keys
>        - mediatek,mt6397-keys
>  
> -- 
> 2.37.2
