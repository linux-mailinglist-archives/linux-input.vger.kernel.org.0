Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108EC1C6978
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 08:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbgEFGyi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 02:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725782AbgEFGyi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 02:54:38 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C92A0C061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 23:54:37 -0700 (PDT)
Received: from [192.168.178.106] (pD95EF25B.dip0.t-ipconnect.de [217.94.242.91])
        by mail.bugwerft.de (Postfix) with ESMTPSA id EA1F4404CBA;
        Wed,  6 May 2020 06:51:56 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] input: touch: ads7846: switch to devm
 initialization
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <20200504173745.1246505-1-daniel@zonque.org>
 <20200504173745.1246505-2-daniel@zonque.org>
 <20200505083701.GB18755@pengutronix.de>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <c0f3d222-7a35-1f92-d83f-8bb19f1d87d7@zonque.org>
Date:   Wed, 6 May 2020 08:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505083701.GB18755@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco,

On 5/5/20 10:37 AM, Marco Felsch wrote:
> also here, pls align the patch subject with the existing ones, so the
> prefix should be "Input: ads7846 - ".
> 
> On 20-05-04 19:37, Daniel Mack wrote:
>> This simplies the code a lot and fixes some potential resource leaks in
>> the error return paths. It also ensures the input device is registered
>> before the interrupt is requested, as the IRQ handler will commit events
>> when it fires.
> 
> Pls adapt the commit message too.
> 
>> Signed-off-by: Daniel Mack <daniel@zonque.org>

>> -static void ads784x_hwmon_unregister(struct spi_device *spi,
>> -				     struct ads7846 *ts)
>> -{
>> -	if (ts->hwmon)
>> -		hwmon_device_unregister(ts->hwmon);
>> +	return PTR_ERR_OR_ZERO(hwmon);
>>  }
> 
> Nit:
> return PTR_ERR_OR_ZERO(devm_hwmon_device_register_with_groups())

I tried that before, but it looks ugly and breaks the coding style
rules. So I'll leave that one out.

The rest of your comments I agree with. Thanks again!


Daniel
