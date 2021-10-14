Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C31E42DC3E
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhJNO5i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 10:57:38 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:41778 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhJNO52 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 10:57:28 -0400
Received: by mail-wr1-f43.google.com with SMTP id t2so20386430wrb.8;
        Thu, 14 Oct 2021 07:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HS23AmkrFlxiHPWR55rkvfjGcqFY+NS9STXeF9NmTXw=;
        b=YzHaNbOQOpCdQIt+loIbcz/rWpG+2hoEUVZqQOoqlFhg9QQ4iuSdIJUTm03IQRhhRU
         FMd0fPRvtxhmuYA/Xk3Aq4/690H1VL63S80RVzPveuUfWC31gWjpQqA+AUfeM77QFmbr
         bGufeQch5vyxpA5m4k/vM4IctqH9NydnXebDSdlRpzqajsHIRxhGzPCPNKRHrEvQ6B+w
         KkhFgP7uT2OWNRNjZyIDRGxBIfJIhmtgYMg0/AjdiuNRy1wI/kp6APqxLVn8UYfZBU5C
         F2A88NSe7+r+UcOkcQVt1R8VIUmWwxZPIoq0taI/NAkSIBfxIP1/QzKPOzwbOxtu+c5P
         3lEA==
X-Gm-Message-State: AOAM531Sb1swFp1OgezvkbaBHpk2m9wMs4vHIrzj5S7RZC0ooIM98J7V
        BlB+CVkYPeHctdrfD9TB+wDbscWjtLk=
X-Google-Smtp-Source: ABdhPJxQnbdyF6TWa2FhdqQFUOfJZm5E5JuoGCCOc2vgEUcyXmzAwLdIuMN1U5PPn0QrZab1KEbUXg==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr7156093wri.93.1634223322097;
        Thu, 14 Oct 2021 07:55:22 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
        by smtp.gmail.com with ESMTPSA id t18sm2664746wrm.81.2021.10.14.07.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 07:55:21 -0700 (PDT)
Message-ID: <a2964246-f90f-f205-ce99-707cc1a114cc@kernel.org>
Date:   Thu, 14 Oct 2021 16:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        282827961@qq.com
References: <20211014071627.23256-1-changlianzhi@uniontech.com>
 <YWhI/DzNjivU6jQ6@smile.fi.intel.com>
From:   Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <YWhI/DzNjivU6jQ6@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 14. 10. 21, 17:13, Andy Shevchenko wrote:
> On Thu, Oct 14, 2021 at 03:16:27PM +0800, lianzhi chang wrote:
>> Switching from the desktop environment to the tty environment,
>> the state of the keyboard led lights and the state of the keyboard
>> lock are inconsistent. This is because the attribute kb->kbdmode
>> of the tty bound in the desktop environment (xorg) is set to
>> VC_OFF, which causes the ledstate and kb->ledflagstate
>> values of the bound tty to always be 0, which causes the switch
>> from the desktop When to the tty environment, the LED light
>> status is inconsistent with the keyboard lock status.
> 
> ...
> 
>> +void update_value_ledstate(unsigned int flag, unsigned int value)
>> +{
>> +	unsigned int bit;
> 
> unsigned long bit;
> 
> (see below why)

You'd need ledstate to be ulong, not bit. Or am I missing something?

-- 
js
