Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F49312CAB
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 10:00:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhBHI7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 03:59:30 -0500
Received: from air.basealt.ru ([194.107.17.39]:43800 "EHLO air.basealt.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230407AbhBHIxs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Feb 2021 03:53:48 -0500
X-Greylist: delayed 440 seconds by postgrey-1.27 at vger.kernel.org; Mon, 08 Feb 2021 03:53:41 EST
Received: by air.basealt.ru (Postfix, from userid 490)
        id 5DA05589440; Mon,  8 Feb 2021 08:45:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
        sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from nickel-ws.localdomain (obninsk.basealt.ru [217.15.195.17])
        by air.basealt.ru (Postfix) with ESMTPSA id 7900E58943A;
        Mon,  8 Feb 2021 08:45:26 +0000 (UTC)
Reply-To: nickel@basealt.ru
Subject: Re: [PATCH] Input: elantech - add LEN2146 to SMBus blacklist for
 ThinkPad L13 Gen2
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nikolai Kostrigin <nickel@altlinux.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20210208075205.3784059-1-nickel@altlinux.org>
 <CAO-hwJJpUj=+mpqQ7eMtbtwX6CPAkt2ZpDnpmX9GUDo1EuEOiw@mail.gmail.com>
From:   Nikolai Kostrigin <nickel@basealt.ru>
Organization: BaseALT
Message-ID: <126f63de-f738-a76a-9681-2029a223b070@basealt.ru>
Date:   Mon, 8 Feb 2021 11:45:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJJpUj=+mpqQ7eMtbtwX6CPAkt2ZpDnpmX9GUDo1EuEOiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Benjamin!

08.02.2021 11:06, Benjamin Tissoires пишет:
> Hi Nikolai,
>
> On Mon, Feb 8, 2021 at 9:01 AM Nikolai Kostrigin <nickel@altlinux.org> wrote:
>> ThinkPad L13 Gen2 has both touchpad and trackpoint.
>> PNP: LEN2146 PNP0f13
>> With the default protocol (elantech-smbus) trackpoint is not operating,
>> while touchpad does. Changing to elantech renders both operational.
>>
>> Signed-off-by: Nikolai Kostrigin <nickel@altlinux.org>
> Instead of downgrading the capabilities of the touchpad, couldn't we
> fix the trackpoint issues?
Yes, I consider fixing the issue would be better than downgrading
touchpad capabilities.
Blacklisting was the first and most obvious idea to test.

I'm eager to perform additional diagnostics to choose a better solution.
Your advice would be appreciated.

>
> I am surprised elantech doesn't work with the trackpoint, because I am
> pretty sure I wrote patches in that regard. Which kernel version have
> you been testing?
The patch was tested with 5.10.13 only, but the trackpoint behaviour is
the same on 5.4.92.
> Cheers,
> Benjamin
>

>
>> ---
>>  drivers/input/mouse/elantech.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
>> index 90f8765f9efc..c4c3fa5828d8 100644
>> --- a/drivers/input/mouse/elantech.c
>> +++ b/drivers/input/mouse/elantech.c
>> @@ -1776,6 +1776,7 @@ static const char * const i2c_blacklist_pnp_ids[] = {
>>          * These are known to not be working properly as bits are missing
>>          * in elan_i2c.
>>          */
>> +       "LEN2146", /* ThinkPad L13 Gen2 */
>>         NULL
>>  };
>>
>> --
>> 2.29.2
>>
-- 
Best regards,
Nikolai Kostrigin

