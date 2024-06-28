Return-Path: <linux-input+bounces-4690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17391B535
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 05:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 293921F22492
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 03:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824AD1BF37;
	Fri, 28 Jun 2024 03:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsgjUevz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9D83C3C;
	Fri, 28 Jun 2024 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719543657; cv=none; b=k98ctgtfKoDtcedUmOLCdBhV9LWBSG5LDmu2E/tdbRWo+hgA3+olQMMCNUQEsjnY7BKOCDM0oCMpwcNaaSEc2/nRsngImBQaiqG1Mi0bgbu7VX8Gmd3MPsiWZVXYJ8LQEcXTR/cSCDaUKeBxwmPtRux266r8D3n0gX/COtAcnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719543657; c=relaxed/simple;
	bh=DkmVFzIEUy4/EhH4jI1kRN0AcPesnvhyjVO39S2JJTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2qTnECdHWEaxcbqfAK8nxh5ZOaYfu16jBDhM7RBxGFkOnsbRMqFxNnFkkWSfaYaK9lul0zrfMMaaCZ5qewLCw1m6tBycDQMavmFTIHcCMbN6scu6NAPeCQCDE3Ma/smaxblUV07d7w0u6WPqlxBPufvppY3YlkM4xKLeVaETik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsgjUevz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D46EC2BBFC;
	Fri, 28 Jun 2024 03:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719543656;
	bh=DkmVFzIEUy4/EhH4jI1kRN0AcPesnvhyjVO39S2JJTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RsgjUevzE3HqxEmrKCMLUPKCwxMZtYPJPqihDvl/DsEoPWvzGgJIfN3OfDBHx1zZn
	 hWh8kSYoLEE0+WYsR/B4lp+jwOiVaRN9Ndt7zB1QSRIqAgIKR3O/C7vdYT+R3xMeu5
	 0yUvy56RjFL8PGZt/LiKJ9yyRTT6ntqeW5uNt8Cop+V198aFJCiAiGqfTr2QDZUV9U
	 6IgzwAMWnlYXad1Nt+2rBkdeOlvcppSZ6lC+1EB+lMr7xw0zEPiNqHpG/I2BK/wf9Q
	 U+mn9LN9ndxN0sYaUSxpanptEd+2nSPOsnT80vLyGVECAJIwN6fg8By2EL4w67RJcb
	 tT+E4Yi2bGWNQ==
Date: Fri, 28 Jun 2024 11:00:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] cros_ec_proto: Consolidate
 ec_response_get_next_event
Message-ID: <Zn4nYT8k7EeEp_5P@tzungbi-laptop>
References: <cover.1719531519.git.dnojiri@chromium.org>
 <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc251d6935c1cfc39d7a31d3cfe735d31a0371d1.1719531519.git.dnojiri@chromium.org>

On Thu, Jun 27, 2024 at 04:53:07PM -0700, Daisuke Nojiri wrote:

Your previous patches have been applied to for-next branch:
ba098ed9829c ("platform/chrome: Add struct ec_response_get_next_event_v3")
106d67398233 ("platform/chrome: cros_ec_proto: Upgrade get_next_event to v3")

Please send incremental patches based on for-next.

> Consolidate struct ec_response_get_next_event_v*.
> 
> Let X->Y indicate kernel X sending EC_CMD_GET_NEXT_EVENT to FW Y.
> 
> Old->New:
>    Existing kernels send a smaller container (e.g.
>    ec_response_get_next_data) which may or may not fit the last few
>    bytes. The FW copies as many bytes as possible to the container. The
>    kernel processes as many leading bytes as it can understand.
> 
> New->Old:
>    New kernels send a bigger container. Existing FW copies as many bytes
>    as it wants, leaving the last few bytes empty. The kernel knows it
>    didn't receive full size data from the returned data length.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
> ---
>  drivers/platform/chrome/cros_ec_proto.c       | 16 ++++-----
>  .../linux/platform_data/cros_ec_commands.h    | 34 +------------------

NACK, we don't do it: diverging cros_ec_commands.h and EC's ec_commands.h.

