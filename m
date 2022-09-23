Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3D35E7DAB
	for <lists+linux-input@lfdr.de>; Fri, 23 Sep 2022 16:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbiIWOzA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Sep 2022 10:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiIWOyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Sep 2022 10:54:54 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EC0FE024
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 07:54:52 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id lh5so1188598ejb.10
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 07:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=mUvnHMrqfDygHJMP4jfoffRWSC2dEXcdYnkQt9a9yPM=;
        b=TPh/CO1WsOshsy9Z1qDuaG5AVH9P5aDVxMID5Ar49LbzNe7WdIev6YWo8FuVK23rhT
         YTYLnJ/I0E37oBcMvk7wX+rNMqxdQOrRkaYwq8ai2h/imkGljlsWS43Nu3F0qsn2pAG9
         5t2nYlUIp29PGr0JlxAHAT4/usbuEDLKPW0yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=mUvnHMrqfDygHJMP4jfoffRWSC2dEXcdYnkQt9a9yPM=;
        b=fHnJJew9amQQdGP8RGrH1FnQdHGlIKjJXnRYol+H9a1+xs9XrggrqMGH4KsTjN77l/
         6kbkaqa7IX7Kqpri/G5DPnKzJbKUmX9O1mbOR2dri99utnHpRmYp8dxWCsCFM83FKIhW
         wYhMCl1ZfIB1XuVni1+32l1flTvWuQVYh3zp6YA0KIkchJYZjXv/l9aydkgiGCfwjTxy
         0Irf1ho4wSxUM+QRQHZ3sVBt1CmdI3GSuo5XdjUmzHwChAZvh8kJH0R8yFcfEtZeo6tY
         g2UPTW2YblRB1bEnxy0iW4D6YC9pJMmJT/GoWiGYUQxVkNOsuZqgtNkpTP2WPT3CyNSL
         yVZA==
X-Gm-Message-State: ACrzQf3wsnf4Xef+LcsYAtXer1k+AOuN0uDr0pt3ObbHM7ZUApbTWK6/
        mzRz7kOLrgsk+L7rE9i9HGSlyvfmwn+Zo0NR
X-Google-Smtp-Source: AMsMyM5lHIVbY+IE98x1aiBxoOobsG9jI3ZvKL/R2nZEtvSoHHaSsGw/v2JvlhQjoPd8mt/z4ihMXQ==
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id xj12-20020a170906db0c00b0077b7d7d5805mr7696375ejb.726.1663944891067;
        Fri, 23 Sep 2022 07:54:51 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id f2-20020a17090631c200b007826c0a05ecsm1897878ejf.209.2022.09.23.07.54.48
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 07:54:49 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id s14so476088wro.0
        for <linux-input@vger.kernel.org>; Fri, 23 Sep 2022 07:54:48 -0700 (PDT)
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr5684489wra.617.1663944887695; Fri, 23
 Sep 2022 07:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220923083657.v5.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
 <20220923083657.v5.2.Ic4e8f03868f88b8027a81bc3d414bae68978e6b7@changeid>
In-Reply-To: <20220923083657.v5.2.Ic4e8f03868f88b8027a81bc3d414bae68978e6b7@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 23 Sep 2022 07:54:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSy3x=9qQdrDGZvc82NZYsQ=TRQ05cHECbU+Q5U5f16Q@mail.gmail.com>
Message-ID: <CAD=FV=WSy3x=9qQdrDGZvc82NZYsQ=TRQ05cHECbU+Q5U5f16Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: input: touchscreen: elants_i2c: Add
 eth3915n touchscreen chip
To:     Yunlong Jia <ecs.beijing2022@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Bob Moragues <moragues@chromium.org>,
        David Heidelberg <david@ixit.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
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

On Fri, Sep 23, 2022 at 1:47 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
>
> Add an elan touch screen chip eth3915n.
>
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v5:
>  1. ekth3915 is the true compatible and ekth3500 is the fallback.
>
> Changes in v4:
>  1. eth3915n dt bindings added in v4.
>
>  .../bindings/input/touchscreen/elan,elants_i2c.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Fabulous. I'll expect this patch to go through the input tree and
patches #1 and #3 to go through the Qualcomm tree.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
