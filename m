Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968E42485CD
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 15:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgHRNN5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 09:13:57 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:49717 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726829AbgHRNNv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 09:13:51 -0400
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id D045420225BDA;
        Tue, 18 Aug 2020 15:13:45 +0200 (CEST)
Subject: Re: No pinch events with Dell laptops and Alps
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        linux-input@vger.kernel.org
References: <8b4907c5-4af8-2a2c-bbe1-46b2be2980be@molgen.mpg.de>
 <20200716232223.GA527251@koala>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <e2bcaf1e-2fa0-0d6e-0b51-646f1de2d206@molgen.mpg.de>
Date:   Tue, 18 Aug 2020 15:13:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200716232223.GA527251@koala>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Peter,


Am 17.07.20 um 01:22 schrieb Peter Hutterer:
> On Thu, Jul 16, 2020 at 03:19:32PM +0200, Paul Menzel wrote:

>> On the Dell Latitude E7250 and Dell Precision 3340 I fail to get three
>> finger pinch events generated needed for GNOME Shell gestures [1].
>>
>> Debian Sid/unstable with Linux 5.7.6 is running on these systems.
>>
>>      [    1.602394] input: AlpsPS/2 ALPS GlidePoint as
>> /devices/platform/i8042/serio1/input/input2
>>
>> I am only able to create swipe events. (Four finger swipe works to switch
>> workspaces.)
>>
>> ```
>> $ sudo libinput debug-events
>> […]
>> -event1   DEVICE_ADDED     AlpsPS/2 ALPS GlidePoint          seat0 default
>> group10 cap:pg  size 98x51mm tap(dl off) left scroll-nat scroll-2fg-edge
>> dwt-on
>> -event2   DEVICE_ADDED     DELL Wireless hotkeys             seat0 default
>> group11 cap:k
>> event1  - AlpsPS/2 ALPS GlidePoint: kernel bug: Wrong slot count (4),
>> reducing to 2
>> -event1   GESTURE_SWIPE_BEGIN +1.549s	3
>>   event1   GESTURE_SWIPE_UPDATE +1.549s	3 -0.36/ 0.26 (-2.59/ 1.85
>> unaccelerated)
>> […]
>> ```
>>
>> Does the hardware and driver support that?
> 
> The device is an Alps GlidePoint which are usually INPUT_PROP_SEMI_MT. On
> those devices, we don't support 3fg pinch gestures because we don't get
> enough data to make the gestures reliable. There is no specific quirk for
> your device otherwise, afaict.

Thank you for your reply, and the explanation.

Four finger gestures seem to work. At least in GNOME Shell workspaces 
can be switched with that.

> If it's not semi-mt then it's too hard to say without more data, I'll need
> at least the output from libinput record to figure out why (that recording
> will contain the libinput version which also matters).

Sorry for omitting that. It’s 1.16.1 now. I uploaded the logs [2].


Kind regards,

Paul


[2]: 
https://owww.molgen.mpg.de/~pmenzel/20200818-libinput-record-linux-5.7.10.txt
