Return-Path: <linux-input+bounces-5007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2A792F855
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A5D1F21388
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51EBB1422C3;
	Fri, 12 Jul 2024 09:49:51 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out198-21.us.a.mail.aliyun.com (out198-21.us.a.mail.aliyun.com [47.90.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4317BB6;
	Fri, 12 Jul 2024 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720777791; cv=none; b=n0KY42USL1W0Gb5T9kL0B2ZWqyQT7vQQRmwpTws+nma9WXgPyBuzlM8gQRTQewJG7Fqv0Si1MV4RqMt1UpBEND8bVoGhExUINAoASGChMPJOIdNsls4O1RQZGyXaxMl0JxNZnWzwx1Y2dcOceLcPOAgp0kG8P47SqO+g0MXiaNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720777791; c=relaxed/simple;
	bh=EHDCgSxdcxli6ZE4N2WGxdfP7GEfKttdBNn7nkSMXd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qs9g6f89Sf4DmkaIP0VqYxly6y3B3EaSRDBTAJ77wzEPPsblS+LBf7fVb8jSDxqK92wX82/lQoDpa5ARzpM9QDf4LJ1cjz/JyFEoNu13gchprJSH5vWryBHXVK2iBzajpn48Womq5q8KcEnF+d/PjoacssbgPeSW/kicVg83XX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07442728|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0179968-0.000107478-0.981896;FP=16523871945317008474|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033070043001;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.YOQ2KFF_1720777765;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YOQ2KFF_1720777765)
          by smtp.aliyun-inc.com;
          Fri, 12 Jul 2024 17:49:33 +0800
From: wangshuaijie@awinic.com
To: jeff@labundy.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V2 0/5] Add support for Awinic SAR sensor
Date: Fri, 12 Jul 2024 09:49:25 +0000
Message-ID: <20240712094925.2395733-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <ZmEnMPhKzqkJssQE@nixie71>
References: <ZmEnMPhKzqkJssQE@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jeff=EF=BC=8C=0D
=0D
Thank you very much for your valuable suggestions. They are indeed a great =
help to me. =0D
=0D
There are some issues with this driver, but I will do my utmost to improve =
it =0D
based on your advice. I will change the input subsystem in the driver to th=
e =0D
IIO subsystem and place it in the IIO/proximity directory. I will also modi=
fy =0D
the structure of the driver to make it appear more reasonable.=0D
=0D
On Wed, 5 Jun 2024 22:04:16 -0500, jeff@labundy.com wrote:=0D
>Hi Shuaijie,=0D
>=0D
>On Wed, Jun 05, 2024 at 09:11:38AM +0000, wangshuaijie@awinic.com wrote:=0D
>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>> =0D
>> Add drivers that support Awinic SAR (Specific Absorption Rate)=0D
>> sensors to the Linux kernel.=0D
>> =0D
>> The AW9610X series and AW963XX series are high-sensitivity=0D
>> capacitive proximity detection sensors.=0D
>> =0D
>> This device detects human proximity and assists electronic devices=0D
>> in reducing SAR to pass SAR related certifications.=0D
>> =0D
>> The device reduces RF power and reduces harm when detecting human proxim=
ity.=0D
>> Increase power and improve signal quality when the human body is far awa=
y.=0D
>> =0D
>> This patch implements device initialization, registration,=0D
>> I/O operation handling and interrupt handling, and passed basic testing.=
=0D
>=0D
>Thank you for your submission! It's always great to see new devices=0D
>introduced to the kernel. Maybe I can give some high-level feedback=0D
>first.=0D
>=0D
>Unfortunately, I don't think we can review this driver in its current=0D
>form; the style and structure are simply too different from what is=0D
>expected in mainline. Many of these problems can be identified with=0D
>checkpatch [1].=0D
>=0D
>To that point, I don't think this driver belongs as an input driver.=0D
>The input subsystem tends to be a catch-all for sensors in downstream=0D
>kernels, and some bespoke SOC vendor HALs tend to follow this approach,=0D
>but that does not necessarily mean input is always the best choice.=0D
>=0D
>SAR devices are a special case where an argument could be made for the=0D
>driver to be an input driver, or an IIO/proximity driver. If the device=0D
>emits binary near/far events, then an input driver is a good choice;=0D
>typically the near/far event could be mapped to a switch code such as=0D
>SW_FRONT_PROXIMITY.=0D
>=0D
>If the device emits continuous proximity data (in arbitrary units or=0D
>otherwise), however, IIO/proximity seems like a better choice here. This=0D
>driver seems to report proximity using ABS_DISTANCE, which is kind of an=0D
>abuse of the input subsystem, and a strong indicator that this driver=0D
>should really be an IIO/proximity driver. If you disagree, I think we=0D
>at least need some compelling reasoning in the commit message.=0D
>=0D
>Regardless of this choice, this driver should really only be 2-3 patches=0D
>(not counting cover letter): one for the binding, and one for a single,=0D
>homogenous driver for each of the two devices, unless they have enough=0D
>in common that they can be supported by a single driver. Mainline tends=0D
>to avoid vendor-specific (and especially part-specific) entire directories=
.=0D
>=0D
>I agree with Krzysztof's advice in one of the other patches; I think it=0D
>would be best to study some existing drivers in mainline to gain a=0D
>better sense of how they are organized, then use those as a model. If I=0D
>may suggest, consider referring to drivers such as [2] and its cousins=0D
>in the same directory; these are capacitive proximity sensors that can=0D
>be used as buttons, but SAR devices tend to be built upon the same princip=
le.=0D
>=0D
>[1] https://docs.kernel.org/dev-tools/checkpatch.html=0D
>[2] drivers/iio/proximity/sx9500.c=0D
>=0D
>> =0D
>> shuaijie wang (5):=0D
>>   dt-bindings: input: Add YAML to Awinic sar sensor.=0D
>>   Add universal interface for the aw_sar driver.=0D
>>   Add aw9610x series related interfaces to the aw_sar driver.=0D
>>   Add aw963xx series related interfaces to the aw_sar driver.=0D
>>   Add support for Awinic sar sensor.=0D
>> =0D
>>  .../bindings/input/awinic,aw_sar.yaml         |  125 +=0D
>>  drivers/input/misc/Kconfig                    |    9 +=0D
>>  drivers/input/misc/Makefile                   |    1 +=0D
>>  drivers/input/misc/aw_sar/Makefile            |    2 +=0D
>>  drivers/input/misc/aw_sar/aw9610x/aw9610x.c   |  884 +++++++=0D
>>  drivers/input/misc/aw_sar/aw9610x/aw9610x.h   |  327 +++=0D
>>  drivers/input/misc/aw_sar/aw963xx/aw963xx.c   |  974 ++++++++=0D
>>  drivers/input/misc/aw_sar/aw963xx/aw963xx.h   |  753 ++++++=0D
>>  drivers/input/misc/aw_sar/aw_sar.c            | 2036 +++++++++++++++++=
=0D
>>  drivers/input/misc/aw_sar/aw_sar.h            |   15 +=0D
>>  .../misc/aw_sar/comm/aw_sar_chip_interface.h  |   27 +=0D
>>  .../misc/aw_sar/comm/aw_sar_comm_interface.c  |  639 ++++++=0D
>>  .../misc/aw_sar/comm/aw_sar_comm_interface.h  |  172 ++=0D
>>  drivers/input/misc/aw_sar/comm/aw_sar_type.h  |  396 ++++=0D
>>  14 files changed, 6360 insertions(+)=0D
>>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sa=
r.yaml=0D
>>  create mode 100644 drivers/input/misc/aw_sar/Makefile=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.h=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.h=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw_sar.h=0D
>>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_chip_interface=
.h=0D
>>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface=
.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_comm_interface=
.h=0D
>>  create mode 100644 drivers/input/misc/aw_sar/comm/aw_sar_type.h=0D
>> =0D
>> =0D
>> base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58=0D
>> -- =0D
>> 2.45.1=0D
>> =0D
>=0D
>Kind regards,=0D
>Jeff LaBundy=0D
=0D
Best regards,=0D
Wang Shuaijie=

