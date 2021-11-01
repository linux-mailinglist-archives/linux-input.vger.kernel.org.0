Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAA84419B2
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 11:18:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbhKAKUk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 06:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31504 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231971AbhKAKUh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 06:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635761884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t8Sm9HXpoY+wnApkw9cdN5nEGyroNsODGV64LEXlImU=;
        b=QJzRFXq5+PM1FuDyYvnIb1vs7xfHTru7WhGOAacg4Py5F4BapL7I/OAPRD04k7Av7Fjy5d
        U+gaT2irkS6+lO0k49FVxpvMpLxmgZldO+4XmtNlyhnnnTmEAkJe3FWI0ydUU7pigzyQwv
        pXfpwTDU4+j15XPdmCs0RqnYUGOILCY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-X5PbCuzsOfGTtj3in_PZIQ-1; Mon, 01 Nov 2021 06:18:01 -0400
X-MC-Unique: X5PbCuzsOfGTtj3in_PZIQ-1
Received: by mail-ed1-f71.google.com with SMTP id y20-20020a056402359400b003e28c9bc02cso2121087edc.9
        for <linux-input@vger.kernel.org>; Mon, 01 Nov 2021 03:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t8Sm9HXpoY+wnApkw9cdN5nEGyroNsODGV64LEXlImU=;
        b=Dhky5ZF9sjYTUSbjruoIX2simK1NdtDscsMxg0ttdU8HifalIh0bjxR2VMmLHiQMEa
         Pq69NqocRAwNLyvRaQUGU8IMtQnGbGBsSnQ4W/S22TTc/0mTmOwCp1/vjlZksKEp7vSL
         W/ix/TgeR0Fe1CpYdM5sCA7jA/7hTyJ9uRXPb2SR2VOc/GfOExOqwIqqvrL6LpBcHewQ
         MtjkgxAiWpJ8KVMy66XfY7sSGd6AVwd4wTeLV2MQpI4jVZzbUzY9sDU4P7PndtxSrTAF
         ZOG2lrxt08VmUydr/xTM3D/hSNxbmj+0u8bMZSiCyEo93LF1C9oOkBnluxnQ3F5rgIQZ
         PtwA==
X-Gm-Message-State: AOAM532gN3ZXsLBjjOGXs02KtiJF2BAn5gAmhrv3vsoD2tVrQOhmXYae
        KdHs922fZruuiu4V4zeVJLBPQ3tc4dOl5TtzOQ3y6Fz0k2wsHk7jwmwx1Y8h5LTG4x2bHakbXmF
        BoZXLtiSIkfzudBr+tIU+n+8=
X-Received: by 2002:a50:c3cc:: with SMTP id i12mr38896958edf.350.1635761880226;
        Mon, 01 Nov 2021 03:18:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLTMXj/xrDkTc55/Af5ghVcv9Wfd3h/yRX5qwExFSuQKoulSOVSq39LvBNgVoIKunuT/+yQg==
X-Received: by 2002:a50:c3cc:: with SMTP id i12mr38896934edf.350.1635761880093;
        Mon, 01 Nov 2021 03:18:00 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id gt36sm6751027ejc.13.2021.11.01.03.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 03:17:59 -0700 (PDT)
Message-ID: <85cb78cd-92d9-69ed-9360-f5d6f8f904af@redhat.com>
Date:   Mon, 1 Nov 2021 11:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/6] MODULE_DEVICE_TABLE() support for the ISHTP bus
Content-Language: en-US
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Rushikesh S Kadam <rushikesh.s.kadam@intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <20211029152901.297939-1-linux@weissschuh.net>
 <883db585-c9bb-5255-4ddd-f093616af1a1@redhat.com>
 <1bb82b37-06e4-4937-ba0d-57fd301eaf2e@t-8ch.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1bb82b37-06e4-4937-ba0d-57fd301eaf2e@t-8ch.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 11/1/21 11:12, Thomas Weißschuh wrote:
> On 2021-11-01 10:56+0100, Hans de Goede wrote:
>> On 10/29/21 17:28, Thomas Weißschuh wrote:
>>> Currently as soon as any ISHTP device appears all available ISHTP device
>>> drivers are loaded automatically.
>>> This series extends the MODULE_DEVICE_TABLE() functionality to properly handle
>>> the ishtp bus and switches the drivers over to use it.
>>>
>>> Patch 1 adds the infrastructure to handle ishtp devices via MODULE_DEVICE_TABLE()
>>> Patch 2 replaces some inlined constants with ones now defined by mod_devicetable.h
>>> Patches 3-6 migrate all ishtp drivers to MODULE_DEVICE_TABLE()
>>>
>>> Note: This patchset is based on the pdx86/for-next tree because that contains
>>> one of the drivers that is not yet in the other trees.
>>
>> Since most of the changes here are under drivers/hid and since the latter
>> patches depend on 1/6, I believe it would be best to merge the entire series
>> through the HID tree, here is my ack for this:
>>
>> Acked-by: Hans de Goede <hdegoede@redhat.com>
> 
> Please note that patch 6 modifies a driver that is not yet available in the HID
> and 5.15 trees but only in pdx86/for-next.

Right, but given where we are in the cycle this is going to be something to
merge post 5.16-rc1 anyways which resolves the dependency issue.

I guess it might be good to send this our in a later pull-req as a fix series
for a later 5.16-rc# though, to avoid the eclite and chrome-ec drivers from
autoloading on all systems with an ISH, even though they usually will not be
used there.

Regards,

Hans

