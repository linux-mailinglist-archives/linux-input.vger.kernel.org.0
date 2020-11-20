Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 811B32BA10E
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgKTDVH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725936AbgKTDVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:21:07 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2EBC0613CF;
        Thu, 19 Nov 2020 19:21:07 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id y7so6499223pfq.11;
        Thu, 19 Nov 2020 19:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m3oBP62D9n7A0gIZiVsH2B3mSCW22re87wl9aE3nn8c=;
        b=NmNAPRTSzyrGj58rDwrvE7fyufC0/ZiU4ed9POJcPocvuVPARLe7/ibnVCgjtqpNKT
         DfO+gDaXz6Y9Lu5iTjGix9yRT4dmLMauEUICuXY6eZ/8cO/JfHPqgcDDnPxPgv3A5V9Y
         m3O7kBiLzaNoqaj4lOD2sYYThuLfK+i38Qs4Pwh7oTLoQqAgIhwSIvvVvJYZS2uas/zn
         TupaZwfTifn+FDCTlUXL5N9zJ7a/qrlTJjjo4Ndq5P02Q+oe/pO0y3qRpXh1e59eEUSH
         sRxykXbRr7QU70yNaXQxMX9p9VNPnfKTW1yG9jGAQJSTmwZDIRprgS3++jQ8XOABCsc/
         +UTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m3oBP62D9n7A0gIZiVsH2B3mSCW22re87wl9aE3nn8c=;
        b=eNSq/G1bNboG8ib5aIZlJuumyulL9xVJzq2q1Fy+7x301BpDMwrETU3o9wH1b1w+Bz
         AfyRB8CJ4i8YlHHDEUtjL9KFtqYpBErluJE3pqf8894px3b49Cd2uhLp4C+BnvWdLfvL
         DiOMy4efFWrt7lMELoL+ENftZrgSolzz+uEZVRQkhY7+7sBjmxabmh3xRXDdgC3H4fk3
         232UzMnrtOwmjffruMh2kFizGmBGm8+ba9Tyj0u+C4NJUxIoY8XCXKZxj1LuyWb2quTh
         C1ZKYF/ucwBv8QDr79HXVyxJaR04vXkpSqhOEkHiWOqX0XnJ6LU4IqW8DM3LC/+pBbT0
         VphA==
X-Gm-Message-State: AOAM533pzr0Oxcen5RM6tHKWKmFozAkrJtvEKj1lpg8aaLkZwToNqmnR
        1IE7ZeZ1/H4BfjpB0w6mPrY=
X-Google-Smtp-Source: ABdhPJx0ZtUHAOLyWuP0IDPgVSFfQJT2e4unFIKnjGpJKHtOkrjHQqPPj4tFy8WSmuiPrxJ9BIrRkw==
X-Received: by 2002:a17:90a:fd88:: with SMTP id cx8mr7528452pjb.220.1605842466775;
        Thu, 19 Nov 2020 19:21:06 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b3sm1449449pfd.66.2020.11.19.19.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:21:06 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:21:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 14/15] input: keyboard: applespi: Provide missing struct
 'message' descriptions
Message-ID: <20201120032103.GT2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-15-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-15-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:02:03AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'keyboard' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'touchpad' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'tp_info' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'tp_info_command' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'init_mt_command' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'capsl_command' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'bl_command' not described in 'message'
>  drivers/input/keyboard/applespi.c:306: warning: Function parameter or member 'data' not described in 'message'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
