Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81A315FAF5B
	for <lists+linux-input@lfdr.de>; Tue, 11 Oct 2022 11:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiJKJbK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Oct 2022 05:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiJKJbI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Oct 2022 05:31:08 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2671C1839E
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 02:31:02 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j16so20660165wrh.5
        for <linux-input@vger.kernel.org>; Tue, 11 Oct 2022 02:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5ymJ3fw0fv1V9p0VTDFDOtHXr8KzREKrs2F+r+ez6k=;
        b=dBXChz0+CbfhV4rRHl/Psu/i3ZCFZFSNicjw08/5xLYflUCIR9xG47+wVLeGC3w7Cq
         LYoB64ncsMp6YivMLmEwwNOHYhrAVSgJXvDqBDuBnnlgxWLbuBIvVyUIdwwn+m0NFY3N
         VCAIgjReMIMoubH1QWli7ODAc76uaPCe6EDnU+GRgTdWjw0WPSWXnvsAiptOFo/8ol3v
         u3it42e9IzTBO1IMRg3uAn73LcQlZVv5L2lIRIdxqZKQYlqqhkLGDS4GQZj1fwQkA2X7
         7eFr5j8T4k/Q1iwHDGGKlvdXwIWy9OOC7MJcTUMAcmeARYSCLhXYf0RK28lSkylZVi8h
         lgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5ymJ3fw0fv1V9p0VTDFDOtHXr8KzREKrs2F+r+ez6k=;
        b=GLxMcKoQdSVrcJ6WRGtRVwpebfUzy3eUl7uKWXwDEArgfAPDa8A55KHu8/FV/fCsj4
         8wE9rEC9eCY4+yamwgvUg862zvkBgWBp2K7ZVA0ZSlprVbpBDcsAiGdoRmXO+4XlZ1MZ
         BDnGMfOfloGaSU7T+jDy66k9RfBzEZV28tX53JTgMD3OI7RBZHlRTrk11kT/XWkOBsPm
         GUvYiSOwbW4iR5U82/8My5xQT+KGocFc+7kirLW+pEPimq2Va5bw/IGJURC2d9mW+6FU
         2IvghLTBIq4/xcifcrAgazT8y94P5Q6DFbFstPBU67ZVk/I2he7FYAFibhOUafL+Vf8t
         TPiw==
X-Gm-Message-State: ACrzQf1NdjhcYaYJpPNfLED/zVUFjRjArmlsf1Rl2NDf3JrEnW06eOoY
        ygVGhrxbhkgus6RLk5hSNltyjg==
X-Google-Smtp-Source: AMsMyM7EhdgMIUJ+Lnz1ixYjljGlwW0w51lXQIMByy+9RG0YV/WE9uusWVlxHHuorrU1+egDfdI99w==
X-Received: by 2002:a5d:5950:0:b0:22d:d0b5:a9b2 with SMTP id e16-20020a5d5950000000b0022dd0b5a9b2mr14645205wri.452.1665480660520;
        Tue, 11 Oct 2022 02:31:00 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w9-20020a1cf609000000b003b332a7b898sm12000596wmc.45.2022.10.11.02.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 02:30:59 -0700 (PDT)
Message-ID: <972ba839-2fd3-2b45-3477-0c7e3d32f149@baylibre.com>
Date:   Tue, 11 Oct 2022 11:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To:     krzysztof.kozlowski@linaro.org
Cc:     amergnat@baylibre.com, broonie@kernel.org, chen.zhong@mediatek.com,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        fparent@baylibre.com, krzysztof.kozlowski+dt@linaro.org,
        lee@kernel.org, lgirdwood@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, robh+dt@kernel.org, robh@kernel.org
References: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
Subject: Re: [PATCH v2 3/5] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Content-Language: en-US
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <cdb4e9f7-c7b3-3a1f-bf61-e42bdb021570@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Krzysztof,

Thanks for your review !

 >> +
 >> +    properties:
 >> +      regulator-name:
 >> +        pattern: "^v(core|modem|pa|proc|s1)$"
 >
 > Why enforcing particular name of the regulator?

The regulator names are forced to match with the datasheet names.

I think it's a good practice to increase visibility between HW & SW.

Also, that keep consistency with other Mediatek PMIC schema.


Best regards,

Alexandre

