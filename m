Return-Path: <linux-input+bounces-13169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F61AED104
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 22:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9A318952F5
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 20:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF99123ABA0;
	Sun, 29 Jun 2025 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="PmUmfuQ/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fOX/IolZ"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370A5661;
	Sun, 29 Jun 2025 20:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229790; cv=none; b=prqFCu1kKci0c12KAi6ZhaxK9cQENtnGom4t97RuRJmxDjytwdSt1LDCU0CzVKlUxgTlXP1VCInSedNBSuuUWgfACeeVmqI1fKl0z/mhufttRYl55Ylctv7Hovl5fS3LKq0NZYNWaOwSNj13sbvLbQ0lem4cD21jFXjoo7olcAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229790; c=relaxed/simple;
	bh=T2gMqB2wurKVOCd6ShD6e8s4/x9vwFhf9ZeyVK1a5r4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JWTlWAH5Y0vjerjRj2B3qxiEHYFEhWv6ln56WvDXDfBFANCMsoklnrgKc7KwhdYbux01LCu1x8sb2v3mDA7VjQMjoF75p0lBybQxCXTFigzeTZtM/WVYyybbbokznPR0ENlCL+XlDrrkU8NF2o56a8/8ujPIEJo8nvG5oNGXXiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=PmUmfuQ/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fOX/IolZ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id BE120EC0192;
	Sun, 29 Jun 2025 16:43:07 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sun, 29 Jun 2025 16:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751229787;
	 x=1751316187; bh=BWGPBaX9iZOJRCEWLGCGTXE+Ju/KNnNYjIQVnEWkVnM=; b=
	PmUmfuQ/w/rWA0/ThuLPG+bpC6n9sCQ3pfgs8WXDvvZeYcx0849Hum9xN1NKyjxx
	0XA82cpqCqP5ZjrfAy/HdK6RjAFK9BtdakknOZiSUlCW6jc4lQH/Hz1MHTjIX+W4
	Sbgl0oI3U/9sPv0XwDGK2kklVFMptdhht2jMMAqQA5cYqAkKSrFCzULLdgrIh2LX
	Q/kMGHmiqC3lskbwoXjbiD/lr8jbvNdQsO4VV6A8rjSaiTs/9sEYKXmwHjrP/1Zv
	UT8E8jIwKdJFIAAiKeSnSG/krM9akQbJ9bW9ox3/A3At0gG67FsMdRWmGjzARjPm
	OOmjQG8ETEO85zWQuDRb3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751229787; x=
	1751316187; bh=BWGPBaX9iZOJRCEWLGCGTXE+Ju/KNnNYjIQVnEWkVnM=; b=f
	OX/IolZrJwn1quz5mnOQv5PHDNufVWXvrCmoReTvTjiya90I83gqcNAkzXftw4Nj
	sv246G0BExOZOmW+s15uRb6YHG3V9AsMHvLJPV6WojbCguhzF2Ze0RNTIaemzTbL
	wevvMYjihZgFjuH7gl83e6/I/7Xt15FXcBUBiTrYdSx4wyxsf4wm3kIaHynjLJVn
	JGz9A8R2o8fZDFjC28pbUoq1qE3jdFML8Z3fHPzere6uQH6b4HOyBof8wCIyhmpz
	RnTAdxLYj5RHLlS+IiEKi5qG79pd/x2w2Kckg8hiNjvn8b90ry4Uchkr4UGVC81V
	VyjZUcbt0ZXU+lUVKx7QQ==
X-ME-Sender: <xms:WaVhaLb-mMk-Y1ZEQRldwp3SF0taxDPDEcJfJQOpwIExKzY3irN4cQ>
    <xme:WaVhaKYTujbYDaQeB6FXCoIWplEoYMHLLNtYR5k-CNzADisNKYuBKNZ56A243oQ5C
    qKpqDkw54ZOSDkWvYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedvgeek
    hfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughmihhtrh
    ihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehvihhshhhnuhho
    tghvsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpd
    hrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhg
    oheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrlhhisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehvshgrnhhkrghrsehlvghnohhvohdrtghomhdprhgtphhtthhopeht
    ghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehilhhpohdrjhgrrhhvih
    hnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:WaVhaN_ZSYMzUux5Ji1ASSLj1jGYIHYWxTKhYGQRXJOgKOhdsiPZtQ>
    <xmx:WaVhaBqKp8A2FpFuXAcVg5M5m0jlHT6GbVcjkOfV8YBNqHQn09EGLQ>
    <xmx:WaVhaGrtpKVJgpgke10PHleITxhc9ZLgt3wVzRpR-acXfxSEFLQqeQ>
    <xmx:WaVhaHTuJP-QBEKO7niuhkgmiEI_pAN_Ndlfhj5qoHPRHGFMefRn2Q>
    <xmx:W6VhaMvG1jSNMrcEpo71wY4cCr8AaP1SJhj3hC9QlKeDIORjGaJ-4jlu>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 947592CE0071; Sun, 29 Jun 2025 16:43:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc8ff538d84ba1a5c
Date: Mon, 30 Jun 2025 05:42:45 +0900
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Vishnu Sankar" <vishnuocv@gmail.com>
Cc: pali@kernel.org, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 hansg@kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, jay_lee@pixart.com,
 zhoubinbin@loongson.cn, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <4ad6e1e1-aca8-4774-aa4a-60edccaa6d0e@app.fastmail.com>
In-Reply-To: 
 <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
 <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint Doubletap handling
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On Fri, Jun 27, 2025, at 2:14 PM, Dmitry Torokhov wrote:
> Hi Vishnu,
>
> On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
>> Newer ThinkPads have a doubletap feature that needs to be turned
>> ON/OFF via the trackpoint registers.
>> Systems released from 2023 have doubletap disabled by default and
>> need the feature enabling to be useful.
>> 
>> This patch introduces support for exposing and controlling the
>> trackpoint doubletap feature via a sysfs attribute.
>> /sys/devices/platform/thinkpad_acpi/tp_doubletap
>> This can be toggled by an "enable" or a "disable".
>> 
>> With this implemented we can remove the masking of events, and rely on
>> HW control instead, when the feature is disabled.
>> 
>> Note - Early Thinkpads (pre 2015) used the same register for hysteris
>> control, Check the FW IDs to make sure these are not affected.
>> 
>> trackpoint.h is moved to linux/input/.
>
> No, please keep everything private to trackpoint.c and do not involve
> thinkpad_acpi driver. By doing so you are introducing unwanted
> dependencies (for both module loading, driver initialization, and
> operation) and unsafe use of non-owned pointers/dangling pointers, etc.
>

Do you have recommendations on how to handle this case then?

This is a Thinkpad specific feature and hence the logic for involving thinkpad_acpi. There are Thinkpad hotkeys that will enable/disable the trackpoint doubletap feature - so there is some linkage. I'm not sure how to avoid that.

Is there a cleaner way to do this that you'd recommend we look at using? It's a feature (albeit a minor one) on the laptops that we'd like to make available to Linux users.

Mark

