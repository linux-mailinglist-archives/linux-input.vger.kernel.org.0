Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8529914138A
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 22:45:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgAQVpi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jan 2020 16:45:38 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:50566 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQVpi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jan 2020 16:45:38 -0500
Received: by mail-pj1-f68.google.com with SMTP id r67so3715239pjb.0;
        Fri, 17 Jan 2020 13:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hdbxREmxczRqQU5JToc5ODZOnOEFt3tHoh69wB2CxtA=;
        b=NbF0oIJ1+UzCu4tGFT9I3oT7jLWKkJxj7/h7tPqRKm8Dt/nsRnRvsLDPc5XJ3qd65m
         y9+/ZQaS7SYRVTCbzgiVg060KAZFNYiVex3Yw596p+TPE7ZOpph6SZIswS+Z9xgWTJUE
         judq62Q0f1GWV4kMupESjWFi8jeoHAaDgCCcmDkWstxrik5sDRe4POaPEPHVNEJHU3uL
         9/XtiAhu05bqF2Stoqs3dUdy9t7272L/yvZsiiCSWhDXzZcwGIFCHl3NcCX7vMSEU/QR
         jG9qSzeKyU+gfPWLGI8o8OJU7cFEQgFtg1M/V/mBqP9uzCHazE+fj9F3Kl/VpHGUKdkE
         w03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hdbxREmxczRqQU5JToc5ODZOnOEFt3tHoh69wB2CxtA=;
        b=DL3b6fdRkt8+qkSNnDthEbiqtw2M7zHolZfjWug7WboVnDL0kuKLyufzc8UBC3DeJx
         SMW+mG3DUL1ayZwBMF5bi+bSa3emcvTqB8FtgcZnzu2ltK/uBNcuemZ4Gf4U20QFUPG+
         r0xj2TWCLefDANJD0HYfExA3JvwceDTC311q+/A56FfTgG56NfirinlSbCrdh9ooLB99
         Wl0zdl1Ukcy2OssTDrdxa1+VCsZcC8Gt/U59p5UzJuZ3zv2voDdskf/ZMqQhp7mzVBHn
         66GWmpTrEnaXcKRqVxhsXVQXI3nMyQ0YeFKuvZI4GPozPrQIxY0+fcYIKWAo8r4Ko+eN
         CuMQ==
X-Gm-Message-State: APjAAAWs4rZmGaup8vE2pDluiYd4K5oFqIxX92Y0LhVYlw595VyTW3K6
        JME/Snc88/jhvUcygR54Eh7z4Hjv
X-Google-Smtp-Source: APXvYqyK5sZ+W9aqusgZ12ZzcZ2DHMJb+k+dRvkKmdbMvH/S/rovRVvYFNaZ+8jC4DxuPOBpzsM8ww==
X-Received: by 2002:a17:90a:ac18:: with SMTP id o24mr8445577pjq.33.1579297537763;
        Fri, 17 Jan 2020 13:45:37 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y38sm29488735pgk.33.2020.01.17.13.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 13:45:37 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:45:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Oleksandr Natalenko <oleksandr@redhat.com>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: appletouch: shut up -Wmaybe-uninitialized warning
Message-ID: <20200117214535.GG47797@dtor-ws>
References: <20200107204300.1365789-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107204300.1365789-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Arnd,

On Tue, Jan 07, 2020 at 09:42:45PM +0100, Arnd Bergmann wrote:
> Building with -O3 introduces a false-positive warning in this file:
> 
> In file included from include/linux/compiler_types.h:68,
>                  from <command-line>:
> drivers/input/mouse/appletouch.c: In function 'atp_complete_geyser_3_4':
> include/linux/compiler-gcc.h:71:45: error: 'x_z' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                              ^~~~~~~~~~~~
> drivers/input/mouse/appletouch.c:657:12: note: 'x_z' was declared here
>   int x, y, x_z, y_z, x_f, y_f;
>             ^~~
> In file included from include/linux/compiler_types.h:68,
>                  from <command-line>:
> drivers/input/mouse/appletouch.c: In function 'atp_complete_geyser_1_2':
> include/linux/compiler-gcc.h:71:45: error: 'x_z' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
>                                              ^~~~~~~~~~~~
> drivers/input/mouse/appletouch.c:517:12: note: 'x_z' was declared here
>   int x, y, x_z, y_z, x_f, y_f;
>             ^~~
> 
> The variables are not actually used here since the only usage
> happens when both 'x' and 'y' are non-zero, but this is something
> that gcc fails to track.
> 
> Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/mouse/appletouch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
> index 3f06e8a495d8..ec2139c43fcd 100644
> --- a/drivers/input/mouse/appletouch.c
> +++ b/drivers/input/mouse/appletouch.c
> @@ -330,7 +330,7 @@ static void atp_reinit(struct work_struct *work)
>  			retval);
>  }
>  
> -static int atp_calculate_abs(struct atp *dev, int offset, int nb_sensors,
> +static noinline int atp_calculate_abs(struct atp *dev, int offset, int nb_sensors,
>  			     int fact, int *z, int *fingers)

I wonder if instead of nolinine we can have "*fingers = *z = 0;" in this
function...

I feel noinline has to be reserved for exceptional cases...

Thanks.

-- 
Dmitry
