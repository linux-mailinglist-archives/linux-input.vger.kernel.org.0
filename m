Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B775A2C3657
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 02:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbgKYBqj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Nov 2020 20:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKYBqj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Nov 2020 20:46:39 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F68C0613D4
        for <linux-input@vger.kernel.org>; Tue, 24 Nov 2020 17:46:39 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x24so825963pfn.6
        for <linux-input@vger.kernel.org>; Tue, 24 Nov 2020 17:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SNIb1zSexoWmADEFU8l2rVHdPtm0QQUXbcV3PkOWfBI=;
        b=XraV1Kq21UUWOcbk5l4FEuN5CZU2soEoRYK8UcsAfUU33/EyUnYKy6H+vmPk29CTcB
         txV8l1qQIoAd3z94svL7NFlE/LjuUuls5p5bJ1Vm88oE9b/CeRXGh4rj398UC5g0IqvT
         i20rJd1IF3vTkIpC4EeRiIHYoUJhbNsS39mEFQanilqCfF/5r+qNEBMstCxf08fkWfUg
         H9g6usQpM1HpETXqPP/3PQxYS7tgz7oqQEVYs7LBx8BEyc8pjBS+XOCn+zl9yOA/l+4G
         cz+D5mLE39t1d31K79GTRcmmQfQcxmtNmw6KNp3DUt4Rcyo45yITbpEuAkW/rb9Y4ccz
         IkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SNIb1zSexoWmADEFU8l2rVHdPtm0QQUXbcV3PkOWfBI=;
        b=kOM0i8cOCo9GjlqyJceJJvlnuPOGJjQTPoYCgixumSj8x1XhLHoT6YtP+6muPlPK0c
         lTGnIU0ZeQ9uj384F0J8A2L4TdsoAXSDBMOxJiIuMsvr0/UY8pRvnYN1C7KFc4ozk2CF
         LG57UTpPlSs9TAFq0iBCXe0CS535P+ctSAXyrEKW3KbwJjd4C92Mz2yMSTa7WqRVn4N9
         E5JKk2zkGNdFeVIpddiokX4ezw4AjEM0PlReq2GzFGGUt5H43Fz6BGFmGRr+i9XNbGsc
         yANVmem+KWVZquCy6O7MBx4YZj0WaaEPcFdgeycKHHZMx9zhpsBlYXrWOXXDGXKFS4Qx
         VBYA==
X-Gm-Message-State: AOAM531bvPFP1jJr/z3fB50AoHoLoGOZfZynwWmcswkjuhuzCU5YowO8
        ahlAUfVGGtEV9O/1J3CxT2A=
X-Google-Smtp-Source: ABdhPJw9Q90Qf98tDOPY8CsZzFfOGkP+tadwf23qfYWkHx/c73yMk9RLSJvs4utEI/HMdnqzECkyeA==
X-Received: by 2002:a17:90a:2e8c:: with SMTP id r12mr1252173pjd.29.1606268798763;
        Tue, 24 Nov 2020 17:46:38 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j143sm257505pfd.20.2020.11.24.17.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 17:46:37 -0800 (PST)
Date:   Tue, 24 Nov 2020 17:46:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Luo Meng <luomeng12@huawei.com>
Cc:     gustavoars@kernel.org, hdegoede@redhat.com, rajatja@google.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - fix error return code in i8042_setup_aux()
Message-ID: <20201125014635.GF2034289@dtor-ws>
References: <20201123133420.4071187-1-luomeng12@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123133420.4071187-1-luomeng12@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 23, 2020 at 09:34:20PM +0800, Luo Meng wrote:
> Fix to return a negative error code from the error handling case
> instead of 0 in function i8042_setup_aux(), as done elsewhere in this
> function.
> 
> Fixes: f81134163fc7 ("Input: i8042 - use platform_driver_probe")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Luo Meng <luomeng12@huawei.com>

Applied, thank you.

-- 
Dmitry
