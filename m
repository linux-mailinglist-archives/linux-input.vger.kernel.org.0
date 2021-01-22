Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F0C301045
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 23:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbhAVWq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 17:46:58 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:36765 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728047AbhAVWqC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 17:46:02 -0500
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Jan 2021 17:45:58 EST
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4DMvK04gZNz67;
        Fri, 22 Jan 2021 23:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1611355044; bh=jBEHC8YwgXFlj7D2xiylOBOLQweQ/xz01AF0u5HJYgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sOnJMs7aWGVRqB43r7lK7L+xxGHSI0L4Azh1+laK91AAUZ4W3ntHePfjxKPQ3qSKv
         9brAZZ39Q5L7HFO//yEtamPkPZr9UFvP27QUPSqrhowRjyWg1JAxdMPzWa2x7/O0bB
         z1YO7nHf/Pj3woUjbrpD0ISvCpEN4Xk7vlGCqfFVRpo8Kz/saSiHlcM1mswfAR3iiz
         w4Tuz0kqGlKZMZuKLl2k3WmikWmdM5B9InjrST5guVsUKEpWMTY0af8IRhc91Ku9Fh
         SygDQCc2uLbnrFpADj4Dxa18mKSIHzVIf/aSWelnoIqLrwXdwZOB8DcQbhOVKZlXcg
         4FgbkQbYk0Dfw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Fri, 22 Jan 2021 23:37:18 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
Message-ID: <20210122223718.GE17048@qmqm.qmqm.pl>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com>
 <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
 <20201211170401.GA31605@qmqm.qmqm.pl>
 <X9O/F0M4rU6cBdRi@google.com>
 <79cf6571-4239-e98e-6001-70a4bf8b0fe5@gmail.com>
 <4c443c59-a7f8-bf16-cc0b-0e542c0d127f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c443c59-a7f8-bf16-cc0b-0e542c0d127f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 22, 2021 at 11:10:52PM +0300, Dmitry Osipenko wrote:
> 08.01.2021 01:06, Dmitry Osipenko пишет:
> > 11.12.2020 21:48, Dmitry Torokhov пишет:
> >> On Fri, Dec 11, 2020 at 06:04:01PM +0100, Michał Mirosław wrote:
> >>> On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
> >>>> 11.12.2020 19:09, Michał Mirosław пишет:
> >>>>> On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
> >>>>>> Hi Michał,
> >>>>>> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> >>>>>>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
> >>>>>>>  			}
> >>>>>>>  
> >>>>>>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> >>>>>>> -			if (report_len != PACKET_SIZE) {
> >>>>>>> +			if (report_len != PACKET_SIZE &&
> >>>>>>> +			    report_len != PACKET_SIZE_OLD) {
> >>>>>>>  				dev_err(&client->dev,
> >>>>>>> -					"mismatching report length: %*ph\n",
> >>>>>>> +					"unsupported report length: %*ph\n",
> >>>>>>>  					HEADER_SIZE, ts->buf);
> >>>>>> Do I understand this correctly that the old packets are only observed on
> >>>>>> EKTF3624? If so can we expand the check so that we only accept packets
> >>>>>> with "old" size when we know we are dealing with this device?
> >>>>>
> >>>>> We only have EKTF3624 and can't be sure there are no other chips needing this.
> >>>>
> >>>> In practice this older packet format should be seen only on 3624, but
> >>>> nevertheless we could make it more explicit by adding the extra chip_id
> >>>> checks.
> >>>>
> >>>> It won't be difficult to change it in the future if will be needed.
> >>>>
> >>>> I think the main point that Dmitry Torokhov conveys here is that we
> >>>> should minimize the possible impact on the current EKT3500 code since we
> >>>> don't have definitive answers regarding the firmware differences among
> >>>> the hardware variants.
> >>>
> >>> The only possible impact here is that older firmware instead of breaking
> >>> would suddenly work. Maybe we can accept such a risk?
> >>
> >> These are not controllers we'll randomly find in devices: Windows boxes
> >> use I2C HID, Chrome devices use "new" firmware, so that leaves random
> >> ARM where someone needs to consciously add proper compatible before the
> >> driver will engage with the controller.
> >>
> >> I would prefer we were conservative and not accept potentially invalid
> >> data.
> >>
> >> Thanks.
> >>
> > 
> > Michał, will you be able to make v9 with all the review comments addressed?
> > 
> 
> I'll make a v9 over this weekend.
> 
> Michał, please let me know if you already started to work on this or
> have any objections.

Hi,

Sorry for staying quiet so long. I have to revive my Transformer before
I can test anything, so please go ahead.

Best Regards
Michał Mirosław
