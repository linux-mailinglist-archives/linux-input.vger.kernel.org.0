Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB925E9119
	for <lists+linux-input@lfdr.de>; Sun, 25 Sep 2022 07:16:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiIYFQf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Sep 2022 01:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiIYFQe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Sep 2022 01:16:34 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF79A40578
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:16:32 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id v4so3791962pgi.10
        for <linux-input@vger.kernel.org>; Sat, 24 Sep 2022 22:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=skXnghuKRStViMUQpwaXhhhmGCbktRaVTjYuj6DyIao=;
        b=i32YmqsGkfWNeqkYEZwbrJu9zLZ5sxLAyC2qyEHNSm0pBHw5yli1c1FJoraZuxmCEl
         RFPR42j6FQxGE19kF2sG9bww78YJVJmOIwl5FxaM15EcU0n3QDAh30i6902PjVbdSp/T
         i/3b/HidOUnlbV33ltiOGyTzdC6TiqvA6lzI4HGxzEkA7kCIOpSEO+/HZ+gyOOnKA9Lv
         cqrB3XVzcGWQrTUDNwTgAb8mbHZfM7edPgLyX1t+8E5rXG1OxF3WIWPMe6NPhQPvLd86
         WCvngQVZx2U8bkHVTEEaZW0vEHiNQ50YCq9CctByBJjOl5tfUReaE0JCfxVK2jeZ8SUG
         tD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=skXnghuKRStViMUQpwaXhhhmGCbktRaVTjYuj6DyIao=;
        b=Y9U+2TZ0QQYaCEDLTIon6ZgYVChy+mnnxxazefwaiE7Ho5Fcittsc4IthqxLsB96wo
         /bBMuzOUIsR6yHm2RJmpHYBO0Bdqt8Er9jlzpiJZsFnmD52dx3ofw4L0znYlGcfNYHZY
         PSNgzKMUvI1kOjksFKt+cUaHvD8apnn3m5V6/8xgBj7QvgR5ZxgJmZpdvrwsKD5YqDXE
         fQGEXGUzfv0gn+ZiPMp2SkxW36QLquAYApPt2U1umLnrxZj+29E+hqK7YRTNfR6Ftr4h
         pEe/Op/9oLJkDZWgo8n2lCaSkYWhgvPp601RtTv4nWmNbvwahW/Pjjxmr8cH489aQz14
         rKqg==
X-Gm-Message-State: ACrzQf0bdMtCFP+Ja+cPBp12ZY6e8KfqO4NvV0Ni7zM/lZtX6lxH7PfB
        Z2CJzLfS494N+2nZKLLbBCo=
X-Google-Smtp-Source: AMsMyM58QoIzaNRiQnD8KiBJO6KInhnkIq8/KXIfhPYth2UdL43wS2PVlYabdz9z+vldfouhnBTXEg==
X-Received: by 2002:a63:2c90:0:b0:439:ee2c:ab2f with SMTP id s138-20020a632c90000000b00439ee2cab2fmr14958437pgs.2.1664082992029;
        Sat, 24 Sep 2022 22:16:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:37c:3916:9a45:14cc])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709027c0400b001637529493esm8657214pll.66.2022.09.24.22.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 22:16:31 -0700 (PDT)
Date:   Sat, 24 Sep 2022 22:16:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     linux-input@vger.kernel.org, snafu109@gmail.com
Subject: Re: [PATCH] [PATCH] Input: Disable Intertouch for Lenovo T14 and
 P14s AMD G1
Message-ID: <Yy/kLCLQaO/4Xkte@google.com>
References: <markpearson@lenovo.com,>
 <20220920193936.8709-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920193936.8709-1-markpearson@lenovo.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 20, 2022 at 03:39:36PM -0400, Mark Pearson wrote:
> Since intertouch was enabled for the T14 and P14s AMD G1 laptops there
> have been a number of reports of touchpads not working well.
> 
> Debugging this with Synaptics they noted that intertouch should not be
> enabled as SMBUS host notify is not available on these laptops.
> 
> Reverting the previous commit (e4ce4d3a939d97bea045eafa13ad1195695f91ce)
> to restore functionality back to what it was.
> 
> Note - we are working with Synaptics to see if there is a better
> solution, but nothing is confirmed as yet.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Applied, thank you.

-- 
Dmitry
