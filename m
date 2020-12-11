Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D302D7C48
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 18:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393735AbgLKRE4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 12:04:56 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:20319 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405405AbgLKREk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 12:04:40 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4Csxvf5KKwz4y;
        Fri, 11 Dec 2020 18:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1607706238; bh=/RTK8d7aFtrnlkxPSCm6jcCEYYZlXwcQe86IYM1xhmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMjrtunVKMsEs8j/7ClRuEuSSod/L91fPKYtNqIXMALWvY739Dz/85mTwkFEhmp+G
         g6XlW6GukJ4FzsGoj3IbQRmlpMSWJim/ziBVrWdMHmfOJPCLCCDABvr2kqAfoTOkA7
         iGd7YHI3tlDriJZ8Oxd0Y/qnEZQ6wk4Ajz8vM37gaJ2tvhSQzV8kHtc5MfG68qXbj3
         DS3+gM2Jm11P1hhg7O1/reY5iHM+Jj+STAOFHQ1FC0luayKWWDuoLVhk4nUSTdFSeP
         5Ugi1a2EruTu5Wx0ZSQ9Nh+Mal7lVk6iThV4o4Q9ns+aOz071fLJTGA21vBe+GqPUS
         oqRRN0XK2/KSA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Fri, 11 Dec 2020 18:04:01 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
Message-ID: <20201211170401.GA31605@qmqm.qmqm.pl>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com>
 <20201211160917.GA23095@qmqm.qmqm.pl>
 <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d872d19-a0b2-ed83-4b08-5c9a4755c2fe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 11, 2020 at 07:39:33PM +0300, Dmitry Osipenko wrote:
> 11.12.2020 19:09, Michał Mirosław пишет:
> > On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
> >> Hi Michał,
> >> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Michał Mirosław wrote:
> >>> @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
> >>>  			}
> >>>  
> >>>  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> >>> -			if (report_len != PACKET_SIZE) {
> >>> +			if (report_len != PACKET_SIZE &&
> >>> +			    report_len != PACKET_SIZE_OLD) {
> >>>  				dev_err(&client->dev,
> >>> -					"mismatching report length: %*ph\n",
> >>> +					"unsupported report length: %*ph\n",
> >>>  					HEADER_SIZE, ts->buf);
> >> Do I understand this correctly that the old packets are only observed on
> >> EKTF3624? If so can we expand the check so that we only accept packets
> >> with "old" size when we know we are dealing with this device?
> > 
> > We only have EKTF3624 and can't be sure there are no other chips needing this.
> 
> In practice this older packet format should be seen only on 3624, but
> nevertheless we could make it more explicit by adding the extra chip_id
> checks.
> 
> It won't be difficult to change it in the future if will be needed.
> 
> I think the main point that Dmitry Torokhov conveys here is that we
> should minimize the possible impact on the current EKT3500 code since we
> don't have definitive answers regarding the firmware differences among
> the hardware variants.

The only possible impact here is that older firmware instead of breaking
would suddenly work. Maybe we can accept such a risk?

Best Regards
Michał Mirosław
