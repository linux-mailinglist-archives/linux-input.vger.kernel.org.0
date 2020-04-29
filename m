Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8731BD1C8
	for <lists+linux-input@lfdr.de>; Wed, 29 Apr 2020 03:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgD2BiN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 21:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgD2BiM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 21:38:12 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7800AC03C1AC;
        Tue, 28 Apr 2020 18:38:12 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id u6so879193ljl.6;
        Tue, 28 Apr 2020 18:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OjW/XMFydjf/BLWU0Hg9lEs+gG1GlhabKW4wfh7Ez7c=;
        b=M0t24Wa2GSu5DPJq2YEcW7BqUsBz3Qs3gMSWQ099RtxfeLuT9nQ6rjiSGcU/ZzEpLb
         HRdmJ0dlTlCvrcNvptdmK3czU2W8Y4ZqnWUzgcXGKd0OnpfcRJRE5H8UAi6s7L5hrD85
         4DX7/5eQe+FzXkm9McYrZmXEz18QbJWZfMPERVisn9fp3dG9//OGybjChGUARIITTjAz
         x8q8pDWQDHOc1zKav7+nFB7sxWbRTAxCfJAEwkmfGLOZMqnU0hQu+EGYIfH3RFh9CgJk
         ev2Wy8qznUW5DqK5xZgSXzovJ7qfroqK+Q7rfV4SiGjNdedPZxm66cxM8Pr9pFh6KcAR
         l8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OjW/XMFydjf/BLWU0Hg9lEs+gG1GlhabKW4wfh7Ez7c=;
        b=Xt+AWdxHMIKXMVrENuT8YbGpCzQ/5+cb2YjeXdRks8bjX/37gTv3ehO9FV2G2cvWM1
         II3wvrCZRYETA3hELclHnbcS8qt7in8McoQnmi+CYWus5j19CFP2ZvIos7WEv/xpuvSM
         1TofwB225V4xCgWv6NZpkNEqd90CedMstogxV7m3SA4YSugTbOWVhCL+s5Ai0DOJwlAh
         1rnEM16Av38VC+UXXmeAOzxCXgjAk5F0rjSOdJeWdWW0vHlL35KeB/k3CzCpqjMWzqwQ
         X+OzhvhOQcOIlf23HfDNRlI/GD+bk42WWoL6wotbH1hi2qovIHRGTUEi1qbGJA9efol4
         NtIw==
X-Gm-Message-State: AGi0Pua3mafBRJmOcJdoGEgKqIiA63UOB8DTr6HU8LrkH9OY3rLjx7hb
        VKaCnq39+1pMUhW58/iUu07fYJcm
X-Google-Smtp-Source: APiQypKDGHQB2Jl5bVUa0XkKZPacsr76vHIBXgB9o0d1b1mGKpLZ6razeg5sWFxvcTCcGVfxheoZew==
X-Received: by 2002:a2e:9842:: with SMTP id e2mr19421620ljj.273.1588124290617;
        Tue, 28 Apr 2020 18:38:10 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x17sm1079388lfg.36.2020.04.28.18.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 18:38:09 -0700 (PDT)
Subject: Re: [PATCH v4 10/10] dt-bindings: input: touchscreen: elants_i2c:
 convert to YAML
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>,
        Linux Input <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <222105a9c09ac85f0c03224ef7acb8a6d6e237d5.1587916846.git.mirq-linux@rere.qmqm.pl>
 <CAL_JsqLtvKgZYeb8xqT1nXa1Xja2Dxr6PBKixD6tN50cZ2xH5g@mail.gmail.com>
 <20200428140811.GA4355@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <49cc31ec-be87-fafd-f732-94e75ce6e2bc@gmail.com>
Date:   Wed, 29 Apr 2020 04:38:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428140811.GA4355@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

28.04.2020 17:08, Michał Mirosław пишет:
> On Mon, Apr 27, 2020 at 04:14:15PM -0500, Rob Herring wrote:
>> On Sun, Apr 26, 2020 at 11:11 AM Michał Mirosław
>> <mirq-linux@rere.qmqm.pl> wrote:
>>>
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Convert elants_i2c.txt DT binding to YAML and put into correct directory.
>>
>> Resend to the DT list or this won't be in my review queue. Looks okay
>> from a quick scan.
> 
> Hi Rob,
> 
> This is the same patch that David already sent to the list about
> a week ago [1].  Do you need it resent? (Whole patchset or just the patch?)
> 
> [1] https://lore.kernel.org/linux-devicetree/20200423173253.711725-2-david@ixit.cz/

The whole patchset should be better.
