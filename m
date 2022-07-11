Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC77570ADA
	for <lists+linux-input@lfdr.de>; Mon, 11 Jul 2022 21:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiGKTkd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 15:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiGKTkc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 15:40:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B19952DE7;
        Mon, 11 Jul 2022 12:40:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA6E4B80E40;
        Mon, 11 Jul 2022 19:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE6FC34115;
        Mon, 11 Jul 2022 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657568429;
        bh=ddfbFWSBXizKbQsIQQ92D8gK9kenQT8620nYYgxByp0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YrFUnsOUwwBIJJyRAWQBz7UlTH1NmxxesvR5Db9y18EAOf2gS17KFHAyUS+RV8U4J
         +9GDK31YlGx6lcBDTWFJWZ8ISmKkhpBBG1nfZAge+5u9PljRCFjyGeHNGyHAM0lUcH
         yqoaVcGfAGi5tHXupVe6RL+eoyMO2gOyYto2VZE+jXQiXvoTgq829CIMsAGC89Yscd
         Oxw1LgDJUG8F/TPF0JZtg1L/r1LQRl1QA39Mw3KRJcjpu6jL3iPTEBbn28TaXmIEZC
         jFrQWlhTjCdfOLrxHOCGVBj1t9NyfCddcz/tX091HfDjpJRkEi2pelsn6pJxczCMYv
         F5KKa5eRIP/KA==
Received: by mail-vs1-f48.google.com with SMTP id 185so5855871vse.6;
        Mon, 11 Jul 2022 12:40:29 -0700 (PDT)
X-Gm-Message-State: AJIora/WNbR0ZRmzWS3ePau9ZPABA4LNXKIQXPqNIuffXQ/8uKaRjMwI
        KlRt2FeKcd9nDE5i8XyfnLj9JNhzhpvfrXt0jw==
X-Google-Smtp-Source: AGRyM1sHA23xmnydmreLgnda5rX1fWjy1YHTwlO6d2l0vD5JtlQQV+m2xYOfOW9io5gDCyyOckQV15bx8SepuMhfEi4=
X-Received: by 2002:a67:f301:0:b0:357:1b13:2691 with SMTP id
 p1-20020a67f301000000b003571b132691mr6540894vsf.6.1657568428546; Mon, 11 Jul
 2022 12:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220710024713.17275-1-jeff@labundy.com>
In-Reply-To: <20220710024713.17275-1-jeff@labundy.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 11 Jul 2022 13:40:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLgDQD1VQiBtzFqYX23pL4mCGt86w+o6uZR8EdNzAUoag@mail.gmail.com>
Message-ID: <CAL_JsqLgDQD1VQiBtzFqYX23pL4mCGt86w+o6uZR8EdNzAUoag@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: input: iqs7222: Use central 'linux,code' definition
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jul 9, 2022 at 8:47 PM Jeff LaBundy <jeff@labundy.com> wrote:
>
> Channel events adopt the newly centralized 'linux,code' property;
> slider events should too.
>
> Fixes: 8ac14d2c2d81 ("dt-bindings: input: Centralize 'linux,code' definition")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
