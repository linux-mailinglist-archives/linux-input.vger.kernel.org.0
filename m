Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A93C193140
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 20:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCYTl3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 15:41:29 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:47093 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727280AbgCYTl2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 15:41:28 -0400
Received: by mail-lj1-f193.google.com with SMTP id v16so3806385ljk.13;
        Wed, 25 Mar 2020 12:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZZS0Rvn5boXXlcKEenVsV6sEBu9lb4z3VYflqBvkEdA=;
        b=GC3qIAhMhdFjiowjeMdKpo1YSavSLstRZjn9/h8d7jH/iQhQzTCBIblcnZuPQLcu9G
         8irNk8/uPHEd6Tmta8DDjpmGFHFyYFp+ukL4FUnIZftVVWpnG2w2tQeTdY3IyOW2B9P4
         vd7GjNpPlRRAs2hxE92Nuj5Je/ejhR0Y7wQr+TOZxfqfMhtqY+EVMYiAbLAc9PtVdugE
         HVZA3F6Pr2maGbamiMrR7uO3Czmt18AJOsS3Mn+ikb9N2OYZtiVP/LTIv+tg9lg1svYv
         TPe1IWERjRBDLzaFfVbs4ueX28VEy2rBDRGBOJRqIX9xcN052VY/P78/fCzeN1BGcb2J
         aqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZZS0Rvn5boXXlcKEenVsV6sEBu9lb4z3VYflqBvkEdA=;
        b=RIyIj+XgEPXQQZtsmMScbSwXdX/n1Rz8+HHOr7Jbxs1zxd0M3qn8r8xN4EqO7Mn9i4
         0Q1mnNwj5sr0qUM6+h1oylZ+efs+H3Ctk0yOFoRnER2gKZB1ImiM8cSB8+5u/ldLQPc8
         F5NEwYEGPDZtonjOy8H4zIniXvtDtHc6h47ty1FKMMGj9EvtErXjvsH8WVmUSj/NJ1Fb
         /EXj41tB00TgdMX+LD3i5NM2SiaZ+BW3wT5FnvrYuuHaHqhqNuw4rvlpPQxPfn4WEUUq
         WpqLzQ5lPkSh8TAKca7VfCQYdTomhAJm2YsH6H+zF3St8Zv0MNohg+zADFmcHBXlNCeX
         Ac6g==
X-Gm-Message-State: ANhLgQ3r4UtQQKSm0A/u0avgPFl2tVXcdSMWxRqKsnQ8jN7MMnMfHRF0
        UuejTgdzChnh32uHPu3J7FE=
X-Google-Smtp-Source: ADFU+vuEChCfzwWRUzzdrSd+BAxzxzAwMrXks4EsnsdCMmDoowBLhmLL8K8Y26A0ABHzH8Pp29zvQA==
X-Received: by 2002:a2e:9b41:: with SMTP id o1mr2982988ljj.145.1585165286166;
        Wed, 25 Mar 2020 12:41:26 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y20sm69026ljy.100.2020.03.25.12.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 12:41:25 -0700 (PDT)
Subject: Re: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs
 entry for touchscreen status
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-53-jiada_wang@mentor.com>
 <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
Message-ID: <fb22c049-d070-bd4f-baba-e094b046ec85@gmail.com>
Date:   Wed, 25 Mar 2020 22:41:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <4aeda6f1-25d8-9437-5cd0-560e43dbe081@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.03.2020 22:35, Dmitry Osipenko пишет:
...
>> +	INIT_WORK(&data->watchdog_work, mxt_watchdog_work);
>> +
>> +	/* setup watchdog timer */
>> +	timer_setup(&data->watchdog_timer, mxt_watchdog_timer, 0);
>> +
>> +	mxt_start_wd_timer(data);
> 
> I'd expect it to be optional and opt-in by either using #ifdef
> TOUCHSCREEN_ATMEL_MXT_DEBUG or having a new debugfs option to explicitly
> enable the "watchdog".
> 

It also could be a kernel module parameter.
