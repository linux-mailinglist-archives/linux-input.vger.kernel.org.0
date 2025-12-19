Return-Path: <linux-input+bounces-16638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A6CD0014
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C83230CBEAE
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B97329E5C;
	Fri, 19 Dec 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3AWf7mM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8E5329E4F
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149563; cv=none; b=A/hFkRQOZMj+0T2EpyBLZIM3vMocULnU6ecwE/Ayzqo5qEFNwQ8EKVH5Mrju3zzgJah86cEvibpm9xSv0cKEIRlC2t9aSBZcziCauIzYlDYackR6R1/O/9LNK/BW2EsszaIhr4pf4BWwWEBbGtSS1o3DqmzguiedcLCxUzc5gT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149563; c=relaxed/simple;
	bh=PKIfBOQVQd0prb4jCkeGHNUX/oBo1o4EY4E30hAAMZA=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oVKxqqLSX1LDDxK6GcWqmQgMxPOUZBbv/WE8WVrjzDGKA88RfO/iepacrm2CoiNeTnLpJoyvWpGBKi3oICTb8bfWUgVn86Iw8yFS/aKKVc/3Hp+0c7aJe9q9K+mc7ByPDw2PdGb3xFS2tWU4tew2mLoE+UQBoQRFBpraR821SEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j3AWf7mM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8FFC113D0;
	Fri, 19 Dec 2025 13:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149563;
	bh=PKIfBOQVQd0prb4jCkeGHNUX/oBo1o4EY4E30hAAMZA=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=j3AWf7mMQ2mqLp5CzGhxuYJMteGhE4kgTw3TFMHzyeCB6AFbXthnGCW/Ssyy6WD3k
	 df2b6dA9RYYRwLH0ax3BEcZpxpFsEPs6n+gmOLTdW4mJXe/kLdVbZPj4Phyt6tDmWa
	 PXBWCcPrVpkcSlFix4On8t18rBqv0OhJUmtF26c36GtPt2p75H2Of/QGL/p5hcrINA
	 sulPpONJdKSidh13yZ4oXpz5ruEVVTKSgrMNlQmzO3abnRVrZ4cHVhWEUkO17yaO5g
	 sBWRxLFyHAYxZANQGcnrQJip8GwI/tfjx2EcU0PhV5mKzl3SS5m8l8zBRYh/1orEGJ
	 rN6MtAZtAogHQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
 jikos@kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
 Zhang Lixu <lixu.zhang@intel.com>
In-Reply-To: <20251210025328.638436-1-lixu.zhang@intel.com>
References: <20251210025328.638436-1-lixu.zhang@intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Update ishtp bus match to support
 device ID table
Message-Id: <176614956210.1654761.5937484493706592819.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:06:02 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Wed, 10 Dec 2025 10:53:28 +0800, Zhang Lixu wrote:
> The ishtp_cl_bus_match() function previously only checked the first entry
> in the driver's device ID table. Update it to iterate over the entire
> table, allowing proper matching for drivers with multiple supported
> protocol GUIDs.
> 
> 

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: intel-ish-hid: Update ishtp bus match to support device ID table
      https://git.kernel.org/hid/hid/c/daeed86b6868

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


