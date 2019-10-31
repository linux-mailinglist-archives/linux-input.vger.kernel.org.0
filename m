Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF35EAB36
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 08:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfJaH73 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 31 Oct 2019 03:59:29 -0400
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com ([46.30.212.1]:22536
        "EHLO mailrelay2-2.pub.mailoutpod1-cph3.one.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726698AbfJaH73 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 31 Oct 2019 03:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmath.org; s=20140924;
        h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
         message-id:from:references:cc:to:subject:from;
        bh=rQso8MToqtRUHqnuedvZh5RwGvz7M/QcMmNwNECH16o=;
        b=OspqUJoQm272B+Sie2PXjMepoG81G/Y42QJLebL9rjUPa17nUeCWtCfLYXr+YilaEuVWnh4cAcpCj
         lQOvNWOWSDbjlVz8WwGrbRkLuZbNBI7pdCtQQt3GJ4QIF6mqfPdC2Iod3by4IN9oKJFkpeH+GNb22Y
         mnTFBuvBf4SNeLlU=
X-HalOne-Cookie: 43cc89dee2fd2bbb9ef64f88398e205b53a9986e
X-HalOne-ID: 5b34d043-fbb4-11e9-ba02-d0431ea8a290
Received: from [192.168.19.13] (unknown [98.128.166.173])
        by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
        id 5b34d043-fbb4-11e9-ba02-d0431ea8a290;
        Thu, 31 Oct 2019 07:59:25 +0000 (UTC)
Subject: Re: [PATCH v4 01/48] Input: introduce input_mt_report_slot_inactive
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiada Wang <jiada_wang@mentor.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com
References: <20191029072010.8492-1-jiada_wang@mentor.com>
 <20191029072010.8492-2-jiada_wang@mentor.com>
 <b3de4c05-d2d1-58f8-a447-d5e127574ac0@bitmath.org>
 <20191030232311.GK57214@dtor-ws>
From:   Henrik Rydberg <rydberg@bitmath.org>
Message-ID: <8bcc16bc-3726-0766-6ec7-213b165faf7e@bitmath.org>
Date:   Thu, 31 Oct 2019 09:01:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030232311.GK57214@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 2019-10-31 00:23, Dmitry Torokhov wrote:
> On Tue, Oct 29, 2019 at 06:13:09PM +0100, Henrik Rydberg wrote:
>> Hi Jiada,
>>
>>> input_mt_report_slot_state() ignores the tool when the slot is closed.
>>> which has caused a bit of confusion.
>>> This patch introduces input_mt_report_slot_inactive() to report slot
>>> inactive state.
>>> replaces all input_mt_report_slot_state() with
>>> input_mt_report_slot_inactive() in case of close of slot.
>>>
>>> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
>> NACK on this one.
>>
>> We already discussed this patch and the potentially changed behavior to
>> existing setups stemming from ignoring the MT state.
>>
>> On the upside, what I can see this patch does exactly no difference to the
>> cases where the MT state is set, so it can be safely dropped without
>> affecting the rest of the patch series.
> I guess Jiada's concern that we are forcing to pass tool type even
> though we end up ignoring it intervally, which confuses users of the API
> as they might not know what tool to specify.
>
> How about we do:
>
> static inline void input_mt_report_slot_inactive(struct input_dev *dev)
> {
> 	input_mt_report_slot_state(dev, 0, false);
> }
>
> This should not change any behavior.

Agreed, that will work.

Thanks,

Henrik


