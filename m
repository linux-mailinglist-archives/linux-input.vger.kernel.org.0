Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152142D7A90
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 17:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404272AbgLKQKR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 11:10:17 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:25199 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404259AbgLKQJ4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 11:09:56 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CswhV34YMz4y;
        Fri, 11 Dec 2020 17:09:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1607702954; bh=JA0EdqTBGYeoKbAC0O4t5RZsbxp09DvSH5E83admmgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FB+54ThX+KIVulK3J+dtBnWEhUPjaXdPSuk1c/MkLuQDlQr2D7Sd0LGWJU2JnVlUA
         1Rsxkbrd9ekWRbnEonutMh0b6M2YIOr6vdXuCf4/NT9SGyB/aFay3PCnBnrh5/j8BB
         vi4a0l7G2k1/97LeteE3vfB467CvVvg6q+C54mFUg3UFp6w3XAQUNIxeQCJDcm0EW4
         gVCMNC85wwuH/rfFDmSxrTtd4NNv1azHyCqWAaBTvMRvTAKMxkBbsbq8KEhQK0wMz1
         JhtE/7xjG23Lw4OsVTLDXUzZ3mDLvg1TLqIrwA1zXTI5hY28gK3v15YfTeseLlM5HY
         pviz4QCIjaN5g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Fri, 11 Dec 2020 17:09:17 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v8 2/4] input: elants: support old touch report
 format
Message-ID: <20201211160917.GA23095@qmqm.qmqm.pl>
References: <cover.1607669375.git.mirq-linux@rere.qmqm.pl>
 <a5c0b6b300fadf9425781285351b46c6dbb4f618.1607669375.git.mirq-linux@rere.qmqm.pl>
 <X9Mf5G6yvIEAoh2C@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X9Mf5G6yvIEAoh2C@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 10, 2020 at 11:29:40PM -0800, Dmitry Torokhov wrote:
> Hi Micha³,
> On Fri, Dec 11, 2020 at 07:53:56AM +0100, Micha³ Miros³aw wrote:
> > @@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
> >  			}
> >  
> >  			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
> > -			if (report_len != PACKET_SIZE) {
> > +			if (report_len != PACKET_SIZE &&
> > +			    report_len != PACKET_SIZE_OLD) {
> >  				dev_err(&client->dev,
> > -					"mismatching report length: %*ph\n",
> > +					"unsupported report length: %*ph\n",
> >  					HEADER_SIZE, ts->buf);
> Do I understand this correctly that the old packets are only observed on
> EKTF3624? If so can we expand the check so that we only accept packets
> with "old" size when we know we are dealing with this device?

We only have EKTF3624 and can't be sure there are no other chips needing this.

Best Regards
Micha³ Miros³aw
