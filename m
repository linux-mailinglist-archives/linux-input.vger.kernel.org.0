Return-Path: <linux-input+bounces-4372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B338909BA3
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 07:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77C31F21769
	for <lists+linux-input@lfdr.de>; Sun, 16 Jun 2024 05:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8341F5F5;
	Sun, 16 Jun 2024 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LjytOtrz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bm/Xh44i"
X-Original-To: linux-input@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77991849;
	Sun, 16 Jun 2024 05:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718515572; cv=none; b=q7rX0WI9dDZtomsYoAZ5TE1U2eGS/BejnZ5yIdMeoA6qUgmiifbv2ne8vHbmbqG/k5hTh3bqLSZAv4eZzvY7tO12EdVppkaXk8ue/D9ICVIWkb9SdnF4BieDHgHl+YC6DRT1x6Yj4WqrB+qRvDu33o8FT3/F7slF6WFnaAy8Bh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718515572; c=relaxed/simple;
	bh=d1zVEtisKd1xtMgJN8TQAPiTovdMAXswWCOPUjrXPTI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tPbuJjNfXPpXVwPt8PKWrlbsx06jhSP7fgQMSYvqKD9G4iEjAwHaozcjywoGZBv2LJnpdjmgS/cwioj9UDcMSg6lmnNEvx88RpNI+Yft0hCWYKtF7eR1D+Y5hBClKQEiEUumuG8Z37atJlpaNCqfIUVtnTVcZjSJK5TyvYmK7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LjytOtrz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bm/Xh44i; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 9A81213801A1;
	Sun, 16 Jun 2024 01:26:08 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Sun, 16 Jun 2024 01:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1718515568; x=1718601968; bh=rUwmRTCgqS
	XeqVWcrGCH1x5heTSIxOLsk0NzrbrzKa8=; b=LjytOtrzmxhoZ7B48HAa5WFYKu
	Ocd+ETL1gFbU4rFWZ2PWgYbLtzjmpx5YqZ6QShSlhcVcVtVch95F7ZUF3sIgMLnt
	FdVT/Sptm2DhjF4YJFT0w0Fw1MXrjtKPeqTy6M1YW0lwuIM0Z93RdF+HolUQCec5
	YMtFfOycjujto0S8AoWQayPs4BJ3qk3EtOwzt+R2Sfls6jTxVHgx9jU/Q/dzHIqt
	KFz31Y8RbLB6IfMwy/SN4KHD/CRpVI3aq/vr7tpu6WipnY6I4b2qkfzlaWh8iKEg
	Ev5L5qh7JrAlL3BB7nbKB6Sa1BL4exkfOeIGUd3M6p68ir+jviWvVKpYrlow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718515568; x=1718601968; bh=rUwmRTCgqSXeqVWcrGCH1x5heTSI
	xOLsk0NzrbrzKa8=; b=Bm/Xh44iQP3ofD3JZD9U4BUGMIcdMmQUREThgTS2hddm
	oW9MG3MftD4NI/p8F0+Wb2vLk8VTpvPADwpiTHbdoAN5Tnm+OCo4iv9s5TCNVCPM
	hM7DcEsPIDPUqzxgb8FyjjCzT3YVj31A6/+1mVNzWgUcxCJDhPjqWs/9aSn9f7uF
	neOq1buDAEffm6asKWkhuKj5TJEyNgeC6DTf9ViO+feH6j0hHZGOwoLA1eqSpjkF
	GAO4/50UfI18svsDh2MXNOC7uJ+lCFMfbq2sJNWkRpcLhE7AwcPuOeDdvsSLTcsF
	dHfimWiDEY6fYQ8OUvcX5R6aESEM+LJ6WEYuKV/yOg==
