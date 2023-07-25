Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84102761FA6
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 18:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232520AbjGYQzI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 12:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjGYQzF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 12:55:05 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67E46269A
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 09:54:40 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-55ba895d457so2859657a12.0
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690304078; x=1690908878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8UuEkDJW730mNtROAXjbaQr214jAPvsqozqw3XotTgk=;
        b=QC9cRbmKk12UP1Rm2hCntC5ZqLpEe+PJFe7ItKJb0mXd/yGSzmDLYbzM6o9dtNwmj2
         7x/JTTKbylWsjekJxMEI7xz4F9sSZ5dwSOk5IYm/SMwSn3cDVg7QtbNo0jADygtWSdlC
         pnKrMkgL5EMSuVcY/Xf52d9YnH/kCOI+Mf27z433oJ7ZfafIev1QRMXZPS9YIj6BIZnr
         LBSpTZrKMa0yRIw9t3UJ66Pq1WXGX92LAi6+gxsLV5/JPGpekD5iZLu0W2jLMzDWItVm
         dtMsrXpkOd2NJnqOCU1seazn3lczzKAGVTowUd7CIJ11k/rGC4FB/ZPb0HyC5gjZ93R9
         +hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690304078; x=1690908878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UuEkDJW730mNtROAXjbaQr214jAPvsqozqw3XotTgk=;
        b=WSIt5iZ0P15DY/LzyiEaXEqw28R4bi9BO5mkyRH9B5b33xiynQPy+ETtTB0E3mv8mz
         d2VjXNXBpOI1Oj/TRfeRrfwlPlx4MRHal54THYK+jfnBxXvUfduG27TjPsCt4mft8w1t
         zTDn4y1OVAU+d9oOsEgR/gdXS77MeaRzGqtIAhyVYZiUQSgYczzJJDfXh54v/OAQQIUD
         IwFTxKxmmgCFNuO22V6DW0zakCjUhZ739cPIvyUZrzoriHEsMMFEFYhU1VEhnjzPYzT0
         4qLmLKbRSGlzne5aXOIGqlUtFtMbwJ7oWF9pWFpmhO+1Xl1hReRexx/v20+Sdn+IN7lV
         Ougg==
X-Gm-Message-State: ABy/qLbjjGxpePnWOxddT8Xk/fSHkrDH3Rkr1KLfAes7c7XfUdAB/4ud
        z1dl2nAG4DAgZE65AEZDQ80=
X-Google-Smtp-Source: APBJJlEsM5uOpRgfOeSskRtjwNdhQd49G6XxsgoE/raWfRa8Cb8yblk5KkgTkru8+yrIvwGWQEhLLA==
X-Received: by 2002:a05:6a20:258a:b0:135:62b8:2a35 with SMTP id k10-20020a056a20258a00b0013562b82a35mr11708687pzd.32.1690304077724;
        Tue, 25 Jul 2023 09:54:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9d8f:da31:e274:eeb5])
        by smtp.gmail.com with ESMTPSA id g8-20020aa78188000000b00682a908949bsm10100429pfi.92.2023.07.25.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:54:37 -0700 (PDT)
Date:   Tue, 25 Jul 2023 09:54:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     ndesaulniers@google.com, trix@redhat.com, frank.li@vivo.com,
        linux-input@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Subject: Re: [PATCH] Input: mcs-touchkey - Fix uninitialized use of error in
 mcs_touchkey_probe()
Message-ID: <ZL/+SuXswTMjXDUv@google.com>
References: <20230725-mcs_touchkey-fix-wuninitialized-v1-1-615db39af51c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230725-mcs_touchkey-fix-wuninitialized-v1-1-615db39af51c@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 25, 2023 at 08:37:56AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   drivers/input/keyboard/mcs_touchkey.c:149:49: error: variable 'error' is uninitialized when used here [-Werror,-Wuninitialized]
>     149 |                 dev_err(&client->dev, "i2c read error[%d]\n", error);
>         |                                                               ^~~~~
>   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
>     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>         |                                                                        ^~~~~~~~~~~
>   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
>     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>         |                                     ^~~~~~~~~~~
>   drivers/input/keyboard/mcs_touchkey.c:110:11: note: initialize the variable 'error' to silence this warning
>     110 |         int error;
>         |                  ^
>         |                   = 0
>   1 error generated.
> 
> A refactoring updated the error handling in this block but did not
> update the dev_err() call to use fw_ver instead of error. Do so now to
> fix the warning and avoid printing uninitialized memory.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1893
> Fixes: e175eae16c1b ("Input: mcs-touchkey - convert to use devm_* api")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thank you.

-- 
Dmitry
