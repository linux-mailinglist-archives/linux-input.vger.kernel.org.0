Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2824B0119
	for <lists+linux-input@lfdr.de>; Thu, 10 Feb 2022 00:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbiBIXQR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Feb 2022 18:16:17 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbiBIXQO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Feb 2022 18:16:14 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFE2E056C13
        for <linux-input@vger.kernel.org>; Wed,  9 Feb 2022 15:16:10 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id m6so10419349ybc.9
        for <linux-input@vger.kernel.org>; Wed, 09 Feb 2022 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=aPTFbZr4LhKGppGQDkO7tNLWiZLizgW3cwR+POXjY4E=;
        b=o2+i+8bbtsAYItL+AAbM6Obip3JpNl8BeQkjtNMgg74EpnFFdD+7E0ZPiXhENHIcYb
         B6wq4H+NXCThQ0LIqVOGdPr04Qf9eXPn25Nnl07XiepZ1hskOWGSoI5xmRXZcp9wiw2i
         ZI8OePiW6MX5wy3C0mzw3M12+DvMT7nc2cpGAH3fQFmcEWCLLIMc/4Ch8Q3kvWFVuD91
         dpsOAA61IY4DaEZKQ2sdb81H62/H+pIU4x6p2I4KnGapGidnga3Uxi7KCCkQcP7zWdPq
         Sso0gd4Rp/IL+NhNOY9frLZOJtpzZZFymZ0jSsLozY+mDdtleiINWjz7LgQp/6Zwu7P1
         YRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=aPTFbZr4LhKGppGQDkO7tNLWiZLizgW3cwR+POXjY4E=;
        b=ZfnLu4Ws0tOrarBigfqDtP4Yz3nrg2kON1adwMBpvha1NXxphii9UVTmn2i7Pff8UP
         vgWvfbiohjFmspqE51RaDcbLXjAWbBKkjHsT4ULXOj44novCGpgE2Q8W6ET2CeqNvwmu
         aydFnTZDPFcAAdtUTj0rJWm+sTYeEc2KamtKvo3FVtK6a3bxamv5lLuoWjJC+hPpsC5S
         o+Xtj0qjcxXMAr/dwJGDID951gXqTWVFLETBZkMBX5A/mQiyuZocPllyoWIbtEkYYvnd
         gn2+rfVE3Unbz1eMObUXhrVFpCw8S3v7sqvUmewk2K3Tz9Mj6NPU3RgiBcO5ATmmosPo
         Kc4g==
X-Gm-Message-State: AOAM533Q3iXKCuVkLlWC/Lw0osB0Ushl3NT8dBz9kLtlBorYOj7HEMdV
        H4qEjkGj44aMrwLcirVRKyjIWVi9OSOhNEuutL8=
X-Google-Smtp-Source: ABdhPJx4zxALdqPc9jkTYv9jpm7XrTWj7lmYSmhtBGHsbOEth1PVOYwOxtlRwZPVaxpBAjF6ndFCaT/flRvFA4bCHKA=
X-Received: by 2002:a81:3e1b:: with SMTP id l27mr4475306ywa.68.1644448569952;
 Wed, 09 Feb 2022 15:16:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7108:6595:0:0:0:0 with HTTP; Wed, 9 Feb 2022 15:16:09
 -0800 (PST)
From:   drtracywilliams <mrsalimasanwardu7067@gmail.com>
Date:   Thu, 10 Feb 2022 07:16:09 +0800
Message-ID: <CAP65zWvoBb8mhn_OzwTuPqEk_VY9sU3da4iijkQKOFLMgAuuZA@mail.gmail.com>
Subject: From Dr Tracy from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dear,

how are you today,I hope you are doing great.

It is my great pleasure to contact you,I want to make a new and
special friend,I hope you don't mind. My name is Tracy William from
the United States, Am an English and French nationalities. I will give
you pictures and more details about my self as soon as i hear from
you Kisses.

Pls resply to my personal email(dr.tracymedicinemed1@gmail.com)

Thanks.
Tracy,
