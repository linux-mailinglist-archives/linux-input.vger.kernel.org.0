Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC0C729F41
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 17:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241966AbjFIPxl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 11:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241963AbjFIPxk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 11:53:40 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15190359A
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 08:53:38 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b219ed9915so21437801fa.3
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686326016; x=1688918016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMFU7gvOxv0Laf+NqNgw9EhezlbxvSrT/pgc5FmWwXw=;
        b=PjJpV43ObmBJdXY9mVzLFJgcKDTFzy7Xvu8J9jCCUrOFGRg/NVVze/aga7w+qOupti
         /NreS0vuK4r7YdoENnIOCpP8SqsU2g1qqPxoECWyQp/AJNP/WtZrdVWpnyvnShQ5MJSl
         JjGIEJzMeP+k/jObZmfhjq8vFp8NiLDwKvEidoaQGOLhwFvFwRcX+z1cPu6xsDiKcOyn
         J+6mJDcOs9syb0JxKuotiavaI0ISaA99Jmabk6wfyBlE2CewK6cKFntghCNd6KPZi4zs
         yhJn4n7NB4WuV7u2j9HjsyEVAPpEqSL0Je9B72ZSWq9BCFaVvrEClA+TQPok5iVtjNP7
         tECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686326016; x=1688918016;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMFU7gvOxv0Laf+NqNgw9EhezlbxvSrT/pgc5FmWwXw=;
        b=M+nrBptLlaRTOJsp8nxCCMdUadXfzWynoc/Ljf41cNeoehEbb2PeJaU1KnWwBZmF+f
         SeAg1KI2ukGEqA67EIO9Y8wFWeL8QzCpr0RU6K0+24gN2sxUG4l+M95A4pqMQgX3dugN
         7GunIdcfp8h5/Cw3170ByMtjMHmqztAzkQ6elPOI6GR2n8z7gGJfDnEZMUeLu9h4KrH0
         e2Yy5D3Jzk1BwzukEQlYMBynhU7RcS6yY4m1/eTQypiaiwvGChWfvFKzTd5xmMiIsssI
         Nl+wVQ2fDWQqQh7a/MqcUSkdhNPjJs6AJ3MAremomiiFCVAfsFq26TWLOyUcqRnkmawn
         2eKA==
X-Gm-Message-State: AC+VfDzLLgtZF09LfOZhRi6FrPpCbrNIZkSQ2C5SwqTna3Av5Jry1/7Q
        ilmwMx5wctQAYbjMerxoOlxM3A==
X-Google-Smtp-Source: ACHHUZ4e7h2+3Yc1DxCts8RfOHM+dn3h/OabUHaXGBivkFeLqK63t4mxMQYCl4yBs68bnTzwhE9k9g==
X-Received: by 2002:a2e:8256:0:b0:2b1:c0d3:72cb with SMTP id j22-20020a2e8256000000b002b1c0d372cbmr1304978ljh.23.1686326016262;
        Fri, 09 Jun 2023 08:53:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r2-20020a170906548200b0096f5b48fe43sm1434344ejo.47.2023.06.09.08.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:53:35 -0700 (PDT)
Message-ID: <218bad0d-483a-5338-c140-2d0fcf280f20@linaro.org>
Date:   Fri, 9 Jun 2023 17:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 01/10] dt-bindings: HID: i2c-hid: Add "panel" property
 to i2c-hid backed touchscreens
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
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
Cc:     dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607144931.v2.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid>
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

On 07/06/2023 23:49, Douglas Anderson wrote:
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), touchscreens that are connected to panels are
> generally expected to be power sequenced together with the panel
> they're attached to. Today, nothing provides information allowing you
> to find out that a touchscreen is connected to a panel. Let's add a
> phandle for this.
> 
> The proerty is added to the generic touchscreen bindings and then
> enabled in the bindings for the i2c-hid backed devices. This can and
> should be added for other touchscreens in the future, but for now
> let's start small.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - Move the description to the generic touchscreen.yaml.
> - Update the desc to make it clearer it's only for integrated devices.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

