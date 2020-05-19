Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1CE91D9358
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 11:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgESJ3w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 05:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgESJ3w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 05:29:52 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0257DC061A0C
        for <linux-input@vger.kernel.org>; Tue, 19 May 2020 02:29:52 -0700 (PDT)
Received: from [192.168.178.106] (pd95ef292.dip0.t-ipconnect.de [217.94.242.146])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 8874240AB6C;
        Tue, 19 May 2020 09:26:52 +0000 (UTC)
Subject: Re: [PATCH v3 3/3] Input: ads7846: Switch to devm initialization
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <20200507062014.1780360-1-daniel@zonque.org>
 <20200507062014.1780360-5-daniel@zonque.org>
 <20200519091841.dlj3tumnvxolbbcy@pengutronix.de>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <b20d7766-363e-364a-86a6-b1d91e5d62f6@zonque.org>
Date:   Tue, 19 May 2020 11:29:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519091841.dlj3tumnvxolbbcy@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Marco!

On 5/19/20 11:18 AM, Marco Felsch wrote:
> On 20-05-07 08:20, Daniel Mack wrote:
>> This simplies the code a lot and fixes some potential resource leaks in
>> the error return paths.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>  drivers/input/touchscreen/ads7846.c | 123 ++++++++++------------------
>>  1 file changed, 45 insertions(+), 78 deletions(-)
>>

>> @@ -1482,26 +1468,7 @@ static int ads7846_remove(struct spi_device *spi)
>>  	struct ads7846 *ts = spi_get_drvdata(spi);
>>  
>>  	sysfs_remove_group(&spi->dev.kobj, &ads784x_attr_group);
>> -
>>  	ads7846_disable(ts);
> 
> Did you tested the bind/unbind path? I think we are getting troubles
> here because ads7846_disable calls ads7846_stop() and
> regulator_disable(). Since we are using the devm_action the regualtor
> gets disabled by this action and ads7846_disable(). This causes a
> refcount problem.

Ah, nice catch. Yes, we just need to call ads7846_stop() here. Will post
a v4 then.


Thanks,
Daniel
