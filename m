Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B73950CC72
	for <lists+linux-input@lfdr.de>; Sat, 23 Apr 2022 18:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236483AbiDWQ46 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Apr 2022 12:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236430AbiDWQ45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Apr 2022 12:56:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D202B1A0
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 09:53:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v1so9681853ljv.3
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 09:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcoqhVyV1NN0NpAcACB15/wat3ksyRKY5771SK2WiKE=;
        b=En3C0Elc/rQ7p8X3AS8OLj2h+xYQ9zXpzi2KwrD5qQfgREcyozMXitSnMFHnsEga+y
         HWbfnfDxuZ1VMFYzBVNNFCUi1BHPHtMIS74CGkKICMJl4LyVHt0ASqF5GFlcvhP1/aHP
         t+HarFrBbBsRRNgWJKJH7hvTkYsMrWPHTAecU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcoqhVyV1NN0NpAcACB15/wat3ksyRKY5771SK2WiKE=;
        b=M2UVpyz6i4IUnV78413vBIWWoIS8SDShcxB+PBQCLiwhOl7aRXwSBYI5si3RnRfxcE
         BpmxqKxAImwK+SckrV/uFJFFNsuqbPziz3SuFutFH0q6W8XWjbyHQSMTNHPbP/axE9Qi
         qY2SMKaynAC55ipxdnjNpXLFKpjVyzp19fV2YWkhCmL33b2WKsS1dh9oitgVKN29QYzD
         KxdUgU0ym7GHTh2mnETFwg3cL3DfAHcEq26hzPayo0grGN1kaYyO42N9hdGKfpF1Sl6X
         uzY5izdb6hRR7aDGiwkerGutDmDrkFC994mAT+krjsVe/IIh662JSYLQojizduZCgXJP
         DmuA==
X-Gm-Message-State: AOAM53122xhIp2e/tK6LcxDHfmChU3VmCYKrKOV3h4HrZpB2j+UvCgV8
        ydrDihfPfFoc8jRCk3fWiOjmktu7rLUkVXDP
X-Google-Smtp-Source: ABdhPJzs96E+t48xwm4SnL0TReC+Bymo866ZHYZ6kQwzVBcQLTvEiBPrn4s9r0QSXCzu//zf/7Lz0w==
X-Received: by 2002:a05:651c:b2c:b0:24d:c72b:ebb4 with SMTP id b44-20020a05651c0b2c00b0024dc72bebb4mr5695459ljr.190.1650732837372;
        Sat, 23 Apr 2022 09:53:57 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id t5-20020a195f05000000b004488c533577sm678081lfb.284.2022.04.23.09.53.56
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 09:53:56 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id m23so2247595ljc.0
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 09:53:56 -0700 (PDT)
X-Received: by 2002:a2e:9d46:0:b0:24c:7f1d:73cc with SMTP id
 y6-20020a2e9d46000000b0024c7f1d73ccmr6017511ljj.358.1650732836015; Sat, 23
 Apr 2022 09:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <YmOEuZ11On7T7Gbe@google.com>
In-Reply-To: <YmOEuZ11On7T7Gbe@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 23 Apr 2022 09:53:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYKNrM3tvg-D+2EL-=9Tsq5-dr4Sw75NWcONAdt+tZMg@mail.gmail.com>
Message-ID: <CAHk-=wgYKNrM3tvg-D+2EL-=9Tsq5-dr4Sw75NWcONAdt+tZMg@mail.gmail.com>
Subject: Re: [git pull] Input updates for v5.18-rc3
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 22, 2022 at 9:46 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> This is the first time I am trying to use a signed tag for my pull
> request so please let me know if something does not look right.

Looks fine to me. Thanks,

                  Linus
