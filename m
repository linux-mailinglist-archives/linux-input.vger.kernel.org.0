Return-Path: <linux-input+bounces-13942-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 119FDB22777
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938A31B66DDC
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB6125D1FC;
	Tue, 12 Aug 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BytUWGa4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF00725C706
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003107; cv=none; b=Aqyy+eKpMnBKSW+Qc3UUmN2pWUQHTJ5ISvyzEl3R0Zx0iV0YKDC6HXjyom6o/EITH873RIDk7C1A2LpD0aH+jiYOsfOaaxSVXjOCHYhOARpUCNLgjauaBk7WmHhxiCGoEnzBENdNQOknw3siF6bKXX0zgdHJLpzq8SAu976lDoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003107; c=relaxed/simple;
	bh=yEKiYpNNB1SDD2g7A7NVs0/qesoFkDz9XruJLF9tCok=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GMmGTWmELqiiZOi4RRU2co0kb4Mb8naIrB5V/PD+aFUK2bpiXRp6Y6tKrXef0ot7TT+sOBvKX6k9xe1rYhzmk2gOhTSq6BhlrClRfcd9Xl4QzUxsPuPgwsOk/6+w07HqTYGWi1D8XoT9rJFhVDNzrIv71gn2BUBz9QV5JuEjHfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BytUWGa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B9EC4CEF0;
	Tue, 12 Aug 2025 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003107;
	bh=yEKiYpNNB1SDD2g7A7NVs0/qesoFkDz9XruJLF9tCok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BytUWGa4O+rMDY6ZmRA7xtPTrs2HKfXjlGrq5U5il9Ldui0Svob+O7KDjoLfFJv9k
	 PS2iq2ljNnkorpKA03JE1lVwb5dX0PclKs+XAf4fwHJaV0tPljk5hkapzFjhk5QUuu
	 xPxlSK0x8geopcTcmKYOmOCuNiBpf/7tfhfHTa0BJx9PZ7iB0SFBxYoCIk4q0HUykO
	 KvfyuY50SJW2AiDgy5c17ETjTx9KTfu9L9iQB7S9sH/Igvyir1RF4XE9Z6PatVI193
	 HeKvYO7+q032TuGVeeJYjCDXZhZeXbBnEbLiTibzn1Y6O6qhcBkakT18QYYyx5r9w/
	 GQ4pf5LMA63xA==
Date: Tue, 12 Aug 2025 14:51:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: liu.xuemei1@zte.com.cn
cc: bentiss@kernel.org, linux-input@vger.kernel.org, liu.song13@zte.com.cn
Subject: Re: [PATCH] HID: uclogic: Use str_true_false() helper
In-Reply-To: <20250724103816237r5sdS6T9M3uypp0-8vi4w@zte.com.cn>
Message-ID: <10sq932r-0q35-qr18-8rr4-98p884ros545@xreary.bet>
References: <20250724103816237r5sdS6T9M3uypp0-8vi4w@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, liu.xuemei1@zte.com.cn wrote:

> From: Liu Song <liu.song13@zte.com.cn>
> 
> Remove hard-coded strings by using the str_true_false() helper function.
> 
> Signed-off-by: Liu Song <liu.song13@zte.com.cn>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


