Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3944FEA9D
	for <lists+linux-input@lfdr.de>; Wed, 13 Apr 2022 01:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbiDLXcA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Apr 2022 19:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbiDLXbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Apr 2022 19:31:53 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBC68F98D
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 15:17:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r18so123799ljp.0
        for <linux-input@vger.kernel.org>; Tue, 12 Apr 2022 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=VzNdvRGHjidqUIGT+6pApgU/UMu5jL+wQHuqdUJTCUA=;
        b=FjIpfnrmTRiD/FjNzB/5Es4yzS5rfn0G5gj5ngEwSqtMPGzX6I6W3Xqy0buqf/C3Vo
         2k21PtgYGPADTrvf25iMyOfibS04+I8Laa70J4WVXixJlMa7dI7X0e1dHCmQAYSg8Hch
         Pt97SK1amgcWzIqJBm5rlCwGqGFzj3DbEDpgN1jCpqT4305+mrLTxJrHYADpCz+w4kAo
         aGHeW8HUEjwa1ZPwMgkEZebC7KlxxetgGNH8DB4zPbvQbAUFfthvI35RhcGXDPOgT7ZY
         5FHmuA6rmNEduGlG4Rql8OwcbrYSdBWHzowXt9YeR53DHI5Ca8EySvhFZ4hb9yXwtsZ/
         5K3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=VzNdvRGHjidqUIGT+6pApgU/UMu5jL+wQHuqdUJTCUA=;
        b=tCvd3DQMzDOZyBTW1RbRrQUN7uajTkjo7RxGpI/01fwLKpKWuCngqW7WuA7unugvyv
         YYP/oLfLuQVjgfeVdjH3QHq59ndtRpRtwQ++hKx+XOK3R8PJ09uIHApiYW1NfnblvUWx
         sPNLyCpNOii4r/OP37sfBkdQdNFx3Hw5dct36Asw9lIlH4CSNWMEpev5SD1yAmRL0hnf
         LxVkqR/1nSc+WV9eJ8IqFFeruMolWYEeBxz0pEazhSARYvCPsSNVv/fB5bHKVprG9Gh0
         ugQjaS21ZeJ+uIl/PLAWlwvxeZmNK0cj+iYUmpzZChvGy8+T0qfCBih18ToBmkSlAlAe
         N8Fw==
X-Gm-Message-State: AOAM5337WB4hISiMCQqSgOX65NEqmG9forYj6ZTAHSXhS4kMt+4NQnXZ
        r6zvKRKYD2M02f6SOvqL4FPU+5Rp9ld06Y62hVn072Iqnuc=
X-Google-Smtp-Source: ABdhPJybthh01YTuyPLy/O9U29EyGTQUxQMK7LLJyFKtEKfZSOtdkS3yKC4J3cEpyMrEczuGr3A7ZgehkcioZBxkDEk=
X-Received: by 2002:a05:651c:157:b0:24b:6c33:daea with SMTP id
 c23-20020a05651c015700b0024b6c33daeamr4574584ljd.264.1649801850142; Tue, 12
 Apr 2022 15:17:30 -0700 (PDT)
MIME-Version: 1.0
From:   Marcos Alano <marcoshalano@gmail.com>
Date:   Tue, 12 Apr 2022 19:17:19 -0300
Message-ID: <CAO3Us=m-Tj2yrt4=1nnr=CgUA2LR29W5DbPAP4T8xwt2VS=FnA@mail.gmail.com>
Subject: Getting the raw keycode to implement a new key in Linux
To:     HID CORE LAYER <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!
I have a Dell G15 5511 laptop and this machine has a very particular
feature: a key called "G- key" (accessed pressing Fn+F7) which is used
(on Windows at least) to do a boost in the machine. The details about
how this boost works is not the question here. The question is: How
can I find, in the kernel level, what code is emitted? I want to know
that, so I can start hacking around and come up with a patch, so the
key can be recognized by the OS, so a user space daemon can be
triggered to do the boost part (or any other action).

Any thoughts?

-- 
Marcos H. Alano
Linux System Administrator
marcoshalano@gmail.com
