Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA10F2FC7AA
	for <lists+linux-input@lfdr.de>; Wed, 20 Jan 2021 03:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728131AbhATCTm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 21:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbhATCTh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 21:19:37 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B08C061575;
        Tue, 19 Jan 2021 18:18:57 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id kx7so1185345pjb.2;
        Tue, 19 Jan 2021 18:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/a+f4k/xRYb9VW3It87QkaFiw1Q2EwqXZUwb84ELXzk=;
        b=utps7xbfdD2m2CBSRzvXCIkiwWz7Ls/7auAx3Dtz0iHV79MedBjizj6WVF0Oqnhr8z
         RP+Nw5WcqZLBBMyBa5+lXbP0eaaBuAmpIEGRE9N9CGISQe7MWVrCms4oqE1Kv+sjoOzz
         bfIFwDCyzeHYwnlNCldB4JshVymi8lsE6NnRK1ZQKoLHKonou429kSw+lxoxBPaFoZ6m
         JTt2XfpNt13zHH/NiL287cd2SF9PTg1i3Aq4EViHD93ZzMYQGarn9vaGa+qXODMerlDv
         Qoo7y03Ur0f52tMVe65PmY5ynxECdWId+jhPT0ZQtjOPQVF1ciewb5rL4oS4GMvRa1wz
         r1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/a+f4k/xRYb9VW3It87QkaFiw1Q2EwqXZUwb84ELXzk=;
        b=P5AEJ/bwYpLAkBClw5Dq7VqJe/K+OPGxV9QPdSNjJCNGyxTZTXY8iFlKFa1Q/FQTyN
         7EhOh6FWfLVYKt5R2V5RrBE1XIQ1HWy7JyvaG7AKjrxfNvquxaWeZ686Xfj56s6Z1/Lv
         SfBy7GQQ0UqiP0hghSVCMdmvx/Ucd6AEY3QvcJHRzBsHdyZ/sgNGVBae9TNilgMJpCPZ
         M29Jg9RIfENU7zXOmeZzVEnuwqaZaqgaCDZqrwfLmS5noUHMhlo0tjaJsCmwHwdhq38Y
         oRxEKGmzh0cx2ie9COvMzLA3kZ81vHnPbXtPAlumIcI02rv8/eFRx3GbKj9PQA8uSQ7Z
         ZkCQ==
X-Gm-Message-State: AOAM532PXV2PXweEjLzkMaxwWzK44KvzB+a87k14RRBMZh2mujw1Ei25
        uQN11bRMAZVZdPQCd21u3eB5VJ5meLw=
X-Google-Smtp-Source: ABdhPJyRJ1RzHNknGZ7NEz9pj0sHmS821RmTmg7zVpMswjr+4J8N7okmw2DjgM6hhVzvP8qHSM96pA==
X-Received: by 2002:a17:90a:db0d:: with SMTP id g13mr2933151pjv.76.1611109137208;
        Tue, 19 Jan 2021 18:18:57 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j3sm238009pjs.50.2021.01.19.18.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 18:18:56 -0800 (PST)
Date:   Tue, 19 Jan 2021 18:18:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/5] input: touchscreen: melfas_mip4: Mark a bunch of
 variables as __always_unused
Message-ID: <YAeTDvUTE13ISJ0p@google.com>
References: <20210114152323.2382283-1-lee.jones@linaro.org>
 <20210114152323.2382283-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210114152323.2382283-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 03:23:20PM +0000, Lee Jones wrote:
> Dmitry requested to keep these around for the purposes of documentation.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
>  drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Sangwon Jee <jeesw@melfas.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
