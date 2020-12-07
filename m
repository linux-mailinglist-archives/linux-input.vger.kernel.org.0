Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898462D0AA0
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 07:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgLGGUt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 01:20:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGGUt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 01:20:49 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05453C0613D0;
        Sun,  6 Dec 2020 22:20:08 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w6so8778303pfu.1;
        Sun, 06 Dec 2020 22:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9W24MISDYMrf+PTfgXdHrPRsxaG7wT01UWQ5LLKP26o=;
        b=YjIVjcfwMpqeHp6DVQXDINBA9CsGQeLF8kFxeU2dQwhhG2md44pPRuGj4CINIkxNCl
         Zij36sPUekeXmSxBEh+hFwLQX2hWSnJFDMgGL72lj8ONTSH6CzgNjGirp6W/6SLhmUJ9
         kpVeB+o44fdM8HSfffBfp1sM9BBdU8eFBqofSKfNjpjctmhsMIbliEO9I4CuOSdsL3nI
         kpnn5szHsxVRKwW+HK00R1eLLvV0TC0f42mnvaJc6ryY5QHy/Cx3uhStRrZc21gs9uYF
         EkD0c/TLuGNNnG5o/USbLwnEHkIqJL/t83T+l7YtcQcG7ByyS9AdG7X97/P/oFxnyQPW
         VP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9W24MISDYMrf+PTfgXdHrPRsxaG7wT01UWQ5LLKP26o=;
        b=rqI/PoTDS740BNkKn++bbUI4hfuY1n37lmlbC0chzWKjvQKsx/iGH/71zlubPN4ubt
         kY/hUhWQSxFNYnZeU3EuDyB7nepMAvoai3FocxvFD+LYoAwACCsL+0MhoYQcfZhDJPk0
         guhtbewmp8wxxbiY2o6C3uUKMxkK1ZpFSuPldBReSU90SMzTQUlGG5uaZq2z1DGQzJi/
         oCoAPkgDxW4wU03FXbjKO3TYLhlo912+ora42/PI4upTsB+rHRKAG17P7boUVUPx9k2w
         18fyKnFcVwfNW7+NyXaTF63/0s31vUFrMJH8DdXjz1eej1pRIlCgWRzORV8a9d3AJboS
         yjnw==
X-Gm-Message-State: AOAM531Yq9+z4WPfe0v+XeDVU8u4HXRLa3JF2NeDhCXxKt0mWlPNFY/c
        SjjSOn6HNajkOnVUy83PAfA=
X-Google-Smtp-Source: ABdhPJwWQvDOHeiG235GD3pRY5ogib9ZJOu46mPiNCHwmj2LuwMsbCaxu6JG95aQqzQmk6ndcMqFoA==
X-Received: by 2002:a63:1758:: with SMTP id 24mr17272571pgx.170.1607322008430;
        Sun, 06 Dec 2020 22:20:08 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x6sm10328920pgr.20.2020.12.06.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 22:20:07 -0800 (PST)
Date:   Sun, 6 Dec 2020 22:20:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] input: raydium_ts_i2c: Do not split tx transactions
Message-ID: <X83Jld+Ga1ahuve2@google.com>
References: <CAEGmHFFuJHNpXOjzmBZ0Sjgsz-x19QFdSuns2v_uMFQyPQis=g@mail.gmail.com>
 <20201205005941.1427643-1-furquan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201205005941.1427643-1-furquan@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 04, 2020 at 04:59:41PM -0800, Furquan Shaikh wrote:
> Raydium device does not like splitting of tx transactions into
> multiple messages - one for the register address and one for the
> actual data. This results in incorrect behavior on the device side.
> 
> This change updates raydium_i2c_read and raydium_i2c_write to create
> i2c_msg arrays separately and passes those arrays into
> raydium_i2c_xfer which decides based on the address whether the bank
> switch command should be sent. The bank switch header is still added
> by raydium_i2c_read and raydium_i2c_write to ensure that all these
> operations are performed as part of a single I2C transfer. It
> guarantees that no other transactions are initiated to any other
> device on the same bus after the bank switch command is sent.
> 
> Signed-off-by: Furquan Shaikh <furquan@google.com>

Applied, thank you.

-- 
Dmitry
