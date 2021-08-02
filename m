Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6812C3DDFA9
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 20:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhHBS5y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 14:57:54 -0400
Received: from smtprelay0169.hostedemail.com ([216.40.44.169]:35556 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229537AbhHBS5x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 14:57:53 -0400
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 354C4100E7B4F;
        Mon,  2 Aug 2021 18:57:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id D5FED27DD11;
        Mon,  2 Aug 2021 18:57:41 +0000 (UTC)
Message-ID: <30984a540fb8e340c12e52054cdf7d6478b8b960.camel@perches.com>
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Len Baker <len.baker@gmx.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 02 Aug 2021 11:57:40 -0700
In-Reply-To: <202108020912.3807510B4B@keescook>
References: <20210801144316.12841-1-len.baker@gmx.com>
         <20210801145959.GI22278@shell.armlinux.org.uk>
         <922b0d99b6397adc44761abaed12c019dc0b9e88.camel@perches.com>
         <4962ac72a94bc5826960dab855b5e2f47a4d1b9a.camel@perches.com>
         <202108020912.3807510B4B@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.60
X-Stat-Signature: ighkxrxg33quaz6kqpd9gm8ujq9abaoq
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D5FED27DD11
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+MGQoRjSeQ40Zmc0KA7pV/cp/fRUrdq5c=
X-HE-Tag: 1627930661-732664
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2021-08-02 at 09:13 -0700, Kees Cook wrote:
> I'm wondering, instead, if we could convert strcpy() into this instead
> of adding another API? I.e. convert all the places that warn (if this
> were strcpy), and then land the conversion.

Perhaps not as strcpy is a builtin.

It might be easier as a cocci script.  Something like:

@@
char [] dest;
constant char [] src;
@@

*	strcpy(dest, src)

There are some additional test that needs to be added so that
only length(src) > length(dest) is reported.

