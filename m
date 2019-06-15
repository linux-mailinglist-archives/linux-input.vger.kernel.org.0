Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB00D46F45
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2019 11:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFOJSM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Jun 2019 05:18:12 -0400
Received: from mx1.yrkesakademin.fi ([85.134.45.194]:29397 "EHLO
        mx1.yrkesakademin.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbfFOJSM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Jun 2019 05:18:12 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Sat, 15 Jun 2019 05:18:11 EDT
Subject: Re: [PATCH 1/2] HID: input: make sure the wheel high resolution
 multiplier is set
To:     Greg KH <gregkh@linuxfoundation.org>,
        James Feeney <james@nurealm.net>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Sasha Levin <sashal@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20190423154615.18257-1-benjamin.tissoires@redhat.com>
 <CAO-hwJLCL95pAzO9kco2jo2_uCV2=3f5OEf=P=AoB9EpEjFTAw@mail.gmail.com>
 <43a56e9b-6e44-76b7-efff-fa8996183fbc@nurealm.net>
 <CAO-hwJK614pzseUsGqH65fCnrm=N7970i4_mqi0m1gdkY=J0ag@mail.gmail.com>
 <b6410e5d-b165-7a9b-2ef5-eb44c8de7753@nurealm.net>
 <20190615055019.GC23883@kroah.com>
From:   Thomas Backlund <tmb@mageia.org>
Message-ID: <e158e981-47e6-a7f8-6416-4eff7af2c5d0@mageia.org>
Date:   Sat, 15 Jun 2019 12:03:04 +0300
MIME-Version: 1.0
In-Reply-To: <20190615055019.GC23883@kroah.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-WatchGuard-Spam-ID: str=0001.0A0C020D.5D04B7D4.000F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
X-WatchGuard-Spam-Score: 0, clean; 0, virus threat unknown
X-WatchGuard-Mail-Client-IP: 85.134.45.194
X-WatchGuard-Mail-From: tmb@mageia.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Den 15-06-2019 kl. 08:50, skrev Greg KH:
> On Fri, Jun 14, 2019 at 04:09:35PM -0600, James Feeney wrote:
>> Hey Everyone
>>
>> On 4/24/19 10:41 AM, Benjamin Tissoires wrote:
>>>>> For a patch to be picked up by stable, it first needs to go in Linus'
>>>>> tree. Currently we are working on 5.1, so any stable patches need to
>>>>> go in 5.1 first. Then, once they hit Linus' tree, the stable team will
>>>>> pick them and backport them in the appropriate stable tree.
>>
>> Hmm - so, I just booted linux 5.1.9, and this patch set is *still* missing from the kernel.
>>
>> Is there anything that we can do about this?
> 
> What is the git commit id of the patch in Linus's tree?
> 
> As I said before, it can not be backported until it shows up there
> first.
> 

That would be:
d43c17ead879ba7c076dc2f5fd80cd76047c9ff4

and

39b3c3a5fbc5d744114e497d35bf0c12f798c134

--
Thomas


