Return-Path: <linux-input+bounces-17112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE86D2508E
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 15:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF6413024E79
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 14:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CABB308F28;
	Thu, 15 Jan 2026 14:42:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD5E2F3608;
	Thu, 15 Jan 2026 14:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488151; cv=none; b=rYmliO//YfKB6zOUqBo3b4MbSp9tMcA8jisIvvBlNa97cSQmmafJsRWEkMn6gdH1z2AsYZyGWU2c0OLbhGULmDKvp0j3qzh8bHAAs+4xkR7ii2LMSa6vp1IrKXpRD3LhXAJSyOK51BwfXqaJ7aqUUY8oxksgjZmcAgfl38d8xcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488151; c=relaxed/simple;
	bh=bXLZHVQfKaQWbc0rJCVc0wqhgWKyspn8NOZvFhMLhJ0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I3mevRgFtvph6XYu+8+fzxDqQZb3E/pjQdKvRmQ6MS8wHbaXPigv6LdH8SnLtyRFrS9hGSp7cRqkAmAJFghkpnXG5DaHFPmeN5bM0Zbd//7oJdHROxSgiP5xfmJIqoI8FRrAt8UCL57K/Xr4Yn/3NjleMQgggKZnYB/vin5M514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 349DE20083;
	Thu, 15 Jan 2026 14:42:27 +0000 (UTC)
Message-ID: <c53d33769e6fa468c625a7c3a5dd3fceba2401eb.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: fix NULL pointer dereference in
 hidpp_get_report_length()
From: Bastien Nocera <hadess@hadess.net>
To: Kery Qi <qikeyu2017@gmail.com>, jikos@kernel.org, bentiss@kernel.org
Cc: lains@riseup.net, hansg@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 15:42:26 +0100
In-Reply-To: <20260115142417.243-1-qikeyu2017@gmail.com>
References: <20260115142417.243-1-qikeyu2017@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurghsthhivghnucfpohgtvghrrgcuoehhrgguvghssheshhgruggvshhsrdhnvghtqeenucggtffrrghtthgvrhhnpeffieeuudevuddtffeiheduteelgffgfeegueefheduueejhfdtuddvkefhvdekgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfedphhgvlhhopeglkffrvheimedvrgdtudemvgefgeemvggtjeefmegtfhdvtdemsggrgeefmegrieejieemtgdvugefmeejrgehfegnpdhmrghilhhfrhhomhephhgruggvshhssehhrgguvghsshdrnhgvthdpqhhiugepfeegleffgfdvtddtkeefpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepjedprhgtphhtthhopehqihhkvgihuhdvtddujeesghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlrghinhhssehrihhsvghuphdrnhgvthdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhg



On Thu, 2026-01-15 at 22:24 +0800, Kery Qi wrote:
<snip>
> -	if (!report)
> +	if (!report || report->maxfield < 1 || !report->field[0])

A partial fix already exists in the for-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=3Dfor=
-next&id=3D1547d41f9f19d691c2c9ce4c29f746297baef9e9

You'll probably want to rebase and adapt your fix. See also this review
by GregKH for v1:
https://patchwork.kernel.org/project/linux-input/patch/20260109105912.31419=
60-2-gnoack@google.com/

Cheers

> =C2=A0		return 0;
> =C2=A0
> =C2=A0	return report->field[0]->report_count + 1;

