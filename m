Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9B0267F95
	for <lists+linux-input@lfdr.de>; Sun, 13 Sep 2020 14:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgIMM6A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Sep 2020 08:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgIMM56 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Sep 2020 08:57:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75DF0C061573;
        Sun, 13 Sep 2020 05:57:57 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id r24so16300570ljm.3;
        Sun, 13 Sep 2020 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bUMy3sDLRHc5xhpv5GIiERyZtXBc7NfYeFGM7Ru9W48=;
        b=hZSyBXE6HILb5jc1ydk4PdIkYMODLSQaYIhygodAxkPZ4c6oZAyJr7N0fLYokLUjUP
         1ptre9zNyjKOOM7SsIFH37B1Lj3oHFCXMqLjf4JLHqiF8LC9Vbp5/xgL92e/3L3E1jC3
         UeENZbk7vqhVrxcXhm97j8OGYsYCoWrPs/UwO41r6q88IdKm9acQh4d7FJ47sC84qJcg
         TNLgtMpNjzfBnw6GYPA6RBN09Tl4oSIoiF/usFKhVG3tcku08PPje6wNn/gChgxQ1MRO
         H3pbIrCxcXxNC03NCgYgBtf+8Y3UliDjhoKRqE+3+nNMDgzEYcDY+Jsh6Ky7JbqMxBqO
         Yqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bUMy3sDLRHc5xhpv5GIiERyZtXBc7NfYeFGM7Ru9W48=;
        b=eUrcD/0666Ne8K9qWE1D2kIUEgt1Ik3QF/LgFIoHsb7xNW3u6Ir4w177Ex0iShQD60
         fZYtFvOFgYQ/EfL3CHs4d6dIvb/ppQCFSSyK6IRiuWC3BlXnxYaVXr1X0PFJ5wDf4t6c
         +EJ+z2tBKg0fMwk0hczjYBPvQ64SDh5LENNxjY0LUXcG3OWVwrUdmK7bBCpI+wIrmzd2
         JYZxzjDo9UaBbkDZLXt+wO0VziICKO+wyeENEGdTAiYxB+ssm0MBI5+4CnhJAb4/pyGR
         gtExl4q+sYoYm+V7ybgPL9qO2TvBVtz6EJ8Om3t2uU5rhb9a4ZnpZf7FL/Xn6QtJcT3t
         h83Q==
X-Gm-Message-State: AOAM531yJxeV0R/ZwwGG0ooWi6Us3NbAdkDrc6Yvj6dSR6OnyQG9/f3A
        TRhFJQ52zdhT6JYmylFz22Q=
X-Google-Smtp-Source: ABdhPJxkYEuLdmwH5Va1oA4z4ACGJo68p+viLEYWHNH+M9Ubg9EFdZWnAdpOl2fgZObE7I279fGP3A==
X-Received: by 2002:a2e:1444:: with SMTP id 4mr3319101lju.218.1600001875895;
        Sun, 13 Sep 2020 05:57:55 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id m20sm2868737ljp.132.2020.09.13.05.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 05:57:55 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bd668b99-5b14-f54d-101d-7d56e0c8c4c0@gmail.com>
Date:   Sun, 13 Sep 2020 15:57:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc5YCb-6oRRfVOE5bL_Dmzy0LwDpetxqD-G+E9M=EwA=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

13.09.2020 11:43, Andy Shevchenko пишет:
> ...
> 
>> +       bool retried = false;

> I thought Dmitry wants that to be retry

In the comment to v2 you suggested to negate the condition, hence I
thought it's YOU who wants it to be retried.

The "retried" is a very common form among kernel drivers, so it's good
to me.

>>         u8 buf[2];
>>         int ret;
> 
>> -       ret = i2c_transfer(client->adapter, xfer, 2);
>> -       if (ret == 2) {
>> -               ret = 0;
>> -       } else {
>> -               if (ret >= 0)
>> -                       ret = -EIO;
>> +retry_read:
> 
>> +       ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
>> +       if (ret != ARRAY_SIZE(xfer)) {
...> Also why switch from positive to negative conditional?

This will make code less readable because of the goto, and thus, there
will be two branches for handling of the returned value instead of one +
goto. Hence this part is good to me as-is.

>> +               if (!retried) {
>> +                       dev_dbg(&client->dev, "i2c retry\n");
>> +                       msleep(MXT_WAKEUP_TIME);
>> +                       retried = true;
>> +                       goto retry_read;
>> +               }
>> +               ret = ret < 0 ? ret : -EIO;
>>                 dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
>>                         __func__, ret);
>> +               return ret;
>>         }
>>
>> -       return ret;
>> +       return 0;
>>  }
