Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B980FA676
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 03:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbfKMCaF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 21:30:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55800 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbfKMCaE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 21:30:04 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F26D4611AD; Wed, 13 Nov 2019 02:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573612204;
        bh=z2r5uWIsjDvxKFVEHYoB49j8sCNktDPwByXTjPf6Wzo=;
        h=From:To:Cc:Subject:Date:From;
        b=iZR8PCI6qvpQ3oSaMUW+0bcn3WuxdAi72hYNtZgu6HW6lW+7Pq31Ul4nGYAVl5d+t
         RM/MC7Q4Oew2ravc5DG6nE+SOOMxoEYLajLAA7P0n4WH2oEr52hpqUVgKMqxbOtDEG
         osTNIXjP809D/ix6rfpvqCVLXkMW5rd7r3FcAgIQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.169.100] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DCB5612DD;
        Wed, 13 Nov 2019 02:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573612201;
        bh=z2r5uWIsjDvxKFVEHYoB49j8sCNktDPwByXTjPf6Wzo=;
        h=From:To:Cc:Subject:Date:From;
        b=mawd8vkztFVhWwO+zcRd9np6hEhSYUYDcv2+zpMiept3DIXyr833mZX653DY421Qt
         CKU2gvIkR1y43y/Zrllh1J1pffSWT5hWxWz2bwf1k09vXrFlTsP7IS+Xl4qDggkjob
         lSornY0oWzf3uCLulhyVIbOCdrA0H/g4MwsphLiE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DCB5612DD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org, prsood@codeaurora.org,
        gkohli@codeaurora.org
Subject: Query regarding hid-multitouch.c driver in 4.14/4.19
Message-ID: <e1e05bd3-19f5-0dfe-66ad-70717c1c29c6@codeaurora.org>
Date:   Wed, 13 Nov 2019 07:59:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I have one query regarding hid-multitouch.c driver and need your guidance on
how hid-multitouchc can restore/support the original behaviour, where, for
devices, for which application is not 
HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD, and has
HID_DG_CONTACTID usage in its report, can still use generic input mappings.

We are using kernel versions 4.14 , 4.19 respectively in 2 different 
projects:

4.14: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.14.153
4.19: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/hid/hid-multitouch.c?h=v4.19.83

I checked the application for our hid device, it's HID_DG_PEN, device 
also has a HID_DG_CONTACTID usage defined in

its report.

In 4.19, is_mt_collection is set to 'true'. All multitouch code paths or 
input mapping is configured

mt_allocate_report_data()
         ...
         for (n = 0; n < field->report_count; n++) {
                         if (field->usage[n].hid == HID_DG_CONTACTID)
                                 rdata->is_mt_collection = true;   // 
is_mt_collection is set to 'true'
                 }
         }

mt_input_mapping()
         ...
         if (rdata->is_mt_collection)
             return mt_touch_input_mapping(...)  // 
mt_touch_input_mapping() is called

mt_event()
         if (rdata && rdata->is_mt_collection)
             return mt_touch_event();  // mt_touch_event() is called

However, in 4.14, the behaviour was different, mt input mapping was done 
only
for HID_DG_TOUCHSCREEN/HID_DG_TOUCHPAD , and because our hid device is
HID_DG_PEN, generic mappings were applied for it; with these settings, 
device
responds to events.

static int mt_input_mapping()
         if (field->application == HID_DG_TOUCHSCREEN ||
             field->application == HID_DG_TOUCHPAD)
             return mt_touch_input_mapping();  // This is not called.


mt_touch_input_mapping()
         case HID_DG_CONTACTID:
                         mt_store_field(usage, td, hi);
                         td->touches_by_report++;
                         td->mt_report_id = field->report->id; // 
mt_report_id is not set.
                         return 1;


Looks like this behaviour changed, with below commits:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=8dfe14b3b47ff832cb638731f9fc696a3a84f804
8dfe14b3b47f    HID: multitouch: ditch mt_report_id
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/hid/hid-multitouch.c?h=v4.19.83&id=ba6b055e0f3b4ff4942e4ab273260affcfad9bff
ba6b055e0f3b     HID: input: enable Totem on the Dell Canvas 27

Can you please suggest on how we can support/preserve the original 
behaviour?


Thanks
Neeraj

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation

