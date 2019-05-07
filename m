Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA3F716D20
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 23:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbfEGVZL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 17:25:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41309 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfEGVZL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 17:25:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id l132so4353826pfc.8
        for <linux-input@vger.kernel.org>; Tue, 07 May 2019 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HPav3oxvW0pcDQ4h4Pi5qILkFEAYr7XUO407O8z855k=;
        b=tnqdV7RGW4muqIbEmDA9gh4L/vsRmxgLvNRXU4mJVJBWp7JDVFA2UqtPNIL5tniDlQ
         dJ+RknDde4O0UwJxysMqAP9t033KnEemBx86/oDyUGWun5dggCJ7BOjL3iAbYjiLzhEl
         rw31lQ5J5kXZLjgV2mMee5bnOdFW2GiPR8IrefSZcW9EzbJZR9o82M1fOiIGGryRUXBK
         w+IGUdCz/zdL3a5ms+ESUIe/1a9mPdr3ZE97sKi4f3DAtbgptnDQ/Jme4mmMv6ZUYexE
         0UEhlxSN6p8VLvgTQFBKcw+ZxaO1ooVvnUp6z4jR2TNUkI1ciSjXobvhfVedMQ2gfs61
         84VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HPav3oxvW0pcDQ4h4Pi5qILkFEAYr7XUO407O8z855k=;
        b=Go/fBGHQCqOAU3Bl7wp7rr/3iZlNusEru/4lfAy494ghcAokvkdenp5Cg02ADv3MGb
         6XnBkLZgwyUgjHoKkwPAIJp9rj34RrE7+AaU+PFhrPJ9vDJ/apoPQvr0YHVafaig3Nbn
         PqXPT/Z8kNGnxiwHLSbZJP0/hqACqVoanOrvSkVnljM7LEzX6gaA3+gPduiR+GhJgpXa
         ywGBo1g6M5PNnFQ+WF9P9p2GKf3hRgg/nQtM7mH2Wqdk/rRAqURjv9OLwz7vkUi5XtMR
         mdnM0JWLygGrUQOP9pcUIhtiorrXvJW6W4k95+Z+uDr7+HTcumc4HdFMLzcvwQn74Izr
         24cQ==
X-Gm-Message-State: APjAAAUa+mo9KEPYgufOXHQxyrB9PbPnikImh7GtDYUoYpECB0e3MGwp
        HkEorKwrFSb7wgIaP8jhSlI=
X-Google-Smtp-Source: APXvYqymGoVA/2SdO9O8aczoSjZuIpD7GXm0k90AyJ+1JTyHqeFN4brjRC4Pkks2MnotWnayq373Bg==
X-Received: by 2002:a62:a503:: with SMTP id v3mr44257494pfm.32.1557264310334;
        Tue, 07 May 2019 14:25:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q10sm17506237pgh.93.2019.05.07.14.25.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 14:25:09 -0700 (PDT)
Date:   Tue, 7 May 2019 14:25:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: qt1050: fix error check during identify the chip
Message-ID: <20190507212508.GB248929@dtor-ws>
References: <20190507084018.32009-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507084018.32009-1-m.felsch@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On Tue, May 07, 2019 at 10:40:18AM +0200, Marco Felsch wrote:
> The regmap_read return value must be checked decide if the read was
> successful or not and not the read value.
> 
> Fixes: a33ff45923c8 ("Input: qt1050 - add Microchip AT42QT1050 support")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi Dmitry,
> 
> there was a issue which was covered by Colin Ian King. Can you add this
> fix please? Maybe you can squash the fix.

I ended up squashing the fix into the original change, thank you.

-- 
Dmitry
