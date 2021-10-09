Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79CA54276E4
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 05:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244025AbhJIDVJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Oct 2021 23:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbhJIDVI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Oct 2021 23:21:08 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FAAC061570
        for <linux-input@vger.kernel.org>; Fri,  8 Oct 2021 20:19:12 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m21so4881743pgu.13
        for <linux-input@vger.kernel.org>; Fri, 08 Oct 2021 20:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nCaOKyBAqK9mCc0D7z4MubrtxO/9OtX6eQe3E8J+Zhg=;
        b=n85o1wWf1FMgjJfUAW/eNXKhjC+eEHAAViOEhGeMl9BLIk1/y5bcqRVet31kueGwYt
         TLxljax0yY/im7ofm/ydpWsJdz6mWCNrezphkd/aPN0BkAXSI3FeaHrkiyO2Q/0B9xcw
         8a79fJEMXX2QwGolC3ZvWfPqRVOIEzH78ZiR+5qY8QB2fqY6JL6CxSFG3sC/+lK07O8P
         fyczqb52lbs4RckEdHMe3pQ7uGGzNlx2blu2cS5mMnXP1Y3PhPbZieqSMigdFJAHiPoc
         EKyeEzcRwP0OgcJtUvkR/SYuRC1YnrxTi8v2kphRRYTIIykmAi1O+J31oU99ckpJtjsI
         PWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nCaOKyBAqK9mCc0D7z4MubrtxO/9OtX6eQe3E8J+Zhg=;
        b=j9xGGeNFsZgDMIYgjpRVCfy8IY3nL5D3EAoGZDrTzav7RUCwlZsECUawKs/xqf4PSg
         8II0ufPp4j7LidnRJBL3wyWEoCv5/5RANwfvIgp5mJGuxv0K9MVuBkzODTwwK4zsts5C
         3y5hmlLB1Jl4d4TwbKJK/mrbrQSoObbSbyGfZhjUVxA2iCHuN0cVh3OAdbHaAtUv+Eh7
         epnkcuu10X9v8Z4rqdmywfJ0stSLeZamB1oCDfar3xNgMu3fnuYbkbf5noQ1hUX6sKbO
         o8SvccOKpJCNbW+c/zgxo1Pq4FUacnX6YMZ7onaNiTbtf5a+rodfjkg/6rtupphcdfqk
         ymXQ==
X-Gm-Message-State: AOAM5326hSXcXTo497cXq5Kjy0ovRV1vhjNEgvG/42h33mLLNmxmUCrv
        aKHZ3qr4M6abq2YVXuXcWHs=
X-Google-Smtp-Source: ABdhPJyF4zzz+H2u14cGwWRqzujF+r0BDgXCwxHQad98rH4Z3iQEDwfb9ZAW0ivj3xEEyDDwIYlHoQ==
X-Received: by 2002:a63:3549:: with SMTP id c70mr7731642pga.179.1633749552219;
        Fri, 08 Oct 2021 20:19:12 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:911d:6b77:beeb:9ec4])
        by smtp.gmail.com with ESMTPSA id u1sm505015pje.47.2021.10.08.20.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 20:19:11 -0700 (PDT)
Date:   Fri, 8 Oct 2021 20:19:08 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Ryan McClue <re.mcclue@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: PROBLEM: Evdev epoll_wait Lag
Message-ID: <YWEKLNg3ZzGZLpfn@google.com>
References: <99GfWMtkpJutp6wuEhYJ3aIfNVfE_fr3TVPeQWsr9QSvNMgTk23Aml6WYEucd6D3qkmeIFbunUu6a6g0VNppEKIYrz7w43fzGyl3BUXVkDQ=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99GfWMtkpJutp6wuEhYJ3aIfNVfE_fr3TVPeQWsr9QSvNMgTk23Aml6WYEucd6D3qkmeIFbunUu6a6g0VNppEKIYrz7w43fzGyl3BUXVkDQ=@protonmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Oct 08, 2021 at 11:29:51PM +0000, Ryan McClue wrote:
> Hi there,
> 
> PROBLEM:
> 
> I'm on a laptop, with 2 connected keyboards (built-in and USB).
> When I hit keys on each keyboard simultaneously in a program like firefox,
> gnome-terminal etc. stalling/lag occurs.
> It only happens for keyboards it seems as moving an external mouse and trackpad
> together causes no issues.
> 
> TO REPRODUCE:
> To investigate the problem I wrote a simple C file
> (see attached 'evdev-lag.c', compile with $(gcc evdev-lag.c -o evdev-lag))
> The program finds keyboard devices under /dev/input/event and uses epoll to
> poll them for input via the evdev interface.
> 
> If I start entering keys on one keyboard and then switch to the other, the
> program stalls briefly.
> If I simultaneously enter keys on each keyboard the program stalls indefinitely
> until I stop entering keys.

I do not observe stalls but did you mean to essentially busy-loop in
your program? epoll_wait with 0 timeout causes it return immediately,
you want to use -1 if you want to wait indefinitely or give it a real
timeout.

Thanks.

-- 
Dmitry
