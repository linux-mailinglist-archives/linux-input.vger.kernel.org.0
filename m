Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9757E66E12A
	for <lists+linux-input@lfdr.de>; Tue, 17 Jan 2023 15:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjAQOq1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Jan 2023 09:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjAQOqZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Jan 2023 09:46:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CBD5B90
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 06:46:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9BCD61469
        for <linux-input@vger.kernel.org>; Tue, 17 Jan 2023 14:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62A04C433EF;
        Tue, 17 Jan 2023 14:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673966783;
        bh=EwJ3yqGrp+xsLubFKZO2Ldpy6yzlycg6MAYr3/agyCU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=e+EnifccDHf5NnhmDJ17AHblWwiJ1A6d/2hf+BtUaJO6BcIw0wVzPPr7Q2geNAm6G
         i6Zjmw8yOJ10Hm9DNo1GxZsDHiV7qJe4NW4NhB/qPoTxX9D0wrBGGgn/b3daBjlfbl
         zjAIJTYjGn4b30JMV8P9IHvPQ/axHDqND+ZHIgUVhE9HmfktG9t0eoctv46bWoaCoV
         AhwrbqZfB3EWuJ5nvp5xMTtO6/Fj9ujwE/CmNMUu8YR39tu8GtqB3ml2ndB3+64rXy
         ik+jA2sTmUsr8EUieyXys3SMccnjQ8izLywZr6k5uJS6DXqq35oc7k5bfxAKif/e9U
         3ucfxLlNMu8Vw==
Date:   Tue, 17 Jan 2023 15:46:23 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christian Zigotzky <chzigotzky@xenosoft.de>
cc:     anpatel@nvidia.com, linux-input@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Darren Stevens <darren@stevens-zone.net>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit
 "HID: usbhid: Add ALWAYS_POLL quirk for some mice"
In-Reply-To: <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
Message-ID: <nycvar.YFH.7.76.2301171545590.1734@cbobk.fhfr.pm>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de> <75f18191-c311-18f2-bfdb-ac82fb166e1b@xenosoft.de> <nycvar.YFH.7.76.2301061540530.1734@cbobk.fhfr.pm> <aafbda4b-3a1a-cf7d-0a29-ba0b8b4adc4e@xenosoft.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Jan 2023, Christian Zigotzky wrote:

> >> The reboot issue is still present in the RC2 of kernel 6.2. We still need
> >> the
> >> usbhid.patch. [1]
> >>
> >> Please check the bad commit. [2]
> > Ankit,
> >
> > have you tested with all the devices that you added the quirk for in your
> > original patch?
> >
> > Unless I hear otherwise, I will just drop
> > the quirk for USB_DEVICE_ID_CHERRY_MOUSE_000C before this gets clarified.
> >
> > Thanks,
> >
> The issue also affects the RC4.

Given the lack of input from Ankit, I have just queued the patch below in 
for-6.2/upstream-fixes.


From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: revert CHERRY_MOUSE_000C quirk

This partially reverts commit f6d910a89a2391 ("HID: usbhid: Add ALWAYS_POLL quirk
for some mice"), as it turns out to break reboot on some platforms for reason
yet to be understood.

Fixes: f6d910a89a2391 ("HID: usbhid: Add ALWAYS_POLL quirk for some mice")
Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-ids.h    | 1 -
 drivers/hid/hid-quirks.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 82713ef3aaa6..c3735848ed5d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -274,7 +274,6 @@
 #define USB_DEVICE_ID_CH_AXIS_295	0x001c
 
 #define USB_VENDOR_ID_CHERRY		0x046a
-#define USB_DEVICE_ID_CHERRY_MOUSE_000C	0x000c
 #define USB_DEVICE_ID_CHERRY_CYMOTION	0x0023
 #define USB_DEVICE_ID_CHERRY_CYMOTION_SOLAR	0x0027
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e9702c7f7d6..be3ad02573de 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -54,7 +54,6 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_FLIGHT_SIM_YOKE), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_PEDALS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CH, USB_DEVICE_ID_CH_PRO_THROTTLE), HID_QUIRK_NOGET },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_CHERRY, USB_DEVICE_ID_CHERRY_MOUSE_000C), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K65RGB_RAPIDFIRE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K70RGB), HID_QUIRK_NO_INIT_REPORTS },

-- 
Jiri Kosina
SUSE Labs

