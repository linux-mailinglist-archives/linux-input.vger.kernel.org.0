Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350AA396D0E
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 07:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhFAFyw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 01:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbhFAFyw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 01:54:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF96C061574;
        Mon, 31 May 2021 22:53:11 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so771208pjp.4;
        Mon, 31 May 2021 22:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lqON9VvRMYtY3TS3rJ01Odi/G3/qx8aIRfhaH8/TG6I=;
        b=iQDc5qyF39yFWDBI8uxvPb+o/V1Hi8/haZCnB3JfV6yv4QdVJBjj4se3De0psaiE0Q
         cMz0oN6LuKtf+no9BpUprCnly2KMuLgLHH6jRCYCAztwWB7gjtnn8BQCkA0dvgrxKQkB
         KYsOdpjjvHfzcNqUtraYgmk3+BJrUPLVJKSP6dDywRtBoRLPoNwZvdmi+Ehha7I9L7er
         vnZEYhdyzV6jUsXvc4B7rhW3ranFoG3ZIz1m6Yw3KuLXwzVGrBTKfWCulehC67gywtNd
         r0PjiK+WYgWgoiTSyWGJCcGvurL1mBbPnVT53LuYA/hv6KbDDLHvDEzqaxV1+VkY3+at
         N2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lqON9VvRMYtY3TS3rJ01Odi/G3/qx8aIRfhaH8/TG6I=;
        b=RlWtkwl/RRoGPoUIgb+MgfJ5bzXCV1cU5xJdxXjIlDz/deMSfVsdtK/biQqHWoCjWk
         SxPVg8xfpyCOO5jdAbS+o+yHEpO8GA/gtewHQqiQVwMJNLTqQXUU2xKVEeSha++ct/Vm
         LRqcJ1xy0WVyNNwGLxSe7Ued5ieOGVNVhngaIL6XmcEDYcbD0tqyfq/9HqSfP6gA+lJO
         zDbJn5056nxRg3C6PwdQnzR2MY47dG6o3N9NhXNhdYsO0DUPNVWRolBmdvpR1M02naFd
         h3NGiyIeceoq9yg5Cr9ZqSAeeGB1QOGXvqIBSOVtZKA/VlGK+8hMrm3WWGdj6kY92UOi
         V10g==
X-Gm-Message-State: AOAM532Q6zeMYWrVyzBN8kC2StQ0VeoGgf3JDggUHWSnQWSF3i9AnsfU
        luIfjYPLdnR2YB8gUwjh/tA=
X-Google-Smtp-Source: ABdhPJxh4U0RShORepgUSrqEDG5fyYH7barnt376xjdEOLKO+RnzCzR5+PN5zsw02VODnKScr8JBuA==
X-Received: by 2002:a17:90a:aa96:: with SMTP id l22mr3004201pjq.173.1622526790870;
        Mon, 31 May 2021 22:53:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f313:c4c:d05e:895b])
        by smtp.gmail.com with ESMTPSA id d24sm2095852pjv.49.2021.05.31.22.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 22:53:09 -0700 (PDT)
Date:   Mon, 31 May 2021 22:53:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>
Subject: Re: [PATCH v2 1/2] Input: resistive-adc-touch - describe parameters
 in kernel doc
Message-ID: <YLXLQw0fYfKvXYTx@google.com>
References: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528151113.85943-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 28, 2021 at 06:11:12PM +0300, Andy Shevchenko wrote:
> Validation script is not happy:
> 
>  resistive-adc-touch.c:53: warning: Function parameter or member 'x_plate_ohms' not described in 'grts_state'
>  resistive-adc-touch.c:53: warning: Function parameter or member 'ch' not described in 'grts_state'
> 
> Describe parameters in kernel doc to make it happy.
> 
> Fixes: fb082cd59afa ("Input: resistive-adc-touch - add support for z1 and z2 channels")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied, thank you.

-- 
Dmitry
