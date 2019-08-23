Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA6539A6F5
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 07:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391885AbfHWFQJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Aug 2019 01:16:09 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:34993 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfHWFQJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 01:16:09 -0400
IronPort-SDR: zUEZU3HSnM+Oo4wTz5DR9uVgresXSbUfVG2poy5ud9NRzHhUxbdAw8dzDvWUDHfBikWe0havEG
 iuVDjfkk3lN8dPxpiNs51bw+OOODF+LJ3/hqlwHBHX/Sn+uEbrLIhLiIffaGSDGQv0mU9LYjXI
 zwBVEpu1r+aym+XONyUdxvqxCFrE1yhqIll7rioBDl5Jd//9gdw1M2IyFxW25pd9nmVA83Nqmc
 b7iI0cdQPiy7LWmnF7WL6tPjtbb546pyFcCpKDBa2vowA8qJQ+l/JxTl/mWAo4ct7fF2CVkqzG
 Ke8=
X-IronPort-AV: E=Sophos;i="5.64,420,1559548800"; 
   d="scan'208";a="40669909"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Aug 2019 21:16:08 -0800
IronPort-SDR: FTE7sS8JfZf91crdKYJTFgVUv7m2VfwMtxyjwM9DtmXOMyy0eyhmNWdW+G1zeE6EblaHP2jANk
 FWqnu07nLcIPlO3N5NxMWERFbRbZFxUeEYar/fgHrq39TiJLWsIcwEE8yAMK8FRgmBf82DCR1x
 rC4laNDvdY7fKyZb0paFps2w7b6B2zQJefdf/8ztibkUdLRi7FwpON9SL82PccLOdMpwSPHSJO
 vS8aAbLwjxHr0D8SCQR+PQ6+TS95sxZcttuD8KwtPukU8oXE5kJoy0HroZPjUyFPMiQhIL1PMT
 kXw=
Subject: Re: [PATCH v1 36/63] Input: atmel_mxt_ts - configure and use gpios as
 real gpios
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <george_davis@mentor.com>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
 <20190816083525.19071-2-jiada_wang@mentor.com>
 <20190816172422.GH121898@dtor-ws>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <eb362fc8-1859-01c7-c419-58684931a31b@mentor.com>
Date:   Fri, 23 Aug 2019 14:16:00 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172422.GH121898@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry

On 2019/08/17 2:24, Dmitry Torokhov wrote:
> On Fri, Aug 16, 2019 at 05:34:58PM +0900, Jiada Wang wrote:
>> From: Kautuk Consul <kautuk_consul@mentor.com>
>>
>> The upstream Atmel mXT driver implementation seems to handle the
>> T19 GPIO/PWM object as a key pad. Keys can be defined in the
>> device tree ("linux,gpio-keymap") and will be transported as key
>> events to the Linux input device if GPIO state changes.
>>
>> With our hardware, the GPIO pins of the touch controller are
>> connected to a PWM/backlight controller and used as supervision
>> inputs. We like to read the status of the pins by a script or an
>> application in the sysfs.
>>
>> Adding newer sysfs entries which shall be placed in the input
>> class directory eg:
>> /sys/class/input/input<n>/backlight_error1
> 
> No, if you want to export GPIO lines for external use create a gpiochip
> instance and register it with GPIO subsystem. No ad-hoc sysfs please.
> 
Agree, I will drop this patch in v2 patch-set

Thanks,
Jiada
> Thanks.
> 
