Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68FC2AB134
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgKIGZs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:25:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgKIGZs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:25:48 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4018C0613CF;
        Sun,  8 Nov 2020 22:25:46 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id y7so7131740pfq.11;
        Sun, 08 Nov 2020 22:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PJc4BdhbHd3H1fH9oOv1dKYZsgBZj67mPeN9HCvthMI=;
        b=se6Y/va0JBgXIx+MT8uDZgHqGBUaO35x1xNQNM2QH/qsDywzo2U77AZVHyFoYrcYvV
         CeVKpdZhItNz0onr2wV1qFnIY4iXae5HiHHFU7lClK08L6KRjTFquAdOKjdAusqQNxBO
         48mrab7Ygg8ZR3Zc41vANfW8+qzyO4u286FR0VIsGUPrs6hKxhGZFpYRxC0cqwlyfDcG
         2N/Y52u/0i9uTDBk9Bo6iI7vlfmNMXdcEtK+O4m1V643G+poCbJkF+f2bQaJo+P1ncEW
         GqocwhVorV7nWi8CiWk90cnW6hQnzitI1hVreTpZoWpP9mGKgsiYdXAGpsgaNFpBJZTf
         k7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJc4BdhbHd3H1fH9oOv1dKYZsgBZj67mPeN9HCvthMI=;
        b=rtnvNLMeg66Eop9wPFiNDBqnrXSmPsos8KrS/KEHztAQvuiDAx4+24AZ8ZJ8RR3IDA
         XHRHOIas1TZgwH+HzWBVwxsGZcLXZ791/9xoQ9jMMCgeEyR7SbuGaa8xkiXmaoW3nlyN
         gSGM3P352RfYRZ0nAItIiFs1diftC0onTSEVJ3CqnMBGOBhutaMamPBBpPAXX+EdPwwm
         UtEkabvxto9L87wgRge0a0jebLFUPh9S/hxMGNu2sOPDOwFXrn/0uDoahPx1d3Q0IVMQ
         H4ZdqPKFByQNpgzt1oLWKLthIKakrFYJR1vKmvEYtU6cPUtKtBAjRMs+gE2G5wtM6VgZ
         8yaQ==
X-Gm-Message-State: AOAM531QvHeAt7C0kcywEqvAgmyHOAfFaRNMIzCyp9tYjuQjW/7mFYee
        Zf2N3TSbYK39SIFRDakByHI=
X-Google-Smtp-Source: ABdhPJzXClcFI/c82s6U/c07rUiGhlV5rBAl/sf+LHSh7KSaQ3b9EGxCWCnyrpDRAlFhHxQJu0rw3g==
X-Received: by 2002:a63:4c19:: with SMTP id z25mr11699365pga.58.1604903146412;
        Sun, 08 Nov 2020 22:25:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id js7sm10118751pjb.46.2020.11.08.22.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:25:45 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:25:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        David Jander <david@protonic.nl>,
        Phil Blundell <pb@handhelds.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH 11/20] input: keyboard: gpio_keys: Fix misnamed function
 parameter 'dev'
Message-ID: <20201109062542.GM1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-12-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-12-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:18PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/keyboard/gpio_keys.c:119: warning: Function parameter or member 'dev' not described in 'get_bm_events_by_type'
>  drivers/input/keyboard/gpio_keys.c:119: warning: Excess function parameter 'input' description in 'get_bm_events_by_type'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: David Jander <david@protonic.nl>
> Cc: Phil Blundell <pb@handhelds.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
