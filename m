Return-Path: <linux-input+bounces-11241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A534A70672
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE2063BE040
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638B825D91E;
	Tue, 25 Mar 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gEspCC3e"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0FF25D559;
	Tue, 25 Mar 2025 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919108; cv=none; b=be3YTVpaLrd3K3uHm9vwrZC32BNOPT0P2sX1SNyAn3ZZrFcO0iNVCDS1WzvkYKaShuLd29iM4NjzdKXio5b/6objg4KYF3vo8/WIx2w80sqW0g5Lr0JNLPyrXb5lKkvkJqAPxIxnsTXViW7gxp6Y4CEoHCdshpGvdeoj105l1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919108; c=relaxed/simple;
	bh=m5jF2g8RoBZc4vVO3/GHC/ynrmEBlhwNcZTpzse4VGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5VDowfvZEKrKTJRaDdG9pyhDicgzmqMAX4zU7eNSGjtC1czmPeWfaZcLRnsfqkGFmRF9dHAvwSuCRj15Q2pYh3xr4AF5dByozhdujI8DLAbD9CCvk1iDWwcHYcVwfCBzsdRX8Hw0Cg3eQ6iv0sBBr9bHFHvvD4ePo/Pf0t4NCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gEspCC3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AD7C4CEE4;
	Tue, 25 Mar 2025 16:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742919107;
	bh=m5jF2g8RoBZc4vVO3/GHC/ynrmEBlhwNcZTpzse4VGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gEspCC3epxPmd1cz5Voz6c7pc7GkViUelUjOQt9T75ttc26SSaCWo2oz+H87fUgVz
	 zpf0fppV1S8mytUaKg0VmreM7Ral7xvoZsdOTxOJY8M6Ed4+qeFsN2gY2MhEEw86TK
	 LtP028a9TbShdLvgf4c7aPBRT1NCLgkGhZJZ9XByiKsqn59LdfKxSpTTGVAoh2U/zF
	 3PggRUlyOf8OLrjOyNZQdB9baKGrdQ97X35DLGVXyHjChu9oJrs2s6PrfmG5LtKhSC
	 36FhocuH8yxswJxCapwfNcbK5hZCTmyeb18hD+w8VcyoNEfOHJ4hgTUdIbJl9w7Jud
	 WO4VRchOVz+CQ==
Date: Tue, 25 Mar 2025 17:11:43 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Kerem Karabay <kekrby@gmail.com>, 
	Orlando Chamberlain <orlandoch.dev@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Message-ID: <e3ejlqfxafqrojlaiz3fbbkcira7txbuk4cftrfxvotvbr3xd6@eaes6e6rywyn>
References: <ECE4880B-2A87-4147-B83B-2D832639F3B2@live.com>
 <90644A22-3136-4D4E-864E-7F7210D0C713@live.com>
 <vx6hvspvlfsv3palzvjpvsrmkl6s7qut366bhxq3tcwvyf7z63@drzftehh2rew>
 <PN3PR01MB95979F7D629681CBBCB763ACB8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95979F7D629681CBBCB763ACB8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mar 25 2025, Aditya Garg wrote:
> 
> 
> > On 25 Mar 2025, at 6:43 PM, Benjamin Tissoires <bentiss@kernel.org> wrote:
> > 
> > ﻿On Mar 10 2025, Aditya Garg wrote:
> >> From: Kerem Karabay <kekrby@gmail.com>
> >> 
> >> This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
> >> to the hid-multitouch driver.
> >> 
> >> Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
> >> appreciated.
> >> 
> >> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> >> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> >> ---
> >> drivers/hid/Kconfig          |  1 +
> >> drivers/hid/hid-multitouch.c | 25 +++++++++++++++++++++----
> >> 2 files changed, 22 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> >> index dfc245867..727a2ed0d 100644
> >> --- a/drivers/hid/Kconfig
> >> +++ b/drivers/hid/Kconfig
> >> @@ -743,6 +743,7 @@ config HID_MULTITOUCH
> >>      Say Y here if you have one of the following devices:
> >>      - 3M PCT touch screens
> >>      - ActionStar dual touch panels
> >> +      - Apple Touch Bar on x86 MacBook Pros
> >>      - Atmel panels
> >>      - Cando dual touch panels
> >>      - Chunghwa panels
> >> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> >> index 66e33a482..078ceef62 100644
> >> --- a/drivers/hid/hid-multitouch.c
> >> +++ b/drivers/hid/hid-multitouch.c
> >> @@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> >> #define MT_CLS_GOOGLE                0x0111
> >> #define MT_CLS_RAZER_BLADE_STEALTH        0x0112
> >> #define MT_CLS_SMART_TECH            0x0113
> >> +#define MT_CLS_APPLE_TOUCHBAR            0x0114
> >> #define MT_CLS_SIS                0x0457
> >> 
> >> #define MT_DEFAULT_MAXCONTACT    10
> >> @@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
> >>            MT_QUIRK_CONTACT_CNT_ACCURATE |
> >>            MT_QUIRK_SEPARATE_APP_REPORT,
> >>    },
> >> +    { .name = MT_CLS_APPLE_TOUCHBAR,
> >> +        .quirks = MT_QUIRK_HOVERING |
> >> +            MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
> >> +            MT_QUIRK_APPLE_TOUCHBAR,
> >> +        .maxcontacts = 11,
> >> +    },
> >>    { .name = MT_CLS_SIS,
> >>        .quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
> >>            MT_QUIRK_ALWAYS_VALID |
> >> @@ -1807,6 +1814,15 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>        }
> >>    }
> >> 
> >> +    ret = hid_parse(hdev);
> >> +    if (ret != 0)
> >> +        return ret;
> >> +
> >> +    if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
> >> +        !hid_find_field(hdev, HID_INPUT_REPORT,
> >> +                HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
> >> +        return -ENODEV;
> >> +
> > 
> > That hunk and the one below make me very nervous. Is there any reason
> > preventing you to keep hid_parse() at the same place?
> > 
> Wouldn't we need to parse in order to do hid_find_field? Although I haven't tried putting it at the same place tbh.

Yes, you need hid_parse() to be able to call hid_find_field(). But you
can put hid_find_field() after hid_parse() at the original location, no?

Cheers,
Benjamin

> 
> > The rest of the series looks fine as everything seems properly guarded
> > by MT_CLS_APPLE_TOUCHBAR.
> > 
> > Cheers,
> > Benjamin
> > 
> >>    td = devm_kzalloc(&hdev->dev, sizeof(struct mt_device), GFP_KERNEL);
> >>    if (!td) {
> >>        dev_err(&hdev->dev, "cannot allocate multitouch data\n");
> >> @@ -1854,10 +1870,6 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >> 
> >>    timer_setup(&td->release_timer, mt_expired_timeout, 0);
> >> 
> >> -    ret = hid_parse(hdev);
> >> -    if (ret != 0)
> >> -        return ret;
> >> -
> >>    if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
> >>        mt_fix_const_fields(hdev, HID_DG_CONTACTID);
> >> 
> >> @@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
> >>        MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
> >>            USB_DEVICE_ID_XIROKU_CSR2) },
> >> 
> >> +    /* Apple Touch Bar */
> >> +    { .driver_data = MT_CLS_APPLE_TOUCHBAR,
> >> +        HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
> >> +            USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
> >> +
> >>    /* Google MT devices */
> >>    { .driver_data = MT_CLS_GOOGLE,
> >>        HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
> >> --
> >> 2.43.0
> >> 

