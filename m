Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE1A6332939
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 15:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhCIOyM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 9 Mar 2021 09:54:12 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:51513 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbhCIOxo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Mar 2021 09:53:44 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="39719638"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 09 Mar 2021 22:53:35 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(9025:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 09 Mar 2021 22:53:35 +0800 (CST)
Received: By OpenMail Mailer;Tue, 09 Mar 2021 22:53:34 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
Reply-To: "jingle.wu" <jingle.wu@emc.com.tw>
Subject: RE: [PATCH] Input: elan_i2c - Reduce the resume time for new dev
         ices
Message-ID: <1615301614.16870.jingle.wu@emc.com.tw>
In-Reply-To: <00ce01d714ef$2598f740$70cae5c0$@emc.com.tw>
References: <20210226073537.4926-1-jingle.wu@emc.com.tw>
        <YDx8M4Rhdi8hW4EO@google.com>
        <1614647097.9201.jingle.wu@emc.com.tw>
        <YEGBeWHRfL4gN9pX@google.com>
        <004f01d7115e$3ba005e0$b2e011a0$@emc.com.tw>
        <YEGJ7z479pqyBW1w@google.com>
        <005401d71161$ef9b20e0$ced162a0$@emc.com.tw>
        <YEWXcV62YpxbBp9P@google.com>
        <005d01d713f8$e4b715a0$ae2540e0$@emc.com.tw>
        <YEbRazfF0iTreYYz@google.com>
        <00ce01d714ef$2598f740$70cae5c0$@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>
Cc:     "'linux-kernel'" <linux-kernel@vger.kernel.org>,
        "linux-input" <linux-input@vger.kernel.org>,
        "'phoenix'" <phoenix@emc.com.tw>,
        "dave.wang" <dave.wang@emc.com.tw>,
        "'josh.chen'" <josh.chen@emc.com.tw>
Date:   Tue, 09 Mar 2021 22:53:34 +0800 (CST)
MIME-Version: 1.0
Content-Type: text/plain; charset=big5
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

Was this the only issue with the updated patch? Did it work for you
otherwise?
-> Yes, the updated patch can work successfully after fix this issue.

THANKS
JINGLE

-----Original Message-----
From: 'Dmitry Torokhov' [mailto:dmitry.torokhov@gmail.com] 
Sent: Tuesday, March 09, 2021 9:38 AM
To: jingle
Cc: 'linux-kernel'; 'linux-input'; 'phoenix'; 'dave.wang'; 'josh.chen'
Subject: Re: [PATCH] Input: elan_i2c - Reduce the resume time for new dev
ices

Hi Jingle,

On Mon, Mar 08, 2021 at 04:56:14PM +0800, jingle wrote:
> Hi Dmitry:
> 
> 1. missing "i<" 
> +	u32 quirks = 0;
> +	int i;
> +
> +	for (i = 0; ARRAY_SIZE(elan_i2c_quirks); i++) {
> 
> -> for (i = 0; i<ARRAY_SIZE(elan_i2c_quirks); i++) {

Yes, you are right of course. Was this the only issue with the updated
patch? Did it work for you otherwise?

> 
> 2. elan_resume () funtion are different with at Chromeos driver.
> @@ -1384,7 +1422,7 @@ static int __maybe_unused elan_resume(struct 
> device
> *dev)
>  		goto err;
>  	}
>  
> -	error = elan_initialize(data);
> +	error = elan_initialize(data, data->quirks &
> ETP_QUIRK_QUICK_WAKEUP);
>  	if (error)
>  		dev_err(dev, "initialize when resuming failed: %d\n",
error);
> 
> -> https://chromium.googlesource.com/chromiumos/third_party/kernel/+/r
> -> ef
> -> s/heads/chromeos-5.4/drivers/input/mouse/elan_i2c_core.c#1434
> -> error = elan_initialize(data);  this code is in elan_reactivate()
> function at Chromeos driver.
> -> Will this change affect cherrypick from linux kernel to chromeos?

Yes, we would need to adjust the patch for Chrome OS and have
elan_reactivate() to call elan_initialize() with appropriate argument.

Thanks.

--
Dmitry

