Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7465D6F8A5C
	for <lists+linux-input@lfdr.de>; Fri,  5 May 2023 22:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbjEEUso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 May 2023 16:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233235AbjEEUsh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 May 2023 16:48:37 -0400
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDF12129
        for <linux-input@vger.kernel.org>; Fri,  5 May 2023 13:48:35 -0700 (PDT)
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4QCjSw5yFRz8h;
        Fri,  5 May 2023 22:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1683319712; bh=w8hbvGfo9YOrtJoZdeSyckpwA1GWtRM+410RHJEWnkQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YpJcXo8d6OjgGVK/WsLBISjSpeBzX14pQJwqytxLGGzUJ7rL5CH9CXSmOXtYBFVpz
         znHsOt/A4G1UUWQa6BIOhU14GEu/M1f6a047jGnU/MZotQBFjgy3ig1OfqWyqz9/VT
         uR33hy+R9Qv+08FYx6X1Cypg/3WIh2fwuNbR3skOa+HGW1WjYzcsM/Tw92OjeUTb7s
         m1vtpJsJDH9ZC60J5yjFqxMNgnmd6dFuaEpO6jFI3xe1QdKMzvGw8V8pVN6KqpS2aA
         oPPn0c7JIbntuthViHkRM1cC2CNOnrz75Q+FxCXtc6RnETDOjczuZhU+TMEh79DBQQ
         7Vp7SZOQGT0Hw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.8 at mail
Date:   Fri, 5 May 2023 22:48:31 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4: Use %pe for error codes.
Message-ID: <ZFVrn7za8sFALhvz@qmqm.qmqm.pl>
References: <1ec25bf991f576a98bd8fdc58264a92ee268eba9.1682793592.git.mirq-linux@rere.qmqm.pl>
 <ZFBcF0ZcBfMFdZLu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZFBcF0ZcBfMFdZLu@google.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 01, 2023 at 05:40:55PM -0700, Dmitry Torokhov wrote:
> On Sat, Apr 29, 2023 at 08:41:19PM +0200, Micha³ Miros³aw wrote:
> > Make the error messages a bit easier to understand by showing
> > error names where that's enabled.
> > 
> > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/input/rmi4/rmi_driver.c | 66 +++++++++++++++++----------------
> >  1 file changed, 34 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> > index 258d5fe3d395..82d85c02a873 100644
> > --- a/drivers/input/rmi4/rmi_driver.c
> > +++ b/drivers/input/rmi4/rmi_driver.c
> > @@ -69,8 +69,8 @@ static int reset_one_function(struct rmi_function *fn)
> >  	if (fh->reset) {
> >  		retval = fh->reset(fn);
> >  		if (retval < 0)
> > -			dev_err(&fn->dev, "Reset failed with code %d.\n",
> > -				retval);
> > +			dev_err(&fn->dev, "Reset failed: %pe\n",
> > +				ERR_PTR(retval));
> 
> If this is desired we should have a format option for
> non-err-ptr-encoded errors.

This is a common case in the kernel source to use "%pe" with ERR_PTR().

The code in `lib/vsprintf.c` has only '%p' with extended treatment and
I'm not sure how much work would be needed to extend other format
specifier (I would consider confusing if "%p" would possibly take
something that's not a pointer).

Best Regards
Micha³ Miros³aw
