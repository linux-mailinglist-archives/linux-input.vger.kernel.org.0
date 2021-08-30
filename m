Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3283FBE07
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 23:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233006AbhH3VUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 17:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhH3VUK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 17:20:10 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CCC7C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:19:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id fs6so10374842pjb.4
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 14:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xvfzHLdbdcGENqvtRZavsrsqnLmGPi9gZjLBWvqzjbg=;
        b=Ar5CREQGNZkR4eS5GjbEMm/xDu2LL6Yd5Mcm4TH9SwunoLy/3sbgmquI0KP0EhxhRb
         CcDhWiatxUta0rDmHnVJhvmTwsFKNGWggLQI817rkf04Y9BALA9UmkrRvE/FgzeQRTJg
         ttK3yZazf77a3GAqbG2dKM1oM6AbSWjuphlFLHH3TnJMzs4YDjsEj4cXVj/7A1q9gW8R
         PqycQCJ9Rxgimia6wN6M205xra/f/5HsybX/RROO8mlZcU/wCI1SiN6AxIYWlMmfUZSr
         HbkeDrt1Hyql5AirFDEMxoyzu1DL6J3F80wwdttbyA7Vt+jCb1444PfTIf72YoMHjxps
         rkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xvfzHLdbdcGENqvtRZavsrsqnLmGPi9gZjLBWvqzjbg=;
        b=kePF0ovLIjuVxGRYCi0rdByB+eUbrYYVb73hvMb0nZj6c9mLO3lc2rE85j2VdZgOwe
         5X8TUdHVUzPhy3fhPvBeV/FazcwaOeJWYbmBPSc6aeiyqPlZOikFjSQ6iQWQ1Tsys6eY
         uj3h2eHhUYieeY8teQ8oZGNAb/CDm4hJEFDODdQ4rELaMzhxx48rUxSpEcRsPG8Fx5VQ
         XuhyazvbhX0DpGoKmWgXJMNU5j5KnkcHeijTpUF1lZlvZoXkYzR6Tyh/ZEUvGGCz3yoY
         Fr8/YWxNn7k6cDqM/2ly17hdVrV/Y60JGVsa66xtU0OAfcDe8hE+ETKa3DMieydtcPHk
         rxIg==
X-Gm-Message-State: AOAM530pZJRsmFcJsVVw0YQYgH8q8qvOBa0doMYZI6C4+2EQD0fduWDI
        t8LFfqLbqir2MtoiXGH3SL5fLVQdbmM=
X-Google-Smtp-Source: ABdhPJxIpRUrMyqCjIDeyfQGgDI1B+PFPaB/THdzJo345jwedKGU5kTi/EeLwIdBipJjgj+nfQjrNQ==
X-Received: by 2002:a17:902:9303:b029:12c:29c:43f9 with SMTP id bc3-20020a1709029303b029012c029c43f9mr1427193plb.5.1630358355446;
        Mon, 30 Aug 2021 14:19:15 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id c9sm17693152pgq.58.2021.08.30.14.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 14:19:14 -0700 (PDT)
Date:   Mon, 30 Aug 2021 14:19:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org,
        Jean-Francois Dagenais <jeff.dagenais@gmail.com>,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] Input: adp5588-keys - Use the right header
Message-ID: <YS1LUE9kPxkq4UYY@google.com>
References: <20210820222958.57238-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210820222958.57238-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 21, 2021 at 12:29:58AM +0200, Linus Walleij wrote:
> This keyboard driver is implementing a GPIO driver, so it need
> to include <linux/gpio/driver.h> and not the legacy <linux/gpio.h>
> header.
> 
> Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
> Cc: Michael Hennerich <michael.hennerich@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
