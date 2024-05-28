Return-Path: <linux-input+bounces-3896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FBF8D1B94
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 14:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03FD81F229F6
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82C3316D31F;
	Tue, 28 May 2024 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="daucjpUN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aRa3BV7B"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001891E4A6;
	Tue, 28 May 2024 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900331; cv=none; b=VxQEKWRo+RP3MioW5F0kCn63I6dV5Y0RWFFBb686zNv4msxDEBBVIiwblPn+gied3aac7HKtOczScjeySftOvcAruOGJ6BygVucclDfOj4khEmZOWd1107KD1OGHmgkz33F/dzjjHG7PfT6rSaYJ1FEWsBbxdjy5D+JcCv/WBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900331; c=relaxed/simple;
	bh=mlFfM/FT71teXMyZDR9G2/fGGL9GOe9n6pJFAjCA0/4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LDryS7xwVbKWdRqr0yAAZ9UsxYoL0nsq0bfxxD6EA0k0Uzm33IA5ObPr1SLwH7vPPhUeJ6W4xhx5DpJeZv/aExaZiQWvPW/Znh20t2WnMG+jYZTWL6tKzX+dxK3EZqXbQDyaY8P+zzBxrUvslXo3Ew5y/0QSr8WPGDg/wKu/oIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=daucjpUN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aRa3BV7B; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id CEB7D1800132;
	Tue, 28 May 2024 08:45:28 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 28 May 2024 08:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716900328; x=1716986728; bh=LwNt6oJ9v4
	BcU7dsRVvH3T3iQ/AePVkx6Qwh7+sBIEw=; b=daucjpUNJFlMEAajakdwJPLicc
	dYRSGvN8numsrkY0uucl7raFZMRZzjeMXqt5mDUnrgbeIbm3avQ9acYNN/qKVpf+
	RHHr9ZCIDho/0O0sY3atgpFOmA1lLBv3gRKU/GZWDyAqC0dTYY5C4Mfi7uIlekg4
	CYb+COvzQpqiARuZmO/IPdG37iSHohe+Hg+B9uzyY+KKoA+2cZvM1BB6RfMIY2Vo
	n3cGoPb2cRf88+cuMMenVuetxI0oLU+0cKf2+i2qJPA2IXAYdXelrhDj5TVJBQax
	VnsnUfTg/zyHrROAl0Pahjld8A8GsOeByni+U6Sn0xtyr7c42yCy8opp9p4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716900328; x=1716986728; bh=LwNt6oJ9v4BcU7dsRVvH3T3iQ/Ae
	PVkx6Qwh7+sBIEw=; b=aRa3BV7B0ujcQfzw+NUOacd01NMP1fbeo2ePF6dOJQZC
	qEoUkBi/8wUllaXCDY4ECc5vtDCnt9QeyjToZV8KkIgQsHQT0gxM9XreUVA4gS48
	XU5N6jeypZwPz8TlaYXFhQVnaqEf2IfkhrI3Rf7hFK703hRWAzII7Tgn9OTKyzxo
	wEL8F0dFp89u1OcpiP6AWrVM7b0tUpqdhdJ4B0CJAa0d1TwK5Mw4BTXD7mmGPhqo
	THYnHgGDPmjoVwdYqdnc8H5W7O+2d0k22YOqO1ndLvXJweit8nhjt65rZNfhLf2v
	peNLCN8Qql/yQIhdoETg5cig+vkpQUG7d3/Oi3lHSg==
X-ME-Sender: <xms:59FVZmCSQ9nysHHLbogc-7VVwBr5nIB7M5Ea9I9eMEEWFIzI3VtXlA>
    <xme:59FVZgivva-2cMuos-sh8gEQ0CinvIbLesjLnw5wKx5ArkLrFOGct4xcCK1Bsnzum
    3AJg5u-T9q8BAy200I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejkedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:6NFVZpkOxYHeF5ZzrRvYSha0HHb6S5Oh23WI80Z1Ygi32ByJsdG11Q>
    <xmx:6NFVZkwZ9LOZB-dsqKM6Ac0Ckal2C_QTK5j4KIhys3iSJaB_3oPMZw>
    <xmx:6NFVZrTR_GOV9GgM_1D2tvdfXFYvSprTPi6Gv8zP_Pf5yeUR-Wnacw>
    <xmx:6NFVZvad46H-PQscy8X-NcrKe5_IREFEZmmlP1ygOaABK2WHCASTIQ>
    <xmx:6NFVZqFPOrDEMkn0uyYTuDHUVkJUkPyjbLfc3_392orgn0uWLL67Te8F>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E19C9B60092; Tue, 28 May 2024 08:45:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dd2a2483-0ad4-4563-8cc2-885a47a96e71@app.fastmail.com>
In-Reply-To: <20240528115802.3122955-2-arnd@kernel.org>
References: <20240528115802.3122955-1-arnd@kernel.org>
 <20240528115802.3122955-2-arnd@kernel.org>
Date: Tue, 28 May 2024 14:45:07 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>,
 "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
 "Jiri Kosina" <jikos@kernel.org>, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Lixu Zhang" <lixu.zhang@intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Content-Type: text/plain

On Tue, May 28, 2024, at 13:57, Arnd Bergmann wrote:

> 
>  	for (i = 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) 
> {
>  		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size, 
> &dma_addr, GFP_KERNEL);
> +		dma_bufs[i] = dma_alloc_coherent(dev->devc, fragment_size,
> +						 &dma, GFP_KERNEL);
>  		if (!dma_bufs[i])
>  			return -ENOMEM;
> 


Sorry about this one, the duplicate linen was an incorrect
rebase. I've fixed this one locally but did not resend the
series since I'm still waiting for other review comments.

    Arnd

