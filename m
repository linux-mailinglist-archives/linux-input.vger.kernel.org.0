Return-Path: <linux-input+bounces-5148-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE493C255
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 14:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A701C20F20
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2024 12:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B64A19AA6C;
	Thu, 25 Jul 2024 12:48:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9AE19A2B2;
	Thu, 25 Jul 2024 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721911728; cv=none; b=ueked7A+GWsWqODDCthMEqoN0ZHyJvKoqd2WUA128QQBFs6pBdpS7BRyoJztzaApDLmgSnz40PKjUAZBbEhsrcB/9bN58tLut7o3UBe79mGmXAN0OvR/SUcb86lvlcvFewkeeMYCfmLLo0cfCb1KvO1+ZJXf6G8GKK5mGDFF8io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721911728; c=relaxed/simple;
	bh=UWEdzEaMcLD0lGqWSV6HpaVhkIXsfG2/ugkaS8wWBdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fBtMdFWBT22Ep+l1QKkCVtu35/t6tcy7jOu+qdhkabD/lfEFogdSVB3mkV60MDwfKoOu7ARoxbOjhlByEEtpGLwtO6OZVYD8q9WbjJn+1JLI+tc8GfcMYvY20475A4t4h5nB12zDuhYLMN+fDIwCP5rF0NyP7UJZwfHhOkGyJAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07728087|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.121679-0.00208055-0.87624;FP=17686365795973719130|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023108233;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.YZYN6F6_1721911711;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YZYN6F6_1721911711)
          by smtp.aliyun-inc.com;
          Thu, 25 Jul 2024 20:48:36 +0800
From: wangshuaijie@awinic.com
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V2 0/5] Add support for Awinic SAR sensor
Date: Thu, 25 Jul 2024 12:48:31 +0000
Message-ID: <20240725124831.891084-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <b6cf55a8-5032-4db9-9431-b938158a1706@kernel.org>
References: <b6cf55a8-5032-4db9-9431-b938158a1706@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,=0D
=0D
On Fri, 12 Jul 2024 14:02:40 +0200, krzk@kernel.org wrote:=0D
>On 12/07/2024 11:49, wangshuaijie@awinic.com wrote:=0D
>> Hi Jeff=EF=BC=8C=0D
>> =0D
>> Thank you very much for your valuable suggestions. They are indeed a gre=
at help to me. =0D
>> =0D
>> There are some issues with this driver, but I will do my utmost to impro=
ve it =0D
>> based on your advice. I will change the input subsystem in the driver to=
 the =0D
>> IIO subsystem and place it in the IIO/proximity directory. I will also m=
odify =0D
>> the structure of the driver to make it appear more reasonable.=0D
>> =0D
>> On Wed, 5 Jun 2024 22:04:16 -0500, jeff@labundy.com wrote:=0D
>>> Hi Shuaijie,=0D
>>>=0D
>>> On Wed, Jun 05, 2024 at 09:11:38AM +0000, wangshuaijie@awinic.com wrote=
:=0D
>>>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>>>>=0D
>>>> Add drivers that support Awinic SAR (Specific Absorption Rate)=0D
>>>> sensors to the Linux kernel.=0D
>>>>=0D
>>>> The AW9610X series and AW963XX series are high-sensitivity=0D
>>>> capacitive proximity detection sensors.=0D
>>>>=0D
>>>> This device detects human proximity and assists electronic devices=0D
>>>> in reducing SAR to pass SAR related certifications.=0D
>>>>=0D
>>>> The device reduces RF power and reduces harm when detecting human prox=
imity.=0D
>>>> Increase power and improve signal quality when the human body is far a=
way.=0D
>>>>=0D
>>>> This patch implements device initialization, registration,=0D
>>>> I/O operation handling and interrupt handling, and passed basic testin=
g.=0D
>>>=0D
>>> Thank you for your submission! It's always great to see new devices=0D
>>> introduced to the kernel. Maybe I can give some high-level feedback=0D
>>> first.=0D
>>>=0D
>>> Unfortunately, I don't think we can review this driver in its current=0D
>>> form; the style and structure are simply too different from what is=0D
>>> expected in mainline. Many of these problems can be identified with=0D
>>> checkpatch [1].=0D
>>>=0D
>>> To that point, I don't think this driver belongs as an input driver.=0D
>>> The input subsystem tends to be a catch-all for sensors in downstream=0D
>>> kernels, and some bespoke SOC vendor HALs tend to follow this approach,=
=0D
>>> but that does not necessarily mean input is always the best choice.=0D
>>>=0D
>>> SAR devices are a special case where an argument could be made for the=
=0D
>>> driver to be an input driver, or an IIO/proximity driver. If the device=
=0D
>>> emits binary near/far events, then an input driver is a good choice;=0D
>>> typically the near/far event could be mapped to a switch code such as=0D
>>> SW_FRONT_PROXIMITY.=0D
>>>=0D
>>> If the device emits continuous proximity data (in arbitrary units or=0D
>>> otherwise), however, IIO/proximity seems like a better choice here. Thi=
s=0D
>>> driver seems to report proximity using ABS_DISTANCE, which is kind of a=
n=0D
>>> abuse of the input subsystem, and a strong indicator that this driver=0D
>>> should really be an IIO/proximity driver. If you disagree, I think we=0D
>>> at least need some compelling reasoning in the commit message.=0D
>>>=0D
>>> Regardless of this choice, this driver should really only be 2-3 patche=
s=0D
>>> (not counting cover letter): one for the binding, and one for a single,=
=0D
>>> homogenous driver for each of the two devices, unless they have enough=
=0D
>>> in common that they can be supported by a single driver. Mainline tends=
=0D
>>> to avoid vendor-specific (and especially part-specific) entire director=
ies.=0D
>>>=0D
>>> I agree with Krzysztof's advice in one of the other patches; I think it=
=0D
>>> would be best to study some existing drivers in mainline to gain a=0D
>>> better sense of how they are organized, then use those as a model. If I=
=0D
>>> may suggest, consider referring to drivers such as [2] and its cousins=
=0D
>>> in the same directory; these are capacitive proximity sensors that can=
=0D
>>> be used as buttons, but SAR devices tend to be built upon the same prin=
ciple.=0D
>=0D
>Not much improved in v3 in this regard.=0D
>=0D
>Sorry, this code is not ready for review. There are so many trivial=0D
>style issues, it's like someone sends us Windows drivers for Linux.=0D
>=0D
>Best regards,=0D
>Krzysztof=0D
=0D
Thank you very much for your suggestion. I will try my best to optimize=0D
the code and make it look more appropriate.=0D
=0D
Kind regards,=0D
Wang Shuaijie=

