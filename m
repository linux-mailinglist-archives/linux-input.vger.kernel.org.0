Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC738595422
	for <lists+linux-input@lfdr.de>; Tue, 16 Aug 2022 09:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiHPHwz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Aug 2022 03:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiHPHwb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Aug 2022 03:52:31 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C980118730A
        for <linux-input@vger.kernel.org>; Mon, 15 Aug 2022 22:00:58 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5aec6b.dynamic.kabel-deutschland.de [95.90.236.107])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 566A861EA192A;
        Tue, 16 Aug 2022 07:00:56 +0200 (CEST)
Message-ID: <f9181b2b-c593-f845-5663-6154d4041360@molgen.mpg.de>
Date:   Tue, 16 Aug 2022 07:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dell.Client.Kernel@dell.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <a075a4f7-21f6-54cf-8d97-af7f55ff4b91@molgen.mpg.de>
 <DM6PR19MB2636B859754CFACE88F5652BFACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1fe43de4-61e1-82ac-2a17-fe2adfea252a@molgen.mpg.de>
 <DM6PR19MB2636B8F9DB38079722EA0397FACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <DM6PR19MB2636B8F9DB38079722EA0397FACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Resend without attachment as linux-input@ bounced it due to exceeding 
the size limit.]

[Cc: -Mario as he works at AMD now.; +Dell.Client.Kernel@dell.com, but I 
never received a response from them.; +Benjamin]

Dear Dmitry,


Am 07.12.20 um 22:09 schrieb Limonciello, Mario:

>>> The messages you're seeing are harmless in this laptop.
>>>
>>> The laptop input is supported using the hid-multitouch and i2c-hid drivers as
>>> noted in your messages.
>>>
>>> [  393.280115] input: DLL09FF:01 06CB:CE39 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c- DLL09FF:01/0018:06CB:CE39.0002/input/input21
>>> [  393.280221] hid-multitouch 0018:06CB:CE39.0002: input,hidraw1: I2C HID v1.00 Mouse [DLL09FF:01 06CB:CE39] on i2c-DLL09FF:01
>>
>> Where is
>>
>>       input: PS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input2
>>
>> coming from then, and what touchpad is that supposed to be?
>>
>> If it’s harmless, should the log level be decreased from error to debug?
> 
> There are two common scenarios that happen on Dell's laptops.
> 1) Touchpads are connected to 2 buses.  Such as PS2 and i2c.
> 2) Touchpads are connected only to 1 bus, but the EC can emulate
> a PS/2 touchpad in the PS/2 bus until OS drivers have started up.
> This allows using it in BIOS setup for example without an UEFI DXE
> driver for I2C.  It's not generally safe for using it this way in
> a general purpose operating system.
> 
> I don't have the schematics for the model you referred to confirm it,
> but I suspect it's likely the second case.  In the first case you should
> see some sort of message along the lines that the touchpad supports
> another bus, you should make sure you have those drivers enabled.
> 
> The key however is that the PS/2 driver and i2c-hid drivers don't have
> any handshake here whatsoever about what happened.  This has come
> up several times over the years, but because there is "no negative
> impact" to a ghost touchpad device there has been no effort by
> anyone to fix it.  You can compile your kernel without psmouse and it
> should then not be present.
> 
> In systems with the first scenario pretty much when the I2C driver
> starts up, the PS/2 mode is turned off and you won't get traffic on
> the bus. Because of kernel probing order you would end up with psmouse
> mentioning it's supported by another bus probably, and then later in
> startup the i2c one starts up.  The I2C driver can't just notify psmouse
> it's supporting something because it can't prove the device it supports
> now is the same one that was supported by psmouse.
> 
> In the second scenario you're talking about a virtual device from the EC
> and a real device on the I2C bus.  So the notification flow is even more
> confusing.
> 
> Here's my two low effort ideas:
> 1) Adjust this so when kernel is compiled with the support for both can we
> make psmouse wait to initialize until after i2c-hid and hid-multitouch
> have finished?  This is probably a question for Benjamin if that would
> actually work and it's as low effort as I think it would be.
> 
> 2) Downgrade all psmouse messaging to debug. Realistically modern
> machines are no longer using psmouse in the first place. The messaging
> benefits no one except those that have a problem with older hardware,
> which can then be told to boot with dyndebug turned on for psmouse.

Today I have seen this also on a Dell XPS 13 9370 (system firmware 
1.15.0, 06/07/2021) with Linux 5.18.16. The message is logged on the 
screen even with `quiet` passed – as it’s log level error, and the user 
sees it when entering the LUKS passphrase.

Which one of Mario’s suggestions do the developers prefer?


Kind regards,

Paul
