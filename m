Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FBC32F2EB
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 19:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhCESkT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 13:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCESkQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 13:40:16 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A00FC061574;
        Fri,  5 Mar 2021 10:40:16 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id jx13so2382652pjb.1;
        Fri, 05 Mar 2021 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KAn7IcP2wLfc+akl77eTt5ni2ix91KV3jvCUmvRttdw=;
        b=ovNl/ylQEb9S5DRy2VWhYWJv7y2A9DJWaQVUCQhpHGF+oJ6t/L5zZg0jomRAHpFnEo
         WBpmjDWO23CRV4fZF+JIqmVd6kjoC3XeV/0Qj4+wDdre22zKcjixQLDaUm3jtz+oXIJK
         SbvJMxoOKrx4mvXPIWKKMK47dhp72GVCZkfhurqM5I+ROu21HR3pUhzaUdb30TV4HuMl
         JF/W4WSmdHpY7e+ivrf1ZqN5yeybgmheZqTX9/ywd2szcDHv8eRpPEt59tlyXz8nDCW4
         0ZLk4wsvpgnQrF4cjvvQIgip5uWF04FAMc/OqcSgNfd15BenRBFwbOqXv1PmquaabOa4
         3Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KAn7IcP2wLfc+akl77eTt5ni2ix91KV3jvCUmvRttdw=;
        b=UcUNCca2cpV7EoszojYClakU5xqm9nOqYvyBQP6ayar+/ANxTp05E6q2q2b0dCz0IK
         IR6rZpqstAqW0yRsXsCaDWG84xwzEdUXGTtzijdXS+bFOq9/+6KjszvtSmM4wVMwhD+P
         wj85BmuRuOE0M7UC6wWVdCPBJVBz1VryM+4jW9Q2LOHLuLIXsExkLDG4TbcYKr9fjMR9
         kPnt8Ru5VtA9ZPjHqmaXEpOToqR+DTpEw68fvirhBUmW7nhLDoYNe6OTUSdUMCCtTx9/
         xgfSKUStuSNNsboycZTUtfZLessAsF92n895lzzdviDLg6E6xud2LEZOqKOH6vvfrVBu
         Uvxw==
X-Gm-Message-State: AOAM530btBO9mcRYa7C9oaVIFfk3FKR1wOla8by+xTzAB3XI8x6la65X
        zqLyD5PO19OOsKjE/puLtOA=
X-Google-Smtp-Source: ABdhPJzvqTm/Nm+PXsUnnonj+hzAsHmMdgpH7qNTqe31VqH8Zr4W2/qHhdoBYRuZskxms5q7j/WZ0A==
X-Received: by 2002:a17:90a:16d7:: with SMTP id y23mr12154054pje.227.1614969615790;
        Fri, 05 Mar 2021 10:40:15 -0800 (PST)
Received: from google.com ([2620:15c:202:201:70ea:1e11:c25c:35fe])
        by smtp.gmail.com with ESMTPSA id c15sm3338094pfj.170.2021.03.05.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:40:15 -0800 (PST)
Date:   Fri, 5 Mar 2021 10:40:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] input: gpio-keys: Remove extra call to input_sync
Message-ID: <YEJ7DD3rLAh3Twdl@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305170111.214782-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Mar 05, 2021 at 05:01:09PM +0000, Paul Cercueil wrote:
> The input_sync() function will already be called within
> gpio_keys_gpio_report_event(), so there's no need to call it again after
> the loop in gpio_keys_report_state().

I'd probably go other way around and remove the sync from
gpio_keys_report_state() and add one to gpio_keys_gpio_work_func() so
that we do not have to send bunch of input_sync() when there are several
keys/buttons.

Thanks.

-- 
Dmitry
