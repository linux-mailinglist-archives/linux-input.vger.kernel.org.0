Return-Path: <linux-input+bounces-7530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F25419A3BA8
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:34:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9EA21F24917
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE4220110C;
	Fri, 18 Oct 2024 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qzTz/NJZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB56D201008;
	Fri, 18 Oct 2024 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247672; cv=none; b=jVi3ZCOG0GJLdsr4iRKHC6b7UlzMe0//1cpVjHelFYvin2HVD7nUt9XMsvAu+JoLJ/gjPrVpoQc+NlQhn9iBFrBrUp7lqYLny2ocU8CksC6DhZ1mbzlM51k04rwW0nNXwH0wi2semOpTo6+PbjfvZD2icAhMkIQgTB570a0zS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247672; c=relaxed/simple;
	bh=aZuidjGhMNgVYjl38Jo6fihT0fphV73FbIvxTO28I2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XeaTbieSAozeXdO6vsX6mBqntwi5WQqI6sV5aC7j7FptLwptR0HMHyKhC42AtZZPDGWbJL46uzNflueUmUNnO8dkt/KypguDJ8ar0KIMRSxlHWEheuaiOWKgNp2MVcJq0W1uH6oj3ZIkXgWau/SfWZuGAm997wsEtT78nJXr8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qzTz/NJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192C4C4CECF;
	Fri, 18 Oct 2024 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247672;
	bh=aZuidjGhMNgVYjl38Jo6fihT0fphV73FbIvxTO28I2s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qzTz/NJZnsLIGLVPwKD1LEB7mp4DWisfN9kFRdiUbyY3ZeP8wvYkh0/To4WiSNQmW
	 hEMrmNXiKy28Q2nlU+U1QSPkBZlIOLOHBrSEqab+etfIDEA6VuNUzh3Qvm+RLFmDdr
	 HHD6IC9nKpPwYU4ZUb8DSgYLtj9PAJP6SkkC0h+o0CeBOP3KlEFJ27HfIxgXs9h0nj
	 kYHQvTyV8CGEaSVstPnkDgLx+2Y+W+/2idI/FeUmsb8ILF1ATrNiVZ7bXJRPYZrkes
	 a7mxTiGRYY9IH9HR6ILquluXOvR2MMe5Nts6pCS/MojisFyUYsNa3nQTrMBUk8ELYw
	 ANJVGxYG+U/1w==
Date: Fri, 18 Oct 2024 12:34:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Kenneth Albanowski <kenalba@chromium.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Sean O'Brien <seobrien@chromium.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Add quirk for Logitech Bolt receiver w/ Casa
 touchpad
In-Reply-To: <20241004172434.854601-1-kenalba@chromium.org>
Message-ID: <nycvar.YFH.7.76.2410181234190.20286@cbobk.fhfr.pm>
References: <20241004172434.854601-1-kenalba@chromium.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Oct 2024, Kenneth Albanowski wrote:

> The Logitech Casa Touchpad does not reliably send touch release signals
> when communicating through the Logitech Bolt wireless-to-USB receiver.
> 
> Adjusting the device class to add MT_QUIRK_NOT_SEEN_MEANS_UP to make
> sure that no touches become stuck, MT_QUIRK_FORCE_MULTI_INPUT is not
> needed, but harmless.
> 
> Linux does not have information on which devices are connected to the
> Bolt receiver, so we have to enable this for the entire device.
> 
> Signed-off-by: Kenneth Albanowski <kenalba@chromium.org>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


