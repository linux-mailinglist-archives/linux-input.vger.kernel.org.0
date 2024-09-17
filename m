Return-Path: <linux-input+bounces-6581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B19597B427
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 20:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B73631C2116E
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2024 18:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1C7175D5D;
	Tue, 17 Sep 2024 18:38:42 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904222628C;
	Tue, 17 Sep 2024 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726598322; cv=none; b=qQeXoxVm9YR2WaKBBGXp5a744p3WPHBtFIsbV2BBY74w6x3yekCmEispKopYneiTeTGGCnl5dIK0n87Tfync5JKuJZql+U1JxPUTsntzgVQU/n1R92FK0+d781ARunhpcHJwtqeOs1dw3F/DNxmoMmFN8oQDLMr9btq6x43vp9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726598322; c=relaxed/simple;
	bh=apSLIkRwE+SizaIdoFCpl1kVIuWY+s6lrb8H30QWggo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QhYP2RIYpO1RJjcnNcfo+o3Qdw9PWeZWhjn49rbBrNy8A7pwtta27t4tIWSRy9Rqq7i44LaYahMXq8W8MSAqZAnx5gcAOMdpsraX3ENorkh0h3h2QtUduAqvK624E5hy0sBiDdiuB/MpTfdSF9qzDEUHb5wmuXH1NmDUEFV56h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 374E21BF203;
	Tue, 17 Sep 2024 18:38:37 +0000 (UTC)
Message-ID: <44a94753410c3a96e6144f2ab19876f039d80707.camel@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Remove feature_type from
 hidpp_root_get_feature()
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, "Peter F . Patel-Schneider"
 <pfpschneider@gmail.com>,  Filipe =?ISO-8859-1?Q?La=EDns?=
 <lains@riseup.net>
Date: Tue, 17 Sep 2024 20:38:36 +0200
In-Reply-To: <20240916115532.1806755-1-hadess@hadess.net>
References: <20240916115532.1806755-1-hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Mon, 2024-09-16 at 13:55 +0200, Bastien Nocera wrote:
> Nobody uses that variable after it gets assigned, so this saves us from
> having to declare it in the first place.
>=20
> Signed-off-by: Bastien Nocera <hadess@hadess.net>

I realised after sending the patch, as I was finishing up work on
enabling the Litra Beam light in user-space rather than the kernel[1],
that I didn't even compile-test this patch.

It's done now, and the patch compiles without warnings.

Enjoy Plumbers for those who celebrate.

Cheers

[1]: https://github.com/cvuchener/hidpp/pull/34

