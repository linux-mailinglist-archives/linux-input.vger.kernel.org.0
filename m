Return-Path: <linux-input+bounces-13625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D450B0D2F7
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 09:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70970AA1B86
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 07:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9B02D3EFA;
	Tue, 22 Jul 2025 07:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DRjxpDyC"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F412D5C89;
	Tue, 22 Jul 2025 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169089; cv=none; b=jL4iJHXPUaqKNrVSjku5FQcoqgt3+/9uUVmemmz1/pkG5MP/+yooe+C+s3nMW4jC6sDqE6DMIq61caDze0velNgN6NpiKBEFjUJfci49x36YBcSzh6yGGfmLVbmPdiOcInY+JYHz3m5ea96YEpi9kwnuWdCrbsyzvyCvROlLvEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169089; c=relaxed/simple;
	bh=NKFAAK1bYRNZFBYpr97jStjHpbFo4r8a32WqU1lxnrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ipP9AO0CACedQ4tgmibKDOAhBodrr2cuhw4S7l32bpji4zYzW78J1b9N4nBGvt+Cv4+lUof7gLo+L6Xdk7exUcsqxCFxI/Vo1SX/ZC83NhZwoqxp7X2BigNimSCb9jhr18HS0atuGAsZh3c3qpFPz688V07Fp7r87SCIWzwpI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DRjxpDyC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753169084;
	bh=NKFAAK1bYRNZFBYpr97jStjHpbFo4r8a32WqU1lxnrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DRjxpDyCILnHFo0KPUjoa0uDdfeXKcbhuDlahuHjD+jDd7z5z9fzghPvgO3uPs23+
	 olfWegtqHZ8yYAxyhjZytlH4Z72QnXLGzUt0953OAf7qdhzA14ADL0Ec1yi16yzJU2
	 EuqydPziE/j7MrcA31pLoib+mId5ZEgp8tionlM/xsdR7pfkOrTb0V9O2egnjUDiIk
	 tniez+qBh4wd40wLSacMRBNLwOSVGb1qjamU3qSuTfdTb4So4Sdf3TUos3mAXL2Xkq
	 fUGcwpkxFFxpeg6gf5Fhi76XsFt1MSxwlyhPyfgUxPlA2Y0iSiusrcZxyWjs+pnehd
	 8We8H77Kd339g==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 894FA17E05F0;
	Tue, 22 Jul 2025 09:24:44 +0200 (CEST)
Message-ID: <44468cbc-6dc1-4b73-a2f5-eca7742241b3@collabora.com>
Date: Tue, 22 Jul 2025 10:24:44 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] HID: playstation: Add support for audio jack
 handling on DualSense
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, kernel@collabora.com,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com>
 <s4596421-sr43-893r-o90r-86nr588sp32q@xreary.bet>
 <74d4675d-d6f5-41ed-b715-f62fb569df5d@collabora.com>
 <CAEc3jaAFV_PXdFAX9th4-hhKNAhBKdVCNP+Qf8nH=g8FwoCabQ@mail.gmail.com>
 <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAEc3jaAGP3HV_+tGLHWZXA-baD4HkA2nYWGxpmox4cuZMh+ksw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Roderick,

On 7/22/25 8:47 AM, Roderick Colenbrander wrote:
> Hi Christian,
> 
> I just got back from Japan (trip was a bit extended). In the meantime
> I had some of employees had a look as well.
> 
> The audio patches towards the end seem to be okay. We tried to dig for
> the official volume numbers, but they were too hard to find (too many
> layers, too many repositories). When we use a PS5, the default volume
> for the headset and speaker are both close to 70% (just eyeballing).
> At the hardware level the volume is quite non-linear and internally we
> use a mapping table (not sure what the curve is based on). For the
> speaker this starts at 0x3d as you found out already. The 70% volume
> for the speaker seems to correspond to a value of 93 and headphones
> 83.
> The set pre-amp gain of 0x2 is a common value we seem to set and means
> +6dB, so change comment around to mean that I guess.

Thanks for the additional clarifications.  I added a fixup below, if Jiri is
fine applying that before merging, just to avoid respinning the whole
series:

Subject: [PATCH] fixup! HID: playstation: Support DualSense audio jack
 hotplug detection

---
 drivers/hid/hid-playstation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 4285260c7e22..641c6337ff63 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1352,7 +1352,7 @@ static void dualsense_output_worker(struct work_struct *work)
 				 */
 				common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_SPEAKER_VOLUME_ENABLE;
 				common->speaker_volume = 0x64;
-				/* Set SP preamp gain to ~30% */
+				/* Set SP preamp gain to +6dB */
 				common->valid_flag1 = DS_OUTPUT_VALID_FLAG1_AUDIO_CONTROL2_ENABLE;
 				common->audio_control2 =
 					FIELD_PREP(DS_OUTPUT_AUDIO_FLAGS2_SP_PREAMP_GAIN, 0x2);


> As for the other patches I'm not entirely sure yet. I know they were
> well intended, but let me just say, they rubbed some of my team
> members quite the wrong way resulting in some heavy discussion. I have
> somewhat similar feelings about the ultra strict checkpatch toggle as
> well.
> 
> We had to move mountains to be allowed to even upstream controller
> code among our limited time (it is closer to a hobby thing, even
> though many products nowadays use it as well). So that's a factor
> which adds up a bit as well.
> 
> I think some of the patches we could live with if it came to it. There
> is no real agreed up full kernel standard (as it is contentious). So
> for example we tend to prefer more uint8_t family, where older kernel
> style was more u8 and the kernel allows for both. I think we would
> probably lean towards keeping it at the modern form.
> 
> Some of the macros also felt a little too magical. Our feeling tends
> to be if you have to go many layers deep to understand what a macro or
> line of code does (and it is easier to then printk the value),
> something feels off...

I'm sorry for all the troubles introduced with the additional patches! My
intention was not to highlight deficiencies with the current implementation,
but to bring the driver as close as possible to the coding standard agreed
by the kernel community, to avoid dealing with the kind of problems that I
tried to explain a while ago.

Thanks again for your support,
Cristian

