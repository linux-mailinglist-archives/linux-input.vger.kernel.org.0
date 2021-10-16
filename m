Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39175430060
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 07:09:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239431AbhJPFLg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 01:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbhJPFLf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 01:11:35 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E77AC061570;
        Fri, 15 Oct 2021 22:09:28 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id e65so8066902pgc.5;
        Fri, 15 Oct 2021 22:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=24zhKxPRI1qAH/u6peG/m0WB+y6ivb8dz0+PvNxUJWA=;
        b=W940VigsR3CYoeN1X3pboXBZj5igcjNH23xB3qLkWYRZKM5WeBuDJKvSVCB4Ixw8W4
         qbFLq8Oo1O8Upqgy4yoEX4nhYixyEfv909N3S/RD7oiZMft05Lq7JJwPeCGKnYHoYw6T
         Dan7lbWTE3Mmbpr0BZpzC+0nPY4yTLJ2/Bbk61+ShfrfuUdZOTs9wp74hKqXv+x70aNk
         EvJ3OltD5foT0i1tMMjbA6L91TGU2DXa7Q000lunWYl7CpFttPfGdeiTmL4YO+Dh5Leb
         MDme0D3XACU48PmBk+uBIp3q4B1gfpc5v6KHLbip2+unRZUcy51woYHKkRZyJ8XX5LXk
         LdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=24zhKxPRI1qAH/u6peG/m0WB+y6ivb8dz0+PvNxUJWA=;
        b=zmaXOSRdKL899FN6aBwzMYP2c4ulGSugRhVU4WWMWalxUEo0o9HCgT+XS+fvAd7qlT
         /HRllrFbaM7Eogx53wWoGM5lWP0yAaGdA4Eocfii/UicyKPKMnECO8X8oasVdbzCdven
         7leHG3wrpkx2/wN8KclBwkMeXjUNzamoh/CqWM//8DKV8/nK3hrVIWeG0mi0+CgS1ZDB
         7+KR2y8ROTm1yjv/xOmO65MzHbrgHBfK2+nUxoQrbHfljZpVJHneeYRk6uG68kX5S/xr
         SpgUAOqbAXDJDauKaat9coxifg8jqXa0fqygfocEDkG82owh9rfzku66L6WgMwk/8YGQ
         pfOg==
X-Gm-Message-State: AOAM531MN5KrzLWPq/rZ5kw+AmZLfC+AxnZjxVzVVfPJNOj+KQHF1zaQ
        WI9AMILNHO+rKTjKFsspAqY=
X-Google-Smtp-Source: ABdhPJx6ii6DULysM1xvC3deh4Uof19/0PgnVCLqiEQFZM8B/m5KruQ+7q62gU89F/tmlJFbJWwi/Q==
X-Received: by 2002:a63:f557:: with SMTP id e23mr12445171pgk.175.1634360967487;
        Fri, 15 Oct 2021 22:09:27 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id t2sm6262272pjo.4.2021.10.15.22.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:09:26 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:09:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        linux-input@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] input/misc: max8925_onkey.c: don't mark comment as
 kernel-doc
Message-ID: <YWpehFWNrtyTKkGc@google.com>
References: <20211002045943.9406-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002045943.9406-1-rdunlap@infradead.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 01, 2021 at 09:59:43PM -0700, Randy Dunlap wrote:
> Change the comment to a normal (non-kernel-doc) comment to avoid
> these kernel-doc warnings:
> 
> max8925_onkey.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * MAX8925 ONKEY driver
> max8925_onkey.c:2: warning: missing initial short description on line:
>  * MAX8925 ONKEY driver
> 
> Fixes: 3734574cac100 ("Input: enable onkey driver of max8925")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: Haojian Zhuang <haojian.zhuang@gmail.com>

Applied, thank you.

-- 
Dmitry
