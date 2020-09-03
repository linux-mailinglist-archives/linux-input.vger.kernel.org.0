Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48BD125C436
	for <lists+linux-input@lfdr.de>; Thu,  3 Sep 2020 17:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbgICPGa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Sep 2020 11:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbgICPGT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Sep 2020 11:06:19 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E5AC061244;
        Thu,  3 Sep 2020 08:06:19 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id w14so4149180ljj.4;
        Thu, 03 Sep 2020 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ra46f3mjSl5aJ0IfpF0sXUWJeJAxdmPhF+0FxDGLqmo=;
        b=JgDxjdYApcLJWqazHlUGz+EpauRHBZ0jshOn/kECows36v5jEW/iBJPF4MTSMgEexF
         5QQ/kig+hhhkJVQfsyRWPPhABnV5uPRosBXdyOB1mmZoWj6WjBuSUoOzo3FJ0PSCvQ1h
         RfdSyPWUfFpkG4C7n9lhE9eGuWKqlR3TbttEo0jZ2kPw8PESHvpbKvKhzwRdK4Qu71uB
         Vy/ff+yqoGCYU9GWp+6UYxCrEb7j60Q8JVrUf1yMW26YIX2Hkxo01GSJQ279hNMjdDtC
         xFLaeUij+hJ4JQ3nZehjBtZN6v34GqQcfSUweDsFuP7fBvI734O01nX7sO7kL9L6uZo2
         M9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ra46f3mjSl5aJ0IfpF0sXUWJeJAxdmPhF+0FxDGLqmo=;
        b=SOTKNUrcHDCHrE2vXdGVlJkN6EctXBS2lN4iH3lWkHly36CIO9SDBXDg1ITp2p0rpF
         +0tzETeYj5Flf51NIAIIQkssZeBMYmgyFxgo6DvzFU4/H1nzc7bQvCItjfHDOaJKE7Dk
         avdEERrc4FQBEQFecDt7LNkg8HKU0XIBj4oNvBeSBX3m1L7PhL6++1J6qZB6KHPjANn3
         WIml6ElIgTQrskVc5cQ81KeGT+4T+JcfTW3UNgRNoymk/WE6BPcA7/uVf6syBYYBK/cx
         XA4skGmslxQgFsXsy/49iEeY4Py4KbWeWFqTtP96WJBpUlJ6wmsF1Ct4ypirgNE78F/X
         Za+g==
X-Gm-Message-State: AOAM533S0kwaednXLlYBam3IIluts6z7GA5WpT7AVdUwPU3Utmztu8TA
        A5Zk0ik0FNBTPHofRGz9cPNyUA9UDCU=
X-Google-Smtp-Source: ABdhPJzI5LSSLk1Pv2eMlX+j0sGBm/W8MgGYJs0VcInu7QGObglymUk7enJUnJzPeWRtjh7Z1rN7mQ==
X-Received: by 2002:a2e:a54f:: with SMTP id e15mr1417051ljn.115.1599145575811;
        Thu, 03 Sep 2020 08:06:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id z12sm641253lfj.78.2020.09.03.08.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:06:15 -0700 (PDT)
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200821082254.16661-1-jiada_wang@mentor.com>
 <64c77ff9-6d20-abcf-f549-7d5c85fba28d@gmail.com>
 <2c8ed5c8-f95b-dce4-f964-ac16f12c3f20@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8a287e4b-6ed4-dfae-fedb-da343ee40126@gmail.com>
Date:   Thu, 3 Sep 2020 18:06:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2c8ed5c8-f95b-dce4-f964-ac16f12c3f20@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

03.09.2020 17:44, Wang, Jiada пишет:
> Hi Dmitry
> 
...
>> Is it really possible to get a positive ret != 2 from i2c_transfer()?
>>
>> Maybe it's better to keep the old code behaviour by returning the "ret"
>> value directly if it's not equal to ARRAY_SIZE(xfer)?
>>
> I think, theoretically i2c_transfer() may return positive value but !=
> number to transfer,
> original behavior is,
> when ret >= 0, it returns -EIO, when ret < 0, it just returns ret,
> 
> current behavior is, when ret != 2, it returns -EIO, after retry.
> 
> I am OK to change the behavior exactly as same original one.

The comment to i2c_transfer() says that it either returns a error code
or number of executed messages. But it's not clear to me what I2C driver
could return 0 or 1 here and why.

I think it indeed should be better to keep the original behaviour by
propagating the actual error code whenever possible. It's probably not
critical for this particular case, but in general it's always better to
preserve the original error code.
