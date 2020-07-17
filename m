Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED301223584
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 09:21:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGQHVn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 03:21:43 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18959 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728089AbgGQHVj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 03:21:39 -0400
IronPort-SDR: 7LaXq6ihs9ev2HrxcLAVdfggmpJnNuVWLGB/RpKt09UAWQeAakDX6oTlGIcMOWRSZj+fi1Y+vI
 GdZ1TLY/hvk0/nvxGUzzzlDoc2Ipp5Xn2KMQjd/6mSCLJDvL4QsZwRGOPDPCBVELvsf7iDq+zY
 u/Sj1ZDcfDtPovQSNjT7mgvo53GhdNw6t783bOatrca+nE6fHOA+TT0g2emzV+B0OBInO+oJda
 yWUnon6fNON1SBbdys/Xa+iiwrQ9c4eDoIz6B+NGxuIZXcucmTXUB7WxNk0Qp4JdPuUS5qS6Ul
 L9I=
X-IronPort-AV: E=Sophos;i="5.75,362,1589270400"; 
   d="scan'208";a="51006580"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 16 Jul 2020 23:21:38 -0800
IronPort-SDR: 30y6cLVJUlFgj1xzSnpRyflWc2zU7F73h3pTMum+dRAQLEKdgW1r3qLL/FOt2E+iyPf8h43COL
 sLaRq4+gZzTZ7gcZywveVT2tktMtlcwTGaOQcVZV4+Ruqwbx6QA5yimTxNButuuK9ocEx9YIB+
 HN9vXZ3v8YFqYFVnfKkG5FDIuLaAaoaIsQji2C0kl2QJEA7PX7qevd8XWYvbEvafGwIWC2gc3B
 bDDqkaKdDCdN4WhluZKAj6KtyWeVqNF38X8FZApqRzLajYUnQ/oItP12D/1al9schiuytX7Xo4
 aCg=
Subject: Re: [PATCH v11 00/56] atmel_mxt_ts misc
From:   "Wang, Jiada" <jiada_wang@mentor.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200527064307.GK89269@dtor-ws>
 <2f7964da-0dca-2d13-3559-28b4582a3278@mentor.com>
 <80fc7a3e-efd5-fab8-8ba8-8aa011944ab1@mentor.com>
Message-ID: <c0f24b5e-5fa4-d178-2bc4-c39a1d084aef@mentor.com>
Date:   Fri, 17 Jul 2020 16:21:32 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80fc7a3e-efd5-fab8-8ba8-8aa011944ab1@mentor.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello All

I am thinking it doesn't make sense to keep the series
with such a big chunk of patches,
I will divide the series into several small series

Thanks,
Jiada

On 2020/07/08 22:05, Wang, Jiada wrote:
> Hello Dmitry
> 
> I am working on refining this series,
> regarding your comment about drop changes related to
> upload firmware and config during boot.
> 
> I found currently only config is uploaded during every boot.
> but firmware is only uploaded when userspace asks to do so via
> sysfs interface.
> 
> Could you help to confirm if this is the case?
> 
> Thanks,
> Jiada
> 
> On 2020/06/25 22:50, Wang, Jiada wrote:
>> Hello Dmitry
>>
>> sorry for the delay,
>>
>> On 2020/05/27 15:43, Dmitry Torokhov wrote:
>>> Hi Jiada,
>>>
>>> On Thu, May 07, 2020 at 10:56:00PM -0700, Jiada Wang wrote:
>>>> This patch-set forward ports Nick Dyer's work in ndyer/linux github
>>>> repository as long as some other features and fixes
>>>
>>> Sorry for ignoring the series for quite a while. I guess my biggest
>>> issue with the series is that quite a bit of patches are trying to
>>> handle the fallout from a very unfortunate design decision in the
>>> driver: the fact that it attempts to automatically upload firmware and
>>> config on every boot/probe. This design was done at my urging because I
>>> did not have access to the technical documentation and did not realize
>>> that the controller has non-volatile memory for both firmware and
>>> configuration. We should only attempt to automatically load firmware
>>> where device does not have non-volatile memory and is unable function
>>> otherwise, in all other cases we better leave it to userspace to decide
>>> whether to execute firmware update and when. The kernel should only
>>> provide facilities so that userspace can initiate firmware update. This
>>> design has worked well for Chrome OS for many years (it used Atmel
>>> controllers in several products), and I would like to bring it to the
>>> mainline.
>>
>> I agree with you, I will review the patch-set,
>> and only pick these not related to firmware/cfg upload
>>
>> Thanks,
>> jiada
>>>
>>> Thanks.
>>>
