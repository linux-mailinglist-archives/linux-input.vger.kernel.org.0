Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBD920F74B
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 16:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388849AbgF3OdW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 10:33:22 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:14882 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgF3OdV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 10:33:21 -0400
IronPort-SDR: Sx7dUYS6bHKFB6uvKyaW+aAw/Bh3wv4s/VWnNQBasGq98XyW61FXZFNzVQy0sxNtwfCJA8lf+w
 XHicYc89AXt74c3rqq1NrTUKTThMvpQH2If8HrsRDkWTimcJeClie6sAtb4pr4yLk0445xZwGH
 KDQlIpSMpj2A6t9HFl2vAhM9zQWi+JxcxppkRGN1OOSmz6QwqcZY+5DuWCO1IOA5k6F7xFLZ+D
 DtDzVkh+v7lSNLSjJTmCOqTQj9hcU15txyYay73o5XNX4c6b8eWZF+5eyj/OPGV4U9IiGGl5F2
 uWI=
X-IronPort-AV: E=Sophos;i="5.75,297,1589270400"; 
   d="scan'208";a="50445322"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 30 Jun 2020 06:33:20 -0800
IronPort-SDR: mTOVsIjs++7cBQux/tpRV+BAPba1dfsX/WvHhC8/55cpPV8NtaaYImlGIDdcSsmpYke0zjFRUV
 KKbURtO5oV8A7yoz8k8LYbtFFBsftu13LslXN3MGqPbXciPTUed2aqtW1mT00qdhPftggDmo18
 1QqlLC72M7lc9EhsefWnehVIqPC6EA2ttqwTnDe0e7bT5z4kOJqavksttGULkh+51TkpHNz6S5
 a05T8HuQGRluZ1oktp94mLvKrUy2ptEXiN29wq4vqIpA1SIrFQPSSW/LSwqZZkgZMlOYJIcSn2
 TmE=
Subject: Re: [PATCH v11 04/56] Input: atmel_mxt_ts - split large i2c transfers
 into blocks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-5-jiada_wang@mentor.com>
 <20200511221913.GY89269@dtor-ws>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <4b7fbb6d-4f64-6d23-38a0-636f144df6a7@mentor.com>
Date:   Tue, 30 Jun 2020 23:33:15 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200511221913.GY89269@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/12 7:19, Dmitry Torokhov wrote:
> Hi Jiada, Nick,
> 
> On Thu, May 07, 2020 at 10:56:04PM -0700, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> On some firmware variants, the size of the info block exceeds what can
>> be read in a single transfer.
> 
> Is this limitation of the mXT controller or maybe it is issue with
> implementation of the particular i2c adapter and should be dealt with
> there?
> 
This patch was authored by Nick,
but I assume it is trying to address issue due to I2C adapter limitation
which following patch in this series is already doing
"Input: atmel_mxt_ts: Limit the max bytes transferred in an i2c transaction"

I will extend patch "Input: atmel_mxt_ts: Limit the max bytes 
transferred in an i2c transaction"
to also cover this case.

Thanks,
Jiada

> Thanks.
> 
