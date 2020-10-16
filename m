Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8E4290765
	for <lists+linux-input@lfdr.de>; Fri, 16 Oct 2020 16:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409091AbgJPOmZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Oct 2020 10:42:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395258AbgJPOmW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Oct 2020 10:42:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DC2C061755;
        Fri, 16 Oct 2020 07:42:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id j8so1629932pjy.5;
        Fri, 16 Oct 2020 07:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iMkXsCfghoDoYrHRrQkOVjUl0T169CFkkrvO3XpulfA=;
        b=dsexvZ9gAreNbK3jvwKyURTWrMJHVAHgjkl/HT1BkfF8GmAVC8RIrkJ1ciemAwmgSp
         NVl3x3YhQ0HYB29u1o53bTfpn/36j5WvsVVFPG0aINWioScLvjcIzhTVzXY7cLyZc79B
         xyyRaKD/jMkwBxG0dKNIYtf5HbR5DWXptetg231LFXyUkVfjpYm5v5ekNciO6i+LyJG/
         5RZF2eyDoyUfa1z+Q8ATE9bTXtk9UZ7CI6fecdRSvzO9wQTXYFjw2/NjpV7tmdwsEGTc
         S8ZNBrzqa4ZvDdq1ZnJHqeJQqAtdOVL2bIC7CjHBJJFqbUvHZtW8SjEffEBhJJC23r4W
         FAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iMkXsCfghoDoYrHRrQkOVjUl0T169CFkkrvO3XpulfA=;
        b=UzfUGmkEQmSUd5fsfmDCu+2ZuI3PwGWXIcf+PFw2jSjPWyGFDM4+tc4CX6Llm6ruc9
         TfVji5SJIvbhxkpODmSB880e5Nv7Emhfd/4Tr3kKepdzL+odCv/RpdxaT1ZJQnL+eJX0
         9De3Lm0p+kG/nG+jt8Xih9CIZDV2HzemvF1/LAedFl//+rU4y+8hvV9NMoCyzXVxMhTX
         ATihF9DRyt6gSlNoC9gG/njmiEu7LdBbTyFxHHc6PJDqFH3O2RNuTy/uUWoqi9LVm8Xh
         /HEAhqpQI0dCA/ARtzXf4B1MZUIdoEtvrMo6kUo1Vv/ZqPD4ZJ9QPuWM6LdZsH/KWiON
         HFKg==
X-Gm-Message-State: AOAM532Jwbsiq1YhrxNxrY+R9HCSklYzMTx13QC5zUafGa27clFWT8Kz
        B5vCWpcBOj7kYX2poUKACBU=
X-Google-Smtp-Source: ABdhPJwXG23v5i+LVBr+a/DMY1BJjClrSrYnl0ZuaEbwOCtKPHYECXjLt83bv4kJgRxR9LXIOVw0yA==
X-Received: by 2002:a17:90b:4a10:: with SMTP id kk16mr4470498pjb.77.1602859341566;
        Fri, 16 Oct 2020 07:42:21 -0700 (PDT)
Received: from localhost ([160.16.113.140])
        by smtp.gmail.com with ESMTPSA id p6sm3468203pjd.1.2020.10.16.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 07:42:20 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date:   Fri, 16 Oct 2020 22:32:00 +0800
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: i2c-hid: add polling mode based on connected GPIO
 chip's pin status
Message-ID: <20201016143200.tev62sbttbac5kci@Rk>
References: <20201009081100.3154-1-coiby.xu@gmail.com>
 <t_cZwIcdajFYTSx2_B2UCOxOZLfPVBz3goQ7mtcy1g1lyok_u0sGB5nKWhZ2AX0p4-_EhwMwjGzp50wv3SYfNa3PJQWrhkk3AN5MisD9TJg=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <t_cZwIcdajFYTSx2_B2UCOxOZLfPVBz3goQ7mtcy1g1lyok_u0sGB5nKWhZ2AX0p4-_EhwMwjGzp50wv3SYfNa3PJQWrhkk3AN5MisD9TJg=@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnabás,

Thank you for reviewing theis patch! I've Cced a new version to you.

On Thu, Oct 15, 2020 at 10:33:50AM +0000, Barnabás Pőcze wrote:
>Hi,
>
>I believe this patch causes I2C HID devices not to work with IRQs after resuming
>from suspend.
>
>
>> [...]
>>  #ifdef CONFIG_PM_SLEEP
>> @@ -1183,7 +1292,8 @@ static int i2c_hid_suspend(struct device *dev)
>>  	/* Save some power */
>>  	i2c_hid_set_power(client, I2C_HID_PWR_SLEEP);
>>
>> -	disable_irq(client->irq);
>> +	if (polling_mode == I2C_POLLING_DISABLED)
>> +		disable_irq(client->irq);
>>
>
>The IRQ is disabled when suspending if polling is *off*.
>
>
>>  	if (device_may_wakeup(&client->dev)) {
>>  		wake_status = enable_irq_wake(client->irq);
>> @@ -1216,7 +1326,7 @@ static int i2c_hid_resume(struct device *dev)
>>
>>  		if (ihid->pdata.post_power_delay_ms)
>>  			msleep(ihid->pdata.post_power_delay_ms);
>> -	} else if (ihid->irq_wake_enabled) {
>> +	} else if (ihid->irq_wake_enabled && polling_mode != I2C_POLLING_DISABLED) {
>
>As a side note, I'm not sure if the 'polling_mode != I2C_POLLING_DISABLED' part
>is necessary (or that it's necessary *here*). It causes 'i2c_hid_resume' and
>'i2c_hid_suspend' to be "asymmetric" which - I believe - may cause problems.
>
>
>>  		wake_status = disable_irq_wake(client->irq);
>>  		if (!wake_status)
>>  			ihid->irq_wake_enabled = false;
>> @@ -1225,7 +1335,8 @@ static int i2c_hid_resume(struct device *dev)
>>  				wake_status);
>>  	}
>>
>> -	enable_irq(client->irq);
>> +	if (polling_mode != I2C_POLLING_DISABLED)
>> +		enable_irq(client->irq);
>>
>
>The IRQ is enabled when resuming if polling is *on*. It should be enabled if polling is *off*
>in my opinion.
>
>
>> [...]
>
>
>Regards,
>Barnabás Pőcze

--
Best regards,
Coiby
