Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E59A268511
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 08:41:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgINGlx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 02:41:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgINGlw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 02:41:52 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283B3C06174A;
        Sun, 13 Sep 2020 23:41:52 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id y1so4428430pgk.8;
        Sun, 13 Sep 2020 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4j1wpOUPZHYeQ1KVLH9A1rpuv7I2GduTgKoNqY9anMs=;
        b=vLNKNVjk8xz0T5qxS6P/lGl7L9Arz+li5WH8yqk5J0GGRqNFFiPTgyGsqkzPuBGitl
         ay1omB2RkFXq3gpjwAthhRYl0NVjv0YcSfPWUKXxIgVRzWjm9cjz2eCcSi4OlFH0buQk
         iSisMcPFsZ4fYKJlsL+UdPI81HHPSFndgsby1XeMpxoqb6KtGZ4vOVAVGQzpaw7BlsIw
         WLw/vtiLEpqMrA8TM5OO/GH+RLtkaehTKI+ek9eH6pMfBa6bSzAIWZYiGdEE3uXsWFiT
         CMChBESV2i6xGomImzR3uLcs7wcoidKFyQg31mQygvTbPbl66uUx9wzPQ/KYeSnwJECI
         Z6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4j1wpOUPZHYeQ1KVLH9A1rpuv7I2GduTgKoNqY9anMs=;
        b=Es1Gi0XOTOUD/ywjrmIT9sz5PwwCmjvONx1eHk9t7mCJJxPzDO8aZq/jgXS8napxjK
         xONDXhKG55tx54wl5sSEPfYfOy8ZfRWNkbsw5RUgalZXkf2AENCz3ZkhRBShDa7ZV1Hn
         HykYDZfOPFh9l9BRVevCQl8sFlvquck0MznLJKM4K5jzmBqyP6lDB+kfIRXqe1rFEt+W
         i7eoONbuEtOo67KUHSNb+yTD4zifI5Fv/bF12oLielO3PHCnESFgjR6/yb48nga+MfyS
         t3BZ6B4zgcGVGt1OqSZ4Xzk6U1pMb7C7isnDI/ukc9ESpMSzHTsRzVeDFGQYBC8bXByG
         rE9g==
X-Gm-Message-State: AOAM532ZPcwUz0X6vb48ZQWVN7xDd5eoPmKl7ENpleYIT7kthnSfR4Y2
        9B6UPjSqmMuvBHZI8Ccx3lU=
X-Google-Smtp-Source: ABdhPJw0F9PhngxvikWDC7OchP5PgExFmrZfIqUPNBIT8COwaL4Oeof9JeVKX3qIvc2BxksSxiNJig==
X-Received: by 2002:a17:902:9349:b029:d0:cb2d:f26c with SMTP id g9-20020a1709029349b02900d0cb2df26cmr12836255plp.5.1600065711632;
        Sun, 13 Sep 2020 23:41:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id k11sm8231303pjs.18.2020.09.13.23.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 23:41:50 -0700 (PDT)
Date:   Sun, 13 Sep 2020 23:41:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH v3] Input: elants_i2c - Report resolution of
 ABS_MT_TOUCH_MAJOR by FW information.
Message-ID: <20200914064148.GQ1665100@dtor-ws>
References: <1598581195-9874-1-git-send-email-johnny.chuang.emc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598581195-9874-1-git-send-email-johnny.chuang.emc@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 28, 2020 at 10:19:55AM +0800, Johnny Chuang wrote:
> This patch adds a new behavior to report touch major resolution
> based on information provided by firmware.
> 
> In initial process, driver acquires touch information from touch ic.
> It contains one byte about the resolution value of ABS_MT_TOUCH_MAJOR.
> Touch driver will report touch major resolution by this information.
> 
> Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
> ---
> Changes in v2:
>   - register a real resolution value from firmware,
> 	instead of hardcoding resolution value as 1 by flag.
> Changes in v3:
>   - modify git log message from flag to real value.
>   - modify driver comment from flag to real value.
> ---
>  drivers/input/touchscreen/elants_i2c.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index b0bd5bb..661a3ee 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -151,6 +151,7 @@ struct elants_data {
>  
>  	bool wake_irq_enabled;
>  	bool keep_power_in_suspend;
> +	u8 report_major_resolution;

I renamed this to "major_res" to match x_res and y_res, and applied.

Thanks.

-- 
Dmitry
