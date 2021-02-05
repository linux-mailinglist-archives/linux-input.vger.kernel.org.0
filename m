Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A233103E1
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 04:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhBEDwc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 22:52:32 -0500
Received: from mail-pf1-f171.google.com ([209.85.210.171]:38757 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhBEDwb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Feb 2021 22:52:31 -0500
Received: by mail-pf1-f171.google.com with SMTP id d26so2227603pfn.5;
        Thu, 04 Feb 2021 19:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PUgTmQjg/F/6InB3//OtXUQJ9eXEdUj+c8K+WJcFafw=;
        b=F3tz+2an+grok/uDff+BdMZF1h7zw0HflQGc8y1/qR3+pi2k/3675RHXVbkqaEZFXA
         G09HOG/0ygBjeoI6hgSLjMERbqVu5zJ8HiQLzgj7QSr74QVjQQ77DpJUx6+4tnlfWnYK
         rlfatVZi95oOxlbbSI1aaOvy8vBd369yL07aMvd+zUA5tvYACzbMen8ifDWxn3sdviJm
         Z1o5c4KEx1877vX2LpcF3TPOZhCwfXLTCbOPizLTx0RmVKndRIg+F10M9PIs8qHwgsjd
         hxcxfvgXaVvUDqzf27YzOmdyrW2tQZ4/hENBn5ydMB32Y03uKGbbCkHZop8dz7dD8JH0
         2mOA==
X-Gm-Message-State: AOAM533GK/9eSLU9tVL4cRy0LWmw0IiOuax+haXyZ0Qqte/WJdmPL3rP
        04fEQ2rvKxyVVq9qn8sA9/M54mNLmnLWpg==
X-Google-Smtp-Source: ABdhPJxg8wQ3A/EiNaMHd6Ag38vW7KVOGTfIiKpn26WVMFBcri374acTRm4xV5rpuuwoQVGeoMIQjA==
X-Received: by 2002:a05:6a00:15cc:b029:1ba:5282:3ab8 with SMTP id o12-20020a056a0015ccb02901ba52823ab8mr2453895pfu.77.1612497109871;
        Thu, 04 Feb 2021 19:51:49 -0800 (PST)
Received: from [10.101.46.49] (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id h8sm844123pfv.154.2021.02.04.19.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 19:51:48 -0800 (PST)
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Tiger Lake H PCI device ID
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210204083315.122952-1-vicamo.yang@canonical.com>
 <85a4e6e61ac977d0d00dd9140a9e85f1102b3a6d.camel@linux.intel.com>
From:   You-Sheng Yang <vicamo.yang@canonical.com>
Message-ID: <57544f34-0e90-359c-766f-affcf890664a@canonical.com>
Date:   Fri, 5 Feb 2021 11:51:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <85a4e6e61ac977d0d00dd9140a9e85f1102b3a6d.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2/4/21 11:13 PM, Srinivas Pandruvada wrote:
> On Thu, 2021-02-04 at 16:33 +0800, You-Sheng Yang wrote:
>> Added Tiger Lake H PCI device ID to the supported device list.
>>
>> Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
> Did you get chance to verify on a platform?
> Do you see sensors enumerated in /sys/bus/iio?

Yes,

[    2.485650] ish-hid {33AECD58-B679-4E54-9BD9-A04D34F0C226}:
[hid-ish]: enum_devices_done OK, num_hid_devices=3
[    2.497337] hid-generic 001F:8087:0AC2.0003: hidraw2: <UNKNOWN> HID
v2.00 Device [hid-ishtp 8087:0AC2] on
[    2.506945] hid-generic 001F:8087:0AC2.0004: hidraw3: <UNKNOWN> HID
v2.00 Device [hid-ishtp 8087:0AC2] on
[    2.512127] hid-generic 001F:8087:0AC2.0005: hidraw4: <UNKNOWN> HID
v2.00 Device [hid-ishtp 8087:0AC2] on

$ ls /sys/bus/iio/devices/
iio:device0  iio:device1  trigger0  trigger1

One of them is an ambient light sensor, and it works only with this
patch applied.

Thanks,
You-Sheng Yang

> Thanks,
> Srinivas
> 
>> ---
>>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  | 1 +
>>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 1 +
>>  2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
>> b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
>> index 1fb294ca463e..21b0e6123754 100644
>> --- a/drivers/hid/intel-ish-hid/ipc/hw-ish.h
>> +++ b/drivers/hid/intel-ish-hid/ipc/hw-ish.h
>> @@ -27,6 +27,7 @@
>>  #define CMP_H_DEVICE_ID		0x06FC
>>  #define EHL_Ax_DEVICE_ID	0x4BB3
>>  #define TGL_LP_DEVICE_ID	0xA0FC
>> +#define TGL_H_DEVICE_ID		0x43FC
>>  
>>  #define	REVISION_ID_CHT_A0	0x6
>>  #define	REVISION_ID_CHT_Ax_SI	0x0
>> diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> index c6d48a8648b7..6dea657b7b15 100644
>> --- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> +++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
>> @@ -37,6 +37,7 @@ static const struct pci_device_id ish_pci_tbl[] = {
>>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, CMP_H_DEVICE_ID)},
>>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, EHL_Ax_DEVICE_ID)},
>>  	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_LP_DEVICE_ID)},
>> +	{PCI_DEVICE(PCI_VENDOR_ID_INTEL, TGL_H_DEVICE_ID)},
>>  	{0, }
>>  };
>>  MODULE_DEVICE_TABLE(pci, ish_pci_tbl);
> 
