Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7571C152212
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 22:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgBDVsS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 16:48:18 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:43150 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbgBDVsS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 16:48:18 -0500
Received: by mail-wr1-f54.google.com with SMTP id z9so12821282wrs.10
        for <linux-input@vger.kernel.org>; Tue, 04 Feb 2020 13:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:disposition-notification-to
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=uBbyUtv0KxpHUgwweiw0c4P0XHFDOZb+shIDvLHWHkQ=;
        b=b/VfdcEHdHiQva+CMdwnjgvawGuht4NNeDviBMPmqiIvfMDiqTt7opfKV0wx7tyxuD
         58rh3r0SPTQPWcsu+JfjFuUUWhYLwukk0zbHTMJZLs2l2OXPvRGVWcGbkSKy/E0cRRJL
         5+hSEQtrD8SW/O5Y/pgLRgtwhV8TZiPutpzRfYwHhmZzxnYO0kJ3PKYSOkcKhCqWq6uq
         rJdr5UILe6xmlNFsDp1P4kwM3pamutqXBnRc76lWSIb/d4ZgIzTdAHCi7nsDg6sh57IR
         QIFGTF5MjItvp8RfD4GupyBkptYwnAFxTIyqN5kY0ZrHQ85El0JmGqTlg4sYMpEnnXtG
         mNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id
         :disposition-notification-to:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=uBbyUtv0KxpHUgwweiw0c4P0XHFDOZb+shIDvLHWHkQ=;
        b=esXzecNMvT2yEB3t9ZGS1IOv5gC0baYV+kqRoPRzi3yL2ZQhzATE2leeHvf7Z5Supe
         lKb5hffSt70zrfKOTEWYzSQfxfmg8CPZRHfkWx2TdqglarMj+72YO8KPkIGLGBZqH0fZ
         RDa0sPDFYqe9p17b2qSd0ScmbuuXCOz2+uBTskV5KoclwTiyPuTZcqu7aJY7ZWme4evp
         kjhgyhR7ykHhtoAkS4pqsgRW4sUu356i7SstJlw8kukErxy0nry3MFeXU+NCGDtvLiJK
         pi235vRV/FQ4wJmoEHpxVt/wg6Kdv27QH31ALkuodKXbzBS8bUNN7Xsm0luCGsQhYOMT
         Hs6g==
X-Gm-Message-State: APjAAAWD9NARYAEzx9V9rEwpml1yLV5p2+WKTOaRs7sOaPJZq+Shkfn4
        uxdTT37v1dx6SfXIXGbcFaYBUHHh
X-Google-Smtp-Source: APXvYqyP0QCbbklI4fihpJn+60uxq9Q2I9dd+29tPIrtyXp505fZNDxDZipWs7SQQfErtPt0E4jFHw==
X-Received: by 2002:a5d:63c7:: with SMTP id c7mr26348041wrw.158.1580852896510;
        Tue, 04 Feb 2020 13:48:16 -0800 (PST)
Received: from [192.168.1.88] (ppp-94-68-6-242.home.otenet.gr. [94.68.6.242])
        by smtp.gmail.com with ESMTPSA id k16sm33933766wru.0.2020.02.04.13.48.15
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:48:15 -0800 (PST)
Subject: Re: Kernel support for joystick RAVCORE JAVELIN
From:   John Grs <johnpgrs@gmail.com>
To:     linux-input@vger.kernel.org
References: <ae53b87c-1544-bb6a-1d83-311ada4c580c@gmail.com>
 <55dfec8d-c9de-6295-0695-7fc0aa6533bc@gmail.com>
Message-ID: <9cba55e8-b88e-be30-5c9e-2cbeca881c4d@gmail.com>
Date:   Tue, 4 Feb 2020 23:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <55dfec8d-c9de-6295-0695-7fc0aa6533bc@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------7D2E2C8E449A7C16CB98FCC4"
Content-Language: el-GR
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.
--------------7D2E2C8E449A7C16CB98FCC4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Final version for Ravcore Javelin and VKB Gladiator MKII

Στις 5/8/19 10:50 μ.μ., ο John Grs έγραψε:
>
> Στις 23/4/19 4:30 π.μ., ο John Grs έγραψε:
>> After a couple of tries here my results.
>
> Still 2 problems, but at least the hat works.
>
> Problem 1) Only 7 of 8 direction works as for some reason the physical 
> maximum value doesn't work (the correct value must be 240-30=210 equal 
> to direction 7) so i put as logical maximum 14 and not the use 8 2) to 
> correct the opposite direction of hat report count = 2 (??)
>
>

--------------7D2E2C8E449A7C16CB98FCC4
Content-Type: text/x-csrc; charset=UTF-8;
 name="hid-ravcore.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="hid-ravcore.c"

// SPDX-License-Identifier: GPL-2.0-or-later
/*
 *  HID driver for Ravcore Javelin & VKB Joysticks
 *  Currently supported devices are:
 *
 *    Ravcore Javelin: v11C0 p5607
 *    VKB Gladiator MKII: v231d p0121
 *
 *  Copyright (c) 2019 John Grs <johnpgrs@gmail.com>
*/

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/hid.h>

#define USB_VENDOR_ID_RAVCORE		0x11C0
#define USB_DEVICE_ID_RAVCORE_VKB5607	0x5607
#define USB_VENDOR_ID_VKB     0x231d
#define USB_DEVICE_ID_GLADIATOR 0x0121

static const struct {
	__s32 x;
	__s32 y;
}  hid_hat_to_axis[] = {{ 0, 0}, { 0,-1}, { 1,-1}, { 1, 0}, { 1, 1}, { 0, 1}, {-1, 1}, {-1, 0}, {-1,-1}};

static __u8 *gladiator_report_fixup(struct hid_device *hdev, __u8 *rdesc,	unsigned int *rsize)
{
	hid_info(hdev, "Fix HAT for Gladiator MKII Joystick\n");
	rdesc[177]=0x08;		// Logigal Maximum = 8
	return rdesc;
}

static int gladiator_event(struct hid_device *hdev, struct hid_field *field, struct hid_usage *usage, __s32 value)
{
   struct input_dev *input = field->hidinput->input;

   if (usage->type == EV_ABS && usage->code == 16) {
      if (value > 239) { value=-1; } else { value /= 30; }
      value +=1;
      input_event(input, usage->type, usage->code, hid_hat_to_axis[value].x);
      input_event(input, usage->type, usage->code+1, hid_hat_to_axis[value].y);
      return 1;
   }
   return 0;
}

static const struct hid_device_id gladiator_devices[] = {
    { HID_USB_DEVICE(USB_VENDOR_ID_RAVCORE, USB_DEVICE_ID_RAVCORE_VKB5607) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_VKB, USB_DEVICE_ID_GLADIATOR) },
	{ }
};

MODULE_DEVICE_TABLE(hid, gladiator_devices);

static struct hid_driver gladiator_driver = {
	.name = "VKB Gladiator MKII",
	.id_table = gladiator_devices,
    .report_fixup = gladiator_report_fixup,
    .event = gladiator_event,
};

module_hid_driver(gladiator_driver);

MODULE_AUTHOR("John Grs <johnpgrs@gmail.com>");
MODULE_DESCRIPTION("VKB Gladiator MKII driver");
MODULE_LICENSE("GPL");

--------------7D2E2C8E449A7C16CB98FCC4--
