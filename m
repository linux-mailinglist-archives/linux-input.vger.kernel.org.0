Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B0D490406
	for <lists+linux-input@lfdr.de>; Mon, 17 Jan 2022 09:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbiAQIjh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jan 2022 03:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238285AbiAQIje (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jan 2022 03:39:34 -0500
Received: from server00.inetadmin.eu (server00.inetadmin.eu [IPv6:2a01:390:1:2:e1b1:2:0:d7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 107EBC061574;
        Mon, 17 Jan 2022 00:39:34 -0800 (PST)
Received: from [192.168.1.103] (ip-46.34.226.0.o2inet.sk [46.34.226.0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: miroslav@wisdomtech.sk)
        by server00.inetadmin.eu (Postfix) with ESMTPSA id 4E4D613A1B0;
        Mon, 17 Jan 2022 09:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wisdomtech.sk;
        s=dkiminetadmin; t=1642408771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v+W0OeyEs/aAhaW1aUtr5IDfrkfeKWnzFmDd9YiGUYw=;
        b=eIeTB78Nytlun94F/ydkU0PPjYRed7iZUvtyfsYUAOdXOb4wibhuLNNHmSzZxszExWsuDR
        mrhchEfoGru/DTHepjEze7bwYZU6aQ9HmZgaA4mgVV3md6rmWJdtUcrJCCpfYM5rgOHpG2
        1kwSOB1MP9gAW/OoqZT1e9p+A6ux4QI=
Message-ID: <541865be-207d-01db-efc4-7eff600d56dc@wisdomtech.sk>
Date:   Mon, 17 Jan 2022 09:39:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Wolfram Sang <wsa@kernel.org>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
 <596d6af1-d67c-b9aa-0496-bd898350865c@wisdomtech.sk>
 <d39101a9-adc6-df32-12f5-fccc8fd34515@amd.com>
 <5c0ed06a-617e-077a-a4a4-549e91d372ba@wisdomtech.sk>
 <BL1PR12MB5157412781B6C84B97C2A3E7E2559@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   =?UTF-8?Q?Miroslav_Bend=c3=adk?= <miroslav@wisdomtech.sk>
In-Reply-To: <BL1PR12MB5157412781B6C84B97C2A3E7E2559@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> [AMD Official Use Only]
>
>> Now i am trying to change ASF registers instead of SMBus registers.
>> I have tried to enable interrupts and set listen address, but it don't
>> work or
>> i can't recognize the difference between interrupts generated by
>> transfers and
>> interrupts generated from slave.
> Try reading the value of SFx0A ASFStatus bit 5 (it's write to clear if it's an interrupt).
>
>> outb_p(0x02, 0x15 + piix4_smba); // SlaveIntrListenEn
>> outb_p(0x2c << 1 | 0x01, 0x09 + piix4_smba); // ListenAdr | ListenAdrEn
> ASFx04 SlaveAddress instead of  ASFx09 ListenAdr
> ?
>
>
Little bit more informations:

Interrupts are generated only if ASFx09 ListenAdr is:

(0x08 << 1) | 0x01
(0x10 << 1) | 0x01

and touchpad is initialized with synaptics_intertouch=1

There is maybe small correlation between frequency and touch, but i am
not 100% sure.

There are no register changed in interrupt handler except of
ASFx13 DataBankSel. I can't determine if interrupt is generated from
transfer, or from external event.

ASF should be system for remote management. It should have access to
SMBus and data / command registers are identical, this means, that SMBus
should work (except block transfers).

If ASF just mirrors SMBus, then question is, why i can't access to
touchpad using SMBus? One strange thing is, that i2cdetect on standard
SMbus (0xb00), port 0 returns:

      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:                         -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- 36 37 -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: 50 -- -- -- -- -- -- -- 58 -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --

Address 0x58 is exactly 0x2c (synaptics) moved 1 bit left, but i2c-piix4
correctly moves address.

