Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8439B2BA0F6
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgKTDQy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgKTDQy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:16:54 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25042C0613CF;
        Thu, 19 Nov 2020 19:16:54 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t37so6016189pga.7;
        Thu, 19 Nov 2020 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QJenGn5hXJKKY6fUccZ2hCXij23Q3Avx9k+iYRW+S3A=;
        b=F/ofmLMt2LTlPAYNlfqAV34mPgdBRaJDBqFIyEFfAgVm+A0e/B92jqUdVdbh3dkAai
         5MAhSOBHeSCdWgGGG4gwtqQg4h6BNRyeRcNnNcFWYPhCWH/LA7bTOa5c1Fpyq2cXtPI7
         weVMyv7WnxdOJaND9zQtDhol7n4x5BCFShrIeAeN5awE5Kc8Ntv+rncPSJ8zP6suf9ng
         /JHLwXbbsAT9Mnal1bTboQPqcGTvltTST111D25Rpg+cQjxcZb9G6+2ctxNlaLGIanYe
         UO85six2GYZZHM90L3SlNsw5eetTdVuKnTIVY8K20WyoxUb88mGdKBdvqYezW9L9p5fm
         u+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QJenGn5hXJKKY6fUccZ2hCXij23Q3Avx9k+iYRW+S3A=;
        b=dZ0wLG/zf/VnixIL7hLMDfk04RTWCkIu7Ju4sz7enmSwayI+ZgJuHDXTk82UPfWbT9
         H2lGsESgw2YTQfhXCtQMfNAVrLAjqeG33hoY2oahUxYjGXGi86Nbe2tsgV/szbI41CwZ
         JrNuyBKg0ZkUsxbne3RCyi4/S1KWescx/5qTzMsbupvK68Y3vbvUXrN1jK/dO1ERNKq3
         Y8acwx6Z5hCcK3sZmvnEOY4hqKgjOp+1j2Bm9hqsc543tS9z4fi/NgzP6KGCuVGil4Km
         Z18wBeo7w9VO4SReiqj2Md9BPYuRc7EU9u7lv5ivZ2Fo8U/T4pWoOLZx670Oca3UpoiL
         4ztQ==
X-Gm-Message-State: AOAM532E8ZedWlfN4YSyMLd9WTGSOLx0ra9OvrDYyGlsZnbKiQpw24e+
        acvJ98q8Uts5et8Oi6LLxxU=
X-Google-Smtp-Source: ABdhPJwf7K+3SFhnPrQYDBZ0qvxrPoja8yw2WAa9OwvRA2IP+FEFr8rDLpO/RVmBxMRFzi7ChJK7Og==
X-Received: by 2002:a05:6a00:13a3:b029:18b:d5d2:196 with SMTP id t35-20020a056a0013a3b029018bd5d20196mr12447989pfg.62.1605842213571;
        Thu, 19 Nov 2020 19:16:53 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z68sm1148229pgb.37.2020.11.19.19.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:16:52 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:16:50 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 10/15] input: touchscreen: surface3_spi: Fix naming issue
 with 'surface3_spi_get_gpio_config's header
Message-ID: <20201120031650.GO2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-11-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-11-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:59AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
>  drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/surface3_spi.c:225: warning: Function parameter or member 'data' not described in 'surface3_spi_get_gpio_config'
>  drivers/input/touchscreen/surface3_spi.c:225: warning: Excess function parameter 'ts' description in 'surface3_spi_get_gpio_config'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
