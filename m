Return-Path: <linux-input+bounces-11157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA6EA6E6B6
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 23:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D24ED7A57CB
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 22:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB071ACEDD;
	Mon, 24 Mar 2025 22:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="z7PGrnVE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ixXGw4y9"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6365143895;
	Mon, 24 Mar 2025 22:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742855951; cv=none; b=BeR6o6Ybram++uEC+a8ox/gznsKSFsWB+04yTCLKNKU3OSyEH0SbXaSvTCON/H0Y9ek/5xbIBLcDJd5ezFIoQjaeniocUmBFD+f4H1QftzY1+B07XUOSD/tuLGL01HEwZf2QmdAWx+7e8bpMbnyTPHYsqcFERGc9dk0TGycuBRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742855951; c=relaxed/simple;
	bh=lJBid109kRQfsMlegaK4gBUucuqVt7gEt4HRo4SDFxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQdMMSstcq+Zok5rWQrA0/9lNypvdlX+ZtBha2eaGpi9ZfPNtVR0vh4bNE2wpCB6Dz7ppb1Tk8gnJGhgQRo57cfpuRg0sF6V90CZ1Gon7EZtBOofAy2rLssoLV69Ml11hZWzEzJ/SpNBkkl72ZlcANMXqtiPkAO3F9aqvZS59ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=z7PGrnVE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ixXGw4y9; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 76489114013C;
	Mon, 24 Mar 2025 18:39:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 24 Mar 2025 18:39:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1742855947;
	 x=1742942347; bh=8rn+L5VTP1glFVLWHuT2bEvNwiS4RJ6Is/2lIdA7Izg=; b=
	z7PGrnVEdvYmthTmVShqnPX6i+7Y9MbCd2TA1W0pdIyShMXKkJDfG2UDfVVqp6oh
	reEVeMHgCnHeGibPmOxUmzVX+/Q2DxqyocJoZ5NOnf2/gd36hHsmTfkn0DH7+JNg
	+8eM4+lXcfazJ268Etum/IYYD6HPGIcHcaAi7TmFsPibv//i9tN8v3VbE22kDQDr
	WpfWj1ZNEXaFVtCN6PJayaC0bXGzxTM69lJHJFNr6DszlcB8rZFOHqlPc+dDa/Jm
	Q1uuNOwTY8FGXY1EcR2cTR2iHYwDBbZdkKjKT4GACV2BiLiUoxb0N42jDzKqX5Gu
	2f/ayORSSYmhKKHNFYX/Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742855947; x=
	1742942347; bh=8rn+L5VTP1glFVLWHuT2bEvNwiS4RJ6Is/2lIdA7Izg=; b=i
	xXGw4y90TjcFUBBQMclXZxKI4XoNoW++qlqT1fbBkVZGEKA1jVVwx933s4+Yg3NC
	7VfpoB/o19lfxdw+BfrYagPHyZxPHesj9C/ywaGNOJboBGsAFBS3Ij823v/obXmw
	GAxjdjkw41ZEYQuBxu4hu8M6HfVVjj5xmhrciMWcq8++LP4Z0F+cq/lPW1UUG3rK
	Yjrqo4rGc/db31iIdvmR71JwZfWlnF3TFi4ZeKWCi/BbBLCwaLSubWRX8/0WqZNO
	Erqubmi3B0cng3AE9YreGp2AfXuKjvtnxJHTsxVck9bwpWpWPJpdVItMjgYiMtiJ
	P0Y8/+fLBg6MHJQAUzeSQ==
X-ME-Sender: <xms:Ct_hZ7JtdzF6FUsPPUkXTm6GHN0q-cIm39qfYxJVZ6ck9B9rYiu3pQ>
    <xme:Ct_hZ_K8dSAxvTtli5KkYEo5DDaRAtku5pvK_Wo9EsYGqfQ95g73CEw3AwzDj5gjr
    8E9Bratw_8fekK_h5s>
X-ME-Received: <xmr:Ct_hZzs3W5yqiY9laIYsBlfoL8Lcvq23QRTwsTWTSjJGwIEogFHl9yyO8FA7AEaxpl69ngKR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedutddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddt
    vdejnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhhonh
    gvshdruggvvheqnecuggftrfgrthhtvghrnhepgfehhfevvdekledvuddvteffhfeihfef
    leekledugfdvkeffgfevheellefgtefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhlphhordhjrghrvh
    hinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhk
    vghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovg
    guvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggvnhhtihhs
    sheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdp
    rhgtphhtthhopehlkhhmlhesrghnthhhvggrshdruggvvh
X-ME-Proxy: <xmx:Ct_hZ0byvN_YVs-xbPEH_87NA-1A-efGt_eoc67b6D46SDuB_bR_Dg>
    <xmx:Ct_hZybQ6U3JosKc3MlbgVxC4BCFFGnV_tm322o90jrj4o49qYwzMw>
    <xmx:Ct_hZ4BgfpVBxi3hLdFOQJXTPd8PzGoo-typc4ukxzKocNY_Pniyyw>
    <xmx:Ct_hZwaoH5qemoegbL4-1oAwisUqPXxlwWyyh72JpFM9ZqzrCgG9sg>
    <xmx:C9_hZ4NkAsgVmTjzG__d-1i0A1mBx1WI91ApePUPFNnlEVvhajH03jaa>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 18:39:03 -0400 (EDT)
Message-ID: <a3c39c1e-44ba-43ea-9009-966f62c25389@ljones.dev>
Date: Tue, 25 Mar 2025 11:39:01 +1300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86: asus-wmi: Refactor Ally
 suspend/resume
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 bentiss@kernel.org, jikos@kernel.org, mario.limonciello@amd.com,
 lkml@antheas.dev
References: <20250323023421.78012-1-luke@ljones.dev>
 <20250323023421.78012-3-luke@ljones.dev>
 <c1fb9727-e7f7-6871-5fc1-577d96799cc3@linux.intel.com>
Content-Language: en-US
From: "Luke D. Jones" <luke@ljones.dev>
In-Reply-To: <c1fb9727-e7f7-6871-5fc1-577d96799cc3@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/03/25 01:10, Ilpo Järvinen wrote:
> On Sun, 23 Mar 2025, Luke Jones wrote:
> 
>> From: "Luke D. Jones" <luke@ljones.dev>
>>
>> Adjust how the CSEE direct call hack is used.
>>
>> The results of months of testing combined with help from ASUS to
>> determine the actual cause of suspend issues has resulted in this
>> refactoring which immensely improves the reliability for devices which
>> do not have the following minimum MCU FW version:
>> - ROG Ally X: 313
>> - ROG Ally 1: 319
>>
>> For MCU FW versions that match the minimum or above the CSEE hack is
>> disabled and mcu_powersave set to on by default as there are no
>> negatives beyond a slightly slower device reinitialization due to the
>> MCU being powered off.
>>
>> As this is set only at module load time, it is still possible for
>> mcu_powersave sysfs attributes to change it at runtime if so desired.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> This series update lost Mario's rev-bys (given in replies to v3). Was that
> intentional??

No it wasn't. I must have messed up with git.

@ Mario would you mind adding again? There are very few changes.


