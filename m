Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9222CCF45
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 07:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgLCGab (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 01:30:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgLCGab (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Dec 2020 01:30:31 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44714C061A4E
        for <linux-input@vger.kernel.org>; Wed,  2 Dec 2020 22:29:51 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id p6so572591plr.7
        for <linux-input@vger.kernel.org>; Wed, 02 Dec 2020 22:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HQh1lFfZKkrvI8RCzvCKS9gnwRCn+GcrHQvEziFIixE=;
        b=vecggbur99yWok90VVR2izKCZOB3RBD85yISW4TNYmBeGLENLqLqjCvGKZz2+h6k3J
         i9dDpSiVsHbRosdwp2xoV675AmnwVD9Su+qGYynqFuoFzuD2qwkNF74qwaIU0FAO1gs6
         Vjq2k3SBMgH9+QXozCzPXaGliBuKJ+51lK4EeP5NFqZ887J5RSDRUajRbjOe5Ym7H43s
         8v4HxaSJcKqsPolaVhp/spr1QBvhzBEep+Z1bRxN4Mju9K0j9ZHIjztAjRpJYm+riydQ
         507yXmq40tBytlutPKUGUzpr8UsBmam1Kosf9R8O1mCHkBKLLic6HF1PsA+SfUrETmYt
         Adog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HQh1lFfZKkrvI8RCzvCKS9gnwRCn+GcrHQvEziFIixE=;
        b=LLfukXT44REizzWobmrHMscIQT+mL7d+nnYQsaCotMtdK3I+d4j+2L2QZMhUJl9apO
         uP2Wv9uK6qlQGLf7dhBIVneKYV9NDPzV+F4rCIqUKvB24BkozWrKgQB3ZoeWFVgr9upn
         2Tu6gyLb4NA5w3fOSNIFeB23rtGBGQD/8iHcCQkX2d91qbHrDXFN9M4WnJvEOx+wRVmj
         Ox9Vm/KtNaW48WUGwyg9xvItGaKYKZrnWjStvikYl3yiZHPyD1bpJhkzugx9LgBHC5jw
         Yj7RiNw/1/CgXPw5o3s95KjYvwCSWKVLUC602ZoqZTFnQ7W7qBPM91knlyaI6iVnyjPw
         bOAw==
X-Gm-Message-State: AOAM532d3w9l6X1F8/qhn0Mj99h9Yz9ESzkygm8Qi/SnFfyUZ5s/J9mB
        1ZOtAlS0/3SyafyM+nvy5to=
X-Google-Smtp-Source: ABdhPJzVo089rXr7KnJjFwVoYIAAHo4fUfEAogdUN4XFcQO1awc0SxdjfhLdyQTPx5ID1sJZNEbLWw==
X-Received: by 2002:a17:90a:62c4:: with SMTP id k4mr1712010pjs.32.1606976990863;
        Wed, 02 Dec 2020 22:29:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 199sm491850pfb.219.2020.12.02.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 22:29:49 -0800 (PST)
Date:   Wed, 2 Dec 2020 22:29:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, kernel@collabora.com,
        Dmitry Torokhov <dtor@chromium.org>
Subject: Re: [PATCH 2/2] Input: elan_i2c: Support inhibiting
Message-ID: <X8iF2y6WcfaW4xA9@google.com>
References: <20200430161641.24503-1-andrzej.p@collabora.com>
 <20200430161641.24503-3-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430161641.24503-3-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrzej,

On Thu, Apr 30, 2020 at 06:16:41PM +0200, Andrzej Pietrasiewicz wrote:
> From: Dmitry Torokhov <dtor@chromium.org>
> 
> This also implies adjusting suspend/resume.

This was acceptable for Chrome OS, where we know that nobody is going to
poke in sysfs or update firmware at random times, but for upstream we
need to make sure that device is powered up when we try accessing it not
only via open, but through sysfs as well (upload firmware, calibrate,
etc).

Thanks.

-- 
Dmitry
