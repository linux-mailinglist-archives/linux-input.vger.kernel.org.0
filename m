Return-Path: <linux-input+bounces-6848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA1988EDE
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 11:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A388B2149A
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3401919DF8D;
	Sat, 28 Sep 2024 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Y8W70Dye";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="b4iJJNXX"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFD214F119;
	Sat, 28 Sep 2024 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727517162; cv=none; b=DJDTa/E8pCzYletl5KiiImw8C5i/FY2oUg3XfKx6J9v5n2n4Rdvo0MFPE1psEavjFjgiaDP4AmR8oWs++o1LJ0N5v24T0n4g95fVl/nr6NToxbNnfj8ATPaBpCLi5AlP0n13u/qUlbebJlAAs12wTLG8zoBA+mFbQ8+1jp2REck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727517162; c=relaxed/simple;
	bh=eMALNyrAq9y7XaMy1BGXez25JrtONrc/+1fOA+W8foU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nNOfJ5rrQD5XFu6MGdDHEh6BhEO62i3X+g/CXzWR+HhjJxrM7FMc1S/uqwvjs07dIa2jEPkJI+WstvfobaLaQli57+ft+Rgq17aZEDY32WpkYjb8+p6NXPjbURdHUsUtuoFK6iPkxH5o4tAGbutsz87+t0edmB3NEnV6IFbYRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Y8W70Dye; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=b4iJJNXX; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id A86D1138069C;
	Sat, 28 Sep 2024 05:52:38 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Sat, 28 Sep 2024 05:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727517158;
	 x=1727603558; bh=Vuba4RPxnCDUHffkkWoSXGtBaXpWK1I3TvufrbHfTME=; b=
	Y8W70DyeC9Nb93i69K6X4Vs+Mf4/q8MtZFvKmG3f0PQSg7a/RdRxCjOcYq3yXH3O
	taMftHnMhWTxexHUpbZodyDv+lZw9vtr/bwk9LHhN/70Uw9N1M8MEH0j0802LYpO
	j9vSN1K5GCKx+NLy2OFuZWN/hC7//FqG+T63l3tFwt5e1IdujYWxivNZdVqItpHk
	Awoc6VIzzmwct/iVVewlgYNON2XWtFR681/m1zGOsNY86VI2TG2BgOOqN4p4NyjZ
	J73iOX9wdIo3DMI0nRDrKkNCLiZZABIHBP4XX4HmzYOQ+Nr0lPMCmjce4I2Cv4qj
	22HSlSAn3qp1daPHpBcppw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727517158; x=
	1727603558; bh=Vuba4RPxnCDUHffkkWoSXGtBaXpWK1I3TvufrbHfTME=; b=b
	4iJJNXXAZh1XtsS+bpvw9/HcUKw3j+QdlK2XumU1IFKRuO6K4V+7UWAwoFXZTedz
	52subxxprYFBsENQLrCiTH4UWkyAJYZWo4NSpdQFEXyK91YUG6rk3nz75+t52pW4
	briA3TZiz3CPAO7ERWdPTO2AO7S1EVtcrG2wVG6JZwChGA8B5k3Jb9Va6hxGMkGK
	nMCZMp/bYo78VIjQ1l/31E7oF1zL+2wNNaxsdUgN9/tqWiR2y/EGzIdeezVJfWZS
	kUqnLwDPZ/Lu8nQpOlE73JqIUOQifFEAs7kn/i8o/jhJc7qhiCKXhiJoDPFVeRyQ
	BK0irx2mcC8MEzz1mw21g==
X-ME-Sender: <xms:5dH3ZrNCalyu861zLst46lBzGoPa3aptv0VUGGCtCOeBV3XBbefhfw>
    <xme:5dH3Zl9UJdBo3GArTRYVCZ7KVkd0n14r2rcjUmwJl1WJH697OrVxsNKYKrvxjKrnh
    Vz4TtzYG_gUqVDDpAs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddutddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfnuhhkvgculfhonhgvshdfuceolhhukhgvsehljhhonhgvshdrug
    gvvheqnecuggftrfgrthhtvghrnhepgfeiffehtdfghfettdeiuddtfeekvdejgfevhefh
    ffevtdfhjeelgeefffekvdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrh
    ihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    huphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhi
    nhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvg
    esrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghr
    qdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5dH3ZqSepkqE3_TpiqeMQEYR6VfEeYLlER4cGx05uoCN20CpO2Haow>
    <xmx:5dH3ZvtPjDfTFFYw-4--YQb0m01u9_nllk_l76vigqcJNjjYYnJbWw>
    <xmx:5dH3ZjdUQVgTeQN0c2C2CD3Et88-TjwkaygAZbr1M9JvlapWM5nc8Q>
    <xmx:5dH3Zr3hFBscuQ7XsoA7xQpW6k0mivAySZbaov2qYS0ibkuSvW4WVw>
    <xmx:5tH3Zlu0mPHX2UWXBC_Ec6cewYc51msdO5SnNJ54vlPkMEDWVySTdxo4>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AE6AC3360077; Sat, 28 Sep 2024 05:52:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 28 Sep 2024 21:52:16 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <b0bf1b66-5f6b-484f-aaaf-ccd10459e0e8@app.fastmail.com>
In-Reply-To: <919a3891-4024-4b67-81ae-93f3c87ee37b@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-4-luke@ljones.dev>
 <c88f9f36-37f1-4607-aa0c-2baa671c946b@kernel.org>
 <81e62b04-3c1d-4807-b431-d13cf7933054@app.fastmail.com>
 <919a3891-4024-4b67-81ae-93f3c87ee37b@kernel.org>
Subject: Re: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 28 Sep 2024, at 2:45 AM, Mario Limonciello wrote:
> On 9/26/2024 18:20, Luke Jones wrote:
>
>>>> + asus_armoury.mini_led_dev_id = 0;
>>>> + if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
>>>> + asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
>>>> + err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>> + &mini_led_mode_attr_group);
>>>> + } else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
>>>> + asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
>>>> + err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>> + &mini_led_mode_attr_group);
>>>> + }
>>>> + if (err)
>>>> + pr_warn("Failed to create sysfs-group for mini_led\n");
>>>
>>> Shouldn't you fail and clean up here?
>> 
>> Honestly not sure. It's only a failed WMI call, and the group doesn't get created for that fail, the others might be fine. I'll defer to your advice on that.
>
> It comes down to whether failures are expected on some machines or not 
> in practice.
>
> If a machine will fail to create groups, then yeah you should allow 
> skipping.  If it doesn't then I feel you have a much more logical 
> cleanup and support strategy if you unwind on any failure.
>
> Hans or Ilpo might have some thoughts here too.

I see now that I wasn't thinking clearly about this. I was zooming in on the asus_wmi_is_present() and just somehow blinding myself to the fact that, *that* isn't the error source.

Thank you for catching, I will update the code with proper unwind and handling. 

>>> I think you should be using this mutex more.  For example what if an
>>> attribute is being written while the module is unloaded?
>> 
>> Good point. I'll adjust code to suit. However if I do, this will trickle through the other patches I've added your review tag to. Will this be okay?
>> 
>>>
>
> If they change in a material way drop my tag and I can just re-review.

Looks like they haven't :)

