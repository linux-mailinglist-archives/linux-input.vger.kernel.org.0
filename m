Return-Path: <linux-input+bounces-9840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC11A2C38A
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AA443AAD0F
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF9F1EEA2C;
	Fri,  7 Feb 2025 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P1S4cmTN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0034EB51
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934939; cv=none; b=haVHvQlgWjqrNCkbupNNowgmiZIEv7tIDKI7PUZnILf9xNa6xdaBwfqoCym0I/rtU21sdf7j535bFr/CEUjdU4/POBkJpOibD3snY7lFKVE5pUJzpkoFW5XCM+M4zxHhqS9GDHpONpEzQq8z9ifC8SsX8qEIc+4dVrew801ZjEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934939; c=relaxed/simple;
	bh=PnkqVd/H2+y+MHlX6WDw3HDzASNt6zwbqLHKV0WpZbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=S0Phlaw1XvJdH9KTq0XkxDqH74IHdj3pTXR57TF223L7GS0PQHpQ+A56A92+dhhcBakTAZUmAkSEzupwk3nip/8d+aiFR9tc18YDeJRyJST5Wgfk5/UqtesRr1FT6R0PEehEhoUIHLBxWxzodrnGMAvslBSImaCCeWbIRnz19yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P1S4cmTN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5058AC4CED1;
	Fri,  7 Feb 2025 13:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934938;
	bh=PnkqVd/H2+y+MHlX6WDw3HDzASNt6zwbqLHKV0WpZbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P1S4cmTN36LFFdVTRT8zjm0DyRpJgvCB9urV5WaO4oShL46akPEZPc6PAhTR7cH/f
	 QMW7T4zQHZ4wbsWG+nMh2iDTNbxP5S2h2NgThCnjtNLU4dPI0+lf0tUOJZ/NaxBpEh
	 F+TXEU0nuGT0hGvBP68O5UqlxhM8RNJs4TtSgX/4wF6eKVnvZaplR3zMDsVY+sUD6H
	 rd9h43YIKm3dOHCJMYxmj7Roz2p1Y+Qb+xaS+/jOInBEmDMNqiyZUko5ZLwImoP//k
	 2bQDeoTNafxmFV19Y3TSffa1zP9ju/FD2efUiXKtI6DMsUa46IX+uWNzCKsPbPJhky
	 m9ZBM3PZff5Xw==
Date: Fri, 7 Feb 2025 14:28:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] hid-steam: Move hidraw input (un)registering to
 work
In-Reply-To: <20250205035529.1022143-1-vi@endrift.com>
Message-ID: <324sn111-564r-9ops-73q9-81sp66po9389@xreary.bet>
References: <20250205035529.1022143-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Vicki Pfau wrote:

> Due to an interplay between locking in the input and hid transport subsystems,
> attempting to register or deregister the relevant input devices during the
> hidraw open/close events can lead to a lock ordering issue. Though this
> shouldn't cause a deadlock, this commit moves the input device manipulation to
> deferred work to sidestep the issue.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied to hid.git#for-6.14/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


