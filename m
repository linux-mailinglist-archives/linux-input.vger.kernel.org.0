Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 790003468D0
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 20:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbhCWTTl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 15:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbhCWTTR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 15:19:17 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCFEC061574;
        Tue, 23 Mar 2021 12:19:17 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w8so10537052pjf.4;
        Tue, 23 Mar 2021 12:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1hC0RCbP6IigudyUxED3c/aEqVaswi9yYwg2B1tUhqY=;
        b=tBdqzS997+YPJ59t3lW54knZ3bk8co8JakKdVJQYYU9kRf8r37fGdzbrR7Qd7zeduo
         ph+BLvR1f0To9JP9BbrG+X1GuYj2GcMCxkb8d2EU7oRwdFgnNirMce1AsN9T0WT+jXUQ
         /rOIjFC3Zk5lCHYGv1cp5jFYpfn4LJpxIMwCV2btbmRtH3NCOGWviFMZdmTEn5LgNWIy
         GdtCoQDYWoMqVNH/YgYIqCLoUISa5uh/Q3dXT0OyvgzyEJovDgg1FRPDJt0O+nujeCkV
         3YlvsjkKq7emRVnZ9ISTPXRSjT/axYv1mMFCec/qwZYdsrkO8V0Q8X3Qdbhcu4MiXI4/
         6ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1hC0RCbP6IigudyUxED3c/aEqVaswi9yYwg2B1tUhqY=;
        b=oA/FEMksqd2oa0TbWIg6m+Cd3CRq9y3K6XKz8RvxrtU+L4h1qi3YX7fAf/JUeHCXko
         aUcKeFZ+mLAGrmn+qLcwlp0I/PUf3mvFn9YY4NyuuQzGbO2Ukd4iac9t6fEg25ov5Nco
         sI8NlmxNko3XkUyAySN7/F5vTu6MLyCsm7DHyIyfh/NaIi4uFJT+O+EzKfrXU4qXeIQG
         kiJ1M/yXYH4WOpN0xMy1coK1VswkySh8hCaR8+TEkGWOXWZjJiFDHNJLDYAqWH2CxSeg
         3TsH7peIRuHGoF+z6Bo/XZUTGtiRho08sk4dxMQXjdHmHslgMNHTvR3YsSlCfiO7MKIO
         TgsQ==
X-Gm-Message-State: AOAM533chSrPdiRxa182qZO74IUTpRbzMuwKGZqkBtFKzS9N3+s0AXCR
        3H77BOdpTwbVnj3SxnBXoY06YHHUO0g=
X-Google-Smtp-Source: ABdhPJzBmnatGyDPL8P+AxUkMUeXtM/bwVAjLktcrtpSze6pJJ5q6AAofE82dCHWiHGWi/yoz9is2w==
X-Received: by 2002:a17:90a:b392:: with SMTP id e18mr5841265pjr.66.1616527156772;
        Tue, 23 Mar 2021 12:19:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id 38sm4920pgk.30.2021.03.23.12.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 12:19:15 -0700 (PDT)
Date:   Tue, 23 Mar 2021 12:19:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nikolai Kostrigin <nickel@altlinux.org>
Cc:     nickel@basealt.ru, "jingle.wu" <jingle.wu@emc.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: elan_i2c - fix a typo in parameter name
Message-ID: <YFo/MVSnr1GgvSXm@google.com>
References: <20210311114146.1977616-1-nickel@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311114146.1977616-1-nickel@altlinux.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 11, 2021 at 02:41:43PM +0300, Nikolai Kostrigin wrote:
> s/max_baseliune/max_baseline/
> 
> Signed-off-by: Nikolai Kostrigin <nickel@altlinux.org>

Applied, thank you.

-- 
Dmitry
