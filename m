Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 110845A3B3D
	for <lists+linux-input@lfdr.de>; Sun, 28 Aug 2022 05:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbiH1Dy4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Aug 2022 23:54:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiH1Dyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Aug 2022 23:54:54 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B8E1001
        for <linux-input@vger.kernel.org>; Sat, 27 Aug 2022 20:54:49 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id 145so4878825pfw.4
        for <linux-input@vger.kernel.org>; Sat, 27 Aug 2022 20:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=O8bHOv/8Od8FmasE3bEMr0kYyYk7jZ1oAXrwIEiwQ10=;
        b=IBO/Pzf/J8VmbDx3jG8dn/4gr/ISd/Uf754nBwyQOlAzmfxO3tBlDUtbVlJjHeIpgx
         6O81SWntJWu0gdOe91+fT0ARJe5zvq4CAAezWsqAYPu3k7wpfiTPTc5bM1HJWd1TYEKU
         WB+9vnVggwyDYE2NJTr5bPtsVuYwy89OPSNfEc+F42Ikv8ViESoirgBbuSQ89/heC+Mk
         o5zynejx+Rp8D8ejDjdXs/UVGmASdhGKB3DbmR+E0Y8tDs3JxEhPhL7mpToCz8cPtS8x
         2CHoIXpaq57yJFl9MQQU88KKtSJrrgc4y8p24z7RFZuMuy2vaxlUvbh8syItuGyFX3Cu
         q+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=O8bHOv/8Od8FmasE3bEMr0kYyYk7jZ1oAXrwIEiwQ10=;
        b=YQpIol/nO15AlClvMLS1usGnyXueXCZAJTqbpCQfCw2Ic/ED8Q8twtxlWXLY9tmry2
         RlLCP+DTm6Bmd7R1G1adw1FNLwEXE5SkCoGffeN8ru1EFLOs2A8/3X+wmpV1r+hZG9Ma
         LQci1XpwgqfxyEGoGSQu/0cpf9DD5d1/kDDU9qsmfr9JtQez5k84nQeuw32CjO6OYlne
         ElE3oAVfOteij1RHiH3A0T2Xe01giv7hbsmIGzKkisKTWjEEm4stYad2htEeiSF7upVJ
         Vsr9KZEc8IPNsafEiups61RNGQ9+suhHT1X03BeJd/W0JU8CytBtua1QwLgRPulHabvV
         nLwQ==
X-Gm-Message-State: ACgBeo3M/GnWEaPcgtrIq2ZTcdWPA9CV+tN4ThuKTuUlzkN7nnpChS8J
        HC0o4NgoS1Rhz42nUTFyiYY=
X-Google-Smtp-Source: AA6agR7RldTWKVZ53/omxmBai/j/R7VRV3guUQf1HvDvHZ+fUwHc5DlSREmVWh8smAZF/nkRvvd7BQ==
X-Received: by 2002:a65:594b:0:b0:42b:f6bc:a04d with SMTP id g11-20020a65594b000000b0042bf6bca04dmr298378pgu.313.1661658889123;
        Sat, 27 Aug 2022 20:54:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6744:7e4e:7103:ef7b])
        by smtp.gmail.com with ESMTPSA id mp10-20020a17090b190a00b001f333fab3d6sm4063537pjb.18.2022.08.27.20.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 20:54:44 -0700 (PDT)
Date:   Sat, 27 Aug 2022 20:54:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Johan Hovold <johan@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>, ira.weiny@intel.com,
        Hillf Danton <hdanton@sina.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2] Input: iforce - wake up after clearing
 IFORCE_XMIT_RUNNING flag
Message-ID: <YwrnAWUCY8S1ZOZZ@google.com>
References: <c10494c0-5da5-716d-3e62-abca5b65dd88@I-love.SAKURA.ne.jp>
 <887021c3-4f13-40ce-c8b9-aa6e09faa3a7@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <887021c3-4f13-40ce-c8b9-aa6e09faa3a7@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 27, 2022 at 07:00:00AM +0900, Tetsuo Handa wrote:
> syzbot is reporting hung task at __input_unregister_device() [1], for
> iforce_close() waiting at wait_event_interruptible() with dev->mutex held
> is blocking input_disconnect_device() from __input_unregister_device().
> 
> It seems that the cause is simply that commit c2b27ef672992a20 ("Input:
> iforce - wait for command completion when closing the device") forgot to
> call wake_up() after clear_bit().
> 
> Fix this problem by introducing a helper that calls clear_bit() followed
> by wake_up_all().
> 
> Link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407 [1]
> Reported-by: syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
> Fixes: c2b27ef672992a20 ("Input: iforce - wait for command completion when closing the device")
> Tested-by: syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Co-developed-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Applied, thank you.

-- 
Dmitry
