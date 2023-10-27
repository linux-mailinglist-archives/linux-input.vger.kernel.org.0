Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73927D99E1
	for <lists+linux-input@lfdr.de>; Fri, 27 Oct 2023 15:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbjJ0Ndt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Oct 2023 09:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbjJ0Nds (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Oct 2023 09:33:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C78EE5
        for <linux-input@vger.kernel.org>; Fri, 27 Oct 2023 06:33:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F92CC43391;
        Fri, 27 Oct 2023 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698413625;
        bh=9FFrFTYZym3nQdbLcR9Jc3LJShCxwAVQ1yNyGSJrGKo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QOQuNq1q5Dndb4nr6mab581Sdf4NoDpf7TUXhZSiqFqrMPORCNL6tR2wkPRhAYJIO
         fEHlfrCQYU0Hgp5aoCD+NlYSwhloocCCbP1rtK1lDbSkIFQGZgXcVjkW2nIwGWUCEC
         qBTjvbjooZBSPqd8JYnnVyG541A0LZHYJkjmcqqRIkLqU5kOLHIgob8mGD0X9pC+Cm
         UtlIbNH91mVtUJfdQxxZsJ4CFFSjTZbBMFv5zhWIkPMzprK71chjgY8rkIaWo9w5jn
         6xp/noWp/b1CaZcCimvuP6BtvxEZLx6rV2hXwgj+uIdipKVRHdOQOB8g4nD7O2k9B3
         XIh6UKsNjJ1Ow==
Date:   Fri, 27 Oct 2023 15:33:42 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Robert Ayrapetyan <robert.ayrapetyan@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: Dell Pro Wireless Keyboard and Mouse KM5221W require
 HID_QUIRK_ALWAYS_POLL patch
In-Reply-To: <CAAboi9vHvg8++oei61Ti4osPZ-fQ_FXVkSo1oPRxhY6CpZmW7A@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2310271533070.3534@cbobk.fhfr.pm>
References: <CAAboi9vHvg8++oei61Ti4osPZ-fQ_FXVkSo1oPRxhY6CpZmW7A@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 17 Aug 2023, Robert Ayrapetyan wrote:

> Dell Pro Wireless Keyboard and Mouse KM5221W constantly reconnect with a
> following error messages:

This totally fell in between cracks, sorry for that. I have now applied 
the patch below, thanks a lot for the report.

From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 27 Oct 2023 15:32:09 +0200
Subject: [PATCH] HID: Add quirk for Dell Pro Wireless Keyboard and Mouse KM5221W

This device needs ALWAYS_POLL quirk, otherwise it keeps reconnecting
indefinitely.

Reported-by: Robert Ayrapetyan <robert.ayrapetyan@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e4d2dfd5d253..f7973ccd84a2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -366,6 +366,7 @@
 
 #define USB_VENDOR_ID_DELL				0x413c
 #define USB_DEVICE_ID_DELL_PIXART_USB_OPTICAL_MOUSE	0x301a
+#define USB_DEVICE_ID_DELL_PRO_WIRELESS_KM5221W		0x4503
 
 #define USB_VENDOR_ID_DELORME		0x1163
 #define USB_DEVICE_ID_DELORME_EARTHMATE	0x0100
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 3983b4f282f8..5a48fcaa32f0 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -66,6 +66,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_STRAFE), HID_QUIRK_NO_INIT_REPORTS | HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CREATIVELABS, USB_DEVICE_ID_CREATIVE_SB_OMNI_SURROUND_51), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DELL, USB_DEVICE_ID_DELL_PIXART_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_DELL, USB_DEVICE_ID_DELL_PRO_WIRELESS_KM5221W), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DMI, USB_DEVICE_ID_DMI_ENC), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRACAL_RAPHNET, USB_DEVICE_ID_RAPHNET_2NES2SNES), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_DRACAL_RAPHNET, USB_DEVICE_ID_RAPHNET_4NES4SNES), HID_QUIRK_MULTI_INPUT },


-- 
Jiri Kosina
SUSE Labs

