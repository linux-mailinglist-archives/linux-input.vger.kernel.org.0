Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9F2504976
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 22:35:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiDQUiS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 16:38:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiDQUiS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 16:38:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A845F58
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 13:35:41 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x33so21629531lfu.1
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=wDiWb7GvfK1juld+n5oVDal4LfqEjSNe/W9lpz7ZduY=;
        b=cvkBNdbhaTT81ZyluJ5zoIML7Lavd9v5DhzrIKe7Sv9Qh0hnmD3dF6dd7oEDwjDWP6
         67LqvXksvLgtvBrsIkX+mUrC77AvVMxjIn6rdxQQDCaxu+iJ0IORXp9HWhXoIlbGV2q3
         CuH44U1Z8kKVsmTZDWt3Le1JOJeJIKLP8DLAPATTdD+zNVD8agYaTAIWiNYh97J2iQDm
         bdczzMV0HJH5TZmW30MXohJFmYOOIa+QvwwbDU9OSarWi++KABB1vH+vOSln2itS8/sa
         pQjNgfW/Zop9P+HWjaUsD3odCF+xJahk5EHuegFxxkysBPDGNtkebh3iDz5AHB10fFPz
         AhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=wDiWb7GvfK1juld+n5oVDal4LfqEjSNe/W9lpz7ZduY=;
        b=h9bfCDxcdunvH24kmE/LV683qMCLse66+NONjHhRGyvQ0wm2YZ4/+FFLof15oOIOQK
         vfIjJbx1mCdyBJ5V8zt/Bry/bK0DzjG5gV7pHOhQyl32RDyLbti0XDfBawaaFKU+dPsh
         sgdnICUtbQHIZf3hZ+QMkQ08fAixACrZifZ8XUxGb+WEjfAaSqBp12kCgzkWeY9hAR7d
         EpQnc3PkgQ2wSl595ftHRGBDyPiwTHu+sGXFhoFFq/XTrh1E8H7yr8cPYTspByzvPNK8
         Ar4IK7l7yXnnbbPeCJmghhlZ/Cn7ZQ5uzXfRCVXaG2zgfubuzSh5cbWmGMLkAWDCh/AX
         9phA==
X-Gm-Message-State: AOAM533dpeWWmYyU09F2JGXNPyhwd8C25IKrAUAt1zJNunQVFN3s2HUr
        JooP6H9GWXvdO0we06V+n6rXm21cJ2D9OXb58GnE+jLpx1GQsA==
X-Google-Smtp-Source: ABdhPJwLeW6dTcAxzphFEXPV10Z5wBaISviS+xJwkwuw6+phAK3knLJwAqRa8YNvu/oeUxog2L+pmdLQ963GGNLR310=
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id
 w17-20020a0565120b1100b0044a2eaddaf2mr5777539lfu.642.1650227739094; Sun, 17
 Apr 2022 13:35:39 -0700 (PDT)
MIME-Version: 1.0
From:   Marcos Alano <marcoshalano@gmail.com>
Date:   Sun, 17 Apr 2022 17:35:27 -0300
Message-ID: <CAO3Us==Sn3X0rTtzd8ftT6=OQhqW0d82TyRX4WsOja9HKVJ23w@mail.gmail.com>
Subject: Patch series to rename Xbox controllers
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

What we need to make this patch here
(https://www.spinics.net/lists/linux-input/msg76175.html) to make it
happen in the kernel?

Thanks folks
-- 
Marcos H. Alano
Linux System Administrator
marcoshalano@gmail.com
