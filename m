Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3614E736E3E
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 16:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjFTOD1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jun 2023 10:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232894AbjFTOD0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jun 2023 10:03:26 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F99C7;
        Tue, 20 Jun 2023 07:03:25 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qBbHb-00037T-Nz; Tue, 20 Jun 2023 15:20:31 +0200
Message-ID: <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
Date:   Tue, 20 Jun 2023 15:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US, de-DE
To:     Malte Starostik <malte@starostik.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        "Limonciello, Mario" <mario.limonciello@amd.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>, basavaraj.natikar@amd.com,
        linux-input@vger.kernel.org, linux@hexchain.org,
        stable@vger.kernel.org
References: <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com> <5980752.YW5z2jdOID@zen>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <5980752.YW5z2jdOID@zen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687269805;2ad691bc;
X-HE-SMSGID: 1qBbHb-00037T-Nz
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

What happens to this? From here it looks like there was no progress to
resolve the regression in the past two weeks, but maybe I just missed
something.

On 07.06.23 00:57, Malte Starostik wrote:
> Am Dienstag, 6. Juni 2023, 17:25:13 CEST schrieb Limonciello, Mario:
>> On 6/6/2023 3:08 AM, Benjamin Tissoires wrote:
>>> On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
>>>>>> Hello,
>>>>>>
>>>>>> chiming in here as I'm experiencing what looks like the exact same
>>>>>> issue, also on a Lenovo Z13 notebook, also on Arch:
>>>>>> Oops during startup in task udev-worker followed by udev-worker
>>>>>> blocking all attempts to suspend or cleanly shutdown/reboot the
>>>>>> machine
> 
>>> I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors
>>> are enabled, clean up") because the stack trace says that there is a bad
>>> list_add, which could happen if the object is not correctly initialized.
>>>
>>> However, that commit was present in v6.2, so it might not be that one.
>>>
>> If I'm not mistaken the Z13 doesn't actually have any
>> sensors connected to SFH.  So I think the suspicion on
>> 7bcfdab3f0c6 and theory this is triggered by HID init makes
>> a lot of sense.
>>
>> Can you try this patch?
>>
>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> index d9b7b01900b5..fa693a5224c6 100644
>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
>> @@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev
>> *privdata)
>>                          devm_kfree(dev, cl_data->report_descr[i]);
>>                  }
>>                  dev_warn(dev, "Failed to discover, sensors not enabled
>> is %d\n", cl_data->is_any_sensor_enabled);
>> +               cl_data->num_hid_devices = 0;
>>                  return -EOPNOTSUPP;
>>          }
>>          schedule_delayed_work(&cl_data->work_buffer,
>> msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
> 
> I applied this to 9e87b63ed37e202c77aa17d4112da6ae0c7c097c now, which was the 
> origin when I started the whole bisection. Clean rebuild, issue still 
> persists.
> 
> Out of 50 boots, I got:
> 
> 25 clean
> 22 Oops as posted by the OP
> 1 same Oops, followed by a panic
> 1 lockup [1]
> 1 hanging with just a blank screen
> 
> Not sure whether the lockups are related, but [1] mentions modprobe and udev-
> worker as well and all problems including the blank screen one appear roughly 
> at the same time during boot. As this is before a graphics mode switch, I 
> suspect the last mentioned case may be like [1] while the screen was blanked.
> To support the timing correlation: the UVC error for the IR cam shown in the 
> photo (normal boot noise) also appears right before the BUG in the non-lockup 
> bad case.
> 
> I do see the dev_warn in dmesg, so the code path modified in your patch is 
> indeed hit:
> [   10.897521] pcie_mp2_amd 0000:63:00.7: Failed to discover, sensors not 
> enabled is 1
> [   10.897533] pcie_mp2_amd: probe of 0000:63:00.7 failed with error -95
> 
> BR Malte
> 
> [1] https://photos.app.goo.gl/2FAvQ7DqBsHEF6Bd8

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
