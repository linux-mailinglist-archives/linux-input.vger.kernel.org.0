Return-Path: <linux-input+bounces-14305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D750FB351F4
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 04:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B33BA1685EF
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 02:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E11729D287;
	Tue, 26 Aug 2025 02:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="vce6q9hC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YUNdhF4s"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC426AABE;
	Tue, 26 Aug 2025 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756177057; cv=none; b=XN9+/lBMi1D7a5oO/H57tH24uzcBStjxHBmoOSn5wJGuBZvF+utvY45VFkB39pUU7cFsHt6ktZZ6Dte7nx/NbtQbK3purJZkhetcoCsPa5f7kPj6oKH0tq4n9Xmq7/D5YuubknBY3bWqGjamg3X5lG/gvBUD8Ms78r9YclfnGaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756177057; c=relaxed/simple;
	bh=X/QhuRVzj3TUd3vJgrVHdecmYHTN2a+P1lvdxkaLF2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTjABDhLoPJ02So0xeWKzd4DnBFEU7adj8kFyqgVxIagqPJAgiTiDCTGNPF9CnNM0XfA8ItLFQMWr6qsP3QQPJDTRH1+S3rFkKNrQQ+SrgEgMVFSFphHH+4S61bdjTYAsZBmwFbM8r2VB1Yfvwm82z/AkPhmPdivhP6w1l2ayiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=vce6q9hC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YUNdhF4s; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 2FF23EC04B3;
	Mon, 25 Aug 2025 22:57:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 25 Aug 2025 22:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1756177053; x=1756263453; bh=v81cD//zJu
	pnSCCP8CrsDh+XoDhDzQdGX6qL1l7ka8E=; b=vce6q9hCaD+FFCEz+grQtJj2uA
	U7ibPmRyv7ToBHGc5UlEg/m5U80S9oNONE2XrIph0bNl5jCYSPUEcElCfme78ugd
	ENFcE1rOKTIVGPUTBiX/botoup/xuHouLJ45J1ZkwnDbqMJz4EUh3vx0bmLn5Kga
	VYjXx01f87O2d444eau6aS4La4CAxihSE4gdlPQf9CsNFB6iEJt9wotWfKbUtkgd
	WI/xeM/UMrP3/4wNFwsd94o6tSddstWExA+u5f30zDQfgUZRatmoq+XDscwAJ5dK
	MgAkRlzb4elmTMfM16/fZkmI4unAaQjtegAG471YH3CzmxbMYXRcBSzizfSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1756177053; x=1756263453; bh=v81cD//zJupnSCCP8CrsDh+XoDhDzQdGX6q
	L1l7ka8E=; b=YUNdhF4sYWKrZV4VmAzmZK8+T0d1D4Ux+rAms9vHiobmIkSZiYs
	O4q53FQx0kVQ5wFfjlVup+rsb+2kXeyLKyVkNt3cpnqSxKFKTZoIg7tS7ETYv/UJ
	BFYyM4K9E7pwp+/9vgw+TlWJkADYKO9fg4UaT/BPjvbHQKLzeG/lnetcSmKdDtaO
	ekmn8UdP+GeT+HCxbJ3TJqgXDm/jgMmEIfYuB1yT89Xh29Z9JumvPvBdiWL/ZXdj
	+pnl7Hu+Q0iuYMJzWVmmMIC3n1xA/j2KnaNdDGO3L6qvrqSilmkbDWWes+z5R6B9
	xBrKB1/bR+P6iYgh6zirNKu4Zj7DzFe+B5w==
X-ME-Sender: <xms:nCKtaKtJYaPSdzI6Hitz-9miuQODM0nRsRBMA73JvgFNXEsem71rGw>
    <xme:nCKtaI41gdkO3-pJqnkbc3WakFWWvtClx8w59RF0A5W-eWSF7FAd9iz9xs7e26JNr
    YVd489hCF0_Rq9vjR0>
X-ME-Received: <xmr:nCKtaFWvn4MpvkVCXmsy3Mule9gQJ2AD4UhxB0LWsuq3jd3q8A7cbUGYMzNeowPekekBaS9-Q6zdbF-Fco0jdI1ihfBuYVhM-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddujeegudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgvrhcu
    jfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvghtqe
    enucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudffhfevheejffevgfeigfekhfdu
    ieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvthdpnhgspghr
    tghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhtihhssh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:nSKtaK8Yy2KyN-500tHjNCpYzzVhPXw_Hj4EbMPdWdAmTXj3HNVK3A>
    <xmx:nSKtaBmjJyeTtSx47l40M0neb0r9wDXqfikeAgF90n1ushLOGFwZTg>
    <xmx:nSKtaIV6h_Tu3qwytv5-oonBb7S2QReyd0SVOh_L8T3EKCfjmU4REg>
    <xmx:nSKtaOHS_6P7bicLJNfLEabkFg1tdSY-xt_04t12q7DGxli67ozs5Q>
    <xmx:nSKtaLRb4TbSbAROuHUrdkMKvjzO_YyhQM2uHfRIXhspLOROe0Ku505n>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Aug 2025 22:57:31 -0400 (EDT)
Date: Tue, 26 Aug 2025 12:54:51 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: bpf: allow bpf to rebind a driver to
 hid-mutltiouch
Message-ID: <20250826025451.GA1765489@quokka>
References: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>

On Thu, Aug 21, 2025 at 04:38:12PM +0200, Benjamin Tissoires wrote:
> This happened while Peter was trying to fix a Viewsonic device: the HID
> device sending multiotuch data through a proprietary collection was
> handled by hid-generic, and we don't have any way of attaching it to
> hid-multitouch because the pre-scanning wasn't able to see the Contact
> ID HID usage.
> 
> After a little of back and forth, it turns out that the best solution is
> to re-scan the device when a report descriptor is changed from the BPF
> point of view.
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>

Thanks, this series looks good to me.

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

Cheers,
  Peter

> ---
> Benjamin Tissoires (2):
>       HID: core: factor out hid_set_group()
>       HID: bpf: rescan the device for the group after a load/unload
> 
>  drivers/hid/hid-core.c | 44 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 8 deletions(-)
> ---
> base-commit: f55f91622e6f10884d30049f6748588b3718eecd
> change-id: 20250821-bpf-rescan-d4764865c67f
> 
> Best regards,
> -- 
> Benjamin Tissoires <bentiss@kernel.org>
> 

