Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA66E19CA11
	for <lists+linux-input@lfdr.de>; Thu,  2 Apr 2020 21:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731689AbgDBThK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Apr 2020 15:37:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38360 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBThK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Apr 2020 15:37:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id w3so1730205plz.5;
        Thu, 02 Apr 2020 12:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FPiP8vUXNxoiyRoUj40b+YKqluMTxbumtt4fEM2yA18=;
        b=BWt0UHi3bvXJnxNzCG7kvOknquUWEgjXJowEbfKD3nxSIwd2tqBQsM0SA6evKO8R6L
         LhJbJP+pu1D8jyADZxR5OTS5o0pbkIZThwRS8ErNFY7dglpoPwdUOIPalrMYfWMy0z8C
         +4oCnNNjOewqq6V2u8UqIlOHLtzZTeaQgbVillRKx4iH6shH1lf+v2A2YXlheQeESXD3
         NgGP0p3OXkWpV/tXIul+B8Yb6NHr40ghe596KKqdKieSz3xFMqy/Gm7Z2Lbh7q0jrLpw
         m+QuNFgip3MmEvgVuMtjX+Ufdk73N3ziXn95hrjL1ZPX8P0Xvr814+jENCK/Jc0TY+as
         +VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FPiP8vUXNxoiyRoUj40b+YKqluMTxbumtt4fEM2yA18=;
        b=OGJxmDNLI4kVkT7QAD0gTRWFWFhjxQZ2kTVI66oSDg3QY4tROW4jrr9U9V2j0Q5tE3
         kySNn2PGZA7+9vliJEgpBWayOrBnLe00OuLuxItcluPtYL4otD+KHYytF3gLP6qzWTj/
         WfNsHxfo5CTueyFfTnnfHdzErl8Fs/2Ubc/SHDawb1ZjSQwaIc6qvyJSb0wmnqnDaHjE
         wqheQaKlkanQ97DOUu7hC6s6bg98i8qKUM0dD7GK/B52wrh3ts5UHcsqIpjtZflvQKDk
         /kHQUkMz0dzwerY9icPsq/uS1ZdCA2/oF+HOZqqWl7bWjO/n2GHnjOTLMyPY+G2GWpaM
         qcAQ==
X-Gm-Message-State: AGi0PuZgF8pHm07OKACUk0dlJisqR+IQvcyZ/0OyJX/rsOT9J8Deb4mL
        VRUZan59rGUVapaelyJQh20=
X-Google-Smtp-Source: APiQypLSXeGBO7ws3EFv1RYRs4rW2w1BdaNrafCUO61aDthOMuACaK84phNAhgrL87B54gUHSGjLqQ==
X-Received: by 2002:a17:90a:e02:: with SMTP id v2mr5664818pje.131.1585856228509;
        Thu, 02 Apr 2020 12:37:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 6sm4251824pfx.69.2020.04.02.12.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2020 12:37:07 -0700 (PDT)
Date:   Thu, 2 Apr 2020 12:37:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rajat Jain <rajatja@google.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajatxjain@gmail.com
Subject: Re: [PATCH v2] Input: input-event-codes.h: Update the license
Message-ID: <20200402193705.GN75430@dtor-ws>
References: <20200329172513.133548-1-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329172513.133548-1-rajatja@google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 29, 2020 at 10:25:13AM -0700, Rajat Jain wrote:
> Replace the
> /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> with
> /* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> 
> to help coreboot community consume this file without relaxing their
> licensing requirements.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>

Applied, thank you.

> ---
> V2: Update the commit log
> 
>  include/uapi/linux/input-event-codes.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 6923dc7e02982..b6a835d378263 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>  /*
>   * Input event codes
>   *
> -- 
> 2.26.0.rc2.310.g2932bb562d-goog
> 

-- 
Dmitry
