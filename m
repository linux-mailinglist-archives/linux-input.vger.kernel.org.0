Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13DD990693
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfHPRQ0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:16:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33415 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbfHPRQ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:16:26 -0400
Received: by mail-pl1-f193.google.com with SMTP id go14so2395209plb.0;
        Fri, 16 Aug 2019 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=V3U/1or047ebxbPjgunyIly+3D8J7md7vLQhFfh1GdY=;
        b=ESV+yx+CZI4XCe/4+waruqbjoCWEE0k6g+QuVx4GOnpzAcV0yNeq3R+pzxqw8CmwIT
         Ur2AjcBG/gLKXxR9dlnMZ8X9M6XQxjcBDTQFxjqslQEK4D2utDzJ82CAt3LR3FMF4sZh
         U5KQ12C/SZk0/5oabIb7jn/ezm4g8LdYkQCR4Op20PXs8uU4S4AnMTbm5C78FDwcnJdx
         xnXIzhV9YXXC34+sI92L/M4X5Vsvbj93DBUma9mI48QPOC7ESzGhtEXZ73KYKNhRoB1n
         ev3MPcXUi/wBgtm+KSBdbICsXUZTrkIXn9Hui7vcnlZN6zjRd9z439lYp/PDjiU5wX6C
         0c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V3U/1or047ebxbPjgunyIly+3D8J7md7vLQhFfh1GdY=;
        b=EruFKASSxnct6qe8t7kFUf2xcG7yQlxJzi23pYmiMGksOKFrp8WIlbI1YJP+Ngg+9O
         otezR61ABXsjNKIGnXnbYWcGpnSGJr+o9cnTj49CvTeU7Rg4lvqt3fkTaz9lHs9SEvni
         jMvvZ0HptKKh2vIJTHsRaqdJNuMB4Jtx6AO7hYwbfh045zqNPIxa/bq8n3yNm4hnWz39
         /Tv8QJlaS/3Jqp7GIeO/qHoLy9gPClScLIr4xs9JTg90SljuuNFuWue7UL0Bn58WDPCF
         GjW2gT+rLiyHjanCC2DTxv0JE9pHur+GMmzAxWWpLZSCp28jRHHP6GfwHf2mx8wFQzvg
         SJJg==
X-Gm-Message-State: APjAAAWpsnjQ57YY2c1LbOiZ+Ryu7Fninp2coqYVERildllV2v58yppB
        GrjwZX0aYaG6nZSqI4xYBjQ=
X-Google-Smtp-Source: APXvYqzMgLKF7sHX2AvApOEsHIR2a59X4pktyaHTdE+mk9TBh/4Y07rjk4wMIxsoDA8Pc8IY8WI26g==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr10466091plr.68.1565975785081;
        Fri, 16 Aug 2019 10:16:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p1sm6836956pfn.83.2019.08.16.10.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:16:24 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:16:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 03/63] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
Message-ID: <20190816171622.GF121898@dtor-ws>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-4-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816082952.17985-4-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:28:52PM +0900, Jiada Wang wrote:
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

Instead of trying to work around of misconfiguration for IRQ/firmware,
can we simply error out of probe if we see a level interrupt with
!RETRIGEN firmware?

Thanks.

-- 
Dmitry
