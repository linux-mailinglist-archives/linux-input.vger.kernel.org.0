Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1CC25E847
	for <lists+linux-input@lfdr.de>; Sat,  5 Sep 2020 16:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgIEOHJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Sep 2020 10:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgIEOHE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Sep 2020 10:07:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597D3C061244;
        Sat,  5 Sep 2020 07:07:01 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id c2so11091502ljj.12;
        Sat, 05 Sep 2020 07:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UsMH9oFKoKw5wtKE8tTX6u0+nR0l/m8vLr2EslovcJM=;
        b=GFsIMyvudYBts5WQ+GafkjGrp1luzKtgFZANgm9aV3Vig+TLrMecdD731YjR+3ji3u
         j4PqZMWyFoAmnKtrLvqXxeQJqSIbHIFZ+RVsK0+A/RXffKGP7OKtUp+7aR6rjkL7VqRH
         htsca8scN5B7lrpi+2QRHRrwCaaBRzm6j0Q40CkTYXNpixZe9qSO1VmEn4ESV4H3M+ej
         w82vDvIbhQRvj8DnrLiAgGI3CEc+gA0zLdbdOYXwkUVh8/vxq7jJhqwOvVfiz11cyhno
         Yih+To6KsxRB7OxS2q9hUpBNXKEhTvzX6/I7u6gzL/x9PI8g4JQbhm6oP3Fthj0G22Uc
         G6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UsMH9oFKoKw5wtKE8tTX6u0+nR0l/m8vLr2EslovcJM=;
        b=ZDo3BPUt99XaCxwkfgjZpnusbxk++YQQJSuaz2VhVqV9yuTq7zH+LUjD+HaUhFsys4
         /O4qE+DaNnOdn+UqZQlHNd9tbD64kY8zUtKYBh7y/6ZcoAIMWOX7bicoEtvEdJuRTElP
         bRuyREGPeP+5Nf1vX/j0x456FJvTbXAaVGOuw9j6fOBsNwBuOqQW8nZzKEUT9c2Gue6S
         ZslHMJIP/XhT5HIp7txkPdo/Z/t1n58eAynu9Hqz1ciAC1MYBR0U9kMk6BcQw9gViP5i
         ffUVVacgknJwQQ3Fwb8WNgP1q7eC1c3w/F/vz6Yn5hffYeFZ4+vmbl0nSQtr2vJtE03M
         5zcA==
X-Gm-Message-State: AOAM530V8MF7HZ3F38MvPx2uZXM4+/gfXpNoYEhO2TcLz7wweNw0rnHJ
        95pooS/RbIp+QbfRJQxZFys=
X-Google-Smtp-Source: ABdhPJwg0eDa1hWo4UPV9eOVCjj/uh3hI1onyI6LNncAurDcSTNdZW1EZv+ZOvUh9KplPjrqolD+VA==
X-Received: by 2002:a2e:9e98:: with SMTP id f24mr6085749ljk.204.1599314819310;
        Sat, 05 Sep 2020 07:06:59 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 68sm2163082ljj.135.2020.09.05.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2020 07:06:58 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew_Gabbasov@mentor.com, erosca@de.adit-jv.com
References: <20200903155904.17454-1-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <88f1aa79-56e1-d41a-a29d-0f7c5d9bd990@gmail.com>
Date:   Sat, 5 Sep 2020 17:06:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903155904.17454-1-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

03.09.2020 18:59, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
> when they are in a sleep state. It must be retried after a delay for the
> chip to wake up.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 63fd7a2cd03c3a572a5db39c52f4856819e1835d)
> [gdavis: Forward port and fix conflicts.]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: return exact errno when i2c_transfer & i2c_master_send fails]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
>  1 file changed, 30 insertions(+), 15 deletions(-)

Hello, Jiada!

Everything works well on Acer A500 tablet device that uses mXT1386 for
the touchscreen controller! Thank you very much!

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
