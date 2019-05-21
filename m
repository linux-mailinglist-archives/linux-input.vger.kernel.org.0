Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED4E24786
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 07:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbfEUFav (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 01:30:51 -0400
Received: from mail-it1-f178.google.com ([209.85.166.178]:39447 "EHLO
        mail-it1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbfEUFav (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 01:30:51 -0400
Received: by mail-it1-f178.google.com with SMTP id 9so2743070itf.4;
        Mon, 20 May 2019 22:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8qN0twdFcwXuepzLmJZnPlQPdwe8pV/UL2Zay+CiZEw=;
        b=KInkiCDFWuYqXHPIDcw89Bqsu1qxHPFy0Ke9vwbcjv0yIpwnhei08uqTk+c1S26RHs
         0wJBAt7cmZz5bO/4Hie52tA5ikSCxvJ1jHjjUMGNuWuDUTnkRE//rkLI47Qzxers6ozt
         P9jXOxiLTXavrK+kpnRszjdkJY/eA2m1PM9l1sVGHtRhHeHc9y6V6O4xDEPigQKsTSXs
         dCXTYy78q0EZp8FOLwbd3NaushImT1RR3cU0PB86wzU3xNlAb27HbEKn9KD7CikA42VI
         yrmd0nLS9xWbmoyfPPCq+xFa6Fu1IM19OPkDZEs3uAIvR6sf3rrUDp6iDwCCMAFHPOE0
         UTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8qN0twdFcwXuepzLmJZnPlQPdwe8pV/UL2Zay+CiZEw=;
        b=JuLXqKxQZSrkdQrWI5iARP6B8hCW2Lw9SkOP9GeGn19/ms+4asmSw0ZfYnsEu7QFld
         pbUIF+4SDlIVrsOIJEvd0I0SBN6VMiAV9CJhmTmiX4xBbOOaX80/zJigwuEdrAmNpPjw
         gNpjT+iFpy52AY5l52Lo7p47S0J9Sfboj5u0Hcfk9dC9EGYBaUxikw3F5/i4RTfjKCtX
         j5/LnnlioaHBZg9S1KkgDaLJYkqbYwB2zYmfPJ1r+V22UaOmq3/i9cITX3SyP5Zyp4Dt
         MGYEWTAE3lV2M51Jw7vzJsGTPkp59nl1xAz1nL83EIHd8nkfyNtRHGn5u0bOEIwPtOEt
         Ho9w==
X-Gm-Message-State: APjAAAUH3W0RQFGs8lqVA1WxzF2iX19Mk5n6+QtBKnDVaHnbzzaO+iH3
        Gvh7G4jNySvPORvClgzpn+g=
X-Google-Smtp-Source: APXvYqwuIWQFVA9y0u/gRe18vPIYmGs1HAuZAsz6ATsaeQ0fOvJWojiW3Q1JE8LlXwqX/9UZaYFbsA==
X-Received: by 2002:a24:618f:: with SMTP id s137mr2331223itc.134.1558416650374;
        Mon, 20 May 2019 22:30:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w132sm861310itb.30.2019.05.20.22.30.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 22:30:49 -0700 (PDT)
Date:   Mon, 20 May 2019 22:30:47 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [RESEND] input: keyboard: imx: make sure keyboard can always
 wake up system
Message-ID: <20190521053047.GG183429@dtor-ws>
References: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Anson,
On Thu, Apr 04, 2019 at 01:40:16AM +0000, Anson Huang wrote:
> There are several scenarios that keyboard can NOT wake up system
> from suspend, e.g., if a keyboard is depressed between system
> device suspend phase and device noirq suspend phase, the keyboard
> ISR will be called and both keyboard depress and release interrupts
> will be disabled, then keyboard will no longer be able to wake up
> system. Another scenario would be, if a keyboard is kept depressed,
> and then system goes into suspend, the expected behavior would be
> when keyboard is released, system will be waked up, but current
> implementation can NOT achieve that, because both depress and release
> interrupts are disabled in ISR, and the event check is still in
> progress.
> 
> To fix these issues, need to make sure keyboard's depress or release
> interrupt is enabled after noirq device suspend phase, this patch
> moves the suspend/resume callback to noirq suspend/resume phase, and
> enable the corresponding interrupt according to current keyboard status.

I believe it is possible for IRQ to be disabled and still  being enabled
as wakeup source. What happens if you call disable_irq() before
disabling the clock?

Thanks.

-- 
Dmitry
