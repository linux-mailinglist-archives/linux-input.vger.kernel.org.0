Return-Path: <linux-input+bounces-15580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFBBEA5C6
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 17:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC1115A362B
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 15:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249D3330B20;
	Fri, 17 Oct 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5/4Qwsi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12FC330B04;
	Fri, 17 Oct 2025 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716307; cv=none; b=Xe82fuIcAiSvCzVZhP3rWPlyYxeffQ/9GfvCuEk4V/HUaHdhZ3bE2c2aKAPquB28BWvKR1n6fDMeks72mWJVIlnhgMsm7mTlIWnnkUF+Qhm6gj26J78Aqlo7uH6d6cr+UuzPQ8Hr6B6n+oKgnRalxf2epkXpE1byy+Trg1bSGXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716307; c=relaxed/simple;
	bh=xwlTj/KbOirFTfpnWe3iAvQ0n5HfL+UDj7DxF8SuCh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YKSm38F9X65rxdVQ/CXvOjHbPbyD0sNI4YQXBdt3nShVeEa8T30zAnu0eU2ELybVcJHM46+wt6qspBTZUjLC5Mp7UZdxyXYwvaBrZEejXBfq5tncWh94ThAEb8xxkXPMga1zIws7unEo7y2ucOFmv/bx1cNouwqVoDX9gk07yzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5/4Qwsi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A89C4CEE7;
	Fri, 17 Oct 2025 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716306;
	bh=xwlTj/KbOirFTfpnWe3iAvQ0n5HfL+UDj7DxF8SuCh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F5/4QwsiWpUMAygGdK8+UnzgeWd4X2uPv5IQeiovcFaHA7caEj3IYtwKhqdi3Aj+L
	 e7DkoT1Ei/ko4D+PGslTQ2imT8gpUe46Vj7yjZTflh/U53vCnlXP3wAG6uKV3PO0w0
	 aBoGhsWxDccO+X9tyxrgFO1fhq9Fcg0YjQvtIAxs+WWuzjdPeEKAKGnusWmfp9Zn7c
	 33xdBoy+clplj/8bfmTmdG5Qa4kKR6iYoGcL+3Jibuk6P6h/RYNerrb0aMz7SbfCmf
	 pkHbNSIRSWrW2UquduyADTtemUO8RKqUvaixBVTupimWaunYkffa/3u3QB8qQmoAWV
	 QDKFRHaFMEg0g==
Date: Fri, 17 Oct 2025 17:51:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: =?GB2312?B?wqy5+rrq?= <luguohong@xiaomi.com>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    "kenalba@google.com" <kenalba@google.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    =?GB2312?B?wO7F9A==?= <lipeng43@xiaomi.com>
Subject: =?GB2312?Q?Re=3A_=B4=F0=B8=B4=3A_=5BExternal_Mail=5DRe=3A_=5BPATC?=
 =?GB2312?Q?H_v2=5D_HID=3A_hid-input=3A_only_ignore_0_batter?=
 =?GB2312?Q?y_events_for_digitizers?=
In-Reply-To: <c717d9d1483f4436a9ba6e4266ea4e55@xiaomi.com>
Message-ID: <pp809797-55r9-0os0-0n21-6990q620q788@xreary.bet>
References: <c5b52grvciabpcgavhjqximqqq6fczowgvmckke6aflq72mzyv@gzzkyt25xygc>,<p7675qor-q8qp-spr8-3o6r-pp3qp42qp4q4@xreary.bet> <c717d9d1483f4436a9ba6e4266ea4e55@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 17 Oct 2025, =C2=AC=B9=FA=BA=EA wrote:

> Where can I find information about your commits? Is it=20
> "https://web.git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=
=3Dfor-6.17/upstream-fixes"?=20
> So far, I haven't seen any information about this commit. I'll need this=
=20
> information when I submit this code to Google's GKI. Thank you!

The queue of fixes for 6.18 is at

=09https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Dfor=
-6.18/upstream-fixes

and it's just now on its way to Linus' tree:

=09https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Dfor=
-linus

--=20
Jiri Kosina
SUSE Labs


