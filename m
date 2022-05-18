Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6395C52C591
	for <lists+linux-input@lfdr.de>; Wed, 18 May 2022 23:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243179AbiERVch (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 May 2022 17:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243183AbiERVcg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 May 2022 17:32:36 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BCAEAD27
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 14:32:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id n8so3012671plh.1
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 14:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LEBuP1smfHbrFMnQWxiF1WNb8X9aoOFQRhV8B6HKU/Y=;
        b=PD/AR/282opE0tnaQHXAeFM7T7i/LhG6QYHUwr/ABh3z0k27RfeNattJWk4NIxTggw
         leLoBskpnWiAxyhiSrsA9KmTCfvNGOCctsZGsJEerYRYxN74ftNtrTjU1DjfJqEHYjRa
         bDt8zjQmM6YRGdn4WudYd76g5AADwxYaPwhkuS3BwlPPSYeEzam29vtPomSMrh4mwVCQ
         6KlyJTRPFYXEWWiEdL39xMpvISPuETnvATDgGcZAkGSDq4VkBi0MKVokgFHnXDkL7ada
         ZLvGm57yf6yenMcI2uUBpeQwkyxJlz9OtNcYLP/rQOnZNzZ7rR0Tib/5hYNoMg6D8TjF
         moug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LEBuP1smfHbrFMnQWxiF1WNb8X9aoOFQRhV8B6HKU/Y=;
        b=RWbeRpB5liVw9fe1P69tl6sXrdrLYpJ311Iw/ozqq1Ni8FLCT3ju93DYUyB1Oqg8aW
         QpAMk8KIcF0mutvOGnBiOeTgUWDQrqKFMqnKGg36gbh/bXGpFNDlVNWaxjIm1MK2b6hX
         Wj9FOD/5RBFGBPbyDx4RVhbT26g83vE5IoM9QoK4OiyC5fV3zWKb+D/scRNKVhL3fSlY
         uhZasgQLn3XqlAGmRfqiTzUFyMgJ3C9gDEYx+3wcgtfpanTWuezcOrQpfcvZtnFUULys
         HKA+wj81GbeAYK1PGnB09YENTFKXeZ8OmthXnDyHrvRZMiAW01zibTBGTHBh6tEE0lmt
         vXbg==
X-Gm-Message-State: AOAM532D6OfECfywK7yBV+M2MkGTNPU/7m33RNSITtO+HVk8DOp05O6U
        s9EtUDSkKinS1URWo47DjWM=
X-Google-Smtp-Source: ABdhPJzWdruTe+FVyGn9Uyv+PCqXCA5s1d2JpkpEWfkYOrIh2xwEIMlpXfdtwzjHIUysNRKZFPa8MQ==
X-Received: by 2002:a17:902:9a4c:b0:158:b6f0:4aa2 with SMTP id x12-20020a1709029a4c00b00158b6f04aa2mr1487143plv.163.1652909554791;
        Wed, 18 May 2022 14:32:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1a53:727c:6847:3659])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902e80100b0015e8d4eb21asm2161622plg.100.2022.05.18.14.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 14:32:33 -0700 (PDT)
Date:   Wed, 18 May 2022 14:32:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: ili210x - Fix reset timing
Message-ID: <YoVl7yPMQSSAWwbG@google.com>
References: <20220518204901.93534-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518204901.93534-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 18, 2022 at 10:49:01PM +0200, Marek Vasut wrote:
> According to Ilitek "231x & ILI251x Programming Guide" Version: 2.30
> "2.1. Power Sequence", "T4 Chip Reset and discharge time" is minimum
> 10ms and "T2 Chip initial time" is maximum 150ms. Adjust the reset
> timings such that T4 is 12ms and T2 is 160ms to fit those figures.
> 
> This prevents sporadic touch controller start up failures when some
> systems with at least ILI251x controller boot, without this patch
> the systems sometimes fail to communicate with the touch controller.
> 
> Fixes: 201f3c803544c ("Input: ili210x - add reset GPIO support")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thank you.

-- 
Dmitry
