Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14893DCCC4
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 18:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhHAQzl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 12:55:41 -0400
Received: from smtprelay0078.hostedemail.com ([216.40.44.78]:42006 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229646AbhHAQzl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 1 Aug 2021 12:55:41 -0400
Received: from omf01.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id B1D1F180210D1;
        Sun,  1 Aug 2021 16:55:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id 57CFE17275;
        Sun,  1 Aug 2021 16:55:30 +0000 (UTC)
Message-ID: <4962ac72a94bc5826960dab855b5e2f47a4d1b9a.camel@perches.com>
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
Date:   Sun, 01 Aug 2021 09:55:28 -0700
In-Reply-To: <922b0d99b6397adc44761abaed12c019dc0b9e88.camel@perches.com>
References: <20210801144316.12841-1-len.baker@gmx.com>
         <20210801145959.GI22278@shell.armlinux.org.uk>
         <922b0d99b6397adc44761abaed12c019dc0b9e88.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 57CFE17275
X-Spam-Status: No, score=-1.29
X-Stat-Signature: 343965z1p64ouzhaqchggbnj5ymsxi3k
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19SCwlsX+nYsG+afP45pp+eXwmzf+OErF4=
X-HE-Tag: 1627836930-174082
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2021-08-01 at 09:39 -0700, Joe Perches wrote:
> On Sun, 2021-08-01 at 16:00 +0100, Russell King (Oracle) wrote:
> > On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> > > strcpy() performs no bounds checking on the destination buffer. This
> > > could result in linear overflows beyond the end of the buffer, leading
> > > to all kinds of misbehaviors. The safe replacement is strscpy().
[]
> > So if the string doesn't fit, it's fine to silently truncate it?
> > 
> > Rather than converting every single strcpy() in the kernel to
> > strscpy(), maybe there should be some consideration given to how the
> > issue of a strcpy() that overflows the buffer should be handled.
> > E.g. in the case of a known string such as the above, if it's longer
> > than the destination, should we find a way to make the compiler issue
> > a warning at compile time?

(apologies for the earlier blank reply, sometimes I dislike my email client)

stracpy could do that with a trivial addition like below:

Old lkml references:

https://lore.kernel.org/lkml/cover.1563889130.git.joe@perches.com/
and
https://lore.kernel.org/lkml/56dc4de7e0db153cb10954ac251cb6c27c33da4a.camel@perches.com/

But Linus T wants a copy_string mechanism instead:
https://lore.kernel.org/lkml/CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com/

/**
 * stracpy - Copy a C-string into an array of char/u8/s8 or equivalent
 * @dest: Where to copy the string, must be an array of char and not a pointer
 * @src: String to copy, may be a pointer or const char array
 *
 * Helper for strscpy().
 * Copies a maximum of sizeof(@dest) bytes of @src with %NUL termination.
 *
 * A BUILD_BUG_ON is used for cases where @dest is not a char array or
 * @src is a char array and is larger than @dest.
 *
 * Returns:
 * * The number of characters copied (not including the trailing %NUL)
 * * -E2BIG if @dest is a zero size array or @src was truncated.
 */
#define stracpy(dest, src)						\
({									\
	BUILD_BUG_ON(!(__same_type(dest, char[]) ||			\
		       __same_type(dest, unsigned char[]) ||		\
		       __same_type(dest, signed char[])));		\
	BUILD_BUG_ON((__same_type(src, char[]) ||			\
		      __same_type(src, unsigned char[]) ||		\
		      __same_type(src, signed char[])) &&		\
		     ARRAY_SIZE(src) > ARRAY_SIZE(dest));		\
									\
	strscpy(dest, src, ARRAY_SIZE(dest));				\
})


