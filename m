Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B8DC46FF
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 07:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfJBFco (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 01:32:44 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:60034 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbfJBFco (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Oct 2019 01:32:44 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 5B75DA211B;
        Wed,  2 Oct 2019 07:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1569994362;
        bh=5AcZEITR50EqYwQF+Thz3U0N2SH4PgzQ+ow4rmj91Wg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lsWbrPuLkR+N3vdIIaYAxfZVN32AeZZgTP8UbRtHXtoBUrJgnFuYMEy2S9OUTso8T
         1z4bXsDQH6i4vGDDSf7ezji3fpLHRJtCjO4fOXpEYRDdFnBj6poSxwYp8A+Tws6ygP
         hQoYmypLsF0vX47CW19QH+//T2ypw15vsac5cLuo=
Subject: Re: [PATCH] input: touchscreen: imx6ul_tsc: Use 'dev' instead of
 dereferencing it repeatedly
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, swboyd@chromium.org, mojha@codeaurora.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
References: <1569315731-2387-1-git-send-email-Anson.Huang@nxp.com>
 <20190930230806.GX237523@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <c0773e65-fc14-8cad-06a3-861bd264a44c@ysoft.com>
Date:   Wed, 2 Oct 2019 07:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930230806.GX237523@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01. 10. 19 1:08, Dmitry Torokhov wrote:
> On Tue, Sep 24, 2019 at 05:02:11PM +0800, Anson Huang wrote:
>> Add helper variable dev = &pdev->dev to simply the code.
> 
> Do we get any code savings from this?

I noticed Anson submitted similar patches into various other subsystems.
Here [1] is a very detailed response from David Laight shedding some light
on this topic.

[1] https://lkml.org/lkml/2019/9/24/151

>>
>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>> ---
>>   drivers/input/touchscreen/imx6ul_tsc.c | 37 +++++++++++++++++-----------------
>>   1 file changed, 19 insertions(+), 18 deletions(-)


