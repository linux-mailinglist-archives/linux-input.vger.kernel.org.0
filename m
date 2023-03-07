Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99BF26AF724
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 22:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjCGVDg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 16:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbjCGVDf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 16:03:35 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF1B85B21
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 13:03:34 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1762wmb.0
        for <linux-input@vger.kernel.org>; Tue, 07 Mar 2023 13:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678223013;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FIoI3hcg7RaJcVCKI9xJwA4Y7Y/ADrZCcGvhvTJL8sc=;
        b=SVx0JRCjWxMsSP9CAz3FpTfrez35kv3wgC9qlbV+7rCqqEKwFPe/8QWd7PCxgXV6Nb
         +qEESDXtrHzO+5p9lU51gAsC8mBeud3RiZ1GNO9VdZ/tLH2TA/Jucfn5oz9E0dUzTgsl
         tNQ/cyjYfjqz5z5PsGTHqBFpu3fRC6VpUcaq9uMWTDAxFyIiiR9FOWEGIwZR4HEykmiK
         KqPL8oAFUQqYTNrqnhoNirVdP9E9jslJ1oOyiZq7nop99qgmJrrI+Ku7r1pPv6v4IcoG
         mCRWYEQ85vmG+Y1hShf1xb3u1B7TjiNUrMmLZGLckTsCoUjKF/2QTb25w9y2fz8EoElx
         CGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678223013;
        h=user-agent:message-id:in-reply-to:references:from:subject:cc:to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIoI3hcg7RaJcVCKI9xJwA4Y7Y/ADrZCcGvhvTJL8sc=;
        b=QC+jHt/5qwSMWtmYtbTcsoRQB+G58aBlFMt5+r6keYKCorReTQgywsU2L6tI4bdKB/
         osZYEcrudhBRclV/ANJeGrF4VnXN3UFJuCYuMaPkYrPhdnazA/zU1Tls1wlzi0BPuTer
         x+MbbZjxJNogRjFgmq3dXFuzBIQ43Ql9VKupCW3vPBZ/BX0JlPy0LPku5Gj7KRmqTx+3
         kP112FwbHkER36CEFVWyF0fpKAEoPwalFDwoT2AX4dVs8qAnrsNV3GNJzw3wru+Y+THH
         KvzSuelY9BjvYoIAC/8oZfdTLQcFXRzN5nprO7exJ6wDcoJ9/KrwIdDByPNv8FydvdVy
         1ioQ==
X-Gm-Message-State: AO0yUKW4jRoxWlFgcEXrWXfcgivEnJg7usqolmzqI9ffs192YFSaO3s7
        aM1iH9S7lsopb5jiy0zWbz8=
X-Google-Smtp-Source: AK7set/Vv4P3gYrycrQiiI9kdbFwZ705wBaggKGFpb0ZEHBcTt23/kCc0x5yAAJWXQaHDogaYlOp7g==
X-Received: by 2002:a05:600c:4f96:b0:3eb:3945:d406 with SMTP id n22-20020a05600c4f9600b003eb3945d406mr14269240wmq.16.1678223013062;
        Tue, 07 Mar 2023 13:03:33 -0800 (PST)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d65cd000000b002c3f81c51b6sm13193992wrw.90.2023.03.07.13.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 13:03:15 -0800 (PST)
Date:   Tue, 07 Mar 2023 22:03:08 +0100
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, Roderick.Colenbrander@sony.com
Subject: Re: [PATCH v0 0/2] HID: nintendo: avoid BT rumble disconnections
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20230203215119.435091-1-djogorchock@gmail.com>
In-Reply-To: <20230203215119.435091-1-djogorchock@gmail.com>
Message-Id: <2DHW2IUJXX1XR.2CCVRG1R9UPNH@homearch.localdomain>
User-Agent: mblaze/1.2-17-g916c852 (2022-12-31)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> The hid-nintendo driver has been plagued by an issue where rumble
> command traffic to bluetooth-connected controllers can cause frequent
> power downs of the controllers.
> 
> Digging into other pro controller driver implementations, I've not found
> anything that hid-nintendo is doing incorrectly. Some implementations
> seem to be working around the same problem (e.g. libsdl's hidapi
> implementation rate limits rumble commands to avoid the problem).
> 
> [...]
> 
> Daniel J. Ogorchock (2):
>   HID: nintendo: prevent rumble queue overruns
>   HID: nintendo: fix rumble rate limiter
> 
>  drivers/hid/hid-nintendo.c | 95 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 86 insertions(+), 9 deletions(-)

I haven't tested this but the code of this series looks good to me.

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>
