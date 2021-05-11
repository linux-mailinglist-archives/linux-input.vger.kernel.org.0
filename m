Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4531937AF56
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 21:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbhEKTdG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 15:33:06 -0400
Received: from saul.pp3345.net ([163.172.111.124]:60512 "EHLO saul.pp3345.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231454AbhEKTdF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 15:33:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE5599A5869;
        Tue, 11 May 2021 21:31:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pp3345.net; s=saul;
        t=1620761518;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2qKaI+TEaMg5Mxk1UOW8Jgh4tvvuMaSgDEV3+liuiF4=;
        b=JbKCDEA7ycMhQ6W79qE9kHKpet1FMtG2ROR1i0VdmDva9sxP35/Gpr0WX/rQGAQthB93wL
        nYPbRlfg8jDzh+Belye/dZ/TbmOMCSaEupgwv+BCDyatGcFKu9PqZ8tRmLUTsBg9iynepN
        5zKdH6LHpMnJu1RFaYq6alN6yvPSw4iGnPu0jApluRTW7n8ESySSOtjcgT+i3eh/qiIo3q
        fLXpXcTMmXh9TsabaytsdKhsa0wlsvroouXTJC7PMwp0/460NemxxX4A8p5pnNw71GQxdR
        7pgP44yxBxaawuEDtGeMUJs32+0XsSYlseN70QWrm6HbLf3lRV4MGLhpgpo7lg==
Subject: Re: synaptics: Your touchpad (PNP: LEN2018 PNP0f13) says it can
 support a different bus
To:     Derek Dolney <kernel@dolney.com>, linux-input@vger.kernel.org
References: <a89decb8584e4bc6d01eaade28fed7be334c56af.camel@dolney.com>
 <e98baacb-7523-4df9-bada-36b50f090b41@pp3345.net>
 <82d616e6e3efc1f735b4641f5c6bb6f4b129104d.camel@dolney.com>
From:   Yussuf Khalil <dev@pp3345.net>
Message-ID: <3f3a1990-0420-fcd3-3e46-c4f719e96807@pp3345.net>
Date:   Tue, 11 May 2021 21:31:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <82d616e6e3efc1f735b4641f5c6bb6f4b129104d.camel@dolney.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

What kernel version are you using precisely?

On 11.05.21 19:42, Derek Dolney wrote:
> Hi, Yussuf,
>
> Thanks for your help. I finally noticed today that it does not work.
> Sometimes suspends and resumes but sometimes chokes. Any advice about
> that or can you point me in the right direction to find some fix? I get
> these messages in my syslog:
>
> kernel: i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> kernel: rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -16.
> kernel: rmi4_f01 rmi4-00.fn01: Suspend failed with code -16.
> kernel: rmi4_physical rmi4-00: Failed to suspend functions: -16
> kernel: rmi4_smbus 7-002c: Failed to suspend device: -16
> kernel: PM: dpm_run_callback(): 0xffffffffc06a0050 returns -16
> kernel: PM: Device 7-002c failed to suspend: error -16
> kernel: PM: Some devices failed to suspend, or early wake event
> detected
> kernel: i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> kernel: rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to
> change enabled interrupts!
> kernel: psmouse: probe of serio2 failed with error -1
>
> On Wed, 2021-05-05 at 23:32 +0200, Yussuf Khalil wrote:
>> Hi Derek,
>>
>> have you tested whether suspending and resuming works fine? If yes, can
>> you send in a commit that adds the PNP ID to the list in
>> drivers/input/mouse/synaptics.c?
>>
>> Regards
>> Yussuf Khalil
>>
>> On 05.05.21 23:06, Derek Dolney wrote:
>>> First of all thank you for all your hard work keeping the Linux
>>> kernel
>>> awesome!
>>>
>>> Running on a Lenovo Thinkpad T460p, I found these lines in my dmesg:
>>>
>>> [   17.360279] psmouse serio1: synaptics: queried max coordinates: x
>>> [..5676], y [..4758]
>>> [   17.390832] psmouse serio1: synaptics: queried min coordinates: x
>>> [1266..], y [1096..]
>>> [   17.390853] psmouse serio1: synaptics: Your touchpad (PNP: LEN2018
>>> PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi
>>> are not used, you might want to try setting
>>> psmouse.synaptics_intertouch to 1 and report this to
>>> linux-input@vger.kernel.org.
>>>
>>> Indeed i2c-hid and hid-rmi modules are not loaded. Setting
>>> psmouse.synaptics_intertouch=1 as directed, now I get the following
>>> and
>>> the device works well imho:
>>>
>>> [   80.967562] psmouse serio1: synaptics: queried max coordinates: x
>>> [..5676], y [..4758]
>>> [   81.004823] psmouse serio1: synaptics: queried min coordinates: x
>>> [1266..], y [1096..]
>>> [   81.004828] psmouse serio1: synaptics: Trying to set up SMBus
>>> access
>>> [   81.025153] rmi4_smbus 7-002c: registering SMbus-connected sensor
>>> [   81.079177] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer:
>>> Synaptics, product: TM3053-006, fw id: 2010421
>>> [   81.141785] input: Synaptics TM3053-006 as /devices/rmi4-
>>> 00/input/input22
>>> [   81.148458] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
>>> [   81.559841] input: PS/2 Generic Mouse as /devices/rmi4-00/rmi4-
>>> 00.fn03/serio2/input/input23
>>>
>>> Thanks again,
>>> Derek
>>>
>
