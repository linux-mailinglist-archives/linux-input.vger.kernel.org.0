Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B8F5AF7FF
	for <lists+linux-input@lfdr.de>; Wed,  7 Sep 2022 00:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbiIFW3X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 18:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiIFW3W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 18:29:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8A327DE3
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 15:29:18 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id gb36so26368667ejc.10
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 15:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=tzV5Zo1zPXPHYlUrwIwFAafpDKH7ddJHuMF7Y7rCweA=;
        b=NrD1lKMkW/LP27c/myN1W9vtmnxl9C2r3nLQQCkEubatVJntTMQywq96/+Zrhp3iNX
         V1pMZj8E2hhw9LETuAVP7nAnj1shZXe9cZ1jpIBnlBmss4fyyZvnatwjINmE/DJ6EVk/
         J4zJGnHbdmQSTo/6vGt+tdufQ/kiMCxUcod1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=tzV5Zo1zPXPHYlUrwIwFAafpDKH7ddJHuMF7Y7rCweA=;
        b=6WsgqGiibYzvzWPs7dVhwGX79+OG1Qt69CzDu2X4f3/o5B5rpSC3d0HdeEe95ccRzz
         ltCfhbYnCcBsIvw59O4Z8FmInBHhYUiBlq+TUOVp3InOhMctJo9sIFrD8F3adnysIElh
         QSpAKt8EJiLEEaGw/YrtVqAlQnG9YHRV6HsylsZgVHZs3zPcQdAlthYNj+XSSrL5Cl4e
         Nvx2+SWgFsfbdTJ6fVjSR6U3kp80DPrME1mOXUMALfC9yKEKC/Y5cFF4SnYJ8svCtQww
         mvbLO2usJyTmuc1wq56oafZTCL/SRxlyd+QCAyNZkU356enbS+W3Be29vonFNMkIWagE
         fmyQ==
X-Gm-Message-State: ACgBeo0HTa4UzmFI1P1C9r/APgP40zGFjtuJ/Udr/8ccIpeFOr9ZIsgp
        ZQ3HJjalMKvp6LD9eXFRVUThLyy2tS+B/RQc
X-Google-Smtp-Source: AA6agR7OVKZqX+aANO2X6LA58dKU47uoh0gvfIOxuWNk7/2nXkmjw3rDgQH40zDY+xh4bOG8x/btPg==
X-Received: by 2002:a17:907:720b:b0:731:6e49:dc93 with SMTP id dr11-20020a170907720b00b007316e49dc93mr405265ejc.421.1662503357131;
        Tue, 06 Sep 2022 15:29:17 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090631ca00b00730860b6c43sm7421550ejf.173.2022.09.06.15.29.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:29:16 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso10519875wmh.5
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 15:29:15 -0700 (PDT)
X-Received: by 2002:a05:600c:5114:b0:3a6:1ab9:5b3d with SMTP id
 o20-20020a05600c511400b003a61ab95b3dmr271110wms.93.1662503354765; Tue, 06 Sep
 2022 15:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220902082843.1.I7da6ff6c8e8700624d61e51ff7d09e151bd83dcb@changeid>
In-Reply-To: <20220902082843.1.I7da6ff6c8e8700624d61e51ff7d09e151bd83dcb@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 15:29:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=URtPnUF=moq_+iua517RBPB4WF+56gE94GZ6fhM2XUow@mail.gmail.com>
Message-ID: <CAD=FV=URtPnUF=moq_+iua517RBPB4WF+56gE94GZ6fhM2XUow@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: elants_i2c: Add
 eth3915n touchscreen chip
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Henry Sun <henrysun@google.com>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Sep 2, 2022 at 1:32 AM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> Add an elan touch screen chip eth3915n.
> This chip requires more delay time than the eth3500.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---
>
>  .../devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> index a9b53c2e6f0ab..d28625372f5ac 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/elan,elants_i2c.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - elan,ektf3624
>        - elan,ekth3500
> +      - elan,ekth3915

Reviewed-by: Douglas Anderson <dianders@chromium.org>
