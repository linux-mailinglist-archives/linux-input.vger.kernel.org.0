Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 458D319AF49
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 18:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbgDAQEp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 12:04:45 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42052 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732605AbgDAQEo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 12:04:44 -0400
Received: by mail-lf1-f67.google.com with SMTP id s13so98139lfb.9;
        Wed, 01 Apr 2020 09:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iWNS7KHFyQ5bu6U8NMaMjkVtL1KiyZGuoLdbDiyhEvM=;
        b=tn0ISNgF98ws96k/2OHGrVRl8eUWsYbFOx42rO9b/fIzZP3QuhqIpUcSpz3FQo5Mmj
         IabfzgwkA9Iacz2BrVM4Bg0tbJqT5kgtdqJynXyemmpOWU5lG8VL7jMJzpTPrlyadhZX
         lJ7ndQFYVbYpvvPxh1a3pBORKBijIpygx5NG+OohDj6A0OnWOVbqGH0lqu5ygo3up8Es
         HVNW/DPnZAv4zP+IzOgTucjiBDpJXwNOfK2582XBHGGLYe6NitAldOXx32qiS9wPzaOV
         PeASkLkgkmTwhBc1ThcmUl+VdQ53w1aJerFOTq1snCLOedDhi1+P/ZEHTqfNSCojAkIF
         ncAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iWNS7KHFyQ5bu6U8NMaMjkVtL1KiyZGuoLdbDiyhEvM=;
        b=b/WLyO5DtjJH4UqyjzN2Htz1k9LFR/HPKsyQWOK382HyMTn+PZbP7E1boVB9I7YnSf
         kidhRH0CSAO+KNeQA/5BiL5yqdldY5ISquN9y4mNRLlzm6K/N2tSJC85FsWmj2BDBrmr
         hQyevSMmLqXYJll3cMomtFf6jg1M8b4lX+dIzoCPDKHTO74ZzkoufBPAT4ZjQ5ZdE+Fn
         T/+Y2/ZfCIhNCOXuyAM8ZvK4+Xh12ryECtMXj9eR6kD3C+NKXrMkuRRYHyLaGvAjCZkA
         WdHdM9WvCkOmcwRy0R+teeasdkE6Yy+D6SI0PnYo5Ft8AMD5wDj8K+hfAQpHtGtOB5m3
         mUWg==
X-Gm-Message-State: AGi0PubpFLyKXurBWESeYuGNHiDTxyzn2LOGEFKBj9lAnWx1wO5SYDkw
        aA9eF+sHxEEhAH86/pj7s2w=
X-Google-Smtp-Source: APiQypJU1YqCB9vJfCLpdFLUNS5UY3yUTkwDgqWyE/X6+1zGYi8cVwDX5cWNow77G/IfuQWoFhoH6w==
X-Received: by 2002:ac2:414f:: with SMTP id c15mr10444547lfi.2.1585757080432;
        Wed, 01 Apr 2020 09:04:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b28sm1638162ljp.90.2020.04.01.09.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 09:04:39 -0700 (PDT)
Subject: Re: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization
 during various operation
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-55-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c53637ef-8e5d-3243-7236-5da360021f21@gmail.com>
Date:   Wed, 1 Apr 2020 19:04:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-55-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> From: Sanjeev Chugh <sanjeev_chugh@mentor.com>
> 
> There could be scope of race conditions when sysfs is being handled
> and at the same time, device removal is occurring. For example,
> we don't want the device removal to begin if the Atmel device
> cfg update is going on or firmware update is going on. In such
> cases, wait for device update to be completed before the removal
> continues.
> 
>     Thread                                          Thread 2:
> =========================                       =========================
> mxt_update_fw_store()                           mxt_remove()
> mutex_lock(&data->lock)                         ...
> mxt_initialize()                                //Tries to acquire lock
>   request_firmware_nowait()                     mutex_lock(&data->lock)
> ...                                             ==>waits for lock()
> ...                                             .
> ...                                             .
> mutex_unlock(&data->lock)                       .
>                                                 //Gets lock and proceeds
>                                                 mxt_free_input_device();
>                                                 ...
>                                                 mutex_unlock(&data->lock)
>                                                 //Frees atmel driver data
>                                                 kfree(data)
> 
> If the request_firmware_nowait() completes after the driver removal,
> and callback is triggered. But kernel crashes since the module is
> already removed.
> 
> This commit adds state machine to serialize such scenarios.

Won't it be easier to bump driver's module use-count by __module_get()
while firmware is updating? Or remove sysfs during of mxt_remove()?
