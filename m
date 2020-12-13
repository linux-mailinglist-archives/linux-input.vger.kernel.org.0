Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 052602D8B4C
	for <lists+linux-input@lfdr.de>; Sun, 13 Dec 2020 05:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392676AbgLMEmm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Dec 2020 23:42:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392475AbgLMEml (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Dec 2020 23:42:41 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71369C0613CF;
        Sat, 12 Dec 2020 20:42:01 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id bj5so6853107plb.4;
        Sat, 12 Dec 2020 20:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8Tg0dty1ed1kJjQoKSIqXGg4v+WjPJfjUcKMj3cUTn0=;
        b=jxN8T3bSAIqhXX+3XLEMhkbx0fBbFpWcYJeeqIL3LKEELqTNn4rQ/gypei3IhFvq4q
         VZMwXDrMH47uOEORDoYFIrVoQ7rvun8ESaT5cMdqsvNc2YXUyyAWQxPRTWlmQ5pGEfFE
         MqEGTCT8KXKMGgu/la6dYEbMghVJYfpVwXsJzQI6hNH4pk9PTMjmn4lq9IbOrpnmQh18
         /6oMWTEchJpUoK1J2jfJ2L+wdFTtPcNdZVwaIj/2R8Jo0+CFro01NJ5sD0ZkRVDO73V0
         GeZGAl3wcKFJs0NiUQMwKhTMdIKKmRXcoQV2VZZ7WzP018z1OOUpcBXADwLP/hFKWTBg
         OIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8Tg0dty1ed1kJjQoKSIqXGg4v+WjPJfjUcKMj3cUTn0=;
        b=LLQ5jPscs8gOsR1NOxGzRrhin1vl/JmQjEQLS4l2MpjbcXOUd5LZhdeqvSgmMAa9c4
         3PhVuGj+RJWt5uxut0unvW9CRpmtZRMm5BqVeEshWrR2Y2ODBYxRYMAqExu4y6eyHaZ2
         xorvtHJkhrZRNd2eQgreJHLf2YNnZGqqNyoPherYkBYGnZWgHwd76kTLTLC0dUpFw4ll
         tFjTXSp1f2VBEyNSelCXb71PQutV1jCJhobeppxNGsgKvqXy5rF/4vU/9SCzP9Uxxjo8
         cp1vNAhn+4kczmcFOQ0gpBE6+41plwR5xUZ7nbCP2XFr9mkFuScqD9udT9CrrufjdR+m
         emWw==
X-Gm-Message-State: AOAM530mbwRoh20jfr4/oa2FpcFTKDXyrNrN9sfHFVKEbRVnJ+pbEOj8
        va1g3Hvl9dvqxwz569MXMy8=
X-Google-Smtp-Source: ABdhPJxz5RUMe2BgeZX3hluLodjuGZG/ZKIVp+v6p7R2KYeaNEMxdZvq/CQZGZ8f7r7nT59L/+W++w==
X-Received: by 2002:a17:90a:67ce:: with SMTP id g14mr8342548pjm.33.1607834520722;
        Sat, 12 Dec 2020 20:42:00 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 22sm15374368pfn.190.2020.12.12.20.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 20:41:59 -0800 (PST)
Date:   Sat, 12 Dec 2020 20:41:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch
 controllers
Message-ID: <X9WblR19HZPZ5XtY@google.com>
References: <20201206212217.6857-1-digetx@gmail.com>
 <X9QuTuGEicUnlaJp@google.com>
 <3577ed5b-feff-5915-7d70-5fa8fe4a0a82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3577ed5b-feff-5915-7d70-5fa8fe4a0a82@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 12, 2020 at 10:54:35AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> 12.12.2020 05:43, Dmitry Torokhov пишет:
> > Hi Dmitry,
> > 
> > On Mon, Dec 07, 2020 at 12:22:14AM +0300, Dmitry Osipenko wrote:
> >> Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
> >> have a WAKE line that needs to be asserted in order to wake controller
> >> from a deep sleep, otherwise it will be unusable. This series implements
> >> support for the wakeup methods in accordance to the mXT1386 datasheet [1],
> >> see page 29 (chapter "5.8 WAKE Line").
> >>
> >> The mXT1386 is a widely used controller found on many older Android tablet
> >> devices. Touchscreen on Acer A500 tablet now works properly after this
> >> series.
> > 
> > I am trying to understand how your controller is configured on that
> > system. Could you please enable all debug messages in the driver and
> > post the logs? I am a bit confused why the controller needs to be woken
> > up twice in mxt_start() given that according to the spec it is supposed
> > to stay up for 2 seconds after successful I2C transfer...
> 
> From the page 30 in the datasheet:
> 
> "Note that when the mXT1386 is sent into deep sleep mode, it goes to
> sleep immediately. In this case the two-second timeout does not apply
> until the WAKE pin is asserted."
> 
> The debug log seems confirm that quote:
> 
> ...
> [ 1.196404] Family: 160 Variant: 0 Firmware V1.0.AA Objects: 18
> [ 1.196572] T37 Start:118 Size:130 Instances:1 Report IDs:0-0
> [ 1.196586] T44 Start:248 Size:1 Instances:1 Report IDs:0-0
> [ 1.196597] T5 Start:249 Size:9 Instances:1 Report IDs:0-0
> [ 1.196608] T6 Start:258 Size:6 Instances:1 Report IDs:1-1
> [ 1.196617] T38 Start:264 Size:64 Instances:1 Report IDs:0-0
> [ 1.196628] T7 Start:328 Size:3 Instances:1 Report IDs:0-0
> [ 1.196638] T8 Start:331 Size:10 Instances:1 Report IDs:0-0
> [ 1.196648] T9 Start:341 Size:34 Instances:1 Report IDs:2-17
> [ 1.196658] T15 Start:375 Size:11 Instances:2 Report IDs:18-19
> [ 1.196668] T18 Start:397 Size:2 Instances:1 Report IDs:0-0
> [ 1.196678] T22 Start:399 Size:17 Instances:1 Report IDs:20-20
> [ 1.196688] T24 Start:416 Size:19 Instances:1 Report IDs:21-24
> [ 1.196698] T25 Start:435 Size:14 Instances:1 Report IDs:25-25
> [ 1.196708] T27 Start:449 Size:7 Instances:1 Report IDs:26-26
> [ 1.196718] T28 Start:456 Size:6 Instances:1 Report IDs:27-27
> [ 1.196728] T40 Start:462 Size:5 Instances:1 Report IDs:0-0
> [ 1.196738] T41 Start:467 Size:6 Instances:1 Report IDs:0-0
> [ 1.196748] T43 Start:473 Size:6 Instances:1 Report IDs:0-0
> [ 1.196852] Direct firmware load for maxtouch.cfg failed with error -2
> [ 1.197305] T6 Config Checksum: 0x8D7459
> [ 1.197318] T6 Status 0x90 RESET CAL
> [ 1.197543] Initialized power cfg: ACTV 10, IDLE 50
> [ 1.198387] Touchscreen size X1279Y799
> ...
> [ 1.211686] T6 Status 0x00 OK
> ...
> [15.576573] Set T7 ACTV:10 IDLE:50
> [15.592142] T6 Status 0x10 CAL
> [15.597920] T6 Status 0x00 OK
> [15.604846] Set T7 ACTV:0 IDLE:0
> [15.831477] waking up controller
> [15.862912] Set T7 ACTV:10 IDLE:50
> [15.872783] Set T7 ACTV:0 IDLE:0

Thank you for the logs. I am confused where these calls to put the
controller into deep sleep are coming from. Does something constantly
open and close input device? Do you have any additional patches? We
definitely do not issue deep sleep request in mxt_start(). Do you mind
putting dump_stack() into mxt_set_t7_power_cfg() to see where the calls
are coming from?

I also do not see additional "waking up controller" messages after
requesting the chip via T7 to be configured to be active, which I'd
expected to see if we indeed needed to wake it up again for T6 to
succeed.

Thanks.

-- 
Dmitry
