Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B813E4EEAA4
	for <lists+linux-input@lfdr.de>; Fri,  1 Apr 2022 11:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242990AbiDAJqV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Apr 2022 05:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242229AbiDAJqV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Apr 2022 05:46:21 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85E811CF7E
        for <linux-input@vger.kernel.org>; Fri,  1 Apr 2022 02:44:31 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id e16so3796748lfc.13
        for <linux-input@vger.kernel.org>; Fri, 01 Apr 2022 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=ghg6a/ys0xaHuj4L7YO7B9PxOUCFE+1j5Srr6VoMNGs=;
        b=opAoogasJEfVYPIoXVEe5InsoJK7mYg4gDsERMCP6yjhJcohywuC8NPNWbMsKESWYa
         SJhssxe8hx+t2e87g4p3Q6AjtfGL+7hfOo8ZtzCvzxN3ZXJT+OYsusmw1ZVCkgoUDGmZ
         p0gOLBEHs4UkSDOOyECg7CVERqXGFsP2C/VBrGUJkHelXM4gk92kWl8bSz/PDEUk5flh
         v2bFrxzGu17FucKv5OKbCNcjWzxknfeN93oMYpsIz07jImjmm1OmcHk56hySCphdZphU
         r2cNtMT1cTdc2UcXXtASn7HIe/RtNNicb7XVIv/VB42m+G01VmkzwvuRsQ5nKEDgidd2
         hlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ghg6a/ys0xaHuj4L7YO7B9PxOUCFE+1j5Srr6VoMNGs=;
        b=CZRvzGMJfr408pyrgsEmUvpHX4Df2NXx0eMjXz92vtdB4zMmobdDEA0zaYHOPqY4xo
         z/TxO3mti4vjihzRjZ/oxw1aJR2+jAa4+v0dIMWJ1FDnNX+xfZXJ7amyxpYFpDhrQYZM
         Cs0UoJeN53e2wFcNt6dMPwU2WHguLxM2r1VP4rzhdsM8DTFnkT7NG+1VC0nZXXAVsu4s
         mW+4QOHls2trpCPLmnB97Viqiqt/xneVwjxKO7CBz2l5heMHD6KUfzypkYI/aX38xF5Q
         At5DtU3haRd6r/qTeH5Ix3ZUs4kE14H8BiXQMIBvhbjWcxneI7HCvsVQI+xryiE2WnjN
         hOww==
X-Gm-Message-State: AOAM531j3LDw/mMyfn7WY63LGfoIjuxn/SJoHHYs9ikwtRvYPy8K/Rxm
        KPr7IEvybwEAFfuHn/9mNYYu8l/0bypFyyqLN5PhE1PjzZI=
X-Google-Smtp-Source: ABdhPJy0oghmsjNr+1AE6FaM80fRm3QtDcUZF0S8YobVGwQw4uMoaPg9hImTW//vEcZVeVOyL+khjoOlsrlacsSTHAo=
X-Received: by 2002:a05:6512:12c3:b0:44a:27c2:b0a2 with SMTP id
 p3-20020a05651212c300b0044a27c2b0a2mr13771771lfg.325.1648806269981; Fri, 01
 Apr 2022 02:44:29 -0700 (PDT)
MIME-Version: 1.0
From:   Marcos Alano <marcoshalano@gmail.com>
Date:   Fri, 1 Apr 2022 06:44:18 -0300
Message-ID: <CAO3Us=nJbw6haHuCg6ZTwamggRFfKuTncg2r9XwDxjv0-ocZtw@mail.gmail.com>
Subject: Battery indication for Logitech devices
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

Hello fellow developers!

We are having a discussion about a question and I think we can get
help here. The discussion is
https://gitlab.freedesktop.org/upower/upower/-/issues/166#note_1322354
The problem is when we use a Logitech device, we get two discrepant
information about battery level, one from Bluetooth stack and another
one from HID++ module.
The question here is: what is the most precise information, so we can
deduplicate but keep the indicator precise?

Thank you.

-- 
Marcos H. Alano
Linux System Administrator
marcoshalano@gmail.com
