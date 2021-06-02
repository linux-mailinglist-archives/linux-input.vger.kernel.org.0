Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC1439800C
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 06:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhFBEQK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 00:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhFBEQJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 00:16:09 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25562C061574;
        Tue,  1 Jun 2021 21:14:26 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id k22-20020a17090aef16b0290163512accedso937779pjz.0;
        Tue, 01 Jun 2021 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i3hkQi856Bzw2b3+ep6V1/QEppRq0ZTQAWJW2s33B8U=;
        b=bMlNePzBbMgvUdsr9VLPBJSZOpecPaIN3Ptjl/pW8sPEwALKOzSCGv/4UiUdq7SK0m
         197NmpQQO8FcPS+pAkt5rocKt03B8cyo4yIDw6xIPyTdUYbWqq9xtt7K3v90WXMzeflD
         4D7DRm+6hCr0A31CmYchyvw+9MBhWdKUFa4ZmPaiIRStEwWNGnYmSM/FzE5+mAPKsMlk
         fF4lHSCAVmgR9+jUjdw/WPUojTBZqXqDNPG+cTPQeT6VlrD3CcCRnbwHKpJBUj294lqY
         c6ZGsqtdavbH96twLpI2M9OR7aoMcTohEDMGMxXjlQ08h2URB909gyU9xsct7eF04HW1
         HoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3hkQi856Bzw2b3+ep6V1/QEppRq0ZTQAWJW2s33B8U=;
        b=sjsZLUgFdBrnbKEvoF53q1vMfsv8Qdp0nq6vyU6ShYmRn+AVLVWdEoAs/Qeeek1Xkz
         1K7aT9jGTwHLJJvdjgAJsrpeDsWkU5FFo3LZ0ExdgcTsNSJup8IoySA3rS6JpDKbli3A
         g0qVzsTjLDSBwwd/wyCMZO4IajsiC49N4UkjeKgeF9xkkdv6+gm0Z9sHmNKuErfI6Haq
         VEG8jfXqHqVjrnf0ZZqRBBOFuzVzpCIPSp/B0rMJsSL3YBIg2u6Y50Y3SPSuU5RIo0N0
         8PjNAZYHus28OpGbsjNiGWFB5LDx0+zneXwNIfi0j1605SngQmezXuv45u5EUiOmYBC8
         bk7g==
X-Gm-Message-State: AOAM530FEOtqkZRNs5ugts20mNeC7i8hH/ssI3f5MGH4Z70JXqCc3itN
        ZE0GviMsfekJRZooXRUm+24=
X-Google-Smtp-Source: ABdhPJzNYMxGAcOwEVl8kogJ/9Xc2vh61vG9tm+a8eIWwAekweNar07LyilbVs98bMO8gMZmNMMj7w==
X-Received: by 2002:a17:90a:b28d:: with SMTP id c13mr3390668pjr.80.1622607265599;
        Tue, 01 Jun 2021 21:14:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a596:b3cb:1a6:1ee4])
        by smtp.gmail.com with ESMTPSA id z5sm14676987pfa.172.2021.06.01.21.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 21:14:24 -0700 (PDT)
Date:   Tue, 1 Jun 2021 21:14:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Input: elants_i2c - Fix NULL dereference at
 probing
Message-ID: <YLcFno/z0+XtAI3a@google.com>
References: <20210528071024.26450-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528071024.26450-1-tiwai@suse.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 09:10:23AM +0200, Takashi Iwai wrote:
> The recent change in elants_i2c driver to support more chips
> introduced a regression leading to Oops at probing.  The driver reads
> id->driver_data, but the id may be NULL depending on the device type
> the driver gets bound.
> 
> Replace the driver data extraction with the device_get_match_data()
> helper, and define the driver data in OF table, too.
> 
> Fixes: 9517b95bdc46 ("Input: elants_i2c - add support for eKTF3624")
> BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1186454
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied, thank you.

-- 
Dmitry
