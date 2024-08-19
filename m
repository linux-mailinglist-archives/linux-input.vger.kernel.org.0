Return-Path: <linux-input+bounces-5651-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEEC956358
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3111F21748
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8EA171CD;
	Mon, 19 Aug 2024 05:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Ye+gWGYb"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DDF322A;
	Mon, 19 Aug 2024 05:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724046829; cv=none; b=gvD/rZzJbDSr6k+IPxWZ9b4o4YNF6WJ+wwADqybsqfLp2r01NjBPile9r5JIhoGvOC3oFsWJZ4+bj4nBBB80o6EbtJ8uVSwTnOynpU23ddBQz6+7ms0/2qtL8wuSvY0rAwNPsAb3hUAnIlAb2SA26TLSWVrCBWl9plrkdQZqfUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724046829; c=relaxed/simple;
	bh=b8n7vIe9HVK/PceYdqzSIPuxMo1LJdy9T7A9AV+o2Ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s4vC8tWeyupx9GlAJrBLG194VDxlPclOmmTTLbbaQUGXFx3xQlNXFZby6UjkOSVQROF3scvFzGoEfVodZolsp1MrOmIITP/pSrOm2SGUUE83pqIMQqO6EVv58YqD1ByaS1yT2TEZcMMnS74uIlVtEHgNrRNu+fu0TnxBnBt7xt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Ye+gWGYb; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724046815; x=1724651615; i=markus.elfring@web.de;
	bh=b8n7vIe9HVK/PceYdqzSIPuxMo1LJdy9T7A9AV+o2Ls=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ye+gWGYb4lzg5nyzWz4pfY0vy7AJcgE2l/v31VXqM/rwXh4sfLkMSD4gyTujFu5x
	 y0vTYS6TTYKCVbP1TazqwicU7U3EZde3bbdlrTIEvzJhEh4APG//xz2PLWH2gklkK
	 MZDo2wtprGn+fOY/frJj/JlfsUcMr9hogZujhMTPCdHSteoS1IytgpdcUdIHI387I
	 wkRp0vOaeU9OsI0qfa6XyMW/kRJzQ+vUqpZPq41tpJYGJNkv4DJFfpRnS3BCeEFF1
	 cqepVZXJt6Hjkv95zcsfO+byEYiMqFD5pKrbgpv24HW9yFeCIqYVzkrPf4nV/6NIv
	 EQmnl6Saa1vhoVpHNg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d3k-1rzwfP2oXo-00xlqQ; Mon, 19
 Aug 2024 07:53:35 +0200
Message-ID: <e0ccc03a-7479-4243-bd12-4d77b47308f4@web.de>
Date: Mon, 19 Aug 2024 07:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: HID: corsair-void: Add Corsair Void headset family driver
To: Stuart <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240813153819.840275-3-stuart.a.hayhurst@gmail.com>
 <aa331200-205e-4b00-ae02-343c96c52ae8@web.de>
 <CALTg27kAMd-0tQdJ+k4Ur9i=kZ0qY_vffhm3ZT+_CX6tD_874Q@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CALTg27kAMd-0tQdJ+k4Ur9i=kZ0qY_vffhm3ZT+_CX6tD_874Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GfiaqouPaIUb/OSVBDE49ARgft5mhEpihb+a5ofaybEpEs9y0SG
 6wfHv5udRKfNE7vAD7/WBrBjZD4z6Su9k9Jrbbj03FLxKLlh81r1kKHy1WSEyHYaWYiA9le
 aAsOykny/8926n5CL+jJF+GxwTLoeagp17oNLi+vTfu6/L5TkppQoBaNjzEb9aw0z6TyPhc
 mM/FaS4iTCpDA93Nymk+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YHeD7dD74rc=;TCw+dC7QAde8fw3xi5kcC5AxzLt
 Xp2VKUD6QnSnfeb6wBZRytGsIXNbZasXqCORjQ4fPmy/Urz6JuKpwZx5fN+vw9wTn/joUu7sw
 ffRpbqton86cfQfnM39UMvRCFQIwG/7JBJA3gih5SLZNT5CkdAhY1TalMze0eUrqN5bF8hIkM
 y/RijHL25YNVVcwYAZ3paB1Pzwo8Jn4oq610jZXxDDjjZ9SJm5+YOwfnLFEGplqIgEy8m1g77
 JIMDafPV1qA6SJ1WTKVXjHyo6Rsvq3mphJT/B+aIhG310s8qvIepkV0ue/VesPQAR3ryF4sVQ
 +1SZSgquC9pSanMVSCZajA5ALjqkmXi+R3IMICmQdJ5EN74/6CdxtaLi3DotkVK4x3YkRmIjr
 Ssz1clZkWHLN4qsvo4PRYacz7tpSH2Pvc0V0NXRH13Fp4TQs/kBG6aGdZ4sAnIWqIecMrhyZx
 GUZyy9Wn+GyoUjyD9I5aboPlKIS1udfoUDMLd3pHAQ7rv4CRcnpCqbQ6QkS9U0DSv7PjDxfQl
 BhasT5wC22egYNyg8tQ/nn+wHbROuACY0dnxdLRg7HwRrJlv2MAXDFaY+t111g20sDbGpbXrv
 otidm3opGhVEY0wSGGiBQQu6omOnGK8YSNXDhkMgls50q3BccGuM2PVC2f393WuCRDW294h18
 QAvHre45Q56Zn3ZqTGH+8tgYOlAg9/5Uh+BSLTXew8718sOEs1BjP5FWAK9xHS8UL+YfJu7Rh
 E2/bdc0ayZlicx1DoGJkW9QeDzJnCeky7LGyPDdDeh0yJPM2NmtR6/oUMBTiUTK3ORvugk0Xp
 xAOS7gFkHpQIDM472Fr+a/Vw==

>> How do you think about to distinguish properties any further for availa=
ble
>> device attributes?
>> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/driver-=
api/driver-model/device.rst#L38
>
> Sorry I'm not sure I follow you're saying

I became curious about system fine-tuning possibilities.


=E2=80=A6
>> * Can the macro =E2=80=9CDEVICE_ATTR_RO=E2=80=9D be applied?
>
> Done, also applied DEVICE_ATTR_WO
=E2=80=A6


How will applications of macro variants evolve further?

Regards,
Markus

