Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2B45387AD
	for <lists+linux-input@lfdr.de>; Mon, 30 May 2022 21:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbiE3TPr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 May 2022 15:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbiE3TPp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 May 2022 15:15:45 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46169EB6F
        for <linux-input@vger.kernel.org>; Mon, 30 May 2022 12:15:44 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so137326pjl.4
        for <linux-input@vger.kernel.org>; Mon, 30 May 2022 12:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=86CLcwkt7ZgWyzJ7Z4n+k/rNudDxcTJCD0DF3PwcWms=;
        b=gQEbnba7f2DIwvF7JIy7YhS2BcRAWueZblhXM8dZ6Yhy4eQPZaQT8SDDgGLBJSmUTV
         agcndDgYSPUS3VdJmx8AsG6my6o/fbZ6PxQGgVX9z4zITBjLHGHPpCXVQ7EqFPQE32Bf
         ThcNAImRppa9/YIdbPTjvagAelGHZjQnf+oyntyR4ibTlVL7vWZBwKH4o6sXfE1KNqwq
         x5P2nOx3AywU0APcrGEaQ3K5HxCoyvNxslIZrKj57/Dca3uSotxkm+3fqxNIFtHw8W0T
         p7nKYPLb7OLeskGrnJDQLXP2L5NPN8Wh2sxaMB5B8LbfXgRH0zDhIm3hGsDeOcNj3LoE
         +mRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=86CLcwkt7ZgWyzJ7Z4n+k/rNudDxcTJCD0DF3PwcWms=;
        b=TmM0rnvxGBnSFlFwBQ8lX1TaEvmByE4Tg+uft3PJ/c9EVLPnzvO1jhUJ8YGP5C9r93
         XphTFySHvRKXy2TCKLFrnzGHggx+hzR7mDYm9m/pcmOoQQauyPfQc2LxvrNnazZ40d4g
         NUEgq+wVqLlkJvbVM4zDIevK4hrcYZMfxxqemSjNtqfWYqWQ15XcEKsb74gx3LMK8JOC
         XtqHHNjmbB5ybdJDkYOC6xTaOK1vm0UC9Ik/shuGEQrZL3e8U4Y3IsvflQrmmj1f9HiP
         X9HR9cPXgwQSh+f0lMaBHkRsHc8GYynQODr/MlVBdvJU2n7MyCORUO2jAsNZssRXqCuT
         /V9A==
X-Gm-Message-State: AOAM531xnwFNJkehY1TzuYioSmDL6pVQLSifHrb4X7gBXptExUipiwkR
        U/q5JL5e3sV0TmqD22NjfkKCAnjM4lY=
X-Google-Smtp-Source: ABdhPJwxNruDx2slNCAmKC6HuukSRTAcf4BHX1l06uvDsKsWAY2Qolzd6PQfsxS+OgVr5jSkh8ElIA==
X-Received: by 2002:a17:902:e54e:b0:162:4b8b:f2be with SMTP id n14-20020a170902e54e00b001624b8bf2bemr31930556plf.5.1653938144209;
        Mon, 30 May 2022 12:15:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fc02:c347:e06e:9518])
        by smtp.gmail.com with ESMTPSA id s12-20020aa7828c000000b0050dc76281e2sm9080125pfm.188.2022.05.30.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 12:15:42 -0700 (PDT)
Date:   Mon, 30 May 2022 12:15:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
Message-ID: <YpUX3EAzpL4+xgu1@google.com>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter,

On Mon, May 30, 2022 at 10:48:06AM +0200, Peter Zijlstra wrote:
> Hi Dmitry,
> 
> My very aged x240 seems to require unloading and reloading of rmi_smbus
> after every suspend cycle, otherwise the touchpad won't work again.
> 
> It seems to have started a few releases ago, but it used to be
> occasional loss of touchpad, but now with 5.18 it is *every* suspend.
> 
> But the thing is, when I look at the git history of that file, it's not
> been touched in 2 years or so, so I'm somewhat confused what's causing
> this.
> 
> The relevant errors in dmesg are:
> 
> [26604.508618] rmi4_smbus 0-002c: failed to get SMBus version number!
> [26604.508852] rmi4_physical rmi4-03: rmi_driver_reset_handler: Failed to read current IRQ mask.
> [26604.509113] rmi4_f01 rmi4-03.fn01: Failed to restore normal operation: -6.
> [26604.509117] rmi4_f01 rmi4-03.fn01: Resume failed with code -6.
> [26604.509118] rmi4_physical rmi4-03: Failed to suspend functions: -6
> [26604.509120] rmi4_smbus 0-002c: Failed to resume device: -6
> 
> 
> Any clues where I should start poking? I'm not really familiar with this
> part of the kernel.

This is probably result of RMI device being resumed at a wrong time.
Some time ago we have enabled asynchronous resume of all I2C/SBbus
devices, but the touchpad is tricky as it can work in both PS/2 and
native RMI mode and the order of operations is important. It was
supposed to be fixed by

commit 7b1f781f2d2460693f43d5f764198df558e3494b
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Tue Feb 15 13:32:26 2022 -0800

    Input: psmouse - set up dependency between PS/2 and SMBus companions

    When we switch from emulated PS/2 to native (RMI4 or Elan) protocols, we
    create SMBus companion devices that are attached to I2C/SMBus controllers.
    However, when suspending and resuming, we also need to make sure that we
    take into account the PS/2 device they are associated with, so that PS/2
    device is suspended after the companion and resumed before it, otherwise
    companions will not work properly. Before I2C devices were marked for
    asynchronous suspend/resume, this ordering happened naturally, but now we
    need to enforce it by establishing device links, with PS/2 devices being
    suppliers and SMBus companions being consumers.

    Fixes: 172d931910e1 ("i2c: enable async suspend/resume on i2c client devices")
    Reported-and-tested-by: Hugh Dickins <hughd@google.com>
    Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
    Link: https://lore.kernel.org/r/89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com
    Link: https://lore.kernel.org/r/YgwQN8ynO88CPMju@google.com
    Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

that has landed in 5.17-rc6, but I wonder if something else in resume
process has changed.

Can you check the entire list of resume operations to make sure that
PS/2 device is resumed before RMI one?

You can also try overriding devices driven by rmi_smbus as needing
synchronous resume (see
https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).

Thanks.

-- 
Dmitry
