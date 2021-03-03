Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B8732C5F0
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 02:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243840AbhCDA1D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 19:27:03 -0500
Received: from air.basealt.ru ([194.107.17.39]:56426 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1357523AbhCCKve (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Mar 2021 05:51:34 -0500
Received: by air.basealt.ru (Postfix, from userid 490)
        id DE1AA589435; Wed,  3 Mar 2021 10:41:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from nickel-ws.localdomain (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id D4C81589421;
        Wed,  3 Mar 2021 10:41:26 +0000 (UTC)
Reply-To: nickel@basealt.ru
Subject: Re: elan_i2c: failed to read report data: -71
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Jingle Wu <jingle.wu@emc.com.tw>, kernel@pengutronix.de,
        linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wolfram Sang <wsa@kernel.org>
References: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
 <YD7lzrUm4iU5C+Q+@google.com>
From:   Nikolai Kostrigin <nickel@basealt.ru>
Organization: BaseALT
Message-ID: <ab3e8865-09b7-dc1e-8e78-22f89b8a8c9e@basealt.ru>
Date:   Wed, 3 Mar 2021 13:41:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD7lzrUm4iU5C+Q+@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

03.03.2021 04:26, Dmitry Torokhov пишет:
> Hi Uwe,
>
> On Tue, Mar 02, 2021 at 10:09:34PM +0100, Uwe Kleine-König wrote:
>> Hello,
>>
>> I just installed Linux on a new Thinkpad E15 and I experience a
>> non-working touchpad. I can move the mouse just fine, but when I press
>> one of the three buttons or move the trackpoint the kernel log gets
>> flooded with:
>>
>> 	elan_i2c 0-0015: failed to read report data: -71
>>
>> and nothing happens in the GUI.
>>
>> This is a kernel from Debian testing, i.e. 5.10.13, during probe of the
>> device the following is reported:
>>
>> 	elan_i2c 0-0015: supply vcc not found, using dummy regulator
>> 	elan_i2c 0-0015: Elan Touchpad: Module ID: 0x000e, Firmware: 0x0001, Sample: 0x0000, IAP: 0x0000
>> 	input: Elan Touchpad as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input21
>> 	input: Elan TrackPoint as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input22
>>
>> I backported commits
>>
>> 	056115daede8 Input: elan_i2c - add new trackpoint report type 0x5F
>> 	c7f0169e3bd2 Input: elan_i2c_core - move header inclusion inside
Uwe, you might miss

e4c9062717fe Input: elantech - fix protocol errors for some trackpoints
in SMBus mode
>>
>> to this kernel, but this didn't help.
>>
>> When enabling smbus tracing the matching events are:
>>
>>  irq/159-elan_i2-2207    [003] ....   963.625641: smbus_read: i2c-0 a=015 f=0040 c=a8 BLOCK_DATA
>>  irq/159-elan_i2-2207    [003] ....   963.629247: smbus_result: i2c-0 a=015 f=0000 c=a8 BLOCK_DATA rd res=-71
>>
>> The relevant code is:
>>
>>         len = i2c_smbus_read_block_data(client,
>>                                         ETP_SMBUS_PACKET_QUERY,
>>                                         &report[ETP_SMBUS_REPORT_OFFSET]);
>>         if (len < 0) {
>>                 dev_err(&client->dev, "failed to read report data: %d\n", len);
>>                 return len;
>>         }
>>
>> I think the failing location in the i2c driver is
>>
>>         if (read_write == I2C_SMBUS_READ ||
>>             command == I2C_SMBUS_BLOCK_PROC_CALL) {
>>                 len = inb_p(SMBHSTDAT0(priv));
>>                 if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
>>                         return -EPROTO;
>>
>>                 data->block[0] = len;
>>                 for (i = 0; i < len; i++)
>>                         data->block[i + 1] = inb_p(SMBBLKDAT(priv));
>>         }
>>
>> in i801_block_transaction_by_block().
>>
>> Does this ring a bell? Does someone know if there is documentation
>> available?
> I believe Nikolai also run into this issue and is saying that
>
> 	modprobe i2c_i801 disable_features=0x2
>
> cures the touchpad.
Yes, but the really rock solid solution is already in 5.11 (thanks to
Jingle and Dmitry):

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=next&id=056115daede8d01f71732bc7d778fb85acee8eb6

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=next&id=e4c9062717feda88900b566463228d1c4910af6d


which solves the issue for me as I mentioned in the original thread




>
> Thanks.
>
-- 
Best regards,
Nikolai Kostrigin

