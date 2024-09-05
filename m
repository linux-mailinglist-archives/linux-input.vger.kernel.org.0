Return-Path: <linux-input+bounces-6242-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC86E96D288
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 10:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AA6F1C251CE
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 08:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454F9195381;
	Thu,  5 Sep 2024 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJnWC3Gt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D81194C6C
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725526553; cv=none; b=MviLavaqD3c1yj92d+GqYNLGcF8lGGvrLiKcXt5qxmmdUL5pdg9fOm63n3kTEnu+N/UQq8MmjjSjVu445Oe2EPOFDpbelWoq0rt7MK5zFwMbSc6SlNA/uGzrqteq1u+KVyTc5gRn4j8vBtG3oDeRgeD5AdaYf6DYu6lgllEBiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725526553; c=relaxed/simple;
	bh=wXs7gYj5h7v8oIFVCXsowwRfGBmPSzCcFCWUZn4CWxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BAIH1yv1X0CAwPza3iSJziyhCGuKQCUYr2Ti3KnUuHTgxdSx1qOgui1EzIhuAcavLxBjunVam8lxkIOlj5N8nZGTkNkYngvJ6KfmmDvjuNABITTb17K0XH5FoQGMX93gPZU6QEi65+vz45NLI9YQ9PciSW3GjtBXMk9t+veMD8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJnWC3Gt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DFFCC4CEC3;
	Thu,  5 Sep 2024 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725526552;
	bh=wXs7gYj5h7v8oIFVCXsowwRfGBmPSzCcFCWUZn4CWxs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bJnWC3GtUHxya50d1wmNNROczwyzBpKkTioV78nEQH96Jf0JP3DoAJvrJOBWsXYEH
	 KiRTCGDp1XAO0UECX/jVVO8lTqJPbF0nnrsADR9ZR6tWGV3Xkqa9IhQXWtX4TZhRy7
	 xXEhFV7ptJSZnLb40w2v71l8a3yejk2VcA1eyMIQ4EzKsaMvIyQjxQ28U/EzoaBPxD
	 DgJ5q+a/o1khy2UxOTuIdacnJKrwsO5a3pjcRlkC0LbASXdCIRY4nIeU2DowCFDpLt
	 Urh2mnvQ8pBuj9PdwLm/Ph595EpId9HrYwoGF9t0BPp7six6odzfXrVyptOV9OJ3Vq
	 W9710ZT5OaMBQ==
Date: Thu, 5 Sep 2024 10:55:50 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: bonbons@linux-vserver.org, bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: picoLCD: Use backlight power constants
In-Reply-To: <20240731131017.1149175-1-tzimmermann@suse.de>
Message-ID: <nycvar.YFH.7.76.2409051055380.31206@cbobk.fhfr.pm>
References: <20240731131017.1149175-1-tzimmermann@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Thomas Zimmermann wrote:

> Replace FB_BLANK_ constants with their counterparts from the
> backlight subsystem. The values are identical, so there's no
> change in functionality or semantics.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


