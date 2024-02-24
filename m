Return-Path: <linux-input+bounces-2080-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2786251F
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 14:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5191C21176
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 13:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509DB3F9F0;
	Sat, 24 Feb 2024 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="J2+SbN0N"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718542074;
	Sat, 24 Feb 2024 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708780149; cv=none; b=KUMvRMBAasilY4MPoCjAUgLB12Myb3nbESwIMnREyMzRd/JUf27uiACxDwou2YRkeKl9vGiXsOULOg8fEl2bm0Gg5pcrkD/aYJJhLF+LA0g2zJlqrwYxUV5g89ONK55yQQe1CuQW0LCUxjK+aKYS1zYLJwA2jpSJzVVW6z5yzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708780149; c=relaxed/simple;
	bh=RbxrO6XcmEV6Bq5LnPGyIcSF4goeqMiVzHqJCr0Mow4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOvtGX0CnRxittXiJ/DQHucBFWvQ519urB6It/8HNOlNTMQhLoizMGiU4I6hZTxftaPIkCfmUiDDSLgrwMBSNXvtxBZJjD6mr70ZlyBaRMtIBVjm5Qj9jrOM7WSbu3w7Jh+w9xgzmJj8XfCGYeErhsUiVt6G+PnrZzldls3TYzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=J2+SbN0N; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=doR7C1bu6kcj0fpXi3m7b7Wd9pLyZn3Uh28CGyWaY0Y=;
	t=1708780139; x=1709212139; b=J2+SbN0NDDa9yNzNLFJD4WGlL2SaYlSjyZdA7lL4KXVCSW3
	1OzjznSoXHoCQYEVCBfQxmwj0rJVPF7eUo0n2L0cbRg/UmB2r++PJW0OE8estkGqb20bD72UOS2XC
	KkQU40SSkDpD20WPoBrGIvmCvgHuRMSjUff0mfpRdc28gTD3/Ry2rcSHBXX2gEwEGYx/I36iPYIvk
	Kk9xpso6mVvugz5kMZcRd24N9z6qQ1OIbtPlkIqxANR5ULNQKERZ0u0W+P8G5XkZQ84f/7+RLH7uZ
	+PhvgBhJu/C3MPXGXgtRZDiQMmENNewIoy64InJV5+TU6I79PcQFRFQPnhoVDfWQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rdrlt-0000kk-Ok; Sat, 24 Feb 2024 14:08:53 +0100
Message-ID: <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
Date: Sat, 24 Feb 2024 14:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>,
 Linux Stable Mailing List <stable@vger.kernel.org>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708780139;ad475055;
X-HE-SMSGID: 1rdrlt-0000kk-Ok

On 24.02.24 11:52, Raphaël Halimi wrote:
> Le 20/02/2024 à 19:12, Raphaël Halimi a écrit :
>> I'll let a few days pass (remember, the bug doesn't happen immediately
>> but only after a varying amount of time) and I'll report here if the
>> spurious middle-clicks happened again or not.
> 
> As promised, here's my report: using the recompiled hid-lenvo module
> without those three patches for more than three days, I didn't
> experience a single spurious middle-click, whereas the in-tree module
> triggered the bug several times a day, and I had to unplug/replug the
> keyboard (or simulate it with a software trick) to get back to a normal
> state.
> 
> So those three patches did introduce this regression after all (as I
> correctly guessed).

Mikhail, do you have any idea what might be wrong here? The three
commits Raphaël mentioned that seem to cause the issue are all yours afaics.

Raphaël: would nevertheless still be good if you could identify which of
the three causes the problem, as then the developers might consider
simply reverting it.

Ciao, Thorsten

