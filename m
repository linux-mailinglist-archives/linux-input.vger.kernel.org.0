Return-Path: <linux-input+bounces-14455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A43A5B421F3
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 15:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 668793BF664
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 13:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A5330AAC4;
	Wed,  3 Sep 2025 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fyu392cN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA19309DB1;
	Wed,  3 Sep 2025 13:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906673; cv=none; b=X4Wspk+ABqpbuad0BwqqPsAANyYnCQt+ZVnX1bcPDA1mxFn95moyQEvtVvob9rlZmD7u0L1wZk9kxqQ9W3BDCDJD2dbg//TSa1y2QK83xVPLYGNPZHh5dpxgD+ENI7PhsYdNGehc7lLa2u7EdQLMmi5UsRjPU0TqQU3UuLvua/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906673; c=relaxed/simple;
	bh=RxmNsBQgFPqXkcIgnLLyTtzgxHpW00l4HtXAViM/JxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dxL9ej+kzPfi+f9a0hZb7trpRgy4GnDhzxrXhrHQbQDJ2m27a1foIwlZ0SSS0vSlkeAcwZL/EI6n3C8bP+x89Mmisx76WAo7HLZ/HH+5OsJGtAKkmqy7N3TyQeJDOafAxG+ldvt10/vAPU1X5NJMirFptvf95F9P1ZFaNpRMlY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fyu392cN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1305BC4CEF0;
	Wed,  3 Sep 2025 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756906672;
	bh=RxmNsBQgFPqXkcIgnLLyTtzgxHpW00l4HtXAViM/JxU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fyu392cNF+L3xaqXt66fqqZvD07n2F7p4vWYcb1/VcjDtnB+v0xDcXn3OPgqYMWbm
	 gPtwV72BSLAq4UxukD1w3qywPMQz+xGHfXfSD7bqo9/9uB1NbV2EyUsEezDuSIbgna
	 2ftIP5B1lRzYudlPszVEHsI4VJtIgiTugU71iAtjAtIQrXLNuYoHq85URB7hRP0ygM
	 qtvBcifcO0WibcJsEVWLqC/H6Q86bgHxa6EQHcKV74biXKkDOtZE8rX4g9C9+mQWa8
	 G/KoqgG0sQPwDOXunB7H4Tc87Vx3WeqzAAjqoLyAejMfB9AjSZw3ksA+j1NoQ26Jex
	 H2tpl1tSLg5Fw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Alexander Kurz <akurz@blala.de>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250829201517.15374-1-akurz@blala.de>
References: <20250829201517.15374-1-akurz@blala.de>
Subject: Re: (subset) [PATCH v3 0/7] Fix, extend and support OF to mc13xxx
 pwrbutton
Message-Id: <175690666979.2772381.17932091221314267221.b4-ty@kernel.org>
Date: Wed, 03 Sep 2025 14:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 29 Aug 2025 20:15:10 +0000, Alexander Kurz wrote:
> Goal of this patch series is to make the mc13892 PWRON1 button usable,
> found e.g. on amazon kindle D01100/D01200/EY21 readers.
> A ten-year-old IRQ issue needed a fix, mc13783-pwrbutton had to be
> extended to the other to mc13xxx PMIC as well (keeping the mc13892
> PWRON3 key unsupported for simplicity) and adding OF support.
> The implementation has been tested on amazon kindle D01100 and D01200
> readers using PWRON1 of a mc13892.
> 
> [...]

Applied, thanks!

[5/7] dt-bindings: mfd: fsl,mc13xxx: convert txt to DT schema
      commit: 95ec82241a49c4dbd4f6db42d409b05a7a57920e
[6/7] dt-bindings: mfd: fsl,mc13xxx: add buttons node
      commit: 4c880450f5ffc5b1f7fc94ae66d44457fbc352fa

--
Lee Jones [李琼斯]


