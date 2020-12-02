Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411682CB32F
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 04:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgLBDQR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 22:16:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbgLBDQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 22:16:17 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD799C0613CF;
        Tue,  1 Dec 2020 19:15:36 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id o5so199650pgm.10;
        Tue, 01 Dec 2020 19:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Rks9iDroLs07BseqwMKTnyj2oPFRu7kKJBxKHhohW3Q=;
        b=tYZ3XDneslqcNycAwErMGSPtcmyn6QyCYlZjMqtABmGeJSMh4QaqvT/BvtRrMGm6w/
         Uto87yAEshsmC4mywBLQCs0lki4jqa8tPDrtxLvUchOI5jUjl/kmYeNZL3PuSbIzlq7v
         jo8kap+g11+Bil+T4+LhZ8izzgroS41c2uIR0LJ4pkaNcHrSd6b4j5qeMgO0IrWzzym2
         vWq29t9mnKYLQyjuvIFXpOMpfJ5WXODLbl0BeHV7OQBKli/qhZk3JtGXU4HwafcTftqT
         H/UBiKZB6Eeyg33gPMjp169qvPaI6fNRxyoxD197PhqWzZqTtBa7K0FPcrOOiWwRnxcx
         p+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Rks9iDroLs07BseqwMKTnyj2oPFRu7kKJBxKHhohW3Q=;
        b=q3ZvPbhClAa+uo7FFsf+QlqL5eHjwwfrvOo115QkqkAnAeeN54L4fMfbfBLAR3W2kL
         4Rv4eypnxgRdlBn0Mztu8X53tTLDLfAyFvhWJMazdQwfJKiyNhUU2Kk4ni42G6g79l59
         QcayhFMZvfqqih/+MWLnXdXpq2yI03mOa++lytpZsIp0lU3bgdBAmKHOChoirFnPGWvK
         02ZQpZ6BfzdqJBBArz0QhykaQn1BPmjN5exaUOI4fPH8brIYBoCgZhHSWy7cdP8766kr
         sWGJlqQl3UzbvLkXXxUijU2gYLMF3FJSBe4wp4tXtTc6CsCaJoMWoPm2eDnM5A/Jeu/q
         QbZA==
X-Gm-Message-State: AOAM531sKOZkIjF8hK9AsLmIDaR5CbdbBtyBVohRjjOHrZ3pkd64E3aq
        RHbEoCeYqMadcxZIK/v1PA4=
X-Google-Smtp-Source: ABdhPJxroK6P2BQXgv2VpfeIbksxJUHHk9S5Q/bM8txGqYEVVcrU8dIwIzykaWi/IStzDM6HBGqvSg==
X-Received: by 2002:a05:6a00:16c5:b029:19b:696:28a0 with SMTP id l5-20020a056a0016c5b029019b069628a0mr606759pfc.9.1606878936058;
        Tue, 01 Dec 2020 19:15:36 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id nm6sm148370pjb.25.2020.12.01.19.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 19:15:35 -0800 (PST)
Date:   Tue, 1 Dec 2020 19:15:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] ARM: sa11111: make sa1111 bus's remove callback return
 void
Message-ID: <20201202031532.GY2034289@dtor-ws>
References: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126114724.2028511-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 26, 2020 at 12:47:24PM +0100, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct device_driver::remove
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct sa1111_driver::remove return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and ensures future
> users behave accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  arch/arm/common/sa1111.c               | 6 +++---
>  arch/arm/include/asm/hardware/sa1111.h | 2 +-
>  drivers/input/serio/sa1111ps2.c        | 4 +---

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
