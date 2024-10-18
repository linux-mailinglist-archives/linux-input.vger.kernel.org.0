Return-Path: <linux-input+bounces-7529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A56739A3B96
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57A3D1F25251
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D856F200CA4;
	Fri, 18 Oct 2024 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEbRKYk3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094A1D79A0;
	Fri, 18 Oct 2024 10:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247571; cv=none; b=lVNVUD0Jju7ajAAjJyBOkb+B4j6sEVAVlH9JxltW/y8xq2kdoVywmp9HfqkXPT8J0mD28ikk4XtEf6RmhFm3hOIxJ3RZsHeh7Ee5C6hDSXD9Y8V7VHlJXpFKo5AWQR55y523nKDXAt6YHM+S4osqrOvYrEkqaanhjBF5z6KhLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247571; c=relaxed/simple;
	bh=A2dJY1k9/QOsLAqE7BaXE2zxGdg4O3pJw3rUOzlLzXc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Raj1ikJyefRR1uQAE8SksPYIf+HAz2mCdH5ZTf+lffZ8q6LtRSqHCq5exeQUdUU4lhjnllJDMOpKn6Hse0FhGiWt0V6sYebWctH7at6lBavSziN82GSVBjD/NlOHsMOPjOsjjWxyA3ib8XjJ2pOASqVEZhVH97p4gSHrtlDP3HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEbRKYk3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F384EC4CEC3;
	Fri, 18 Oct 2024 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247571;
	bh=A2dJY1k9/QOsLAqE7BaXE2zxGdg4O3pJw3rUOzlLzXc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qEbRKYk3QC/njW54ev4CZe+y0esmWR7UPbHNnlHoJRsj94ptqj8mzknS3JdLQ20qL
	 NR/bByYLSSbZhmGsM0VhV745+T038KU7DK8j0oaQOfe/+/HAhHeI/ns6ZWWn8sk/aL
	 FB8oy/Qqcmy6YZGCayW0AXV6AQi0z5N5NyihhBwySG6DJ6NGlhP+xt+uyxdgfbJ818
	 5e0fxgiFALVD7VLWKSJCQJSmHpHPOHj7L2y5LF57Ht2kxRpg20Z3j8uIkEsQgj7YGh
	 4jvpeCc0dwX/2GTXECOOSSpKEk/qQjoadYbaalAkPczn7aoL3/AxQtEn454TjsOC0E
	 e4j9V6i2w7VRg==
Date: Fri, 18 Oct 2024 12:32:49 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-2?Q?Bart=B3omiej_Mary=F1czak?= <marynczakbartlomiej@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: Delayed i2c resume wakeup for Goodix
 touchpads
In-Reply-To: <20241007222629.172047-1-marynczakbartlomiej@gmail.com>
Message-ID: <nycvar.YFH.7.76.2410181230300.20286@cbobk.fhfr.pm>
References: <20241007222629.172047-1-marynczakbartlomiej@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 8 Oct 2024, Bart=C5=82omiej Mary=C5=84czak wrote:

> Patch for Goodix 27c6:0d42 touchpads found in Inspiron 5515 laptops.
>=20
> After resume from suspend, one can communicate with this device just=20
> fine. We can read data from it or request a reset, but for some reason=20
> the interrupt line will not go up when new events are available. (it can=
=20
> correctly respond to a reset with an interrupt tho)
>=20
> The only way I found to wake this device up is to send anything to it=20
> after ~1.5s mark, for example a simple read request, or power mode=20
> change.
>=20
> In this patch, I simply delay the resume steps with msleep, this will=20
> cause the set_power request to happen after the ~1.5s barrier causing=20
> the device to resume its event interrupts.
>=20
> Sleep was used rather than delayed_work to make this workaround as=20
> non-invasive as possible.

Alright, that's geniunely horrible :), but I guess the device is just=20
broken, so let's just do this until / if someone is able to figure out a=20
better workaround.

Queued in hid.git#for-6.12/upstream-fixes.

Thanks,

--=20
Jiri Kosina
SUSE Labs


