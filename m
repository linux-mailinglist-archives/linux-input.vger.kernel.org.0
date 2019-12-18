Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE689124689
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 13:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfLRMLu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 07:11:50 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43871 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbfLRMLu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 07:11:50 -0500
Received: by mail-pf1-f196.google.com with SMTP id x6so22443pfo.10;
        Wed, 18 Dec 2019 04:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fW3KFrO6HseOQQqBlHGHVATIPyS0pICTxBhrZxRg6Ao=;
        b=RCJJMaIeu/HlSnIOwiKuYPpNvHvzmFPQQt0rL9BzMR/Mh6VOf0yZMJYXbgQx8CtvTQ
         OkteBa0IpB+s5h8O54L9RR6SyNt2jXVaquZOqTxYmfmTBgmD+Y0IxiEwMnb+88z6Uh/O
         7ggma1Fqm9NRp9LOXyN30WxI6ES1iCVk0V8H6FpzzGkGDvsHoyr4qfIDktqaNx1bUKkX
         oOANSB+68y6c2hYQc6HCUk9rGVVbOzXV7UpdluknAkbhQjtEwa2hfxQAFZvuaFX3IYGd
         n5kA6alqzYBAID6Xy2u4d53yEqMXilwFvm06cKvy4B9w8UXg6aEnqot4JwzQSi6igJK6
         e+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fW3KFrO6HseOQQqBlHGHVATIPyS0pICTxBhrZxRg6Ao=;
        b=KRO7Wvd8Trrc58wnF8Avn3UKTPcZuM4yz3nx8SBFB52D0W3TszTL1bX+w+7zMpcv07
         42/BcdzDM3tyqoDwG/1c+ZL9N6PHuehx7Z697qfNUMuZqZCYtipaCFVzysAUALNfmGpe
         4eKQ2CDIc9E8YxOFNxgq6iDN7ox6cwMzYJWa4iynreTEC1cRwRdqtxkHnfzZlA9Kh0u1
         5GvDo1c1dT9rysIsl3kmKHQilQQpoT8At0kqWmqcaSiwiKZ/s2uRs3Gw4UztKKwZ4AOR
         K3Xwhf8/+VC3i85r1Bd1E90SkcwtEmUKXOQgWh7hpdy1T8X9rI4Ni40GYNILvOMinDpB
         cnyw==
X-Gm-Message-State: APjAAAUVOTUFaTM1lnbkcVWosblqp9mIJhbYd1YpAJk8xGcUfNR+ZXHA
        GqstY9DRd94hwYVJQWRaTRgZUQpuO2F4Ew==
X-Google-Smtp-Source: APXvYqwDRZQWc+MfJTwd8X2lxpUolE3GCHwewEIdXnQnMuje9Kx0qhkWLTI/sZ0rcGg+szYY4AaNKQ==
X-Received: by 2002:aa7:9629:: with SMTP id r9mr2663274pfg.51.1576671109733;
        Wed, 18 Dec 2019 04:11:49 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.103? ([2402:f000:1:1501:200:5efe:a66f:8b67])
        by smtp.gmail.com with ESMTPSA id l127sm2992697pgl.48.2019.12.18.04.11.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Dec 2019 04:11:48 -0800 (PST)
Subject: Re: [PATCH] hid: hid-picolcd: fix possible sleep-in-atomic-context
 bug
To:     =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191218080201.2508-1-baijiaju1990@gmail.com>
 <20191218094141.785d8e31@pluto.restena.lu>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <e36ad913-c498-4d5a-0a5a-bec016d49a16@gmail.com>
Date:   Wed, 18 Dec 2019 20:11:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218094141.785d8e31@pluto.restena.lu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the reply.

On 2019/12/18 16:41, Bruno Prémont wrote:
> Hi Jia-Ju,
>
> Your checker has been looking at fallback implementation for
> the might-sleep hid_alloc_report_buf(GFP_KERNEL).
>
> Did you have a look at the low-lever bus-driver implementations:
>    hdev->ll_driver->request
>                     ^^^^^^^
>
> Are those all sleeping as well or maybe they don't sleep?\

In fact, I find that a function possibly-related to this function 
pointer can sleep:

drivers/hid/intel-ish-hid/ishtp-hid.c, 97:
     kzalloc(GFP_KERNEL) in ishtp_hid_request

But I am not quite sure whether this function is really referenced by 
the function pointer, so I did not report it.


Best wishes,
Jia-Ju Bai
