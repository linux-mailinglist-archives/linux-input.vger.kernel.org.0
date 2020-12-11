Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FCF2D7B1B
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 17:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgLKQjF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 11:39:05 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:55951 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgLKQim (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 11:38:42 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CsxKh6N6Yz4y;
        Fri, 11 Dec 2020 17:38:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1607704680; bh=wlzJNkez6J2t9nu5m8NwLeYJOsOC0Tc9BcqWs937qi0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xk19hsbOjTCz+ctO0H6kL/b0C9dOzMO4AViv7NBzTOx+GWKQt38MeR9m8lByUdyL5
         46rlyc/eLS6ORO13YH8RA2IolJH6ZsDHz0cVHUZQGsv40TNgt71Kze+0wgorcjd+Ti
         FjQ1PE71LpP1KuqFPadSW13Aw/K3l4vCfyh9xejmKX39AN5XPzmHogdZPjfqV8ulNE
         ypjlqI1Ma6t7Rh9MBVnqVnLpRGN2d+yenqj7DpNSRdFo8GURW5XdwmqKt3xdIcYjKp
         zAGepEQyfhe9lcyuRYWsUHBCU67xbOkfSt65ZbIcy3lm4Kiab+lLVNjty1JUY4Q8R7
         9PsukAsIQ/1Fg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Fri, 11 Dec 2020 17:38:01 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 3/4] input: elants: read touchscreen size for
 EKTF3624
Message-ID: <20201211163801.GB23095@qmqm.qmqm.pl>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <fa6a0e3f95803d6eab39cd0e3ba188842274a1e0.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9MeISZqBcvcnYXe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X9MeISZqBcvcnYXe@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 10, 2020 at 11:22:09PM -0800, Dmitry Torokhov wrote:
> Hi Micha³,
> 
> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Micha³ Miros³aw wrote:
> > +
> > +	if (!phy_x || !phy_y) {
> > +		dev_warn(&client->dev,
> > +			 "invalid size data: %d x %d mm\n",
> > +			 phy_x, phy_y);
> > +		return 0;
> 
> Given we are not treating this as hard error mind dropping this "return"
> and making the below an "else" branch?

It is an error, still, and saves a bit of indentation in the following
normal-path code. But I see that there is already a similar code with
an 'else' branch.

Best Regards,
Micha³ Miros³aw
