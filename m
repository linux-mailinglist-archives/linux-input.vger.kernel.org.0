Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873503435A1
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 00:09:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCUXIi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 19:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbhCUXIO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 19:08:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B659EC061574;
        Sun, 21 Mar 2021 16:08:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g8so11288635lfv.12;
        Sun, 21 Mar 2021 16:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jbiSYaRoly7YDQ5SJLDPetR8P6ODmQjNdf1sQDmotw8=;
        b=ff+gaXNO3SSTluTB7T2bmC03+xJqcrP0+E+h7VIJSxc+I1w8JJf5Td4SwNSbYg6dxN
         Uqr+C2lKLyZ5ls2FfSIhacn5Qcn6k8gGUTgmQMC9bazdY59ocqmdF1YYWJAgjKDe7Eu/
         UfsZPOnGXLW/UNpzMNO3N3uAca7+Pi7oI2XJkOaqklHLpITIz7buj0CzWCITM7Gqx702
         Ycqg6cgKC6pz05Dnzkf00gepG6WLM74ubsK1HENqCjUZdnQK5hhJASfLjhl6Uh5Yb4+d
         2YhMfIZ/M/o2NyzDCrUFPAXHw2ImKEqyZGHS2IXv+0Ip18DDZhUp3qFJtzQ+Qyn0r1UC
         g5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jbiSYaRoly7YDQ5SJLDPetR8P6ODmQjNdf1sQDmotw8=;
        b=ebMwh1Dxztci/gkxkvOxe3iAUP3HaCIU33JLZeawhvr6CEQ6SZlnadtQf+6bKlpTT/
         uWnn6KSd7IrffbMESGogzdQiCFz7uDhReWnZNrx2PhCAoJj6lTVFSZ9K+4ver392oNyE
         0wOUux+jUySt7Dkv1eATGVAFTEmh1pa4guWt028TaMtf7XT87cqgpC0vm2PxYBudeWoK
         lBh6LGsWYxw+M0gnW9F7n6kCfN2iwbMg4CKCnT2QuNqCXbTdj/qKkfeON4nA8msbkoTY
         k1QOJyoiG7CVmvVzoC0IfSP3GMqBTtSDtqaGaEbp3aoV+9R6izPtx6/bvd3Wm1kM8mXk
         hrtQ==
X-Gm-Message-State: AOAM530QcQLB3H6+frWNPDdKGwexhOeh+gbqlhM6t4gw0Xo88/zFQyod
        1MkKreJlizQNSWJ72UcDKVLOlytfaV8=
X-Google-Smtp-Source: ABdhPJysoMEqRcybkZrFHhug/ztvNZPJzxopxxz3Fm57izRLkvgXGQNrHJ1TXpgkzSICRHLKKfazLg==
X-Received: by 2002:a05:6512:3b95:: with SMTP id g21mr4698937lfv.261.1616368091896;
        Sun, 21 Mar 2021 16:08:11 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id g9sm1361501lfc.258.2021.03.21.16.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 16:08:11 -0700 (PDT)
Subject: Re: [PATCH v6 0/3] Support wakeup methods of Atmel maXTouch
 controllers
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302102158.10533-1-digetx@gmail.com>
 <8c1280f6-b79f-9c62-a064-68b119d74c49@gmail.com>
 <YFfMNQPvaNOjUwBB@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9f1f1bbb-31ef-c4fe-fcf5-c798e53739cf@gmail.com>
Date:   Mon, 22 Mar 2021 02:08:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFfMNQPvaNOjUwBB@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

22.03.2021 01:44, Dmitry Torokhov пишет:
> Hi Dmitry,
> 
> On Sat, Mar 20, 2021 at 07:02:43PM +0300, Dmitry Osipenko wrote:
>> 02.03.2021 13:21, Dmitry Osipenko пишет:
>>> Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
>>> have a WAKE line that needs to be asserted in order to wake controller
>>> from a deep sleep, otherwise it will be unusable. This series implements
>>> support for the wakeup methods in accordance to the mXT1386 datasheet [1],
>>> see page 29 (chapter "5.8 WAKE Line").
>>>
>>> The mXT1386 is a widely used controller found on many older Android tablet
>>> devices. Touchscreen on Acer A500 tablet now works properly after this
>>> series.
>>>
>>> This patchset is a continuation of the work originally started by
>>> Jiada Wang [2].
>>>
>>> [1] https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf
>>> [2] https://patchwork.kernel.org/project/linux-input/list/?series=357875
>>
>> Hi,
>>
>> This series is very wanted by Android tablet devices from Acer, Asus and
>> other vendors which use Maxtouch 1386 controller. Touchscreens don't
>> work without the wakeup support, i.e. without this series. The wakeup
>> support is implemented in accordance to the datasheet and touchscreens
>> are working excellent using these patches.
>>
>> Could you please take this series into v5.13?
>>
>> Or could you please let me know what exactly needs to be improved?
> 
> Sorry, I was still slightly unhappy that we still are not tracking the
> state of controller and opportunistically retrying failed I2C transfers,
> but as I am failing to find time to come up with another solution I have
> just applied your series.

Thank you! I don't have other solutions either, although /I think/
potentially it should be possible to differentiate the I2C error here.
On NVIDIA Tegra I see that I2C controller always gets a h/w NAK on TS
wake-up and it returns -EREMOTEIO in this case. IIRC, some other
non-NVIDIA I2C drivers always return -EIO on any error, so this method
isn't universal, but certainly it feels like there is some a room for
further improvements.
