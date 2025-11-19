Return-Path: <linux-input+bounces-16211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A61C6D14D
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 08:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF19034F12D
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 07:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C997631A57F;
	Wed, 19 Nov 2025 07:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UV72ZJap"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959D53148C6;
	Wed, 19 Nov 2025 07:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536971; cv=none; b=HdGT1n+M02bDl/u011jI9sKvTbY71nvVgE0Tyvgnyw6lU/SdODZ7DNlLcpb6siL04KgqHc43mArxzLXtHKnly5UUUDaRCJi7ISvy5AEp1edc9iImsT1rkrGPddM1/ZDDUY/TO+p8qUdRBU77x6DVMIi/LDKwiQQXYBhqKMYIK4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536971; c=relaxed/simple;
	bh=fTEcAtImu1AQ33yjEfylz194/R9WItwhckwedB6Q01M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KiFmBHuZTfG8CJRSXaxuIo1uU3Nh66pBvp8ShTCKIxucoxudKAB2kNLJpCk7Hmbo65XP59GgMclYX4qJBubiCt9Qhd69T1oE7YFVGunoEYq363MEO4sdcnKYhZhDApcF+yj6a8xaYImVw21NkuDsoCRdARclZjQ25x64iSofin0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UV72ZJap; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763536969; x=1795072969;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fTEcAtImu1AQ33yjEfylz194/R9WItwhckwedB6Q01M=;
  b=UV72ZJapV+lkoVYgDMqjHYHd8+sygZ/mB5UrQr0nLg6xI+VJKIqlZkvG
   m79MRrz+/3hRFdS3vz9rcDR8dhSoZwsGZp2hpNzjh8FLRhH1MP/s5pj6A
   hg5sYp23tffIzdZ5XmJLT/ExvEMQ2okFFmhb3l4eHdJ9LSVg4R/e+odr/
   5ROvb9qZWB6DMZ6kohEozOpgWsi8vbHnuHy0fiR1TdzcSqUvWVrunXhDm
   N/b1s5BxgyX552sd9+JNWH0Lw4GbcAhMpZCpE/HdH+JHn+ZyliCaZv7/E
   jzkU02kk+g4TOctroQxrxl6xu6VSFz4YrEtbnd3PmU2fUn3lYlRrghznK
   A==;
X-CSE-ConnectionGUID: mlEXbHuPSB2WCS7yDCgakg==
X-CSE-MsgGUID: bhscuBmNSvaJpp+zQ6EdXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="77028608"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="77028608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:22:34 -0800
X-CSE-ConnectionGUID: qPPu+cbvQ5uzuSAm+mvZWg==
X-CSE-MsgGUID: D27S7VT7T+C9M34iErODCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="221620037"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 23:22:30 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 19 Nov 2025 09:22:27 +0200 (EET)
To: Denis Benato <benato.denis96@gmail.com>
cc: Antheas Kapenekakis <lkml@antheas.dev>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 03/10] HID: asus: fortify keyboard handshake
In-Reply-To: <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
Message-ID: <3f310d76-d9cf-5635-d7fb-0da885f49871@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev> <20251101104712.8011-4-lkml@antheas.dev> <75fe4c0f-3303-4f3d-adc5-45487df3c80a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Nov 2025, Denis Benato wrote:
> On 11/1/25 11:47, Antheas Kapenekakis wrote:
> > Handshaking with an Asus device involves sending it a feature report
> > with the string "ASUS Tech.Inc." and then reading it back to verify the
> > handshake was successful, under the feature ID the interaction will
> > take place.
> >
> > Currently, the driver only does the first part. Add the readback to
> > verify the handshake was successful. As this could cause breakages,
> > allow the verification to fail with a dmesg error until we verify
> > all devices work with it (they seem to).
> >
> > Since the response is more than 16 bytes, increase the buffer size
> > to 64 as well to avoid overflow errors.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 32 +++++++++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 4676b7f20caf..03f0d86936fc 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> > -#define FEATURE_KBD_REPORT_SIZE 16
> > +#define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> >  #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> >  
> > @@ -393,14 +393,40 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> >  
> >  static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> >  {
> > +	/*
> > +	 * The handshake is first sent as a set_report, then retrieved
> > +	 * from a get_report. They should be equal.
> > +	 */
> >  	const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> >  		     0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > +	u8 *readbuf;
> 
> __free(kfree) = NULL here? Would simplify the code.

Yes, but see below.

> >  	int ret;
> >  
> >  	ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > -	if (ret < 0)
> > -		hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > +	if (ret < 0) {
> > +		hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);

The preferred approach for using __free() is to have the whole variable 
declaration here as it ensures tear down order of the auto-variables 
is the reverse of the init order.

It would be safe to do in this case also in the top block but if something 
gets added in between, the ordering could become wrong. Also, each 
correctly done example helps to form a pattern in the mind of those 
reading this code so they'd be more likely to get the placement right in 
some other place.

-- 
 i.


> > +	if (!readbuf)
> > +		return -ENOMEM;
> > +
> > +	ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > +				 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > +				 HID_REQ_GET_REPORT);
> See comments on patch 1 (also reported below): not sure if others
> report_id are going to answer, my guess is that we will have to try
> if you choose to go that route.
> > +	if (ret < 0) {
> > +		hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > +	} else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > +		hid_warn(hdev, "Asus handshake returned invalid response: %*ph\n",
> > +			FEATURE_KBD_REPORT_SIZE, readbuf);
> > +		/*
> > +		 * Do not return error if handshake is wrong until this is
> > +		 * verified to work for all devices.
> > +		 */
> In review of patch 1 I requested this function to be called with more report_id
> than just 0x5a so this will have to be checked against those values too.
> 
> In alternative you can fork based on the report_id, but having confirmation that
> this is valid with those ids too would be of great help. Perhaps I can help you
> with this asking to asus-linux users.
> > +	}
> >  
> > +	kfree(readbuf);
> >  	return ret;
> >  }
> >  
> 

