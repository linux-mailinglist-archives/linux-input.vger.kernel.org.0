Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCA420F752
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 16:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389021AbgF3Oft (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 10:35:49 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:52203 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731427AbgF3Oft (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 10:35:49 -0400
IronPort-SDR: 5tvbdTmAquQ/S7OIcu6qtfXJgq78VdQKqQoiQFSVN1f9DTeSReU81YA1lRMBxWfY9NNQfSUoFZ
 Gozpp6rf+BYbR1nv//RgLZvqLTBm/noDwGqXGhaT+lAFp7UpUknbRlHhKqDt15xocE0mEdzeb8
 OcEOCZ3rMbXfnRQb+/8iw5nvnuJde7QFG97z1qCncp25nu9C9TMsSqoDG9NXDKdtz9jEGHkYv2
 T+gGoZXbjpuwVTUN4bz7Brz4+i5vQVKq3O66dY5fL+KAe31xYl/gaOlDQ0MpTRT5Ar4f7IljZN
 5yA=
X-IronPort-AV: E=Sophos;i="5.75,297,1589270400"; 
   d="scan'208";a="52594957"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 30 Jun 2020 06:35:48 -0800
IronPort-SDR: QUmpMKgQZBoOSLfOFlZ9GTo4BOiIkHBB4b/hUjS3lSgkZo54r1txVejdL12U3DJNjsyKwUNtPu
 sZGUlgf88b21raqVlpGqf4jIRHiMZh0wxPNsVOjTMWtlhfP1Ap7F+S+5uzARQH/6h+fGR7o/08
 swJEp5+d+mFlhm3h6MrngA6HC4eGtE6z1z/ESyxpesh+1rwi6Ap3mojh/aFly3UwC0O19eVjBp
 PYiGS0/oltTxgucZ77XisLoXQb5WcnuYPB2Ev15IIBCJ6W9ZOFZsLVAKXEpdfnBgY1s4uQwbbw
 aKQ=
Subject: Re: [PATCH v11 07/56] Input: atmel_mxt_ts - implement T9
 vector/orientation support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <nick@shmanahar.org>, <jikos@kernel.org>,
        <benjamin.tissoires@redhat.com>, <bsz@semihalf.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-8-jiada_wang@mentor.com>
 <20200511225306.GA89269@dtor-ws>
From:   "Wang, Jiada" <jiada_wang@mentor.com>
Message-ID: <56c34497-9306-17de-8d86-5a659aeccb1e@mentor.com>
Date:   Tue, 30 Jun 2020 23:35:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200511225306.GA89269@dtor-ws>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry

On 2020/05/12 7:53, Dmitry Torokhov wrote:
> On Thu, May 07, 2020 at 10:56:07PM -0700, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> The atmel touch messages contain orientation information as a byte in a
>> packed format which can be passed straight on to Android if the input
>> device configuration is correct.
> 
> No, unfortunately I can not accept this. Please convert to the proper
> format for ABS_MT_ORIENTATION as defined in
> Documentation/input/multi-touch-protocol.rst

I will remove this patch in next version

Thanks,
Jiada

> 
> Thanks.
> 
