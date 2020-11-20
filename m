Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15332BA0F2
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgKTDQ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:16:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgKTDQ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:16:27 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1479C0613CF;
        Thu, 19 Nov 2020 19:16:25 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id q34so6076046pgb.11;
        Thu, 19 Nov 2020 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eD/5xkWUAHR646bINov2q5AR6yqigj4BioqPckntjEQ=;
        b=EC4MRfX1BxLv/Ss4sF0QHzjPQXVyuIHboOv68Y+CHpv0DCB72sJ4ePZpY4HQzfPO/k
         qZYnI/teQEy2UXHiPZYl9Gp13m56bVUqWEtIVTpwcPoCXK41EFVcAlQ8/1lqscJ668od
         GtB3UneFunqUDPr5usCucqamsyIuycyfI8glIfMGlf3bQz64DCtTb5FAO8TZNU4iT+CJ
         VyLSpjAePAI1T8wKWptf94rGEK1AwhdEaqq08yHPOSG92yqtQHyj4YmBxouxBMuiJWzl
         F3Q4wF4BCKO7v3xJmc44BzToeP/tsITSqy8DuaSfY/BtwLkyuUEcGc2OwLRwtn/uehvh
         buKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eD/5xkWUAHR646bINov2q5AR6yqigj4BioqPckntjEQ=;
        b=XUmJv+LptKpKULCjf9bs+fQV78jRGz6r/DSZv4gsixyQj3ePORagoxJCmcDwyz7nII
         YHIdjz7/30OaZ0LkUvXAj6dal2w1/h26/uzoc4QZYTD6PoLRRehk7UK3x8g0rbLSfEhW
         IgDLCycWBf8dB/OYGKvwBClFFo6q9to/LRMZ7Q3HesRx95cScYYYEeeSgIvcq0y/Vu0m
         mNV8l3K/VY5IdgPAMyCbjrvJKM9FvbDnP9WFGMe4gtzekqHjknyciqf+UoXDylLGv1/O
         QKj2n136nacpjODI+6+tdn/4PNq8g7FilnypV9AVyp3Nc+AZWk8GuF1agF8Fr5to/lZo
         2+qQ==
X-Gm-Message-State: AOAM530vEeuRazhyDDWOAHYEMo9EklpWYh0+1gzCNGhI2xkwnQoeUiCh
        XG3RcnWF7RMRlBrDegjv9+4=
X-Google-Smtp-Source: ABdhPJwbU5MYa8K1RsbOkaahMNtqA7feCJ55B/h1BtsEutEEMgzIcwo7Yz7tBXigaMHE2KeXAv+uEQ==
X-Received: by 2002:a63:5f14:: with SMTP id t20mr15709260pgb.305.1605842185359;
        Thu, 19 Nov 2020 19:16:25 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c11sm1390809pjn.26.2020.11.19.19.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:16:24 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:16:22 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        De Schrijver <peter.de-schrijver@nokia.com>,
        Felipe Balbi <felipe.balbi@nokia.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 03/15] input: misc: mc13783-pwrbutton: File headers are
 not good candidates for kernel-doc
Message-ID: <20201120031622.GM2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-4-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:52AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/misc/mc13783-pwrbutton.c:32: warning: cannot understand function prototype: 'struct mc13783_pwrb '
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: De Schrijver <peter.de-schrijver@nokia.com>
> Cc: Felipe Balbi <felipe.balbi@nokia.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
