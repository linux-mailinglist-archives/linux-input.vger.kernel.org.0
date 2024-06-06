Return-Path: <linux-input+bounces-4167-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 234058FE1E3
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 11:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 841771F27834
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EFC81553BA;
	Thu,  6 Jun 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHk/h4bt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017BE1553B0;
	Thu,  6 Jun 2024 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664107; cv=none; b=GNWTR30CjXEQObDn1XGNHAEmUoHrKloMaPcakuHhWReuOd6hWCrF/X98gi7bnCe9eypRPZrH23QnA5EL3Ihub4d0FaeALLQaP1qnIYKtglst1hUje0XocyalzFp3Ib+LaMKho3U6F0p7JjAJtGTUmORZIJo2Bqn3O3uNOVyLcnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664107; c=relaxed/simple;
	bh=flaEAuZ9nHRH4sGgsWaxOEBEE7aoCbt3vVi5NHd6VSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m0iUWCuCGUHn05cz4v/d9s7bDSqTd2D/63HsZH46lqtuKqXdPpS34WCT1/7qxpzb3HPHtQnMQB8rrNccM6G8AeCAETVR+4+2zI1xmJA/wlgR/1nk746rncrSfizloT1bi8DCrEkYVmauVgtMmVERii1iO9trGlzg0acrg5rzsnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHk/h4bt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8434BC4AF19;
	Thu,  6 Jun 2024 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717664106;
	bh=flaEAuZ9nHRH4sGgsWaxOEBEE7aoCbt3vVi5NHd6VSI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OHk/h4btc3AyFQjefSgrwCziLFaFsmsmFsnALA+Ey9GEA4q0xvKp3UuT3JdyIpnQJ
	 Cbl20AHZ9EFG5yYlgy4kfg77yeqrQbjzrdCjZFkxGmpDVNSaqztEGja6IBXPzrdOW4
	 m25SlDA6n8gECEZQYvYK1lmZmbGUpc4hJh5H96DYgcfoxpJik8v7c2KvWVbfv09eVF
	 FzUV7jBIYMBSSWHNo3XdVPfnGTOiA964MSvzxCcGaWUxY+3jBfcMF6Jq7cTFJonEtp
	 5PXkzG3fR/CkcuQjF1c6vJlpSozEqpZmSwNyuRKoyZ1JoExA/BSnrpTeCQMAInMc7Q
	 dRe+ZwU0xcKgA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <20240604-md-hid-misc-v1-1-4f9560796f3c@quicinc.com>
References: <20240604-md-hid-misc-v1-1-4f9560796f3c@quicinc.com>
Subject: Re: [PATCH] HID: add missing MODULE_DESCRIPTION() macros
Message-Id: <171766410527.2923458.12157886272125960133.b4-ty@kernel.org>
Date: Thu, 06 Jun 2024 10:55:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 04 Jun 2024 15:10:23 -0700, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-betopff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-chicony.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-evision.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-hammer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-stadiaff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-megaworld.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-prodikeys.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o
> 
> [...]

Applied to hid/hid.git (for-6.11/module-description), thanks!

[1/1] HID: add missing MODULE_DESCRIPTION() macros
      https://git.kernel.org/hid/hid/c/9d262f35b115

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


