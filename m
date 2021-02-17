Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B7131D4A8
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 05:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhBQEik (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Feb 2021 23:38:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhBQEid (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Feb 2021 23:38:33 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBFAC06174A;
        Tue, 16 Feb 2021 20:37:52 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id j12so7620427pfj.12;
        Tue, 16 Feb 2021 20:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BhmsuKnH0E52H/9hYZJn/H63hbz5gesZzSHL5lPaF+k=;
        b=JNgqrAxGKINEujyV5xnygACyy/PSSR7vRSklUAJ6pmQsEtakziusaHQbnNMb0FJWcx
         HUQir+nv8Ks8Skx03XXgKXUZe9DtiH4j23xqwZWegg3ufl3NvTXCYesbnHeYpvzvoMc8
         hVUnA9MhA/syHJsHgGBvkKXWJY5v2jqLIBN4Ht2cvA9J84PIJkBzg7BVq0ItfvkAHpFZ
         JBSbcm9QkEheDl/GHXolFZiJkzlFbJ4ARgdqZo+Sygduw6xvmtHogGmn3EtwHsizq0s5
         dDNsVxPGsQH4jGzZVRy56CiVefBco0EKMzce7NCZEapAzJhIZKjuFH3K8+LkuJRdC1Cv
         jJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BhmsuKnH0E52H/9hYZJn/H63hbz5gesZzSHL5lPaF+k=;
        b=U3P4PM3xBDiL1T5QhYELx4SmFu3tG0p0uEUD/nlS0gLV/XDm7s5jFTywziB+s/0aAZ
         ADlbRxM2jmIU1HTWH/IJMnAyvls6zbDRYHHypVYyeT6Naj6/KxhCI0a6B6DL8+dkbZm+
         3g1hjlyA9/bjpNwIX3+WCMzpOdnEIOI/BRspYJJY6LwJvkuYnHIBf+6OoQ2r1iGgUYtm
         wm6tlPFuKuh7rWUhySy3Hv1XIWJItWe7MuiaIcMf1C7lODLJUduHEjGbePWWQa88E8HS
         fY50bnCgBazlNwK2incNy45hMmQzimxFoXprA6J220uaM5c8lziL71DqbFN+rawYMfEL
         2hJQ==
X-Gm-Message-State: AOAM5302MaDcaDi4N+iK2Ai0G7t4Z3DN3T/2YSisUHq1Wkxd6igsPO16
        tsvgHG+UIczJWaLImooY8Mc=
X-Google-Smtp-Source: ABdhPJxgYAkmzaGKK6Rmlt9BuDNilTzv10gEyDILo7x0iWSyVhw41CHQizuqLxgIAzFFEa5r+TODtQ==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr22321252pgg.64.1613536672447;
        Tue, 16 Feb 2021 20:37:52 -0800 (PST)
Received: from google.com ([2620:15c:202:201:21d3:2abc:ad8c:8b3a])
        by smtp.gmail.com with ESMTPSA id 143sm543848pfv.134.2021.02.16.20.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 20:37:51 -0800 (PST)
Date:   Tue, 16 Feb 2021 20:37:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Florian Echtler <floe@butterbrot.org>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: sur40 - Fix an error code in sur40_probe()
Message-ID: <YCydnRcGmhWYw8Mp@google.com>
References: <YBKFkbATXa5fA3xj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBKFkbATXa5fA3xj@mwanda>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 28, 2021 at 12:36:17PM +0300, Dan Carpenter wrote:
> If v4l2_ctrl_handler_setup() fails then probe() should return an error
> code instead of returning success.
> 
> Fixes: cee1e3e2ef39 ("media: add video control handlers using V4L2 control framework")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

-- 
Dmitry
