Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7148331777
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 20:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhCHTlD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 14:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230299AbhCHTku (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 14:40:50 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DE4CC06174A;
        Mon,  8 Mar 2021 11:40:50 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id nh23-20020a17090b3657b02900c0d5e235a8so3750407pjb.0;
        Mon, 08 Mar 2021 11:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FX3JvV2x234PQm7yAoaVpeGYnaHDVKU4FehRSM1ykkg=;
        b=HCz1A039NrYgPV8+0rLFTJmiKz7gnvaC3IDWeFdU2kzeuWoOB1hB7gfGchIWhuPdAM
         1BjJ8dDuvdaRSQcKtuK7Hjpc5gPoDEAbdP2tphtWGHGklAaK+vofASIl5eUF1+s3xZSy
         gGD8iV3gRWfRxtyqfCenbDl/UozMImS9am74zNslfe7kw+Wf6ARRbNks5oq/rItFw/zp
         Ni9CIVtDqXvKMd4M+lNZcu7cv1xbQcC6Y4vDbfyWIeQYfVqmG2SYgpEHpFnSMPXgFHVA
         bxO86WnbelgX2bGcAZWjAQZQO3JuX6jEFMVuyVm/SUnW+lAvqVuoeb9vHmH4ky6PMMea
         m/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FX3JvV2x234PQm7yAoaVpeGYnaHDVKU4FehRSM1ykkg=;
        b=KvgIpjtR66GT6r7L3/5+HW0eF9XffXVDKD8cNURBfmbX3DXxiTQFACAzq3ekfxBVy2
         v2Of+sswtExeJZjdFsOe0Txccok2araGVVHID+WtNS6PStXMfs7fsCsJYkF0rOSOMPfo
         /I6VyGKgRksrCYcCmy8luysAffRXMWTHccfuqpJIKZ8eoIVtv8ihB5M/+r6E4MFaFuHa
         povT3h4b7Q+Km7/XIrwrOyNPk1hoqwzd+6/WEe2MtrJM7q+IbBIYLa60nANHtAq87gzV
         7Ikfu1nn+vmOMXEgWe9voVnfqEqgi7yibO3ffme1v8vijUp7/d9BFJJDjyYYBT5pSPb1
         JG1w==
X-Gm-Message-State: AOAM533QGNzbV/Zid+0E9VMA9z58+gEv1nRfA4C17qT903nTe2LKdU2a
        bvRKyE+X61Y/yFt9kpYtcuAGa0ZzuMs=
X-Google-Smtp-Source: ABdhPJyU4SXQ2Z/p9G7DKhEo8sZ9i5FjYpjaLu/IhhM5mRczjSLn3ZOgDxpjjtIi2QfNQiBlPOOvnw==
X-Received: by 2002:a17:903:2301:b029:e4:700b:6d91 with SMTP id d1-20020a1709032301b02900e4700b6d91mr22670501plh.19.1615232449568;
        Mon, 08 Mar 2021 11:40:49 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id u17sm10171740pgl.80.2021.03.08.11.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 11:40:48 -0800 (PST)
Date:   Mon, 8 Mar 2021 11:40:46 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Lauri Kasanen <cand@gmx.com>, linux-input@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] Input: n64joy - Fix return value check in
 n64joy_probe()
Message-ID: <YEZ9vkue/E1yPeIS@google.com>
References: <20210308122856.2177071-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308122856.2177071-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 08, 2021 at 12:28:56PM +0000, 'Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_platform_ioremap_resource()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> 
> Fixes: 3bdffa8ffb45 ("Input: Add N64 controller driver")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.

-- 
Dmitry
