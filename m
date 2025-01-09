Return-Path: <linux-input+bounces-9114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DF2A077B7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 14:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD2467A1FF7
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 13:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1E5217729;
	Thu,  9 Jan 2025 13:36:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8D21883D;
	Thu,  9 Jan 2025 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736429765; cv=none; b=Mx9hQ0MweZfijjuS9Zj86foRqkl/LfnKztDcYhWh87+j+xGsIjRult74oZjTZ3OvONrVZL9v2o+3MH5MeLdGenC0BKmK+lqiv8CQt6ONgTDQEKi9kWRkl3B1KWn1Cn9Ery1Jcs6kTYlFoxr04FCsyLTc3lYoSzarVIGCnctYQJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736429765; c=relaxed/simple;
	bh=9kOaadobzHjw1nAYYdHnJqlIkzrz0Sa2Xdu5w5BMiaI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CTeyH+7rwHXoXr/+qIRwMWKnUd3K0wo4CGVcEEgw7+xoTshK8j0lcbY2UB9e5AcDERnO0zlz2NULJGKHqtd3xhG76NRt5vz3OSaHQsVutupIWdy0gzOasLMRy4IQYQLkNwWm21VawEm4Pr/TMHkGckvZA3NIj9Gq/K6SqDgZUdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DE591C000B;
	Thu,  9 Jan 2025 13:35:54 +0000 (UTC)
Message-ID: <73e15575fba6cb1093b1b8298e29e9a52ed5930f.camel@hadess.net>
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
From: Bastien Nocera <hadess@hadess.net>
To: Christian Mayer <christian@mayer-bgk.de>, Christian Mayer
 <git@mayer-bgk.de>, 	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>
Date: Thu, 09 Jan 2025 14:35:54 +0100
In-Reply-To: <baad8f90-e9cb-4c1d-bbbc-fa556c1c2e1a@mayer-bgk.de>
References: <20250101151209.100072-1-git@mayer-bgk.de>
	 <20250101151209.100072-2-git@mayer-bgk.de>
	 <1a966d05a55e7d7252f8aa03857c390e3518f76d.camel@hadess.net>
	 <baad8f90-e9cb-4c1d-bbbc-fa556c1c2e1a@mayer-bgk.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: hadess@hadess.net

On Sun, 2025-01-05 at 11:16 +0100, Christian Mayer wrote:
>=20
> > On Wed, 2025-01-01 at 15:11 +0000, Christian Mayer wrote:
<snip>
> > =C2=A0=20
> > > +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
> > > +		ret =3D hid_hw_open(hdev);
> >=20
> > Is this needed? If so, this probably needs to be added as a
> > separate
> > commit, for all headsets rather than just this one.
> Yes that's mandatory to get raw_events from the device.
> I thought about adding this to all headsets, but i was not sure if
> this=20
> breaks anything for the Arctis 1 headset.
>=20
> But i can add this for all headsets, that's fine with me.
> Would you like me to create a completely separate patch for this or=20
> should i submit this with the preparation patch which refactors=20
> steelseries_headset_fetch_battery?

Please send a patch that does it for both headsets, and I'll test it
locally.

