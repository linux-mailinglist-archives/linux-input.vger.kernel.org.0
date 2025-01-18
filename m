Return-Path: <linux-input+bounces-9369-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BC7A15CB6
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 13:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 346F83A6685
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 12:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0693118DF64;
	Sat, 18 Jan 2025 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="gcTu5LJM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XqRLoB4Q"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0380B;
	Sat, 18 Jan 2025 12:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737203249; cv=none; b=F9zumb7P1ddaYyctOZ8VeMbWd9BQ0bnRAqj16+mBBuhNzfYJ4ZqoqQgReh2vHG8qvivoZ293qZrCeeA9lKCuZTcUETijfureaL/FMPQ3B4Wa88ffhissjZKegXQx5ujmhDgHS+5QpJE5Rp7iZgStAzo7qM7EUwk9Q5XiIK/OrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737203249; c=relaxed/simple;
	bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB0MMcjFsZwMY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SR2At/9PmFialGYfqO0URO09nfWOxjoXPtuNzXAjCgCrCZFsz2+gmL6Itp9S0pRMq0y6B2THvOjzFYaW5s4BlYGN5Zp9CI/7+beW2Si7pyW3gup1nwOOy3/mckTHLVrGRrxLr12lbT9dTlcmXXTa2urRTslltjPh84IIxKWMzNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=gcTu5LJM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XqRLoB4Q; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 694C11380166;
	Sat, 18 Jan 2025 07:27:27 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203247; x=1737289647; bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB
	0MMcjFsZwMY=; b=gcTu5LJMrhbS6jd1ge4FqEWhIP1HHSAEd8wKWqZQOCJeoV+s
	Wj4T1TJl3TkLOpfGZd/kJoDckC+9V7BC2fWqJ6mrQ4EvoXgXIyteo0y4G5y2KG0h
	yt4zIXzv+HZRhZ+yZFSLtEHG13gz27kVmhb9ntM6tk1yq1H+s0VYXt09kIGjr7CN
	r9rI9+drffRBQ7KzWHr9AycdmTb6kk7txMTks1ymIXi7l5sBpj4b2ACoel74xylw
	9cOXpBXrOKtKDYlvfoqVM1/BZqcDKjkGrWWx+f0ROSJJQjNuJImDaAOf/ZoVtvVI
	J4oMWWQ88wZptRITNKId6wtbGHzRp+ed0KWJdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203247; x=
	1737289647; bh=gBiv3xO4p2Ll7DzZcX4DHD0QqzGbu3NB0MMcjFsZwMY=; b=X
	qRLoB4QdQgJA1MqU87Wyi/CZ+Mecf1DUbZFJKmlJv5rPPOgtE6rJpbVS3JixlAu6
	29Faxg3CLvfliMBAsKEELk8kwq0ES5S0xikdiMjnosvSEB3ieXHTTQKcRTig314t
	xo91dAEUfIT49LAJbtTLwATwi+qv1tJUSJ8ZVwAHQFqZx9vYvO13V/L6t2JxU6lO
	jmMfcpgoXxJlOBY2FJskaghbTqzGdmO7SuYkWS6RqAhSjIVuMagnok2yERD9Rd3y
	sSiqAzwqCUVLbrBahqvYnXUf/fmEnb9ux6vL05gZcCROJ5jAfDXDkX/YetrOYSN/
	dFaeRZMNOFAdYQmngx0kA==
X-ME-Sender: <xms:L56LZxq_witJUthDw2sjgsQVNrCPkj5Y-87wD9oizYlhZQMvAVYhUA>
    <xme:L56LZzrWipncYyby7NrFTUxKukKhm9UXncN9IZJERhcik7wfU4KZLtLKDTzJH2nbW
    hj7cZHekXxcMLGVRvo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhihuggsvghrgh
    essghithhmrghthhdrohhrghdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhv
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilh
    drtghomhdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehj
    sehjrghnnhgruhdrnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
    hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:L56LZ-Oqbd3b5qsjvppwnb1oGrKETaIu88rEpJp--KxfOdcj5NM23g>
    <xmx:L56LZ84gYXeaYx7bIYMscoR6nC1F-wTfXSMt0SHAFL-VUZAmbTECTA>
    <xmx:L56LZw7Q_zXWKS8GDjphgsi3f96b7EKRqtKdI6awnK5UclbyNel45g>
    <xmx:L56LZ0jGpkSjUfIxa0PTLvf2a6rTDV-ohbb-gtZ346iz7noMz1DB5g>
    <xmx:L56LZ_TmrZ-q_XPyu1jPX8HL520IWnq2bpTH1uFjeXJEyKQtyVVFeV8g>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 245E7BA0070; Sat, 18 Jan 2025 07:27:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:27:06 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>
Message-Id: <ba754230-7808-46e8-98be-314465fc0584@app.fastmail.com>
In-Reply-To: <20250115-z2-v4-3-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-3-d7361ab16ba0@gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, Jan 15, 2025, at 23:46, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Adds device tree entries for the touchbar digitizer
>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>

Thanks,


Sven

