Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF62F429ED8
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 09:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234278AbhJLHqO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 03:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234243AbhJLHqO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 03:46:14 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F002BC061570;
        Tue, 12 Oct 2021 00:44:12 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r10so64069573wra.12;
        Tue, 12 Oct 2021 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nnMv/OAEx4USMgPTiIlCOrFEFrrEGCFJBKXwO1PlDGo=;
        b=jconEz31ovJDDV+16dfBUvJWWa+PMysOWKL9g5yMAlYLwLhF3qsoBTJg0COzaOUyOw
         wOMVRSHBPYywrKlXYx1IekSnbORx880tbuzIbosiApS0UIW+fIlDuS0CWTCfF5kmScnj
         2FR9Qh0L0LcgLGvYJSYIOj4mLqxynu+67KWoyRkMCWDUyzwukQIiwT4g27oFmDluS44t
         MSM4hjVaUxuieaooaJq8tRTBFOXzy9GIdmYjvwZXMuScYemH0eYmKrsbjKzb6dbt6Hr5
         Ai0h+IwvlrKeU0YoEw4Kv6BdfPRk8FhMPU5Qk8jShxfSIo+eqOSgNNA4nCU1Kz2Aa6zL
         fgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nnMv/OAEx4USMgPTiIlCOrFEFrrEGCFJBKXwO1PlDGo=;
        b=xncxHtcVVH812zsJjkKr3nhwPQ2mX/Nxv8O4X2USwc5EujEDgbv8kiAwwacjWJPtqF
         kP+++OJ8eAEEBozuzIkUADbRajsjCuYxdlhP+69DvhI+mkzhGBa3Na/YCgYtZYnBtA7j
         rX28S1xCjHpGZKD/0fJHC3/xzes0CjO2QuyDPiYGk+MEzB40cTZyeRt+rXexV9w+K3GI
         gRaovR3OpKHyPKNbPSgG742fbmtp8uLoUzXsK47AWOJO7wCcHC1VDI4mIUsImAN0Xwtq
         +ZzW+QMOUDjCi93r6eOK02r+Fm3dnhX3aibGr5QbX3XN1Kf1oTRe1QsLfRxQPQrrwucz
         O7zA==
X-Gm-Message-State: AOAM530m7PSEF7zzmRqsozVw2UJQTFqgOioROMaha3B65NNt/UfV4TMl
        ApkpnfEC7Z3IKKaHcfxfHqc=
X-Google-Smtp-Source: ABdhPJzPkCvj/Jeh/e/BgewPc1DUNd/Y87S22F4EAhuWhj4+KVDdezBlMweFHz8ufdNyKSmZiJN83Q==
X-Received: by 2002:a7b:c40b:: with SMTP id k11mr3801112wmi.181.1634024651624;
        Tue, 12 Oct 2021 00:44:11 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id 73sm1754584wmb.40.2021.10.12.00.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 00:44:11 -0700 (PDT)
Message-ID: <02275d22cf23901f0a1af83aafa4225eff5d0ba1.camel@gmail.com>
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 09:44:10 +0200
In-Reply-To: <YWToKXF66a49mEf/@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
         <20210613233041.128961-4-alexander.sverdlin@gmail.com>
         <YMfQR8iM9be5Qg8+@google.com>
         <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
         <YM60mjew2mqMAMRO@google.com>
         <2cd73e19fde5a9dee6a962f9994b4dd5ea4d21be.camel@gmail.com>
         <YWToKXF66a49mEf/@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

On Mon, 2021-10-11 at 18:43 -0700, Dmitry Torokhov wrote:
> It looks like I forgot to mention it, but I applied this patch and it
> should be in mainline now. I also CCed you on a few patches to
> ep93xx_keyboard driver and woudl appreciate if you looked them over as I
> do not have the hardware.

thank you for the note!
I've acked 3 of the 4 patches you've sent, but will have comments on the
4th one...

-- 
Alexander Sverdlin.


