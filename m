Return-Path: <linux-input+bounces-14649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C74DB550A6
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BCE216D6BA
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD5930F800;
	Fri, 12 Sep 2025 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Og+u5iAK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123B30E0D1;
	Fri, 12 Sep 2025 14:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686412; cv=none; b=B0mi35RR3Hl73YowhrRi0vM217RYJUyG8XT99+u95jYMYzD8M/zscCZg5TFryltDsOvyE26zjT//X3Qec6rneKg+fk1HBXPdaO6jBQZH5DpZku5Wq0+YlqAtIeHyqcNNEj0CKI3ptHeKBfyyphPia7A9JOYNnf0foQrjJ2UcGgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686412; c=relaxed/simple;
	bh=5DRmxrG5CnGoCFBaLEnq6USiHWbZJpqpcHIyetK6mH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=At+XJMRWWXeCPYfHYNdcnREb2j0+08oE+Qxi6UCEg20PecSWWzEpsGS7ou5pU+yOvTx3Jv0TkDjreouQkBqvVWiArUWeqrENNRcSHXfWiMDRzMUyIBe0HHIuPS/ZmbAbJlY0NvNaWXPbwNFOyhbww7hnFIrrrAZLnjp1tnxFLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Og+u5iAK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9515C4CEF1;
	Fri, 12 Sep 2025 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757686412;
	bh=5DRmxrG5CnGoCFBaLEnq6USiHWbZJpqpcHIyetK6mH8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Og+u5iAKIUtTW+V9jhazq/fNMwjQIqyyHMzG5OsnjxPxg+wLkWy45vH729E9JfL20
	 l0UYQBLofwt0pKpQOXrVBYco6WakgsREY4vWaz8xr2l4/WJqiH3gBN8PSTSsfTt+pK
	 F81Hd0MVwS4qsDRprGStPvKBscJ0W0xKXM75ly2vEUewvB7JvxdSaRwJ/SsnrSplU7
	 tm8qs98NDQEkPuZpT9L0Hyu0wk51eI0aSUthGSEgBEppe5vTVIx7+yLU77/eePEkvD
	 ifY4wI7t41pSCpwnQZBw6E7qmp0bSXIhRGuA7Z5hIYH2NQASadtXT9ogKJQRZP3lqt
	 HeJOUceWjy/iw==
Date: Fri, 12 Sep 2025 16:13:29 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Xinpeng Sun <xinpeng.sun@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] hid: intel-thc-hid: intel-quicki2c: Add WCL Device
 IDs
In-Reply-To: <20250828021000.3299377-1-xinpeng.sun@intel.com>
Message-ID: <n2nq94q6-s066-56o5-s4ro-3s60r453oq19@xreary.bet>
References: <20250828021000.3299377-1-xinpeng.sun@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Both patches now applied to hid.git#for-6.17/upstream-fixes, thanks.

(next time, please follow the HID subsystem shortlog convention with 
capitalized 'HID:' prefix, thanks).

-- 
Jiri Kosina
SUSE Labs


