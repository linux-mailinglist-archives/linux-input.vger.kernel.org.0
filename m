Return-Path: <linux-input+bounces-848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7E1817E2A
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 00:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 598221F2219C
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 23:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E64760AD;
	Mon, 18 Dec 2023 23:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="sYfZ/Set"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0248760B7
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 23:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xn2JjKmObBjja4CyiIvSbn1Slxmh4lRgrzdTtFglrbc=; b=sYfZ/SetWihpS/KJGgyPyLN3lv
	IDPl7l5C1P+c5b8l+2AhTMvGS0wTFSt9AMkklYkfHSd3iGwCgW5KUjdwMoxMGDz2cfmGwD7ztek45
	b11ZsJhPTWzcbBNdWxui+Si95K6yKPvqhPLbfsoDUXj9OnF42T4PvoBszmFwNMHJV+0M4oBpTkgMc
	FAAydefzdiInapCbNUuXINRBN9O5gGMSVAyOiFJ8q7X55CD8YX7ALB6ZXDzN3AAqJjz6Qb6ejERmc
	LkIawXNoDB/VgKcSPRvRKURCL798msWnIPNSgymo7Xcr618PGu/8nE3rrYwV8vi+DqbVpBhFRPh9K
	O4SKWVbg==;
Received: from [177.68.247.242] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rFN3a-00FPSD-4P; Tue, 19 Dec 2023 00:29:54 +0100
Message-ID: <59290abe-c780-5287-d27a-745f4f00ab8a@igalia.com>
Date: Mon, 18 Dec 2023 20:29:47 -0300
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
To: Jiri Kosina <jkosina@suse.com>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: djogorchock@gmail.com, linux-input@vger.kernel.org,
 benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
References: <20231205211628.993129-1-gpiccoli@igalia.com>
 <87o7enxn1x.fsf@protonmail.com>
 <dcd91e66-11ce-c576-5eb7-8756a1b6f222@igalia.com>
 <nycvar.YFH.7.76.2312182325460.24250@cbobk.fhfr.pm>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <nycvar.YFH.7.76.2312182325460.24250@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/12/2023 19:27, Jiri Kosina wrote:
> On Mon, 18 Dec 2023, Guilherme G. Piccoli wrote:
> [...]
> My plan is to send this to Linus in a day or two, to have this fixed for 
> good in 6.7 final to be on the safe side.
> 
> We can always remove the potentially superfluous check (thanks Rahul for 
> spotting that) later once we get the testing results.
> 
> Thanks,
> 

Thanks Jiri and Rahul! I agree with the approach, better to have it
fixed ASAP indeed.

I understand no action is necessary from my side now.
Cheers,


Guilherme

