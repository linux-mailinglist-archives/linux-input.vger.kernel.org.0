Return-Path: <linux-input+bounces-207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7CE7F502A
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 20:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB73B1C2099D
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 19:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064CA5C8F5;
	Wed, 22 Nov 2023 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D8091
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 11:04:46 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5sWi-0004Pb-I1; Wed, 22 Nov 2023 20:04:44 +0100
Message-ID: <33eede9e-6b2d-4277-9460-bf9cb970b117@leemhuis.info>
Date: Wed, 22 Nov 2023 20:04:43 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Logitech G915 TKL broken; SHA identified; Please revert
Content-Language: en-US, de-DE
To: Andre Eisenbach <int2str@gmail.com>, linux-input@vger.kernel.org
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
 Jiri Kosina <jikos@kernel.org>, =?UTF-8?Q?Filipe_La=C3=ADns?=
 <lains@riseup.net>
References: <CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm_jjVpWKgFQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm_jjVpWKgFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700679886;64009c5e;
X-HE-SMSGID: 1r5sWi-0004Pb-I1

Lo!

On 22.11.23 18:21, Andre Eisenbach wrote:
> HID developers,
> 
> Ever since this commit:
> 9d1bd9346241 HID: logitech-dj: Add support for a new lightspeed
> receiver iteration
> 
> My Logitech G915 TKL keyboard does not work anymore. There is an error
> message in the kernel log:
> logitech-hidpp-device 0003:046D:408E.0004:
> hidpp_root_get_protocol_version: received protocol error 0x08
> 

Long story short: a revert is already committed and is expected to be
send to Linus this week.

https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.7/upstream-fixes&id=5b4ffb176d7979ac66b349addf3f7de433335e00

HTH, Ciao, Thorsten

