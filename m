Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2ADD35628D
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 06:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348542AbhDGEex (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 00:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348533AbhDGEeu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 00:34:50 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3917C06174A;
        Tue,  6 Apr 2021 21:34:21 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id p12so8057821pgj.10;
        Tue, 06 Apr 2021 21:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dawPF/pjVD7LgRw0JR7Cm2wKXSZMbJ/Cb5+jKR5MuyM=;
        b=jjmJmwBWiAZmV5RABT814qHGqk+S+qJFWr9+7eVsj+JOsvpXNrw5ikddHFsNmfkl4c
         mtg/PQt3+4z026rZuTwfPwTXOJnhmRRYFohWfAzvw6IJEb2Vad4DVPtyaeA/pUFKlwxq
         Y1zVW6eGZNCDbqYW1SPCLYf2shd0f4gXAD9IgyX0B9jphnsZP3s2it3Tob0moqJ2pTov
         wGx/PON3I4GmUKGNQVV8M0NrhdIzIbiuA9uWldfWpbDie0wRnT8AS2GovlFS6k1lCuhH
         6wuSHwfKp9UOhmPM5x8qlVZWtjFbpUDNDowuSIiItIPdBW4kzXff5uUCyPTdrEOcbGlv
         Ss5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dawPF/pjVD7LgRw0JR7Cm2wKXSZMbJ/Cb5+jKR5MuyM=;
        b=i4NuqtiqM0SqZizslvwzjNWkoV7NKEfX84aUx2wEy7TKGKnYU0HxxhcWE236srVSXm
         4f86tD27erwnJY2XSVxxbQMVH6/NRZU0ILWxiFoO3ijiA/oN24JZnJ0zOuXzJawDuvpL
         gCxqduGncGfV28QuIapQa5V/3hbQ8o6XvEBafmJDHbBPeARBVcnDBXJzV5oKjaUsU0AE
         qb9JRsTFS3pdU7JijwLDc9l2GnXV6LsvuGLUtcuJW4bRCO2w9v+QrOIV824OqUzHM9sH
         V+5Co5k0SbJvADliRSshP9H7jDfMl3m55TOCoGfLIgR2uiIK4pLjQSbGdrPYtn2fz1dR
         354Q==
X-Gm-Message-State: AOAM530FemIM4WwzYzQE+jBI5c5AG5xxKu52XFvZcy33omwQHsdG+oyW
        YjrnvX4DiPtk6/vh17kIFeo=
X-Google-Smtp-Source: ABdhPJystnWyTQA2g2TH/eg/PGsE3r0/CXsndGjIzG79kXJPOLoIyQ4gGriDAALYhl5NfJ1gzC2wRw==
X-Received: by 2002:aa7:8a84:0:b029:231:ff56:2c7e with SMTP id a4-20020aa78a840000b0290231ff562c7emr1279863pfc.50.1617770060916;
        Tue, 06 Apr 2021 21:34:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6c0c:9cca:cff7:99cd])
        by smtp.gmail.com with ESMTPSA id n25sm19384173pff.154.2021.04.06.21.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 21:34:19 -0700 (PDT)
Date:   Tue, 6 Apr 2021 21:34:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] input: gpio-keys: Use hrtimer for software
 debounce, if possible
Message-ID: <YG02SZA22Jd71B2t@google.com>
References: <20210307222240.380583-1-paul@crapouillou.net>
 <20210307222240.380583-3-paul@crapouillou.net>
 <YFpe6EhydawiMjHB@google.com>
 <YGwds97OjXIdZF3L@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGwds97OjXIdZF3L@atomide.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 06, 2021 at 11:37:07AM +0300, Tony Lindgren wrote:
> Hi,
> 
> * Dmitry Torokhov <dmitry.torokhov@gmail.com> [700101 02:00]:
> > On Sun, Mar 07, 2021 at 10:22:40PM +0000, Paul Cercueil wrote:
> > > We want to be able to report the input event as soon as the debounce
> > > delay elapsed. However, the current code does not really ensure that,
> > > as it uses the jiffies-based schedule_delayed_work() API. With a small
> > > enough HZ value (HZ <= 100), this results in some input events being
> > > lost, when a key is quickly pressed then released (on a human's time
> > > scale).
> > > 
> > > Switching to hrtimers fixes this issue, and will work even on extremely
> > > low HZ values (tested at HZ=24). This is however only possible if
> > > reading the GPIO is possible without sleeping. If this condition is not
> > > met, the previous approach of using a jiffies-based timer is taken.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > 
> > Applied with minor edits to make more use of debounce_use_hrtimer flag.
> 
> While testing Linux next I noticed that this patch causes a null pointer
> dereference at least when unbinding a gpio-keys instance, see below.

Ugh, my "minor edits" did screw things up ;( as I mixed up release and
debounce timers. I'll fix it up.

> 
> Regards,
> 
> Tony
> 
> 8< -----------------
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c
> ...
> PC is at hrtimer_active+0xc/0x98
> LR is at hrtimer_try_to_cancel+0x24/0x140
> ...
> [<c01c43b8>] (hrtimer_active) from [<c01c50f4>] (hrtimer_try_to_cancel+0x24/0x140)
> [<c01c50f4>] (hrtimer_try_to_cancel) from [<c01c5224>] (hrtimer_cancel+0x14/0x4c)
> [<c01c5224>] (hrtimer_cancel) from [<bf1cae24>] (gpio_keys_attr_store_helper+0x1b8/0x1d8 [gpio_keys])
> [<bf1cae24>] (gpio_keys_attr_store_helper [gpio_keys]) from [<bf1cae80>] (gpio_keys_store_disabled_keys+0x18/0x24 [gpio_keys])
> [<bf1cae80>] (gpio_keys_store_disabled_keys [gpio_keys]) from [<c038ec7c>] (kernfs_fop_write_iter+0x10c/0x1cc)
> [<c038ec7c>] (kernfs_fop_write_iter) from [<c02df858>] (vfs_write+0x2ac/0x404)
> [<c02df858>] (vfs_write) from [<c02dfaf4>] (ksys_write+0x64/0xdc)
> [<c02dfaf4>] (ksys_write) from [<c0100080>] (ret_fast_syscall+0x0/0x58)
> 

-- 
Dmitry
