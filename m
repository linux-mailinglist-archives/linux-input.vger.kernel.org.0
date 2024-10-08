Return-Path: <linux-input+bounces-7133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 640B5993F73
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194721F25043
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D32E1CACDC;
	Tue,  8 Oct 2024 06:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDNIpBJE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B01C1AD4
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370300; cv=none; b=KkBIczfH5iYyW8h3ne/TqaUk7GDvwuSfAUJUxPEphrPVlRC8JcgQd3e4V1y3gQW/5B8Vw7t3FQGKejbUqW6FpnFeyHmDA8+hk98/ANHcNN8VauI/FuheggL5YU8yUHG2ae3x0AtUX6PpA9s1hnQWw5niuSoQ0v7/r0gJfdaQWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370300; c=relaxed/simple;
	bh=vKwy00HQP1nFCQDBAa+stAnsyLqcICo/pwTMw6X93/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=clULPbvdIfRTNVypiM0c9HfpP9HEBVy28H00oVOCPZhpm5GW/BDCvLADfYnsDfR9RTYVjDLA1CoJgKJsgDU9V6RBpfbqCEuZT4JOA3RdTSVtxpw8pE3B4S0tVmF7Yk27MVMaL2jHkQqOJ/z9DaheyzzXGzQYkqKLRCks9PJsQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDNIpBJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B498C4CED0;
	Tue,  8 Oct 2024 06:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370298;
	bh=vKwy00HQP1nFCQDBAa+stAnsyLqcICo/pwTMw6X93/M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GDNIpBJERrfsevvxRbyxUCWY1O75X7i3L3ljDJYx/9LqvlZ8GyXqMz6fDT5a00p09
	 0q0u97rmug0evitQuzT686BDKsY640oEtvPDd0y57RbGTjhjCwmAc4UPMEMjnIPIR6
	 GE61yoyL/dN+kcchACtSQK98hwCwgqQAi4af4vnNm396MIh+fl2AThhdcDYNrWwBiR
	 mp02MfK99h9uBUIOBcMbt3Aq1ZWHlHlnbiSiJCq0kGN2tHwKcbusAVZaJKyp8BMJj9
	 Vosyt1AxyDkLoxUYADlwylrzXubSTy4l4Ix6NFg9IFbR2MtOC5CXZU4d6GAXrmPF4v
	 GTlrT+owo+X+Q==
Date: Tue, 8 Oct 2024 08:51:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Johan Hovold <johan+linaro@kernel.org>, 
    Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid-of: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
In-Reply-To: <20240920153430.503212-10-u.kleine-koenig@baylibre.com>
Message-ID: <nycvar.YFH.7.76.2410080851280.20286@cbobk.fhfr.pm>
References: <20240920153430.503212-10-u.kleine-koenig@baylibre.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 20 Sep 2024, Uwe Kleine-K=C3=B6nig wrote:

> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>=20
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>=20
> While touching the initializer, also remove the comma after the sentinel
> entry.

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs


