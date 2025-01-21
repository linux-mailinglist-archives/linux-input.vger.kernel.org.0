Return-Path: <linux-input+bounces-9423-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC4EA185CB
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 20:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FC1E3A0882
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 19:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4631F708D;
	Tue, 21 Jan 2025 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzuEdggH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F21F7075;
	Tue, 21 Jan 2025 19:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737488708; cv=none; b=T5R6x+72ryM7FcVguL4Ujith4M9vceu9Kt8FaaaaCzrNx3KHilY/J2FUsV6ylV9OmlJhqg2kBSM9pZNA8dW0wj0kJZxisIoYUqocoXhzCRokiTO3OXYGyfPX6ES9iR3OqDvU37rtro+a1ES9+7yRpcXR7mRCP9gruZtgWANYm5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737488708; c=relaxed/simple;
	bh=5miTrdezSiKxR3Egy23eAnIMCFPfA12qdl+9J1vfPHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N4QQJfyN6kMcRd/kKh0f2tM014gjm+DCPg24CBu3F8/GxmOm6CoGPBf+Scwuh2TTkOF8mAb7sRreBOEwzGZ3iXZ2k44MONN2xnZCzWU3gnTI93AOU5tfNEHsMcHM8J2MQC0Y2KSdW7XtsWxmjLKcIcfZwDWiUQHH342yiSbz9GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzuEdggH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11028C4CEDF;
	Tue, 21 Jan 2025 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737488707;
	bh=5miTrdezSiKxR3Egy23eAnIMCFPfA12qdl+9J1vfPHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KzuEdggHp7tiJKX7XWFbQ3J/KD2ljATsXH8dLxLA1zBdgaQbdd58saOvggcN58arW
	 K7TnuptnoxSGkwA9rrqp5vmR5F0q7FCz+YTa/gfj3qA5BF/3a7j+28mMfmuYMhnGhK
	 yQxlUxWQ3sS8qEB3hep6nkh79le0lbUUpsR4ptK43ZqmcCOFmLM83fKDKNxQS/jq+F
	 MSGf7Jj2CS956JWpVOKCFwMNy0wSwH+wUegbOe5onE0sh0RTJhioQEP3d329y3BLky
	 Y3tWrNCoo9cKuUSd0+go8wtw2hEb9Nu30F6htQqiWGl5iZlVkeIgetyMDoeWUPVHo0
	 4gj4eOwepGvqw==
Date: Tue, 21 Jan 2025 20:45:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-kernel@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    linux-input@vger.kernel.org, 
    "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>, 
    YAN KANG <kangyan91@outlook.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 0/2] HID: corsair-void: Fix various memory issues
In-Reply-To: <20250121192444.31127-2-stuart.a.hayhurst@gmail.com>
Message-ID: <3q9oq173-09p5-o64r-pns9-44q308nsnr01@xreary.bet>
References: <20250121192444.31127-2-stuart.a.hayhurst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 21 Jan 2025, Stuart Hayhurst wrote:

> Fixes a use-after-free and a struct without an initialiser
> 
> Attempt 2, since apparently I messed up the command the first time

Are you sure you got this time this time though? I again got only cover 
letter and not the actual patches :)

Thanks,

-- 
Jiri Kosina
SUSE Labs


