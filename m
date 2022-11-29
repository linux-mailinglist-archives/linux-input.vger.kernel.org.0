Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABE663CB8D
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 00:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbiK2XEz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Nov 2022 18:04:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234423AbiK2XEx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Nov 2022 18:04:53 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A92627F9;
        Tue, 29 Nov 2022 15:04:53 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id o12so6265466pjo.4;
        Tue, 29 Nov 2022 15:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1JMkp2m5837PNyOwLwbAluvPTVrIGIb2NPY0408BdoA=;
        b=DoGuF76T7NuVGZgPXP+fFYPb5/DrRdw6urQM5GKcVi2DnS2hlFmVlUj2UEqJ1Js4Vg
         bMYtCMd6DjlrJCYYxdw1S3YbgPx7J9VmGyYtbHWq6ZS85U3c9CNDCO9l4cnIw8bHvsiE
         gcXpnCJ7cc/T8l445tjjAWxoWliCoWEApooMiAVfZsYea0GoyvuWbV1J3NQs7i0o3a47
         23p+BI3a28FQZUzebLlHp+sAzFABm8MmqD1XA9MimZKKlagsadZnQCFAKDhf5nBhnjkY
         dZRA+Uokx93g7RH1AuFwbQlwNEVdEM1h5Sw17tL/f0+TSzXY66XTRlD8S1uHircPicQM
         M59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JMkp2m5837PNyOwLwbAluvPTVrIGIb2NPY0408BdoA=;
        b=mtjbBQ75b6E5CYwsPL5o3k0U22PtYzo4WjzfvI90MV07+uspP3Lz0EtHNm2YvKDxO8
         9flg8ItM1XQAbkYL69WdqOVhWNkWzyqA8p+Y327Z6xDaJp7j3TiSLWDkyQGmDkS6hFbQ
         awMJgIzxiwqriA5oi97zOy/rDxqE8CoyEQVLArBXg+Q9wUpUU1BRCk/ST957B+qp/Wny
         b3T43o4nNlrpepozaT0YzWIJ2M2kEzKLkr1y0zSeMYbXJUTBK4/oJRW0OFuzExrs1Vs+
         He7Q8aWS5ZL3o8D4vBNlf48z7/Vg03E4IJ8wwKuOPcQJ6fR2DPmdopqYzUap4yhr2syL
         C7dA==
X-Gm-Message-State: ANoB5pmYsSNMYINnuKW8z08MGwiR3Ysu+TU/tf3nZXegO7iPkfpgnA/n
        3ElvGvtUQZCuVXaWgfY9PoxdAPWD3p8=
X-Google-Smtp-Source: AA0mqf7eg751e8GIBHGvNYK4SA43TteVun7qNJlESd9RB3fZaw5rhv529X65VRuBe1yuwgJXEkAWdg==
X-Received: by 2002:a17:90a:fe05:b0:219:29eb:bc4b with SMTP id ck5-20020a17090afe0500b0021929ebbc4bmr15931483pjb.199.1669763092443;
        Tue, 29 Nov 2022 15:04:52 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fd81:84b:81d2:4b81])
        by smtp.gmail.com with ESMTPSA id ik16-20020a170902ab1000b00172f6726d8esm11338629plb.277.2022.11.29.15.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 15:04:51 -0800 (PST)
Date:   Tue, 29 Nov 2022 15:04:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: elants_i2c - delete some dead code
Message-ID: <Y4aQEPVVXT3zdgdo@google.com>
References: <Y33BD9xkRC9euIdO@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y33BD9xkRC9euIdO@kili>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 23, 2022 at 09:43:27AM +0300, Dan Carpenter wrote:
> We shuffled the error handling around so this condition is dead code
> now.  The "error" variable is always zero.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thank you.

-- 
Dmitry
