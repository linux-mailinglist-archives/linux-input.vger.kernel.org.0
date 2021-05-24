Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6661A38DF74
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 04:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhEXC7F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 May 2021 22:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhEXC7D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 May 2021 22:59:03 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4281AC061574;
        Sun, 23 May 2021 19:57:35 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so10423882pjt.1;
        Sun, 23 May 2021 19:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DLN82YuNwAlCFtlUSDusCIgv35O2E/4+WTxv4o97xsw=;
        b=sHTH9ES2SevxoIyrvR9tGS7q4Vd7zIRhK4oQ4QI5YtG+NBhfKe+edMzAq8at4HL6dV
         DSpRjLsYRTcQCLRCvjQ40ZTWfkqK+xYjm8CAeHJgFIYScD6o1W/tY80zPmy6n/Bzblzj
         pkPmGRVjueEEnS5Jk0fHty0kVXOHypMsRP5nZbnervljAgpP98GwXhvlkA+PROQeUrSG
         scPKGu6Jr8qkMaspsrjb+HU46w9RuSOPmS/hmufwSoZULjsbB0eK7y/0CZMmyvwHzqYr
         BDqDzDKusdKSmH6grf7wvw162dcAJeuOBZd3Ze2kTzrK4/Htf8S9YuKpIrzvCskg4YeM
         oQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DLN82YuNwAlCFtlUSDusCIgv35O2E/4+WTxv4o97xsw=;
        b=lYP7QYg0JfgN08YYtujrB+Q2NbX3A1VYWQwTo8NyZxTUfBgIvt4s3a/1uzdJQLUric
         b0XIG2mCISzCLIgw9nFE86/L6S9f47AjLqkz6kSwIvT72G7dE+fDPTFtOOZHhd60Prcc
         IChi7f59BKT+8/+t/4B/jC/5G8kbSB/sMB5wiyXUJGDbql6a2VpbtGblPlRukDkIj3/r
         jLF2/vqtKlgLTSobHRbrYWsHpTFNOid03KWKZbyXgeyJOS1ELBJfBCgFu/TwdNHpYM22
         bYCBwMB+QPcnwU7nq2z9o2VU2CBJl/dgSHfoSttltmxEToO3H/j0USFwboxwOS4HtMLL
         gHsg==
X-Gm-Message-State: AOAM530T9sNj9c55kXpGRIYF2yc2EstIzTk0IGbUFttaiTi4ZN8o/c/9
        48oxhrdnqbaUCyed16EzLHU=
X-Google-Smtp-Source: ABdhPJxNSV1EicODTfpx0FKla+3NPhEzcP06cYksyFWhv65SQQ+Ypw6EVAh6Vetml6gi7JsfN4shVA==
X-Received: by 2002:a17:903:189:b029:f1:d67a:5168 with SMTP id z9-20020a1709030189b02900f1d67a5168mr23309087plg.82.1621825054224;
        Sun, 23 May 2021 19:57:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3d40:b62d:7929:6f57])
        by smtp.gmail.com with ESMTPSA id m19sm8971329pjq.41.2021.05.23.19.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 19:57:33 -0700 (PDT)
Date:   Sun, 23 May 2021 19:57:30 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hao Fang <fanghao11@huawei.com>
Cc:     xuezhiliang@huawei.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, prime.zeng@hisilicon.com
Subject: Re: [PATCH RESEND] Input: misc - use the correct HiSilicon copyright
Message-ID: <YKsWGjy/0u/T8iO2@google.com>
References: <1621677987-11009-1-git-send-email-fanghao11@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621677987-11009-1-git-send-email-fanghao11@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hao,

On Sat, May 22, 2021 at 06:06:27PM +0800, Hao Fang wrote:
> s/Hisilicon/HiSilicon/g.
> It should use capital S, according to
> https://www.hisilicon.com/en.
> 
> Signed-off-by: Hao Fang <fanghao11@huawei.com>
> ---
>  drivers/input/misc/hisi_powerkey.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
> index d3c293a..54cbfdf 100644
> --- a/drivers/input/misc/hisi_powerkey.c
> +++ b/drivers/input/misc/hisi_powerkey.c
> @@ -1,7 +1,7 @@
>  /*
>   * Hisilicon PMIC powerkey driver
>   *
> - * Copyright (C) 2013 Hisilicon Ltd.
> + * Copyright (C) 2013 HiSilicon Ltd.

I see there are various versions of "Hisilicon" in copyright notices. I
do not know if capitalization here matters and which form is correct.
If this is important I'd rather HiSilicon folks submitted such
patch(es).

Thanks.

-- 
Dmitry
