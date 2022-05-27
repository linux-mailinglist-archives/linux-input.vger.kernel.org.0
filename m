Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2575358CA
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 07:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240490AbiE0FhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 01:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231261AbiE0FhV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 01:37:21 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273F84474D
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:37:19 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id c22so3114945pgu.2
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2qygXsNzBcbDG9XmVcUaenTYNKq854/40qG9v1wJaUg=;
        b=oguqwwt00bOO5epLcjVqoC38GfE8KYSTPQt7rK63weefZHL8QR2ScaDfKR9UBqWyZt
         BEdSjYt6hdB6GNX9Zx8qxa1EvZcQTSpzBvtQwFRqMZuHNdZ6z3hzokjgXFHGZlct0YGT
         R2tRB3UXljdDsG8POggxxPlWlyQGLeNLXSMTTm+ys6ymCzxp+69Ha1Zt5PAL1asOCw4I
         8ZSE7gbq11dRDh7nHpWI4PW6qDXoUgreIrdsQeH/VooTl2rF+IeiZHvgcDJvqYF6/9dS
         YuHnJ2UjYebIJuYta0cEJ9dyLfjl3mUOESC4H4CetKd0+RcC97sGLrXhzYFeF9lu5xDv
         7hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2qygXsNzBcbDG9XmVcUaenTYNKq854/40qG9v1wJaUg=;
        b=R+fPQvNymWVF8DrmDUNr+YZzxPbDIZfFSje2R2AaxPcbcgvLxfWFapp45Hq0LlNS5R
         bHHUnOywWmvYbIYJ7t5hf2frwULPsKgor0BetyZfb3ng/L9Z/YzFQBLNS6Dzl+3m/1au
         sZe5fyNNhSN5B6XNEGMOcdRZQZC7xpj8hUALAUyHoY0siiTVW6BMOw6Z1I/Zowdp/EH3
         xIoFsV44dyRhsfZg97oncMtNR1uPMrAK9hU4dCNHokCCvFnPDqQwxZaLpFNKaYWCQznG
         xbblrDn7Y/dX0s4gvnPQ3R+s70dnuEn+ONc5hhwg8zZJVw4o/idFbhSuRY19fvFFM6Jx
         hDEw==
X-Gm-Message-State: AOAM532HSmvbxdcwcsTD8aR19aKIqovhJY+34t/NkvpP4YC791S9+FzB
        +XM8Dxzkmunqc6W3O/8vG0A=
X-Google-Smtp-Source: ABdhPJxysMgVsNxVqdBpT0SM+SfFfufc4cGdNln5pcBkWb4ad2YiIczQEPwAh368j6FZyMH0TQIAwg==
X-Received: by 2002:a65:6d0d:0:b0:3fb:1477:5191 with SMTP id bf13-20020a656d0d000000b003fb14775191mr5777448pgb.541.1653629838624;
        Thu, 26 May 2022 22:37:18 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id q17-20020a170902b11100b0015e8d4eb297sm2570857plr.225.2022.05.26.22.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:37:17 -0700 (PDT)
Date:   Thu, 26 May 2022 22:37:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 2/5] Input: zinitix - Add dev variable in state
Message-ID: <YpBjiw9kWZSLn85Y@google.com>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
 <20220410120059.2583849-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410120059.2583849-2-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 10, 2022 at 02:00:56PM +0200, Linus Walleij wrote:
> To avoid several steps of dereferencing the struct device from
> the client, add a struct device *dev pointer to the state
> container so we can easily get to the struct device. This makes
> the code more compact and easier to read.

Same concern as the previous patch...

Thanks.

-- 
Dmitry
