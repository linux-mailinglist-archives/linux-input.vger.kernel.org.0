Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5945B85F6
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 12:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiINKKU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 06:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiINKKF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 06:10:05 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6971819033;
        Wed, 14 Sep 2022 03:10:04 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id b75so9188056pfb.7;
        Wed, 14 Sep 2022 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=cPFUbVusUyYaamNKcLMOcgI4YKxbnXYHUGcz80IUKLY=;
        b=jYCUBdXOCio5vgYh8T0yWK2B3AULh1sAtJL7aA9a64J93Vh8UJHHoQf+SZ8ta++uQU
         jnjVqUhuS+9CuzVMwbkdHnhTNMNYudPa3HYygSLizNBgPBumS5xUlmAJSUrwnkN5Dhkz
         rHcYoBXkhDQNF3tr3ADHlaBEQ0ftS9oY3DBPXy0wf81Bb+n8CCSg1uw2XQg04C6fYsMv
         m5UgyoEy7fmDmMI1h4YHh9YF4pPJCV1eHKWpXwhCXv51oNNotubfpOdNpMmA+Lqw1frU
         1RsrX9+RRorUrYxBG5aF/12P60yTbM6vPmfwEQe3ULLUxs0gxgMUrbQSCn6uFpYjnnus
         KPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=cPFUbVusUyYaamNKcLMOcgI4YKxbnXYHUGcz80IUKLY=;
        b=H5+0aljJgZMw0iDizjT46qhjhaux+oK0MiFmz4v+hahlvHgwpAyEfNgcSv97c3RpBt
         BbXnSSdThFhcQHtgOfwB17WyCAS774UJKvBVtG/WTfFFFpUXzN/497D5uMhRYYUHRDYJ
         Xt5jkTz8BtqacFWE0riW764WAmQKVbgQ4UyrUsF+Jm5FPzWShbLbGxeD92CHnym2bvpP
         UKD4GoetzOzn9DOUyqh/BGvUr+V/3fqakJiYy7YDrR9LiuO3LJJy4CakEppi3oFCpYfz
         tExrugt7/PDuKLB0L3GDGWO6McRwK6KL8mIIsqidcGCM3mQK/yT6o303CirJKmCgqrzp
         ADuQ==
X-Gm-Message-State: ACgBeo3K2vC9zG5DlFBGcgPSs43GaZ2n7RPQRqJUUqecmozm8oS5VWes
        4PgsWXzdZuU8NFK65f2CZTkWJVMp9GpOTw==
X-Google-Smtp-Source: AA6agR5j5eb7ea6KNgF67Quj256gbBNPWIzWcDkngE1+TbgZmBXTL1Vgj2erShl7rVyeOUKDU7L3cQ==
X-Received: by 2002:a63:e34b:0:b0:439:77cb:bfbd with SMTP id o11-20020a63e34b000000b0043977cbbfbdmr331463pgj.309.1663150203748;
        Wed, 14 Sep 2022 03:10:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2f68:fe7:a2e6:7595])
        by smtp.gmail.com with ESMTPSA id l22-20020a17090af8d600b002031264a864sm1300006pjd.41.2022.09.14.03.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 03:10:03 -0700 (PDT)
Date:   Wed, 14 Sep 2022 03:10:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 06/11] Input: iqs7222 - avoid sending empty SYN_REPORT
 events
Message-ID: <YyGoeCEo79dXjnTV@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-7-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-7-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 08:15:43AM -0500, Jeff LaBundy wrote:
> Add a check to prevent sending undefined events, which ultimately
> map to SYN_REPORT.
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
