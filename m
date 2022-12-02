Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDDB86411AF
	for <lists+linux-input@lfdr.de>; Sat,  3 Dec 2022 00:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbiLBXvf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Dec 2022 18:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234578AbiLBXvd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Dec 2022 18:51:33 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DFAFB8BB
        for <linux-input@vger.kernel.org>; Fri,  2 Dec 2022 15:51:32 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id x66so6324425pfx.3
        for <linux-input@vger.kernel.org>; Fri, 02 Dec 2022 15:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d0LDVAeZyvo0Eh4B6OJbOCoYgzOQTh0vF953GP8kBEs=;
        b=qjswZH0fpFiM3sQ5EakHOVWqnxtnmJLww8AuP0bUlI8TxD6muAvnFaAu2oG5FNp/2n
         uTAZKRhcbY0aTdtIkqG1BhHPTu5+gL2QdjYtE1VLNymlp6Tiov+Z2Z3Xhr31dJBnhpeN
         loSv2g7zOfe6RH5DX6EPgbhxExxPTuuyd7EuQu+FjNVsXXfGJ9md4rkK0DbR2ufLWZU5
         bnVqVLgeJignajZipJ/vrZrSfEu3EsFr2GozKMi8JfV533MPjpqxKyU2t3oIQ2JcNDLu
         LL+7GVL6Wq/IE5/UhtZSRGAuXYPP9k2G5jTp2+GD5765Jj+VAiwcwcsbHqvMLs9uzQ6h
         ojyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0LDVAeZyvo0Eh4B6OJbOCoYgzOQTh0vF953GP8kBEs=;
        b=i+M09iVoXhaOtQ7ZB5zy2chuvbsRcQieXHWMSA1t0PTEs1PxpIO3LnaWIe+K/hjAFO
         ZeJW0pmVejYZLE3mIXSCyadFFvFDcGws2ewnqktrExxrpvWHwKXfq/quA8it35JDI6PX
         YcMyn7FT1x6hc/9apDOXXUcVBzgzUxSaaq0g2Snb+0yKK6btwwqaTEAqMcFbZgOL7Cx5
         yQVFq9SVIl4x6IBsMzDWNcacGbBhy6elqCXnbm1vIPsGlpYeubvIoLKmTLc0zXZsEeMR
         fXTHWSfAG1QEYBeqVi3CaFQNdgndAOW84FfQN0O9/q5Mia0flJkLhsOZZUr+EV93OTOg
         9oPA==
X-Gm-Message-State: ANoB5pmEwL29nNxHBAtitRWiDZT5poVCO5U9pdF6whnFeitfxbV9Flh3
        jVVlKmBSxYiV40PiPrC5hxGQV9zLBC4=
X-Google-Smtp-Source: AA0mqf6UKMZRgaIihC2+incF/pnmMcoYTqagpR9InHz9Ei2Hi1gC06QSADYkUqkGnhp2io1e1oyl7g==
X-Received: by 2002:a65:49c2:0:b0:478:42f:42e9 with SMTP id t2-20020a6549c2000000b00478042f42e9mr28896194pgs.53.1670025091960;
        Fri, 02 Dec 2022 15:51:31 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:cc0e:e156:5def:3b2e])
        by smtp.gmail.com with ESMTPSA id l66-20020a622545000000b0057447bb0ddcsm5599482pfl.49.2022.12.02.15.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 15:51:31 -0800 (PST)
Date:   Fri, 2 Dec 2022 15:51:28 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org
Subject: Re: [PATCH] Input: raydium_ts_i2c - fix possible memory leak in
 raydium_i2c_send()
Message-ID: <Y4qPgL/Efiy5TTqO@google.com>
References: <20221202103412.2120169-1-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202103412.2120169-1-zhangxiaoxu5@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 02, 2022 at 06:34:12PM +0800, Zhang Xiaoxu wrote:
> There is a kmemleak when test the raydium_i2c_ts with bpf mock device:
> 
>   unreferenced object 0xffff88812d3675a0 (size 8):
>     comm "python3", pid 349, jiffies 4294741067 (age 95.695s)
>     hex dump (first 8 bytes):
>       11 0e 10 c0 01 00 04 00                          ........
>     backtrace:
>       [<0000000068427125>] __kmalloc+0x46/0x1b0
>       [<0000000090180f91>] raydium_i2c_send+0xd4/0x2bf [raydium_i2c_ts]
>       [<000000006e631aee>] raydium_i2c_initialize.cold+0xbc/0x3e4 [raydium_i2c_ts]
>       [<00000000dc6fcf38>] raydium_i2c_probe+0x3cd/0x6bc [raydium_i2c_ts]
>       [<00000000a310de16>] i2c_device_probe+0x651/0x680
>       [<00000000f5a96bf3>] really_probe+0x17c/0x3f0
>       [<00000000096ba499>] __driver_probe_device+0xe3/0x170
>       [<00000000c5acb4d9>] driver_probe_device+0x49/0x120
>       [<00000000264fe082>] __device_attach_driver+0xf7/0x150
>       [<00000000f919423c>] bus_for_each_drv+0x114/0x180
>       [<00000000e067feca>] __device_attach+0x1e5/0x2d0
>       [<0000000054301fc2>] bus_probe_device+0x126/0x140
>       [<00000000aad93b22>] device_add+0x810/0x1130
>       [<00000000c086a53f>] i2c_new_client_device+0x352/0x4e0
>       [<000000003c2c248c>] of_i2c_register_device+0xf1/0x110
>       [<00000000ffec4177>] of_i2c_notify+0x100/0x160
>   unreferenced object 0xffff88812d3675c8 (size 8):
>     comm "python3", pid 349, jiffies 4294741070 (age 95.692s)
>     hex dump (first 8 bytes):
>       22 00 36 2d 81 88 ff ff                          ".6-....
>     backtrace:
>       [<0000000068427125>] __kmalloc+0x46/0x1b0
>       [<0000000090180f91>] raydium_i2c_send+0xd4/0x2bf [raydium_i2c_ts]
>       [<000000001d5c9620>] raydium_i2c_initialize.cold+0x223/0x3e4 [raydium_i2c_ts]
>       [<00000000dc6fcf38>] raydium_i2c_probe+0x3cd/0x6bc [raydium_i2c_ts]
>       [<00000000a310de16>] i2c_device_probe+0x651/0x680
>       [<00000000f5a96bf3>] really_probe+0x17c/0x3f0
>       [<00000000096ba499>] __driver_probe_device+0xe3/0x170
>       [<00000000c5acb4d9>] driver_probe_device+0x49/0x120
>       [<00000000264fe082>] __device_attach_driver+0xf7/0x150
>       [<00000000f919423c>] bus_for_each_drv+0x114/0x180
>       [<00000000e067feca>] __device_attach+0x1e5/0x2d0
>       [<0000000054301fc2>] bus_probe_device+0x126/0x140
>       [<00000000aad93b22>] device_add+0x810/0x1130
>       [<00000000c086a53f>] i2c_new_client_device+0x352/0x4e0
>       [<000000003c2c248c>] of_i2c_register_device+0xf1/0x110
>       [<00000000ffec4177>] of_i2c_notify+0x100/0x160
> 
> After BANK_SWITCH command from i2c BUS, no matter success or error
> happened, the tx_buf should be freed.
> 
> Fixes: 3b384bd6c3f2 ("Input: raydium_ts_i2c - do not split tx transactions")
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Applied, thank you.

-- 
Dmitry
