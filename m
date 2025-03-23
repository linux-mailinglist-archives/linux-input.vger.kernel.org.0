Return-Path: <linux-input+bounces-11111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE1A6CD6B
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 01:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C79E170ED5
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2C3FC0A;
	Sun, 23 Mar 2025 00:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="jFGoRWO/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pk2geM9A"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3019CBA38;
	Sun, 23 Mar 2025 00:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742688530; cv=none; b=npWkC3FWuofMQv4JNYJUiqn1gqDxdsuVVMZdaG9W6iiN9Xjp+LOCDY81GoisGoJ0IXofxcWZSHA6+vdOcF2XeWAu5zSQSG+LkjpVt7E7KXNSnACbVEAc5fZ7Te6oqephgqjhTPoPZsNjMtv28wzmGnQy2pTmPqD8pSnZP7UJBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742688530; c=relaxed/simple;
	bh=0yjtqxvuBbARxahRZm/DEmHHAxF8LQzleBFSueLr1oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bZKtmhjICr/l+4IRXIwVPBum0Lp3/MZvg/uhXLZAQfQnnWf+kW1AXHwqeXeWglpDS46FElQmyELrDC8qIEdqit6bIqQ0g5aXOSZoQgHz20aBwa9X0+lc4TSO8excfXjR/oNRnlwBXMj9SVJNQf5JnlI4D7jtnyZ+KGxc1hDlbVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=jFGoRWO/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pk2geM9A; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id EC6C21140061;
	Sat, 22 Mar 2025 20:08:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 22 Mar 2025 20:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742688527;
	 x=1742774927; bh=6qk2fLmtfRGbU7FOrtAXm29zkqOTM/JSSHH3UbNehk4=; b=
	jFGoRWO/tYwmEPmQDLEdZ2z1omU0uLgw6/1GO5rv6ZvCr3ZFQiPe48wC01WsBGz7
	Vibm1mmDGTAHCZ7fAaAADSpUXtWMEQeKQaSTuYFkA6AoE6YXWxLezHIZmx9qvgii
	Cw+WPJIEaxoiUg3UCm6RUejMMa9N1P1U2TGpeGLbleFm1na6IRP0yJ2/Y8qg6IQU
	FqioUzOaNojaraTLs6LXzb0n6Zr0ESe3XmXopVTKzJvoE/b1rUf70ha96pQQOBtM
	bFslr+qt4IaJIpAQFbL40elvvNTh4fXWrGzoY4SBIidNsKXhy9LUDToGbz27/+Pb
	6x6g3koFXG9bKqXPD7O9PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742688527; x=
	1742774927; bh=6qk2fLmtfRGbU7FOrtAXm29zkqOTM/JSSHH3UbNehk4=; b=P
	k2geM9ApQKOeYjF6SR8tmKxQAA41fbhGiv4EGJiCJKtPFlPW2sxz1WdSpejcAqzK
	12TQudfiBXfvIsjt7URuwbJc3LPzWXQ0q2M7q06wZpqYmLWAZXO1TugmHo79r0sB
	TxYNBp4s4F+V4nXgWdXisaDDt5kd/2wFlkA4mLMgRUqDcttPeHncaldh4xaAcAn8
	/g4AGUrw/G3DrKKaP2KTQorg8fD6bPHfbob18a4OV/JfLmCE7jObeDBG3dyW/kGl
	dPRcQ7CAq2FFDF//63O9vXSNzL1j2ADK3RupVDeLVHzM65jbhJFO0TnSqkCOAqXU
	nJen34iMg390YP3R6MNdw==
X-ME-Sender: <xms:D1HfZykv7AIojIgoTX-ZwQv0uGdgXsMUvDZVHMQGFkTS2Ehf21oyVw>
    <xme:D1HfZ50GscBJdR3zIlMINld1_FzCsvM633ptRQFcxzJ_iHS5AYZNPIwf2rFIoUZK7
    P-6U3Sjidn6r42pWkI>
X-ME-Received: <xmr:D1HfZwo3bU1b65Sj2qj3hdfI1kVcHKzRFNzDYyn4JfZoAwhOhhZ_QqkMOAt1Y4Tmlykbxvb0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheehfeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepveduueevtdetgfehfeeliedvvdfhtdei
    hfdtkeejuddvgeeivddtkeffgeekueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkmhhlsegrnhhthh
    gvrghsrdguvghvpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    ephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgr
    rhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:D1HfZ2nXDsVtvV9OWWNKZYSGvHA9QaJ_acnEBX3yMWoQaIzn2WD_LA>
    <xmx:D1HfZw3S6RvW0Yayu48yYBtxxcXSHaVue3pzSrDik52qtLua2H3D9Q>
    <xmx:D1HfZ9u5KGCMjkUqEEa3D1CPYpu1P86B-CMn0aoz1c-e0M1T_XMyAQ>
    <xmx:D1HfZ8V10zrbahHk2FssqTiYyoezeZi-gCylDUlGZahnccvk7ejwBw>
    <xmx:D1HfZxL2X2vLx8oADFfi_1yGOrnYzxnjKY5I2VVf2DNjVhRBOJCzxhlG>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Mar 2025 20:08:43 -0400 (EDT)
Message-ID: <488dccc0-512b-4328-b288-1c116bd72617@ljones.dev>
Date: Sun, 23 Mar 2025 13:08:41 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/10] HID: asus: add support for the asus-wmi
 brightness handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-9-lkml@antheas.dev>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <20250322102804.418000-9-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/25 23:28, Antheas Kapenekakis wrote:
> If the asus-wmi brightness handler is available, send the
> keyboard brightness events to it instead of passing them
> to userspace. If it is not, fall back to sending them to it.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   drivers/hid/hid-asus.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index c40b5c14c797f..905453a4eb5b7 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -318,6 +318,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>   			 usage->hid & HID_USAGE);
>   	}
>   
> +	if (usage->type == EV_KEY && value) {
> +		switch (usage->code) {
> +		case KEY_KBDILLUMUP:
> +			return !asus_hid_event(ASUS_EV_BRTUP);
> +		case KEY_KBDILLUMDOWN:
> +			return !asus_hid_event(ASUS_EV_BRTDOWN);
> +		case KEY_KBDILLUMTOGGLE:
> +			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
> +		}
> +	}
> +
>   	return 0;
>   }
>   

Possible commit squash candidate in to patch 7. I'll defer to Ilpo and 
Hans though.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>

