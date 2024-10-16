Return-Path: <linux-input+bounces-7498-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9B9A0D33
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 16:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D59F1F27271
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 14:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79D720C486;
	Wed, 16 Oct 2024 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Jl66Mqnx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RWbHILdu"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C7920C02C;
	Wed, 16 Oct 2024 14:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090122; cv=none; b=AsWWU7x21uQMZVYO6xXa2VhoeiJZXwjRND4JW/P0yn728o8O9Zg5wB6Vd5/qgLIgvnjtYohYFgl1HnSyy/8smmnDe62AJyfQD8VVSjMYtV1X/R81UU8WkgoIm7qQRZwr0FG0DWUUdLcxqWysn133hS3n1AXvc/Nigdn4BCR9V2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090122; c=relaxed/simple;
	bh=koaEv8plL7ImL1xDiG1dFB24lf6Grn8XL69EidNFpjI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sjfnUHsVM6tLyGHho0Xyl2HR0QGU+JRBz0HCfTxt1Pc5K1k1bT90wfzYn3HFQWLW8D2YXozLd+RHIyNyTLaT7Jegtu334asGBrW1gCFEB/aYllzsU5IKIH/wniK6axxHNjn4f7F4KSQZta9ILyCb1qli7RJ/FsD1wb+O3ElAzPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Jl66Mqnx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RWbHILdu; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 4C8751380223;
	Wed, 16 Oct 2024 10:48:39 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Wed, 16 Oct 2024 10:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1729090119;
	 x=1729176519; bh=DXLlbdb3W9TNTR9amZdDTQUrEDRVXyjXRbPNQDAWL/I=; b=
	Jl66MqnxcP5mJC3F2q285XKuofOI460INmWAB1oBCAl7MQe9xWpg/shvznH3id8b
	SBhAbb5cEwSKpmcEniiHW/7F2GxbSMTD1DIHC2tS18+zxeLcQZ5k4y1NgQSNUAje
	CEEuq6XGuZUBJFI/qhLoGee1MFv4BxcJUjJMJ4w4Fk6SAR9DtliRwye2WsugIj5V
	wRXuziIhA56bnQoDPE+WTX9FZWfTFgAJSr8VYIcZR8x7ThC/k2zEF6cI+JSuilev
	1JMt2Yn/JuFrS+m+u2H5NbThKs3/uiXxtPDUtwOkSIarvhjh94JywJCaPvPVQrNp
	TvFdmO1tbAQrWyLaGAn0Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1729090119; x=
	1729176519; bh=DXLlbdb3W9TNTR9amZdDTQUrEDRVXyjXRbPNQDAWL/I=; b=R
	WbHILduD35X8yEiSoDAeUK0wDWYYZTN7O9uTP2/Ge1841M/XiG1Ctb0JJAROpmNV
	iOU1YAf10KM6f1i4ZXTwg+NEf9sT85taNuGXrio0XuC56Sl0hS8O4XL4WV4j31gm
	dZnjjOCLHCICXVvFOenKCsl5cjv3f6E/Dqo8QFWuYpeMu3ChXyVDj+CP3oulf8Lh
	C47dIrGNXjJ1p3oqfK5viyciil95zzXtjya6O23ZRtwQ7ugLGSp02SPi9x6eCn1N
	Y65/LFd5dtw++TVQZp4H0uDM5HFvS/Cr1OIQ54xmVDi7IwUm/XD+Bu2nHdwvzosI
	TYC09NhccbtYLdLlnNQ/Q==
X-ME-Sender: <xms:RtIPZ7qcQo-9yas-PmPklN-rl73K86lhd_J_sPWfoygBFK5YNRiHzg>
    <xme:RtIPZ1rzmec6g_O1rdG2Wsi1eI7x8AnH02V63Az0rjpyaGgU2wbB46uPQqzPARbBh
    -w7YRwZQXU8F3aYSeE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehtedugfelgeeltdevvedtleffhfetgfdtjefhkefg
    udejfeeuueefvdejuddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrihhordhlihhmohhntghivg
    hllhhosegrmhgurdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehg
    mhgrihhlrdgtohhmpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhug
    gvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:RtIPZ4PRh0ehPwk4E7iLoApoc2SIEtz2mQyWJCkFU4DVOkTAV4_PTg>
    <xmx:RtIPZ-5St37cFk_1W-EnvLlm6H837JQKcXZq0MkjU2ItxroMqYXwWQ>
    <xmx:RtIPZ67nO7yLD_9v3tjSl5LQ0P1z1TIFL757RC5FXj2bSvzfsRIf4g>
    <xmx:RtIPZ2iV9vBnNMe6MmQgn72YgbD2HCy7FFNQKRXZyf8MWhmebyEomA>
    <xmx:R9IPZxYIL_kpLph--bbrA4CYovGEfulL5MG5-R-P5bQvjwHX5L80iXFH>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB06C3360079; Wed, 16 Oct 2024 10:48:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 16 Oct 2024 16:48:18 +0200
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>,
 "Mario Limonciello" <mario.limonciello@amd.com>
