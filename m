Return-Path: <linux-input+bounces-7076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 152849902A0
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB07C1F21F7D
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 12:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE37615CD54;
	Fri,  4 Oct 2024 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpdB7NcN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A588615C15C;
	Fri,  4 Oct 2024 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728043515; cv=none; b=UwIQuWxQPcnyAiZYuwjOVjsrw6g8uoGKGbg9qyoJ9ty3QWHvH6/4M94g2avBcgpyGxMForvkqW0uIlSMnCkPmQ/hrm98n2a6HhKiOfku2XJigkpwbxK9dk+qJ7AhCIrFx81VdBUcOpJqoshDPeNSTPoJFw45tuFu3guF+R/9TvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728043515; c=relaxed/simple;
	bh=6oRFHKvnNGQ24oCMoi6tq54XurS/Y72vq8LcKQauZio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bYLD4aax9/oEwWmqlnff2jwcB5uMdNoYTUiwjxHM7H5jBYvHPiW/3+lOl9Mc/114r9tVWGYYzoi+Os+f9DAN74CTrZiDjqzGBhFY1zPZn7IloeFbv515tGlK0Z0ylGqiHTrrPFZJwOGRDPgDfPli6c50dktWT5lLJ9V+NhvKCHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpdB7NcN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24545C4CECE;
	Fri,  4 Oct 2024 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728043514;
	bh=6oRFHKvnNGQ24oCMoi6tq54XurS/Y72vq8LcKQauZio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tpdB7NcND1qZKh+dGmCXY0JwHJPYzh9N+NvGyuwhJ8628CoSGs9Pi6eQbajI14Ndn
	 N951rLSI4NLLkG6X+cKscDSEWRkkpkYAUdjga9vXEcmU5QUMnFHVm8Q/pUXBToHfVj
	 2om8ST5zhKnAtNreMoyqlZTo4gl/e5vL0Cg6ertPto9N+WI0vmGn8jYetKPyTTvWiX
	 r2uWJ1N0vy9cFU8zZETVJfsSpcgH/NWmWB64sZWbsuYpgCfjgGFBACzOIoEMxsioir
	 PpN0jHPpsaNvvV2aHlaRChG9hnTxJTiEekUn41bUkiMmFG3uBAWMx83REq9Yfme8df
	 k1RVM25f8Kylg==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241003144656.3786064-1-dmitry.torokhov@gmail.com>
References: <20241003144656.3786064-1-dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/2] HID: simplify snto32()
Message-Id: <172804351288.292746.16655039610911027501.b4-ty@kernel.org>
Date: Fri, 04 Oct 2024 14:05:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Thu, 03 Oct 2024 07:46:50 -0700, Dmitry Torokhov wrote:
> snto32() does exactly what sign_extend32() does, but handles
> potentially malformed data coming from the device. Keep the checks,
> but then call sign_extend32() to perform the actual conversion.
> 
> 

Applied to hid/hid.git (for-6.13/core), thanks!

[1/2] HID: simplify snto32()
      https://git.kernel.org/hid/hid/c/ae9b956cb26c
[2/2] HID: stop exporting hid_snto32()
      https://git.kernel.org/hid/hid/c/c653ffc28340

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


