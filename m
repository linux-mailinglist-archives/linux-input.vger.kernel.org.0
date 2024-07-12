Return-Path: <linux-input+bounces-5008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134D92F858
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D299A282013
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F6714265C;
	Fri, 12 Jul 2024 09:51:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out28-148.mail.aliyun.com (out28-148.mail.aliyun.com [115.124.28.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CDF17BB6;
	Fri, 12 Jul 2024 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720777867; cv=none; b=n7cM58veBi/kd7uPuzFzLQR31N38YYO0nofHWejmyENJIn4JW50dAS1of2yP926tsB2+iqb37yNHh8ijuWfIXQTEHRKNxO8jUXOaI7RYo9LpAyof4tB5n0PzQJxRqbUHxOBuP0ZsOUZWGYrFIQIe8xKlP6yoMZfQmqYshR025oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720777867; c=relaxed/simple;
	bh=pUaulvtdD9qQg/45WX1ET2WbuAUsRQxwcTQt/oHElw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvvfrHbGrt9ateHdZYlivh6JfHo6F31+y6ukHzUCQWtJ80IF3yEaKSBgIhSa2cZoeP+rCRSL0W2D6vq8kqdGZlWD0bkCurkTF1UnGeG7Mp5jRsVH4B3HGRtXosAEx9Fh93s6o/eZQsIwOJpZAJJYBNUEyA5rB36LpXVGoeHyRbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.08055284|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.211365-0.00225663-0.786379;FP=16534973576804402570|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023108233;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.YOOi3cV_1720777846;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YOOi3cV_1720777846)
          by smtp.aliyun-inc.com;
          Fri, 12 Jul 2024 17:50:54 +0800
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
Subject: Re: [PATCH V2 3/5] Add aw9610x series related interfaces to the aw_sar driver
Date: Fri, 12 Jul 2024 09:50:46 +0000
Message-ID: <20240712095046.2396720-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <4d8b7fe5-a566-49f7-8924-3c310af2f7cd@kernel.org>
References: <4d8b7fe5-a566-49f7-8924-3c310af2f7cd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,=0D
=0D
On Wed, 5 Jun 2024 12:22:16, krzk@kernel.org wrote:=0D
>On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:=0D
>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>> =0D
>=0D
>No commit msg, no proper subject prefix.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>=0D
>> | Reported-by: kernel test robot <lkp@intel.com>=0D
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>=0D
>> | Reported-by: Dan Carpenter <error27@gmail.com>=0D
>=0D
>Drop all these, this is some bogus tags. Tag never starts with pipe, btw.=
=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> ---=0D
>>  drivers/input/misc/aw_sar/aw9610x/aw9610x.c | 884 ++++++++++++++++++++=
=0D
>>  drivers/input/misc/aw_sar/aw9610x/aw9610x.h | 327 ++++++++=0D
>>  2 files changed, 1211 insertions(+)=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw9610x/aw9610x.h=0D
>=0D
>...=0D
>=0D
>> +struct aw_reg_data {=0D
>> +	unsigned char rw;=0D
>> +	unsigned short reg;=0D
>> +};=0D
>> +/********************************************=0D
>> + * Register Access=0D
>> + *******************************************/=0D
>> +#define REG_NONE_ACCESS					(0)=0D
>> +#define REG_RD_ACCESS					(1 << 0)=0D
>> +#define REG_WR_ACCESS					(1 << 1)=0D
>> +=0D
>> +static const struct aw_reg_data g_aw9610x_reg_access[] =3D {=0D
>=0D
>Ehh... so we are at basics of C. Data structures do not go to headers.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>=0D
>Best regards,=0D
>Krzysztof=0D
=0D
Kind regards,=0D
Wang Shuaijie=0D

