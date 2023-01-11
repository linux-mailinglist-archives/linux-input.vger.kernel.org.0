Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA2366510A
	for <lists+linux-input@lfdr.de>; Wed, 11 Jan 2023 02:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234584AbjAKBTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 20:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbjAKBTD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 20:19:03 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37AB76426
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 17:19:02 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y1so15130454plb.2
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 17:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYT/6Oh3fBh5PO9wiaquZd5VuJWLDrOHwPDKzikGiL0=;
        b=n0pAy97UytwMND8UDpXiRb7q3ZL+Sl/Znuzu3GMziBXPDqTGYRBUVpTf1OGRjag9mW
         8WKtwW7TqnbA+2hcTk+a5dq6dTbRInkSibYiCL7omuYBlbn/zwBjoIipdZN86Hi6ohcv
         cMRk1MoVA/t3hmmyYcoK2mk59/WAMAm220Jw0ZJm55CuBY/oOxLfxfk0mJ1J5blfkz2E
         UTIUQkxqyU9vT03HlhFiGiGj8O7EmyyxCt2Imj3a9kc0kfoWsdymyPvtiZ+WOT6VLoF5
         Yoo9fiJRg9cGOoDTcBZjlME81MxRsnwiPnFaOtYBIMDOQL9ihyrqHE08PlnXPmVTmmGZ
         p1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYT/6Oh3fBh5PO9wiaquZd5VuJWLDrOHwPDKzikGiL0=;
        b=S9kTOv/CgUBLGHr+1mSE8Kk9gZhQ2oUkvHxcoA8VF/6sFvKjCdDaMqvELToIq8RdKe
         V6LqDOStAvibDM8yBKH9FyZuta/AQGtPn9K+f47f/h3VuZRahpSAT+Y2Si/Fk3hriO4m
         4v155jTmPiajgX4DOCQfUnmjiBwquQkasHqDdXm93uZ55g0pokmCxjqtf8gh/1+WRjF8
         WxWZM7J19jwe0xBB4lhy/7ns4omTeseLk8CCN7Gvgij59bv6OW4sk4nZXf+RNpbbxSG8
         +yme4Kw8iAI8V7H0efWwGYHAMMxyYJoT6TzhgZpHtXo72oDJC1CBSxiOqDxRh+hgWm+z
         GyAA==
X-Gm-Message-State: AFqh2krLHds6cU6lUP0lBaJ3zM27EDLXKN0wlmzSRzaEm3aKT1bjIQwJ
        F/hROfYTwUAP8p04mLLsBqo=
X-Google-Smtp-Source: AMrXdXu/K99sXuBa4QpSFxSzBnLbBoB8gPaVc2DcYr4zxxVh81ogdCkI0tXIB3XQvhHToRYK89LJAw==
X-Received: by 2002:a17:902:b102:b0:192:6990:ba60 with SMTP id q2-20020a170902b10200b001926990ba60mr664445plr.63.1673399941398;
        Tue, 10 Jan 2023 17:19:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:3f43:2598:9756:e3b])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090322c300b0017f8094a52asm8767622plg.29.2023.01.10.17.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 17:19:00 -0800 (PST)
Date:   Tue, 10 Jan 2023 17:18:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Miscellaneous fixes for Azoteq IQS269A
Message-ID: <Y74Oge64vGKEGte3@google.com>
References: <Y7RsTqhYJOZs11sK@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7RsTqhYJOZs11sK@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 03, 2023 at 11:56:30AM -0600, Jeff LaBundy wrote:
> This series comprises a handful of minor fixes that result from
> continued testing and updated guidance from the vendor.
> 
> Jeff LaBundy (5):
>   Input: iqs269a - drop unused device node references
>   Input: iqs269a - increase interrupt handler return delay
>   Input: iqs269a - configure device with a single block write
>   Input: iqs269a - do not poll during suspend or resume
>   Input: iqs269a - do not poll during ATI
> 
>  drivers/input/misc/iqs269a.c | 327 ++++++++++++++---------------------
>  1 file changed, 128 insertions(+), 199 deletions(-)

Applied the lot, thank you.

-- 
Dmitry
