Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67DD5196F83
	for <lists+linux-input@lfdr.de>; Sun, 29 Mar 2020 20:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgC2Syh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 14:54:37 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38445 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgC2Syh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 14:54:37 -0400
Received: by mail-lj1-f196.google.com with SMTP id w1so15611264ljh.5;
        Sun, 29 Mar 2020 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GYAAzBuKQAmuhTQi5C5YwP3g4YILwzAZnXWzrjURdgA=;
        b=KwZrTONmO9AAzkVIy3lPGJF74pPun1ptwTKAhfFAfVbN8oLzBIqCJmwn+y1EanxmYA
         Ewd+YWP5eumUUEa2FM2xe2toh8PTmLvR/tokOsHx69LpezfF1+PX0ZJbge9w0nlNKpuT
         ERpaQdkya6A2z+T4XV0XhuVxOXvzzqv5v5BfzLr6piuJPdpjciPr3ZhfO2wCEUjBlZRo
         W08jvHrxE0SDknXf/O85TfKP5v+NV8ILxzgqz0dkgO7W/X4fyUNlXwEj1KiqLnq2032s
         7Ch9fkIu1RQjTMhz3uTMXNef3ijKT9yyOsA6aw380u+mNoLVn/VJR4C+GHsf2VMsFXJf
         7zWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GYAAzBuKQAmuhTQi5C5YwP3g4YILwzAZnXWzrjURdgA=;
        b=XATnmBLsfw4VTl9xuBhUZNI1BTCiAy6xImcQ6il6o4raylkU4QXcxZSmDySgdBiI5V
         wxlfhiCVLJchh2ZFmeSGznd9RbUPwdfZubGJpc5rFhSwGK6RhVQiaucqfBoAhsx8/ZQM
         Uq1KtRnA6MwuGylt5n6t9w+T92f4iSXKgNEgbYJ/VoYU1jRpeLjC6uQC1UIidqyFtLtn
         pDMVpJxmjs3BL1MyzMs5LGQgh4seT5mt3sFI1dTic2paIXwOYUFVEKOeNQdmpcWfD9f7
         niSYll4ZBA8oaqn4kJ7OwDI0bOYGj8JT7PpZg52IJClpTTvUKOPViZt/LBKJIlrhqkvI
         IBHQ==
X-Gm-Message-State: AGi0Pua82gbpvfIcxybTh2CeifiadgBw/0QR5wXtcuQDxETH4qC/OJqD
        RvkyZPli+bh4+nxgAEeCi60=
X-Google-Smtp-Source: APiQypKrQPO4lE2vznr1Ljbdbh8ryIoiXwwFanXMkSLlEFYXQCnOmGnEAclsrhnL2it1W1ig5DiD6g==
X-Received: by 2002:a2e:a0d3:: with SMTP id f19mr5050777ljm.117.1585508075211;
        Sun, 29 Mar 2020 11:54:35 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id n7sm6653891lfi.5.2020.03.29.11.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2020 11:54:34 -0700 (PDT)
Subject: Re: [PATCH v9 13/55] Input: atmel_mxt_ts - add regulator control
 support
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-14-jiada_wang@mentor.com>
 <672615bc-adce-213f-9e44-864163c0a770@gmail.com>
 <85a74259-6f52-34a0-af34-0217a088cc5b@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20d8dbc3-ee0e-95e4-6d33-2ed10c0268c6@gmail.com>
Date:   Sun, 29 Mar 2020 21:54:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <85a74259-6f52-34a0-af34-0217a088cc5b@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

27.03.2020 14:09, Wang, Jiada пишет:
> Hi Dmitry
> 
> On 2020/03/26 4:05, Dmitry Osipenko wrote:
>> 25.03.2020 16:32, Jiada Wang пишет:
>>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>>
>>> Allow the driver to optionally manage enabling/disable power to the
>>> touch
>>> controller itself. If the regulators are not present then use the deep
>>> sleep power mode instead.
>>>
>>> For a correct power on sequence, it is required that we have control
>>> over
>>> the RESET line.
>>
>> ...
>>> +    data->reg_vdd = devm_regulator_get(dev, "vdd");
>>> +    if (IS_ERR(data->reg_vdd)) {
>>> +        error = PTR_ERR(data->reg_vdd);
>>> +        dev_err(dev, "Error %d getting vdd regulator\n", error);
>>> +        goto fail;
>>> +    }
>>> +
>>> +    data->reg_avdd = devm_regulator_get(dev, "avdd");
>>> +    if (IS_ERR(data->reg_avdd)) {
>>> +        error = PTR_ERR(data->reg_avdd);
>>> +        dev_err(dev, "Error %d getting avdd regulator\n", error);
>>> +        goto fail_release;
>>> +    }
>>
>> Hello Jiada,
>>
>> The new regulator properties should be documented in the device-tree
>> binding.
>>
> I will document new regulator properties in a separate commit in
> v10 patch-set

Please make sure that all patches are added in a correct order and that
they at least compile. This patch doesn't compile:

  CC      drivers/input/touchscreen/atmel_mxt_ts.o
drivers/input/touchscreen/atmel_mxt_ts.c:34:10: fatal error:
dt-bindings/input/atmel_mxt_ts.h: No such file or directory
   34 | #include <dt-bindings/input/atmel_mxt_ts.h>
