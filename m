Return-Path: <linux-input+bounces-4472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF5F90F0CB
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 16:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFC61C23501
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B974E1DD;
	Wed, 19 Jun 2024 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS24psbG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80018405FB;
	Wed, 19 Jun 2024 14:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807659; cv=none; b=V3IH9twiTgCbF8wWJgoVhUzQodDiF0Lzv5j6VuqFh5yxUCQBWvJbqLuxbQ/rFnZBN+qEtr9k0M0tiw1zwnj1uV/4DQ5aMrADsWn9FIUSPaPlhFZZbWNvc53o4ZSoU4ro/qvj88Bnh7Kre9KOqxWq5Wd+1r0ZpLuHcy+kfsTa/oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807659; c=relaxed/simple;
	bh=IoLfzgnUdmutrxdzuDYa1Lplk9l6dR9g83U42jLWIf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Fn0THP64xPQgxWjcZSRBC4DEO+CNQ3eygLM1JV2JSxPHiWl/mc/6k9Hdsbz3KEcTT3Oe8pOpRmlTpWhJRvQHr7K8fDVMaij0GRIGSLJk6MWtLqPu1MxEqKCvDKDYtvPNj8lIjfn1wOlNo7hBLmDPkr8KUOWa29ozbtkFkKhDvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS24psbG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9BAAC2BBFC;
	Wed, 19 Jun 2024 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807659;
	bh=IoLfzgnUdmutrxdzuDYa1Lplk9l6dR9g83U42jLWIf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kS24psbGVo/uWJezXAR8O4bC3ttgg19aJW7FpiodelaWIKVK45YZkHR3XK4ivhh8b
	 YwzYQvxaPz/cGJS4ts2yURhrnFDFjnJsKDu5Uaojaqtyw2U4vgt7roEthVNW1/wsSA
	 e3JdqJWO8dBLShMD/ppH8TTyuZ6L97e7jGeowJFnrvT420ZGiX9Vxc884NT7XVE6XZ
	 /9r9P++4h7x4c/IdluUN6hM/DrI6s8fYSD9IYW5MtYuS22Yhl/dABuIBsx8/Cw/YU3
	 GAEZRR1qfBMe7ZJnGo82QiCMF0xtMJosV+9lHdOW8zP/mAyh1HJjO3bpKUBbpt8I/f
	 2ZIayO2EibMqg==
Date: Wed, 19 Jun 2024 16:34:15 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?ISO-8859-15?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
cc: benjamin.tissoires@redhat.com, arnd@arndb.de, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] HID: uclogic: Avoid linking common code into
 multiple modules
In-Reply-To: <20240614161935.230529-2-jose.exposito89@gmail.com>
Message-ID: <nycvar.YFH.7.76.2406191634011.24940@cbobk.fhfr.pm>
References: <20240614161935.230529-1-jose.exposito89@gmail.com> <20240614161935.230529-2-jose.exposito89@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 14 Jun 2024, Jos=C3=A9 Exp=C3=B3sito wrote:

> The hid-uclogic-params.o and hid-uclogic-rdesc.o files are linked
> into both the driver module and the unit test, which triggers a
> W=3D1 warning:
>=20
> scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-rdesc.o is =
added to multiple modules: hid-uclogic hid-uclogic-test
> scripts/Makefile.build:236: drivers/hid/Makefile: hid-uclogic-params.o is=
 added to multiple modules: hid-uclogic hid-uclogic-test
>=20
> Avoids this by moving these two files into a separate module
> that is used by the driver and the unit test.
>=20
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>

I've added Reported-by: for Arnd and applied, thanks!

--=20
Jiri Kosina
SUSE Labs