X-ME-Sender: <xms:cHduZsG3ZFaixye0BVIw6Cps_0O5x8n6clDSPXWncYBCHFuAk5yCtw>
    <xme:cHduZlW_21EfCZG32J6RxInh5U6HHGyCqPdVRHbF-spcbps2n3pgxdTobCJCfueIu
    PfFPr6C0MmUsYRY2Pc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvvddgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfnfhu
    khgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpedutdelgfdvgeekueeuteevffelfedukeeitedugfdvtdeutdetjeduudeuvdeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:cHduZmItM1hKUPG_1_QWk6akh230UTm9t-CvihUmBgnzYSx6f1HYvw>
    <xmx:cHduZuHKy58orLyHmm55zFspbYplMPXkQmKOOoFTHdelPhvKCWrxZQ>
    <xmx:cHduZiVMu4NJnrI5GKfzadPZHr7jR2mnVadUaksh-N64hwvSsWMlIQ>
    <xmx:cHduZhNGKyaznnAc6xiqn98wlIDDCasb1wuTb913Vm3KvK7cv1vQRA>
    <xmx:cHduZvjYkwiPvE8KFU_RyK_1TSKeb4fq4ZxPlRtC6vWQWEodO7Rn5yyD>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4E7762340080; Sun, 16 Jun 2024 01:26:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9e4ee526-2b94-45f3-9fe9-0f1d0918916b@app.fastmail.com>
In-Reply-To: <dd0a211a-bef1-4eb2-8d1f-2d63799af94c@app.fastmail.com>
References: <20240607040532.1074379-1-luke@ljones.dev>
 <20240607040532.1074379-2-luke@ljones.dev>
 <dd0a211a-bef1-4eb2-8d1f-2d63799af94c@app.fastmail.com>
Date: Sun, 16 Jun 2024 17:25:46 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Jiri Kosina" <jikos@kernel.org>
Cc: "Benjamin Tissoires" <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hid-asus: use hid for brightness control on keyboard
Content-Type: text/plain

On Sat, 8 Jun 2024, at 11:24 AM, Luke Jones wrote:
> I thought this was finalised but I'm still getting conflicting reports.
> Please don't merge until I confirm the fix.

This is ready for merge now. I have more confirmation that the single patch with no adjustment to report_id works well.

> On Fri, 7 Jun 2024, at 4:05 PM, Luke D. Jones wrote:
> > On almost all ASUS ROG series laptops the MCU used for the USB keyboard
> > also has a HID packet used for setting the brightness. This is usually
> > the same as the WMI method. But in some laptops the WMI method either
> > is missing or doesn't work, so we should default to the HID control.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> > drivers/hid/hid-asus.c                     |  7 ++++
> > drivers/platform/x86/asus-wmi.c            |  3 +-
> > include/linux/platform_data/x86/asus-wmi.h | 45 ++++++++++++++++++++++
> > 3 files changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 02de2bf4f790..0ed3708ef7e2 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -492,12 +492,19 @@ static void asus_kbd_backlight_work(struct work_struct *work)
> >   */
> > static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> > {
> > + struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> > u32 value;
> > int ret;
> >  
> > if (!IS_ENABLED(CONFIG_ASUS_WMI))
> > return false;
> >  
> > + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> > + dmi_check_system(asus_use_hid_led_dmi_ids)) {
> > + hid_info(hdev, "using HID for asus::kbd_backlight\n");
> > + return false;
> > + }
> > +
> > ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> >        ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> > hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 3f9b6285c9a6..799d928c7d3d 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
> > goto error;
> > }
> >  
> > - if (!kbd_led_read(asus, &led_val, NULL)) {
> > + if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
> > + pr_info("using asus-wmi for asus::kbd_backlight\n");
> > asus->kbd_led_wk = led_val;
> > asus->kbd_led.name = "asus::kbd_backlight";
> > asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 3eb5cd6773ad..6ba0015e4386 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -4,6 +4,7 @@
> >  
> > #include <linux/errno.h>
> > #include <linux/types.h>
> > +#include <linux/dmi.h>
> >  
> > /* WMI Methods */
> > #define ASUS_WMI_METHODID_SPEC         0x43455053 /* BIOS SPECification */
> > @@ -160,4 +161,48 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> > }
> > #endif
> >  
> > +/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> > +#if IS_ENABLED(CONFIG_ASUS_WMI)
> > +bool asus_use_hid_led(void);
> > +#else
> > +static inline bool asus_use_hid_led(void)
> > +{
> > + return true;
> > +}
> > +#endif
> > +
> > +static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> > + },
> > + },
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> > + },
> > + },
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> > + },
> > + },
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_BOARD_NAME, "GA403"),
> > + },
> > + },
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_BOARD_NAME, "GU605"),
> > + },
> > + },
> > + {
> > + .matches = {
> > + DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> > + },
> > + },
> > + NULL,
> > +};
> > +
> > #endif /* __PLATFORM_DATA_X86_ASUS_WMI_H */
> > -- 
> > 2.45.1
> > 
> > 

