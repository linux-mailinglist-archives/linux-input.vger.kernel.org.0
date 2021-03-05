Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38FBF32DF3C
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 02:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCEBuj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 20:50:39 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:53453 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCEBuj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 20:50:39 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39659206"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 05 Mar 2021 09:50:38 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(177115:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 05 Mar 2021 09:50:37 +0800 (CST)
Received: from 192.168.33.11
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(2480:2:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 05 Mar 2021 09:50:35 +0800 (CST)
From:   "jingle" <jingle.wu@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     "'linux-kernel'" <linux-kernel@vger.kernel.org>,
        "'linux-input'" <linux-input@vger.kernel.org>,
        "'phoenix'" <phoenix@emc.com.tw>,
        "'dave.wang'" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw> <YDx8M4Rhdi8hW4EO@google.com> <1614647097.9201.jingle.wu@emc.com.tw> <YEGBeWHRfL4gN9pX@google.com> <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw> <YEGJ7z479pqyBW1w@google.com>
In-Reply-To: <YEGJ7z479pqyBW1w@google.com>
Subject: RE: [PATCH] Input: elan_i2c - Reduce the resume time for new dev ices
Date:   Fri, 5 Mar 2021 09:50:35 +0800
Message-ID: <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQGs01cKeSW+WSlGkCw6sJc3Mb/pawH5MxoQAdwxvXACK2QSBAIRtt8MAkDeqHiqdoFO8A==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYwMTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0yZDM3MjQ2Ni03ZDU1LTExZWItOGUwZi1mMDc5NTk2OWU3NWVcYW1lLXRlc3RcMmQzNzI0NjgtN2Q1NS0xMWViLThlMGYtZjA3OTU5NjllNzVlYm9keS50eHQiIHN6PSIxNDMxIiB0PSIxMzI1OTM4MjYzNTkzNjg3NzQiIGg9IjBnbUVkenFod3UvUndLN003TVhReUxmVXVraz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HI Dmitry:

1. You mean to let all devices ignore skipping reset/sleep part of device
initialization?
2. The test team found that some old firmware will have errors (invalid
report etc...), so ELAN can only ensure that the new device can meet the
newer parts.

Thanks
jingle

-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Friday, March 05, 2021 9:31 AM
To: jingle
Cc: 'linux-kernel'; 'linux-input'; 'phoenix'; 'dave.wang'; 'josh.chen'
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev
ices

Hi Jingle,

On Fri, Mar 05, 2021 at 09:24:05AM +0800, jingle wrote:
> HI Dmitry:
> 
> In this case (in the newer parts behavior regarding need to reset 
> after powering them on), it is consistent with the original driver 
> behavior with any new or old device (be called 
> data->ops->initialize(client) : usleep(100) , etc.. , because this 
> times "data->quirks" is equal 0 at probe state.)

You misunderstood my question. I was asking what specifically, if anything,
was changed in the firmware to allow skipping reset/sleep part of device
initialization on newer parts during resume process. Because of there were
no specific changes I would say let's not do a quirk and change the driver
to skip reset on resume.

Thanks.

--
Dmitry

