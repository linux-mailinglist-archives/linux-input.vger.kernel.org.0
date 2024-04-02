Return-Path: <linux-input+bounces-2769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED068895B77
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 20:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 210E2B2A88F
	for <lists+linux-input@lfdr.de>; Tue,  2 Apr 2024 18:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4E9415AACF;
	Tue,  2 Apr 2024 18:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="pE7oSw9m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yk7NveVb"
X-Original-To: linux-input@vger.kernel.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBEC15AAC4;
	Tue,  2 Apr 2024 18:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712081364; cv=none; b=udPV8xG+J5D4jL4eNsjTiMgS1lcGu7mKRtW84Gid0j8PHipAZdmCPnXGTkX/JpINi0KL23n2CP+54YbPLf5wYX3Jx03PQt6Hyd5xIqv+Zytza+nZDijTXENZ4vYF/v1SDRXA4n2PDmjLOvgx4SAmCiuROFwczv3dBS5FHJceJR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712081364; c=relaxed/simple;
	bh=eSF486bhbpd75a/BWfmuqOapsioPFBXp/oMUvs4USyM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=uuKxSRzp2km2KAY/FBn64b07V7B9vi+GXQFW60F2GxJWPKjk9EZOXcoobMW0V7Y6cp6UZ7qxUOaAoPuWvKIZZEylMogDtKk6ar3yqk4Klcf9wy2GFSFdUuAyCCP2WFvZIEu4+1d1nTJCZrUDuK05TbtDPTCt0Ivy7looZ2u1gNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=pE7oSw9m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yk7NveVb; arc=none smtp.client-ip=66.111.4.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C95E55C00A5;
	Tue,  2 Apr 2024 14:09:20 -0400 (EDT)
Received: from imap52 ([10.202.2.102])
  by compute3.internal (MEProxy); Tue, 02 Apr 2024 14:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1712081360; x=1712167760; bh=HabFGBn5xo
	ej8VapqUlPZ+A61A4Kk7VPro0ZHdOSHkc=; b=pE7oSw9mhFlmf6L/KPPzI95g/k
	empRXXg7iLP0+rQk4lMg6xReZSFygYHC2DqcrRW8DNCxmFXtsnxu15XEeR/D45Y3
	tCIR+Xns+uT9y2+RkFouaq5MID7fyCNc1a3yKr8UnG54aTcMmVb0fgKI1/mrjDhu
	hzIzUhVKf0BdUvhbA7R8v7On9eRE5OYYcMFTaB0e7NvyKDLTFRj/ko16jCWgB9HL
	ez6Ki7KDNP+WU6aauY9lGp63ynX4E+TtBOx4ULRkucamjFoELQH3eLJ9448CC/+h
	pQG34k0Ph/KwVb+poICIvZR7WEMU+uvUPHmQEULpwujvCb+1xZU5Di9Ab2EA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712081360; x=1712167760; bh=HabFGBn5xoej8VapqUlPZ+A61A4K
	k7VPro0ZHdOSHkc=; b=Yk7NveVb2BNjUyC2U2akg9LF/2XIpMuQi78sIRwBLTUb
	h6wU8xkDqnCB9p0JDN4qdSwosRIDk1GJpEV8Lzapf1H3nr2GPQfKqbSZn/DOCU5c
	RD1HSceqUA4yS+sCFfG8ysiNNO6aGdPjaBBUMLOiXtcjVxYR0qvRyAAUKs31mAe/
	uKYpFef1T1CL0eiOWnjKfLl3oVxJFjIdfO6Tohw2XrUg9qVeP97XKlvArMvoBUXN
	dPtVIce4APBmYbWfcMG5zQT6om1tNzDvBq7EHW7yomRiaQJQ5qld/Vn5l0QmIneD
	bZ6aJkhacuO4Qml5Y0gdMwpZwxbq5Et7BWwJa13g6Q==
X-ME-Sender: <xms:z0kMZnzWbEChQt7X6W8a4B44PFxThYGb8jJHDKcYFit_p8IRocje-g>
    <xme:z0kMZvTWUMHtNsl-em80VRghsPIo6wPkHSSpHQHkh6OHS5K7AG4VVRxxTZfo8vsQv
    YaUgpYOIJ-y5H4FQQY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefvddguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdfo
    rghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnsehsqhhuvggssgdrtggrqeenuc
    ggtffrrghtthgvrhhnpedtieethfdvudffhedvhfduveeluddukeduffehgeduieehtdeh
    gedvueelhfetgeenucffohhmrghinhepmhhitghrohhsohhfthdrtghomhdprhgvughhrg
    htrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhesshhquhgvsggsrdgtrg
X-ME-Proxy: <xmx:z0kMZhUW26ilRsf2byQwgWu-_n1qiKwG0CogwsUsNHyXF2T12_60fw>
    <xmx:z0kMZhixXpEG707aLN51M9wrHb1rLCIKO7BhC7ukWlqYhan5T16nhg>
    <xmx:z0kMZpC70EasxqEBF0WkznTjYf3WP-pv84xvVxFSK-8LV1i2rtk4_w>
    <xmx:z0kMZqLYCflC36jaFNBIpJsGmm8lHe92pQx6WrdQ_qJzrb9aRFjikw>
    <xmx:0EkMZrwWiSH7_eOukuO52w9SIMhihZwgfR2LJOOQ80QgL16HDqj4z4lmusgn>
