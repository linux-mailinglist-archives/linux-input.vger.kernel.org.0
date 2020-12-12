Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A349C2D85AF
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 11:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438587AbgLLKGo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Dec 2020 05:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407209AbgLLJyP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Dec 2020 04:54:15 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CBD5C0617A6;
        Sat, 12 Dec 2020 00:59:28 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id r24so17533535lfm.8;
        Sat, 12 Dec 2020 00:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jcDzKxAqDjG6U4ji8OyJUcUafnUenNsQ9eqG0Q+O0SM=;
        b=C8l+acEgfvUDTLXrd49Yozm7tsAK87FzWUlIDUkomvTPkQraYtlduInGoBPPW3Zn6x
         oV2t17iHV3YNuddtKK5xBlmCgYX3WEn2DvSu6S8mZaS+KQ95//Wdl1p97X18gCE5Sd0S
         88yXcXn7/rRM+NCCJoBuUqPCD/tL9+rymJm7sV+FoJUH589gIjh04fv+m+2cauu8PxqY
         hTvubPeq/PxHUk1y71kZ86j12x+qLylyL/mtxAJ3UuXjl+WZxWIOWnqIPZ4tUYGNX7Fa
         X4x3ZTVRvYt5YeKJtaqrAmnJWm3ga5yyrgBZ+jXqY7+CTlqngIzKaoSjh2EYm1jDW1tR
         HiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jcDzKxAqDjG6U4ji8OyJUcUafnUenNsQ9eqG0Q+O0SM=;
        b=iJuGNxqq5nulCuUCWDQYfip8hLA7gHXq5SRRSKCZgwe+Wlvn6IhO98inu4UQGSkHxd
         4QLWr1kf9+EJsPmx2idC2YZrOOWA0vSTDQWhiQJxF3GohhGZVRix9mIagmlrQS4whjbH
         BBl2fBi9pBqQHQf8qKhvpp2WzcLnrGKn8yukKuY3/z+9i1lpOXCFXJChpixkBrdJqlZG
         H9lFlQHUkLsFcz9uIOdU+nIo//7/mXgPUcSeJ4BeJdGU/avU5Bz1pBnh9C6q7zDBof79
         drKsBx0mPim/UCE1ln4LiI6uOL9tYUxHGBM7QxE3bRjHIJ2VXTIU7LWWyp5/EeD+SZX2
         2xpw==
X-Gm-Message-State: AOAM532OwG2qpeWZs22ckVBGAyPkrVGoOWz0EBDbRIfymyC2Aj5zLiE9
        bmhP/SAYWIRpUun3QLobOef8aVyV5vA=
X-Google-Smtp-Source: ABdhPJznhNKlC9HwTBOcO6h+D/8FDiSsw4a4i1DCH36Igqa4KhlgpD3fBkBwdT7v373ejUfbHPnqtA==
X-Received: by 2002:a19:b97:: with SMTP id 145mr5445939lfl.457.1607759677264;
        Fri, 11 Dec 2020 23:54:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-205.dynamic.spd-mgts.ru. [109.252.193.205])
        by smtp.googlemail.com with ESMTPSA id n1sm1146509lfg.162.2020.12.11.23.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 23:54:36 -0800 (PST)
Subject: Re: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch
 controllers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201206212217.6857-1-digetx@gmail.com>
 <X9QuTuGEicUnlaJp@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3577ed5b-feff-5915-7d70-5fa8fe4a0a82@gmail.com>
Date:   Sat, 12 Dec 2020 10:54:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9QuTuGEicUnlaJp@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

