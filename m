Return-Path: <linux-input+bounces-15503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65335BDF4BE
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 17:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D30DC19C6AD7
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 15:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E352ECE9B;
	Wed, 15 Oct 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pHDSSWsx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C32ED855;
	Wed, 15 Oct 2025 15:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541322; cv=none; b=eyvuTomYxGB4hzu7KK1AMCTBgBiXF79ho8/ygJfBcNL1XSMrcsgincditNcXj6EfQtAT3j9zuszvYC/wXKFOHArgXgpwI1H/qD+O6S72CIeDePdxt2qgSe7R1OBhjy4XpylduvGoUYO9aYCFMp1XOqljJVXAFexQbbPXIb6lnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541322; c=relaxed/simple;
	bh=uvIEFpMvcd3XHD996ow+3VnlzCOrC9Zf1b8ytPUeo0g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ugK/+c2bjuSBUdiCC7/svm8Q/0ZDwg3jhQCcnSylocZ1OFmy/qBuHeSv4HtMmrZLX4niMLuS8+I0fFyu4P6hmBGGW9avLTyBLTkxKRiRLzyEBNcJM+ElPo4kUOhPUHGZ2w4g0kvKIPiQSrDjUnS/55+qRImktWGZmnSv1oWJPrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pHDSSWsx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEA4C4CEF8;
	Wed, 15 Oct 2025 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760541321;
	bh=uvIEFpMvcd3XHD996ow+3VnlzCOrC9Zf1b8ytPUeo0g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pHDSSWsxIQ9Wi9nvOy4/5osJ0LOENwQydWmY3/cU8QaBUjDYyTTkchBWKP8Sx8U39
	 tlaMbtevON2tbABbjM8QApZzRaL/18IEu1jQ2Zr95dRKZNq9gqJt5LrQfmm52lR7qo
	 Rhi10O0Ej8K4fs4N/LAL8hhbZ6+Kg48U94KhNhj/Ken9qBno3iJO/ZwhYOD17JsZL5
	 Son0MbS4PMfQZbQjWgyWap1iVYcxHfmpFUFtxF5pdSKyQOorPXsU59BiTAwm8LZ5gH
	 JWqcC46Cyt7W+9PjsMSoKvc44unXGuvxJCP7fWppls9zgSoaeOl9krs7vmn7wUeseg
	 +sGnSPRr4J3Ew==
Date: Wed, 15 Oct 2025 17:15:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    =?GB2312?B?wqy5+rrq?= <luguohong@xiaomi.com>, kenalba@google.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-input: only ignore 0 battery events for
 digitizers
In-Reply-To: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>
Message-ID: <p7675qor-q8qp-spr8-3o6r-pp3qp42qp4q4@xreary.bet>
References: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 14 Oct 2025, Dmitry Torokhov wrote:

> Commit 581c4484769e ("HID: input: map digitizer battery usage") added
> handling of battery events for digitizers (typically for batteries
> presented in stylii). Digitizers typically report correct battery levels
> only when stylus is actively touching the surface, and in other cases
> they may report battery level of 0. To avoid confusing consumers of the
> battery information the code was added to filer out reports with 0
> battery levels.
>=20
> However there exist other kinds of devices that may legitimately report
> 0 battery levels. Fix this by filtering out 0-level reports only for
> digitizer usages, and continue reporting them for other kinds of devices
> (Smart Batteries, etc).
>=20
> Reported-by: =E5=8D=A2=E5=9B=BD=E5=AE=8F <luguohong@xiaomi.com>
> Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>=20
> v2: rebased on top of linux-next, dropped Tested-by: tag

Applied, thanks!

--=20
Jiri Kosina
SUSE Labs


