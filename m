Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3123ADD26
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 07:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFTFZ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 01:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhFTFZz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 01:25:55 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C456FC061574;
        Sat, 19 Jun 2021 22:23:43 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id y13so647810plc.8;
        Sat, 19 Jun 2021 22:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AM8/wCikvSps9NzaxLCoTLMKODu/qTxl+FlXgnOypYo=;
        b=r4UFUvTChmFLcdHj+025CsP6sc99j852d0kWpunr9WwxFGVHlnbvWxpEwo4rfu/JDY
         x4Ccx9SM3YMSRGSP+uhn6QWbp1IYi2v637ofLjqK8Rxobv5GVKMdH0iwOgWiEUEm0OiP
         sQAQ5Ziwtt08NkNduQtlxCUh3QIMGkmjJ8V3nm32x/a3j00XL19KE/mioOLjPrtqya5B
         bUmoCIVynkoiml9vLLJVfdYTHq+SJY2wYjKCaHEqmlFtmOKwTm6lpU1zOhaKC1TjWlMl
         xxiVvp/tkMkac/nxZ498YeLhazsOKu/vC3Hq4T45iOQVJZ/CUi3Xh/NBZuD1UcZuAM3q
         4RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AM8/wCikvSps9NzaxLCoTLMKODu/qTxl+FlXgnOypYo=;
        b=OGs/PM4C2Nut6tNMxs7TL/K/vg7nXmx3dxJd3RTcM/yvQMHvrFIArLx2l3LhWsHBhS
         jYBnm8zq1y26uE85QGAHmi5ZMjwcpPgRWHrCZyLN2WLHmxzNdTkEKGu7IundzCk9z0Zr
         4k84N+O+V2tnxZRowwo9avgTmu9f1ZgJhDRE2X+wxajyLz1bUndrF7YAdNLl31br8v+T
         0xD7oZ/kQ3H5+b/trv56bntjj4z2UbopgXC0YvbInA2aJjnZ4xjyBptjtKz3dkLdhlZ6
         PipP+JnBhV0JnciKyTKPcXEBtUPeoQsmPxPv/ESSQcHHtO06H2rqm4mFB+rl0EnVBbaZ
         WOtA==
X-Gm-Message-State: AOAM5315TsnVAbagyJIWUfOYF94ZslAd08/KpHMf1/4Kt+0kmx7OYVLl
        CR59VZb+J149p0P3p/4jItA=
X-Google-Smtp-Source: ABdhPJzfBmKLj+puVzEtCMj25q5nnYNLb4wGazq+Ym7F6b6BVuIRSyFmUa4Eg+j25W/u5VNsbd8jJg==
X-Received: by 2002:a17:90a:f303:: with SMTP id ca3mr29885712pjb.120.1624166623211;
        Sat, 19 Jun 2021 22:23:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b83e:d8b6:9f4f:2be2])
        by smtp.gmail.com with ESMTPSA id v21sm12000014pfu.77.2021.06.19.22.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 22:23:42 -0700 (PDT)
Date:   Sat, 19 Jun 2021 22:23:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     zhouchuangao <zhouchuangao@vivo.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Philip Chen <philipchen@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/input/keyboard/cros_ec_keyb: Use kobj_to_dev()
 API
Message-ID: <YM7Q2xwBgYmi485a@google.com>
References: <1624025283-56360-1-git-send-email-zhouchuangao@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624025283-56360-1-git-send-email-zhouchuangao@vivo.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jun 18, 2021 at 07:08:01AM -0700, zhouchuangao wrote:
> Use kobj_to_dev() API instead of container_of().
> 
> Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>

Applied, thank you.

-- 
Dmitry
