Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00B7B3D4121
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbhGWTLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 15:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbhGWTLr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 15:11:47 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B4CC061575;
        Fri, 23 Jul 2021 12:52:19 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so5191092pjh.3;
        Fri, 23 Jul 2021 12:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zIQ2SX+9EqkYQOm6EVOCWmNjDkXrj36cJuW0CVNzCxY=;
        b=KYZ/puNAR+EEaXAHKRni4SYMXBbBFva0ausmDq38IHOnHafyIi5DY3gFukJByTUNh+
         72w8sx5Bc+uYwJX4+1zKmV1x41Okpv0/cnJyTZLDXz93yYJSYlmHHv4hN/6S940b/0o3
         gSUFjFUEKt+Ycsny0UkcPnjeYdg61BS8zCZ4u9zHWCndlMBcs4j03BRsn2EQn94rGF+V
         9PtKt2pVEzeQee6O4E+6eaLvfXGG75+t6NOt//SXnFWmVp0EednzqWxJ5RiF38wr2KmA
         8mOVPcsuDh1GTH5wy6wt4mnrNUw5xTzCuKa5wlPX6xQwn2gvGHi9KkDPQ6VzcEGjWDuL
         g33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zIQ2SX+9EqkYQOm6EVOCWmNjDkXrj36cJuW0CVNzCxY=;
        b=MCZMQ9n3PLem/jr7+qIaf6/gyya5VciH477Z8CtG6/KJUkANmNwcmqvc/BqiqWlLJi
         f6doRmZk9E0769cGXlHZYTba4L2DaVzxTdj7DaB44LhHKqnVUnpqMXOLVBcxDCoLKyh+
         hC2Bq8tAah98Xfei3e6vXWImdWgTqnmr/JF9biIhjuDpLTdxyR0ygeS+4IPFlP+ODiFv
         6jughks1YuPvHRrYjbZezwp365xz1UxQ88wIDku2XzhPGZ09kNdWV22HsVnVoya8L2Ei
         55RAq1Bw23BMLmipdneomyaGMcNDV5l1MqwQEh8YqZBCqe0vwD/FZ3B2GbmTBCKqOKL8
         EvAg==
X-Gm-Message-State: AOAM533FZlxp9lTLHZoVT6Epz2STK6KtnKL8CwOSs1n65UowiKydk+ND
        HPVz/g3Md42nuWebioDXLVI=
X-Google-Smtp-Source: ABdhPJxW9ZwgXlJRwgYjdROuim2ryUn2naOCKsGwc21azVvXJEnzT9GAwLkBtiW/IAXf5iz+SQkgTg==
X-Received: by 2002:aa7:8154:0:b029:310:70d:a516 with SMTP id d20-20020aa781540000b0290310070da516mr6197004pfn.63.1627069939373;
        Fri, 23 Jul 2021 12:52:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:55b1:90d5:6a79:755f])
        by smtp.gmail.com with ESMTPSA id k20sm6760953pji.3.2021.07.23.12.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 12:52:18 -0700 (PDT)
Date:   Fri, 23 Jul 2021 12:52:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-input@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: pm8941-pwrkey - fix comma vs semicolon issue
Message-ID: <YPsd74LoRtB9tTKK@google.com>
References: <YPsa1qCBn/SAmE5x@google.com>
 <CAE-0n51y=o+8SZTL_==GPXrDa2OP8fhh98Amv+L4M63rLQVGZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51y=o+8SZTL_==GPXrDa2OP8fhh98Amv+L4M63rLQVGZg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 23, 2021 at 07:43:52PM +0000, Stephen Boyd wrote:
> Quoting Dmitry Torokhov (2021-07-23 12:39:02)
> > There is absolutely no reason to use comma operator in this code, 2
> > separate statements make much more sense.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> 
> Fixes: 2fcbda9a822d ("Input: pm8941-pwrkey - add support for PMK8350
> PON_HLOS PMIC peripheral")

It actually predates this patch and also not really a fix as the
original code ends up working properly, but looks weird.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks!

-- 
Dmitry