Feedback-ID: ic2b14614:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8D54AC60097; Tue,  2 Apr 2024 14:09:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e941980b-5efb-4ba7-aaf9-f0ed694fb39d@app.fastmail.com>
In-Reply-To: <20240402111004.161434-1-hdegoede@redhat.com>
References: <20240402111004.161434-1-hdegoede@redhat.com>
Date: Tue, 02 Apr 2024 14:09:32 -0400
From: "Mark Pearson" <mpearson@squebb.ca>
To: "Hans de Goede" <hdegoede@redhat.com>, "Jiri Kosina" <jikos@kernel.org>,
 "Benjamin Tissoires" <benjamin.tissoires@redhat.com>,
 "Kenny Levinsen" <kl@kl.wtf>
Cc: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>,
 "Douglas Anderson" <dianders@chromium.org>, "Julian Sax" <jsbc@gmx.de>,
 ahormann@gmx.net, "Bruno Jesus" <bruno.fl.jesus@gmail.com>,
 Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
 "Tim Aldridge" <taldridge@mac.com>,
 "Rene Wagner" <redhatbugzilla@callerid.de>,
 "Federico Ricchiuto" <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] HID: i2c-hid: Revert to await reset ACK before reading report
 descriptor
Content-Type: text/plain

On Tue, Apr 2, 2024, at 7:10 AM, Hans de Goede wrote:
> From: Kenny Levinsen <kl@kl.wtf>
>
> In af93a167eda9, i2c_hid_parse was changed to continue with reading the
> report descriptor before waiting for reset to be acknowledged.
>
> This has lead to two regressions:
>
> 1. We fail to handle reset acknowledgment if it happens while reading
>    the report descriptor. The transfer sets I2C_HID_READ_PENDING, which
>    causes the IRQ handler to return without doing anything.
>
>    This affects both a Wacom touchscreen and a Sensel touchpad.
>
> 2. On a Sensel touchpad, reading the report descriptor this quickly
>    after reset results in all zeroes or partial zeroes.
>
> The issues were observed on the Lenovo Thinkpad Z16 Gen 2.
>
> The change in question was made based on a Microsoft article[0] stating
> that Windows 8 *may* read the report descriptor in parallel with
> awaiting reset acknowledgment, intended as a slight reset performance
> optimization. Perhaps they only do this if reset is not completing
> quickly enough for their tastes?
>
> As the code is not currently ready to read registers in parallel with a
> pending reset acknowledgment, and as reading quickly breaks the report
> descriptor on the Sensel touchpad, revert to waiting for reset
> acknowledgment before proceeding to read the report descriptor.
>
> [0]: 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/hid/plug-and-play-support-and-power-management
>
> Fixes: af93a167eda9 ("HID: i2c-hid: Move i2c_hid_finish_hwreset() to 
> after reading the report-descriptor")
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2271136
> Cc: stable@vger.kernel.org
> Signed-off-by: Kenny Levinsen <kl@kl.wtf>
> Link: https://lore.kernel.org/r/20240331182440.14477-1-kl@kl.wtf
> [hdegoede@redhat.com Drop no longer necessary abort_reset error exit 
> path]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c 
> b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2df1ab3c31cc..13d67d7c67b4 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -735,12 +735,15 @@ static int i2c_hid_parse(struct hid_device *hid)
>  	mutex_lock(&ihid->reset_lock);
>  	do {
>  		ret = i2c_hid_start_hwreset(ihid);
> -		if (ret)
> +		if (ret == 0)
> +			ret = i2c_hid_finish_hwreset(ihid);
> +		else
>  			msleep(1000);
>  	} while (tries-- > 0 && ret);
> +	mutex_unlock(&ihid->reset_lock);
> 
>  	if (ret)
> -		goto abort_reset;
> +		return ret;
> 
>  	use_override = i2c_hid_get_dmi_hid_report_desc_override(client->name,
>  								&rsize);
> @@ -750,11 +753,8 @@ static int i2c_hid_parse(struct hid_device *hid)
>  		i2c_hid_dbg(ihid, "Using a HID report descriptor override\n");
>  	} else {
>  		rdesc = kzalloc(rsize, GFP_KERNEL);
> -
> -		if (!rdesc) {
> -			ret = -ENOMEM;
> -			goto abort_reset;
> -		}
> +		if (!rdesc)
> +			return -ENOMEM;
> 
>  		i2c_hid_dbg(ihid, "asking HID report descriptor\n");
> 
> @@ -763,23 +763,10 @@ static int i2c_hid_parse(struct hid_device *hid)
>  					    rdesc, rsize);
>  		if (ret) {
>  			hid_err(hid, "reading report descriptor failed\n");
> -			goto abort_reset;
> +			goto out;
>  		}
>  	}
> 
> -	/*
> -	 * Windows directly reads the report-descriptor after sending reset
> -	 * and then waits for resets completion afterwards. Some touchpads
> -	 * actually wait for the report-descriptor to be read before signalling
> -	 * reset completion.
> -	 */
> -	ret = i2c_hid_finish_hwreset(ihid);
> -abort_reset:
> -	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> -	mutex_unlock(&ihid->reset_lock);
> -	if (ret)
> -		goto out;
> -
>  	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
> 
>  	ret = hid_parse_report(hid, rdesc, rsize);

Tested on my Z13 G2 system and confirmed this fixes the issue.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

