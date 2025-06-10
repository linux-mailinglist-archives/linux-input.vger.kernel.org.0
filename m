Return-Path: <linux-input+bounces-12788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D60DAD4340
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F3B93A4B0E
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B006264F89;
	Tue, 10 Jun 2025 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jh5VBhNM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4618426157B
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 19:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749584919; cv=none; b=CwWYtv+IC/31odHlkxLdZgU3GyYocCUTVCEsbW6Y5M8g2zQxIM4Ff4uTiBjRV0/vvtMEZbGtsc0ffQMYzHoTJ6Eiad8mekcM7wCQ3a31gIL3XOgAw2j7W8hv7SBXGhD/RuKU2GSfoE8p5rsjjQDFc3DhwKZ4BQJhP3dnoqGvvnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749584919; c=relaxed/simple;
	bh=IALbF1K1EhE5zmIdtmbqolYyNUFNEUscbtY1scojJZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gexnxxpCzJke/MMdJX69bopX4nkzZPZ0Re1Df5ppTl7JqwtzuZ3GGy+Wdm+p0ZMDSVr/EhRoXlaq1h7F0OoglUKu1YPxiU1NeFPTZgIli4S2igBP/1BfgvN0M2a6f7kJUgNmNEnEdU2SfLPPpBhXfnSwHJ8VWPqpbahNvG7k8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jh5VBhNM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A224C4CEED;
	Tue, 10 Jun 2025 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749584916;
	bh=IALbF1K1EhE5zmIdtmbqolYyNUFNEUscbtY1scojJZY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jh5VBhNMyk+h4gietavtMHQ2VPqwrnE2IRA1hjAMvTYR0+mIC/SqtKiQ95fUMRb9r
	 ftC97/YV+C4N0E+5oMSbvdDIbxp5B2rfjT8s1JoO2Rsw0K+HSIigZn8JJ3y++iMrHe
	 gRxptmIgqtqXETccy+RtAGRrfQV9sTgXkVqZ+CLhTtRIahF3Da6mx9tQhtUwE9yGpM
	 GJNzxA1NMzQjUF9zD9UsrLM8dfMvxGiCV+a0rp46/QI2TOi+C6rU0vT4ExZoug0fmY
	 KQ7H26yw5zX8nDYFTOZXAExlbyISn58U7+SgV7jh+tw3wX2Zw1DJJCPWLj21VufDry
	 vPs8iSJmVdlbA==
Date: Tue, 10 Jun 2025 21:48:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
cc: mario.limonciello@amd.com, bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Lower message 'No inputs registered, leaving' to
 debug
In-Reply-To: <20250523161015.3881816-1-superm1@kernel.org>
Message-ID: <9898465n-r196-9rqp-10p6-53519pn735r9@xreary.bet>
References: <20250523161015.3881816-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 May 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> Plugging in a "Blue snowball" microphone always shows the
> error 'No inputs registered, leaving', but the device functions as
> intended.
> 
> When a HID device is started using the function hid_hw_start() and
> the argument HID_CONNECT_DEFAULT it will try all various hid connect
> requests. Not all devices will create an input device and so the
> message is needlessly noisy.  Decrease it to debug instead.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Indeed, that's way too verbose.

Applied to hid.git#for-6.16/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


