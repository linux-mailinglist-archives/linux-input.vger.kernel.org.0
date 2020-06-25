Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D75E20A04D
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 15:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404937AbgFYNu4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 09:50:56 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:27460 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404803AbgFYNu4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 09:50:56 -0400
IronPort-SDR: 6iKE5uuaWB8s3Hutxs+7krh///GWOC1lHF3rmlQim5bbGtvrep5jaoP7dhUSCxh76EdzzgHysz
 3d+IHjwLvSuRck7hlivhFnkY72SuYI1HByzVk4CceNvE99vvL32McWcg28UO3MOFKHwSQvM8oc
 XyVFLg28IREzuVyJ9NQHYHpSswa8jD9sAL4YGwE4RljVtS4HAe55HHux53RADyB8E6Oyp+wB1o
 PTwLnJAJhsTnWRgQyH2FlSj6xXEiPjE7wBuFdrd18jay0dTZqJ6/9FuTArVAIxWMgkP41BwcmA
 /k4=
X-IronPort-AV: E=Sophos;i="5.75,279,1589270400"; 
   d="scan'208";a="50311698"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Jun 2020 05:50:55 -0800
IronPort-SDR: YNW2iLDxJT7b7gRTlTexBmc0jFGCY8AO5eUVe7CIGZhds5fBJ80JMie2uvZudrTfOcxKQ98toH
 HGifkF6yZDKna8M4EaVOkwM4W+n10y6X1hFhRyG2HzFdOl9ZZnC94DBg+VAxTqZVk//j+AtqvU
 D+qiKxRCU3R4cw+OfK3DjjRsTavlm7s1khZv58+zkEpFhk6C4gm9xCOgxx1FYbOesUkw5HrF6P
 yMS4ELlABnUBawqHtNTXCgckacEBvECFen95ufGPd6M7QSx4pn64z3oB6k8e6AEpuHkfZ404/p
 FGQ=
Subject: Re: [PATCH v11 00/56] atmel_mxt_ts misc
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200527064307.GK89269@dtor-ws>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <2f7964da-0dca-2d13-3559-28b4582a3278@mentor.com>
Date:   Thu, 25 Jun 2020 22:50:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200527064307.GK89269@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

sorry for the delay,

On 2020/05/27 15:43, Dmitry Torokhov wrote:
> Hi Jiada,
> 
> On Thu, May 07, 2020 at 10:56:00PM -0700, Jiada Wang wrote:
>> This patch-set forward ports Nick Dyer's work in ndyer/linux github
>> repository as long as some other features and fixes
> 
> Sorry for ignoring the series for quite a while. I guess my biggest
> issue with the series is that quite a bit of patches are trying to
> handle the fallout from a very unfortunate design decision in the
> driver: the fact that it attempts to automatically upload firmware and
> config on every boot/probe. This design was done at my urging because I
> did not have access to the technical documentation and did not realize
> that the controller has non-volatile memory for both firmware and
> configuration. We should only attempt to automatically load firmware
> where device does not have non-volatile memory and is unable function
> otherwise, in all other cases we better leave it to userspace to decide
> whether to execute firmware update and when. The kernel should only
> provide facilities so that userspace can initiate firmware update. This
> design has worked well for Chrome OS for many years (it used Atmel
> controllers in several products), and I would like to bring it to the
> mainline.

I agree with you, I will review the patch-set,
and only pick these not related to firmware/cfg upload

Thanks,
jiada
> 
> Thanks.
> 
