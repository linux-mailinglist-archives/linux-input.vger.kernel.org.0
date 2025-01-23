Return-Path: <linux-input+bounces-9484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29CFA19E54
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 07:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37B7E165F77
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 06:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C671C2325;
	Thu, 23 Jan 2025 06:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2qtZM8nn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4E136E3B
	for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 06:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737612302; cv=none; b=ZRM3HC0iPxnvb0N5d7z5ZSTGENw03HDwG0WOcm9ha0yZn0pj2DG6ik5HYC+HoGEzMf6cew1T0k/6qfeZvTG2pcQ6ROQosCghXEOYzss+ulXEPt942TBnG5uPoxQnIF7xRDlN0QZoztUs6RTOgceIICyLGkQEksU4HgPAlLM2fnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737612302; c=relaxed/simple;
	bh=82/AHO9ERoFerE0WpMmVgcmc+oGjk/5qAIFL7e97kz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H26D6RUrq10UIzqqftHhe/uxtvcOz/F5f1/jFyIhRnDx6A5nrbeb1R1/tBO/CZ7aBS3IfUhUv5NYoOM9575Kv8G149prFh8FzU8ftzKblKjZbB7iXKZbt+cc62R4wwUuoROe7hfnOQJlWHSYAHNgePjOTTadahuL7EbkwulxEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2qtZM8nn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE2BC4CED3;
	Thu, 23 Jan 2025 06:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737612301;
	bh=82/AHO9ERoFerE0WpMmVgcmc+oGjk/5qAIFL7e97kz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2qtZM8nnhzvNeBFJmquiz/REN+DIEMHETBlkk7/8bFLzwPXMGk3gYJuom6RITkomV
	 QaDfm+G3dP9c4V5wPpTYTwwV6CAGjgC1tFSZTyO7fS5r0DZTJXCIBCTqAK1nVKwzbO
	 8YFsIlOgpI1vGhND5HSO/JBAUz+QZTeTqD66Ctx0=
Date: Thu, 23 Jan 2025 07:04:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nilton Perim Neto <niltonperimneto@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH] Input: xpad - three devices added
Message-ID: <2025012328-audience-tucking-405d@gregkh>
References: <20250122214814.102311-2-niltonperimneto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122214814.102311-2-niltonperimneto@gmail.com>

On Wed, Jan 22, 2025 at 06:47:07PM -0300, Nilton Perim Neto wrote:
> Added to the xpad driver the following controllers:
> 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE
> Also changed the VIDs to better describe them

When you say "also" that's a huge hint that this should be broken up
into multiple patches, right?  Renaming an id has nothing to do with
adding a new one.

thanks,

greg k-h