Message-Id: <7c8dd434-11d0-417f-8d49-a2f506bb00fa@app.fastmail.com>
In-Reply-To: <39044aeb-f00f-c9f2-4249-437906d56631@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev>
 <20240930000046.51388-2-luke@ljones.dev>
 <39044aeb-f00f-c9f2-4249-437906d56631@linux.intel.com>
Subject: Re: [PATCH v6 1/9] platform/x86: asus-wmi: export symbols used for read/write
 WMI
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 16 Oct 2024, at 3:50 PM, Ilpo J=C3=A4rvinen wrote:
> On Mon, 30 Sep 2024, Luke D. Jones wrote:
>
>> Export some rather helpful read/write WMI symbols using a namespace.
>> These are DEVS and DSTS only, or require the arg0 input.
>>=20
>> Also does a slight refactor of internals of these functions.
>
> I'm a bit lost where this refers to. I see you're adding another funct=
ion=20
> but nothing is being refactored AFAICT.
>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>  drivers/platform/x86/asus-wmi.c            | 51 ++++++++++++++++++++=
--
>>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++
>>  2 files changed, 58 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
>> index 6725a27df62f..0a5221d65130 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -385,7 +385,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 a=
rg0, u32 arg1, u32 *retval)
>>  {
>>  	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
>>  }
>> -EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
>> +EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, ASUS_WMI);
>> =20
>>  static int asus_wmi_evaluate_method5(u32 method_id,
>>  		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
>> @@ -549,12 +549,57 @@ static int asus_wmi_get_devstate(struct asus_wm=
i *asus, u32 dev_id, u32 *retval)
>>  	return 0;
>>  }
>> =20
>> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
>> -				 u32 *retval)
>> +/**
>> + * asus_wmi_get_devstate_dsts() - Get the WMI function state.
>> + * @dev_id: The WMI function to call.
>> + * @retval: A pointer to where to store the value returned from WMI.
>> + *
>> + * The returned WMI function state can also be used to determine if =
the WMI
>
> "also" ?? You're lacking some context here what else this is useful fo=
r, =20
> you only talk about "also" part.
>
>> + * function is supported by checking if the asus_wmi_get_devstate_ds=
ts()
>> + * returns an error.
>> + *
>> + * On success the return value is 0, and the retval is a valid value=
 returned
>> + * by the successful WMI function call. An error value is returned o=
nly if the
>> + * WMI function failed, or if it returns "unsupported" which is typi=
cally a 0
>> + * (no return, and no 'supported' bit set), or a 0xFFFFFFFE (~1) whi=
ch if not
>> + * caught here can result in unexpected behaviour later.
>> + */
>> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
>> +{
>> +	int err;
>> +
>> +	err =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0,=
 retval);
>> +	if (err)
>> +		return err;
>> +
>> +	*retval &=3D ~ASUS_WMI_DSTS_PRESENCE_BIT;
>> +	if (*retval =3D=3D ASUS_WMI_UNSUPPORTED_METHOD)
>
> This seems buggy. First ASUS_WMI_DSTS_PRESENCE_BIT bit is unmasked fro=
m=20
> *retval and then you compare it to ASUS_WMI_UNSUPPORTED_METHOD which c=
an=20
> never be true.
>
>> +		return -ENODEV;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, ASUS_WMI);
>> +
>> +/**
>> + * asus_wmi_set_devstate() - Set the WMI function state.
>> + * @dev_id: The WMI function to call.
>> + * @ctrl_param: The argument to be used for this WMI function.
>> + * @retval: A pointer to where to store the value returned from WMI.
>> + *
>> + * The returned WMI function state if not checked here for error as
>> + * asus_wmi_set_devstate() is not called unless first paired with a =
call to
>> + * asus_wmi_get_devstate_dsts() to check that the WMI function is su=
pported.
>
> Please try to rephrase this mess. :-)

Bloody hell who wrote that??? :-|

Ack everything.

>
> --=20
>  i.
>
>> + * On success the return value is 0, and the retval is a valid value=
 returned
>> + * by the successful WMI function call. An error value is returned o=
nly if the
>> + * WMI function failed.
>> + */
>> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
>>  {
>>  	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
>>  					ctrl_param, retval);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, ASUS_WMI);
>> =20
>>  /* Helper for special devices with magic return codes */
>>  static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/lin=
ux/platform_data/x86/asus-wmi.h
>> index 365e119bebaa..6ea4dedfb85e 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -158,8 +158,18 @@
>>  #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>> =20
>>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
>> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 =
*retval);
>>  #else
>> +static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
>> +{
>> +	return -ENODEV;
>> +}
>> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, =
u32 *retval)
>> +{
>> +	return -ENODEV;
>> +}
>>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, =
u32 arg1,
>>  					   u32 *retval)
>>  {
>>

