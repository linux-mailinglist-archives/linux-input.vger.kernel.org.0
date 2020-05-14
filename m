Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FA71D3DD5
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 21:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728060AbgENTpi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 15:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727124AbgENTph (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 15:45:37 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8425EC061A0C;
        Thu, 14 May 2020 12:45:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id w10so4917171ljo.0;
        Thu, 14 May 2020 12:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=y33CB2RjXQSPflCbv7sglflbYuRAcYzmH0WsL8hN1T8=;
        b=hFuUonEOnaooHkyNnKdFyJwtoTY4PSn4SDBC2E89lEkADliphTvBIyK3w3tw0Nr3wZ
         PHjQNjrsMy4yBj43blR56wpbaNTNd1FIOzFHyE5CW2xj5uYcvbrH4YsDKnWCn5hvyuVC
         4/GSQ0RQH10CkvxSuQkXuncFWiNsRgrhxmb4DTZ6wh37Tbnt4mpQlYJMnpTCPLuKz2Cg
         lr3Ovn7uk8UPosjRYqF386eg6BRlvz8j5TA06cbTyI2f/GANAzQyNSNW8MqZ5qc6VLy8
         7qowvDDjVbWBmguG3e1GHhSaWonoCEOOxs3x39qdXmQgalRATRBiRwZQisiZRpmG9PMP
         SoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y33CB2RjXQSPflCbv7sglflbYuRAcYzmH0WsL8hN1T8=;
        b=JKWK0pWvSgVVyDSsaBKuZLGIyU3IEhqGELwgNKbRXja/4azyc7hc8gkDY66PNaX3I0
         xGY0Ibi1Nr7peFr6qhSRFKzv9fF50wgl7/sskSvdkKl9h6s3MwoQS7o49SR90gPdxq1t
         Njt16iptmQEHrH4B/sA5OVVWFpo2w27oyLQHkPoK3cLnN5YoqAxoRppUKIASO4CWIw/g
         Ww6z0DNa8NzdFMwFLfBBdbS+QevUaaH6G42Gai0iY/t/VrrgvS2r5pQn0dpK4JXuQKls
         3KSFNwuJ67LWH0SK6CK2p2GhWz+j72EY+vd7IMPhpRaErdmW1Sz5ZvAPr9/AcdcNb/Wa
         TaxA==
X-Gm-Message-State: AOAM531CUESnnuP9G82iviIM5t5gC70Er2pgF4tMr1fedKHO7flmxsVQ
        mV5Se46PlunThHor7NCNNr7CazZB
X-Google-Smtp-Source: ABdhPJykqJyO1P02hFRHS2axd71wSZUSY02vBScCk8tKoEpJbOnF6CLfArfBlAH4BQxZD5PfeNIr1Q==
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr3765580ljo.167.1589485535792;
        Thu, 14 May 2020 12:45:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m11sm2405321lfo.55.2020.05.14.12.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 12:45:33 -0700 (PDT)
Subject: Re: [PATCH v5 00/10] input: elants: Support Asus TF300T touchscreen
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b1396e50-8fab-701d-cfcf-4fdfd83846f6@gmail.com>
Date:   Thu, 14 May 2020 22:45:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

26.04.2020 20:47, Michał Mirosław пишет:
> This series cleans up the driver a bit and implements changes needed to
> support EKTF3624-based touchscreen used in Asus TF300T and similar
> Tegra3-based tablets.
> 
> ---
> v2: extended with Dmitry's patches (replaced v1 patches 3 and 4)
> v3: rebased for v5.7-rc1
> v4: rebased onto v5.7-rc2+ (current Linus' master)
>     update "remove unused axes" and "refactor
>       elants_i2c_execute_command()" patches after review
>     add David's patch converting DT binding to YAML
> v5: rebased onto dtor/input/for-linus

Hello Johnny,

Could you please help with reviewing this series? Thanks in advance!
