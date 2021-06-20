Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEAC33ADD42
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 07:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbhFTFhq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 01:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhFTFhp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 01:37:45 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764D5C061574;
        Sat, 19 Jun 2021 22:35:32 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id t9so11342782pgn.4;
        Sat, 19 Jun 2021 22:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pxjfMrty8dM/qfDv6FJcgTV6itFfbDFw/iZ8LFErne4=;
        b=LDGuu/KX2GxsFfrk/kngVFCLvDNk65jZyaEEjdG7wS8eJ9bKOnheBgPXKCrxJ2HEDe
         HsX7LoFMeedywTHZbPIZ7moc05uX5jf4/NFsSmOCZLwbYacT0Y+th1xYkfpRhQ4F1LQB
         JiIZty+CL5oE/TzExBfOdFMGELTPrEuznBfBBaN8y0Yca7yHbwDbB+satdvyP9E20Iwb
         hCk++VYbETyQci9fjTNmDzZPFblGIQv+PpBx29LaVuboGgn9ZUiYM6TPFB3Ay0b0SkXA
         O+Tn5Ai4pSpsfPF4H0ehKvQEcezjLtPLSRcNjEcIwVTsogiP9tE+167lFlP5yC240ghT
         BNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pxjfMrty8dM/qfDv6FJcgTV6itFfbDFw/iZ8LFErne4=;
        b=g6e2+O6CYZOMQ50J1PxOkOP9lftNgDTZm9R/oLXGCZlZbwtPr8eyoWTW7Jpa/9X7Vl
         SxuPyIPww5b6ekzOmXdIhx4i1o3LkLT6XsnX/+masW+wVvrHLYcna3uuFSHiL3reGGdY
         hjfmHAH95RrMvzispWJyzCD3fOL+d8avGJ+lM6OwGlthMgDvijqE1/IiDXbnOfuBRLLh
         VhDk8IEMXicGxQsAYOemhsyTcyigJZKRoJISvZjA86L8ANkvoJO8VQ6BMA/p9rDZKZmY
         jD7t8U4y8FeDpOR8dvyN31+w59mQyfIZmhkImAXZ++QvbGzHR1GX9wyc0MsopB9KUt40
         WkCQ==
X-Gm-Message-State: AOAM532RCx0Hvtqf16Kul8vqho7H342xG/PsGtndMQfeH4iLYSwZdjsW
        R9s8hHD3ktw3S/32+KiQjnQ=
X-Google-Smtp-Source: ABdhPJyZgHZKtGRvHGNVV0nEsJz22HkT7RCEKPlCAR1XxaABLYgGrVDQaEBFMjDqGVe8tgnbJbwUwA==
X-Received: by 2002:a63:6884:: with SMTP id d126mr18233414pgc.368.1624167331798;
        Sat, 19 Jun 2021 22:35:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b83e:d8b6:9f4f:2be2])
        by smtp.gmail.com with ESMTPSA id b18sm545349pft.1.2021.06.19.22.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 22:35:30 -0700 (PDT)
Date:   Sat, 19 Jun 2021 22:35:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yizhuo Zhai <yzhai003@ucr.edu>,
        Anthony Kim <anthony.kim@hideep.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in
 hideep_nvm_unlock()
Message-ID: <YM7ToLeaDajmBiwi@google.com>
References: <CABvMjLRxy1yqXUOWqTTeq=UOsLtuPAyOSCi4SPgcbAqjMuWCCg@mail.gmail.com>
 <YM7NzYgEl8NhU36H@google.com>
 <YM7RkI8fvpkfwAGA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YM7RkI8fvpkfwAGA@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jun 19, 2021 at 10:26:40PM -0700, Dmitry Torokhov wrote:
> On Sat, Jun 19, 2021 at 10:10:37PM -0700, Dmitry Torokhov wrote:
> > On Wed, Jun 16, 2021 at 03:48:51PM -0700, Yizhuo Zhai wrote:
> > > Inside function hideep_nvm_unlock(), variable "unmask_code" could
> > > be uninitialized if hideep_pgm_r_reg() returns error, however, it
> > > is used in the later if statement after an "and" operation, which
> > > is potentially unsafe.
> > 
> > I think this is pretty sensible, but let's see if the original author
> > has some comments...
> 
> I guess not. Oh well...
> 
> Applied, thank you.

Note that I had to make some changes to make it compile. Please next
time try building your changes before posting them,

Thanks.

-- 
Dmitry