12.12.2020 05:43, Dmitry Torokhov пишет:
> Hi Dmitry,
> 
> On Mon, Dec 07, 2020 at 12:22:14AM +0300, Dmitry Osipenko wrote:
>> Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
>> have a WAKE line that needs to be asserted in order to wake controller
>> from a deep sleep, otherwise it will be unusable. This series implements
>> support for the wakeup methods in accordance to the mXT1386 datasheet [1],
>> see page 29 (chapter "5.8 WAKE Line").
>>
>> The mXT1386 is a widely used controller found on many older Android tablet
>> devices. Touchscreen on Acer A500 tablet now works properly after this
>> series.
> 
> I am trying to understand how your controller is configured on that
> system. Could you please enable all debug messages in the driver and
> post the logs? I am a bit confused why the controller needs to be woken
> up twice in mxt_start() given that according to the spec it is supposed
> to stay up for 2 seconds after successful I2C transfer...

From the page 30 in the datasheet:

"Note that when the mXT1386 is sent into deep sleep mode, it goes to
sleep immediately. In this case the two-second timeout does not apply
until the WAKE pin is asserted."

The debug log seems confirm that quote:

...
[ 1.196404] Family: 160 Variant: 0 Firmware V1.0.AA Objects: 18
[ 1.196572] T37 Start:118 Size:130 Instances:1 Report IDs:0-0
[ 1.196586] T44 Start:248 Size:1 Instances:1 Report IDs:0-0
[ 1.196597] T5 Start:249 Size:9 Instances:1 Report IDs:0-0
[ 1.196608] T6 Start:258 Size:6 Instances:1 Report IDs:1-1
[ 1.196617] T38 Start:264 Size:64 Instances:1 Report IDs:0-0
[ 1.196628] T7 Start:328 Size:3 Instances:1 Report IDs:0-0
[ 1.196638] T8 Start:331 Size:10 Instances:1 Report IDs:0-0
[ 1.196648] T9 Start:341 Size:34 Instances:1 Report IDs:2-17
[ 1.196658] T15 Start:375 Size:11 Instances:2 Report IDs:18-19
[ 1.196668] T18 Start:397 Size:2 Instances:1 Report IDs:0-0
[ 1.196678] T22 Start:399 Size:17 Instances:1 Report IDs:20-20
[ 1.196688] T24 Start:416 Size:19 Instances:1 Report IDs:21-24
[ 1.196698] T25 Start:435 Size:14 Instances:1 Report IDs:25-25
[ 1.196708] T27 Start:449 Size:7 Instances:1 Report IDs:26-26
[ 1.196718] T28 Start:456 Size:6 Instances:1 Report IDs:27-27
[ 1.196728] T40 Start:462 Size:5 Instances:1 Report IDs:0-0
[ 1.196738] T41 Start:467 Size:6 Instances:1 Report IDs:0-0
[ 1.196748] T43 Start:473 Size:6 Instances:1 Report IDs:0-0
[ 1.196852] Direct firmware load for maxtouch.cfg failed with error -2
[ 1.197305] T6 Config Checksum: 0x8D7459
[ 1.197318] T6 Status 0x90 RESET CAL
[ 1.197543] Initialized power cfg: ACTV 10, IDLE 50
[ 1.198387] Touchscreen size X1279Y799
...
[ 1.211686] T6 Status 0x00 OK
...
[15.576573] Set T7 ACTV:10 IDLE:50
[15.592142] T6 Status 0x10 CAL
[15.597920] T6 Status 0x00 OK
[15.604846] Set T7 ACTV:0 IDLE:0
[15.831477] waking up controller
[15.862912] Set T7 ACTV:10 IDLE:50
[15.872783] Set T7 ACTV:0 IDLE:0
[15.880333] T6 Status 0x10 CAL
[15.946853] Set T7 ACTV:10 IDLE:50
[15.956582] Set T7 ACTV:0 IDLE:0
...
[27.897337] waking up controller
[27.924172] Set T7 ACTV:10 IDLE:50
[27.947286] T6 Status 0x00 OK
[27.959754] Set T7 ACTV:0 IDLE:0
[27.970258] Set T7 ACTV:10 IDLE:50
[27.987546] T6 Status 0x10 CAL
[27.993327] T6 Status 0x00 OK
