Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFB8911A304
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 04:28:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfLKD2U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 22:28:20 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:42690 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbfLKD2U (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 22:28:20 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47Xj7P5Znzz5F;
        Wed, 11 Dec 2019 04:28:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1576034898; bh=xI0Y3WrLAljdX3uXRnsJYHw0mplOHki0zWGafXQjuUQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kdOLkCGfKtu7PK3JynMC7F1MrhHiZorsIEUonBvN7xTNjcC2V7LiD0gt0IUgmiJ1m
         aDkLQFMZgC7OgUw6Wh4ImKHFUNFlxt9dEk+NdyAv1pbXMPocllIqaAbD3gfRdMeP5b
         v87GizYHLTs3AjuuIkIouPqI9VYWhW9y9ahbEEKMk3usIAJV3prKoy9BptMFXhTt+Y
         PhQsCqnPQh/mk3LZxehTtYSxKnlQQBpJJtjuo9XMD6Pf0cbmWIdSDkZ+VfAvJNErtQ
         HAazYbzQD8uyaL9zO0h4AXGK8stZNvZGUDH29A/efR63MjeCrSA6w4s7Q7jpdGHAXd
         kksrljeUkuIVQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Wed, 11 Dec 2019 04:28:13 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] input: elants: support common touchscreen DT
 properties
Message-ID: <20191211032813.GA17731@qmqm.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
 <7e650a6ef98e3178d6829c3c2c83f21437070d84.1575936961.git.mirq-linux@rere.qmqm.pl>
 <17bb20b8-a62c-828f-d329-cd3aa89c1c06@gmail.com>
 <20191210023818.GB15246@qmqm.qmqm.pl>
 <2c9cd83c-518f-2f22-c3e7-ac629a181b8d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c9cd83c-518f-2f22-c3e7-ac629a181b8d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 10, 2019 at 06:21:02PM +0300, Dmitry Osipenko wrote:
> 10.12.2019 05:38, Michał Mirosław пишет:
> > On Tue, Dec 10, 2019 at 04:03:18AM +0300, Dmitry Osipenko wrote:
> >> 10.12.2019 03:19, Michał Mirosław пишет:
> >>> Support common DT properties like axis inversions to complement
> >>> information obtained from device's firmware.a
> > [...]
> >>> @@ -1251,13 +1250,15 @@ static int elants_i2c_probe(struct i2c_client *client,
> >>>  	ts->input->name = "Elan Touchscreen";
> >>>  	ts->input->id.bustype = BUS_I2C;
> >>>  
> >>> +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> >>
> >> Shouldn't this function be invoked after setting the max x/y sizes with
> >> the hardware values? That's what all other drivers do and then you won't
> >> need to set the ts->prop.max_x/y above in the code.
> > 
> > This is done later in the series - this patch only adds axis inversion
> > support and ignores DT-provided sizes.
> 
> What is the reason of splitting it into two patches?
> 
> Perhaps I'm still missing something, but why something a bit more simple
> like this wouldn't yield exactly the same result:
[...]

Originally I thought to skip probing the hardware when all info is
already provided in devicetree. This didn't happen, though. I'll take
your patch then, with a slight adjustment in "prop"'s position... And
the rest of them, so as to not duplicate the work. :-)

Best Regards,
Michał Mirosław
