Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84C64EF8CE
	for <lists+linux-input@lfdr.de>; Fri,  1 Apr 2022 19:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244022AbiDARWC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 13:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243038AbiDARWC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 13:22:02 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FC2204A81
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 10:20:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m3so6077941lfj.11
        for <linux-input@vger.kernel.org>; Fri, 01 Apr 2022 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E67IK+Jvrwv6W81l4GfGc24c3hT0PbTkiVqWHmGtK9I=;
        b=FcZ8X+BsiTK5mr0/rPhVGjHTnv+cNiWxHv+L3sbH7dgqr9bBSCw25deZIzoeBz07mB
         EVFSxUbwVBcdN25WgvxcMiJ/alnt3etC/vAYbk4WOtzxOoaSMieAoITM47AtdYw1hLfr
         bkcaDG1yUYfc/w5DD4X3V5XPpRkYFdG2QljC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E67IK+Jvrwv6W81l4GfGc24c3hT0PbTkiVqWHmGtK9I=;
        b=57jmPv8/XyamvhyBHsK7fSqdxtLR5r/4LdKGjFgG7/NET1yDJpe+6tNKO1a9Vo2t8K
         6LmzrnOy/IMvEI5Cd+o4MqKz8rWHxqDi0fX+xYAhZRHLkSDMCUPS7/qlxwqhTaSp/4cP
         BRHa8v/ImXb4l4VBpUmCa5tL6AglMzj34XZ8SplbTcMyvpnPidQWxbcCoOmiNV3opVaL
         X1fDQX7nsm3au2+6V6s2DR6asVbX57wTC+IR66JY0uA/UDCvk7vjH9gZURbEWRn8SB3G
         DELpT78vL5vm/D66C+9f6KBCgazrnY6AZQLgl353Li0UbhaQdWU2Os+szSueX+sjxGwT
         NSVA==
X-Gm-Message-State: AOAM531NNA0a281cd1Fahyv8UIWQVuB5VViw+J8As9bpBgMUlSlQ2rec
        A+1ig1qqDE+OZG8/fYgQFV3Yy8XR9JU0QekCBN8=
X-Google-Smtp-Source: ABdhPJyFA9leXnEnf7mimPIHJCplDYojmxgrQp7Y6WDvRNRa8oH9Kzot1KUduSLQtQBkCVlDxNae1Q==
X-Received: by 2002:a05:6512:1689:b0:44a:e652:99f1 with SMTP id bu9-20020a056512168900b0044ae65299f1mr342456lfb.467.1648833609406;
        Fri, 01 Apr 2022 10:20:09 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id s2-20020a197702000000b0044a693649b9sm290955lfc.131.2022.04.01.10.20.08
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Apr 2022 10:20:08 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 17so4770594ljw.8
        for <linux-input@vger.kernel.org>; Fri, 01 Apr 2022 10:20:08 -0700 (PDT)
X-Received: by 2002:a2e:543:0:b0:24b:56c:74a7 with SMTP id 64-20020a2e0543000000b0024b056c74a7mr1694187ljf.152.1648833608533;
 Fri, 01 Apr 2022 10:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <YkZ+K2Gtt75y1/O+@google.com>
In-Reply-To: <YkZ+K2Gtt75y1/O+@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Apr 2022 10:19:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdff1hwOzT+SHzKMGbr+3zc553WU5zvNNbZLdT1TsTNg@mail.gmail.com>
Message-ID: <CAHk-=wgdff1hwOzT+SHzKMGbr+3zc553WU5zvNNbZLdT1TsTNg@mail.gmail.com>
Subject: Re: [git pull] Input updates for v5.18-rc0
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 31, 2022 at 9:23 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

I've been watching _almost_ all the pull requests I get this merge
window be nice signed tags.

Yours is one of the fairly few ones missing a signature.

I've pulled it (kernel.org and all that), but I'd like to get it to
that "everything" stage.

I can see your pgp key in the kernel.org key repository, I just don't
think I've ever gotten a signed tag from you.

           Linus
