Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DF42DEBF4
	for <lists+linux-input@lfdr.de>; Sat, 19 Dec 2020 00:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgLRXVV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 18:21:21 -0500
Received: from plasma4.jpberlin.de ([80.241.57.33]:33829 "EHLO
        plasma4.jpberlin.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgLRXVV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 18:21:21 -0500
Received: from spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115])
        by plasma.jpberlin.de (Postfix) with ESMTP id 69AB4AAC9A;
        Sat, 19 Dec 2020 00:20:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from plasma.jpberlin.de ([80.241.56.68])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id gb9lsDoZ1lJr; Sat, 19 Dec 2020 00:20:34 +0100 (CET)
Received: from webmail.opensynergy.com (unknown [217.66.60.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (Client CN "*.opensynergy.com", Issuer "Starfield Secure Certificate Authority - G2" (not verified))
        (Authenticated sender: opensynergy@jpberlin.de)
        by plasma.jpberlin.de (Postfix) with ESMTPSA id 19E0AAA9F0;
        Sat, 19 Dec 2020 00:20:34 +0100 (CET)
Subject: Re: [PATCH RESEND v2] virtio-input: add multi-touch support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mathias Crombez <mathias.crombez@faurecia.com>
References: <20201208210150.20001-1-vasyl.vavrychuk@opensynergy.com>
 <X8/4kRLsr8755i01@google.com>
From:   Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Message-ID: <c1f764da-9923-9073-0001-757587f53853@opensynergy.com>
Date:   Sat, 19 Dec 2020 01:20:30 +0200
MIME-Version: 1.0
In-Reply-To: <X8/4kRLsr8755i01@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SR-MAIL-02.open-synergy.com (10.26.10.22) To
 SR-MAIL-01.open-synergy.com (10.26.10.21)
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -7.00 / 15.00 / 15.00
X-Rspamd-Queue-Id: 69AB4AAC9A
X-Rspamd-UID: 2b4d75
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, Dmitry,

Thanks for you suggestion. I have sent v3 version of the patch where I 
have applied it.

Kind regards,
Vasyl

On 09.12.20 00:05, Dmitry Torokhov wrote:
> CAUTION: This email originated from outside of the organization.
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> Hi Vasyl,
> 
> On Tue, Dec 08, 2020 at 11:01:50PM +0200, Vasyl Vavrychuk wrote:
>> From: Mathias Crombez <mathias.crombez@faurecia.com>
>>
>> Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
>> input_handle_abs_event.
>>
>> Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
>> Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
>> Tested-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
>> ---
>> v2: fix patch corrupted by corporate email server
>>
>>   drivers/virtio/Kconfig        | 11 +++++++++++
>>   drivers/virtio/virtio_input.c |  8 ++++++++
>>   2 files changed, 19 insertions(+)
>>
>> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
>> index 7b41130d3f35..2cfd5b01d96d 100644
>> --- a/drivers/virtio/Kconfig
>> +++ b/drivers/virtio/Kconfig
>> @@ -111,6 +111,17 @@ config VIRTIO_INPUT
>>
>>         If unsure, say M.
>>
>> +config VIRTIO_INPUT_MULTITOUCH_SLOTS
>> +     depends on VIRTIO_INPUT
>> +     int "Number of multitouch slots"
>> +     range 0 64
>> +     default 10
>> +     help
>> +      Define the number of multitouch slots used. Default to 10.
>> +      This parameter is unused if there is no multitouch capability.
> 
> I believe the number of slots should be communicated to the guest by
> the host, similarly to how the rest of input device capabilities is
> transferred, instead of having static compile-time option.
> 
>> +
>> +      0 will disable the feature.
>> +
>>   config VIRTIO_MMIO
>>        tristate "Platform bus driver for memory mapped virtio devices"
>>        depends on HAS_IOMEM && HAS_DMA
>> diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
>> index f1f6208edcf5..13f3d90e6c30 100644
>> --- a/drivers/virtio/virtio_input.c
>> +++ b/drivers/virtio/virtio_input.c
>> @@ -7,6 +7,7 @@
>>
>>   #include <uapi/linux/virtio_ids.h>
>>   #include <uapi/linux/virtio_input.h>
>> +#include <linux/input/mt.h>
>>
>>   struct virtio_input {
>>        struct virtio_device       *vdev;
>> @@ -205,6 +206,7 @@ static int virtinput_probe(struct virtio_device *vdev)
>>        unsigned long flags;
>>        size_t size;
>>        int abs, err;
>> +     bool is_mt = false;
>>
>>        if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
>>                return -ENODEV;
>> @@ -287,9 +289,15 @@ static int virtinput_probe(struct virtio_device *vdev)
>>                for (abs = 0; abs < ABS_CNT; abs++) {
>>                        if (!test_bit(abs, vi->idev->absbit))
>>                                continue;
>> +                     if (input_is_mt_value(abs))
>> +                             is_mt = true;
>>                        virtinput_cfg_abs(vi, abs);
>>                }
>>        }
>> +     if (is_mt)
>> +             input_mt_init_slots(vi->idev,
>> +                                 CONFIG_VIRTIO_INPUT_MULTITOUCH_SLOTS,
>> +                                 INPUT_MT_DIRECT);
> 
> Here errors need to be handled.
> 
>>
>>        virtio_device_ready(vdev);
>>        vi->ready = true;
>> --
>> 2.23.0
>>
> 
> Thanks.
> 
> --
> Dmitry
> 
