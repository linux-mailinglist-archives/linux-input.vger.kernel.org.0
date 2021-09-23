Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2C54157B5
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 06:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhIWE5A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 00:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbhIWE47 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 00:56:59 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA52C061574;
        Wed, 22 Sep 2021 21:55:28 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id n18so5058412pgm.12;
        Wed, 22 Sep 2021 21:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wmHJpdl5pqswrB4nMqHrpoumrCfk2DipcL4iRPeN7/g=;
        b=Zj+jweasrxgNBvmJQPd4dpjW236hy3Y+I1BG9+7gTbeZcUTlm2gDHdto8Y7ksvA1vE
         HOYkmmzhid89HEXjYE+NRXavsecZO0H3LEQ6IoA65e5AMA13mSIV0BH74tK7BlKHMVps
         h+RESdMVOF0HJREAZbBBM4dKzB5kiPeCdY9ZGgPS5ZydAYPsahX3WT+GqaZz/scmbhLD
         1G5aQp6sxTjUhsRRFwfdmDXyBW8+mtR4hQDRccZe2oGaQ8FkAK4xnzOkgUTlIaTj2zyG
         3GyIbpvVl5e13eiP7iyAaiIaFak3pIbL0gJCq/duq4LvO15jg4OA7oxUqhnVrzFAFPiA
         G8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wmHJpdl5pqswrB4nMqHrpoumrCfk2DipcL4iRPeN7/g=;
        b=g4OLSau1jzqJAWl2af3MfzYhSTqoQuJSONT6ERWZ5Rw6+O51xsRN4p8dcivNa8IaHP
         Y5t+0vLW1IasET0+ovcQ2wzW5kN5YQB8wJk7lZw/SpSw4+NjjjuD+vouYios60fhyC3e
         GHthutPPYTZdqkvhNRybnAHNUUxu6uodt1ggoNEVpz1d+M1uY1Mebz1D1dIUPoQAozQJ
         0RaVCYCu7VgnZj5zfoJilga3fTL74Oe5GqL8zHTYJIBFBuGSMAUFmFxn/4tbxynr9xZz
         P0ln0mNdp8iSFn+T272shBTL2gOe/y+vc6jW9iiAD1L9wfGfbmN1LaIK8MGTOjA9pERj
         H7ig==
X-Gm-Message-State: AOAM5336NLw+uOAfVZ8G1HrHOUXh/PNerIrB0UT1vuh7eLBjmNdVI1JW
        Fk/VQJ1QsA9j5FhYOpwX+yQ=
X-Google-Smtp-Source: ABdhPJyNIlJdbO1zNu9irTpXoaqAao6aKlj8+UGbq3L4u+AdFE/kqQFK3hmX4yeSjYGVpRs7Wesadg==
X-Received: by 2002:aa7:8f11:0:b0:44b:21bf:b76 with SMTP id x17-20020aa78f11000000b0044b21bf0b76mr2661869pfr.43.1632372927851;
        Wed, 22 Sep 2021 21:55:27 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f198:36ef:2b9e:5c76])
        by smtp.gmail.com with ESMTPSA id v14sm3877373pfi.111.2021.09.22.21.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:55:26 -0700 (PDT)
Date:   Wed, 22 Sep 2021 21:55:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: mpr121 - Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YUwIvOLyTTrXUiFd@google.com>
References: <20210922125954.533-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922125954.533-1-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 22, 2021 at 08:59:54PM +0800, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thank you.

-- 
Dmitry
