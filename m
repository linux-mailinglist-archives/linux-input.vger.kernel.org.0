Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2AD2D6FF2
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 06:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729772AbgLKF6e (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 00:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729517AbgLKF6c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 00:58:32 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D49AC0613D3;
        Thu, 10 Dec 2020 21:57:52 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w6so6356757pfu.1;
        Thu, 10 Dec 2020 21:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uV1GMqxxjLGuIof3Wd+THXRGUiu2LiAkskInQDZ/1Bs=;
        b=PQZuYj2XHQyRAnN2A7lcEIUuEV24Z+QAHRdPN5cyeJc8kE/ucTD8heu0G9k69jiLdd
         pcF5PQTzoLCsw/6tWiEBgeTh8CEGr6DASJR8hC3IUra+u4qt9CH4zcRMYpSf6jQXWbXw
         uiuWzBCAluqlB7+V2PFeyOqDXKwt9OMY8EVzUjR6pqytEbVUy7Ywuhj1CrqzImHSK6I1
         bXqzdvCKO0HNhBQdzsac28nk+Ax6F5lRtkVEyTQSBQnmKGbAVjO0x8E+YQLAzPMzBDGP
         tijlLpzvX4bR4A9yw3L2YV/dgebs6yTf+RfZd92y96ujU5KesjhON3WyjygwBKLf1AGf
         04lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uV1GMqxxjLGuIof3Wd+THXRGUiu2LiAkskInQDZ/1Bs=;
        b=nAB3dq8L0tXo+XMbv4JTUg+T1k5qWxUHbU9oVFOhSlYu6tfNdykc128ebcFnkYs2fX
         lkVXNiMApHPiXfxA0+BCF69gCbvPXXjS9yJ4vk5KkiPKpGreZjCHOT3xCkeztgEKDKqO
         PiNO4BswBjV5btDuBnnLDnglCd518RfhoGzNt2Daw6PHm40HIFHDypgBClPjBlGUrEvv
         1S1kGUZrKqTk38ijaCOqbe/nr2qsFKxu1HDKWilUtq+CQEuIF3cQedg5Eg64V25M8s6N
         1muDaIU/xqL5y035Tg1q0sAOhdOelBdBcZo/6po8F4BPfCB8CVQskInaPD57OGfw2/QE
         DguA==
X-Gm-Message-State: AOAM531V0o5u+Y4OmprgCpNhAkzEtvWyplR565u52vKtES+elmLTE5kq
        aJFlAPkZvPUVW+LtOJTR9tw=
X-Google-Smtp-Source: ABdhPJyu8BWGWBgib+I/3PVKoKvRwR0BTwOo4gJ0FCrsN3xx60oJzjNtbGf96uZrdB3ljWGrFb73CA==
X-Received: by 2002:a62:2f87:0:b029:19e:75f0:cf08 with SMTP id v129-20020a622f870000b029019e75f0cf08mr10256464pfv.6.1607666271791;
        Thu, 10 Dec 2020 21:57:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id c10sm9367696pfj.54.2020.12.10.21.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 21:57:51 -0800 (PST)
Date:   Thu, 10 Dec 2020 21:57:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sergiu Cuciurean <sergiu.cuciurean@analog.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        nikolas@gnu.org, gregkh@linuxfoundation.org, ronald@innovation.ch,
        andriy.shevchenko@linux.intel.com, maowenan@huawei.com
Subject: Re: [PATCH] input: keyboard: applespi: Use new structure for SPI
 transfer delays
Message-ID: <X9MKXEicywGuI3Bv@google.com>
References: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227124534.23399-1-sergiu.cuciurean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 02:45:34PM +0200, Sergiu Cuciurean wrote:
> In a recent change to the SPI subsystem [1], a new `delay` struct was added
> to replace the `delay_usecs`. This change replaces the current
> `delay_usecs` with `delay` for this driver.
> 
> The `spi_transfer_delay_exec()` function [in the SPI framework] makes sure
> that both `delay_usecs` & `delay` are used (in this order to preserve
> backwards compatibility).
> 
> [1] commit bebcfd272df6 ("spi: introduce `delay` field for
> `spi_transfer` + spi_transfer_delay_exec()")
> 
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>

Applied, thank you.

-- 
Dmitry
