Return-Path: <linux-input+bounces-10151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B134A3AA79
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 22:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16ABB3AFC06
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D881286297;
	Tue, 18 Feb 2025 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/ZB/2Px"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BE9286294;
	Tue, 18 Feb 2025 21:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739912539; cv=none; b=tOIRIDthsNLQ9CEki5n305uCzMbp7Gut8o5iPBQEjI+yxJMWHJnPAd9KhUez6rsjII07Z8UtwKv52cp0lGmo7A6URBPtxvuZzU8l2uJjCl3w7Jm7rxkD+fOSLbWOES/z20wueAhNsEX8PZbKZtSjdlTsIDpApsSf6onavQ5vZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739912539; c=relaxed/simple;
	bh=cUmUWbsEqYr6aTi6Cjcx7Kv7PTjK5Ja/7EoaFj5ggn4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=idA8I8W26Xjhtm3eOMl9MczHSSESKtXuuUvdd/yyZx7YDtHNMJuucFT5BUp67fUyzuxh844gKoZ88QfFe1NOZ7/bTBsK9MTKVZqZhqkxgTBt5Iw1RTZoMekobUa/m2wvouNxZyu88rBJwbR/6I1PJZYPT4BzwwNTNhK1iW0FCsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/ZB/2Px; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD2EC4CEE2;
	Tue, 18 Feb 2025 21:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739912538;
	bh=cUmUWbsEqYr6aTi6Cjcx7Kv7PTjK5Ja/7EoaFj5ggn4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l/ZB/2PxV7KkoDSMAuUYfq5+9D2uD5X1oYa2MpFbsB7huPQXWhBUX0SfUT5ab7v/z
	 n5RwwLRRHBznMYSbEtbPxh82nBO1nwj/KHp9f6Qy9jlMzpChvlR4iiP3nKld7fezS2
	 ldPES6xdtaa8DCZh838OOVIMSRlOgOhpsHmahi+ASb5FTz5tmiXmwZEjti5B2Z8zLE
	 9fAegwXcahMlgud4nG1RhoWmIv1jYMCSj/HYu4FL4SaReeEMBmqyc+IneM9TnIdi8W
	 yBpgrmHxphKyDWfdRPli7n1lvCTFQ5MeiIucgT4hResmmTbf/vh/SjL3hPScXjFSXL
	 gWpsMxZXKH4YA==
Date: Tue, 18 Feb 2025 22:02:15 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    Dan Carpenter <dan.carpenter@linaro.org>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
In-Reply-To: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
Message-ID: <8r0o550p-p087-3o54-o320-24snr3386263@xreary.bet>
References: <8365C1B3-3A38-4F6E-955B-D6BBABA6B00A@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Applied all three patches to hid.git#for-6.15/apple. Thanks,

-- 
Jiri Kosina
SUSE Labs


