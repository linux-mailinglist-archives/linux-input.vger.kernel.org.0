Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0101B218870
	for <lists+linux-input@lfdr.de>; Wed,  8 Jul 2020 15:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729070AbgGHNGD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jul 2020 09:06:03 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:46964 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729016AbgGHNGD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jul 2020 09:06:03 -0400
IronPort-SDR: EuY/f6T9Q0yMSk4FmAsthL52/Ao5DWeiOtEBVRO8oXiJ3djSVDd8M69klEMQJAAiIHyREX/aQ0
 yhSQKbcpxQl1vTAyv2eqRWHA+Vs4prYJCm7J9kIx/8uZv29VSXHBgSQhrpufeQN6TJHr+oEtvy
 Z97b4IluZoUBPdHAtPOBeLsZ3PBdTdzGTaWmMTZaU/XMP0QTlGwZm752ZERnGumsWgVX5A6Aij
 u7pbSJZ6LD7gP2stDSE3AhDmm7vg6j7h1ZjkeJdcJ6PTAFRLuBHTWzxesDxzBYfs8IERmuo0Gc
 03s=
X-IronPort-AV: E=Sophos;i="5.75,327,1589270400"; 
   d="scan'208";a="52847563"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 08 Jul 2020 05:06:02 -0800
IronPort-SDR: vQ91E3efLjDL/Pcel0FCEkydF1TkB0qRh//ggnUj8fAmF/M5ENyBuS9urX43DIufRqg4SA/Evd
 GShtVaEPgWllaWEEdolheF9SzCCtVAneT8a8zWkR9XsqcVhGf07v+pYaEfBx312LupS6QBk3ke
 FPAwYGB/PQfMv6mnBNGeZWnSIf0xjfQ/ghCixWBM0i3gadSpK10tOdmW58Dg4EfdsS2zoUEY8V
 eXM5T3/Ce+ccWfNFBD8a6TrdvsBygalH3eCG0DyO7JXyqn5xSDBBTIpNi0IK49RsVIZ2aysUk9
 r0U=
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
Message-ID: <80fc7a3e-efd5-fab8-8ba8-8aa011944ab1@mentor.com>
Date:   Wed, 8 Jul 2020 22:05:56 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2f7964da-0dca-2d13-3559-28b4582a3278@mentor.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-06.mgc.mentorg.com (147.34.90.206) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

I am working on refining this series,
regarding your comment about drop changes related to
upload firmware and config during boot.

I found currently only config is uploaded during every boot.
but firmware is only uploaded when userspace asks to do so via
sysfs interface.

Could you help to confirm if this is the case?

Thanks,
Jiada

On 2020/06/25 22:50, Wang, Jiada wrote:
> Hello Dmitry
> 
> sorry for the delay,
> 
> On 2020/05/27 15:43, Dmitry Torokhov wrote:
>> Hi Jiada,
>>
>> On Thu, May 07, 2020 at 10:56:00PM -0700, Jiada Wang wrote:
>>> This patch-set forward ports Nick Dyer's work in ndyer/linux github
>>> repository as long as some other features and fixes
>>
>> Sorry for ignoring the series for quite a while. I guess my biggest
>> issue with the series is that quite a bit of patches are trying to
>> handle the fallout from a very unfortunate design decision in the
>> driver: the fact that it attempts to automatically upload firmware and
>> config on every boot/probe. This design was done at my urging because I
>> did not have access to the technical documentation and did not realize
>> that the controller has non-volatile memory for both firmware and
>> configuration. We should only attempt to automatically load firmware
>> where device does not have non-volatile memory and is unable function
>> otherwise, in all other cases we better leave it to userspace to decide
>> whether to execute firmware update and when. The kernel should only
>> provide facilities so that userspace can initiate firmware update. This
>> design has worked well for Chrome OS for many years (it used Atmel
>> controllers in several products), and I would like to bring it to the
>> mainline.
> 
> I agree with you, I will review the patch-set,
> and only pick these not related to firmware/cfg upload
> 
> Thanks,
> jiada
>>
>> Thanks.
>>
