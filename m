Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CB8F24868
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 08:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfEUGvV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 02:51:21 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:46984 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725920AbfEUGvU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 02:51:20 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id 01578A0321;
        Tue, 21 May 2019 08:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1558421478;
        bh=yKuLFO5c0pIATImt1F6opFt/j/RZIkm+UdT3+v1Lrt8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V+Aq01Nl//1U31g13yaQWyymSWwTobre2xlitCsrsCLZXLyl5vJROlWjekK48eMNw
         pcOAeytozucET5skYDo8acxUTUsVUsxrtcHbs1k+pxRTopzLHfmg16/y+Wt+9AMhmg
         ddh3AXsxTAPWVi6wLW/pb+GIU7oT2J8HS+oD3Vz8=
Subject: Re: [RFC PATCH v2 0/4] Input: mpr121-polled: Add polled driver for
 MPR121
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <20190521053705.GI183429@dtor-ws>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <ef172b24-cd27-5bb0-d8b1-718f835d0647@ysoft.com>
Date:   Tue, 21 May 2019 08:51:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190521053705.GI183429@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 21. 05. 19 7:37, Dmitry Torokhov wrote:
> Hi Michal,
> 
> On Fri, May 17, 2019 at 03:12:49PM +0200, Michal Vokáč wrote:
>> Hi,
>>
>> I have to deal with a situation where we have a custom i.MX6 based
>> platform in production that uses the MPR121 touchkey controller.
>> Unfortunately the chip is connected using only the I2C interface.
>> The interrupt line is not used. Back in 2015 (Linux v3.14), my
>> colleague modded the existing mpr121_touchkey.c driver to use polling
>> instead of interrupt.
>>
>> For quite some time yet I am in a process of updating the product from
>> the ancient Freescale v3.14 kernel to the latest mainline and pushing
>> any needed changes upstream. The DT files for our imx6dl-yapp4 platform
>> already made it into v5.1-rc.
>>
>> I rebased and updated our mpr121 patch to the latest mainline.
>> It is created as a separate driver, similarly to gpio_keys_polled.
>>
>> The I2C device is quite susceptible to ESD. An ESD test quite often
>> causes reset of the chip or some register randomly changes its value.
>> The [PATCH 3/4] adds a write-through register cache. With the cache
>> this state can be detected and the device can be re-initialied.
>>
>> The main question is: Is there any chance that such a polled driver
>> could be accepted? Is it correct to implement it as a separate driver
>> or should it be done as an option in the existing driver? I can not
>> really imagine how I would do that though..
>>
>> There are also certain worries that the MPR121 chip may no longer be
>> available in nonspecifically distant future. In case of EOL I will need
>> to add a polled driver for an other touchkey chip. May it be already
>> in mainline or a completely new one.
> 
> I think that my addition of input_polled_dev was ultimately a wrong
> thing to do. I am looking into enabling polling mode for regular input
> devices as we then can enable polling mode in existing drivers.

OK, that sounds good. Especially when one needs to switch from one chip
to another that is already in tree, the need for a whole new polling
driver is eliminated.

I am still quite a novice in all kernel areas as I literally jump from
one subsystem to another to fix issues related to our platform. Anyway,
do you see any opportunity to help with that work?

> As far as gpio-keys vs gpio-key-polled, I feel that the capabilities of
> polling driver is sufficiently different from interrupt-driven one, so
> we will likely keep them separate.

OK, understand.

Thank you,
Michal
