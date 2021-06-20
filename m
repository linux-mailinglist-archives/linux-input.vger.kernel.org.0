Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64D83ADD22
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 07:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbhFTFM4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 01:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhFTFMz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 01:12:55 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78948C061574;
        Sat, 19 Jun 2021 22:10:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id g192so3373317pfb.6;
        Sat, 19 Jun 2021 22:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I5tClPPDZRnDkEOu/F+8xEX/YXqIHz2F79PE0gg5zh4=;
        b=MtMLWSBffpmYWXdy1aFfNrt54rZ1BPl6+nOjYCRvRdyVzXi7hEm1LxR2wyVBnJghak
         duQfGBwPlYEYBal54TZmw2JiLYQRX/trqQno1GqaZ8Eyp3ZIqU7kpO13PjK9NzNxEsO+
         TD+004uWdb8TpG9qwsQ8NJqIlcC7nEVnw67IdbNYJWh/fhzEhTZaXRSNn4AI7shdESaq
         jxTYT28YnY8KpYxNNjax+5TVxFgKMnQwICZCUdCyYa/up+6eL5dlFHMG/SP9xuIwAYbz
         ReXea+wfiycTjBrtcCapB6kNvv4cPT6iX3EELFfN7XMum8y7h49CGMcUWj2y1mjf09Wd
         8lAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I5tClPPDZRnDkEOu/F+8xEX/YXqIHz2F79PE0gg5zh4=;
        b=HBPdZtGGe9u5JvtWLYtTuKhrdVBbV60eyXtWD5/W44wmztMnr4X04liCmmDYT8MRE6
         W7NqC3M+5c+ykyHxVJFO4wj4KnPo0JRjkLkrudGmPI+bVB5pg91mZYNjySzlzCf9UMbw
         n/KDdcpaqCWFK6NSMvWMhxNrzu1eNvOmhnY28isRE8NrmkDLZMZjwODr7fYITH6Cycnw
         RwCYBDrQZFcbxc6kNLR7lrNwrv6kn9ZYIMxTO/FVHF/HHwPJOay5AJccPyeUWNkOEMBF
         WcVgKTfoUkiX5+yHMi534NH6XgqKipYV6DcvaaZVkf9JRxgS0uwy4h2gZOygDGOVPjBX
         IzUg==
X-Gm-Message-State: AOAM532Q2HRAnS1a6X0cvOJgvtU8sgFLxpTg0rUW2UrpBweE+j0hGK1C
        s8bb5o1Qns5vVe0qfoPSdm0=
X-Google-Smtp-Source: ABdhPJzC7uEu00EsJqQWNXT3WzUPKTMozPg72IxJ0U5aKi0L/yGlZ2s3cscHS8IcjejRFjyxNdgsxQ==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id z65-20020a6233440000b029024c735c4546mr13409159pfz.1.1624165840850;
        Sat, 19 Jun 2021 22:10:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b83e:d8b6:9f4f:2be2])
        by smtp.gmail.com with ESMTPSA id g29sm12641222pgm.11.2021.06.19.22.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 22:10:39 -0700 (PDT)
Date:   Sat, 19 Jun 2021 22:10:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Anthony Kim <anthony.kim@hideep.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in
 hideep_nvm_unlock()
Message-ID: <YM7NzYgEl8NhU36H@google.com>
References: <CABvMjLRxy1yqXUOWqTTeq=UOsLtuPAyOSCi4SPgcbAqjMuWCCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABvMjLRxy1yqXUOWqTTeq=UOsLtuPAyOSCi4SPgcbAqjMuWCCg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 16, 2021 at 03:48:51PM -0700, Yizhuo Zhai wrote:
> Inside function hideep_nvm_unlock(), variable "unmask_code" could
> be uninitialized if hideep_pgm_r_reg() returns error, however, it
> is used in the later if statement after an "and" operation, which
> is potentially unsafe.

I think this is pretty sensible, but let's see if the original author
has some comments...

> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> ---
>  drivers/input/touchscreen/hideep.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/hideep.c
> b/drivers/input/touchscreen/hideep.c
> index ddad4a82a5e5..f860a815b603 100644
> --- a/drivers/input/touchscreen/hideep.c
> +++ b/drivers/input/touchscreen/hideep.c
> @@ -364,9 +364,13 @@ static int hideep_enter_pgm(struct hideep_ts *ts)
>  static void hideep_nvm_unlock(struct hideep_ts *ts)
>  {
>         u32 unmask_code;
> +       int ret;
> 
>         hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_SFR_RPAGE);
> -       hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
> +       ret = hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
> +       if (ret)
> +               return ret;
> +
>         hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_DEFAULT_PAGE);
> 
>         /* make it unprotected code */
> @@ -462,7 +466,9 @@ static int hideep_program_nvm(struct hideep_ts *ts,
>         u32 addr = 0;
>         int error;
> 
> -       hideep_nvm_unlock(ts);
> +       error = hideep_nvm_unlock(ts);
> +       if (error)
> +               return error;
> 
>         while (ucode_len > 0) {
>                 xfer_len = min_t(size_t, ucode_len, HIDEEP_NVM_PAGE_SIZE);
> -- 
> 2.17.1

-- 
Dmitry
