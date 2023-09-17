Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571797A3DB0
	for <lists+linux-input@lfdr.de>; Sun, 17 Sep 2023 22:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjIQU5J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Sep 2023 16:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbjIQU5B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Sep 2023 16:57:01 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F49698
        for <linux-input@vger.kernel.org>; Sun, 17 Sep 2023 13:56:56 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-76dc77fd024so255050685a.3
        for <linux-input@vger.kernel.org>; Sun, 17 Sep 2023 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pressers.name; s=google; t=1694984215; x=1695589015; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMpppOWezPnSti5EzycDYmM1/qSATEqf23I4aeecbFQ=;
        b=eIkGb160ySKcm8q4FTydTPaEkPzQK3mxSckzumo/NqGKmwffRELnUalxWm+f5LXpNe
         aovDd4aDI0CN6BxFbke3LxBnQ6ojhgQuNOjAAzMVc3pHx+EidvjYcqi36MwQ4IuUCbUw
         DOmclRaKehE3IilbuXjvsVRKPJr6uFnRENm4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694984215; x=1695589015;
        h=content-transfer-encoding:content-language:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMpppOWezPnSti5EzycDYmM1/qSATEqf23I4aeecbFQ=;
        b=iamWSxGxap7KbUXvSusHYgMPV1x5yniChDslPDlssUuJSrkfBr5qBOGI1fpPVi2V9Z
         NI+VXhYNvQBIAHPtHLY7xkbdFkWvmBCBRT+MDeyoKMPzwHKQOso8pPHOSKz4yT19T+8D
         gXWXzS1yd/S2QpcGHoDO8kYjszV1YOYC5K4dvgTIuzTyCH5IEsS4JYkke5+/87CNGCjb
         bahhr9hNyo8R7VEmj+ahQ/JIY0CfmZJcIbv6A0RjRB/Ibij84bLJJHDDnxd6NaACpNiF
         gzpI5NXcEfSLoGZa6EY1wDcp9ZM4U+w4bMpbO1pv9ixFxZx5q2zualcoy1vRylsKTJZz
         v/Gg==
X-Gm-Message-State: AOJu0Yy/0B8/aXNcxZVJoKDzVFUtBe8BsEKOlM9lG5gzcb8bvF6ky/tq
        sfQw3J4yVuuLLsL/AKDtToW1L6RXHGTnUW/DPVm0PA==
X-Google-Smtp-Source: AGHT+IENrlbhF1iNvR1huAyEaEEsmMpcqPdlKZ5VLaXjpDnd9sFxC6NV2jkgZmv7mpcKK9U2fIwbDQ==
X-Received: by 2002:a05:620a:bc1:b0:75b:23a0:deca with SMTP id s1-20020a05620a0bc100b0075b23a0decamr8619576qki.72.1694984214902;
        Sun, 17 Sep 2023 13:56:54 -0700 (PDT)
Received: from [10.0.3.184] (dslb-088-075-011-125.088.075.pools.vodafone-ip.de. [88.75.11.125])
        by smtp.gmail.com with ESMTPSA id f2-20020a0cf3c2000000b00655d55117f5sm1503388qvm.81.2023.09.17.13.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 13:56:54 -0700 (PDT)
Message-ID: <744f43e1-93f2-97c8-03b8-f9025386abe0@pressers.name>
Date:   Sun, 17 Sep 2023 22:56:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From:   Steven Presser <steve@pressers.name>
Subject: amd-sfh bug: Accelerometer will not initialize on Lenovo 300e 2nd
 generation
To:     linux-input@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Basavaraj, dear list,

Per the maintainers file, I believe this is the best way to contact you 
about this issue. If that's not true, I'm happy to move this 
conversation somewhere else.

I have a Lenovo 300e 2nd Generation, a "2-in-1". This device uses an 
accelerometer via the AMD Sensor Fusion Hub to detect laptop and tablet 
mode. Despite being attached to the (supported) AMD SFH, this 
accelerometer does not function. When the system tries to initialize the 
accelerometer, it simply reports:

[    8.850222] pcie_mp2_amd 0000:04:00.7: sid 0x0 (accelerometer) status 
0x5
[    8.850240] pcie_mp2_amd 0000:04:00.7: Failed to discover, sensors 
not enabled is 0
[    8.850276] pcie_mp2_amd: probe of 0000:04:00.7 failed with error -95

The device works correctly under Windows, so I know this isn't broken 
hardware.

I've captured a dmesg (with debug enabled in the kernel module), lspci, 
and dmidecide. All of them are available here: 
https://gist.github.com/spresse1/4739eeec0becf6110d605d5f567b7a69. These 
were captured using git revision 
b84acc11b1c9552c9ca3a099b1610a6018619332 of the main branch. I'm aware 
there's a patchset currently in progress for the SFH. I'm happy to 
retest with that, but it doesn't look to me as if it would affect this 
issue.

I am happy to assist in debugging this however I can, including giving 
remote access to the system. At this point, I have debugged this issue 
as far as I am able without documentation (that I believe is only 
available with an AMD NDA).

How can I move this forward and how can we get this sensor working?

Thank you in advance for your help!
Steve
