Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55EC65B4A66
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 23:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiIJVxE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 17:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiIJVxE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 17:53:04 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3052DABF
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:53:01 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y8so630724edc.10
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1PPWCbKXlEnu4f5Y1l2ZGcr26PupHUMW55EBs/BVMPw=;
        b=jafaxW5FyQ4KBW/ss0lvDFQS+BytcTlCthxnY13MDRI2O751HlCvxQGZRO58po3QOu
         jBNoL1p04iABMzEsXUW+UewQmoEVE+zAtBnAxFa7/StgjWqJO9sn/z3XQ/FUvyImetKI
         45JNjteSQ84/waP9QAb74Id1C5s1XmyAS1kpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1PPWCbKXlEnu4f5Y1l2ZGcr26PupHUMW55EBs/BVMPw=;
        b=C3wxq99nNe6qM2024M7RkTOXHHCBGTEtamA44Rl8hKXSvG04kiEpQEuwCFr5fc0mr/
         4TnhP4v3sXQTQ7Shszp27gNJzet6Py6YPz43uvgV7e6p5kMCXTGiOZ3Ba+mPPsTWKObh
         mnfnDGghp3YPlOXekxDVz4FrPHybOoI4Q35XH53pHDOUKlnabGixB3S/4bxnHVj0o8t+
         XzlhGRw45egvkyIDY14JsY6Dexj8cAaymrpWxcX+0GmPcrRD+ipYUFjoZgBhKhjDGqdw
         OYtuKj0mKYax+64MP9/Ab8xoxxjw3Ml15g1DKYDs2L+fb+BZKBt9ExVO7bEDZoLYMGn1
         zTYA==
X-Gm-Message-State: ACgBeo3eqhSOlvvUCYtHZxvbaqRyeWlpjRm1zpcAJnWOVGXke8FWoirl
        IRIBpV9EeOnM7waEiOI141ltb4QI4/MBK1bs
X-Google-Smtp-Source: AA6agR63E5mJVaDm3bGLiAm64hMzDG9d4601crVttUpJECNA0Ssv9+dJ1zyG55QGtLBrVuSd6aDs5w==
X-Received: by 2002:a05:6402:35cb:b0:451:6a0a:6688 with SMTP id z11-20020a05640235cb00b004516a0a6688mr2288066edc.415.1662846779946;
        Sat, 10 Sep 2022 14:52:59 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090618a100b0076fcde2ff37sm2141667ejf.70.2022.09.10.14.52.57
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 14:52:57 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so7856204wma.2
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:52:57 -0700 (PDT)
X-Received: by 2002:a05:600c:548b:b0:3b4:61f4:804e with SMTP id
 iv11-20020a05600c548b00b003b461f4804emr4580041wmb.188.1662846776956; Sat, 10
 Sep 2022 14:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
In-Reply-To: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 10 Sep 2022 14:52:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WtJ_UJkXJkMY0Ma4Fum8Xicqiv=ZX5QCJ=woL51VjFxw@mail.gmail.com>
Message-ID: <CAD=FV=WtJ_UJkXJkMY0Ma4Fum8Xicqiv=ZX5QCJ=woL51VjFxw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: touchscreen: elants_i2c: Add
 eth3915n touchscreen chip
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
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

On Fri, Sep 9, 2022 at 3:28 AM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> Add an elan touch screen chip eth3915n.
> This chip requires more delay time than the eth3500.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.com.tw>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: David Heidelberg <david@ixit.cz>

This has the same problem talked about in:

https://lore.kernel.org/r/CAD=FV=XEkPfU9wjwGrp59QJDAspUbWwmOTSZfE1Y5PWt1w309w@mail.gmail.com/

Namely that the Signed-off-by and "From" address don't match. You need
to fix that.

Also note that neither of your patches indicates what changed between v2 and v3.


-Doug
