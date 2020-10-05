Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F625282F3C
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 06:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgJEEMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Oct 2020 00:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgJEEMu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Oct 2020 00:12:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4430C0613CE;
        Sun,  4 Oct 2020 21:12:49 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id t7so5187533pjd.3;
        Sun, 04 Oct 2020 21:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RsnGDegjEu/YfT4GKHut+x/yVVPn9ihFCPc/InanN4E=;
        b=oKnBfpo2KdaKrrOUf2YDIrsEzm6mGyc7rodAby/pB3NvQLbKthOJYktx3Fvrr/LThC
         HwxU6arVuZgaB0ha7le3RXzl128d1rujZXiEc2paWv8/2YzC2X3FVSiauBzk3FsMDJuW
         7ALLORjMWQiQlIBVqqHY3ABLZzwuGQGiTEM4hzA6W9e/tHTerkhAyLShDouvbV8PpChb
         I8w/dHcB4ZFX8pzrIWuSfdMDVcLkQ4looMCP9wXeGXtVZe/IvRAlHAXNN0r3Oib4YEOW
         ZP7a1mL/npClxAjcW6w7PJM405bxZ1vxnbbJswym7HOihid++FomCZck+Qu4BGmhdlxm
         AzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RsnGDegjEu/YfT4GKHut+x/yVVPn9ihFCPc/InanN4E=;
        b=rQfFHFtRv+4g90Uw8r8jCJ0fFWbKb4FQ1aJd8HJ8ohEbIolHZHyF8MYUM2ETxStyV0
         7xOSO/2B622IW4jR0p7DpndMknsh6EaeArmKeTJsbraKYVBSHLgGU+YkFbznIg4wc29L
         ILfGqFHW7t3Pe5r/sTb1w1BMUuac9IQs8Pk+Y49uRTsVwq79F9oLOSEyY1V8/ogGjV+L
         wl4WBbKV0Na7kC7aZHEEUES3ROzdnbp2Nv5DNuYxoO0UiYyAr19r0NQ0yXgp6YlVKAQH
         aBMiZdLOrewuQQeIFOYxOT36MZ/ecjQ3CRWLems811Jr3DXzQoUNkEmLGHrpl3mXN/0E
         NW4g==
X-Gm-Message-State: AOAM532Xvh8Vdk+GK/dr5tHZMR8MjEKY9VmrbPEQUMCPM/DaCOKjEG2M
        85bWHvEOoDp+I38eFFiG7Aw=
X-Google-Smtp-Source: ABdhPJz2zCIvplvipN+mHxr7PUuhFf9XBfYVcI1gwUzQiuCvhyQecqzKSxmP9jld33ryJS3X0/yW1Q==
X-Received: by 2002:a17:90a:6305:: with SMTP id e5mr14960321pjj.46.1601871169313;
        Sun, 04 Oct 2020 21:12:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a5sm9143464pgk.13.2020.10.04.21.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 21:12:48 -0700 (PDT)
Date:   Sun, 4 Oct 2020 21:12:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Input: stmpe: Add axis inversion and swapping capability
Message-ID: <20201005041246.GG1009802@dtor-ws>
References: <20200922093903.157232-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922093903.157232-1-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 22, 2020 at 11:39:03AM +0200, Stefan Riedmueller wrote:
> Make use of generic touchscreen_properties structure to add axis
> inversion and swapping capabilities. It's configurable via devicetree
> properties:
>   touchscreen-inverted-x
>   touchscreen-inverted-y
>   touchscreen-swapped-x-y
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>

Applied, thank you.

-- 
Dmitry
