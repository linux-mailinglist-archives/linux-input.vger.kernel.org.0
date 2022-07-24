Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E27657F545
	for <lists+linux-input@lfdr.de>; Sun, 24 Jul 2022 15:47:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbiGXNr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jul 2022 09:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232508AbiGXNrZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jul 2022 09:47:25 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0BF12AE9
        for <linux-input@vger.kernel.org>; Sun, 24 Jul 2022 06:47:24 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id r22so3492008uap.13
        for <linux-input@vger.kernel.org>; Sun, 24 Jul 2022 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=V53hUo+GTkaeTShaF7h4/MViv6RC0VeYXufFKgC7NSifXr8fE/aMw7ZGTsJwZcD1Mh
         2RHm+HFS+ILVgbcY+Igm2nsoINQU9jBzMpJy1uLp2qQv+T639WbZKV74mSGJkgEb+llW
         4hlQhjhUvnEmJyRh2oOXfSLvBpj4iAU9QzCFN/7lihvpeUoYYqL1EEv8mnR/4uA0dTJx
         o23PEBqkz8LSJ2+g5UFHG0ixQMBhrkzRrjNOxZyMX0ltTDqGwYNxtMPSD+rlNtnFJMtw
         l438+ttw/euWzKUudq57qGVddo+BO1ZauspCgVa1QaQ8uBF3Q9EHTc6jmD8D6i1qdZWr
         YGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=LIYkXsh8NuZ+kWZJQV6Z3UgDflGRM7baotKUMbx/XVo=;
        b=1BjdSBGWTD4urtsx1mt51ZnWWUGfuvizL7ILxkoLm3GMrp7wzKPbnbdLpoeJajblrY
         d+KnnDZKoJ45PdLN7TyLRfvpLzLGKxTUBqact/b0/fmEwMliHI8ePPqvw+rcmEoljaUL
         jBE4sTkwkY6W5IWfwFn9fdZsKMyjEXb0XbzJjeL77fNTjmSYUgThEXg66D84Uwd9EqjS
         H80fa9+1QZBw+CSgFSjHJuEwMCp2YHvx7jEr44Sr76xSXojtihikpbfi3Wg+jYZDgYEv
         oJnE1FQjWHwNaFB4a3h7LQ3X/GcqA6jb5ghv8m7CcRmIhnHcBi207xfBJS9wwbrT0S47
         FJFg==
X-Gm-Message-State: AJIora8SzA1+0sYnafwIEi0hZxrEhzhlKWqTPXavGPXTHVxUWf2Z4GnX
        K+JtHgYETWz4Pfx1zPvxRptkHj8fpMxEN755FfM=
X-Google-Smtp-Source: AGRyM1v6DGlG3GvurzcIuMszAZMT7oKUFYYAM+ooli9+E9hEYsYrzZquNlFd0AdglncDkpKS8s918nAn2oSre3qcZmI=
X-Received: by 2002:ab0:69cf:0:b0:384:b1a:521a with SMTP id
 u15-20020ab069cf000000b003840b1a521amr2202686uaq.30.1658670443678; Sun, 24
 Jul 2022 06:47:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:d088:0:b0:2d6:1571:aac5 with HTTP; Sun, 24 Jul 2022
 06:47:23 -0700 (PDT)
Reply-To: te463602@gmail.com
From:   "Mr. KAbore Aouessian" <kiboraouessian@gmail.com>
Date:   Sun, 24 Jul 2022 06:47:23 -0700
Message-ID: <CALGXYcSSLCHvhrVf49GfbaA+0Q3bzXzbzu+2puDYr4-o2tv5Rw@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Greetings,
I'm Mr. KAbore Aouessian, how are you doing hope you are in good
health, the Board irector try to reach you on phone several times
Meanwhile, your number was not connecting. before he ask me to send
you an email to hear from you if you are fine. hope to hear you are in
good Health.

Thanks,
Mr. KAbore Aouessian.
