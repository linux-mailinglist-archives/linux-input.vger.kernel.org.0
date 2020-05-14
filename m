Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8881C1D2611
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 06:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgENExr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 00:53:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbgENExr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 00:53:47 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278E7C061A0C;
        Wed, 13 May 2020 21:53:47 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id r17so1426156lff.9;
        Wed, 13 May 2020 21:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JV+sxUdFOhEyDczRx6GrqOwClj4olBpIsLuQqAp2XRE=;
        b=t//QhNx7KmG0d0ZfpVSb1+M24XomDrqF6cL88YDUe2dnW9t1e883+x2ye8bCEqDH73
         yh+yI/LUSNF8QWGUwyRuvtb0ci7sdxzju1E69m7QYMXIzD50yVqhIOyPGm9j0z/IpP5v
         g/X5LVm9pqlgmUUwZZOrsuvuxJEs+WhIzdjCI+AEY/e1OKzsQ1G3jrOVCP15qovfUB3L
         JqR96u1YE+KIEckvsrR64kkApMRfxTUAi0CgqzRZqm9ZRo3XVZsloC82yT14XoPb64U2
         Nhbiynd6AUKIcER0o3TaeVH/acse0s4okgqO+pYtUdRagD3llebYiyFWE8b5IwcmzfA9
         2ozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JV+sxUdFOhEyDczRx6GrqOwClj4olBpIsLuQqAp2XRE=;
        b=N7HfYjb3+TSBMDMiDztQYQxRPNzYhI9tos6WPhWgJdDS8/6BiklmFYE4BIkZ/P0aEC
         UXRJjW98MIcJppb/DIJE1ApTtB4ErIYy2LEhoMKgGKo2Gnn6nW1WSW5lC+TDIYfAwnn1
         IWqlWkvzrRzzE1OpeBKJZmp8x0iC04SaZbjJ9KCCAVDdLUc/KweSuEBq4ZaSc1dWif2m
         +pSWEW6uOE3nhe0GhN0uzD+mX8nClQLOdtOu5ekQzh1bUxeJwlwnJLLG4cYfWLDSnGyK
         pOrw5/TS1/rBWBMhsKDYhcsA2EckGJ/WzPZ4OsQLgioMj0HS6/FtdmXz3YKZRsGo/nHi
         By8Q==
X-Gm-Message-State: AOAM533b13NdTRPSfavP1zVcmidN6fQ0jSATG7Fl0/fQZ4ZIK3pWNOx+
        JGQ2IOg48/niuzt/v4lX0jo=
X-Google-Smtp-Source: ABdhPJxMkUCa0Jt19pwvXDbnDR/kEKhPFIHPsQYl4Vknfa2RZqF2s8yJyRHlBnZcXEuvrbs4dX8JMw==
X-Received: by 2002:a05:6512:1051:: with SMTP id c17mr1911854lfb.206.1589432025595;
        Wed, 13 May 2020 21:53:45 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x8sm742454ljc.56.2020.05.13.21.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 21:53:44 -0700 (PDT)
Subject: Re: [PATCH v11 33/56] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-34-jiada_wang@mentor.com>
 <3a942afa-c047-2c88-1c8e-a90fa018738e@gmail.com>
 <6af23ae6-2f1c-0459-d2b6-1b01ddb0c3dc@mentor.com>
 <c88d24ef-e0e0-db3b-1000-b21af906eb4f@gmail.com>
 <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <63c93fc0-ac09-ec77-c590-08e419734205@gmail.com>
Date:   Thu, 14 May 2020 07:53:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <aaf99a11-037e-93d8-93e4-d83e3aa4a42e@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

13.05.2020 08:07, Wang, Jiada пишет:
> Hello Dmitry
> 
> On 2020/05/12 8:13, Dmitry Osipenko wrote:
>> 11.05.2020 05:05, Wang, Jiada пишет:
>>> Hello Dmitry
>>>
>>> Thanks for your comment and test,
>>>
>>> can you let me know which platform (board) you are using for test,
>>> and DTS changes if you have added any.
>>
>> That's this device-tree [1] without any extra changes.
>>
> I am using Samsung Chromebook Pro for testing,
> but obviously some of the use cases it can't cover.
> 
> I also would like to test on same device you are using,
> would you please let me know how to boot Acer Iconia Tab A500
> with custom images. Are you booting Linux or Android on it?

I'm using Ubuntu 20.04 on it at the moment. In order to boot custom
images you'll need at least to install a custom recovery, which will
allow to flash boot.img on eMMC storage.

Ideally, you'll need to install an unlocked bootloader that will enable
Android's fastboot, and thus, allow to easily boot kernel zImage without
messing with flashing boot images.

Could you please tell what is the current state of yours device: does it
have a stock Android installed? is it rooted? is custom recovery installed?

My device was unlocked about 8+ years ago, so I'm not sure what's the
best way to do it nowadays. The XDA forums [1] could be a good starting
point, I may give you some advises once you'll tell what's the current
status of yours device.

[1] https://forum.xda-developers.com/iconia-a500
