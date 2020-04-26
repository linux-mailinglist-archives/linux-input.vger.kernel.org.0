Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D80931B9225
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgDZRlA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:41:00 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:29302 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgDZRlA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:41:00 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499FZ24YmjzDY;
        Sun, 26 Apr 2020 19:40:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587922858; bh=JLGALo/UiOILtQBtpA+1RzP50dZmtkvUbk0MBxCAtU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ieiRqUv2js6Xx6/zbV8hMN8z+1T9FYsNDWeCarKZS1/Oh2yvV5RLnsSV1QgE2RUHM
         cDTbxCis/xvaoXbm0Ioxrw7hJ1B1hyMccty2yA8IxWS1qcIbtkx2AMrvGapHdHE6Ho
         dzEGoOYZ9pCoiGlU3UrHFw0AjBNJd+ukplwczjZEtfnKVcZKZcy+JjC+gez33gZ3jB
         okVb2isuyh31bZanGwX/fylOrAW/9902SQVaP+mfUUtp/dSnLXpspvSV+bf0QeZOTY
         qT0r/7GecdxJCaTKVfVgYakw1Q99n0fkpIAVq3WkjJIWuGQe/pMwb/6DQgSiKfsZSV
         GYX5vrlali/Lg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:40:57 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/10] input: elants: refactor
 elants_i2c_execute_command()
Message-ID: <20200426174057.GB15436@qmqm.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <4e5bf76e695388d6aeefa00552675c0617c044f1.1587916846.git.mirq-linux@rere.qmqm.pl>
 <127c4cf0-9bf0-60a4-bc48-28988ae24967@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <127c4cf0-9bf0-60a4-bc48-28988ae24967@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:24:14PM +0300, Dmitry Osipenko wrote:
> 26.04.2020 19:11, Michał Mirosław пишет:
> > Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
> > polling and error printk()s into a single function.
> > 
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > ---
> > v4: return 0 on success; use %pe for error code
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 189 +++++++++++++------------
> >  1 file changed, 96 insertions(+), 93 deletions(-)
> 
> This patch doesn't apply to the recent linux-next, it needs to be rebased.

I'm rebasing against for-linus brach at [1]. Will send v5 shortly.

[1] git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
