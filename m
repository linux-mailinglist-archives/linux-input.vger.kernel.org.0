Return-Path: <linux-input+bounces-517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD08065A7
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 04:33:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9249CB20E7F
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 03:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D99CD27D;
	Wed,  6 Dec 2023 03:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoMSHwMC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E4A6D39;
	Wed,  6 Dec 2023 03:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C73CC433C7;
	Wed,  6 Dec 2023 03:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701833591;
	bh=XGjHfP1RwCD2lS7Q9AjCixWWz9k8RhX9oLvDMJuDlGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DoMSHwMCrCMOp191b+J9OOAmHwnb7llCLVn1fQOsDlVHVBSsIjEqZKEwARRQuXfi3
	 E2DdiIC0gsubPm0qZbvkr5jkwosxd3IuqIXksb7BcHftv2vB2e0nr6lmfWTQhs9wiL
	 +6M4GdvTCZvgnIMuLPMI539NTQ1bJqCBinvxZE8I66GgN44RiIHzZaghEgAViHulIt
	 MboKwCuF/gZgF0GVt1bQPZQA5edxkzA3MPfPQasrV9xrs746+vJzdagnmLtCy5giOf
	 cWSWBLbbMZcV+ehUuhYnulM9wJZkjEkO+9JlriBS1AqRlKLFEykPi+wh4jjdMGqcAs
	 rUYljRo40t+fg==
Date: Wed, 6 Dec 2023 11:33:08 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Even Xu <even.xu@intel.com>
Cc: jikos@kernel.org, srinivas.pandruvada@linux.intel.com,
	bleung@chromium.org, groeck@chromium.org,
	linux-input@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper
 functions for connection
Message-ID: <ZW_rdCJ7EdtmJYFz@google.com>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com>
 <1701741033-26222-5-git-send-email-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1701741033-26222-5-git-send-email-even.xu@intel.com>

On Tue, Dec 05, 2023 at 09:50:33AM +0800, Even Xu wrote:
> Use helper functions ishtp_cl_establish_connection() and
> ishtp_cl_destroy_connection() to establish and destroy connection
> respectively. These functions are used during initialization, reset and
> deinitialization flows.
> 
> No functional changes are expected.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

One minor suggestion: we usually use "platform/chrome:" instead of
"platform: chrome:" for the title prefix.

