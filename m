Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C20C5B85FB
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 12:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiINKKh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 06:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiINKKb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 06:10:31 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920F937F8E;
        Wed, 14 Sep 2022 03:10:26 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id bh13so13883199pgb.4;
        Wed, 14 Sep 2022 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=sXcqxzmwX9G1zwDizobYVVEq82zxcW3CpB7TVFq93fM=;
        b=VvJLlZG0L7ct5WE2LED5Yt1cwV27Y+ZHOXw0KRUg2Iyi/WnXiFd4sPtMf0inePnN0A
         ghQCfxwFEGiHSR1AOZv3qrcc5EPI8fn0lelfpMh4/rp0Vmzhpf64DhDRrlXL6g5+yE47
         7x1pZpJ2XD5muXWy7utZKWYEFZE5CSjR1SUiu/Ukqs1fjWxrpRQLvpt5ubJhh6GUZwum
         ik2sSG5kA3zQFjzUWCtN+Q51zEkY/ur8HYC1Jjw6sFUM++23Ou4ZpGLeo9upxauD5RGG
         BQ/fAKbK033w2lSRwwkOQBU+W5d7yKe64HcO1ct/+n0sn4NTjTPNwSAPbPlSlKyRcJX3
         GYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=sXcqxzmwX9G1zwDizobYVVEq82zxcW3CpB7TVFq93fM=;
        b=hGue7o3pgAZoWAWepW8V5oY69WY9iTtmR9LmNvvaSb44hkpU4C2iWX6c39Ta+DK6wb
         QzvAUpVFEV/KGZEW6iIF2fV/PvyYSsRvZdvE1famLSgRPlW1jKlZMQ81vGXlLoqWR/FH
         f4KwkGj1h0iT+NULCa7NLNsjt7MIr/jUSWDUbsphHXjymZ4y1woj50z7wyEajdEN2OTp
         HgWQn0hNnRVEIZrKRL4Mq0Pe5+UsrQYW28Z6skELp8bNcH5Yj1RngHhj5hxSTX9FG1Jm
         JHAaLrYAMOrjgTm//eeXfCuqkYDNN/VQCcWg6pnIjk61p43iU+e/TPCUb5qMRvG0LJbd
         DNpg==
X-Gm-Message-State: ACgBeo1n6kI17FULHj+Gx3RBSA4TjR/DoQVq7qRYwwOR+SHrhZatKWBz
        CHjVUIwOWmZ/jNjUHc3XTEU=
X-Google-Smtp-Source: AA6agR50qvtkp0cKhrmKfltJfDE+aeCpGqnGxly8Mh06SDxuA7B7nS8XB71KpT4xEAwQx/XxopNYpA==
X-Received: by 2002:a63:1f1b:0:b0:429:b4be:72f0 with SMTP id f27-20020a631f1b000000b00429b4be72f0mr30618415pgf.622.1663150225836;
        Wed, 14 Sep 2022 03:10:25 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2f68:fe7:a2e6:7595])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00172e19c5f8bsm1345518pln.168.2022.09.14.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 03:10:25 -0700 (PDT)
Date:   Wed, 14 Sep 2022 03:10:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 07/11] Input: iqs7222 - set all ULP entry masks by default
Message-ID: <YyGojwXBbZX3EZu0@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-8-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908131548.48120-8-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 08, 2022 at 08:15:44AM -0500, Jeff LaBundy wrote:
> Some devices expose an ultra-low-power (ULP) mode entry mask for
> each channel. If the mask is set, the device cannot enter ULP so
> long as the corresponding channel remains in an active state.
> 
> The vendor has advised setting the mask for any disabled channel.
> To accommodate this suggestion, initially set all masks and then
> clear them only if specified in the device tree.
> 
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
