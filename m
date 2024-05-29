Return-Path: <linux-input+bounces-3942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8296D8D32EB
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 11:28:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4FBF1C20C65
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 09:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7946A169AE6;
	Wed, 29 May 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="H2CJ+GkO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bt3YND7e"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33039FD6;
	Wed, 29 May 2024 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716974897; cv=none; b=RV1mbgGMey4XPO+DRw3+gf3sRMC6yfi2CZs0pOzK9bTGC09izjcuUFtE0cnUN8IvGdx1ckPRSwG7vl3EdK7EUtv3saP+HYCHlvx2JJXAkbHG+km8EPGf2G4rPzDC4WkNu5FIVxmUbSGgHMMseuYEkSqq47kR6bu6wlBqx19o8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716974897; c=relaxed/simple;
	bh=Fxy6nPjwcvo0790dgPQleUfz1YfV4rRLl+LfuHSPsos=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=EGq3S1vxIhAOHxc8Suf+hLFkcUih0EezGYUsemfspwC8jU3exBkZqAYlYTE/jYEIZeSrD5vOO7zqxt5IdV5V40c+rO0cmB+WwQZBhgp6FUbsTMfKbNdX1N/1M+wxSSOHyXj6aBm8sjULPidIgRtS/rvxPg96KclKji+bQMeAves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=H2CJ+GkO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bt3YND7e; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfhigh.west.internal (Postfix) with ESMTP id CCD99180009E;
	Wed, 29 May 2024 05:28:13 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute2.internal (MEProxy); Wed, 29 May 2024 05:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1716974893; x=1717061293; bh=OHTgLSr14Z
	6UcDGeqo2Na6jF5x1uXQBwvVchxSidF8A=; b=H2CJ+GkOLxaBy8Zxvtx5lDEUn8
	Deh/bs7vMhBYVsQQMvaJ5ZMPGzqRDRJ4qlUTKCZpHNX3gMx2QMSX4tZZA6cxUk1D
	bBSKICv4/LWXnk2kAMSyymrN11vFtgyKli7QUQnrjNXz+uO1Qa1knSsm9DuSyp2I
	yXQcBN5Aqzh9ohg3T8GY62c/WlKVPVeUAA+TijBWQejhLxOFKfiD3R5D0FH1P8Tj
	Y3xvb3rcO94HbwrhQ0s1NUCP4VaB7oshLILxN/WJe+e09CuxMStCDngN/JrmdGg3
	A2Hw2jMYKEyF5h/VALOPlOB4HHh4YvQLgsn9VLjXet3kZCUboEAyI4jtlr+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716974893; x=1717061293; bh=OHTgLSr14Z6UcDGeqo2Na6jF5x1u
	XQBwvVchxSidF8A=; b=bt3YND7eJLss3ATpjGVeCRt0Yf3nF8b236V/4rkgy/GA
	tJ+ukeeaXxJdhRFw2apW3x6NQQWZtzi4ieznBFXMUPXSPP+UMB2BGztr/qLQQaLO
	C+lAgUHNkPAbLJPX0geHxnRJVa3zBr89W0d+aR/tCcyMH7Bw9OG7WOjEV6ZpqmQQ
	afwWkpNeM5ZK0Kmx9RBMJq/LAoDmqMaG2qfCXvV7Dig3Ei+Gx1jfwZLq4q6XfRWc
	CHSPlRwC6vsfZNTldQcb2gCDon0G7Njo6JCZi9T69IV18sLCBQezsYaQQYn+1pzL
	9lMSnYrUiH/3Oa0x3ROQK3qIZd//9e+JTb6k7jXnJw==
