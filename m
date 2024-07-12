Return-Path: <linux-input+bounces-4998-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E318492F631
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EF06B22BBF
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F16C14039E;
	Fri, 12 Jul 2024 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0BkDyRKm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8E13E88B;
	Fri, 12 Jul 2024 07:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769340; cv=none; b=b7n5IptXXqvw2enP72W4W2TLxnKeodSF6Pttb5QkdPqgw9qMKENwo7Cze96WVLt9DafdUQJ3XTRqlbOnzdUud2K8qTUkZD1AesXf58wlZWlGo8EieZnn1m6uLLGQcvewjoMEymMRBLsuRwbuxpmwOiCjJDiWQAiNkBseKQC3uc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769340; c=relaxed/simple;
	bh=M3/IbG2VEddo9LG0kQnmXVVKFjP6aSnnZYROUVXCI8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcbUhrcTt49+9r+/1sX6/72TEum6MjeknFR2VOZWzhw8/ILtws9AEKHmFwVY6ECYKGw1N1T7PSRM8Bsz+JLrcNAYSqquxMp+/10b/q4ZucP0o+FjRZgSvx2ALGKihHM3qatbkNyUBebpIvnmn6AgB5Wm7VoBSY/SXOxrLw63DrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0BkDyRKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11748C3277B;
	Fri, 12 Jul 2024 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720769339;
	bh=M3/IbG2VEddo9LG0kQnmXVVKFjP6aSnnZYROUVXCI8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0BkDyRKmFgsNQlyIhDvNVzC/vWwMQ/oNIOHnVWaRgg29DM/zE4o5YQpalWOZqdAIq
	 BSTxooJHKR1gso7s4cVtZtn3DAn1pXqDet7Z7yGbgsVkSPBQlVM0O/HqCvgB5M2Fgq
	 +Qc3YpTLAUFz2HO5I2ORQ/Fm+G0ylchNw3L5YhUo=
Date: Fri, 12 Jul 2024 09:28:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/8] Input: usbtouchscreen - constify usbtouch_dev_info
 table
Message-ID: <2024071252-deflate-antonym-3418@gregkh>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
 <20240712051851.3463657-5-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712051851.3463657-5-dmitry.torokhov@gmail.com>

On Thu, Jul 11, 2024 at 10:18:47PM -0700, Dmitry Torokhov wrote:
> The data in this table is shared between all instances of the
> touchscreens so it should not be modified.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

