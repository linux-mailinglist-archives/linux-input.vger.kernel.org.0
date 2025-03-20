Return-Path: <linux-input+bounces-11030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCBDA6AF89
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 657FE881C5D
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 21:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62D228CBE;
	Thu, 20 Mar 2025 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="C6A4CQfg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wsWzbRLk"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189971BD01D;
	Thu, 20 Mar 2025 21:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742504638; cv=none; b=d7FbQB27Nl5pw3M2u19zREDiAi9yBeNqhBJfuFgvb2MvaNl1/0Lw/BFEZR3WgmiwmFaq7kjLN+asNw3zXeKpvQ0rBPNYJtwUcAVwU0uoAARNAMXgtH0Oi62QREld0OAUx7DuG5qONrslw8CcNGS9daKC7adeuxNOkLZuCebDFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742504638; c=relaxed/simple;
	bh=G64RnsZyffb5HoNDyjvSqNe4yPGbkvKH5namj0omtWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPugb7crs0ua5rVD+0TB601bALM3yf8r/aT9BeBYRS/DQAqZkpJnhijMDl76eN5HbHLbRVJT5V5cbsl/wqmHmROsDUq7oyro/oKFI2LdM2ShywMjNmBSNFaU4sD3rAcIo+q/gE8E0BUKUaalmVuzPgYikwiqVqa1gz95W8Se6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=C6A4CQfg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wsWzbRLk; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 188F41380A27;
	Thu, 20 Mar 2025 17:03:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 20 Mar 2025 17:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742504636;
	 x=1742591036; bh=ly+PiDnpTmX6wAuUIPjJrP087guiCBammai7bWPbJqQ=; b=
	C6A4CQfgxGaEPcGkvmRM4uEi2wfB2+pmojCyYIpsP1Bs1pJ60AIrQ/7QzIqrmxr9
	RuiPduTtiRuiMvQFDWnQMO/yX77jo7Y27Z+ylc1RR5vAJK+hrDqu3upL+ZdlabWF
	n8vV+7w+jh+Q+P32lAPmySBiiXjOaxZzcC84yJs5L9NaFPJOqVroHe1tcgvP3wMi
	3d3VXBn/n1VMRs1WyC4cleNHEMK1RVLWTGYfziCvivvOQoIJNAWyBCiKrPLmaFjO
	8SJp/+h6vanxFG7kAZXLeqmeX0/kFnr6VGYlSQmOiu+R5yR6kHG21cfp4lTxY1LO
	2Yum5wUP4/I9w143JvohQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742504636; x=
	1742591036; bh=ly+PiDnpTmX6wAuUIPjJrP087guiCBammai7bWPbJqQ=; b=w
	sWzbRLkuEdbGJM+BksnSTOLnbi2m1kdUeT/3b15JwkxUG6xMdlR8qDAW9m3NO5Mg
	5mORXiPYAMWh79Ij9MlWOcKgppNsZruOFxJzRlO3zZVJsH4cE3NvikCELJ4buJGv
	KeIv9x3VJ/jekACQ8AIQAQl+AScw8MVqOQFNphjJH6p+zIP3z8NLlqiArmRLa1fj
	/gYOytoMj31FtqjHN8ukdvuXorsSAUngIcsUZuCwh9vwVNvc5b+XuuG6eXDXbgod
	pUC4ATs7+pgovWHpKOSmE00GVT7yJkzMSw/2gxPBNJ5y35UiUuiAqefCbkVfif6J
	RmJPiwV13wNbkB7As/vbw==
X-ME-Sender: <xms:u4LcZ8NDS0kq0JnCeRlcrjWEARs02UbjHYaGL1MpHSiKKYGwmnAsXw>
    <xme:u4LcZy8op60WlcdKezqJ90_i9lbVYJ2N-MQp5cL_FiJ9eu_hifm_XNDd8EMX2FQBe
    n2XNVT0rWL4lrAqxmM>
X-ME-Received: <xmr:u4LcZzSu-uKiaKcd8Slv1ALnJ6Y4t7_LqiRcLTUpjS5KqexH_Osd4HE0exBdimNw6D4In6eY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeelvdehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:u4LcZ0tQEtIvsU1N_HyL6JEzcDhJz5MRVrU_ecKYjZhokB2lSs-HSw>
    <xmx:u4LcZ0dWVzFUWG8gmWzQdXkmQV83hBvYIFBNz2q_RE6suDyrcluAjQ>
    <xmx:u4LcZ40iDhZbeG0Bi6AhIhdLfEq4FXl0uVvnQomMpFszMKJXWKF5Ew>
    <xmx:u4LcZ4_1qKlqsCU9X2SC0_phxWKfHHhTbwoi7j1oBQoCG1lrUl7E5Q>
    <xmx:vILcZ7yLQT602srq6KuZI0xAIPsMZCH9sKVzZ4AUdFXzkDGzevnx_CZk>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Mar 2025 17:03:51 -0400 (EDT)
Message-ID: <42531720-ad01-497f-96f5-5cd3ee16afa0@ljones.dev>
Date: Fri, 21 Mar 2025 10:03:48 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] HID: asus: introduce small delay on Asus Z13 RGB
 init
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-7-lkml@antheas.dev>
 <51c78ba6-9518-4259-85da-d761b031df7f@ljones.dev>
 <CAGwozwGsB4UjsHa=CWT2zzbpHx5yPEOtTA9RmVqR1jqMB4_C6Q@mail.gmail.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <CAGwozwGsB4UjsHa=CWT2zzbpHx5yPEOtTA9RmVqR1jqMB4_C6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/03/25 21:30, Antheas Kapenekakis wrote:
> On Thu, 20 Mar 2025 at 08:12, Luke D. Jones <luke@ljones.dev> wrote:
>>
>> On 20/03/25 08:13, Antheas Kapenekakis wrote:
>>> The folio keyboard of the Z13 can get stuck in its BIOS mode, where the
>>> touchpad behaves like a mouse and the keyboard start button is not
>>> reliable if we perform the initialization too quickly. This mostly
>>> happens during boot, and can be verified to be caused by hid-asus
>>> through simple blacklisting. A small delay fixes it.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    drivers/hid/hid-asus.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
>>> index 85ae75478b796..5b75ee83ae290 100644
>>> --- a/drivers/hid/hid-asus.c
>>> +++ b/drivers/hid/hid-asus.c
>>> @@ -571,6 +571,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>>>        unsigned char kbd_func;
>>>        int ret;
>>>
>>> +     /* Wait a bit before init to prevent locking the keyboard */
>>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ROG Flow Z13"))
>>> +             msleep(500);
>>> +
>>>        ret = asus_kbd_init(hdev);
>>>        if (ret < 0)
>>>                return ret;
>>
>> See my comment on patch 1 about trying a loop with the init
>> request/response as a hopeful way to test readiness.
>>
>> Cheers,
>> Luke.
> 
> Turns out there isn't an init problem. I have removed this patch from V2.
> 
> It was hid-asus taking control of the touchpad from hid-multitouch. So
> adding HID_GROUP_GENERIC fixes this. I replaced it with that and
> squashed the rename patch alongside it.
> 
> Antheas

Awesome. Is this the one on `#define INPUT_REPORT_ID 0x5d`?


