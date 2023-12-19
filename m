Return-Path: <linux-input+bounces-850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A889E817E5E
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 01:04:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57CF4285A69
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 00:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92E523B7;
	Tue, 19 Dec 2023 00:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="YDZAyYu3"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFE3323C
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 00:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5FoCXDH0FpToHf4FeESO+/z/trCYFCtT+f9nDGr5UdQ=; b=YDZAyYu3FvJBQoKP+Jo4ugUSDn
	vJofi29Vv4KJCe3f1v94BBDdcZEPHYVC9Wy+2+cDkU72qzKW7cW6iumjoVj33JK2GW6bLXOJwRwx/
	tmE0LaFbMTBFJQE3Ke228I2vCtH3txxlSrpc95VGJBuCUGcVvRauO8fjTIvMvglNiXZETHdQBLvRd
	xQZY+7jZ8kOcoIcmqgf5f5P/Qwl4PFTex91EZjIhA1J+kwGZJZrd8a88takNti/35y85N/YzHhJpU
	5/mL6ddXHEjWZqEQKZrMRScGACCTAPz/u9OQdZUAggNDC6Zzk2qJFPmk5SQJ5QAZOYp3BEeUAUOlv
	9NnsFXsg==;
Received: from [177.68.247.242] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rFNaT-00FPvd-Ks; Tue, 19 Dec 2023 01:03:53 +0100
Message-ID: <219661bc-6411-ec6e-86f8-82d62451fdea@igalia.com>
Date: Mon, 18 Dec 2023 21:03:48 -0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] HID: nintendo: Prevent divide-by-zero on code
Content-Language: en-US
To: Jiri Kosina <jkosina@suse.com>
Cc: Rahul Rameshbabu <sergeantsagara@protonmail.com>, djogorchock@gmail.com,
 linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
 kernel@gpiccoli.net, kernel-dev@igalia.com
References: <20231205211628.993129-1-gpiccoli@igalia.com>
 <87o7enxn1x.fsf@protonmail.com>
 <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
 <nycvar.YFH.7.76.2312182325460.24250@cbobk.fhfr.pm>
 <59290abe-c780-5287-d27a-745f4f00ab8a@igalia.com>
 <nycvar.YFH.7.76.2312190048380.24250@cbobk.fhfr.pm>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <nycvar.YFH.7.76.2312190048380.24250@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2023 20:49, Jiri Kosina wrote:
> [...]
> 
> Not immediately, but if you are able to eventually remove that 
> likely-superfluous hunk with a Tested-by: tag, I'll happily merge that 
> patch.
> 
> Thanks,
> 

Of course, I'll do that and mention that it was a suggestion from Rahul!
Thanks,


Guilherme

