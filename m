Return-Path: <linux-input+bounces-839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7398817B90
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 21:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0CA31C21D1B
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 20:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CEE7146E;
	Mon, 18 Dec 2023 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="se4WG6Gg"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF83A1A2
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FqUhZvUCJN7qn/GdwVFivCYHDy3TIGGn9Oo+yxbKSfw=; b=se4WG6GgVX8SzF51BcAa8l8beP
	/tfM1weGZVDv/egD0Ji66h2gg+IhipbVYiIN/wyDpGYbNdo5mBKC8Fqy6rqTFrJ4Zqp7d93X3m26r
	EQzHIwTWW1YuzrleuE2MY9I1IWvhTgCsBrt4Yh5SLUW+KtuS8SujoKb1IbYaopcFeyf5gwxGa0Krk
	G/g0L6sNtRxUhJvXfHSuCpTIJ5T2TZwuShg3NFYlzyiXsqXJtBWpHTj6ml9p8BHKZeGurNCtQo/G1
	hfXykpt0ROfwe3K52oQH+7apIJ9TmZn3sNu4FKJ0RjZJsLqIQ9ahLqLgxFc1N+FHX1AP3Y3xyObOI
	HxBRYhlA==;
Received: from [177.68.247.242] (helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1rFJCE-00FKY6-Lq; Mon, 18 Dec 2023 20:22:34 +0100
Message-ID: <52f54cad-0c0c-f683-f562-4c656b2bdc51@igalia.com>
Date: Mon, 18 Dec 2023 16:22:30 -0300
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
To: Jiri Kosina <jkosina@suse.com>, slouken@libsdl.org
Cc: djogorchock@gmail.com, linux-input@vger.kernel.org,
 benjamin.tissoires@redhat.com, kernel@gpiccoli.net, kernel-dev@igalia.com
References: <20231205211628.993129-1-gpiccoli@igalia.com>
 <nycvar.YFH.7.76.2312181649360.24250@cbobk.fhfr.pm>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <nycvar.YFH.7.76.2312181649360.24250@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/12/2023 12:50, Jiri Kosina wrote:
> [...]
> 
> Thanks a lot for the fix. Is it confirmed to fix the issue by either of 
> the reporters? (that's not clear to me from the github issue).
> 
> Thanks,
> 

Hi Jiri, thanks for the message!

Yes, not only in github but internally - Slouken got the same issue, and
this is fixed to him, so I'm CCing his email so we can have a Tested tag.

Cheers,


Guilherme

