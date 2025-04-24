Return-Path: <linux-input+bounces-11960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27CA9A89C
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F3187B459A
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A5223643F;
	Thu, 24 Apr 2025 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmIiupNv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27242367A0;
	Thu, 24 Apr 2025 09:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487343; cv=none; b=f0qssQAqslPt66oUc4Po/Lupdn59JEi1x54H7vsPrJjN6xa3jq1j/6e7qmiSHapP/gLAfFxG7MNvLK3wyi0l6yNrHAElLUrA2p8x0LSuVqrsDJrPNpcpVxwzv1iWFZUUqIT4woXzoB0BRSVfeu9m16wdIJ/yF1NA+Yvu1PO7tvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487343; c=relaxed/simple;
	bh=9xjL8c2l+dnntWK68nNelJs15IaZqyj66+19kJOfzXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kwvfQNslR+ta6vh8JLxzaYBUiVv1lCKN/vpN5DF4psX5jd08kIJuOSBinBuKuJmvYcWyfCjPcSU2cX4Hzh6kh1465/HHxFURomumcpTvU1rJMJ8fBkJfAvPdhqEHADxeR2xHry2A5ra0UXxTa+cW529I4uozMAbyF7UpaACHC9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmIiupNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0550EC4CEE3;
	Thu, 24 Apr 2025 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487340;
	bh=9xjL8c2l+dnntWK68nNelJs15IaZqyj66+19kJOfzXs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CmIiupNvuYakOPD++8fu4R8hJ6R6er39ilZ8cSb5xtCPLTEOxWHW/sZcVjIRBW0dI
	 IozEHXWjmfs8D/R/6pdHn8K2LGG4XPuZqxdW2vkoMGz6YjYnTJ9BHKRwHg3CX2cvRZ
	 B+LuMM2/eJpWzRPxxOD2uUJJ/SB1slfvNwG/doU6j/DVULPOJuEERh6+vt3PkIy8Hf
	 PJXMdgHIkCkzgzVpPsYvrentHxEJ8l8eWEjgDHVzfg8pyyZ5IP9KY6Xvn4C/oK5sm1
	 Dq1OgpVRbopUS5b/oD+SLQurrb29FGjKHb7Iaq3h5y8FIGb38i5iRRFTVUZjdgVmek
	 Uq1JZpV1MugJw==
Date: Thu, 24 Apr 2025 11:35:37 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add quirk for another Chicony Electronics
 HP 5MP Camera
In-Reply-To: <sgvhxwvrylxdev77hb4hlfcviopljj3i64vempkxaigioyvcki@2fgjvotmp6d4>
Message-ID: <nprssrno-r06q-8611-4rr9-n5918q0829nr@xreary.bet>
References: <20250321022540.4016923-1-acelan.kao@canonical.com> <sgvhxwvrylxdev77hb4hlfcviopljj3i64vempkxaigioyvcki@2fgjvotmp6d4>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Chia-Lin Kao (AceLan) wrote:

> On Fri, Mar 21, 2025 at 10:25:40AM +0800, Chia-Lin Kao (AceLan) wrote:
> > The Chicony Electronics HP 5MP Camera (USB ID 04F2:B824) reports a HID
> > sensor interface that is not actually implemented. Attempting to access
> > this non-functional sensor via iio_info causes system hangs as runtime PM
> > tries to wake up an unresponsive sensor.
> > 
> > Add this device to the HID ignore list since the sensor interface is
> > non-functional by design and should not be exposed to userspace.
> We found another Chicony device with the same issue.
> Please apply this patch after the previous submitted one.
> Thanks.
> 
> https://lore.kernel.org/lkml/20250312063532.551938-1-acelan.kao@canonical.com/T/

Similarly to previous one, why are you adding to hid_have_special_driver[] 
instead of hid_ignore_list[]?

Thanks,

-- 
Jiri Kosina
SUSE Labs


