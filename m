Return-Path: <linux-input+bounces-5908-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59C961403
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 18:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52266B22AE0
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 16:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F56E1CBE8F;
	Tue, 27 Aug 2024 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IO80Sf3+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252241C6893;
	Tue, 27 Aug 2024 16:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776027; cv=none; b=Oy5kB78JgKqOEv+wpEh1xUIJ5MJyfKjR0DPoZdoqE5CIIYLIN8KQv4KntrbGlxXGk9V01qjxcFwP1k3cK7SKYsEvr5AN3nvkwDgA5Y0XkwlAtnUaQg6tPu5J7oJoY1sg+/WNlp7CERCQW5wvLn9CRC1WddXmGJD3klG+30Vkcas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776027; c=relaxed/simple;
	bh=Mmb8j+f/bGHrH2x0gS0kP4/gjMqkCXKfD7FRI+YVQMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kwEagWxy91JAInghFyC8qe7AZBMyXZWqgGsqN0zz0zLLSRXquxla317H3pn0GmfybUQMkydvnzahVB7Bld2gn6i4oyIsavB7ZikVZ0iPSmkdf9FaqNuJbb4hz6G0I5ELMu+cT8SFr1VeHclYsU9z09qr6XFR6pXZJn7oUyI8qG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IO80Sf3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64ECC4CA0C;
	Tue, 27 Aug 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724776026;
	bh=Mmb8j+f/bGHrH2x0gS0kP4/gjMqkCXKfD7FRI+YVQMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IO80Sf3+/49BnwO4dnZhx+p8nGXIZOmWYdfaEex7Q2Zqgw15FeLsjyMGZ4gwai93D
	 9Yf4lc2SqBhApwkONLZRMcNhhy28PwEBYG2n60W2GlyfX81tBkBh0+Ob6ZEkvwck6b
	 tNNhu4zLbDDS0EhBozlFuj25gcV/bqqkC590JTUMV7FF0//nzi6yOrSbPa3Q6G9dbb
	 cU/aFJwY5CVeurMWTJtiVFCvNmax5vsQfJBmJovfSSgRyK0jBHqP7iLbMc4YUaVxpi
	 v3GDczYNwIjazX+q8foTuHOEord3Qa71MfpXu4kfvmqK4OBMVdJDYr4EKRJNVAyKTv
	 gLAqjv43EoKWw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ivan Gorinov <ivan.gorinov@jobyaviation.com>
In-Reply-To: <20240804-hid-const-winwing-v1-1-5a6c714753b1@weissschuh.net>
References: <20240804-hid-const-winwing-v1-1-5a6c714753b1@weissschuh.net>
Subject: Re: [PATCH] HID: winwing: constify read-only structs
Message-Id: <172477602541.433742.7850725991254924550.b4-ty@kernel.org>
Date: Tue, 27 Aug 2024 18:27:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0

On Sun, 04 Aug 2024 18:29:37 +0200, Thomas Weißschuh wrote:
> These structs are never modified, so mark them as const.
> 
> 

Applied to hid/hid.git (for-6.12/constify-rdesc), thanks!

[1/1] HID: winwing: constify read-only structs
      https://git.kernel.org/hid/hid/c/c1f9eff7b270

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


