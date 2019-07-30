Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3557A21C
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 09:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbfG3HWw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 03:22:52 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3243 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727527AbfG3HWw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 03:22:52 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id DCFCEE9B87D52890DB6C;
        Tue, 30 Jul 2019 15:22:49 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 30 Jul 2019
 15:22:44 +0800
Subject: Re: [PATCH] Input: applespi - Fix build error
To:     "Life is hard, and then you die" <ronald@innovation.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20190729031455.59400-1-yuehaibing@huawei.com>
 <20190729140438.GA2372@penguin> <20190730070117.GB20206@innovation.ch>
CC:     <nikolas@gnu.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <59344451-4752-8610-22cd-2aa9b34e21ed@huawei.com>
Date:   Tue, 30 Jul 2019 15:22:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20190730070117.GB20206@innovation.ch>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019/7/30 15:01, Life is hard, and then you die wrote:
> 
> On Mon, Jul 29, 2019 at 04:04:38PM +0200, Dmitry Torokhov wrote:
>> On Mon, Jul 29, 2019 at 11:14:55AM +0800, YueHaibing wrote:
>>> If CONFIG_KEYBOARD_APPLESPI=y but CONFIG_LEDS_CLASS=m
>>> building fails:
>>>
>>> drivers/input/keyboard/applespi.o: In function `applespi_probe':
>>> applespi.c:(.text+0x1fcd): undefined reference to `devm_led_classdev_register_ext'
>>>
>>> Wrap it in LEDS_CLASS macro to fix this.
>>
>> No, we should add "depends on LEDS_CLASS" to the Konfig instead.
> 
> While the loss of keyboard-backlight functionality is certainly not
> critical, in practice when building a kernel for desktops/laptops
> (i.e. where this module would be used) I see no real reason why you'd
> not have/want LEDS_CLASS enabled. So I'd agree with Dmitry that a
> Kconfig depends-on is probably the preferred approach.

Thanks, will send v2 as suggestion.

> 
> 
>   Cheers,
> 
>   Ronald
> 
> 
> .
> 

