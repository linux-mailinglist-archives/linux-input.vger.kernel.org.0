Return-Path: <linux-input+bounces-14261-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C077B323EC
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 23:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E6D47A1EFC
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 21:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C12D12D6625;
	Fri, 22 Aug 2025 21:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NT2WoL/P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q051JxfG"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BED235355;
	Fri, 22 Aug 2025 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755896931; cv=none; b=dxib1/hVXVpsPDHJCvuFnNt+TxRY3VW7ihhAxkYEyVLrJ5xg0+32YwJZ4UZTKPZVD03J/kmFULjPLImjIkVV96YhO44yibeJgWHcktPqU2N/g7+oHtjUiBzMn4QWt8XvWvuT9cB7MWO3kBR3IZfkrKhB64STMrfZlc+fsEYjcpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755896931; c=relaxed/simple;
	bh=G+wNN9LZGoJMdMYM7NRxnBMhXN40hoev/kh0xyC0MAE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DFLE/OrrZXTSD7V1n5BapVtmJXvmV7Jh/a2owDnAsLl0nk0OCtPl9t0iLnGIqCVsir9jXVhK/e08kk53vJqtfjs3gN2NdjzlQ66H3fKg97RV0jqmRUxpgxdJML7YPT/S3G/c053Cuq5mT5FOa2oKQ2vZumrBwcE7EMpcFUeGzdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NT2WoL/P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q051JxfG; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 504C114000C4;
	Fri, 22 Aug 2025 17:08:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 22 Aug 2025 17:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755896928;
	 x=1755983328; bh=qzcdv5e72TDibiCgYHH3IYqxizwzwFmcFARX2hXlQC0=; b=
	NT2WoL/Ph17g/5b+s+frOVbVNWeY5T+YLZ0GaCqLS65YWRL//tWcWfm2swuj1thQ
	TjCGckHHJnCk7lEclt9oabMsON2vih4xqp8TxVwWx855fI49J0pj0E+2t6TQa9Zy
	iA506beOY/HErOJwMUzZZCjfjJAQYdsQQO1QS9U+a811wiMrnUKSv/3auukMPA/h
	wbtTlqgbBFs/LjZQjbn7/11is7mTPN1/qm2ioeNg3pdDp/ecbuUzk6ESX+dAVSiM
	1ixkDWPKgLfYX0mY8/dQcCroW9D96WS6heLbV6Fkyladz1jDkVRUU+FxU+LxqctF
	BYvkdw7i/rvnLDFe715bOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755896928; x=
	1755983328; bh=qzcdv5e72TDibiCgYHH3IYqxizwzwFmcFARX2hXlQC0=; b=Q
	051JxfGxiVtMAGB2VBXxzm76DaVhzUHBjmXi4dCs1oWYkkckDmTZ59Uu2ucERnTe
	N9LEQ/Y4YDtysn2IYte7KkEZYn9f5vzJcjC9iFoe5gkxbj5tDNdoEU6WkRzroHRA
	Am6ePAi3VaefRMm9yCnizPI6SH+3KZQeHqBk1//MViQhFDMw9Wxpsp5XY/KV3XX7
	c7XG1ph8EE8AC0GaojAFMMjP/rEZAu2NWlDAS/ASjpPeSOnoe03uxKIThc6aDYya
	A4BSMegwpcNH4X8+gKdbXdPC2SdEnwV9WJa+lf5cBOtxt9T3QG446WyuFHrmEIMH
	oucF4heZH6N+E3MhtWPHw==
X-ME-Sender: <xms:YNyoaIEgt6IqYwYGOtaqCIJC2BOoWEsvGL2f3A0HyqtP8JSQQ7HVwg>
    <xme:YNyoaBXZDuzeSy2TrZ3iIgUUYuxZnt5c7SvU_WLB3spuIKL1OgL6QCa3jcPGDVTj5
    26EspbIoI-Z5orxeTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieegjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnth
    hishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepphgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    ht
X-ME-Proxy: <xmx:YNyoaMNQlCXPPZB9EPLhkmVr-WW_C4g4kSLkBbHzdCDRr9lH9Hvpew>
    <xmx:YNyoaKULgtx6VTR6teOWrsUJJWL_cyztVzRKjQ3NMxmwqwk3_kwdvQ>
    <xmx:YNyoaI03v4pls1GFtw-TA0N4VkKGtHQNMp1v1ZMmA3YzpHlZpp4R0w>
    <xmx:YNyoaAoxk0Zlu8OQ9X9b_g_DWFGN4g1jIa8PsH6yIE5dBVPiDX4fuA>
    <xmx:YNyoaAABDXldS6kwiDP2Ub2GmccGbKukvQk7UogKK9wjsRsL5mPRhx1x>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F234B700065; Fri, 22 Aug 2025 17:08:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARbEP23X_bYV
Date: Fri, 22 Aug 2025 23:08:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Benjamin Tissoires" <bentiss@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jiri Kosina" <jikos@kernel.org>,
 "Peter Hutterer" <peter.hutterer@who-t.net>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <e0557372-b029-4831-8d32-c1eb512ac736@app.fastmail.com>
In-Reply-To: 
 <tsvy2y4x7xaut6y7fykuc7ltdf777rt2g32zt2biagts6hgjub@iidwntp527og>
References: <20250711072847.2836962-1-arnd@kernel.org>
 <tsvy2y4x7xaut6y7fykuc7ltdf777rt2g32zt2biagts6hgjub@iidwntp527og>
Subject: Re: [PATCH] HID: tighten ioctl command parsing
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Aug 21, 2025, at 08:56, Benjamin Tissoires wrote:
> On Jul 11 2025, Arnd Bergmann wrote:
>>
>> +			break;
>> +	}
>>  
>> +	hid = dev->hid;
>> +	switch (cmd & ~IOCSIZE_MASK) {
>
> Jiri pinged me about this one, and I gave it a go with the existing
> tests I have in selftests... and turns out that this changes the logic
> of the ioctl processing.
>
> The removed block was in the default section of the switch/case
> statement. Now it's added *after*, meaning that any ioctl that was
> normally processed before are now caught in the default of the switch
> statement below and return -ENOTTY.
>
> Running tools/testing/selftests/hid/hid_bpf showed that.

Ah, of course, thanks for checking and describing the issue.

Did you already come up with a fixed patch? I'm currently
travelling and won't be able to send a v2 quickly, so if you
have a version that works for you, let's use that instead.

     Arnd

