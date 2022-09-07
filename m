Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F34A5AFC1A
	for <lists+linux-input@lfdr.de>; Wed,  7 Sep 2022 08:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiIGGDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Sep 2022 02:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbiIGGDF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Sep 2022 02:03:05 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1714E868BA
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 23:03:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bq9so5755475wrb.4
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 23:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FYczuPxi1SjOxRTyYdaZAVwl03tDQ3quqbW2UiDSc58=;
        b=bSjza7uUyEFLBzo0vLRVL5O0eppMtSJAjTzKE5hrP/r1zb/jUo+utz5iZvdxtAFl2A
         jXA2taZd5sxk8ROyfw68D+7XvmM7jP1ZhwEiqnsg+bSS8ocR8ZEIHr+PmlguwLe7l+aq
         8+23Ma9e6mnYXXw8Vx4ruVN+w+qyfatuwKL6NUvKNs2U6+ZiUIwMSVx8uTN9A/S4iHZo
         I+jROlIhjFdlsQRqE4Tm7CqPoFlACJs4ZgindMp4/kcu6SgnMMhmR0ULVvwMa1VG/Wvp
         GZcoaWLLXcRT9fihVbBztEyir9sEoie8vsp8mBBbRvPtG6578Z2P4SONsZFEhrq9i9dw
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FYczuPxi1SjOxRTyYdaZAVwl03tDQ3quqbW2UiDSc58=;
        b=Ppjjh93gSZRF8R4rPFQYEHfijdd4K3SYgLpymk3JE4uz5zv4T/1xfOKp8J0DrzpVg3
         kt0gyB4Z8U4ABmnaJycbfDlHIl9MJu8Y7d+W3U0s9Kx/ZUzdRFbGADYCPA8QgJx7rK51
         COlB/lJ0GUch+OrHkZjOjAK37qJwTM6AhFhOYvSXuHuxTOnDQjCZp+x/xK3gHNukWYqv
         EZl0atRawUJM40TacRUyRxzyjEM9dq9OL8uzVBzyGFIp9UgwLZ5K7Gk1gOl0H4zJONFl
         7wYKZhoyzQ1nnUlU0Q+hQNLGLjT5o6X4y59hxRD/dJjZyzuFwZKr/++HFv5PQJ5ztdHJ
         FbCQ==
X-Gm-Message-State: ACgBeo3vXQ1gj9QOZpfTaRYQks8MbExvcBkakqWoEeo4IJyiteRnuWxa
        sJjGJwVjVFxqfVe1bUFIGvdVtbEgZ5pW3Jn8drJshQ==
X-Google-Smtp-Source: AA6agR4W5ki12nxKxG7SUsvFAJ9Vc06JdpwPpOn7lpjTtVQ1YIwlCDryeTo4ZJMAjr2T4O+Z79WvK4aPUPirmx8Fuow=
X-Received: by 2002:a05:6000:10cf:b0:228:df93:a9b1 with SMTP id
 b15-20020a05600010cf00b00228df93a9b1mr989499wrx.4.1662530582482; Tue, 06 Sep
 2022 23:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220907021751.GA30945@inn2.lkp.intel.com> <332d9d42-c4ae-47a8-b3d6-32907eddb7ba@intel.com>
In-Reply-To: <332d9d42-c4ae-47a8-b3d6-32907eddb7ba@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 6 Sep 2022 23:02:50 -0700
Message-ID: <CAKwvOdk8R9HS_aJfFPKyuka8TM9jPpnT21TTvQ8ffv_p+RcGUw@mail.gmail.com>
Subject: Re: [fortify] ab66e7d1d8: BUG:kernel_failed_in_early-boot_stage,last_printk:Booting_the_kernel
To:     kernel test robot <yujie.liu@intel.com>
Cc:     lkp@lists.01.org, 0day robot <lkp@intel.com>,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 6, 2022 at 10:54 PM kernel test robot <yujie.liu@intel.com> wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: ab66e7d1d8a90f6addac0da9b3ae13d77f095f76 ("[PATCH 2/3] fortify: cosmetic cleanups to __compiletime_strlen")
> url: https://github.com/intel-lab-lkp/linux/commits/Nick-Desaulniers/Fix-FORTIFY-y-UBSAN_LOCAL_BOUNDS-y/20220831-045536
> base: https://git.kernel.org/cgit/linux/kernel/git/kees/linux.git for-next/hardening
> patch link: https://lore.kernel.org/linux-hardening/20220830205309.312864-3-ndesaulniers@google.com

Thanks for the report! Series dropped! Kees sent a v2.
-- 
Thanks,
~Nick Desaulniers
