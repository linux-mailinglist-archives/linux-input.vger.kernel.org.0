Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035B3445BCB
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 22:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhKDVsE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 17:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231154AbhKDVsA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 17:48:00 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B418EC061203
        for <linux-input@vger.kernel.org>; Thu,  4 Nov 2021 14:45:21 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id r5so9560884pls.1
        for <linux-input@vger.kernel.org>; Thu, 04 Nov 2021 14:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JWx9ct2MbjImA6H/WvO058+827HmSCDeJJGYWZ5NWKI=;
        b=B0nLjg/Un1RR8JO88l4pjO/r40QMXp2NKWLOT8gleROTy83KBOS+lF4w9BC+N5Ioq0
         M8bgTpM76+k0f6GHJDCplbtrZ8g8sQxnoKAkzpFVhEiz4SpSE8yvyy+bPNe9HOBo3xzV
         /Wz2WuZ1KL/kBkyWJd7mLDWnE9FE4GQyRtI4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JWx9ct2MbjImA6H/WvO058+827HmSCDeJJGYWZ5NWKI=;
        b=fS34FIsO4jzDwWV+7h1F9R1JIggMVMmpsb6FQxzbVPfGxSARTQnEYvjq8aGaD/ENTX
         wSDnAaL9ygd7Faro6TwUgbTdhPutsrb8JN70Q24Klvc9CEHNIPR1bBSjS2hRFJ6JA8t3
         mLBushDeW08LB0b1r6AfDnCuDcBnDJJEfqgzZRBOVWrtsdNyjw5Rk2GMRTKC/6gZMVvu
         QResK/xX3JFqSByUYWloiP/jL6+nWa45cZsXyTNyAlBdnv+YWQS6GiKK+W4QRp+heHY4
         ZfaKH+6zPi3p8we/T97COPg1+b9TM5Jt2Fy4sLHUtODMofAb1io0rCZb8jMh0SItkfVh
         9yDA==
X-Gm-Message-State: AOAM532TcS2DqwN1kP4XQJu19eplLzhPpyQOpi9FjGQBxRd2AaZ8Ohnv
        MTSDBEyuv8qBMnaR0B0LYXbzWg==
X-Google-Smtp-Source: ABdhPJxqHMDw5YqGMlZwg7dpWo0+rcl7UStC/9wzlqsDbweCwI/3ZPYSoXpZo8EXmcankBbq9Sl1aA==
X-Received: by 2002:a17:90b:1c06:: with SMTP id oc6mr24886431pjb.126.1636062321332;
        Thu, 04 Nov 2021 14:45:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:49a7:f0ba:24b0:bc39])
        by smtp.gmail.com with ESMTPSA id e7sm4473408pgk.90.2021.11.04.14.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 14:45:20 -0700 (PDT)
Date:   Thu, 4 Nov 2021 14:45:18 -0700
From:   Brian Norris <briannorris@chromium.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        kbuild-all@lists.01.org, Andrzej Hajda <andrzej.hajda@intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-rockchip@lists.infradead.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>
Subject: Re: [PATCH 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <YYRUbhWH1MlDvSsR@google.com>
References: <20211103164002.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
 <202111041849.GKXf3qid-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202111041849.GKXf3qid-lkp@intel.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 04, 2021 at 06:47:34PM +0800, kernel test robot wrote:
> Hi Brian,

Hi robot!

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

I'm not sure how to do that in a v2 patch -- one doesn't normally credit
"Reported-by" for every testing/review improvement on an in-development
patch series.

> All errors (new ones prefixed by >>):
> 
>    or1k-linux-ld: drivers/gpu/drm/drm_input_helper.o: in function `drm_input_disconnect':
> >> drm_input_helper.c:(.text+0x48): undefined reference to `input_close_device'

I've cooked a local change to separate the CONFIG_INPUT dependencies
under another Kconfig symbol which optionally builds this stuff into the
drm helper module, only when CONFIG_INPUT is present. That should fix
the build issues while still leaving DRM_KMS_HELPER workable with or
without CONFIG_INPUT.

I'll wait to see if there's any other feedback before spinning though.

Brian
