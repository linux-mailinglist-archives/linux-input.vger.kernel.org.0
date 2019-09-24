Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042E4BC266
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 09:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392089AbfIXHQP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 03:16:15 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:29845 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388571AbfIXHQO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 03:16:14 -0400
IronPort-SDR: okmg58/v18nnT3AIsSmrx1kznSBLduLXwP+SNbPK1qu4QzD1MC6DMOJ7xM9LSmvfEoZL8FO5+b
 W+b003oj6B6kB7yPKayC+00OzPSevrxRRb8s2WI3FdD9UKq5iXhCZDqLDlRITk/MmNxmQEeZir
 HK8x0niM2ttzcDXhIZyJJl0xjb7CIp7edUhpygdKQXjF2+B6xIl+FZZ4UFpcsgmeNj5GQPgoH0
 TLvtEbSJp8Dw+F52iszECP9/IlQ1zqjyHHtFFm2AJL+mOB5PMgFSmxayo8p426KKnhUT8T8lwt
 ZN4=
X-IronPort-AV: E=Sophos;i="5.64,543,1559548800"; 
   d="scan'208";a="43431625"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 23 Sep 2019 23:16:14 -0800
IronPort-SDR: IQ76IXmnv4LstIrBtQLhKeN32w2DEU0TW6vhRRky0TpUKSQDre+hKvQ3oNmL3A+1nA2LG3PMgl
 0vMt/WoYi7UR9XXtcfPCbrtHOAvM0jICrrgyJQu06Kw7w3Yo5IULm/uXcFnGYBwHucD78EXil0
 +cU9GS9Riw1XFQE912wQQ8MLlcDtfaRskAGICCTmB+pWUzRnMBIrOXN6om54rnp1IcrosML+j0
 AlhN0X7lYFkofTKffT3J/jmQ60ANoOQtfi7HnNvzIYVNOPylzfvTNpmKu+HSdOE4xAMdGoFkZ0
 J2o=
Subject: Re: [PATCH v3 02/49] Input: introduce input_mt_report_slot_inactive
To:     Henrik Rydberg <rydberg@bitmath.org>, <nick@shmanahar.org>,
        <dmitry.torokhov@gmail.com>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20190917093320.18134-1-jiada_wang@mentor.com>
 <20190917093320.18134-3-jiada_wang@mentor.com>
 <546c8205-ecb7-1c34-3727-b10c7ff86232@bitmath.org>
From:   Jiada Wang <jiada_wang@mentor.com>
Message-ID: <a66d29fc-50fc-da82-5178-cf349d70a14b@mentor.com>
Date:   Tue, 24 Sep 2019 16:16:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <546c8205-ecb7-1c34-3727-b10c7ff86232@bitmath.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Henrik


On 2019/09/18 3:25, Henrik Rydberg wrote:
> Hi Jiada,
> 
>> input_mt_report_slot_state() ignores the tool when the slot is closed.
>> which has caused a bit of confusion.
>> This patch introduces input_mt_report_slot_inactive() to report slot
>> inactive state.
>> replaces all input_mt_report_slot_state() with
>> input_mt_report_slot_inactive() in case of close of slot.
> 
> This patch looks very odd, I am afraid.
> 
> When a driver needs to use input_mt functions, it first calls 
> input_mt_init_slots() during setup. The MT state then remains in effect 
> until the driver is destroyed. Thus, there is no valid case when 
> input_mt_report_slot_state() would fail to execute the line
> 
>     input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1)
> 
> when active == false.
> 
> What input_mt_report_slot_state() does do, however, is to ignore the 
> event when no MT state has been set, which does happen for some drivers 
> handling both normal and MT devices. Changing such a driver in the way 
> you suggest would introduce new events in existing, working cases, and 
> possibly break userspace. We should try very hard to avoid it.
> 

thanks for your comment,

Just to make sure, I think your comment is for
patch "[PATCH v3 01/49] Input: switch to use return value of 
input_mt_report_slot_state"
not for "[PATCH v3 02/49] Input: introduce 
input_mt_report_slot_inactive", right?

yes, I agree
by having change:

-    input_mt_report_slot_state(dev, tool_type, active);
-    if (active) {
+        if (input_mt_report_slot_state(dev, tool_type, active)){
              ... ...
      }

the logic of the driver is changed, when (mt == NULL && active == true).
I will drop patch "Input: switch to use return value of" in next version

Thanks,
Jiada

> Thanks,
> 
> Henrik
> 
> 
