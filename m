Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209B43DCCC0
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 18:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhHAQsT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 12:48:19 -0400
Received: from smtprelay0057.hostedemail.com ([216.40.44.57]:33324 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229575AbhHAQsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 1 Aug 2021 12:48:19 -0400
X-Greylist: delayed 534 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Aug 2021 12:48:19 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 365931813B4C1
        for <linux-input@vger.kernel.org>; Sun,  1 Aug 2021 16:39:18 +0000 (UTC)
Received: from omf18.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 91D7E100E7B45;
        Sun,  1 Aug 2021 16:39:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf18.hostedemail.com (Postfix) with ESMTPA id 21D1F2EBFA0;
        Sun,  1 Aug 2021 16:39:13 +0000 (UTC)
Message-ID: <922b0d99b6397adc44761abaed12c019dc0b9e88.camel@perches.com>
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
From:   Joe Perches <joe@perches.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Len Baker <len.baker@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Sun, 01 Aug 2021 09:39:11 -0700
In-Reply-To: <20210801145959.GI22278@shell.armlinux.org.uk>
References: <20210801144316.12841-1-len.baker@gmx.com>
         <20210801145959.GI22278@shell.armlinux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.46
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 21D1F2EBFA0
X-Stat-Signature: 3zsg9f1oosgq9iyxgipc88yjqiuu7997
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/uvB/xVXZpL4hqBJoKLjxFDsi/SPgzh/k=
X-HE-Tag: 1627835953-921460
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2021-08-01 at 16:00 +0100, Russell King (Oracle) wrote:
> On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy().
> > 
> > Signed-off-by: Len Baker <len.baker@gmx.com>
> > ---
> > This is a task of the KSPP [1]
> > 
> > [1] https://github.com/KSPP/linux/issues/88
> > 
> >  drivers/input/keyboard/locomokbd.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
> > index dae053596572..dbb3dc48df12 100644
> > --- a/drivers/input/keyboard/locomokbd.c
> > +++ b/drivers/input/keyboard/locomokbd.c
> > @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
> >  	locomokbd->suspend_jiffies = jiffies;
> > 
> >  	locomokbd->input = input_dev;
> > -	strcpy(locomokbd->phys, "locomokbd/input0");
> > +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));
> 
> So if the string doesn't fit, it's fine to silently truncate it?
> 
> Rather than converting every single strcpy() in the kernel to
> strscpy(), maybe there should be some consideration given to how the
> issue of a strcpy() that overflows the buffer should be handled.
> E.g. in the case of a known string such as the above, if it's longer
> than the destination, should we find a way to make the compiler issue
> a warning at compile time?
> 


