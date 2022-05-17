Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B793352987D
	for <lists+linux-input@lfdr.de>; Tue, 17 May 2022 06:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbiEQEGq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 May 2022 00:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbiEQEGp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 May 2022 00:06:45 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266384550C
        for <linux-input@vger.kernel.org>; Mon, 16 May 2022 21:06:44 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y41so15788903pfw.12
        for <linux-input@vger.kernel.org>; Mon, 16 May 2022 21:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M8mSiEaombP8F9rvjTsjHydvtB/NM8pveZSY1W+Hpkk=;
        b=SL8MmdaAIPaqyWxRgjtcoKKBhg+3/cQnn0cnxtKS37ini9XEWYvWeIaARyHQbMa8Bm
         X0YppsDxDvDGXVmMvbJbM2++zQSg2f27AwdSu5xiReegScR0eA0As38hSVugEOzos85l
         aD4NY7qj9Lj4dv0Ar/EELoLWCoF8CtSww3YXjG1glWMEUxtoPR7pfgU6dEQt8NcG92ZN
         vWMy2fuTpGc0LEjZmqhcOHzY8OfPJzSLPdPxQF2eNmRaPQWjuwdqYVL3Gy/9iszLc4OG
         G8wLZJrpemVneKjx0lZ/Mju0Wecznj6oS6lqSdnxx3uns7R/JjtMF95Wg5S0/wNokYzq
         ECIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M8mSiEaombP8F9rvjTsjHydvtB/NM8pveZSY1W+Hpkk=;
        b=JzL+vuUJvMsv8ZT9wDApLJBc5LHbVb521+Wd7eVObCpwt8U0rYthblHZu+Uu6m/E53
         i564gKrll5vxSt5TS5n7o6wNDN8UYSF9PFxsYOzIdMrtudEHE3uIE7O3OnI13whEvQlz
         0Zq3bUo7tza3r1AHL6o6ibWq6VlyYTfQc/hBkdlXzkZidA5cIuzjHZyhCu+fLd5eF8MO
         exuQVQDgUMTIun54pUACYTd94hJ8UZRMAb1gtUo9mvIxztYKtdDgKJTd/QYdQw/5X3l8
         HadRcAok4u71Dqw9sP2gJJnj2G0sQF1Ks2+Fw3AX/Chqd97yGEPhObqX6CoEMZD8iSkw
         UgQQ==
X-Gm-Message-State: AOAM532wYEwGlC+Q/MvcRWI+mMH6wBPFED5001ox/f2/vnTP7DNZB6Ag
        9Tj+YJnFqL9eE2uwTH5VJYY=
X-Google-Smtp-Source: ABdhPJzpxyI8fF2mKOIUnK8rmZpXgVxZXiR6GJ0S6e1yOe3IPVx8suyJTQovwDveMul7Tl5Oy09Cog==
X-Received: by 2002:a65:550c:0:b0:3da:fde8:62d7 with SMTP id f12-20020a65550c000000b003dafde862d7mr17891382pgr.334.1652760403398;
        Mon, 16 May 2022 21:06:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2bd1:73e2:8118:8ba9])
        by smtp.gmail.com with ESMTPSA id kt11-20020a17090b214b00b001df4e851aecsm520735pjb.3.2022.05.16.21.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 21:06:42 -0700 (PDT)
Date:   Mon, 16 May 2022 21:06:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: psmouse-smbus - avoid flush_scheduled_work() usage
Message-ID: <YoMfT0pkNL1qtCG8@google.com>
References: <25e2b787-cb2c-fb0d-d62c-6577ad1cd9df@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25e2b787-cb2c-fb0d-d62c-6577ad1cd9df@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 06, 2022 at 11:22:25PM +0900, Tetsuo Handa wrote:
> Flushing system-wide workqueues is dangerous and will be forbidden.
> Replace system_wq with local psmouse_wq.
> 
> Link: https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Applied, thank you.

-- 
Dmitry
