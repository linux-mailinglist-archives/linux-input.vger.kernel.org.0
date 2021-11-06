Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB5AF446C18
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 03:46:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhKFCtb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 22:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232660AbhKFCta (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 22:49:30 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC69C061570
        for <linux-input@vger.kernel.org>; Fri,  5 Nov 2021 19:46:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gn3so4252987pjb.0
        for <linux-input@vger.kernel.org>; Fri, 05 Nov 2021 19:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TYs/V63MYU6VuOLGxYd5k0GiQDNXkPch4t6Tb9WL/Mo=;
        b=de1moC6F+Nvbib/0piEuMdR29bD4iAupNKcGVB5bTNzbC3RnN/C1EVFrc99UwOgpB+
         pJF1AcljCHLBUEoig84vKYbvZAUp0SvbnKhld01Dmk86fQTruKuAnV3w7yNs2Mcqg6pk
         4BXUsqU6fTApE4AzbRlWOFGhu8XWT0cOs0fj71rjUaTm1RpHHQb4MUqWKSfGEOAV7cLx
         Fmz7ie0HZbiMs8HMvzUX94Ft00e0ziEE9mAN8k2XLte7j7D8AMbhhPabAXMRXd0bzD24
         NoqYOF0MiMzcSjq+Qdht897PRBrbMlUYWi5FWhdIMF7XoKRKrPClzCFRDNCbWIzxfE2j
         JXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TYs/V63MYU6VuOLGxYd5k0GiQDNXkPch4t6Tb9WL/Mo=;
        b=dpnO7Qvt+FFIRvXcimyDur54Ff298oJOhpo86ePWCjvHFRDdcfR2kzYepCAzshlyp/
         Tzo5wzXRlcdtFRYxs1eSGH7kw9NWAEz1XUNj8gB8sjPHMbX5OSThdBL2NLYnBsYXNtaI
         U6qe5org1qQb94QBTIf/0zWMKHFhx4+Gr/68kL+HvT0AOFkKE4dw5PzK2l3uEHvLWPBn
         evMCbgMs+L2+jr9L1red07F8nZyw15i5WgAnQxRP8kOMABB6Ovi/kkR71h4n8tHHgzOI
         8rIhnFiCU4Bfo8NItnrGcboKLx/UWxSC5yFBEzh392Yg8t++eZo9s49GOGc34PIsrrTC
         NRwQ==
X-Gm-Message-State: AOAM531CcwXu5mltzaqTlsUU/dqympkefRgqejOuqg2RdgBhwWCazpqs
        CscAOAQNbu+cS8oos8FS7vEfs3gHh3k=
X-Google-Smtp-Source: ABdhPJzEbYPqGK84VzAFxE3gmi+1AeCtUri+maGMpQE+y38zGZQZAy1DqyiOb/rvaTEfAFaOwMP5/Q==
X-Received: by 2002:a17:90a:5642:: with SMTP id d2mr34612660pji.200.1636166809659;
        Fri, 05 Nov 2021 19:46:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:837c:e765:475f:22d3])
        by smtp.gmail.com with ESMTPSA id t4sm8899647pfj.13.2021.11.05.19.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 19:46:48 -0700 (PDT)
Date:   Fri, 5 Nov 2021 19:46:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-input@vger.kernel.org, aduggan@synaptics.com
Subject: Re: [PATCH] Input: synaptics-rmi4 - Fix device hierarchy
Message-ID: <YYXslsWQGmUC/zxJ@google.com>
References: <1635514971-18415-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635514971-18415-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 29, 2021 at 03:42:51PM +0200, Loic Poulain wrote:
> The created rmi device is orphan, which breaks the real device
> hierarchy, and can cause some trouble, especially during suspend
> and resume sequences. E.g. in case of I2C, rmi dev should be child
> of the I2C client device.
> 
> Fix this, assigning the transport device as parent of the rmi device.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied, thank you.

-- 
Dmitry
