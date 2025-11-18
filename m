Return-Path: <linux-input+bounces-16181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 55361C6AE0C
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 18:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EEC2434F910
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C73A1CEA;
	Tue, 18 Nov 2025 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKudTw6m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F923A1CE7;
	Tue, 18 Nov 2025 17:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763485650; cv=none; b=DbI5qju2guk4ezQTwlvCaXAsE00OjW5XFYP6LjvjYICyqn9jksa+mRJsfetfANeG3YDPcDTOOuI9NprtuP+bMO+y+n/Ncucm05gayoXhjVp4nrh8HEL20FE0Gk1gCGnfSZ7z8Wbqv2dIW9VffVG3TgYQY8/9+b/sJOh0XFV8IJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763485650; c=relaxed/simple;
	bh=qJeaNOzYzxiMmP/Jfeuc8aAtw+I2qq8BgGOCrk1iJSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N+0itZa1yUYLfbFboXVYrLGNAai0wGMCl+j/cDbl0myj/kLQYYWrWnnx3EcV//M5Y5qWJjqZQ0dqWWR6hIVC49/KgFzzIMsxqGxv8/KcqKhhcScerERBDpHJQRC7MUBq7/Kp36v3Ug/RmobGPze1wvvXBU0Fc2RmN5hmD5AyvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKudTw6m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C41C2BCF5;
	Tue, 18 Nov 2025 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763485648;
	bh=qJeaNOzYzxiMmP/Jfeuc8aAtw+I2qq8BgGOCrk1iJSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nKudTw6mlvq0bazqDQ027kzkBhp1mhdo66KO9qGlVLgp+1tE1Ty33GrjzMH+JEiz+
	 fJoqDkIEguSNp0ViSthl9jkR+H5wZ9WzMsD2qAw1b/1vOnnZB+fVy+volg7g8bBjjp
	 38k90urfZWowrbBBulim8oLy75vJ2x9Z9/JEhR1OU9vAhvk3FbnWYqudlYGGqikFy5
	 CcU5fqNpP0Q6l3OroB8s5SvnvXGhx1LKv3VSzq6CAP+vtD8igXwQHZya82LNjL0f9Z
	 uyN4R8jp6/4uhVWa4Km7rBt4vVaedKGGHygsUEciDZGJLHy6HyEdClYpaTRyEk/0/c
	 WsH8Lj61IPcNw==
Date: Tue, 18 Nov 2025 18:07:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
cc: roderick.colenbrander@sony.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: playstation: Fix memory leak in
 dualshock4_get_calibration_data()
In-Reply-To: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
Message-ID: <o154p984-s8p8-3sq7-5s8o-1qp0o1o86s66@xreary.bet>
References: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Nov 2025, Abdun Nihaal wrote:

> The memory allocated for buf is not freed in the error paths when
> ps_get_report() fails. Free buf before jumping to transfer_failed label
> 
> Fixes: 947992c7fa9e ("HID: playstation: DS4: Fix calibration workaround for clone devices")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


