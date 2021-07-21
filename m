Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17D63D160E
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 20:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhGURjK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 13:39:10 -0400
Received: from outgoing-yousee-4.gl-mut-gbl.as8677.net ([193.201.76.64]:6221
        "EHLO outgoing-yousee-4.gl-mut-gbl.as8677.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231444AbhGURi6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 13:38:58 -0400
X-Greylist: delayed 584 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Jul 2021 13:38:57 EDT
Received: from filter.yousee.as8677.net (localhost [127.0.0.1])
        by mwumf0306.yousee.as8677.net (SMTP Server) with ESMTP id 4GVNs76wqRz6mp
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 20:09:47 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVNs76Zf4z6dD","contextId":"c78503c1-13b2-4373-8271-7065cdeccbfc"}
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=webspeed.dk; s=sela;
 t=1626890987; h=Subject:From:To:Cc:Date:In-Reply-To:References; bh=44jLV8yKKi
  9Ijr3x4F/2pWugB6bvseCPwHxkR+bcR78=; b=A6pVfHLLzt5t6MLqJOJkgT0kvBruPMWaq9onry
  C82rFzSaScWQlNIN18+2meRJusdqrnxqZfjJwhMRGH26IoemRm5H+qQ5s51MvzusjnTa9wwAQiGr
  m0m3Lz8cz96F+GG+NlgL+3PCPJ1nwtMzDa4K82URmHav0mJvlpEcWszBdmW54PABR1skDCAJ95bu
  8LXrO5U1AWu/ZWZGIVcTM+FAzJt8203eyfvh7NGfwCMNrQZMCHmEHj5tFnsp05+x/1q0A+QI1k6Y
  C6drTZCmq4vHRJF1/2NYGZDhFDHj9AQ6Wng6a0M4J8nLLiiFHe7qbus7bRcJAVLDQzpoa1AJZmXw
  ==
Received: from outgoing-yousee-4.gl-mut-gbl.as8677.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mwumf0306.yousee.as8677.net (SMTP Server) with ESMTPS id 4GVNs76Zf4z6dD
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 20:09:47 +0200 (CEST)
X-mail-filterd: {"version":"1.2.1","queueID":"4GVNs74rTBz4q5","contextId":"29bdd10e-d0c5-4665-9225-6b693f4bc4bb"}
X-yse-mailing: LEGIT
X-yse-spamrating: 36
X-yse-spam: not-spam
X-yse-spamcause: OK, (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvfffvedpggftfgfpufgfuefuveftkfeugfdpqfgfvfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepjfgrnhhsucfutghhuhhlthiiuceohhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkqeenucggtffrrghtthgvrhhnpeeuhfduueduueevffeuueeiffehieehteeuffeutdegheefgeeuteffgfeigffhhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrddutdegrdduudeirddukeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplgduledvrdduieekrddurddvfeegngdpihhnvghtpedvrddutdegrdduudeirddukeegpdhmrghilhhfrhhomhephhgrnhhsrdhstghhuhhlthiiseifvggsshhpvggvugdrughkpdhrtghpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Received: from [192.168.1.234] (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hans.schultz@webspeed.dk)
        by mwumf0306.yousee.as8677.net (SMTP Server) with ESMTPSA id 4GVNs74rTBz4q5;
        Wed, 21 Jul 2021 20:09:47 +0200 (CEST)
Authentication-Results: yousee.as8677.net; auth=pass (PLAIN) smtp.auth=hans.schultz@webspeed.dk
Message-ID: <c727d6900e2af325b9e91b9f2d0adc8677cd8eea.camel@webspeed.dk>
Subject: Re: Elantech touchpad not working on mainline kernels
From:   Hans Schultz <hans.schultz@webspeed.dk>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Date:   Wed, 21 Jul 2021 20:07:59 +0200
In-Reply-To: <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
References: <f35f6472fddcf552076f40190f8f1d74888d0b4a.camel@webspeed.dk>
         <CAKdAkRRe0GkdOEQhb7WV6CtOw_1D0bbxCcDKadivc+uQrAvBhw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2021-07-21 at 10:48 -0700, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Sun, May 30, 2021 at 2:12 AM Hans Schultz <
> hans.schultz@webspeed.dk> wrote:
> > 
> > Hello,
> > I have a problem getting my Elantech touchpad to work with the
> > mainline
> > kernels, and I need some assistance with the code to resolve the
> > problem.
> > The kernels that have tried are 5.9.11 and 5.11.11.
> > 
> > With boot parameters i8042.notimeout i8042.nomux, the touchpad is
> > detected but does not work. There is absolutely no response from it
> > with any hid modules loaded.
> > 
> > It is reported and seen working on a Lubuntu distro (bionic kernel)
> > when inserting the i2c_hid module. The insertion of the i2c_hid
> > module
> > pulls in the hid_multitouch module when it works, no boot parameters
> > necessary.
> > In the case where it does not work, insering the i2c_hid module does
> > not pull in the hid_multitouch module.
> > 
> > I have the bionic kernel code, but I have not as of yet been able to
> > detect what makes it work in contrast to the kernel.org kernels.
> > 
> > This I think should lead to a kernel patch.
> 
> There is not much to go on with. What is the hardware, your kernel
> .config, dmesg from unsuccessful boot? If you have logs from the
> working kernel that would help too.
> 
> Thanks.
> 

The best info I have on the hardware is from Xorg log with the working
Lubuntu kernel:
[ 130.980] (II) Loading /usr/lib/xorg/modules/input/synaptics_drv.so
[ 130.982] (II) Module synaptics: vendor="X.Org Foundation"
[ 130.982] (II) Using input driver 'synaptics' for '0X45 0X4C 0X41 0:00
04F3:308C Touchpad'

I might be able to get the kernel messages when inserting the working
module, but I think it will not tell much more.
To me it is clearly a code issue as the working kernel pulls in
hid_multitouch when inserting i2c_hid, while the non-working does not.

All kernels I have tried up to now from kernel.org do not work. The
latest being 5.13.4.
