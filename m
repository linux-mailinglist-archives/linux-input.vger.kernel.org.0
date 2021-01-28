Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768443076C0
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 14:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhA1NH7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 08:07:59 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:33655 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231284AbhA1NH5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 08:07:57 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4DRLND3S02z4q;
        Thu, 28 Jan 2021 14:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1611839228; bh=0xxW99IQN70peuigl/c9Wrr8vbAlIIOgeRA3l897jPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nkosydFOSHjmOekVJP9qod+GyiHJqY+4eUmBcUq87A7MJnrY+ohZAyOrGbWR/0Guu
         9pJZJ87Fkkv3DQMVmxfK3GFyMJnnoQ7wuuVPksCYQywuz3N/AM5yeL3XinRJr9U8BX
         wf+hpXh5hroLOlxMmcbBgB6xI3lJ2fcaWVXe4QOZNcvWc1GlqfNUHp3sfR8oBdSM+y
         u5OSkDWOpk9tSzCBmKC4T24k5XDlCQc7PBQIV/+w3e2y7DrHxwnSE4gOl+RnJSPXSY
         RiN+PdQ/0ivcdxPmDsCgXBxKwYD54T9hSTPEyLbKNf92dfUNmuh//lOHwN84MLfgtZ
         gMaI2fhAIo9OA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Thu, 28 Jan 2021 14:07:05 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: elants_i2c - add support for eKTF3624
Message-ID: <20210128130705.GA32681@qmqm.qmqm.pl>
References: <YBKKePZ1VyZIbBCo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBKKePZ1VyZIbBCo@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 28, 2021 at 12:57:12PM +0300, Dan Carpenter wrote:
> Hello Micha³ Miros³aw,
> 
> The patch 9517b95bdc46: "Input: elants_i2c - add support for
> eKTF3624" from Jan 24, 2021, leads to the following static checker
> warning:
> 
> 	drivers/input/touchscreen/elants_i2c.c:966 elants_i2c_mt_event()
> 	warn: should this be a bitwise negate mask?
> 
> drivers/input/touchscreen/elants_i2c.c
[...]
>    963                                  w = buf[FW_POS_WIDTH + i / 2];
>    964                                  w >>= 4 * (~i & 1);
>    965                                  w |= w << 4;
>    966                                  w |= !w;
>                                         ^^^^^^^^
> 
> This code is just very puzzling.  I think it may actually be correct?
> The boring and conventional way to write this would be to do it like so:
> 
> 	if (!w)
> 		w = 1;

It could also be written as:

	w += !w;

or:
	w += w == 0;

while avoiding conditional.

But, in this case, the warning is bogus. Because w | ~w == all-ones (always),
it might as well suggested to write:

	w = -1;

or:
	w = ~0;

making the code broken.

Best Regards
Micha³ Miros³aw
