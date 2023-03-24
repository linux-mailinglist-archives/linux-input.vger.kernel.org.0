Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140AB6C7D5A
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 12:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbjCXLjk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 07:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjCXLjj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 07:39:39 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB9D1D90B
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 04:39:22 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id z10so897917pgr.8
        for <linux-input@vger.kernel.org>; Fri, 24 Mar 2023 04:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679657962;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=gmqzdLy63bUqyBwewp+l29yCESUdoRYsdqkACLc42ygaI5orNAKZHVedJxqq/71n3b
         nNv0OJ5N6MmTyzzMua8liKCjtBFv/dTigdevIDRQ+O+4D381/mSQrfU855VWyBRX8p7L
         9K4gdKdNvUure/61eQ3iRFB0w8VECTwD6/jy5cCUpMmdfNDg7aBfUYB5LS1FGy355GPx
         qyX+XzapvejdXgYXdOHmZCAbggfhfkF4XWLIv6s96jthwsarDiTPiNBtYDOERrq2NXv8
         v01oI4e1unhFfxwG/DQqPPDTowibMtS2CtdlW3AfPY/hWzUXkP20V3VhuArtbGXLzjKa
         RXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679657962;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZeK4ZJ1o6tGrUVsDjmi+mms9O6S9hGyBZoeD/hC1EM=;
        b=YI+SLplVmtxA1xPw3y3HPrA1VZXNyHUUiKOfSaHD6jQt8B2Ps4p70Z1gdIjVf+u3PO
         wrf2nu/POuoyDvGl0UBjk/2VVDbE1uwWliTcKjigZBwAp9cyNMEuEFg+1r/mk+J9xdIe
         7BnpoQ3ddfggDONt71m344CJ4PqlyGFE6D6kN4SaQhlznPb9BDIS/JUjTr18/wlPL9cE
         ZSyS9B7+Cod/kgn77lBqSL31prPpf5HcMOJl1qAxgGV6UdxHh0A5QLyLPr5DEf7okzFl
         NY/bl0wUXoTD4WxvnUS/+XDynJ6inH/sZ79bgRQKhr2vHI7fOv5NVihKlKdjrujeEHfM
         /NBA==
X-Gm-Message-State: AAQBX9c/uHEM5WT9eUFXzFTOcn4USlLygRVXklnIfXh0E+siXysCGQA4
        A/hH6G2+46sLNxnIPTn6fhpD7bnxtOzAO6EbHtw=
X-Google-Smtp-Source: AKy350ZT8Rioh4mK7fmMkGEeb4XPM2LW8LuKKJUQNfakPwfRWeTnnWxFwDTNWcEtXX5OxeUXL6MEmya0adUBCiSgBmo=
X-Received: by 2002:a65:454b:0:b0:503:354c:41ad with SMTP id
 x11-20020a65454b000000b00503354c41admr507032pgr.11.1679657961772; Fri, 24 Mar
 2023 04:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c7c3:b0:40a:64ae:d236 with HTTP; Fri, 24 Mar 2023
 04:39:21 -0700 (PDT)
Reply-To: fionahill.2023@outlook.com
From:   Fiona Hill <kevinhansen8819@gmail.com>
Date:   Fri, 24 Mar 2023 04:39:21 -0700
Message-ID: <CA++QgS_C6MSGoPP+ksErN5Xfx59Lmy5jU4aB6+XMhSmMYm6LLA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello friend did you receive my message i send to you? please get back to me
