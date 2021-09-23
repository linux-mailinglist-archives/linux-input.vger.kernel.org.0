Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093934157B1
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 06:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhIWEvd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 00:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbhIWEvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 00:51:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C73EC061574;
        Wed, 22 Sep 2021 21:50:02 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id me5-20020a17090b17c500b0019af76b7bb4so6075528pjb.2;
        Wed, 22 Sep 2021 21:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hLNDRLIQ/RtUgipTowpt5Ra2XOMcdq1TizW2PJla+Fg=;
        b=Tnrfa98fAcLnGZnJ44WixaFjqclu6otvBIU3xM0UfD59FXaNBFOJxOKNSMZ9iHf8KQ
         59+ByZytz/Spi8ucZFl07fNxpmbKDhyIjv1kyBRwCY2BsuzmoXAsYZ7dBsRXlx1MxIQO
         bT4RNA7uUr82xZxKKzDMw6FumxUWcBT0UUDvlCCQeBBCDejcl+sfEpBtvmg5U7SVIZMm
         5+oDo6tIYpAtvWUonYXBt8mMj/Ap5HKmImuHcUY2YKqvu1361tEDn5ldqY82JdFvv0X2
         vwVGNtkadGuJdM94G0YLCXRGVF8uMzi5zpfOzCeCX+4kiIykg1gKR3rtkAVJYhT+kiMa
         sf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hLNDRLIQ/RtUgipTowpt5Ra2XOMcdq1TizW2PJla+Fg=;
        b=g35MZ/qhT/6LQyCZt3S5t/7+TQv7cSKjBAovDm33vs7IrMpVzZbBz393cl5ebcFRWu
         psDaLBNaaYCh04ibnFOCLWrMI/GLAOUsbe/51PuJnh80FDbBTgRBfBvFUdjhcIwW4bzD
         9fXgM3GemJZUffWXycHmMX5idF6oR8ZTNGiBJHC4bmFXbU8DTlLg5frIqNOt2GhfdQ0o
         HVzeMmyzW1Tmmkzd7NwXs9S/kVI/Hv2c8xap8rSaHueMBOaroqPsbhjfiOD6k8+4Op+K
         zV3DllxjuNiIdd7nSQiIqUxCjP3Ul10qR+L+pVRiH9wMiMuveYD/KyWnpgYGNw3CtQKT
         Gk6g==
X-Gm-Message-State: AOAM532sj0iF+E1Bcp2mcYD3Rh9D/Vd55M2ueLLkiOrVvwXoZknlWlc1
        TutlsmrOeIBBvitcEk2namc=
X-Google-Smtp-Source: ABdhPJypNfYg2fPKrbtz1WwqSg6kS80NMSlO/PLytpXwmZwV0kni73xaFdVwwKveCrq3M8ckc8r5lw==
X-Received: by 2002:a17:90a:2a8d:: with SMTP id j13mr3123086pjd.24.1632372595802;
        Wed, 22 Sep 2021 21:49:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f198:36ef:2b9e:5c76])
        by smtp.gmail.com with ESMTPSA id o14sm3997179pfh.145.2021.09.22.21.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:49:54 -0700 (PDT)
Date:   Wed, 22 Sep 2021 21:49:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: raydium_i2c_ts - Make use of the helper
 function devm_add_action_or_reset()
Message-ID: <YUwHcOTYQuxybIMI@google.com>
References: <20210922125212.95-1-caihuoqing@baidu.com>
 <20210922125212.95-3-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922125212.95-3-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 22, 2021 at 08:52:11PM +0800, Cai Huoqing wrote:
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