X-ME-Sender: <xms:LfVWZij0QDue_HQEnXKtSJHZAGisujyJn327rlhWdArXNLrnNyEZgw>
    <xme:LfVWZjAB2qJgBXuwZxXBc_O6zTF5xGsO-dgcysOzZCvy5R9brQfFOKjVfrmYwJgwP
    vrAmDGzD_YxWu3-ANo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedfnfhu
    khgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtth
    gvrhhnpedutdelgfdvgeekueeuteevffelfedukeeitedugfdvtdeutdetjeduudeuvdeg
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehluh
    hkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:LfVWZqH5g-Pi6E1CbFAOgVSvpQloFHPTqoXM6sX3uQHuXQV8fOvBzw>
    <xmx:LfVWZrRbx3QVuXRcjdrKy-ushItT2vdBkZkXhLClOQlEzPorkE4jJQ>
    <xmx:LfVWZvyHebNMc7ccTgPAHTNmoo8PdrZdDT64G6pXHiPWrcvSQOb_nA>
    <xmx:LfVWZp7qIQDfdUFYfQtXfKDrMUEPSe6bKiNa4_Ln3sUQPzzZ1MLcug>
    <xmx:LfVWZmmz89qcbuz2H8iCdf3SLlvDjkrjo4oQWmcpW9NMnj3LrUE8y4SW>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 231482340080; Wed, 29 May 2024 05:28:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ac50e89e-b0e9-48f8-a4e5-074c19f684e6@app.fastmail.com>
In-Reply-To: <ea85df16-53b4-4e25-b7c7-3f74486cdcf9@redhat.com>
References: <20240529012827.146005-1-luke@ljones.dev>
 <20240529012827.146005-3-luke@ljones.dev>
 <ea85df16-53b4-4e25-b7c7-3f74486cdcf9@redhat.com>
Date: Wed, 29 May 2024 21:27:52 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Hans de Goede" <hdegoede@redhat.com>, "Jiri Kosina" <jikos@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH v1 2/2] hid-asus: change the report_id used for HID LED control
Content-Type: text/plain



On Wed, 29 May 2024, at 8:25 PM, Hans de Goede wrote:
> Hi,
> 
> On 5/29/24 3:28 AM, Luke D. Jones wrote:
> > On some laptops the report_id used for LED brightness control must be
> > 0x5D instead of 0x5A.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> >  drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 4cba8e143031..ec3556cc4eef 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -94,6 +94,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  
> >  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
> >  
> > +static const char * const use_alt_led_report_id[] = { "GU605", "GA403" };
> > +
> >  struct asus_kbd_leds {
> >  struct led_classdev cdev;
> >  struct hid_device *hdev;
> > @@ -101,6 +103,7 @@ struct asus_kbd_leds {
> >  unsigned int brightness;
> >  spinlock_t lock;
> >  bool removed;
> > + int report_id;
> >  };
> >  
> >  struct asus_touchpad_info {
> > @@ -473,7 +476,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> >  static void asus_kbd_backlight_work(struct work_struct *work)
> >  {
> >  struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> > - u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> > + u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
> >  int ret;
> >  unsigned long flags;
> >  
> > @@ -513,6 +516,23 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> >  return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> >  }
> >  
> > +static bool asus_kbd_is_input_led(void)
> > +{
> > + const char *product;
> > + int i;
> > +
> > + product = dmi_get_system_info(DMI_PRODUCT_NAME);
> > + if (!product)
> > + return false;
> > +
> > + for (i = 0; i < ARRAY_SIZE(use_alt_led_report_id); i++) {
> > + if (strstr(product, use_alt_led_report_id[i]))
> > + return true;
> > + }
> > +
> > + return false;
> > +}
> > +
> 
> 
> This again feels like you are re-inventing dmi_check_system() please
> change use_alt_led_report_id to a dmi_system_id array and drop this
> function (you can directly call dmi_check_system(use_alt_led_report_id)
> instead).

I wasn't actually aware of that, so i guess I've learned a whole lot of new stuff today :)

Thanks mate, I'll get round to a v2 in the next few days.

> 
> >  static int asus_kbd_register_leds(struct hid_device *hdev)
> >  {
> >  struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> > @@ -555,6 +575,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >  if (!drvdata->kbd_backlight)
> >  return -ENOMEM;
> >  
> > + drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
> > + if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
> > + drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
> > +
> >  drvdata->kbd_backlight->removed = false;
> >  drvdata->kbd_backlight->brightness = 0;
> >  drvdata->kbd_backlight->hdev = hdev;
> 
> Regards,
> 
> Hans
> 
> 
> 

