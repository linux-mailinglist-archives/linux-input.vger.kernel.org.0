Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFA8581061
	for <lists+linux-input@lfdr.de>; Tue, 26 Jul 2022 11:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbiGZJxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jul 2022 05:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238600AbiGZJxB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jul 2022 05:53:01 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59962CCB9
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 02:52:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id x23-20020a05600c179700b003a30e3e7989so7855557wmo.0
        for <linux-input@vger.kernel.org>; Tue, 26 Jul 2022 02:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=xYbjt7tSRb6k0z9uL3Hg7njGRNb4kUS3yk2xc4wovEw=;
        b=MIo7PQBLFh6ZgnDn4FI5G6P2UdKX8cy9x/L46XGmxeN6RyXMD1aSfk5oqmcwmtD0rU
         2jDbQn6dPa9Plcv/F2fUybffCNWkjRdzq81p3FcA46/qyNtlWk2BZPUUba14I7z4Q51O
         kfTLiHNQE1oQt7kNLYR69nEK7koTI6wIeInKeyXAcxoCNPI6QmBsKUh8zGm4WOsLp/xN
         euEC1s6/JaEgZeh4RG6tkL1jAKamJAbch7/MbMXkLrH/9TDLFAym4U3lFlKgiqRIycBK
         8YNuUV4duEpnuu9iX1ileqV5JjtSyhjNv5tjFqkojmtaCy26QFDTxkAfgyxq58w/aVjJ
         JIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=xYbjt7tSRb6k0z9uL3Hg7njGRNb4kUS3yk2xc4wovEw=;
        b=X+YYS6vzXDVZYyl8QBGwVfFXb4xlSohDvnEJsl0p7QaMf2gmQXvDWaM5RITeS8/gSC
         hj2ZZZ2czZ8lKhT5YC6pBk5vP+GRWb1J6quP42MIqCwN8cxJFVhBjN5ueyzbgnYo37QS
         XPaerm0wHvyrfu0RXcBmNtsWsMxHtb2nHqyW0H+pPMYu+2RoyDF/3fnhPsxwgwMWhzbY
         h1RRg5FRsWoFGfWX65XVukYalbkh0g2cmTSRRq7j6EQkW5VFgsgcAKzBR5H3LHfN9jTi
         5rZ/pMxNqhZuUn+oJUMBRSAT/huVsCz0zj5vhU5dLNM1FdK+M8qMrN6JjFadJny4NuNM
         NuiQ==
X-Gm-Message-State: AJIora9p3nDBALQ95+/9ZKV9fGmh8iZFiRVpLKwaMX0neT/afMWvSRWG
        df5rLiITQPYcgCEv2dNqi74Ixg==
X-Google-Smtp-Source: AGRyM1tU+DSm8u58aZ+nyvSDNMamUur5s+E1RPql7NSzC+QLwzm6hqiDD/OS6y1OAJjHv3638h4raA==
X-Received: by 2002:a05:600c:4e12:b0:3a3:2fe2:7d0e with SMTP id b18-20020a05600c4e1200b003a32fe27d0emr19412321wmq.151.1658829178274;
        Tue, 26 Jul 2022 02:52:58 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id r9-20020a5d4949000000b0021ea771fa2csm1141354wrs.90.2022.07.26.02.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:52:57 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 4/6] Input: mt6779-keypad - support double keys matrix
In-Reply-To: <1eed6877-8868-6b29-b7c9-90986d230f36@collabora.com>
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-4-ef9fc29dbff4@baylibre.com>
 <b2676b5c-14b3-2058-9fb8-d6d78cc5d29c@collabora.com>
 <87ilnqh632.fsf@baylibre.com>
 <1eed6877-8868-6b29-b7c9-90986d230f36@collabora.com>
Date:   Tue, 26 Jul 2022 11:52:56 +0200
Message-ID: <87mtcw19qf.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 21, 2022 at 16:55, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
[...]

> Il 21/07/22 16:51, Mattijs Korpershoek ha scritto:
>> 
>> Hi Angelo,
>> 
>> Thank you for your detailed suggestion. I like it and since I have to
>> resend a v2 anyways, I will consider implementing it.
>> On the other hand, I'm a little reluctant because it means that I'll
>> have to remove Matthias's reviewed-by :(
>> 
>
> Yes, you will have to. In that case:
>
> Matthias, any considerations about this idea? :)))

Since the binding document changed, I have to rework this patch anyways.
So I will drop Matthias's reviewed-by in v2.

>
>>>
>>> Cheers,
>>> Angelo
