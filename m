Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0772723193D
	for <lists+linux-input@lfdr.de>; Wed, 29 Jul 2020 07:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgG2Fyy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Jul 2020 01:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgG2Fyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Jul 2020 01:54:54 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC8EC061794;
        Tue, 28 Jul 2020 22:54:53 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id o1so11330076plk.1;
        Tue, 28 Jul 2020 22:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sH+GHVWLvfht7WtdnqRlJ01jONTC3ep9dhfQ3fA/ITw=;
        b=CKtATOm1ER44jJMAwxmv2/wsUTC7/3uSmo7SKzpKox4wN25lYUusukDbQTTz5zQFjZ
         ++2QM7aiEzKBod32RD919SnQP0Ynzf1ShirQcm5lS8KovRIAsPew/s6gMh/PjRyv6Gu2
         qWt4pk3kRYccSjK6pW1oQ6W1RQDolDNXb4raWvGkEl2pNkAPbfi0eWpnBACO3FEZjC+X
         HStZ/Mtvgk0Qfxtw5TFOFb3G5eS1gs6vbOGhFqNtAdubFUNXAr8SRM7nMRrVJhaEZW0Z
         fxhNkp8Jcd+8SaiHWEsIpczFz1XnsY9PZaoMUE0ty2lpaP0fj5nHElMxfc2/jpE0+v51
         NLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sH+GHVWLvfht7WtdnqRlJ01jONTC3ep9dhfQ3fA/ITw=;
        b=QP2h1dVMJwLw7wD/cDU2JbYF0tF5na57bMp2f5DEuk/tgmWxpMHgcKG/r64e9oYhqA
         xlOjWecfxh94/Gv/8hwCkmhM3cKa6zpDPBCZ04ebpkhACwGMeax8J4BRGGv2FIOzJ+Zr
         zcSZhPGC/MnpufUcU5CVH5rExD/a6c9TKb+RNgErtDsRTBvTieuYvBCGK8VnwL1Qx17h
         WQmenexhA9FiaXthTC+NK64DNYbi22M81bGvBQZY8qFDc9j/VumwcIZPas50PGxVwQRK
         hCiWKZzSatU4kmuKLiXyCznFkmsQGhzGKTu6CUJpWT3o35IC78NM16r2XqQTHsjztOeP
         8ZFw==
X-Gm-Message-State: AOAM532dK8TfWDbaN3buc1FQzb6FClQgqUOHmspYBdKUjrKhaWJxy4Dz
        MJkaEFMNFajDe57YDBLw7eJq+csrgY0=
X-Google-Smtp-Source: ABdhPJx0LXlZvOoeVmeVgQdLoFwG954NdXlzQn9VfJkdLJ5LL2NAF0LsEz4kuEdDPylFBLBcZIznwg==
X-Received: by 2002:a17:902:b705:: with SMTP id d5mr25889621pls.118.1596002092367;
        Tue, 28 Jul 2020 22:54:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d37sm916197pgd.18.2020.07.28.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 22:54:51 -0700 (PDT)
Date:   Tue, 28 Jul 2020 22:54:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com, digetx@gmail.com
Subject: Re: [PATCH v2 1/1] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
Message-ID: <20200729055449.GX1665100@dtor-ws>
References: <20200727151637.23810-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727151637.23810-1-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 28, 2020 at 12:16:37AM +0900, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> The workaround of reading all messages until an invalid is received is a
> way of forcing the CHG line high, which means that when using
> edge-triggered interrupts the interrupt can be acquired.
> 
> With level-triggered interrupts the workaround is unnecessary.
> 
> Also, most recent maXTouch chips have a feature called RETRIGEN which, when
> enabled, reasserts the interrupt line every cycle if there are messages
> waiting. This also makes the workaround unnecessary.
> 
> Note: the RETRIGEN feature is only in some firmware versions/chips, it's
> not valid simply to enable the bit.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 1ae4e8281e491b22442cd5acdfca1862555f8ecb)
> [gdavis: Fix conflicts due to v4.6-rc7 commit eb43335c4095 ("Input:
> 	 atmel_mxt_ts - use mxt_acquire_irq in mxt_soft_reset").]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: reset use_retrigen_workaround at beginning of mxt_check_retrigen()
> 	call mxt_check_retrigen() after mxt_acquire_irq() in mxt_initialize()
> 	replace white-spaces with tab for MXT_COMMS_RETRIGEN
> 	Changed to check if IRQ is level type]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>

Applied, thank you.

-- 
Dmitry
