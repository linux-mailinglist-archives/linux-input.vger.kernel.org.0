Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710C329323F
	for <lists+linux-input@lfdr.de>; Tue, 20 Oct 2020 02:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389235AbgJTAPP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 20:15:15 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.2]:19844 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726791AbgJTAPP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 20:15:15 -0400
Received: from [100.112.1.102] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.us-east-1.aws.symcld.net id 72/01-19530-11C2E8F5; Tue, 20 Oct 2020 00:15:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRWlGSWpSXmKPExsWSLveKTVdQpy/
  eYOoOJYtD5w4wWxxe9ILR4uu32+wWb45PZ7I4c3shk8XNT99YLVbvecHswO4xq6GXzWPnrLvs
  Hr+2rWHxWH5wGpPH+31X2Tw+b5ILYItizcxLyq9IYM14NvUwa8F1gYqOg83sDYyHeLsYOTmEB
  P4zSnxZp9fFyAVkv2CUOHLsExtIQljAS6L72iQmEFtEQF1iakcPG0gRs8ARRolFc84xQnR0Mk
  rcuvOZBaSKTUBbYsuWX0BVHBy8ArYSF5bZgIRZBFQlzrY2gw0SFQiX6LixA8zmFRCUODnzCVg
  rp4CdxMyFq8FsZgELiZnzzzNC2OISt57MZ4Kw5SW2v53DDGJLCChILOz8xwZhJ0gse3mHeQKj
  4CwkY2chGTULyahZSEYtYGRZxWiaVJSZnlGSm5iZo2toYKBraGika6hrYamXWKWbpFdarJuaW
  Fyia6iXWF6sV1yZm5yTopeXWrKJERhXKQWMkTsY973+oHeIUZKDSUmUd4t6X7wQX1J+SmVGYn
  FGfFFpTmrxIUYZDg4lCV5pbaCcYFFqempFWmYOMMZh0hIcPEoivDlaQGne4oLE3OLMdIjUKUZ
  FKXFef5A+AZBERmkeXBssrVxilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7HGQ8T2ZeCdz0
  V0CLmYAW2/b3gCwuSURISTUwGbgUGTvN21rj85bTdZV/pt6b49Jh9/r72W0Nu9Y0VD3uE/g36
  6om35Lzt7V2y7LYKdnddD4SVOX85q7hbbGlD8L6Lsc8lrmvea/+FGMP7/Yt000enZv8dD7D7Z
  4dBY2hCd+u94owvVxiu3PPMoPArV01b5fMr5E9G6Nb9tU83PCSF1snU7jLScnPXa1HzktcXDn
  n9/yFp5+XrKu0/BfTuSaxROuFT+OyoG3aQTzLtp7586JhasDf+jDRnPlTPodLnq58b8l+uM7l
  h7WbWYSjXhzHI2XXdQG2TvUrX0178GlvlEtp9t4H3uqfp7C++v5+0ffG2v0lC97MWed/ZopdW
  nfzvvtSjCVL4m/1mPS7K7EUZyQaajEXFScCAEWiOxSmAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-395.messagelabs.com!1603152911!349945!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23711 invoked from network); 20 Oct 2020 00:15:13 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-16.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Oct 2020 00:15:13 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id A9FBD56AB61561B8150B;
        Tue, 20 Oct 2020 08:15:09 +0800 (CST)
Received: from localhost.localdomain (10.46.57.111) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2044.4; Mon, 19 Oct
 2020 17:15:05 -0700
Subject: Re: [External] Re: [PATCH 0/3] Lenovo lap and palm sensor support
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <njoshi1@lenovo.com>, <dmitry.torokhov@gmail.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
References: <markpearson@lenovo.com>
 <20201015135717.384610-1-markpearson@lenovo.com>
 <c49d5d8a-4c20-f130-8218-1928beb3b565@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <66b2ded0-44bc-759a-339b-91c25bf30b7f@lenovo.com>
Date:   Mon, 19 Oct 2020 20:15:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c49d5d8a-4c20-f130-8218-1928beb3b565@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.57.111]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19/10/2020 14:49, Hans de Goede wrote:
> Hi,
> 
> On 10/15/20 3:57 PM, Mark Pearson wrote:
>> This patch series is to add support for the Lenovo lap and palm sensors.
>> The original lap sensor implementation used a sysfs API but after
>> consultation with the kernel maintainers we agreed on using the input
>> subsystem instead.
>> The first patch just adds the new defines needed.
>> The second patch adds the implementation needed for the palm sensor.
>> The third patch adds the implementation needed for the lap sensor.
>>
>> This means currently thinkpad_acpi.c has both the sysfs and input dev
>> implementations. I will add a follow-on patch to remove the sysfs
>> interface once I've confirmed this is OK with the few people who are
>> using this in user space and given them some time to migrate to the
>> input dev implementation.
>>
>> Mark Pearson (3):
>>    Adding event codes for Lenovo lap and palm sensors
>>    Add support for Lenovo palm sensor.
>>    Add support for Lenovo lap sensor
> 
> Not a full review, but one short remark, all your patch
> subjects e.g. "Adding event codes for Lenovo lap and palm sensors"
> are missing subsystem prefixes, if you do e.g.
> 
> git log include/uapi/linux/input-event-codes.h
> 
> You see subjects like "Input: allocate keycode for Fn + right shift",
> etc. and for the the thinkpad_acpi.c code you get:
> "platform/x86: thinkpad_acpi: Map Clipping tool hotkey to KEY_SELECTIVE_SCREENSHOT"
> 
> So your patch subjects should look something like this:
> 
> "Input: add event codes for lap and palmrest proximity switches"
> (note I fixed more here then just the missing prefix)
> 
> "platform/x86: thinkpad_acpi: Add support for Lenovo palm sensor"
> (note no . at the end)
> 
> "platform/x86: thinkpad_acpi: Add support for Lenovo lap sensor"
> 
> If you can send out a v2 with this fixed, that might help to
> go Dmitry's attention for the first patch.
> 
> Regards,
> 
> Hans
> 
Thanks Hans,
I knew about that too detail, so slap on the wrist for me. I was too 
focused on doing a series of patches for the first time...

Updated version coming out shortly.

Mark
Mark
