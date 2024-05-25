Return-Path: <linux-input+bounces-3834-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6308CEFF7
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 17:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D070A1F21AE5
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 15:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C29D84DF9;
	Sat, 25 May 2024 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BB4VBiZx"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B903376F4;
	Sat, 25 May 2024 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716652446; cv=none; b=lDfBW0B4YuyMKtWIcT2gPvyLWttodDHX2KTMy41DUJMVybcSK2ldx4/ELnRk9f3pr6vSVQFr7f+G53M0X2qU8uVMGZdXhvy6Y4cmlteqahEk0xnT0lQEUWTdomYtNAVkOuuRdZYEfosrVIyrDlfPIunRIdWGjl6Sza3lNve91RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716652446; c=relaxed/simple;
	bh=L4m7Fdh4Tj1XBqkhWZwUbBfV6T54F9ZygtQb5A6gqLg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=G7XrutzE5K0Nj8W2x3EAs7XXUpsmJw6/1lSKinGBU10GJsOvLh9wLVM2NDSWZdbYGCEYlUIKGUKMH/F8BTfHENp7+/HG+C6IafllcQSuJIByiNjZHWTGwNsm6iFoyTvzjZHeINn0+yrj4ssqp/qCfub73GvfjtH4Kas1RLvGTFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BB4VBiZx; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716652396; x=1717257196; i=markus.elfring@web.de;
	bh=L4m7Fdh4Tj1XBqkhWZwUbBfV6T54F9ZygtQb5A6gqLg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BB4VBiZxXgWCAnrwgXJG5osFFN6ugZX5WYXapZDRaJ+uN/ko/DAYyv8rkQ6v5IVI
	 zmO5lnS+gZmFSd3OrdraB2zcq2n2IPGKijol8Y4T7Qgj14C4iAZq9AucbGLvJK1aH
	 jbfMV5PbNLG4W5fRcnht1qyVhOOdIjJF0fg5Wpw6gLhMxB8tFcr4M9ow/KKXHA1le
	 I+JbCoLnPJYumnP0ICYLfk/lnkH3s2fFapEaBANIIZw9anLzjyAr6uyiDGEwQ7QYC
	 uh9lG42ek/CUdavLD3Geh6jMS5lxvlTDgjwboE9N569FzefLAzm9XmemBcbDIgUTB
	 rooYb/rrR1DHtwj3Gg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N2jaS-1sepe40oLE-0131uc; Sat, 25
 May 2024 17:53:16 +0200
Message-ID: <448230a6-1afd-416f-a430-3fc83d81908f@web.de>
Date: Sat, 25 May 2024 17:53:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexey Makhalov <alexey.makhalov@broadcom.com>,
 linux-graphics-maintainer@vmware.com, pv-drivers@vmware.com,
 virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Ajay Kaher <akaher@vmware.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simon Horman <horms@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tim Merrifield
 <timothym@vmware.com>, Zack Rusin <zackr@vmware.com>
References: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
Subject: Re: [PATCH v10 6/8] x86/vmware: Correct macro names
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523191446.54695-7-alexey.makhalov@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cmJLXeOyO6RwrkGVOYZa3TDqSK+xvVSWKeWZu05zk6kvDxPi6KM
 VI24pllby/m9VxcIP611LmnPKT3Fkb6lA6kPaZTrlGfidwOThVsC+SImxKngIDDFV6xW6BP
 J6RXUK+VqU+ENdI7eNUSxO6SAl82GwEAtBReZA6WBG+5uxYWZk2/ZxJmuB9BaqFOoor088e
 IJYEq2ueiDM77HRnLv6Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F/nmIhTSQEM=;WriBGqpL96mcTgTrjkKuqUYepA/
 UohE/5dqPTe/KgqqIo6WN4SmC2QoADhjOr1NRsUjVJlCorMWJdgT+OGfndZfvuYSll/4sGSTb
 abUFhN6sj6CunNVjqF7byQLs2Jg/VI6HlWk0ZZC20SecLBIp2/GBPqABkmr3W+PJQuSwrvXrI
 /gJwrghxNrelmCCaBCHdqtv9ndEagLjQpSGNodYv9OPFL7kYDorV4dqvT8FCcYTFrhVeV1prI
 oO6SYTA9y7H3WsRSO5s+EgGf9Ko3livXoMiaUarggm9xSeR21+EePao32z1MR0F7+sfppeo32
 dvw94GD9I+92QP+DThlY8uXQyw3SZt36Z/iNrpGUmuZjzWMtPsFzDuhuB+jLC17VP7kYO7hmn
 R3N+3K6k6h2BTGWSncnZaKW6VEYsaSzkKzVH03iQY5JyBlr1EAaDUtulo26XRNL/25ktFQf+0
 FpPsRZ+7H0ninFsvM2GhVEPzyXeRw8KjI1MQf0iAU+XOv1z4hSI61NHwzX5h1leBsQ2MwoA91
 ZLVvQdisSvpzC6VAiMNdQM1pg98ynpkS6Zfmmbv7VNr4M9pkpRsPu7A86dTm+wUPF1ge8OWTK
 UFDe5kcry8dYUDcnMpbCuOfHRaCV4MjXSKgjim82LE3reHwBHWyJD813B9dpQr7MhQrp1sVmU
 sGLuRvFwNOqz2cuRtcQ/VSL2NN6GW1GoPCAXw79Uws/tI88dgCJ0fYbc/6Mnk/XwUFWcnMLlN
 /nE9UjAnsNkT1sL97A65WFkmwcjX5aevSrBByJ3Fwuhl/tGsA6puCYjY90gRZ7vEGqmqOi9BC
 xI8eZTNeTIvWxeuVJ+1tDC82CUxAg53nQ34H/Cc0p/qlM=

> VCPU_RESERVED and LEGACY_X2APIC are not VMware hypercall commands.
> These are bits in return value of VMWARE_CMD_GETVCPU_INFO command.
> Change VMWARE_CMD_ prefix to GETVCPU_INFO_ one. =E2=80=A6

Can such information be relevant for the addition of the tag =E2=80=9CFixe=
s=E2=80=9D?

Regards,
Markus

